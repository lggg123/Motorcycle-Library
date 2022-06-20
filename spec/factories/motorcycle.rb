FactoryBot.define do
    factory :motorcycle do
      sequence(:title) { |n| "Motorcycle title #{n}" }
      sequence(:description) { |n| "Motorcycle description #{n}" }
      sequence(:image_url) { |n| "Motorcycle image url #{n}"}

      user
    end
  end