FactoryBot.define do
    factory :motorcycle do
      title { 'Harley Davidson' }
      description  { 'A new motorcycle for your everyday needs' }
      image_url  { 'https://www.laidlawsharley.com/Motorcycles-Harley-Davidson-Iron-883-2022-Baldwin-Park-CA-a76577e4-cddd-4ae5-979b-ae230006a32b' }
      user_id { 1 }
    end
  end