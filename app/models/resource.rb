class Resource < ActiveRecord::Base
  has_many :resource_tags, dependent: :destroy
  has_many :tags, through: :resource_tags

  validates :name, :website, :description, :image, :price, presence: true

end
