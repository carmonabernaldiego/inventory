require('./vue-asset');
Vue.component('create-invoice', require('./components/invoice/CreateInvoice.vue'));
Vue.component('view-invoice', require('./components/invoice/ViewInvoice.vue'));

var app = new Vue({

    el: '#inventory'
});