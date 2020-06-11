class SupporterItem < ApplicationRecord
  belongs_to :support_member
  belongs_to :rescuestation_item
end
