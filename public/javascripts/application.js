$(document).ready(function(){


  var makeDialog = function(dialog_name, title, data, target, callback){
        if($(dialog_name).length==0){
          $('body').append("<div id='"+dialog_name+"'/>");
        }
        dialog_name = "#"+dialog_name;
        $(dialog_name).html(data);
        $(dialog_name).dialog("destroy");
        var form = $(dialog_name + " form")
        button_name = $("input[type='submit']").remove().attr("value");
        $(dialog_name).dialog({
          title: title,
          buttons: [
            {text: button_name,
             click: function(){
              form.ajaxSubmit({
                  success: function(data,status){
                    if(status=="success"){
                      $(target).html(data);
                      $(dialog_name).dialog("close");
                      $(dialog_name).dialog("destroy");
                    } else {
                      $(dialog_name).html(data);
                    }
                    callback();
                  }
                });
             }}
          ]
        });
    };


  var bindProductEvents = function(){
    $("#new_product").click(function(){
      $.get($(this).attr("href"),function(data){
        makeDialog( "new_product_dialog",
                    "New Product",
                    data,
                    "#right",
                    bindProductEvents);
      });
      return false;
    });
  };

  var bindCategoryEvents = function(){
    
    // handle category switching
    $(".category .name a").click(function(){
      $.get($(this).attr("href"),function(data){
        $("#right").html(data);
        bindProductEvents();
      });
      
      return false;
    });

    //handle new category
    $("#new_category").click(function(){
      $.get($(this).attr("href"),function(data){
        makeDialog( "new_category_dialog",
                    "New Category",
                    data,
                    ".categories",
                    bindCategoryEvents);
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
