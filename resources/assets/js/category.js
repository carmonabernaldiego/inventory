require('./vue-asset');
Vue.component('create-category', require('./components/category/CreateCategory.vue'));
Vue.component('view-category', require('./components/category/ViewCategory.vue'));



var app = new Vue({

    el: '#inventory'
});