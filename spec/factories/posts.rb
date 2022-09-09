FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    content { Faker::Lorem.paragraphs }
    author_id { 1 }
    images {  }
  end
end