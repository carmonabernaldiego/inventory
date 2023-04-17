<template>
  <div class="wrap">
    <div class="modal fade" id="create-category" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title" id="defaultModalLabel">Información de categoría</h4>
          </div>
          <div class="modal-body">
            <div class="alert alert-danger" v-if="errors">
              <ul>
                <li v-for="error in errors">{{ error[0] }}</li>
              </ul>
            </div>
            <form>
              <div class="row">
                <div class="col-md-12">
                  <div class="input-group">
                    <span class="input-group-addon">
                      <i class="material-icons">category</i>
                    </span>
                    <div class="form-line">
                      <input type="text" class="form-control date" placeholder="Nombre" v-model="category.name" />
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <br />
            <button @click="createCategory" type="button" class="btn btn-success waves-effect">Guardar</button>
            <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Cancelar</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { EventBus } from "../../vue-asset";
import mixin from "../../mixin";

export default {
  mixins: [mixin],

  data() {
    return {
      category: {
        name: "",
      },

      errors: null,
    };
  },

  methods: {
    createCategory() {
      axios
        .post(base_url + "category", this.category)

        .then((response) => {
          $("#create-category").modal("hide");

          this.category = { name: "", details: "" };
          this.errors = null;
          EventBus.$emit("category-created", response.data);

          // this.showMessage(response.data);

          this.successALert(response.data);
        })
        .catch((err) => {
          if (err.response) {
            this.errors = err.response.data.errors;
          }
        });
    },
  },

  // end of method section

  created() { },
};
</script>