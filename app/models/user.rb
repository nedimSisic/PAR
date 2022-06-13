class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :fullname, presence: true, length:  {maximum: 60}

	# has_secure_password
	# had to comment above out so devise works: Rails NoMethodError: undefined method `password_digest=

	before_save :downcase_email

	validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true

	private

	def downcase_email
		self.email = email.downcase
	end
end
