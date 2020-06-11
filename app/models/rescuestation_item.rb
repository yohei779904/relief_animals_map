class RescuestationItem < ApplicationRecord
  belongs_to :rescuer_member
  belongs_to :item

  has_many :supporter_items
  has_many :support_members, through: :supporter_items
end
