FactoryBot.define do

  factory :product do
    name               {"abe"}
    description        {"やすい"}
    price              {"1000"}
    status             {"00000000"}
    shipping_cost      {"00000000"}
    shipping_days      {"00000000"}
    prefecture_id      {"00000000"}
    category_id        {"00000000"}
    user_id            {"00000000"}
  end

end