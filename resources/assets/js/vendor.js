require('./vue-asset');

Vue.component('create-vendor', require('./components/vendor/CreateVendor.vue'));
Vue.component('view-vendor', require('./components/vendor/ViewVendor.vue'));

var app = new Vue({
    el: '#inventory'
});