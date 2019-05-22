class Item < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :allotments, dependent: :nullify
  has_many :issues, dependent: :nullify
  validates :name, presence: true, uniqueness: true

  def item_display_name
    @brand_name = Brand.find(brand_id).name
    "#{@brand_name} #{name}"
  end
end
