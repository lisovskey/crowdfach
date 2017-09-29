class Validation < ApplicationRecord
  mount_uploader :scan, ScanUploader

  has_one :user

  validates_presence_of :no, :first_name, :last_name, :address, :city, :scan, :country, :index
  before_save :upper_name
  after_save :link_user

  private
    def upper_name
      first_name.upcase!
      last_name.upcase!
    end

    def link_user
      User.find(user_id).update_attribute(:validation_id, id)
    end
end
