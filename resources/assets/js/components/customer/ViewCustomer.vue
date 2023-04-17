<template>
  <div class="wrap">
    <div class="body">
      <div class="row">
        <div class="col-md-4">
          <input type="text" class="form-control" v-on:keyup="getData()" placeholder="Buscar por nombre" name=""
            v-model="name">
        </div>
        <div class="col-md-4">
          <input type="text" class="form-control" v-on:keyup="getData()" placeholder="Buscar por correo" name=""
            v-model="email">
        </div>
        <div class="col-md-4">
          <input type="text" class="form-control" v-on:keyup="getData()" placeholder="Buscar por teléfono" name=""
            v-model="phone">
        </div>
      </div>

      <div class="loading" v-if="isLoading">
        <h2 style="text-align:center">Cargando.......</h2>
      </div>

      <div class="table-responsive" v-else>
        <table class="table table-condensed table-hover">
          <thead>
            <tr>
              <th>Nombre</th>
              <th>Correo electrónico</th>
              <th>Teléfono</th>
              <th>Dirección</th>
              <th>Importe comprado</th>
              <th>Importe pagado</th>
              <th>Importe debido</th>
              <th>Editar</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(value, index) in customers.data" v-bind:key="index">
              <td>{{ value.customer_name }}</td>
              <td>{{ value.email }}</td>
              <td>{{ value.phone }}</td>
              <td>{{ value.address }}</td>
              <td>{{ value.total_amount }}</td>
              <td>{{ value.total_paid_amount }}</td>
              <td>{{ value.total_amount - value.total_paid_amount }}</td>
              <td>
                <button @click="editcustomer(value.id)" type="button"
                  class="btn bg-blue btn-circle waves-effect waves-circle waves-float">
                  <i class="material-icons">edit</i>
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <pagination :pageData="customers"></pagination>

      <div class="row">
        <update-customer></update-customer>
      </div>
    </div>
  </div>
</template>

<script>
import { EventBus } from "../../vue-asset";
import mixin from "../../mixin";

import UpdateCustomer from "./UpdateCustomer.vue";
import Pagination from '../pagination/pagination.vue';

export default {
  mixins: [mixin],

  components: {
    "update-customer": UpdateCustomer,
    "pagination": Pagination,
  },

  data() {
    return {
      customers: [],
      name: "",
      email: "",
      phone: "",
      isLoading: true,
    };
  },
  created() {
    var _this = this;
    this.getData();

    EventBus.$on("customer-created", function () {
      _this.getData();
    });
  },

  methods: {
    getData(page = 1) {
      this.isLoading = true;
      axios
        .get(
          base_url +
          "customer-list?page=" +
          page +
          "&name=" +
          this.name +
          "&email=" +
          this.email +
          "&phone=" +
          this.phone
        )
        .then(response => {
          // console.log(response.data);

          this.customers = response.data;
          this.isLoading = false;
        })
        .catch(error => {
          console.log(error);
        });
    },

    // edit vendor

    editcustomer(id) {
      EventBus.$emit("customer-edit", id);
    },

    showMessage(data) {
      if (data.status == "success") {
        toastr.success(data.message, "Success Alert", { timeOut: 500 });
      } else {
        toastr.error(data.message, "Error Alert", { timeOut: 500 });
      }
    },
    pageClicked(pageNo) {
      var vm = this;
      vm.getData(pageNo);
    }
  },

  computed: {



  }
};
</script>