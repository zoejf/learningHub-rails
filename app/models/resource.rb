class Resource < ActiveRecord::Base
  has_many :resource_tags, dependent: :destroy
  has_many :tags, through: :resource_tags
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks

  validates :name, :website, :description, :image, :price, presence: true

end
