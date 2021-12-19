class Item < ApplicationRecord

    has_many :cart_items, dependent: :destroy
    has_many :oder_details, dependent: :destroy
    belongs_to :genre

    attachment :image

    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true
    validates :is_active, presence: true

    def with_tax_price
     (price * 1.1).floor
    end

end
