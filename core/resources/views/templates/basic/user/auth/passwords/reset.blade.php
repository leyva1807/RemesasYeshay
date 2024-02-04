@extends($activeTemplate . 'layouts.frontend')
@section('content')
    <div class="section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-7 col-xl-5">
                    <div class="card custom--card">
                        <div class="card-body">
                            <div class="mb-4">
                                <p>@lang('Your account is verified successfully. Now you can change your password. Please enter a strong password and don\'t share it with anyone.')</p>
                            </div>
                            <form method="POST" action="{{ route('user.password.update') }}" autocomplete="off">
                                @csrf
                                <input name="email" type="hidden" value="{{ $email }}">
                                <input name="token" type="hidden" value="{{ $token }}">
                                <div class="form-group">
                                    <label class="d-block sm-text mb-2">@lang('Password')</label>
                                    <input class="form-control form--control" name="password" type="password" required>
                                </div>
                                <div class="form-group">
                                    <label class="d-block sm-text mb-2">@lang('Confirm Password')</label>
                                    <input class="form-control form--control @if ($general->secure_password) secure-password @endif" name="password_confirmation" type="password" autocomplete="false" required>
                                </div>
                                <div class="form-group">
                                    <button class="btn btn--base w-100 btn--xl" type="submit"> @lang('Submit')</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@if ($general->secure_password)
    @push('script-lib')
        <script src="{{ asset('assets/global/js/secure_password.js') }}"></script>
    @endpush
@endif
