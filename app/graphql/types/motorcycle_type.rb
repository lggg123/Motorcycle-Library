# frozen_string_literal: true
module Types
  class MotorcycleType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :description, String
    field :image_url, String
    field :user_id, Integer, null: false
    field :user, Types::UserType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
