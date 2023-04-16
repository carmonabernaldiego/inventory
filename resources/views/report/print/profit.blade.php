<!DOCTYPE html>
<html>
<head>
	<title>Profit Report</title>
	<link href="{{ url('plugins/bootstrap/css/bootstrap.css') }}" rel="stylesheet">
</head>
<body>
   <div class="container">
   	 <div class="row">
   	 						<table class="table table-bordered table-condensed">
						<thead>
							<tr>
								<td colspan="5" style="border: none !important;">
									<h3 style="text-align: center;">{{ $company->name }}</h3>
								</td>

							</tr>		

							<tr style="border: none !important;">
								<td colspan="5" style="border: none !important;">
									<p style="text-align: center;">{{ $company->address }} <br>
										 {{ $company->phone }}</p></td>

							</tr>  				

							<tr style="border: none !important;">
								<td colspan="5" style="border: none !important;"><p style="text-align: center;font-weight: bold;">Profit Report from {{ date('j M Y',strtotime($start_date)) }} To {{ date('j M Y',strtotime($end_date)) }}</p></td>

							</tr>
							<tr>
								<th>Product</th>
								<th>Quantity</th>
								<th>Total Selling Importe</th>
								<th>Total Buying Importe</th>
								<th>Profit</th>
							
							</tr>
						</thead>


						<tbody>
							<?php
							$total_quantity = 0;
							$total_buy_price = 0;
							$total_sold_price  = 0;
							$total_discount  = 0;
							?>
							@foreach($data as $value)

							<?php 
							$total_quantity += $value->total_quantity;
							$total_buy_price += $value->total_buy_price;
							$total_sold_price += $value->total_sold_price;
							?>
							<tr>

								<td>{{ $value->product->product_name }}</td>
								<td>{{ $value->total_quantity }}</td>
								<td>{{ $value->total_sold_price }}</td>
								<td>{{ $value->total_buy_price }}</td>
							
								<td>{{ $value->total_sold_price - $value->total_buy_price }}</td>
								
							</tr>
							@endforeach

							<tr>
								<th style="text-align: right;">Total =</th>
								<th>{{ round($total_quantity) }}</th>
								<th>{{ round($total_sold_price) }}</th>
								<th>{{ round($total_buy_price) }}</th>
								<th>{{ round($total_sold_price-$total_buy_price) }}</th>
							
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