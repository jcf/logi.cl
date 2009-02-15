class Link < ActiveRecord::Base
  require "uri"
  has_one :slug
  has_and_belongs_to_many :visitors

  validates_uniqueness_of :url
  validate :uri_parses

  after_create :create_slug

  private

  def uri_parses
    URI.parse(self.url)
  rescue URI::InvalidURIError
    errors.add(:url, 'does not appear to be valid')
  end

  def create_slug
    self.slug = Slug.create(self.url)
  end

end
