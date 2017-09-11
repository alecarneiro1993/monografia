/* global $ */
$(document).on('turbolinks:load', function() {
  $( function() {
    $( "#list_images, #list_answer" ).sortable({
      connectWith: ".connectedSortable"
    }).disableSelection();
  });
});