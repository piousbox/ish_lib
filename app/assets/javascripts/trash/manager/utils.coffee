
$(document).ready ->

  # footer
  is_footer_expanded = false
  $('.menuAddToggle').click ->
    self = this
    $(this).next().slideToggle 0, ->
      if is_footer_expanded
        $('.Lmanager > .content').css('padding-bottom', '0')
        is_footer_expanded = false
      else
        this_height = $('.footer-main-wrapper').height() - $('.menuAddToggle').height()
        $('.Lmanager > .content').css( 'padding-bottom', this_height )
        is_footer_expanded = true

      $(document).scrollTop( $('.footer-main-wrapper .menuAddToggle').offset().top )
					

  # header
  $('.menuAddTogglePrevious').click ->
    $(this).prev().slideToggle 0
    $(document).scrollTop( $(body).offset().top )
      