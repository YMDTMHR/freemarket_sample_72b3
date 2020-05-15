FactoryBot.define do

  factory :user do
    nickname              {"ミカイ"}
    email                 {"111@111"}
    family_name           {"山田"}
    first_name            {"太郎"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"タロウ"}
      birth_day           {"1990-07-23"}
    password              {"a0000000"}
    password_confirmation {"a0000000"}
  end

end