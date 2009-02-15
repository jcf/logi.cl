class Link < ActiveRecord::Base
  has_one :slug
  has_many :visitors
end
