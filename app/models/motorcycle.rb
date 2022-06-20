class Motorcycle < ApplicationRecord
  validates :title, presence: true,  uniqueness: true
  validates :description, uniqueness: true, presence: true
  belongs_to :user
end
