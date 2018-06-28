class Organization < ApplicationRecord
  
  has_many :products, dependent: :destroy
  has_many :locations, dependent: :destroy

end
