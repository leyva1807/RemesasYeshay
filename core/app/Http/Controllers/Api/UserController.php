<?php

namespace App\Http\Controllers\Api;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Lib\FormProcessor;
use App\Lib\GoogleAuthenticator;
use App\Models\Country;
use App\Models\DeliveryMethod;
use App\Models\DeviceToken;
use App\Models\Form;
use App\Models\Frontend;
use App\Models\GeneralSetting;
use App\Models\Language;
use App\Models\SendMoney;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{


    public function dashboard()
    {
        $user                           = auth()->user();
        $widget['balance']              = $user->balance;
        $sendMoney                      = SendMoney::filterUser()->with('recipientCountry');

        $transfers    = (clone $sendMoney)->with('deposit.gateway', 'recipientCountry', 'countryDeliveryMethod.deliveryMethod')->latest()->with('deposit')->take(5)->get();
        $widget['send_money_amount']    = (clone $sendMoney)->completed()->sum('base_currency_amount');
        $widget['send_money_pending']   = (clone $sendMoney)->pending()->sum('base_currency_amount');
        $widget['send_money_initiated'] = (clone $sendMoney)->initiated()->sum('base_currency_amount');
        $widget['payment_pending']      = (clone $sendMoney)->paymentPending()->sum('base_currency_amount');
        $widget['payment_rejected']     = (clone $sendMoney)->paymentRejected()->sum('base_currency_amount');

        return response()->json([
            'remark' => 'dashboard',
            'status' => 'success',
            'data' => [
                'user' => $user,
                'transfers' => $transfers,
                'widget' => $widget,
            ]

        ]);
    }

    public function language()
    {

        $languages = Language::all();

        return response()->json([
            'remark' => 'language',
            'status' => 'success',
            'data' => [
                'languages' => $languages,
            ],

        ]);
    }


    public function policyPages($id)
    {
        $policy = Frontend::where('id', $id)->where('data_keys', 'policy_pages.element')->firstOrFail();
        $screenTitle = $policy->data_values->title;
        return response()->json([
            'remark' => 'policy',
            'status' => 'success',
            'data' => [
                'screen_title' => $screenTitle,
                'policy' => $policy
            ]
        ]);
    }


    public function changeLanguage($lang = null)
    {
        $language = Language::where('code', $lang)->first();
        if (!$language) $lang = 'en';
        session()->put('lang', $lang);
        $notify = 'Language changed successfully';

        return response()->json([
            'remark' => 'language',
            'status' => 'success',
            'message' => ['success' => $notify],
            'data' => [
                'language' => $language,
            ],
        ]);
    }

    public function translate($code)
    {
        $language = Language::where('code', $code)->first();
        if (!$language) {
            $code = 'en';
        }
        $languageData = json_decode(file_get_contents(resource_path('lang/' . $code . '.json')));
        $languages    = Language::get();
        $notify[]     = 'Language Data';
        return response()->json([
            'remark'  => 'language_data',
            'status'  => 'success',
            'message' => ['success' => $notify],
            'data'    => [
                'language_data' => $languageData,
                'languages'     => $languages,
            ],
        ]);
    }

    public function businessUserForm()
    {
        if (auth()->user()) {
            $form = Form::Where('act', 'business-account.data')->first();
        }
        $notify[] = 'Business profile field is below';
        return response()->json([
            'remark' => 'business_profile_form',
            'status' => 'success',
            'message' => ['success' => $notify],
            'data' => [
                'form' => $form->form_data
            ]
        ]);
    }


    public function userDataSubmit(Request $request)
    {
        $user = auth()->user();
        if ($user->profile_complete == 1) {
            $notify[] = 'You\'ve already completed your profile';
            return response()->json([
                'remark' => 'already_completed',
                'status' => 'error',
                'message' => ['error' => $notify],
            ]);
        }
        $validator = Validator::make($request->all(), [
            'firstname' => 'required',
            'lastname' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'remark' => 'validation_error',
                'status' => 'error',
                'message' => ['error' => $validator->errors()->all()],
            ]);
        }


        $user->firstname = $request->firstname;
        $user->lastname = $request->lastname;
        $user->address = [
            'country' => @$user->address->country,
            'address' => $request->address,
            'state' => $request->state,
            'zip' => $request->zip,
            'city' => $request->city,
        ];

        if ($user->type == Status::BUSINESS_USER) {
            $form           = Form::where('act', 'business-account.data')->first();
            $formData       = $form->form_data;
            $formProcessor  = new FormProcessor();
            $validationRule = $formProcessor->valueValidation($formData);
            $validator = Validator::make($request->all(), $validationRule);

            if ($validator->fails()) {
                return response()->json([
                    'remark' => 'validation_error',
                    'status' => 'error',
                    'message' => ['error' => $validator->errors()->all()],
                ]);
            }

            $userData                    = $formProcessor->processFormData($request, $formData);
            $user->business_profile_data = $userData;
        }

        $user->profile_complete = 1;
        $user->save();

        $notify[] = 'Profile completed successfully';
        return response()->json([
            'remark' => 'profile_completed',
            'status' => 'success',
            'message' => ['success' => $notify],
        ]);
    }

    public function kycForm()
    {
        if (auth()->user()->kv == 2) {
            $notify[] = 'Your KYC is under review';
            return response()->json([
                'remark' => 'under_review',
                'status' => 'error',
                'message' => ['error' => $notify],
            ]);
        }
        if (auth()->user()->kv == 1) {
            $notify[] = 'You are already KYC verified';
            return response()->json([
                'remark' => 'already_verified',
                'status' => 'success',
                'message' => ['error' => $notify],
            ]);
        }
        if (auth()->user()->type == Status::BUSINESS_USER) {
            $form = Form::Where('act', 'business-user.kyc')->first();
        } else {
            $form = Form::Where('act', 'personal-user.kyc')->first();
        }
        $notify[] = 'KYC field is below';
        return response()->json([
            'remark' => 'kyc_form',
            'status' => 'success',
            'message' => ['success' => $notify],
            'data' => [
                'form' => $form->form_data
            ]
        ]);
    }

    public function kycSubmit(Request $request)
    {
        $user = auth()->user();
        if ($user->type == Status::BUSINESS_USER) {
            $form = Form::Where('act', 'business-user.kyc')->first();
        } else {
            $form = Form::Where('act', 'personal-user.kyc')->first();
        }
        $formData = $form->form_data;
        $formProcessor = new FormProcessor();
        $validationRule = $formProcessor->valueValidation($formData);

        $validator = Validator::make($request->all(), $validationRule);

        if ($validator->fails()) {
            return response()->json([
                'remark' => 'validation_error',
                'status' => 'error',
                'message' => ['error' => $validator->errors()->all()],
            ]);
        }

        $userData = $formProcessor->processFormData($request, $formData);
        $user = auth()->user();
        $user->kyc_data = $userData;
        $user->kv = 2;
        $user->save();

        $notify[] = 'KYC data submitted successfully';
        return response()->json([
            'remark' => 'kyc_submitted',
            'status' => 'success',
            'message' => ['success' => $notify],
        ]);
    }



    public function home(Request $request)
    {
        if ($request->has('reference')) {
            session()->put('reference', $request->input('reference'));
        }

        $sendingCountries = Country::active()->sending()->with('conversionRates')->get();

        $receivingCountries = Country::receivableCountries()->get();

        return response()->json([
            'remark' => 'home_screen',
            'status' => 'success',
            'data' => [
                'sending_countries' => $sendingCountries,
                'receiving_countries' => $receivingCountries,
            ]
        ]);
    }



    public function calculate(Request $request)
    {
        $request->validate([
            'sending_amount' => 'required|numeric|gt:0',
            'recipient_amount'    => 'required|numeric|gt:0',
            'sending_country' => 'required|integer',
            'recipient_country' => 'required|integer',
            'delivery_method' => 'nullable|integer',
        ]);

        Country::active()->sending()->findOrFail($request->sending_country);
        Country::active()->receiving()->findOrFail($request->recipient_country);

        if ($request->delivery_method) {
            DeliveryMethod::active()->findOrFail($request->delivery_method);
        }

        $send_money = [
            'sending_amount' => $request->sending_amount,
            'recipient_amount'    => $request->recipient_amount,
            'sending_country' => $request->sending_country,
            'recipient_country' => $request->recipient_country,
            'delivery_method' => $request->delivery_method,
        ];

        session()->put('send_money', $send_money);

        return response()->json([

            'remark' => 'calculate',
            'status' => 'success',
            'data' => [
                'send_money' => $send_money
            ],

        ]);
    }

    public function depositHistory(Request $request)
    {
        $deposits = auth()->user()->deposits();
        if ($request->search) {
            $deposits = $deposits->where('trx', $request->search);
        }
        $deposits = $deposits->with(['gateway'])->orderBy('id', 'desc')->paginate(getPaginate());
        $notify[] = 'Deposit data';
        return response()->json([
            'remark' => 'deposits',
            'status' => 'success',
            'message' => ['success' => $notify],
            'data' => [
                'deposits' => $deposits
            ]
        ]);
    }

    public function transactions(Request $request)
    {
        $remarks = Transaction::distinct('remark')->get('remark');
        $transactions = Transaction::where('user_id', auth()->id());

        if ($request->search) {
            $transactions = $transactions->where('trx', $request->search);
        }


        if ($request->type) {
            $type = $request->type == 'plus' ? '+' : '-';
            $transactions = $transactions->where('trx_type', $type);
        }

        if ($request->remark) {
            $transactions = $transactions->where('remark', $request->remark);
        }

        $transactions = $transactions->orderBy('id', 'desc')->apiQuery();
        $notify[] = 'Transactions data';
        return response()->json([
            'remark' => 'transactions',
            'status' => 'success',
            'message' => ['success' => $notify],
            'data' => [
                'transactions' => $transactions,
                'remarks' => $remarks,
            ]
        ]);
    }


    public function transactionDetail($id)
    {
        $transaction = Transaction::findOrFail($id);
        return response()->json([
            'remark' => 'transaction_detail',
            'status' => 'success',
            'data' => [
                'transaction' => $transaction,
            ]
        ]);
    }



    public function submitProfile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'firstname' => 'required',
            'lastname' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'remark' => 'validation_error',
                'status' => 'error',
                'message' => ['error' => $validator->errors()->all()],
            ]);
        }

        $user = auth()->user();

        $user->firstname = $request->firstname;
        $user->lastname = $request->lastname;
        $user->address = [
            'country' => @$user->address->country,
            'address' => $request->address,
            'state' => $request->state,
            'zip' => $request->zip,
            'city' => $request->city,
        ];
        $user->save();

        $notify[] = 'Profile updated successfully';
        return response()->json([
            'remark' => 'profile_updated',
            'status' => 'success',
            'message' => ['success' => $notify],
        ]);
    }


    public function submitPassword(Request $request)
    {
        $passwordValidation = Password::min(6);
        $general = GeneralSetting::first();
        if ($general->secure_password) {
            $passwordValidation = $passwordValidation->mixedCase()->numbers()->symbols()->uncompromised();
        }

        $validator = Validator::make($request->all(), [
            'current_password' => 'required',
            'password' => ['required', 'confirmed', $passwordValidation]
        ]);

        if ($validator->fails()) {
            return response()->json([
                'remark' => 'validation_error',
                'status' => 'error',
                'message' => ['error' => $validator->errors()->all()],
            ]);
        }

        $user = auth()->user();
        if (Hash::check($request->current_password, $user->password)) {
            $password = Hash::make($request->password);
            $user->password = $password;
            $user->save();
            $notify[] = 'Password changed successfully';
            return response()->json([
                'remark' => 'password_changed',
                'status' => 'success',
                'message' => ['success' => $notify],
            ]);
        } else {
            $notify[] = 'The password doesn\'t match!';
            return response()->json([
                'remark' => 'validation_error',
                'status' => 'error',
                'message' => ['error' => $notify],
            ]);
        }
    }


    public function show2faForm()
    {
        $ga        = new GoogleAuthenticator();
        $user      = auth()->user();
        $secret    = $ga->createSecret();
        $qrCodeUrl = $ga->getQRCodeGoogleUrl($user->username . '@' . gs('site_name'), $secret);
        return response()->json([
            'remark' => 'show_2fa',
            'status' => 'success',
            'data' => [
                'secret' => $secret,
                'qr_code_url' => $qrCodeUrl
            ],
        ]);
    }

    public function create2fa(Request $request)
    {
        $user = auth()->user();
        $this->validate($request, [
            'key'  => 'required',
            'code' => 'required',
        ]);
        $response = verifyG2fa($user, $request->code, $request->key);
        if ($response) {
            $user->tsc = $request->key;
            $user->ts  = 1;
            $user->save();
            $notify[] = 'Google authenticator activated successfully';
            return response()->json([
                'message' => ['success' => $notify],
            ]);
        } else {
            $notify[] = 'Wrong verification code';
            return response()->json([
                'message' => ['error' => $notify],
            ]);
        }
    }

    public function disable2fa(Request $request)
    {
        $this->validate($request, [
            'code' => 'required',
        ]);

        $user     = auth()->user();
        $response = verifyG2fa($user, $request->code);
        if ($response) {
            $user->tsc = null;
            $user->ts  = 0;
            $user->save();
            $notify[] =  'Two factor authenticator deactivated successfully';
        } else {
            $notify[] =  ['error', 'Wrong verification code'];
        }
        return response()->json([
            'message' => ['success' => $notify],
        ]);
    }



    public function getDeviceToken(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'token' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'remark' => 'validation_error',
                'status' => 'error',
                'message' => ['error' => $validator->errors()->all()],
            ]);
        }

        $deviceToken = DeviceToken::where('token', $request->token)->first();

        if ($deviceToken) {
            $deviceToken = new DeviceToken();
        }

        $deviceToken->user_id = auth()->user()->id;
        $deviceToken->token = $request->token;
        $deviceToken->is_app = 1;
        $deviceToken->save();

        $notify[] = 'Token save successfully';
        return response()->json([
            'remark' => 'get_device_token',
            'status' => 'success',
            'message' => ['success' => $notify],
        ]);
    }
}
