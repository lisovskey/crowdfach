class Donation < ApplicationRecord
  monetize :amount_cents

  belongs_to :project

  validates_presence_of :amount_cents, :project
  validates :amount_cents, numericality: { greater_than_or_equal_to: 1, less_than: 10000000 }
end
