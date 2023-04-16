// this mixin file excluding moment
import moment from 'moment';
export default{


   created(){
     
     // this.hello();

   },

   methods : {

   
      successALert(data){
           
        console.log(data)
				Swal({
					position: 'top-end',
					type: data.status,
					title: data.message,
					showConfirmButton: false,
					timer: 1500
				})
			},
   },




mounted(){
    
  $('.select2').select2();

  // $('.multiselect__input').addClass('form-control');

},

directives: {
  select: {
    twoWay: true,
  bind: function (el, binding, vnode) {
    $(el).select2().on("select2:select", (e) => {
      // v-model looks for
      //  - an event named "change"
      //  - a value with property path "$event.target.value"
      el.dispatchEvent(new Event('change', { target: e.target }));
    });
  }
  }
},
watch: {
  value: function (value) {
    // update value
    $(this.$el).val(value)
  },
  options: function (options) {
    // update options
    $(this.$el).select2({ data: options })
  }
},
destroyed: function () {
  $(this.$el).off().select2('destroy')
}

}