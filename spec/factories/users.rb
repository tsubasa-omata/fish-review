FactoryBot.define do
  factory :user do
    name         { 'Example User' }
    email        { 'user@example.com' }
    user_id_name { 'Example User' }
    password     { 'foobar' }
  end
end
