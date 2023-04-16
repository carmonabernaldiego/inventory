require('./vue-asset');
Vue.component('create-product', require('./components/product/CreateProduct.vue'));
Vue.component('view-product', require('./components/product/ViewProduct.vue'));



var app = new Vue({

    el: '#inventory'
});