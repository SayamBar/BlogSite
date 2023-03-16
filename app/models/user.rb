class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar, dependent: :destroy
  has_many :posts; 
  validates :fullname, presence: true
  validates :bio, length: { maximum: 20 }
  validates :gender, inclusion: ["male","female","others"]
  validates :email, uniqueness: true
  # validates :phone, numericality: true

  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end

end
