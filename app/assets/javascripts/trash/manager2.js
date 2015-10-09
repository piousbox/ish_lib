//
//
//= require jquery-1.7.1
//
//= require lightbox
//= require tinymce
//= require foundation/foundation
// 
//= require ./manager/utils
//

$(document).ready(function() {
  tinyMCE.init({
    // mode: 'textareas',
    mode: 'specific_textareas',
    editor_selector: 'tinymce',
    theme: 'advanced'
  });
});

// for wikitravel
/*
function are_ads_hidden() { true };
function wtIsLoggedIn() { false };
*/
