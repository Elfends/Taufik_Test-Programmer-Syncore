<?php
  $user = Session::get("user");
?>
<style>
  .form-control, .btn{
    height: 52px;
  }
</style>
<div class="middle-box login text-center loginscreen animated fadeInDown">
  <div>
    <div>
        <img src="<?=url("img/html_logo.png")?>" class="logo">
    </div>
    <h3>Welcome!</h3>
    <form class="m-t" role="form" method="POST" id="loginForm">
      <input type="hidden" id="token" name="_token" value="{{ csrf_token() }}">
      <div class="form-group">
          <input type="text" class="form-control" placeholder="Email" name="email" id="email" data-placement="right">
      </div>
      <div class="form-group">
          <input type="password" class="form-control" placeholder="Password" name="password" id="password" data-placement="right">
      </div>
      <div id="loginalert"></div>
      <button type="submit" class="btn btn-primary block full-width m-b" id="btnlog">Sign In</button>
      <p class=" text-center"><small>Don't have account?</small></p>
      <a href="{{ url('signup') }}">Sign Up Here</a>
      <br>
      <br>

      <p class=" text-center"><small>Please contact the Administrator for login details.</small></p>
    </form>
  </div>
</div>
<script>

    $("#loginForm").submit(function(e){
      e.preventDefault();
      $("#btnlog").addClass("disabled").prop("disabled",true).html("Processing..");
      $.ajax({
        type:"POST",
        dataType: "json",
        url:"<?=url('login-auth')?>",
        data: $(this).serialize()
      })
      .done(function(result){
        console.log(result);
        if(result.status=="success"){
          //setTimeout(function(){
            document.location = "{{ url('login-red') }}";
          //},3000);
          $("#loginalert").html(result.response);
        }else if(result.status == "error_validation"){
          var errors = result.response;
          for(var i in errors){
            $("#"+i).prop("title",errors[i][0]).prop("data-placement","right").tooltip().parent(".form-group").addClass("has-error");
          }
          $("#loginalert").html("<div class='alert alert-danger'>Please check your login details.</div>");
        }else{
          $("#loginalert").html(result.response);
        }
        $("#btnlog").removeClass("disabled").prop("disabled",false).html("Sign In");
      })
      .fail(function(msg){
        console.log(msg);
        $("#btnlog").attr("disabled",false).removeClass("disabled").html("Sign In");
      })
      .always(function(){

      });
    });
</script>
