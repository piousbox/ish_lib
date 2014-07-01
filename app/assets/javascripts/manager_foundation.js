//
//
//= require jquery-1.7.1
//= require foundation/foundation
//

$(document).ready(function() {

  /* tinyMCE.init({
    // mode: 'textareas',
    mode: 'specific_textareas',
    editor_selector: 'tinymce',
    theme: 'advanced'
  }); */

  $('.addToggle').click(function() {
      $(this).next().toggle(500);
  });

});

