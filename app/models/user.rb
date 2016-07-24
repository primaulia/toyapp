class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ApplicationRecord
  has_many :microposts
  validates :name, presence: true    # Replace FILL_IN with the right code.
  validates :email, presence: true, email: true   # Replace FILL_IN with the right code.
end
