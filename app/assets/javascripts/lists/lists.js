/* global $ */
$(document).on('turbolinks:load', function() {
  
  //Throw left and right questions in new list
  $("input[type='button']").click(function(){
    if($(this).attr("id") == "throw_left") {
      $("#questions_list_container :selected").appendTo("#questions_container");
    } else {
      $("#questions_container :selected").appendTo("#questions_list_container");
    }
  });
});