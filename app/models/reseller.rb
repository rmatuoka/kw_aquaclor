class Reseller < ActiveRecord::Base
  has_many :users, :dependent => :destroy
  has_many :receipts, :dependent => :destroy
  
  validates_presence_of :name, :message=> " - preencha o campo!"
  validates_presence_of :cnpj, :message=> " - preencha o campo!"
  validates_presence_of :state, :message=> " - preencha o campo!"  
  validates_presence_of :city, :message=> " - preencha o campo!" 
  
  def self.find_by_cpnj(cnpj)
    Reseller.first(:conditions => ["cnpj = ?", cnpj])
  end
end
