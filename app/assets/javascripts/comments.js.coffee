# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ -> $(document).on 'click', '.dele_comment', -> $(this).parent().parent().parent().animate_from_to('.icon-trash')
