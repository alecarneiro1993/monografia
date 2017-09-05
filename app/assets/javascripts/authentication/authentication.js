/* global $ */
$(document).on('turbolinks:load', function() {
  //Select Role on Click - Register Page
    $( ".role_button" ).click(function() {
        $(".role_button").removeAttr("id");
        $(this).attr('id', 'role_selected');
        console.log("oi");
        if($(this).text() == "Aluno")
            $(".hidden_role").val("1");
        else
            $(".hidden_role").val("2");
    });
    
    
});
    
