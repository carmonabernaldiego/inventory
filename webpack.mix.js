let mix = require("laravel-mix");

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js("resources/assets/js/app.js", "public/js");
mix.js("resources/assets/js/vendor.js", "public/js");
mix.js("resources/assets/js/product.js", "public/js");
mix.js("resources/assets/js/stock.js", "public/js");
mix.js("resources/assets/js/category.js", "public/js");
mix.js("resources/assets/js/invoice.js", "public/js");
mix.js("resources/assets/js/report.js", "public/js");
mix.js("resources/assets/js/role.js", "public/js");
mix.js("resources/assets/js/user.js", "public/js");
mix.js("resources/assets/js/customer.js", "public/js");
mix.js("resources/assets/js/dashboard.js", "public/js");
//mix.sass("resources/assets/sass/app.scss", "public/css");
