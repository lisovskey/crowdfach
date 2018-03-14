class Project < ApplicationRecord
  acts_as_commontable

  include PgSearch
  pg_search_scope :search_projects, against: [:name, :description, :full_description]

  monetize :target_cents
  monetize :balance_cents
  
  mount_uploader :avatar, AvatarUploader


  belongs_to :user
  belongs_to :category
  has_many :choices
  has_many :donations
  has_many :rewards

  accepts_nested_attributes_for :rewards, allow_destroy: true

  validates_presence_of :name, :category_id, :description, :full_description,
                        :target_cents, :balance_cents, :expiration_time, :avatar
  validates :name, length: { minimum: 2, maximum: 30 }
  validates :description, length: { minimum: 128, maximum: 255 }
  validates :full_description, length: { minimum: 128, maximum: 10000 }  
  validate :check_expiration_time, on: :create
  validate :check_min_rewards

  after_create :set_finilizer

  def progress
    balance / target * 100
  end

  private
    def check_expiration_time
      errors.add :base, 'time expired' if expiration_time < Time.zone.now
    end

    def set_finilizer
      ProjectFinilizerJob.set(wait_until: expiration_time).perform_later(id)
    end

    def check_min_rewards
      if rewards.size < 1
        errors.add(:project, "must contain at least one reward")
      end
    end
end
