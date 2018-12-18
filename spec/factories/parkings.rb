FactoryBot.define do
  factory :parking do
    coord { "" }
    curb_id { 1 }
    time_out { "2018-12-18 10:46:42" }
    legal { false }
    street_name { "MyString" }
    start_cross_street { "MyString" }
    end_cross_street { "MyString" }
    side_of_street { "MyString" }
    user { nil }
  end
end
