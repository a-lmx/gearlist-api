FactoryGirl.define do
  factory :user do
    username    'eggplant'
    uid         '123456'
    provider    'google'
    token       '6789'
  end

end
