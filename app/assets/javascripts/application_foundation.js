// 
//= require global
// 
//= require jquery-1.7.1
//= require jquery_ujs
//= require jquery-ui.min
//
//= require jquery-file-upload/vendor/jquery.ui.widget
//= require jquery-file-upload/jquery.iframe-transport
//= require jquery-file-upload/jquery.fileupload
//
//= require tinymce
// 
//= require fancybox/jquery.fancybox.pack.js
//
//= require foundation/foundation
//
// require handlebars.runtime
// require_tree ./templates
// 
//= require_self
//= require ./photos_multiadd
//= require ./galleries
//= require ./utils
//

var U = {};

$(document).ready( function() {
    U.setup_accordion();    
    $(".fancybox").fancybox();
});

