<?php

namespace App\Http\Controllers\Api;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Models\Deposit;
use App\Models\GatewayCurrency;
use App\Models\SendMoney;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PaymentController extends Controller
{
    public function methods()
    {
        $gatewayCurrency = GatewayCurrency::whereHas('method', function ($gate) {
            $gate->where('status', Status::ENABLE);
        })->with('method')->orderby('method_code')->get();
        $notify[] = 'Payment Methods';
        return response()->json([
            'remark' => 'deposit_methods',
            'message' => ['success' => $notify],
            'data' => [
                'methods' => $gatewayCurrency
            ],
        ]);
    }

  

    public function depositInsert(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'amount' => 'required|numeric|gt:0',
            'gateway' => 'required',
            'currency' => 'required',
            'trx'=>'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'remark' => 'validation_error',
                'status' => 'error',
                'message' => ['error' => $validator->errors()->all()],
            ]);
        }

        $gate = GatewayCurrency::whereHas('method', function ($gate) {
            $gate->where('status', Status::ENABLE);
        })->where('method_code', $request->input('gateway'))->where('currency', $request->input('currency'))->first();

        if (!$gate) {
            $notify[] = 'Invalid gateway';
            return response()->json([
                'remark' => 'validation_error',
                'status' => 'error',
                'message' => ['error' => $notify],
            ]);
        }
        $data = new Deposit();
      

        if (auth()->user()) {
            $sendMoney = SendMoney::where('trx', $request->trx)->with('deposit', 'sendingCountry:id,rate')->first();

            if (!$sendMoney) {
                $notify[] = 'Payment Not Found';
                return response()->json([
                    'remark' => 'send_mpney',
                    'status' => 'error',
                    'message' => ['error' => $notify],
                ]);
            }

            $rate = $sendMoney->sendingCountry->rate;

            if ($sendMoney->deposit) {
                $data = $sendMoney->deposit;
            }


            if ($sendMoney->payment_status != Status::PAYMENT_INITIATE && $sendMoney->payment_status != Status::PAYMENT_REJECT) {
                $notify[] = 'Send-money is already completed';
                return response()->json([
                    'remark' => 'send_money_error',
                    'status' => 'error',
                    'message' => ['error' => $notify],
                ]);
            }

            $data->user_id = auth()->user()->id;
            $amount = $sendMoney->base_currency_amount + $sendMoney->base_currency_charge;
            $data->trx = $request->trx;
            $data->send_money_id = $sendMoney->id;
        }

        if ($gate->min_amount > $request->amount || $gate->max_amount < $request->amount) {
            $notify[] =  'Please follow deposit limit';
            return response()->json([
                'remark' => 'validation_error',
                'status' => 'error',
                'message' => ['error' => $notify],
            ]);
        }

        $charge = $gate->fixed_charge + ($amount * $gate->percent_charge / 100);
        $payable = $amount + $charge;
        $final_amo = $payable * $rate;

        $data->method_code = $gate->method_code;
        $data->method_currency = strtoupper($gate->currency);
        $data->amount = $amount;
        $data->charge = $charge;
        $data->rate = $rate;
        $data->final_amo = $final_amo;
        $data->btc_amo = 0;
        $data->btc_wallet = "";
        $data->payment_try = 0;
        $data->status = 0;
        $data->save();
 
        session()->put('Track', $data->trx);

        $notify[] =  'Deposit inserted';
        return response()->json([
            'remark' => 'deposit_inserted',
            'status' => 'success',
            'message' => ['success' => $notify],
            'data' => [
                'deposit' => $data,
                'redirect_url' => route('deposit.app.confirm', encrypt($data->id))
            ]
        ]);
    }
}
