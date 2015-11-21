$(document).ready(function() {
  var formsContainer = $(".forms-container");

  $("#add-question").on("click", function(event){
    event.preventDefault();

    $.ajax({
      method: 'get',
      url: '/questions/new'
    }).done(function(questionForm){

      formsContainer.append(questionForm);

      var question_index = "q" + formsContainer.children().length
      var answer_index = question_index + "_1"

      formsContainer.find("input[placeholder|='Question']").last().attr({'name': question_index});
      formsContainer.find("input[placeholder|='Answer']").last().attr({'name': answer_index});

    }).fail(function(error){

    });

  });


  $("#add-answer").on("click", function(event){
    event.preventDefault();

    $.ajax({
      method: 'get',
      url: '/answers/new'
    }).done(function(answerForm){

      var answersForm = formsContainer.children().last().find(".answer-form");

      answersForm.append(answerForm);
      var question_index = "q" + formsContainer.children().length;
      var answer_index = question_index + "_" + answersForm.children().length;
      debugger
      answersForm.children().last().attr({'name': answer_index});

    })

  });


});
