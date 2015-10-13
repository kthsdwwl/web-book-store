# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ -> $(document).on 'click', '.book_img', -> $(this).parent().find(':submit').click()

$ -> $(document).on 'click', '.add_btn', -> $(this).parent().parent().parent().parent().find('img').animate_from_to('.total_line')
  
$ -> $(document).on 'DOMNodeInserted', -> $('#my-carousel').carousel()

$ -> $('#my-carousel').carousel()

