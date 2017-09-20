class Category < ApplicationRecord
  has_many :projects

  validates :name, uniqueness: { case_sensitive: false },
                   length: { minimum: 2, maximum: 20 }

  before_save :capitalize_name

  private
    def capitalize_name
      name.capitalize!
    end
end
