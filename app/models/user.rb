class User < ActiveRecord::Base
  has_secure_password

  has_many :bookmarks, dependent: :destroy
  has_many :resources, through: :bookmarks

  def full_name
    "#{first_name} #{last_name}"
  end
  
end
