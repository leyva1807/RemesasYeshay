<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class UserKycMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next, $module = null)
    {
        $modules = gs()->kyc_modules;

        if (@$modules->user->$module) {
            $user = auth()->user();
            
            if ($request->is('api/*') && ($user->kv == 0 || $user->kv == 2)) {
                $notify[] = 'For being KYC verified, please provide these information';
                return response()->json([
                    'remark' => 'kyc_verification',
                    'status' => 'error',
                    'message' => ['error' => $notify],
                ]);
            }

            if ($user->kv == 0) {
                $notify[] = ['info', 'For being KYC verified, please provide these information'];
                $notify[] = ['error', 'You are not KYC verified.'];
                return to_route('user.kyc.form')->withNotify($notify);
            }
            if ($user->kv == 2) {
                $notify[] = ['warning', 'Please wait for admin approval'];
                $notify[] = ['info', 'Your documents for KYC verification is under review.'];
                return to_route('user.kyc.data')->withNotify($notify);
            }
        }

        return $next($request);
    }
}
