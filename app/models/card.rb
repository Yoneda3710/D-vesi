class Card < ApplicationRecord
  belongs_to :customer, optional: true
end
