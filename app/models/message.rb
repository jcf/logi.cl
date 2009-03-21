class Message < ActiveRecord::Base
  validates_presence_of :name, :email, :body
  validate :validate_email, :unless => lambda { |message| message[:email].nil? }

  private
  def validate_email
    TMail::Address.parse(email)
  rescue => e
    errors.add_to_base("Your email does not appear to be valid")
  end
end
