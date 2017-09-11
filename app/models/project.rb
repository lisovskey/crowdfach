class Project < ApplicationRecord
  belongs_to :user, counter_cache: true

  validates_presence_of :name, :description, :full_description, :target, :balance
end
