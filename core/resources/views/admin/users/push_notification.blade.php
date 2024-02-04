@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <form action="" method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-md-4">
                                <div class="image-upload">
                                    <div class="thumb">
                                        <div class="avatar-preview">
                                            <div class="profilePicPreview" style="background-image: url({{ getImage(getFilePath('pushImage'), getFileSize('pushImage')) }})">
                                                <button class="remove-image" type="button"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div>
                                        <div class="avatar-edit">
                                            <input class="profilePicUpload" id="profilePicUpload1" name="image" type="file" accept=".png, .jpg, .jpeg">
                                            <label class="bg--success" for="profilePicUpload1">@lang('Selected Image')</label>
                                            <small class="mt-2">@lang('Supported files'): <b>@lang('jpeg'),@lang('jpg'),@lang('png').</b> @lang('Image will be resized into ' . getFileSize('pushImage') . 'px') </small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>@lang('Being Sent')</label>
                                    <select class="form-control"name="user_type">
                                        <option value="all">@lang('All Users')</option>
                                        <option value="0">@lang('Web Users')</option>
                                        <option value="1">@lang('App Users')</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="title">@lang('Title')</label>
                                    <input class="form-control" name="title" type="text">
                                </div>
                                <div class="form-group">
                                    <label for="message">@lang('Message')</label>
                                    <textarea class="form-control" name="message" cols="10" rows="5"></textarea>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-footer">
                        <button class="btn btn--primary w-100 h-45" type="submit">@lang('Submit')</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
@endsection
