class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates_presence_of :name, :category_id, :description, :full_description, :target, :balance, :expiration_time
  validates :target, numericality: { greater_than_or_equal_to: 0.1, less_than_or_equal_to: 1000 }
  validates :name, length: { minimum: 2, maximum: 24 }  
  validates :description, length: { minimum: 128, maximum: 255 }
  validates :full_description, length: { minimum: 128, maximum: 10000 }  
  validate :check_expiration_time, on: :create

  before_save :capitalize_name
  before_create :set_finilizer

  def progress
    (balance / target * 100).round.to_s << '%'
  end

  def limited_progress
    [(balance / target * 100).round, 100].min.to_s << '%'
  end

  def finish_status
    successful ? I18n.t('project.status.successful') : I18n.t('project.status.failed') if finished
  end

  def remain
    time = expiration_time - Time.zone.now
    if time < 60
      I18n.t('datetime.few')
    elsif time / 60 < 60
      (time / 60).round.to_s << I18n.t('datetime.minutes')
    elsif time / 60 / 60 < 24
      (time / 60 / 60).round.to_s << I18n.t('datetime.hours')
    elsif time / 60 / 60 / 24 < 30
      (time / 60 / 60 / 24).round.to_s << I18n.t('datetime.days')
    elsif time / 60 / 60 / 24 / 30 < 12
      (time / 60 / 60 / 24 / 30).round.to_s << I18n.t('datetime.months')
    else
      (time / 60 / 60 / 24 / 30 / 12).round.to_s << I18n.t('datetime.years')
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
