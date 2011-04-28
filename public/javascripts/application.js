$(document).ready(function(){
  var bindCategoryEvents = function(){
    $(".category .name a").click(function(){
      $.get($(this).attr("href"),function(data){
        $("#right").html(data);
      });
      
      return false;
    });
  }
  $("#nav a").click(function(e){
    $.get($(this).attr("href"),function(data){
      $("#content").html(data);
      bindCategoryEvents();
    },'html');
    return false;
  });
});
