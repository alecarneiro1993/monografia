/* global $ */

$(document).on('turbolinks:load', function() {


  //Compare arrays function
  function arraysEqual(arr1, arr2, errorArr) {
    if(arr1.length !== arr2.length) {
      errorArr.push("Number of instructions is incorrect.");
      $(".correct_input").val(false);
      return errorArr;
    }

    for(var i = 0; i < arr1.length; i++) {
        if(arr1[i] !== arr2[i])  {
          errorArr.push("Instruction in position " + (i+1) + " is incorrect.");
        }
    }
    return errorArr;
}

  //Array containing questions ids
  var idsArray = [];

  //Throw left and right questions in new list
  $("input[type='button']").click(function(){
    if($(this).attr("id") == "throw_left") {
      $("#questions_list_container :selected").appendTo("#questions_container");

    } else {
      $("#questions_container :selected").appendTo("#questions_list_container");
    }

    idsArray = $('#questions_list_container option').map(function () {
      return $(this).val();
    }).get();
    idsArray = idsArray.map(Number);
    console.log(idsArray);
    $("#list_list_questions").val(idsArray);
    console.log("question ids " + $("#list_question_ids").val());
  });

  //COMPARE ANSWERS FUNCTON
  if($(".question_list_answer").length > 0) {

      //Shuffle list items in list_images list
      $(function () {
          var parent = $("#list_images");
          var lis = parent.children();
          while (lis.length) {
              parent.append(lis.splice(Math.floor(Math.random() * lis.length), 1)[0]);
          }
      });

      var errorMsgs = [];

      $(".question_list_answer").click(function() {

        var answerArr = [];
        var errorMsgs = [];

        $("#list_answer").children().each(function() {
          answerArr.push($(this).attr("id"));
        });

        //Convert to Integer
        answerArr = answerArr.map(Number);
        console.log("My answer: " + answerArr);

        //Compare Result and give feedback
        if(arraysEqual(answerArr, question_answer, errorMsgs).length == 0) {
          $("#errors").html('');
          $("#feedback").html("You are correct!");
          $("#feedback").addClass("feedback_right");
          $("#feedback").removeClass("feedback_wrong");
          $(".correct_input").val(true);
        } else {
          $("#feedback").html("You are wrong!");
          $("#feedback").addClass("feedback_wrong");
          $("#feedback").removeClass("feedback_right");
          $("#errors").html('');
          $(".correct_input").val(false);
          for(var i = 0; i < errorMsgs.length; i++) {
            $("#errors").append("<li>" + errorMsgs[i] + "</li>");
          }
        }

      //Disable submit answer
      $(".question_list_answer").addClass("disable_a_href");

      //Show Paginate
      $(".hidden_paginate").removeClass("hidden_paginate");

      //Display Results btn in last page
      $(".finish_list_btn").removeClass("disable_a_href");

      });
    }
});
