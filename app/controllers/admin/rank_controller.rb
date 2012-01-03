class Admin::RankController < ApplicationController
  access_control do
      allow :admin
  end
  layout "inadmin"
  def index
    @ressellers = ProductReceiptsUser.find(:all,
												  :select=> "`product_receipts_users`.`user_id`, count(`product_receipts_users`.`products_receipt_id`) as `totalvendas`",
												  :group => :user_id,
												  :order=> " `totalvendas` desc, `product_receipts_users`.`user_id` ")
  end

  def show
    @resseller = ProductReceiptsUser.find(:all,
                          :conditions => ["user_id = ?",params[:id]])
  end

end
