class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates_presence_of :name, :category_id, :description, :full_description, :target, :balance, :expiration_time
  validate :check_expiration_time

  before_save :capitalize_name

  def progress
    (balance / target * 100).round.to_s << '%'
  end

  def limited_progress
    [(balance / target * 100).round, 100].min.to_s << '%'
  end

  def remain
    time = expiration_time - DateTime.now
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
      errors.add :base, 'time expired' if expiration_time < DateTime.now
    end
end
