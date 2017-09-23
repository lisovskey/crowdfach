class Project < ApplicationRecord
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
  validates :name, length: { minimum: 2, maximum: 24 }  
  validates :description, length: { minimum: 128, maximum: 255 }
  validates :full_description, length: { minimum: 128, maximum: 10000 }  
  validate :check_expiration_time, on: :create

  before_save :capitalize_name
  after_create :set_finilizer

  def progress
    (balance / target * 100).round.to_s << '%'
  end

  def limited_progress
    [(balance / target * 100).round, 100].min.to_s << '%'
  end

  def finish_status
    successful ? I18n.t('project.successfully') : I18n.t('project.poorly') if finished
  end

  def remain
    time = expiration_time - Time.zone.now
    if time < 1.minute
      I18n.t('datetime.few')
    elsif time / 1.minute < 60
      (time / 1.minute).round.to_s << I18n.t('datetime.minutes')
    elsif time / 1.hour < 24
      (time / 1.hour).round.to_s << I18n.t('datetime.hours')
    elsif time / 1.day < 30
      (time / 1.day).round.to_s << I18n.t('datetime.days')
    elsif time / 1.day / 30 < 12
      (time / 1.day / 30).round.to_s << I18n.t('datetime.months')
    else
      (time / 1.day / 30 / 12).round.to_s << I18n.t('datetime.years')
    end
  end

  private
    def capitalize_name
      name.capitalize!
    end

    def check_expiration_time
      errors.add :base, 'time expired' if expiration_time < Time.zone.now
    end

    def set_finilizer
      ProjectFinilizerJob.set(wait_until: expiration_time).perform_later(id)
    end
end
