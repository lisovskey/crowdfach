class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates_presence_of :name, :description, :full_description, :target, :balance
  validate :check_expiration_time

  before_save :capitalize_name

  def progress
    (balance / target * 100).round.to_s
  end

  def author
    puts User.find(user_id).full_name
    User.find(user_id).full_name
  end

  private
    def capitalize_name
      name.capitalize!
    end

    def check_expiration_time
      errors.add :base, 'time expired' if expiration_time < DateTime.now
    end
end
