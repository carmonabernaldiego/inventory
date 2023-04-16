@extends('include.master')


@section('title','Inventory | Password Change')


@section('page-title','Password Change')


@section('content')




<div class="row clearfix">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="card">
			<div class="header">
				<h2>
					
                   Change Password					
				</h2>
			</div>


			<div class="body">

				
				@if ($errors->any())
				<div class="alert alert-danger">
					<ul>
						@foreach ($errors->all() as $error)
						<li>{{ $error }}</li>
						@endforeach
					</ul>
				</div>
                @endif
                
                @if(Session::has('message'))
                 <p class="alert alert-info">{{ Session::get('message') }}</p>
                @endif
				
                <form action="{{ route('password.store') }}" method="post">
                    
                    {{ csrf_field() }}
					
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
                           
                            <div class="input-group">
                               
                                <span class="input-group-addon">
                                    <i class="material-icons">palette</i>
                                </span>
                                <div class="form-line">
                                    <input type="password" 
                                     class="form-control"
                                     name="old_password" placeholder="Enter Your Old Password">
                                </div>
                            </div>

                            <div class="input-group">
                               
                                <span class="input-group-addon">
                                    <i class="material-icons">palette</i>
                                </span>
                                <div class="form-line">
                                    <input type="password" 
                                     class="form-control"
                                     name="password" placeholder="Enter New Password">
                                </div>
                            </div>

                            <div class="input-group">
                               
                                <span class="input-group-addon">
                                    <i class="material-icons">palette</i>
                                </span>
                                <div class="form-line">
                                    <input type="password" 
                                     class="form-control"
                                     name="password_confirmation" placeholder="Confirm Password">
                                </div>
                            </div>
                        </div>
					</div>


					<div class="row text-center">
						<button type="submit" class="btn bg-teal">Update</button>
					</div>


				</form>

			</div>


		</div>
	</div>
</div>




@endsection