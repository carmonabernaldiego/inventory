require('./vue-asset');
Vue.component('create-role', require('./components/role/CreateRole.vue'));
Vue.component('view-role', require('./components/role/ViewRole.vue'));

var app = new Vue({
    el: '#inventory'
});