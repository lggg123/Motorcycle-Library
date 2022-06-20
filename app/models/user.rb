class User < ApplicationRecord
    validates :first_name, uniqueness: true, presence: true
    validates :last_name, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true

    has_many :motorcycles, dependent: :destroy
end
