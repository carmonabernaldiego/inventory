<template>
  <div class="wrap">
    <div class="body" style="position: relative;">
      <update-invoice :categorys="categorys" :customers="customers"></update-invoice>
      <create-payment></create-payment>
      <view-payment></view-payment>

      <div class="row">
        <div class="col-md-6">
          <input type="text" class="form-control " v-on:keyup="getData(1)" v-model="invoice_id"
            placeholder="Buscar por número de factura">
        </div>
        <div class="col-md-6">
          <select class="form-control  select2" data-live-serach="true" @change="getData(1)" v-model="customer_id"
            v-select="customer_id">
            <option value="">Todos los clientes</option>

            <option v-for="(customer, index) in customers" :value="customer.id">{{ customer.customer_name }}</option>
          </select>
        </div>
        <div class="col-md-4">

          <!--  <vuejs-datepicker :input-class="'form-control'" :format="'yyyy-MM-dd'" value-format="yyyy-MM-dd" :value="start_date"></vuejs-datepicker> -->


        </div>



      </div>

      <div class="loading" v-if="isLoading">
        <h2 style="text-align:center">Cargando.......</h2>
      </div>

      <div class="table-responsive" v-else>

        <table class="table table-condensed table-hover table-bordered">
          <thead>
            <tr>
              <th>Facturación</th>
              <th>Fecha</th>
              <th>Cliente</th>
              <th>Monto total</th>
              <th>Pagado</th>
              <th>Debido</th>
              <th>Vendido por</th>
              <th>Pagos</th>
              <th>Abonar</th>
              <th>Imprimir</th>
              <th>Editar</th>
              <th>Eliminar</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(value, index) in invoices.data">
              <td>{{ value.id }}</td>
              <td>{{ value.sell_date | moment('LL') }}</td>
              <td>{{ value.customer.customer_name }}</td>
              <td>{{ value.total_amount }}</td>
              <td>{{ value.paid_amount }}</td>
              <td v-bind:class="{
                'text-success': value.payment_status === 1,
                'text-danger': value.payment_status === 0
              }">
                {{ value.total_amount - value.paid_amount }}
              </td>
              <td>{{ value.user.name }}</td>


              <td>
                <a @click.prevent="ViewPayment(value.id)" href="" data-toggle="modal" data-target="#viewPayment"
                  class="btn bg-cyan btn-circle waves-effect waves-circle waves-float"><i
                    class="material-icons">remove_red_eye</i></a>
              </td>
              <td>
                <a @click.prevent="CreatePayment(value.id)" href="" data-toggle="modal" data-target="#smallModal"
                  class="btn bg-blue-grey btn-circle waves-effect waves-circle waves-float"><i
                    class="material-icons">attach_money</i></a>
              </td>

              <td>

                <a :href="url + value.id" target="_blank" type="button"
                  class="btn bg-orange btn-circle waves-effect waves-circle waves-float">
                  <i class="material-icons">print</i>
                </a>
              </td>

              <td>

                <button @click="editInvoice(value.id)" type="button"
                  class="btn bg-blue btn-circle waves-effect waves-circle waves-float">
                  <i class="material-icons">edit</i>
                </button>
              </td>

              <td>
                <button @click="deleteInvoice(value.id)" type="button"
                  class="btn bg-pink btn-circle waves-effect waves-circle waves-float">
                  <i class="material-icons">delete</i>
                </button>

              </td>


            </tr>

          </tbody>

        </table>

      </div>

      <pagination :pageData="invoices"></pagination>

    </div>
  </div>
</template>

<script>

import { EventBus } from '../../vue-asset';
import mixin from '../../mixin.js';
import MomentMixin from '../../moment_mixin.js';
import Pagination from '../pagination/pagination.vue';

import Datepicker from 'vuejs-datepicker';
import UpdateInvoice from './UpdateInvoice.vue';
import CreatePayment from './CreatePayment.vue';
import ViewPayment from './ViewPayment.vue';



export default {

  props: ['categorys', 'customers'],

  mixins: [mixin, MomentMixin],

  components: {

    //     'edit-stock' : editStock,
    'update-invoice': UpdateInvoice,
    'create-payment': CreatePayment,
    'view-payment': ViewPayment,
    'vuejs-datepicker': Datepicker,
    'pagination': Pagination,

  },

  data() {

    return {

      invoice_id: '',
      customer_id: '',
      start_date: new Date('2019-02-03'),
      end_date: '',
      invoices: [],
      format: 'yyyy-MM-dd',
      url: base_url + 'invoice/',
      isLoading: true,

    }


  },
  created() {


    // this.hello();

    var _this = this;
    this.getData();

    EventBus.$on('invoice-created', function () {
      _this.getData();
    });

  },

  methods: {

    getData(page = 1) {

      this.isLoading = true;
      axios.get(base_url + "invoice-list?page=" + page + "&customer_id=" + this.customer_id + "&invoice_id=" + this.invoice_id + "&start_date=" + this.end_date + "&end_date=" + this.start_date).then(response => {
        this.invoices = response.data;
        this.isLoading = false;

      }).catch(error => {

        console.log(error);
      })
    },


    // edit vendor 

    editInvoice(id) {

      EventBus.$emit('edit-invoice', id);

    },
    // delete vendor 

    deleteInvoice(id) {

      Swal({
        title: '¿Estás seguro?',
        text: "¡No podrás revertir esto!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: "Cancelar",
        confirmButtonText: '¡Sí, eliminar!'
      }, () => {

      }).then((result) => {
        if (result.value) {

          axios.get(base_url + 'invoice/delete/' + id)
            .then(res => {

              EventBus.$emit('invoice-created', 1);

              this.successALert(res.data);

            })


        }
      })


    },

    CreatePayment(id) {

      EventBus.$emit('create-payment', id);
    },

    ViewPayment(id) {

      EventBus.$emit('view-payment', id);

    },

    // this function will called from pagination components 
    pageClicked(pageNo) {
      var vm = this;
      vm.getData(pageNo);
    },




  },

  computed: {



  },



}





</script>