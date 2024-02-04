<?php

use App\Models\Frontend;
use App\Models\GeneralSetting;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::namespace('Api')->name('api.')->group(function () {

    Route::get('general-setting', function () {
        $general = GeneralSetting::first();
        $notify[] = 'General setting data';
        return response()->json([
            'remark' => 'general_setting',
            'status' => 'success',
            'message' => ['success' => $notify],
            'data' => [
                'general_setting' => $general,
            ],
        ]);
    });


    Route::get('policy',function (){
        $policy = Frontend::where('data_keys', 'policy_pages.element')->get();
		return getResponse('policy_page', 'success', 'Policy & Terms and condition page', ['policy' => $policy]);
    });
    
    Route::get('policy/{id}', 'UserController@policyPages')->name('policy.pages');
    

    Route::get('language/all', 'UserController@language')->name('lang.all');
    Route::get('change/{lang?}', 'UserController@changeLanguage')->name('lang');
    Route::get('translate/{code}', 'UserController@translate')->name('translate');
    

    Route::get('get-countries', function () {
        $c = json_decode(file_get_contents(resource_path('views/partials/country.json')));
        $notify[] = 'General setting data';
        foreach ($c as $k => $country) {
            $countries[] = [
                'country' => $country->country,
                'dial_code' => $country->dial_code,
                'country_code' => $k,
            ];
        }
        return response()->json([
            'remark' => 'country_data',
            'status' => 'success',
            'message' => ['success' => $notify],
            'data' => [
                'countries' => $countries,
            ],
        ]);
    });


    Route::namespace('Auth')->group(function () {
        Route::post('login', 'LoginController@login');
        Route::post('register', 'RegisterController@register');

        Route::controller('ForgotPasswordController')->group(function () {
            Route::post('password/email', 'sendResetCodeEmail')->name('password.email');
            Route::post('password/verify-code', 'verifyCode')->name('password.verify.code');
            Route::post('password/reset', 'reset')->name('password.update');
        });
    });


    Route::middleware('auth:sanctum')->group(function () {

        //authorization
        Route::controller('AuthorizationController')->group(function () {
            Route::get('authorization', 'authorization')->name('authorization');
            Route::get('resend-verify/{type}', 'sendVerifyCode')->name('send.verify.code');
            Route::post('verify-email', 'emailVerification')->name('verify.email');
            Route::post('verify-mobile', 'mobileVerification')->name('verify.mobile');
            Route::post('verify-g2fa', 'g2faVerification')->name('go2fa.verify');
        });

        Route::middleware(['check.status'])->group(function () {
            Route::post('user-data-submit', 'UserController@userDataSubmit')->name('data.submit');
            Route::get('business-user-form', 'UserController@businessUserForm')->name('business.user.form');

            Route::middleware('registration.complete')->group(function () {
           
                Route::get('dashboard','UserController@dashboard')->name('dashboard');

                Route::get('user-info', function () {
                    $notify[] = 'User information';
                    return response()->json([
                        'remark' => 'user_info',
                        'status' => 'success',
                        'message' => ['success' => $notify],
                        'data' => [
                            'user' => auth()->user()
                        ]
                    ]);
                });

                Route::controller('UserController')->group(function () {
                    //KYC
                    Route::get('kyc-form', 'kycForm')->name('kyc.form');
                    Route::post('kyc-submit', 'kycSubmit')->name('kyc.submit');

                    //Report
                    Route::any('deposit/history', 'depositHistory')->name('deposit.history');
                    Route::get('transactions', 'transactions')->name('transactions');
                    Route::get('transaction-detail/{id}', 'transactionDetail')->name('transaction.detail');
                });

                //Profile setting
                Route::controller('UserController')->group(function () {
                    Route::post('profile-setting', 'submitProfile');
                    Route::post('change-password', 'submitPassword');
                });

                //app
                Route::controller('UserController')->group(function () {
                    Route::get('home', 'home')->name('home');
                    Route::post('calculate', 'calculate')->name('calculate');
                    Route::post('save/device/token', 'getDeviceToken')->name('add.device.token');
                    
                    //2FA
                    Route::get('twofactor', 'show2faForm')->name('twofactor');
                    Route::post('twofactor/enable', 'create2fa')->name('twofactor.enable');
                    Route::post('twofactor/disable', 'disable2fa')->name('twofactor.disable');
                });



                Route::controller('SendMoneyController')->name('send.money.')->group(function () {
                    Route::get('send-money/send-now', 'sendMoney')->name('now');
                    Route::post('send-money/save', 'saveMoney')->name('save')->middleware('user.kyc:send_money');
                    Route::post('send-money/service', 'getServices')->name('service');
                   
                    Route::get('send-money/transfers/history', 'history')->name('transfers.history');
                    Route::get('send-money/detail/{id}', 'sendMoneyDetail')->name('transfers.detail');
                });


                // Payment
                Route::middleware('registration.complete')->middleware('user.kyc:direct_payment')->controller('PaymentController')->group(function () {
                    Route::get('deposit/methods', 'methods')->name('deposit');
                    Route::post('deposit/insert', 'depositInsert')->name('deposit.insert');
                    Route::get('deposit/confirm', 'depositConfirm')->name('deposit.confirm');
                    Route::get('deposit/manual', 'manualDepositConfirm')->name('deposit.manual.confirm');
                    Route::post('deposit/manual', 'manualDepositUpdate')->name('deposit.manual.update');
                });
            });
        });

        Route::get('logout', 'Auth\LoginController@logout');
    });
});
