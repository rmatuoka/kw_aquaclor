class Reseller < ActiveRecord::Base
  has_many :users
  
  def self.find_by_cpnj(cnpj)
    Reseller.first(:conditions => ["cnpj = ?", cnpj])
  end
end
