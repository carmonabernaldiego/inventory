<template>
  <div class="wrap">
    <div class="modal fade" id="edit-stock" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="defaultModalLabel">Actualizar inventario</h4>
          </div>
          <div class="modal-body">
            <div class="alert alert-danger" v-if="errors">
              <ul>
                <li v-for="error in errors">{{ error[0] }}</li>
              </ul>
            </div>
            <form>
              <div class="row">
                <div class="col-md-6">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">palette</i>
                    </span>
                    <div class="form-line">
                      <select class="form-control select2" v-model="stock.category" v-select="stock.category"
                        @change="findProduct()">
                        <option value>Selecciona una categoría</option>

                        <option v-for="(value, index) in categorys" :value="value.id">{{ value.name }}</option>
                      </select>
                    </div>
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">shopping_bag</i>
                    </span>
                    <div class="form-line">
                      <select class="form-control select2" v-model="stock.product" v-select="stock.product">
                        <option value>Selecciona un producto</option>

                        <option v-for="(value, index) in products" :value="value.id">{{ value.product_name }}</option>
                      </select>
                    </div>
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">supervisor_account</i>
                    </span>
                    <div class="form-line">
                      <select class="form-control select2" data-live-serach="true" v-model="stock.vendor"
                        v-select="stock.vendor">
                        <option value>Selecciona un proveedor</option>

                        <option v-for="(vd, index) in vendors" :value="vd.id">{{ vd.name }}</option>
                      </select>
                    </div>
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">playlist_add_check</i>
                    </span>
                    <div class="form-line">
                      <input type="text" class="form-control" placeholder="Comprobante No:" title="Comprobante No:"
                        v-model="stock.chalan_no" disabled />
                    </div>
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">attach_money</i>
                    </span>
                    <div class="form-line">
                      <input type="text" class="form-control" placeholder="Precio de compra"
                        v-model="stock.buying_price" />
                    </div>
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">attach_money</i>
                    </span>
                    <div class="form-line">
                      <input type="text" class="form-control" placeholder="Precio de venta"
                        v-model="stock.selling_price" />
                    </div>
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">add</i>
                    </span>
                    <div class="form-line">
                      <input type="text" class="form-control" placeholder="Cantidad " v-model="stock.current_quantity"
                        disabled />
                    </div>
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">assignment</i>
                    </span>
                    <div class="form-line">
                      <input type="text" class="form-control" placeholder="Nota" title="Nota" v-model="stock.note" />
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <br />
            <button @click="updateStock(stock.id)" type="button" class="btn btn-success waves-effect">Actualizar</button>
            <button @click="resetForm()" type="button" class="btn btn-default waves-effect"
              data-dismiss="modal">Cerrar</button>
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
  props: ["vendors", "categorys"],
  mixins: [mixin],

  data() {
    return {
      stock: {
        id: "",
        product: "",
        category: "",
        vendor: "",
        quantity: "",
        current_quantity: "",
        buying_price: "",
        selling_price: "",
        note: "",
        chalan_no: "",
      },

      products: [],

      errors: null,
    };
  },

  created() {
    let vm = this;

    EventBus.$on("edit-stock", function (id, category_id) {
      vm.stock.id = id;
      vm.stock.category = category_id;
      vm.editStock(id);
      vm.findProduct();
      $("#edit-stock").modal("show");
    });

    $("#edit-stock").on("hidden.bs.modal", function () {
      vm.resetForm();
    });
  },

  methods: {
    editStock(id) {
      axios.get(base_url + "stock/" + id + "/edit").then((response) => {
        this.stock = {
          id: response.data.id,
          product: response.data.product_id,
          category: response.data.category_id,
          vendor: response.data.vendor_id,
          quantity: response.data.stock_quantity,
          current_quantity: response.data.current_quantity,
          buying_price: response.data.buying_price,
          selling_price: response.data.selling_price,
          note: response.data.note,
          chalan_no: response.data.chalan_no,
        };
      });
    },

    findProduct() {
      if (this.stock.category === "") {
        this.products = [];
      } else {
        this.products = [];
        axios
          .get(base_url + "category/product/" + this.stock.category)
          .then((response) => {
            this.products = response.data;
          });
      }
    },

    updateStock(id, e) {
      if (this.stock.state === "yes") {
        if (this.stock.quantity <= 0) {
          alert("Por favor ingrese la cantidad de cambio");
          e.preventDefault();
        }
      }

      axios
        .post(base_url + "stock/update/" + id, this.stock)

        .then((response) => {
          $("#edit-stock").modal("hide");

          this.resetForm();

          this.errors = null;
          EventBus.$emit("stock-created", response.data);

          this.successALert(response.data);
        })
        .catch((err) => {
          if (err.response) {
            this.errors = err.response.data.errors;
          }
        });
    },
    resetForm() {
      this.stock = {
        product: "",
        vendor: "",
        quantity: "",
        buying_price: "",
        selling_price: "",
        note: "",
        category: "",
      };
    },
  },
};
</script>