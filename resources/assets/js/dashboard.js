require('./vue-asset');
Vue.component('info-box', require('./components/dashboard/InfoBox.vue'));
// Vue.component('view-invoice', require('./components/invoice/ViewInvoice.vue'));

var app = new Vue({

    el: '#inventory'
});