class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :Address
end
