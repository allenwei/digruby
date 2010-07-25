$(function (){
  UI.init();
});


UI = function() {
  function bind_source_form() {
    $("#source_url").submit(function(){
      var source_url = $(this).find("input[name=source]").val();
      var form_url = $(this).attr("action");
      $.fancybox.showActivity();
      $.ajax({
        type		: "GET",
        cache	: false,
        url		:  form_url,
        data		: $(this).serializeArray(),
        success: function(data) {
          $.fancybox(data);
          $(".new_source_form #cancel_button").click(function(){
            $.fancybox.close();
          });
          $("form.new_source_form").validate({
            submitHandler:function(){
              $.ajax({
                type		: "POST",
                cache	: false,
                url		:  $("form.new_source_form").attr("action"),
                data		: $("form.new_source_form").serializeArray(),
                start: function(){
                  $("form.new_source_form .loading").show();
                },
                success: function(data) {
                  $("form.new_source_form .loading").hide();
                  if (data.status) {
                      $.fancybox.close(); 
                      location.reload();
                    } else {
                      $("#messageBox ul li").remove();
                      $("#messageBox ul").append("<li class='error'>"+data.errors+"</li>");
                      $("#messageBox").show();
                      $("#messageBox ul").show();
                    }
                }
              });
              return false;
            },
            errorContainer: "#messageBox",
            errorLabelContainer: "#messageBox ul",
            errorElement: "li",
            onkeyup: false,
            onfocusout: false
            
            
        });
      }
    });

    return false; 
  });

}

function bind_next_page() {
  $("#more_button").live("click",function(){
    $.ajax({
      type		: "GET",
      cache	: false,
      url		:  $(this).attr("url"),
      dataType: "script"
    });
  });
}

function bind_rank() {
  $(".rank .like").click(function(){
    var id = $(this).attr("id").split("_")[1];
    var like = $(this);
    $.ajax({
      type     : "POST",
      cache    : false,
      url      : "/rank/like/"+id,
      dataType : "json",
      success  : function(data) {
        if (data.success) {
          like.addClass("voted");
          like.text(parseInt($(like).text())+1);
        } else  {
          alert(data.msg);
        }
      } 
    });
  });
}

var ui = {
  init:function (){
    bind_source_form();
    bind_next_page();
    bind_rank();
  }

};
return ui;
}();

