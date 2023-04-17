<template>
	<div class="col-md-12">
		<div class="modal fade" id="assign-role" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="defaultModalLabel">Permiso de <span style="color: teal">{{ role.role_name
						}}</span></h4>
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
									<!-- 		<div class="demo-checkbox">
										<div class="col-md-4" v-for="value in menus">
										<input type="checkbox" :value="value.id" :id="value.id" class="filled-in chk-col-red" :checked="!value.check" v-model="role.checkedItem"/>
										<label>{{ value.name }}</label>
									   </div>

										
									</div> -->

									<div class="demo-checkbox" v-for="(value, index) in role.menus" :key="index">

										<div class="col-md-12">
											<hr v-if="index !== 0">
											<div style="font-weight: bold;" class="demo-switch-title">{{ value.name }}</div>

											<div class="switch">
												<label v-if="value.sub_menu.length === 0"><input :value="value.id" :id="value.id"
														v-model="value.check" type="checkbox" checked><span
														class="lever switch-col-blue"></span></label>
											</div>
											<!-- <hr style="border: 2px solid #ccc"> -->
										</div>
										<!-- sub menu  	 -->
										<div class="col-md-4" v-for="sub in value.sub_menu">
											<div class="demo-switch-title">{{ sub.name }}</div>
											<div class="switch">
												<label><input :value="sub.id" :id="sub.id" v-model="sub.check" type="checkbox" checked><span
														class="lever switch-col-blue"></span></label>
											</div>
										</div>

									</div>
								</div>


							</div>


						</form>

					</div>
					<div class="modal-footer">
						<br>
						<button @click="AssignRole" type="button" class="btn btn-success waves-effect">Actualizar</button>
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

	name: 'assign-role',

	mixins: [mixin],

	data() {

		return {

			role: {

				id: 0,
				role_name: '',
				menus: [],
			},



			errors: null

		}

	},

	created() {

		let vm = this;

		EventBus.$on('assign-permission', function (id) {

			vm.role.id = id;

			vm.RoleInfo(id);
			vm.getMenus(id);

			$('#assign-role').modal('show');

		});

		$('#assign-role').on('hidden.bs.modal', function () {
			vm.closeModal();
		});



	},

	methods: {

		RoleInfo(id) {

			axios.get(base_url + 'role/' + id + '/edit')

				.then(response => {
					this.role.id = response.data.id;
					this.role.role_name = response.data.role_name;
				})

		},

		getMenus(id) {

			axios.get(base_url + 'role/' + id)

				.then(response => {

					this.role.menus = response.data;
				})

		},
		AssignRole() {

			axios.post(base_url + 'permission', this.role)
				.then(res => {

					console.log(res);

					if (res.data.status == 'success') {
						this.successALert(res.data);
						EventBus.$emit('role-created', 1);
						this.closeModal();
						$('#assign-role').modal('hide');
					}
				})
				.catch(err => {

					if (err.response) {

						this.errors = err.response.data.errors;
					}
				})

		},



		closeModal() {
			EventBus.$emit('role-created', 1);
		}




	}

}



</script>