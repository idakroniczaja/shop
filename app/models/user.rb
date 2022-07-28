class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: {with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/m, message: "Please enter valid email address."}
    # Ensure there are at least 6 characters.
    # Look ahead for an arbitrary string followed by a number.
    # Look ahead for an arbitrary string followed by a letter.
    validates :password, format: {with: /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$/, multiline: true, message:"Password doesn't match criteria"}
end
