class Message < ActiveRecord::Base

  validates_presence_of :name, :email, :body
  validate :validate_email, :if => lambda { |message| message[:email].present? }

private
  def validate_email
    TMail::Address.parse(email)
  rescue => e
    errors.add_to_base("Your email does not appear to be valid (#{e})")
  end
end
