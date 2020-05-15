FactoryBot.define do

  factory :destination do
    family_name        {"山田"}
    first_name         {"太郎"}
    family_name_kana   {"ヤマダ"}
    first_name_kana    {"タロウ"}
    post_code          {"000-000"}
    city               {"渋谷区"}
    address            {"青山1-1-1"}
  end

end