<?php

namespace App\Http\Controllers\Admin;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Lib\CurlRequest;
use App\Lib\FormProcessor;
use App\Models\Deposit;
use App\Models\Form;
use App\Models\NotificationLog;
use App\Models\SendMoney;
use App\Models\Transaction;
use App\Models\User;
use App\Models\DeviceToken;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ManageUsersController extends Controller
{

    public function allUsers()
    {
        $pageTitle = 'All Users';
        $users     = $this->userData();
        return view('admin.users.list', compact('pageTitle', 'users'));
    }

    public function activeUsers()
    {
        $pageTitle = 'Active Users';
        $users     = $this->userData('active');
        return view('admin.users.list', compact('pageTitle', 'users'));
    }

    public function bannedUsers()
    {
        $pageTitle = 'Banned Users';
        $users     = $this->userData('banned');
        return view('admin.users.list', compact('pageTitle', 'users'));
    }

    public function emailUnverifiedUsers()
    {
        $pageTitle = 'Email Unverified Users';
        $users     = $this->userData('emailUnverified');
        return view('admin.users.list', compact('pageTitle', 'users'));
    }
    public function kycUnverifiedUsers()
    {
        $pageTitle = 'KYC Unverified Users';
        $users =  $this->userData('kycUnverified');
        return view('admin.users.list', compact('pageTitle', 'users'));
    }

    public function kycPendingUsers()
    {
        $pageTitle = 'KYC Unverified Users';
        $users =  $this->userData('kycPending');
        return view('admin.users.list', compact('pageTitle', 'users'));
    }

    public function emailVerifiedUsers()
    {
        $pageTitle = 'Email Verified Users';
        $users     = $this->userData('emailVerified');
        return view('admin.users.list', compact('pageTitle', 'users'));
    }


    public function mobileUnverifiedUsers()
    {
        $pageTitle = 'Mobile Unverified Users';
        $users     = $this->userData('mobileUnverified');
        return view('admin.users.list', compact('pageTitle', 'users'));
    }


    public function mobileVerifiedUsers()
    {
        $pageTitle = 'Mobile Verified Users';
        $users     = $this->userData('mobileVerified');
        return view('admin.users.list', compact('pageTitle', 'users'));
    }


    public function usersWithBalance()
    {
        $pageTitle = 'Users with Balance';
        $users     = $this->userData('withBalance');
        return view('admin.users.list', compact('pageTitle', 'users'));
    }

    public function personalAccount()
    {
        $pageTitle = 'Personal Users Account';
        $users     = $this->userData('PersonalAccount');
        return view('admin.users.list', compact('pageTitle', 'users'));
    }

    public function businessAccount()
    {
        $pageTitle = 'Business  Users Account';
        $users     = $this->userData('BusinessAccount');
        return view('admin.users.list', compact('pageTitle', 'users'));
    }




    protected function userData($scope = null)
    {
        if ($scope) {
            $users = User::$scope();
        } else {
            $users = User::query();
        }
        return $users->searchable(['username', 'email'])->orderBy('id', 'desc')->paginate(getPaginate());
    }


    public function detail($id)
    {
        $user             = User::findOrFail($id);
        $pageTitle        = 'User Detail - ' . $user->username;
        $totalSendMoney   = SendMoney::where('user_id', $user->id)->whereIn('status', [Status::SEND_MONEY_PENDING, Status::SEND_MONEY_COMPLETED])->sum('base_currency_amount');
        $totalDeposit     = Deposit::where('user_id', $user->id)->where('status', Status::PAYMENT_SUCCESS)->sum('amount');
        $totalTransaction = Transaction::where('user_id', $user->id)->count();
        $countries        = json_decode(file_get_contents(resource_path('views/partials/country.json')));
        return view('admin.users.detail', compact('pageTitle', 'user', 'totalDeposit', 'totalSendMoney', 'totalTransaction', 'countries'));
    }

    public function update(Request $request, $id)
    {
        $user         = User::findOrFail($id);
        $countryData  = json_decode(file_get_contents(resource_path('views/partials/country.json')));
        $countryArray = (array)$countryData;
        $countries    = implode(',', array_keys($countryArray));

        $countryCode = $request->country;
        $country     = $countryData->$countryCode->country;
        $dialCode    = $countryData->$countryCode->dial_code;


        $request->validate([
            'firstname' => 'required|string|max:40',
            'lastname'  => 'required|string|max:40',
            'email'     => 'required|email|string|max:40|unique:users,email,' . $user->id,
            'mobile'    => 'required|string|max:40|unique:users,mobile,' . $user->id,
            'country'   => 'required|in:' . $countries,
            'per_send_money_limit' => 'required|numeric|gt:0',
            'daily_send_money_limit' => 'required|numeric|gte:per_send_money_limit',
            'monthly_send_money_limit' => 'required|numeric|gte:monthly_send_money_limit',
        ]);


        $user->mobile       = $dialCode . $request->mobile;
        $user->country_code = $countryCode;
        $user->firstname    = $request->firstname;
        $user->lastname     = $request->lastname;
        $user->email        = $request->email;
        $user->per_send_money_limit = $request->per_send_money_limit;
        $user->daily_send_money_limit = $request->daily_send_money_limit;
        $user->monthly_send_money_limit = $request->monthly_send_money_limit;

        $user->address      = [
            'address' => $request->address,
            'city'    => $request->city,
            'state'   => $request->state,
            'zip'     => $request->zip,
            'country' => @$country,
        ];
        if (!$request->kv) {
            $user->kv       = Status::KYC_UNVERIFIED;
            if ($user->kyc_data) {
                foreach ($user->kyc_data as $kycData) {
                    if ($kycData->type == 'file') {
                        fileManager()->removeFile(getFilePath('verify') . '/' . $kycData->value);
                    }
                }
            }
            $user->kyc_data = null;
        } else {
            $user->kv = Status::KYC_VERIFIED;
        }
        $user->ev = $request->ev ? Status::VERIFIED : Status::UNVERIFIED;
        $user->sv = $request->sv ? Status::VERIFIED : Status::UNVERIFIED;
        $user->ts = $request->ts ? Status::ENABLE : Status::DISABLE;
        $user->save();

        $notify[] = ['success', 'User details updated successfully'];
        return back()->withNotify($notify);
    }

    public function addSubBalance(Request $request, $id)
    {
        $request->validate([
            'amount' => 'required|numeric|gt:0',
            'act'    => 'required|in:add,sub',
            'remark' => 'required|string|max:255',
        ]);

        $user    = User::findOrFail($id);
        $amount  = $request->amount;
        $trx     = getTrx();

        $transaction = new Transaction();

        if ($request->act == 'add') {
            $user->balance += $amount;

            $transaction->trx_type = '+';
            $transaction->remark   = 'balance_add';

            $notifyTemplate = 'BAL_ADD';

            $notify[] = ['success', gs('cur_sym') . $amount . ' added successfully'];
        } else {
            if ($amount > $user->balance) {
                $notify[] = ['error', $user->username . ' doesn\'t have sufficient balance.'];
                return back()->withNotify($notify);
            }

            $user->balance -= $amount;

            $transaction->trx_type = '-';
            $transaction->remark   = 'balance_subtract';

            $notifyTemplate = 'BAL_SUB';
            $notify[]               = ['success', gs('cur_sym') . $amount . ' subtracted successfully'];
        }

        $user->save();

        $transaction->user_id      = $user->id;
        $transaction->amount       = $amount;
        $transaction->post_balance = $user->balance;
        $transaction->charge       = 0;
        $transaction->trx          = $trx;
        $transaction->details      = $request->remark;
        $transaction->save();

        notify($user, $notifyTemplate, [
            'trx'          => $trx,
            'amount'       => showAmount($amount),
            'remark'       => $request->remark,
            'post_balance' => showAmount($user->balance)
        ]);

        return back()->withNotify($notify);
    }

    public function login($id)
    {
        auth()->guard('agent')->logout();
        Auth::loginUsingId($id);
        return to_route('user.home');
    }

    public function status(Request $request, $id)
    {
        $user = User::findOrFail($id);
        if ($user->status == Status::USER_ACTIVE) {
            $request->validate([
                'reason' => 'required|string|max:255'
            ]);
            $user->status     = Status::USER_BAN;
            $user->ban_reason = $request->reason;
            $notify[]         = ['success', 'User banned successfully'];
        } else {
            $user->status     = Status::USER_ACTIVE;
            $user->ban_reason = null;
            $notify[]         = ['success', 'User unbanned successfully'];
        }

        $user->save();
        return back()->withNotify($notify);
    }


    public function showNotificationSingleForm($id)
    {
        $user    = User::findOrFail($id);
        $general = gs();
        if (!$general->en && !$general->sn) {
            $notify[] = ['warning', 'Notification options are disabled currently'];
            return to_route('admin.users.detail', $user->id)->withNotify($notify);
        }
        $pageTitle = 'Send Notification to ' . $user->username;
        return view('admin.users.notification_single', compact('pageTitle', 'user'));
    }

    public function sendNotificationSingle(Request $request, $id)
    {
        $request->validate([
            'message' => 'required|string',
            'subject' => 'required|string',
        ]);

        $user = User::findOrFail($id);
        notify($user, 'DEFAULT', [
            'subject' => $request->subject,
            'message' => $request->message,
        ]);
        $notify[] = ['success', 'Notification sent successfully'];
        return back()->withNotify($notify);
    }



    public function showNotificationAllForm()
    {
        $general = gs();
        if (!$general->en && !$general->sn) {
            $notify[] = ['warning', 'Notification options are disabled currently'];
            return to_route('admin.dashboard')->withNotify($notify);
        }
        $notifyToUser = User::notifyToUser();
        $users     = User::active()->count();
        $pageTitle = 'Notification to Verified Users';
        return view('admin.users.notification_all', compact('pageTitle', 'users', 'notifyToUser'));
    }

    public function sendNotificationAll(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'message'                      => 'required',
            'subject'                      => 'required',
            'start'                        => 'required',
            'batch'                        => 'required',
            'being_sent_to'                => 'required',
            'user'                         => 'required_if:being_sent_to,selectedUsers',
            'number_of_days'               => 'required_if:being_sent_to,notLoginUsers|integer|gte:0',
        ], [
            'number_of_days.required_if'               => "Number of days field is required",
            'number_of_top_deposited_user.required_if' => "Number of top deposited user field is required",
        ]);

        if ($validator->fails()) return response()->json(['error' => $validator->errors()->all()]);

        $scope = $request->being_sent_to;
        $users = User::oldest()->active()->$scope()->skip($request->start)->limit($request->batch)->get();
        foreach ($users as $user) {
            notify($user, 'DEFAULT', [
                'subject' => $request->subject,
                'message' => $request->message,
            ]);
        }
        return response()->json([
            'total_sent' => $users->count(),
        ]);
    }

    public function showPushNotificationAll()
    {
        $pageTitle = 'Send Push Notifications';
        return view('admin.users.push_notification', compact('pageTitle'));
    }


    public function sendPushNotificationAll(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'message' => 'required|string|max:255',

        ]);

        $image = null;

        $files = glob(getFilePath('pushImage') . '/*', GLOB_MARK);

        if ($files) {
            foreach ($files as $file) {
                if (file_exists($file) && time() - filemtime($file) >= 30 * 24 * 60 * 60) {
                    unlink($file);
                }
            }
        }

        if ($request->hasFile('image')) {
            try {
                $image = fileUploader($request->image, getFilePath('pushImage'), getFileSize('adminProfile'));
            } catch (\Exception $exp) {
                $notify[] = ['error', 'Couldn\'t upload your image'];
                return back()->withNotify($notify);
            }
        }
        if ($image) {
            $image = getImage(getFilePath('pushImage') . '/' . $image);
        }

        $setting = gs();
        $deviceTokens = DeviceToken::query();
        if ($request->user_type === "0") {
            $deviceTokens = $deviceTokens->where('is_app', 0);
        } elseif ($request->user_type == "1") {
            $deviceTokens = $deviceTokens->where('is_app', 1);
        }
        $deviceTokens = $deviceTokens->pluck('token');
        try {
            $data = [
                'registration_ids' => $deviceTokens,
                'notification' => [
                    'title'        => $request->title,
                    'body'         => $request->message,
                    'icon'         => getImage(getFilePath('logoIcon') . '/logo.png'),
                    'click_action' => route('user.home'),
                    'image'        => $image,
                    'priority'     => 'high'
                ],
                'data' => [
                    'for_app' => 'HOME'
                ]
            ];

            $dataString = json_encode($data);

            $headers = [
                'Authorization:key=' . @$setting->firebase_config?->serverKey,
                'Content-Type: application/json',
                'priority:high'
            ];
            CurlRequest::curlPostContent('https://fcm.googleapis.com/fcm/send', $dataString, $headers);
        } catch (\Exception $e) {
            $notify[] = ['error', $e->getMessage()];
            return back()->withNotify($notify);
        }

        $notify[] = ['success', 'Notification send successfully'];
        return back()->withNotify($notify);
    }

    public function list()
    {
        abort_if(!request()->ajax(), 404);
        $query = User::active();

        if (request()->search) {
            $query->where(function ($q) {
                $q->where('email', 'like', '%' . request()->search . '%')->orWhere('username', 'like', '%' . request()->search . '%');
            });
        }
        $users = $query->orderBy('id', 'desc')->paginate(getPaginate());
        return response()->json([
            'success' => true,
            'users'   => $users,
            'more'    => $users->hasMorePages()
        ]);
    }

    public function notificationLog($id)
    {
        $user      = User::findOrFail($id);
        $pageTitle = 'Notifications Sent to ' . $user->username;
        $logs      = NotificationLog::where('user_id', $id)->with('user')->orderBy('id', 'desc')->paginate(getPaginate());
        return view('admin.reports.notification_history', compact('pageTitle', 'logs', 'user'));
    }
    public function kycDetails($id)
    {
        $pageTitle = 'KYC Details';
        $user     = User::findOrFail($id);
        return view('admin.users.kyc_detail', compact('pageTitle', 'user'));
    }

    public function kycApprove($id)
    {
        $user     = User::findOrFail($id);
        $user->kv = Status::KYC_VERIFIED;
        $user->save();

        notify($user, 'KYC_APPROVE', []);

        $notify[] = ['success', 'KYC approved successfully'];
        return to_route('admin.users.kyc.pending')->withNotify($notify);
    }

    public function kycReject($id)
    {
        $user = User::findOrFail($id);
        foreach ($user->kyc_data as $kycData) {
            if ($kycData->type == 'file') {
                fileManager()->removeFile(getFilePath('verify') . '/' . $kycData->value);
            }
        }
        $user->kv       = Status::KYC_UNVERIFIED;
        $user->kyc_data = null;
        $user->save();

        notify($user, 'KYC_REJECT', []);

        $notify[] = ['success', 'KYC rejected successfully'];
        return to_route('admin.users.kyc.pending')->withNotify($notify);
    }



    public function businessForm()
    {
        $type = 'business-account';
        $pageTitle = 'Business Form';
        $form = Form::where('act', $type . '.data')->first();
        return view('admin.business_profile.setting', compact('pageTitle', 'form', 'type'));
    }

    public function businessFormUpdate(Request $request)
    {
        $type = 'business-account';
        $formProcessor = new FormProcessor();
        $generatorValidation = $formProcessor->generatorValidation();
        $request->validate($generatorValidation['rules'], $generatorValidation['messages']);
        $exist = Form::where('act', $type . '.data')->first();
        if ($exist) {
            $isUpdate = true;
        } else {
            $isUpdate = false;
        }
        $formProcessor->generate($type . '.data', $isUpdate, 'act');

        $notify[] = ['success', 'Profile data updated successfully'];
        return back()->withNotify($notify);
    }
}
