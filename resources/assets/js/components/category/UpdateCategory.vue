<template>
	<div class="col-md-12">
		<div class="modal fade" id="update-category" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="defaultModalLabel">Actualizar información de categoría</h4>
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
											<i class="material-icons">category</i>
										</span>
										<div class="form-line">
											<input type="text" class="form-control date" placeholder="Nombre" v-model="category.name">
										</div>
									</div>
								</div>


							</div>


						</form>

					</div>
					<div class="modal-footer">
						<br>
						<button @click="updatecategory(category.id)" type="button"
							class="btn btn-success waves-effect">Actualizar</button>
						<button @click="closeModal()" type="button" class="btn btn-default waves-effect"
							data-dismiss="modal">Cancelar</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>

import { EventBus } from '../../vue-asset';
import mixin from '../../mixin';


export default {

	name: 'update-category',

	mixins: [mixin],

	data() {

		return {

			category: {

				id: 0,
				name: '',

			},

			errors: null

		}

	},

	created() {

		let vm = this;

		EventBus.$on('category-edit', function (id) {

			vm.category.id = id;

			vm.editcategory(id);

			$('#update-category').modal('show');

		});

		$('#update-category').on('hidden.bs.modal', function () {
			vm.closeModal();
		});



	},

	methods: {




		editcategory(id) {

			axios.get(base_url + 'category/' + id + '/edit')

				.then(response => {


					this.category = {
						id: response.data.id,
						name: response.data.name,
					}

				})

		},
		updatecategory(id) {

			axios.post(base_url + 'category/update/' + id, this.category)
				.then(res => {

					if (res.data.status == 'success') {

						this.successALert(res.data);
						EventBus.$emit('category-created', 1);
						this.closeModal();
						$('#update-category').modal('hide');
					}



				})
				.catch(err => {

					if (err.response) {

						this.errors = err.response.data.errors;
					}
				})

		},



		closeModal() {

			this.errors = null;
			this.category = { 'id': 0, 'name': '' };
			EventBus.$emit('category-created', 1);
		}




	}

}



</script>