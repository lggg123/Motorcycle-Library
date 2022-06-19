class User < ApplicationRecord
    has_many :motorcycles, dependent: :destroy

    validates :first_name, uniqueness: true, presence: true
    validates :last_name, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true
end
