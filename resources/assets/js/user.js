require('./vue-asset');
Vue.component('create-user', require('./components/user/CreateUser.vue'));
Vue.component('view-user', require('./components/user/ViewUser.vue'));

var app = new Vue({
    el: '#inventory'
});