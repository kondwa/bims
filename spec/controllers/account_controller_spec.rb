require File.dirname(__FILE__)+'/../spec_helper'

describe AccountController do
  integrate_views
  #Delete this example and add some real ones
  
  it "should use AccountController" do
    controller.should be_an_instance_of(AccountController)
  end

  it 'should go to login' do
    get :login
    response.should be_success
  end
  it 'should redirect' do
    get :do_login
    response.should be_redirect
  end
  
  it 'should redirect to root' do
    get :logout
    response.should redirect_to root_url
  end
  it 'should show bad login - no data' do
    get :do_login
    response.should redirect_to session_path(:login)
  end
  it 'should show bad login - bad password' do
    get :do_login, :user=>{:username=>"test",:password=>"tduilisye9"}
    response.should redirect_to session_path(:login)
  end
  it 'should show bad login - bad username' do
    get :do_login, :user=>{:username=>"usgdiugkf",:password=>"test"}
    response.should redirect_to session_path(:login)
  end
  it 'should show bad login - bad username and password' do
    render :do_login, :user=>{:username=>"hujjflg",:password=>"tduilisye9"}
    response.body.should have_text("Oops! Your username or password are bad.") 
  end
  it 'should show good login' do
    render :do_login, :user=>{:username=>"test",:password=>"test"}
    response.body.should have_text("Yep! You are logged in.") 
  end
end
