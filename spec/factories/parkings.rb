FactoryBot.define do
  factory :parking do
    sequence(:curb_id) {|n| "curb #{n}"}
    time_out { "2018-12-18 10:46:42" }
    legal { true }
    sequence(:street_name) {|n| "Street #{n}" }
    sequence(:start_cross_street) {|n| "Start cross street #{n}" }
    sequence(:end_cross_street) {|n| "End cross street #{n}" }
    side_of_street { "SE" }
    user
  end
end
