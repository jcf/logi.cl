class Contact < ActiveRecord::Base
  validates_presence_of :name, :email, :message
  validate :valid_email?

  private
  def valid_email?
    TMail::Address.parse(email)
  rescue TMail::SyntaxError
    errors.add(:email, "does not appear to be a valid address.")
    false
  end
end
