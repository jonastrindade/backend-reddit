FactoryBot.define do
  factory :thread, class: "Api::V1::Thread" do
    name { Faker::Lorem.sentence(word_count: 3) }
    description { Faker::Lorem.sentence(word_count: 50) }
  end
end
