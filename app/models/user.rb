class User < ActiveRecord::Base
  has_secure_password

  has_many :bookmarks, dependent: :destroy
  has_many :resources, through: :bookmarks

  has_many :endorsements, dependent: :destroy

  has_many :comments, dependent: :destroy

  # validations
  validates :password, length: { minimum: 6}, on: :create

  validates :email, presence: true, uniqueness: true, format: {
    with: /@/, 
    message: "not a valid email format"
  }


  def full_name
    "#{first_name} #{last_name}"
  end
  
end
