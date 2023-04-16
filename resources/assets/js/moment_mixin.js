// mixins for moment js ... recomanded to not include when you don't need it
import moment from 'moment';
export default{


   created(){
     
     // this.hello();

   },

   methods : {

  
   },

 filters: {
  moment: function (date,format) {
    return moment(date).format(format);
  }

},






}