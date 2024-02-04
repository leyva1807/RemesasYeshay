@extends($activeTemplate . 'layouts.master')

@section('content')
    <div class="section section--xl">
        <div class="container">
            <div class="row justify-content-center mt-4">
                <div class="col-md-8">
                    <div class="card custom--card">
                        <div class="card-header">
                            <h5 class="card-title">
                                {{ __($pageTitle) }}
                            </h5>
                        </div>
                        <div class="card-body">

                            <form action="" method="post">
                                @csrf
                                <div class="form-group">
                                    <label class="form-label">@lang('Current Password')</label>
                                    <input class="form-control form--control" name="current_password" type="password" required autocomplete="current-password">
                                </div>
                                <div class="form-group">
                                    <label class="d-block sm-text mb-2">@lang('Password')</label>
                                    <div>
                                        <input class="form-control form--control @if ($general->secure_password) secure-password @endif" name="password" type="password" required autocomplete="current-password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="d-block sm-text mb-2">@lang('Confirm Password')</label>
                                    <input class="form-control form--control" name="password_confirmation" type="password" required autocomplete="current-password">
                                </div>
                                <div class="form-group">
                                    <button class="btn btn--base w-100 btn--xl" type="submit">@lang('Submit')</button>
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
