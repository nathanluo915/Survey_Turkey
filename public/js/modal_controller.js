$(document).ready(function(){
  $('#navLogInRegisterButton').on("click",function(event){
    event.preventDefault();
    $.ajax({
      method:"get",
      url:"/sessions/new"
    }).done(function(result){
      $("#newModalForm").html(result);
    }).fail(function(error){
      console.log(error);
    });
  });



  $("#home_create_button").on("click",function(event){
    event.preventDefault();
    $.ajax({
      method:"get",
      url:"/surveys/new"
    }).done(function(result){
      if ($(".modal-body").children().length == 0){
        $("#newModalForm").html(result);
        formCreation();
      }
    }).fail(function(error){
      console.log(error);
    });
  });
});

