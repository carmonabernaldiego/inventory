require('./vue-asset');
Vue.component('create-customer', require('./components/customer/CreateCustomer.vue'));
Vue.component('view-customer', require('./components/customer/ViewCustomer.vue'));

var app = new Vue({

    el: '#inventory'
});