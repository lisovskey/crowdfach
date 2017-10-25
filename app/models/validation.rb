class Validation < ApplicationRecord
  mount_uploader :scan, ScanUploader

  belongs_to :user

  validates_presence_of :number, :first_name, :last_name,
                        :address, :city, :scan, :country, :index

  before_save :upper_name
  after_save :link_user

  private
    def upper_name
      first_name.upcase!
      last_name.upcase!
    end

    def link_user
      user.update_attribute(:validation_id, id)
    end
end
