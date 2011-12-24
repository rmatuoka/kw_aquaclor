require 'test_helper'

class Admin::ProductsReceiptsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ProductsReceipt.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ProductsReceipt.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ProductsReceipt.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to admin_products_receipt_url(assigns(:products_receipt))
  end

  def test_edit
    get :edit, :id => ProductsReceipt.first
    assert_template 'edit'
  end

  def test_update_invalid
    ProductsReceipt.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ProductsReceipt.first
    assert_template 'edit'
  end

  def test_update_valid
    ProductsReceipt.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ProductsReceipt.first
    assert_redirected_to admin_products_receipt_url(assigns(:products_receipt))
  end

  def test_destroy
    products_receipt = ProductsReceipt.first
    delete :destroy, :id => products_receipt
    assert_redirected_to admin_products_receipts_url
    assert !ProductsReceipt.exists?(products_receipt.id)
  end
end
