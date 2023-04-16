<template>
  <div class="wrap">
    <div class="row" v-if="isLoading">
      <h1 style="text-align:center">Cargando......</h1>
    </div>

    <div class="row clearfix" v-if="!isLoading">
      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="info-box bg-teal hover-zoom-effect">
          <div class="icon">
            <i class="material-icons">contacts</i>
          </div>
          <div class="content">
            <div class="text">Clientes</div>
            <div class="number">{{ info.total_customer }}</div>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="info-box bg-orange hover-zoom-effect">
          <div class="icon">
            <i class="material-icons">people</i>
          </div>
          <div class="content">
            <div class="text">Proveedores</div>
            <div class="number">{{ info.total_vendor }}</div>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="info-box bg-deep-purple hover-zoom-effect">
          <div class="icon">
            <i class="material-icons">category</i>
          </div>
          <div class="content">
            <div class="text">Productos</div>
            <div class="number">{{ info.total_product }}</div>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="info-box bg-blue-grey hover-zoom-effect">
          <div class="icon">
            <i class="material-icons">receipt</i>
          </div>
          <div class="content">
            <div class="text">Facturas</div>
            <div class="number">{{ info.total_invoice }}</div>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="info-box bg-indigo hover-zoom-effect">
          <div class="icon">
            <i class="material-icons">local_mall</i>
          </div>
          <div class="content">
            <div class="text">Existencia total</div>
            <div class="number">
              <small>{{ info.total_quantity }}</small>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="info-box bg-pink hover-zoom-effect">
          <div class="icon">
            <i class="material-icons">local_shipping</i>
          </div>
          <div class="content">
            <div class="text">Existencia vendida</div>
            <div class="number">
              <small>{{ info.total_sold_quantity }}</small>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="info-box bg-blue hover-zoom-effect">
          <div class="icon">
            <i class="material-icons">bar_chart</i>
          </div>
          <div class="content">
            <div class="text">Existencia actual</div>
            <div class="number">
              <small>{{ info.total_current_quantity }}</small>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="info-box bg-deep-orange hover-zoom-effect">
          <div class="icon">
            <i class="material-icons">payment</i>
          </div>
          <div class="content">
            <div class="text">Importe vendido</div>
            <div class="number">
              <small>$ {{ info.total_sold_amount }}</small>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="info-box bg-green hover-zoom-effect">
          <div class="icon">
            <i class="material-icons">attach_money</i>
          </div>
          <div class="content">
            <div class="text">Importe pagado</div>
            <div class="number">
              <small>$ {{ info.total_paid_amount }}</small>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="info-box bg-red hover-zoom-effect">
          <div class="icon">
            <i class="material-icons">money_off</i>
          </div>
          <div class="content">
            <div class="text">Importe restante</div>
            <div class="number">
              <small>$ {{ info.total_outstanding }}</small>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="info-box bg-brown hover-zoom-effect">
          <div class="icon">
            <i class="material-icons">payments</i>
          </div>
          <div class="content">
            <div class="text">Beneficio bruto</div>
            <div class="number">
              <small>$ {{ info.total_gross_profit }}</small>
            </div>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <div class="info-box bg-cyan hover-zoom-effect">
          <div class="icon">
            <i class="material-icons">money</i>
          </div>
          <div class="content">
            <div class="text">Beneficio neto</div>
            <div class="number">
              <small>$ {{ info.total_net_profit }}</small>
            </div>
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
  data() {
    return {
      info: {},
      isLoading: true,
    };
  },

  created() {
    this.getData();
  },
  methods: {
    getData() {
      axios.get(base_url + "info-box").then((response) => {
        this.info = response.data;
        this.isLoading = false;
      });
    },
  },
};
</script>