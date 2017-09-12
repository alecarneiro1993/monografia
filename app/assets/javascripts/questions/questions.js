/* global $ */

$(document).on('turbolinks:load', function() {
  
  //SET_ANSWER FUNCTION
  if($(".answer_btn").length > 0) {
    $(".answer_btn").click(function() {
      
      var answerArr = [];
      
      $("#list_answer").children().each(function() {
        answerArr.push($(this).attr("id"));
      });
      
      //Convert to Integer
      answerArr = answerArr.map(Number);
      console.log(answerArr);
      
      //Set hidden input answer
      $(".answer_input").val(answerArr);
      
    });
  }
  
  //COMPARE ANSWERS FUNCTON
  if($(".answer_question_btn").length > 0) {
    
    var errorMsgs = [];
    
    $(".answer_question_btn").click(function() {
      
      var answerArr = [];
      var errorMsgs = [];
      
      $("#list_answer").children().each(function() {
        answerArr.push($(this).attr("id"));
      });
      
      //Convert to Integer
      answerArr = answerArr.map(Number);
      console.log("My answer: " + answerArr);
      
      if(arraysEqual(answerArr, question_answer, errorMsgs).length == 0) {
        $("#errors").html('');
        $("#feedback").html("You are correct! Congratulations!!");
        $("#feedback").addClass("feedback_right");
        $("#feedback").removeClass("feedback_wrong");
      } else {
        $("#feedback").html("You are wrong! Try again!");
        $("#feedback").addClass("feedback_wrong");
        $("#feedback").removeClass("feedback_right");
        $("#errors").html('');
        for(var i = 0; i < errorMsgs.length; i++) {
          $("#errors").append("<li>" + errorMsgs[i] + "</li>");
        }
      }
      
    });
  }
  
  
  //Compare arrays function
  function arraysEqual(arr1, arr2, errorArr) {
    if(arr1.length !== arr2.length) {
      errorArr.push("Number of instructions is incorrect.");
      return errorArr;
    }
    
    for(var i = 0; i < arr1.length; i++) {
        if(arr1[i] !== arr2[i])  {
          errorArr.push("Instruction in position " + (i+1) + " is incorrect.");
        }
    }
    return errorArr;
}
  
  
  //Turn Lists Sortable
  $( function() {
    $( "#list_images, #list_answer" ).sortable({
      connectWith: ".connectedSortable"
    }).disableSelection();
  });
});