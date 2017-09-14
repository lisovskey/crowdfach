class Project < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :description, :full_description, :target, :balance

  before_save :capitalize_name

  def progress
    (balance / target * 100).round.to_s
  end

  private
    def capitalize_name
      name.capitalize!
    end
end
