class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :confirmable, :lockable

  has_many :projects
  
  validates_presence_of :email, :encrypted_password, :first_name, :last_name
  validates :first_name, format: { with: /\A[a-zA-Z]+\z/, message: 'only letters allowed' },
                         length: { minimum: 2, maximum: 15 }
  validates :last_name, format: { with: /\A[a-zA-Z]+\z/, message: 'only letters allowed' },
                        length: { minimum: 2, maximum: 15 }

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
