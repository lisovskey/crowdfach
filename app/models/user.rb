class User < ApplicationRecord
  acts_as_commontator

  enum role: [:user, :admin]
  
  mount_uploader :avatar, AvatarUploader

  # :timeoutable :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :confirmable, :lockable

  has_many :projects
  has_one :validation

  validates_presence_of :email, :encrypted_password, :first_name, :last_name, :wallet
  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, :last_name, length: { minimum: 2, maximum: 15 }

  before_save :capitalize_name
  before_save :set_full_name

  private
    def capitalize_name
      first_name.capitalize!
      last_name.capitalize!
    end

    def set_full_name
      self.full_name = "#{first_name} #{last_name}".strip
    end
end
