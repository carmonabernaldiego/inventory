<template>
	
	<div class="wrap">
		
		    <div class="modal fade" id="smallModal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">

                    		<div class="alert alert-danger" v-if="errors">
							<ul>
								<li v-for="error in errors">{{ error[0] }}</li>
							</ul>
						</div>

                    	<form @submit.prevent="Payment()">
                        <div class="modal-header">
                            <h4 class="modal-title" id="CreatePayment">Pago de factura N° : {{ payment.id }}</h4>
                        </div>
                        <div class="modal-body">
                      
                           	  <div class="form-inline">
                           	  	<p>Fecha</p>

                           	  	<vuejs-datepicker :input-class="'width form-control'" :format="'yyyy-MM-dd'" v-model="payment.payment_date"></vuejs-datepicker>
                           	  </div>

                           	  <div class="form-inline" style="margin-top: 10px;">
                           	  	<p>Importe</p>
                           	  	<input style="width: 100%;" type="text" class="form-control" name="" placeholder="Importe" v-model="payment.payment_amount">
                           	  </div>

                           	  <div class="form-inline" style="margin-top: 10px;">
                           	  	<p>Pagado en</p>
                           	  	 <select class="form-control" style="width: 100%;" v-model="payment.payment_in">
                           	  	 	<option :value="'efectivo'">Efectivo</option>
                           	  	 	<option :value="'banco'">Banco</option>
                           	  	 </select>
                           	  </div>

                           	  <div class="form-inline" style="margin-top: 10px;" v-if="payment.payment_in === 'banco' ">
                           	  	<p>Información Bancaria</p>
                           	  	<textarea placeholder="Información Bancaria" style="width: 100%;" v-model="payment.bank_info"></textarea>
                           	  </div>
                         
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn bg-teal waves-effect">Guardar</button>
                            <button type="button" class="btn btn-link waves-effect" data-dismiss="modal">Cerrar</button>
                        </div>

                     </form>
                    </div>
                </div>
            </div>
	</div>

</template>

<script type="text/javascript">
   
    import {EventBus} from '../../vue-asset';
    import mixin from '../../mixin.js';
    import Datepicker from 'vuejs-datepicker';

  export default{
     
     name : 'create-payment',
     mixins : [mixin],

     components : {
       
       'vuejs-datepicker' : Datepicker,
          
     },

     data() {

     	return {
          
          payment : {

          	 id : '',
          	 payment_amount : 0,
          	 payment_date : '',
          	 payment_in : 'efectivo',
          	 bank_info : '',
          },

          errors : null,


         
     	}
     },



     created(){
      
       let vm = this;
      EventBus.$on('create-payment',function(id){
           
           vm.payment.id = id;
    

      });

     },

     methods : {


     	Payment(){

          axios.post(base_url+'payment',this.payment)
          .then(response => {
            
            this.successALert(response.data);
            this.resetForm();

           $('#smallModal').modal('hide');
           
            EventBus.$emit('invoice-created',1);

          })
          .catch(error => {
             
              if(error.response.status == 422){
            this.errors = error.response.data.errors;

           Swal( "Oops" ,  "¡por favor complete el formulario con los datos correctos!" ,  "error" );
            }
          else{
            this.successALert(error);
           }


          });

     	},

     	resetForm(){

              
          this.payment = {

          	 id : '',
          	 payment_amount : 0,
          	 payment_date : '',
          	 payment_in : 'efectivo',
          	 bank_info : '',
          }
     	},


     }

  }	 


</script>

<style type="text/css">
	.width{
		width: 100% !important;
	}
</style>