require('./vue-asset');
Vue.component('report-form', require('./components/report/ReportForm.vue'));

var app = new Vue({
    el: '#inventory'
});