class Category < ApplicationRecord
  has_many :projects

  before_save :capitalize_name

  private
    def capitalize_name
      name.capitalize!
    end
end
