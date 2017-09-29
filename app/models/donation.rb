class Donation < ApplicationRecord
  belongs_to :project

  validates_presence_of :amount, :project_id  
  validates :amount, numericality: { greater_than_or_equal_to: 0.0001, less_than: 10000 }
end
