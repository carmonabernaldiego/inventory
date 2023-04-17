<template>
  <div class="col-md-12">
    <div class="modal fade" id="update-vendor" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="defaultModalLabel">Actualizar Informacion del proveedor</h4>
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
                      <i class="material-icons">person</i>
                    </span>
                    <div class="form-line">
                      <input type="text" class="form-control date" placeholder="Nombre" v-model="vendor.name" />
                    </div>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">email</i>
                    </span>
                    <div class="form-line">
                      <input type="text" class="form-control date" placeholder="Correo electrónico"
                        v-model="vendor.email" />
                    </div>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">phone</i>
                    </span>
                    <div class="form-line">
                      <input type="text" class="form-control date" placeholder="Telefono" v-model="vendor.phone" />
                    </div>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">map</i>
                    </span>
                    <div class="form-line">
                      <input type="text" class="form-control date" placeholder="Dirección" v-model="vendor.address" />
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <br />
            <button @click="updateVendor(vendor.id)" type="button"
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
import { EventBus } from "../../vue-asset";
import mixin from "../../mixin";

export default {
  mixins: [mixin],

  name: "update-vendor",

  data() {
    return {
      vendor: {
        id: 0,
        name: "",
        email: "",
        phone: "",
        adress: "",
      },

      errors: null,
    };
  },

  created() {
    let vm = this;

    EventBus.$on("vendor-edit", function (id) {
      vm.vendor.id = id;

      vm.editVendor(id);

      $("#update-vendor").modal("show");
    });

    $("#update-vendor").on("hidden.bs.modal", function () {
      vm.closeModal();
    });
  },

  methods: {
    editVendor(id) {
      axios
        .get(base_url + "supplier/" + id + "/edit")

        .then((response) => {
          this.vendor = {
            id: response.data.id,
            name: response.data.name,
            email: response.data.email,
            phone: response.data.phone,
            address: response.data.address,
          };
        });
    },
    updateVendor(id) {
      axios
        .post(base_url + "supplier/update/" + id, this.vendor)
        .then((res) => {
          if (res.data.status == "success") {
            this.successALert(res.data);
            EventBus.$emit("vendor-created", 1);
            this.closeModal();
            $("#update-vendor").modal("hide");
          }
        })
        .catch((err) => {
          if (err.response) {
            this.errors = err.response.data.errors;
          }
        });
    },

    closeModal() {
      this.errors = null;
      this.vendor = { id: 0, name: "", email: "", phone: "", address: "" };
      EventBus.$emit("vendor-created", 1);
    },
  },
};
</script>