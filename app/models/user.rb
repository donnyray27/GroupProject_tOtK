class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, format:
  { with: /\A(?=.{5,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])\z/,
    message: "Invalid username:\nMust be 5 - 20 characters long\n
                                Only letters, numbers, '.', and '_' allowed]\n
                                Cannot contain '..', '__', '._', or '_.'.\n
                                Cannot end in '.' or '_'" }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  def is_admin?
      self.role == "admin"
  end

  has_many :releases
  has_many :reviews
  has_many :comments
  has_many :points
  has_many :reviews, through: :points
end
