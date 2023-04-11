<?php

namespace App\Http\Controllers;

//===============================
use Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;

use App\Http\Controllers\Controller;
//===============================

use App\Models\UserModel;
use Socialite;
use Exception;


class UserController extends Controller{

  private $user_model;
  private $biodata_model;

  public function __construct(){

    $this->user_model         = new UserModel();
    $this->biodata_model      = new BiodataModel();

  }
  public function signUp(){
    $view     = View::make("signup");
    $content  = $view->render();

    $data     = array(
        "content"   => $content,
        "login"     => "",//$login,
        "title"      => "Recruitment",
        "page"      => "login",
        "submenu"   => "login",
    );

    return view("body",$data);
  }

  public function register(Request $request){
    $data = array(
      "email"        => $request->input("email"),
      "password"        => $request->input("password"),
    );

    $rules  = array(
      "email"        => "required,unique",
      "password"        => 'required',
		);
		$messages = array(
      "email.required"   => "Please fill this field",
      "email.unique"   => "Email already been used",
      "password.required"   => "Please fill this field"
    );

		$validator = Validator::make($data, $rules, $messages);
    if ($validator->fails()) {
      $return = array(
        "status"    => "error_validation",
        "response"  => $validator->messages()
      );
    }else{
      $auth = $this->user_model->create($data);
      Session::put("user",$auth);
      // $auth    = $this->user_model->getAuth($data);
      
    }
    return response()->json($return, 200);
  }

  public function login(){
    $view     = View::make("login");
    $content  = $view->render();

    //===================
    $login    = Session::get("user");
    if($login){
      return redirect($this->loggedRedirect($login));
    }
    //===================
    $data     = array(
        "content"   => $content,
        "login"     => "",//$login,
        "title"      => "Recruitment",
        "page"      => "login",
        "submenu"   => "login",
    );

    return view("body",$data);
  }

  public function auth(Request $request){
    $data = array(
      "email"        => $request->input("email"),
      "password"        => $request->input("password"),
    );

    $rules  = array(
      "email"        => "required",
      "password"        => 'required',
		);
		$messages = array(
      "email.required"   => "Please fill this field",
      "password.required"   => "Please fill this field"
    );

		$validator = Validator::make($data, $rules, $messages);
    if ($validator->fails()) {
      $return = array(
        "status"    => "error_validation",
        "response"  => $validator->messages()
      );
    }else{
      // $data['password']   = md5($data['password']);
      $auth    = $this->user_model->getAuth($data);
      if($auth){
        Session::put("user",$auth);
        $return = array(
          "status"    => "success",
          "response"  => "<div class='alert alert-success alert-dismissable'>
                              <button aria-hidden='true' data-dismiss='alert' class='close' type='button'>x</button>
                              Hi <strong>".$auth->first_name.".</strong>!<br> Please wait.. signin inisiation.
                          </div>"
        );
      }else{
        $return = array(
          "status"    => "error",
          "response"  => "<div class='alert alert-danger alert-dismissable'>
                              <button aria-hidden='true' data-dismiss='alert' class='close' type='button'>x</button>
                              Email and password do not match.
                          </div>",
          "query"     => $data
        );
      }
    }
    return response()->json($return, 200);
  }

  public function logred(){
    $login    = Session::get("user");
    if($login->type_user=1){
      return redirect("detail".$login->id_user);
    }else{
      return rediredt("list-calon");
    }
  }

  public function listCalon(){
    
    $view     = View::make("welcome");
    $content  = $view->render();
  }

  public function detail($id=""){
    $this->biodata_model::findById($id);
    $view     = View::make("welcome");
    $content  = $view->render();
  }

  public function signout(){
    Session::forget("user");
    Session::flush();
    return redirect("/");
  }

}
