# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  # t.string   "username"
  # t.string   "first_name"
  # t.string   "last_name"
  # t.string   "email",                  default: "", null: false
  # t.string   "encrypted_password",     default: "", null: false
  # t.string   "reset_password_token"
  # t.datetime "reset_password_sent_at"
  # t.datetime "remember_created_at"
  # t.integer  "sign_in_count",          default: 0,  null: false
  # t.datetime "current_sign_in_at"
  # t.datetime "last_sign_in_at"
  # t.string   "current_sign_in_ip"
  # t.string   "last_sign_in_ip"
  # t.datetime "created_at"
  # t.datetime "updated_at"
  # t.string   "gravatar"

  factory :user do
    id { rand(1...1000) }
    username { Faker::Internet.domain_word }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    encrypted_password { Faker::Code.isbn }
    reset_password_token { Faker::Code.isbn }
    reset_password_sent_at { Faker::Code.isbn }
    remember_created_at { Time.now }
    sign_in_count { rand(1...100) }
    current_sign_in_at { Time.now }
    last_sign_in_at { Time.now }
    current_sign_in_ip { Faker::Internet.ip_v4_address }
    last_sign_in_ip { Faker::Internet.ip_v4_address }
    created_at { Time.now }
    updated_at { Time.now }
    gravatar { Faker::Code.isbn }
  end
end
