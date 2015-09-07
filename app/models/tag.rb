class Tag < ActiveRecord::Base
  has_many :resource_tags, dependent: :destroy
  has_many :resources, through: :resource_tags

  validates :image, :text, presence: true
end
