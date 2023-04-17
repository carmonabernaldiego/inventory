<template>
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div v-show="invoice_state" class="card">
      <div class="header">
        <h2 class="pull-left">
          Update Invoice

        </h2>

        <h2 class="pull-right">
          <a href="" @click.prevent="showInvoice" class="btn bg-red btn-circle waves-effect waves-circle waves-float">
            <i class="material-icons">close</i>
          </a>

        </h2>
      </div>

      <div class="body">

        <form @submit.prevent="store()">

          <div class="row">
            <div class="col-md-4">
              <!-- <p>Customer</p> -->
              <div class="input-group">
                <span class="input-group-addon">
                  <i class="material-icons">person</i>
                </span>
                <div class="form-line">
                  <select class="form-control" v-model="invoice.customer_id">
                    <option value="">Customer List</option>

                    <option v-for="customer in customers" :value="customer.id">
                      {{ customer.customer_name }}
                    </option>

                  </select>
                  <span class="requiredField" v-if="(errors.hasOwnProperty('customer_id'))">
                    {{ (errors.hasOwnProperty('customer_id')) ? errors.customer_id[0] : '' }}
                  </span>
                </div>
              </div>
            </div>
          </div>

          <div class="row">

            <div class="col-md-4">
              <p>Invoice Number</p>
              <div class="input-group">
                <span class="input-group-addon">
                  <i class="material-icons">person</i>
                </span>
                <div class="form-line">
                  <input class="form-control" type="text" disabled name="" v-model="invoice.invoice_no">
                </div>
              </div>
            </div>

            <div class="col-md-4">
              <p>Invoice Date</p>
              <div class="input-group">
                <span class="input-group-addon">
                  <i class="material-icons">person</i>
                </span>
                <div class="form-line">
                  <vuejs-datepicker :input-class="'form-control'" :format="'yyyy-MM-dd'" value-format="yyyy-MM-dd"
                    v-model="invoice.invoice_date"></vuejs-datepicker>
                  <span class="requiredField" v-if="(errors.hasOwnProperty('invoice_date'))">
                    {{ (errors.hasOwnProperty('invoice_date')) ? errors.invoice_date[0] : '' }}
                  </span>
                </div>
              </div>
            </div>

          </div>


          <!-- main invoice part  -->

          <div class="row">
            <div class="table-responsive">

              <table class="table table-bordered table-condensed">

                <thead class="bg-teal">
                  <tr>
                    <th>#</th>
                    <th>Category</th>
                    <th>Product</th>
                    <th>Comprobante</th>
                    <th>QTY</th>
                    <th>Price</th>
                    <th>Discount</th>
                    <th>Dis Type</th>
                    <th>Total</th>
                  </tr>
                </thead>

                <tbody>

                  <tr v-for="(vl, index) in invoice.product">
                    <td>
                      <a href="" @click.prevent="removeItem(index)" style="color: red">
                        <i class="material-icons">delete</i>
                      </a>
                    </td>
                    <td>
                      <select class="form-control" v-model="invoice.product[index].category" @change="findProduct(index)">
                        <option value="">Select Category</option>
                        <option v-for="(value, index) in categorys" :value="value.id">{{ value.name }}</option>

                      </select>
                      <span v-if="errors['product.' + index + '.category']" class="requiredField">{{
                        errors['product.' + index + '.category'][0] }}</span>
                    </td>

                    <td>
                      <select class="form-control" v-model="invoice.product[index].product_id" @change="findStock(index)">
                        <option value="">Select Product</option>

                        <option v-for="pr in vl.products" :value="pr.id">{{ pr.product_name }}</option>

                      </select>
                      <span v-if="errors['product.' + index + '.product_id']" class="requiredField">{{
                        errors['product.' + index + '.product_id'][0] }}</span>
                    </td>

                    <td>
                      <select class="form-control" v-model="invoice.product[index].chalan_id"
                        @change="findStockDetails(index)">
                        <option value="">Select Comprobante</option>
                        <option v-for="ch in vl.stocks" :value="ch.id">{{
                          ch.chalan_no }}. qty({{ ch.current_quantity }})</option>
                      </select>

                      <span v-if="errors['product.' + index + '.chalan_id']" class="requiredField">{{
                        errors['product.' + index + '.chalan_id'][0] }}</span>
                    </td>

                    <td>
                      <input class="form-control" type="number" name="" v-model="invoice.product[index].quantity"
                        v-bind:disabled="vl.chalan_id === ''" placeholder="QTY">

                      <span v-if="errors['product.' + index + '.quantity']" class="requiredField">{{
                        errors['product.' + index + '.quantity'][0] }}</span>
                    </td>

                    <td>
                      <input class="form-control" type="text" name="" v-model="invoice.product[index].price"
                        placeholder="price" value="">

                      <span v-if="errors['product.' + index + '.price']" class="requiredField">{{
                        errors['product.' + index + '.price'][0] }}</span>
                    </td>

                    <td>
                      <input class="form-control" type="text" name="" v-model.double="invoice.product[index].discount"
                        placeholder="Discount">

                      <span v-if="errors['product.' + index + '.discount']" class="requiredField">{{
                        errors['product.' + index + '.discount'][0] }}</span>
                    </td>

                    <td>
                      <select class="form-control" v-model="invoice.product[index].discount_type">
                        <option value="1">Importe</option>
                        <option value="2">%</option>
                      </select>
                    </td>

                    <!-- for getting discount amount  -->

                    <input type="hidden"
                      :value="vl.discount_amount = discount(invoice.product[index].discount_type, invoice.product[index].discount, vl.total_price)">

                    <td>
                      <input class="form-control" type="text" name="" placeholder="Total" disabled=""
                        :value="vl.total_price = vl.quantity * vl.price - vl.discount_amount">
                    </td>

                  </tr>
                </tbody>



              </table>

            </div>
            <div class="row">
              <div class="col-md-12">
                <a href="" @click.prevent="addmore" class="btn bg-teal">+ Add More</a>
              </div>

            </div>
          </div>

          <!-- main invoice part  -->

          <div class="row">
            <div class="col-md-8">

            </div>

            <div class="col-md-4">
              <div class="form-group">
                <label>Total Price: &nbsp;</label>
                <div class="input-group focused">
                  <div class="input-group-addon">$</div>
                  <!--                                   <input type="number" class="form-control" name="sub_total"  :value="invoice.total_amount = totalAmount + totalDiscount" placeholder="Subtotal" disabled=""> -->
                  <label>{{ invoice.total_amount = totalAmount + totalDiscount }}</label>
                </div>
              </div>


              <div class="form-group">
                <label>Total Discount: &nbsp;</label>
                <div class="input-group focused">
                  <div class="input-group-addon">$</div>
                  <label>{{ invoice.total_disount = totalDiscount }}</label>
                </div>
              </div>

              <div class="form-group">
                <label>Net Payable Importe: &nbsp;</label>
                <div class="input-group focused">
                  <div class="input-group-addon">$</div>
                  <label>{{ invoice.grand_total = totalAmount }}</label>
                </div>
              </div>


              <div class="form-group">
                <label>Paid Importe: &nbsp;</label>
                <div class="input-group focused">
                  <div class="input-group-addon"></div>

                  <input type="text" class="form-control" v-model="invoice.paid_amount" placeholder="Pay Now"
                    style="border-bottom: 1px solid #ccc;" disabled="">
                </div>
              </div>



              <div class="form-group">
                <label>Due Importe</label>
                <div class="input-group focused">
                  <div class="input-group-addon">$</div>
                  <label>{{ invoice.grand_total - invoice.paid_amount }}</label>

                </div>
              </div>

              <div class="form-group">
                <button type="submit" class="btn bg-teal">Submit</button>
              </div>


            </div>

          </div>

        </form>


      </div>



    </div>
  </div>
</template>

<script>

import { EventBus } from '../../vue-asset';

import mixin from '../../mixin';

import Datepicker from 'vuejs-datepicker';


export default {

  props: ['categorys', 'customers'],
  mixins: [mixin],

  components: {

    'vuejs-datepicker': Datepicker,

  },

  data() {

    return {

      invoice: {
        invoice_no: '',
        customer_id: '',
        invoice_date: '',
        total_discount: 0,
        total_amount: 0,
        grand_total: 0,
        paid_amount: 0,
        product: [
          {
            category: '',
            product_id: '',
            chalan: '',
            chalan_id: '',
            stock_quantity: 0,
            quantity: 0,
            price: 0,
            total_price: 0,
            discount: 0,
            discount_type: 1,
            discount_amount: 0,
            products: [],
            stocks: [],
          }
        ],



      },

      invoice_state: false,
      errors: {},
    }

  },

  created() {
    var _this = this;
    EventBus.$on('edit-invoice', function (id) {


      _this.editData(id);
      _this.invoice_state = true;

      window.scrollTo(0, 0);

    });

  },

  methods: {

    // finding the data which have to be edit 
    editData(id) {

      axios.get(base_url + 'invoice/' + id + '/edit')

        .then(response => {


          this.invoice = response.data;

        })

    },


    // submit update data 

    store() {

      axios.post(base_url + 'invoice/update/' + this.invoice.invoice_no, this.invoice)
        .then(response => {

          this.successALert(response.data);

          this.resetForm();

          this.invoice_state = false;

          EventBus.$emit('invoice-created', 1);

        })
        .catch(error => {
          if (error.response.status == 422) {
            this.errors = error.response.data.errors;

            Swal("Oops", "¡por favor complete el formulario con los datos correctos!", "error");
          }
          else {
            this.successAlert(error);
          }
        });

    },

    // new product finding from database 

    findProduct(index) {

      if (this.invoice.product[index].category === '') {

        this.invoice.product[index].products = [];

      }
      else {

        axios.get(base_url + 'category/product/' + this.invoice.product[index].category)
          .then(response => {

            this.invoice.product[index].products = response.data;
            this.invoice.product[index].stocks = [];

          })

      }
    },


    // find stcok according to product 


    findStock(index) {

      if (this.invoice.product[index].product_id === '') {

        this.invoice.product[index].stocks = [];

      }
      else {

        axios.get(base_url + 'chalan-list/chalan/' + this.invoice.product[index].product_id)
          .then(response => {
            this.invoice.product[index].stocks = response.data;
          })
      }


    },


    findStockDetails(index) {

      if (this.invoice.product[index].chalan_id === '') {

        this.invoice.product[index].quantity = 0;
        this.invoice.product[index].price = 0;
        this.invoice.product[index].discount = 0;

      }
      else {

        axios.get(base_url + 'stock/' + this.invoice.product[index].chalan_id)
          .then(response => {

            this.invoice.product[index].quantity = 1;
            this.invoice.product[index].price = response.data.selling_price;
            this.invoice.product[index].discount = response.data.discount;
            this.invoice.product[index].stock_quantity = response.data.stock_quantity;

          })

      }
    },


    showInvoice() {

      this.invoice_state = !this.invoice_state;
      // $("html, body").animate({ scrollTop: 0 }, 800);

      axios.get(base_url + 'get/invoice/number')
        .then(response => {

          this.invoice.invoice_no = response.data;

        })


      window.scrollTo(0, top);
    },


    addmore() {

      this.invoice.product.push({
        category: '',
        product_id: '',
        chalan: '',
        chalan_id: '',
        stoc_quantity: 0,
        quantity: 0,
        price: 0,
        total_price: 0,
        discount: 0,
        discount_type: 1,
        discount_amount: 0,
        products: [],
        stocks: [],
      });
    },



    removeItem(index) {

      var _this = this;
      if (_this.invoice.product.length > 1) {
        _this.invoice.product.splice(index, 1);
        // _this.totalPrice(index);
      }

    },

    resetForm() {

      this.invoice = {
        invoice_no: '',
        customer_id: '',
        invoice_date: '',
        total_discount: 0,
        total_amount: 0,
        grand_total: 0,
        paid_amount: 0,
        product: [
          {
            category: '',
            product_id: '',
            chalan: '',
            chalan_id: '',
            stock_quantity: 0,
            quantity: 0,
            price: 0,
            total_price: 0,
            discount: 0,
            discount_type: '1',
            discount_amount: 0,
            products: [],
            stocks: [],
          }
        ],


      }

    },

    discount(type, discount, main_amount) {


      if (type === 2) {

        return parseFloat(((discount / 100) * main_amount)).toFixed(2);
      }

      else {

        return parseFloat(discount).toFixed(2);

      }
    }





  },

  // end of method section 


  computed: {

    totalAmount() {
      let sum = 0;
      this.invoice.product.forEach(function (item) {
        sum += item.total_price;
      });

      return sum;


    },

    totalDiscount() {
      let sum = 0;
      this.invoice.product.forEach(function (item) {
        sum = +sum + +item.discount_amount;
      });

      return sum;
    }


  },






}





</script>

<style type="text/css">.requiredField {

  color: red;
}</style>