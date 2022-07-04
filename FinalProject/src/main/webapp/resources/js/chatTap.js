$(function(){
  $('#chatContent').hide();
  $("#tab1").addClass('active');
  
  $('#tab2').click(function () {
    $('#chatRoom').hide().filter(this.hash).fadeIn();
    $('#chatContent').show().filter(this.hash).fadeOut();
    $('#tab1').removeClass('active');
    $("#tab2").addClass('active');
  })
  $('#tab1').click(function () {
    $('#chatContent').hide().filter(this.hash).fadeIn();
    $('#chatRoom').show().filter(this.hash).fadeOut();
    $('#tab2').removeClass('active');
    $("#tab1").addClass('active');
  })
  });