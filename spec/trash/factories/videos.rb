FactoryGirl.define do

  factory :video do
    youtube_id '123'
    is_public true
    after(:build) { |v| v.user = User.first }

  end

  factory :v1, :class => Video do
    youtube_id '123455'
    is_public true
    after(:build) { |v| v.user = User.first }

  end

  factory :v2, :class => Video do
    youtube_id '123456'
    is_public true
    after(:build) { |v| v.user = User.first }

  end

  factory :v3, :class => Video do
    youtube_id '123457'
    is_public true
    after(:build) { |v| v.user = User.first }
    
  end


end
