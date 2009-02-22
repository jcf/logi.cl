class Link < ActiveRecord::Base
  require "uri"
  has_and_belongs_to_many :visitors

  validates_uniqueness_of :target
  validate :uri_parses

  before_create :create_slug

  private

  def uri_parses
    URI.parse(self[:target])
  rescue URI::InvalidURIError
    errors.add(:url, 'does not appear to be valid')
  end

  def create_slug
    self.slug = (self.id.to_i + 1).to_s(36)
  end

end
