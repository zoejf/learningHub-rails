class Resource < ActiveRecord::Base
  has_many :resource_tags, dependent: :destroy
  has_many :tags, through: :resource_tags

end
