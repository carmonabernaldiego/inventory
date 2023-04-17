@extends('include.master')


@section('title','Inventory | Usuarios')


@section('page-title','Usuarios')


@section('content')


        <div class="row clearfix">
        	
        	<create-user></create-user>

        </div>


        <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                        <!--     <h2>
                                Vendor List
                          
                            </h2> -->
                          
                          <h2>
                          	 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#create-user">
                                Usuario nuevo
                             </button>
                          </h2>
                        </div>

                        <view-user></view-user>

                    </div>
                </div>
            </div>

          


@endsection

@push('script')

<script type="text/javascript" src="{{ url('public/js/user.js') }}"></script>

@endpush