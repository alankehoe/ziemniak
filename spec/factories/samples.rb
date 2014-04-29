# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  # t.text     "body"
  # t.datetime "created_at"
  # t.datetime "updated_at"
  # t.text     "reference"
  # t.text     "yandex"
  # t.text     "bing"
  # t.float    "yandex_bleu"
  # t.float    "bing_bleu"
  # t.float    "yandex_wer"
  # t.float    "bing_wer"
  # t.float    "yandex_nist"
  # t.float    "bing_nist"

  factory :sample do
    id { rand(1...1000) }
    body { Faker::Lorem.words(5).join(' ') }
    yandex { Faker::Lorem.words(5).join(' ') }
    bing { Faker::Lorem.words(5).join(' ') }
    reference { Faker::Lorem.words(5).join(' ') }
    yandex_bleu { rand(0.0...1.0) }
    yandex_wer { rand(0.0...1.0) }
    yandex_nist { rand(0.0...5.0) }
    bing_bleu { rand(0.0...1.0) }
    bing_wer { rand(0.0...1.0) }
    bing_nist { rand(0.0...5.0) }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
