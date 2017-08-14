require 'date'
class Product < ApplicationRecord
  validates :product_type, :name, :description, :presence => {:message => "empty value found"}
  validates :product_status, :price, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  #validate :is_inward_date_valid

  def is_inward_date_valid
    errors.add(:inward_date, 'must be a valid date') if ((Date.parse(:inward_date) rescue ArgumentError) == ArgumentError)
  end

  def self.price_sum(type)
    Product.where(:product_type => type).sum(&:price)
  end
end

