class Quote < ApplicationRecord
  validates_presence_of :first, :last, :email, :phone
  VALID_NAME_REGEX = /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/
  validates :first, length: { minimum: 1, maximum: 25 }, format: { with: VALID_NAME_REGEX }
  validates :last, length: { minimum: 1, maximum: 25 }, format: { with: VALID_NAME_REGEX }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  VALID_PHONE_REGEX = /\A\d{10}\z/
  validates :phone, length: { minimum: 10, maximum: 10 }, format: { with: VALID_PHONE_REGEX }
  before_save :downcase_email

  private
  def downcase_email
    self.email = email.downcase
  end
end
