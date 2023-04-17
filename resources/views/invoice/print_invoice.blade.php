<!DOCTYPE html>
<html>
<head>
	<title>inventory-invoice:{{ $invoice->id }}</title>
	<link href="{{ url('plugins/bootstrap/css/bootstrap.css') }}" rel="stylesheet">
</head>
<body>
    <div class="container">
    	<div class="row">
    		<div class="col-md-12" style="text-align: center;">
    		<h2 >{{ $company->name }}</h2>
    		<small>{{ $company->address }}</small><br>
    		<small>{{ $company->phone }}</small>
    		<hr>
    	</div>
    	</div>
    </div>
    <div class="container">
    
      <!-- title row -->
      <div class="row">
<!--         <div class="col-xs-12">
          <h2 class="page-header">
            <i class="fa fa-globe"></i> Invoice Details: {{ $invoice->id }}
            <small class="pull-right"> </small>
          </h2>
        </div> -->
        <!-- /.col -->
      </div>
      <!-- info row -->
      <div class="row invoice-info">
        <div class="col-sm-4 invoice-col">
          Información del cliente
          <address>
            <strong>{{ $invoice->customer->customer_name }}</strong><br>

            <span style="font-weight: bold">Telefono:</span> {{ $invoice->customer->phone }}<br>
            <span style="font-weight: bold">Correo electrónico:</span> {{ $invoice->customer->email ? $invoice->customer->email : 'no email' }}<br>

            <span style="font-weight: bold">Dirección:</span> {{ $invoice->customer->address  }}<br>
            
          </address>
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col">
          
        </div>
        <!-- /.col -->
        <div class="col-sm-4 invoice-col text-right">
          <b style="font-weight: bold;color: green">Factura N° : {{ $invoice->id }}</b><br>
          <b>Fecha: {{ date("d F Y", strtotime($invoice->sell_date)) }}</b><br>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!-- Table row -->
      <div class="row">
        <div class="col-xs-12 table-responsive">
          <table class="table table-striped table-bordered table-condensed">
            <thead style="background-color: teal;color: #fff;">
            <tr>
              <th>Categoría</th>
              <th>Producto</th>
              <th>Comprobante</th>
              <th>Cantidad</th>
              <th>Precio por unidad</th>
              <th>Descuento</th>
              <th>Precio total</th>
            </tr>
            </thead>
            <tbody>
              @php
               
               $sub_total = 0;
               $discount = 0;
              @endphp
              @foreach($invoice_details as $value)
            <tr>
              <td>{{ $value->stock->category->name }}</td>
              <td>{{ $value->stock->product->product_name }}</td>
              <td>{{ $value->chalan_no }}</td>
              <td>{{ $value->sold_quantity }}</td>
              <td>{{ $value->sold_price }}</td>
              <td>{{ $value->discount_amount }}</td>
              <td>{{ $value->total_sold_price }}</td>
            </tr>
            @php
              $discount += $value->discount_amount; 
              $sub_total += $value->total_sold_price;
            @endphp

            @endforeach
 
            </tbody>
          </table>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <div class="row">
        <!-- accepted payments column -->
        <div class="col-xs-8">

        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <!-- <p class="lead">Importe Due 2/22/2014</p> -->

          <div class="table-responsive">
            <table class="table">
              <tr>
                <th style="width:50%">Subtotal:</th>
                <td>$ {{ $sub_total+$discount }}</td>
              </tr>
              <tr>
                <th>Descuento: </th>
                <td>$ {{ $discount }}</td>
              </tr>
              <tr>
                <th>Total a pagar: </th>
                <td>$ {{ $sub_total }}</td>
              </tr> 
              <tr>
                <th>Importe pagado: </th>
                <td>$ {!! $paid = $invoice->paid_amount !!}</td>
              </tr>  
              <tr>
                <th>Importe a debido: </th>
                <td>$ {{ $sub_total-$paid }}</td>
              </tr>
            </table>
          </div>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->




    </div>
    <script >
      window.print();
    </script>
</body>
</html>