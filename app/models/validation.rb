class Validation < ApplicationRecord
  mount_uploader :scan, ScanUploader

  has_one :user

  validates_presence_of :no, :first_name, :last_name, :address, :city, :scan, :country, :index
  before_save :upper_name

  private
    def upper_name
      first_name.upcase!
      last_name.upcase!
    end
end
