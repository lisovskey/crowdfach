class Project < ApplicationRecord
  acts_as_commontable
  
  mount_uploader :avatar, AvatarUploader

  if Rails.env.production?
    include PgSearch
    pg_search_scope :search_everywhere, against: [:name, :description, :full_description]
  end

  belongs_to :user
  belongs_to :category
  has_many :donations

  validates_presence_of :name, :category_id, :description, :full_description, :target, :balance, :expiration_time, :avatar
  validates :target, numericality: { greater_than_or_equal_to: 0.1, less_than_or_equal_to: 1000 }
  validates :name, length: { minimum: 2, maximum: 30 }  
  validates :description, length: { minimum: 128, maximum: 255 }
  validates :full_description, length: { minimum: 128, maximum: 10000 }  
  validate :check_expiration_time, on: :create

  after_create :set_finilizer

  private
    def check_expiration_time
      errors.add :base, 'time expired' if expiration_time < Time.zone.now
    end

    def set_finilizer
      ProjectFinilizerJob.set(wait_until: expiration_time).perform_later(id)
    end
end
