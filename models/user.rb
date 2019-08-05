class User < ActiveRecord::Base
    # include ActiveModel::Validations
    has_many :comments
    has_many :likes
    # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
    validates :firstname, presence: true
    validates :firstname, length: { minimum: 2 }

    # adds methods to user

    has_secure_password

    # abstracts bcrypt for us
    # this will add some new methods for users for you
    # .password = 'pudding' you can pass in the original
    # .password will pass it to bcrypt to digest it for you
    # password_digest - the naming is a convention of has_secure_password
    # .authenticate('pudding')
    # returns the user object if the password matches
    # else return false
end

# class User < ApplicationRecord
#     validates :firstname, presence: { message: "must be given please" }

# end