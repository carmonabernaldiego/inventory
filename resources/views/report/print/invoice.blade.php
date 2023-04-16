<!DOCTYPE html>
<html>
<head>
	<title>Invoice Report</title>
	<link href="{{ url('plugins/bootstrap/css/bootstrap.css') }}" rel="stylesheet">
</head>
<body>
   <div class="container">
   	 <div class="row">
   	 			<table class="table table-bordered">
						<thead>
							<tr>
								<td colspan="8" style="border: none !important;">
									<h3 style="text-align: center;">{{ $company->name }}</h3>
								</td>

							</tr>		

							<tr style="border: none !important;">
								<td colspan="8" style="border: none !important;">
									<p style="text-align: center;">{{ $company->address }} <br>
										 {{ $company->phone }}</p></td>

							</tr>  	  			

							<tr style="border: none !important;">
								<td colspan="8" style="border: none !important;"><p style="text-align: center;font-weight: bold;">Invoice Report from {{ date('j M Y',strtotime($start_date)) }} To {{ date('j M Y',strtotime($end_date)) }}</p></td>

							</tr>
							<tr>
								<th>Invoice No.</th>
								<th>Invoice Date</th>
								<th>Customer</th>
								<th>Seller</th>
								<th>Details</th>
								<th>Total Importe</th>
								<th>Paid Importe</th>
								<th>Due</th>
							</tr>
						</thead>
						

						<tbody>
							<?php
							$total_amount = 0;
							$total_paid  = 0;
							$total_discount  = 0;
							?>
							@foreach($data as $value)

							<?php 
							$total_amount += $value->total_amount;
							$total_paid += $value->paid_amount;
							?>
							<tr>

								<td>{{ $value->id }}</td>
								<td>{{ date("j M Y", strtotime($value->sell_date) ) }}</td>
								<td>{{ $value->customer->customer_name }}</td>
								<td>{{ $value->user->name }}</td>
								<td><a href="{{ route('invoice.show',$value->id) }}" target="_blank" type="button" class="btn bg-orange btn-circle waves-effect waves-circle waves-float">
                                         <i class="material-icons">print</i>
                                     </a></td>
								<td>{{ $value->total_amount }}</td>
								<td>{{ $value->paid_amount }}</td>
								<td>{{ $value->total_amount - $value->paid_amount }}</td>
							</tr>
							@endforeach

							<tr>
								<th colspan="5" style="text-align: right;">Total =</th>
								<th >{{ round($total_amount) }}</th>
								<th >{{ round($total_paid) }}</th>
								<th >{{ round($total_amount-$total_paid) }}</th>
							</tr>

							
						</tbody>
					</table>
   	 </div>
   </div>
   <script type="text/javascript">
   	 window.print();
   </script>
</body>
</html>