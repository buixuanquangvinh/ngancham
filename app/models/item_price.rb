class ItemPrice < ApplicationRecord
    has_paper_trail
    validates :name,:price, presence: {message: "phải điền"}
    belongs_to :item
end
