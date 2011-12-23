require 'test_helper'

class Admin::ResellersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Reseller.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Reseller.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Reseller.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_reseller_url(assigns(:reseller))
  end

  def test_edit
    get :edit, :id => Reseller.first
    assert_template 'edit'
  end

  def test_update_invalid
    Reseller.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Reseller.first
    assert_template 'edit'
  end

  def test_update_valid
    Reseller.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Reseller.first
    assert_redirected_to admin_reseller_url(assigns(:reseller))
  end

  def test_destroy
    reseller = Reseller.first
    delete :destroy, :id => reseller
    assert_redirected_to admin_resellers_url
    assert !Reseller.exists?(reseller.id)
  end
end
