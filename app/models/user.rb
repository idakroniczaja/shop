class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: {with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/m, message: "No bueno"}
end
