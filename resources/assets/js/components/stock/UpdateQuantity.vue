<template>

	<div class="col-md-12">
				<div class="modal fade" id="edit-qty" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="defaultModalLabel">Actualizar cantidad de {{ product.product_name }}- {{ product.chalan_no }}</h4>
					</div>
					<div class="modal-body">
						<div class="alert alert-danger" v-if="errors">
							<ul>
								<li v-for="error in errors">{{ error[0] }}</li>
							</ul>
						</div>
						<form>
							<div class="row">
								<div class="col-md-12">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">palette</i>
										</span>
										<div class="form-line">
											<select class="form-control" v-model="product.state">
												<option :value="''">¿Tú quieres?</option>
												<option :value="'+'">+</option>
												<option :value="'-'">-</option>
											</select>
										</div>
									</div>
								</div>  	

								<div class="col-md-12">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">palette</i>
										</span>
										<div class="form-line">
											<input type="number" class="form-control date" placeholder="Cantidad para actualizar" v-model="product.new_qty">
										</div>
									</div>
								</div>        


								</div>

						
						</form>

					</div>
					<div class="modal-footer">
						<br>
						<button @click="updateproduct()" type="button" class="btn btn-success waves-effect">Actualizar</button>
						<button @click="closeModal()" type="button" class="btn btn-default waves-effect" data-dismiss="modal">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</template>

<script>

import {EventBus} from '../../vue-asset';
import mixin from '../../mixin';

	
export default{
 
 name : 'update-qty',

 mixins:[mixin],

 data(){
   
   return{
      
      product : {
         
         id : 0,
         current_qty : 0,
         new_qty : 0,
         state : '',
         product_name : '',
         chalan_no : '',

      },

      errors : null

   }

 },

 created(){

 	let vm = this;

 	EventBus.$on('edit-qty',function(id){
    
     vm.product.id = id;

     vm.editproduct(id);

     $('#edit-qty').modal('show');
     
 	});

 	 $('#edit-qty').on('hidden.bs.modal', function(){
            vm.closeModal();
            });



 },

 methods : {

 


   editproduct(id){
    
    axios.get(base_url+'stock/'+id+'/edit')

     .then(response => {
      
       
       this.product = {
       	id:response.data.id,
       	product_name:response.data.product.product_name,
       	current_qty:response.data.current_quantity,
       	chalan_no:response.data.chalan_no,
       }

     })

   },
    updateproduct(){
        
        axios.post(base_url+'stock-update',this.product)
        .then(res => {
         
              this.successALert(res.data);
              EventBus.$emit('stock-created',1);
              this.closeModal();
              $('#edit-qty').modal('hide');
   


        })
        .catch(err => {

        		if(err.response){
                   
                   this.errors = err.response.data.errors;
				}
        })

   },
   


   closeModal(){

   	this.errors = null;
    this.product = {'id':0,'name':''};
    EventBus.$emit('stock-created',1);
   }			




 }

}	



</script>