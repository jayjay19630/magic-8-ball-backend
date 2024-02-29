class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true, length: {minimum:1}
    validates :password, presence: true, length: {minimum:8}
    has_one :eightball
end
