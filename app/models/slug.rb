class Slug < ActiveRecord::Base
  belongs_to :link
  before_save :generate_unique_slug
  
  private
  def generate_unique_slug
    self.text = self.id.to_s(36)
  end

end
