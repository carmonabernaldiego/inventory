@extends('include.master')


@section('title','Inventory | Report')


@section('page-title','Report')


@section('content')




<div class="row clearfix">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="card">
			<div class="header">
				<h2>
					
					Generate Report
					
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
				
				<form action="{{ route('report.store') }}" method="GET">
					
					<div class="row">
						<report-form :user="{{ $user }}" :customer="{{ $customer }}" :category="{{ $category }}" :vendor="{{ $vendor }}"></report-form>
					</div>


					<div class="row text-center">
						<button type="submit" class="btn bg-teal">Get Report</button>
					</div>


				</form>

			</div>


		</div>
	</div>
</div>




@endsection

@push('script')

<script type="text/javascript" src="{{ url('public/js/report.js') }}"></script>

@endpush