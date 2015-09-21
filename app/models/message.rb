class Message
  include ActiveAttr::Model

  attribute :name
  attribute :website
  attribute :description
  attribute :tags


  validates_presence_of :name, :website, :description, :tags

end
