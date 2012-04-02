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
		teste = ProductsReceipt.find(:all, 
		                      :select => "`products_receipts`.*, COUNT(`products_receipts`.`amount`) as `totalprodutos`, `receipts`.`reseller_id`",
		                      :joins=>  "INNER JOIN `receipts` ON `products_receipts`.`receipt_id` = `receipts`.`id`",
		                      :group => "`receipts`.`reseller_id`")
		@testearray = Array.new
    teste.each do |t|
      @testearray[t.reseller_id] = t.totalprodutos
    end
		@NotasCadastradas = Receipt.count
		@ProdutosCadastrados = ProductsReceipt.count
		@NotasValidadas = ProductReceiptsUser.count
  end

  def show
    @resseller = ProductReceiptsUser.find(:all,
                          :conditions => ["user_id = ?",params[:id]])
  end

end
