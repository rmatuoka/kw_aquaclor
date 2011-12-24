class Reseller < ActiveRecord::Base
  has_many :users, :dependent => :destroy
  has_many :receipts, :dependent => :destroy
  
  validates_presence_of :name, :message=> " - preencha o campo!"
  validates_presence_of :cnpj, :message=> " - preencha o campo!"
  validates_presence_of :state, :message=> " - preencha o campo!"  
  validates_presence_of :city, :message=> " - preencha o campo!" 
  
  def self.find_by_cpnj(cnpj)
    Reseller.all(:conditions => ["(active = true) and (cnpj = ?)", cnpj], :limit=>"1")
  end

  def self.all_active
    Reseller.all(:conditions => ['active =  true'])
  end  
end
