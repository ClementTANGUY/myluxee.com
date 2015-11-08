FactoryGirl.define do
  factory :store_news do
    content "MyText"
  end
  factory :user do
    encrypted_password Devise.bcrypt(SalesAssociate, 'password')
    password "password"
    password_confirmation "password"
    factory :sales_associate, class: SalesAssociate do
      type "SalesAssociate"
      be_contacted false
      be_rated false
      factory :john do
        first_name "John"
        last_name "Wayne"
        email "john@gmail.com.br"
      end
      factory :marie do
        first_name "Marie"
        last_name "S."
        email "marie@gmail.com.br"
      end

      factory :account, class: Account do
        type "Account"
        factory :peter do
          first_name "Peter"
          last_name "Smith"
          email "peter@gmail.com.br"
        end

      end
    end
  end
  factory :brand do
    factory :agnes_brand do
      name "Agnes B"
      speciality "Fashion & Accessories"
    end

    factory :gerard_brand do
      name "Gerard Darel"
      speciality "Fashion & Accessories"
    end
  end

  factory :agnes_store, class: :store do
    address "17-21 rue du Faubourg Saint-Honoré"
    state "Paris"
    city "Paris"
    zip_code "75008"
    country "France"
    monday true
    tuesday true
    wednesday true
    thursday true
    friday true
    saturday true
    sunday false
    monday_start "11:00"
    monday_end "19:00"
    tuesday_start "11:00"
    tuesday_end "19:00"
    wednesday_start "11:00"
    wednesday_end "19:00"
    thursday_start "11:00"
    thursday_end "19:00"
    friday_start "11:00"
    friday_end "19:00"
    saturday_start "10:30"
    saturday_end "19:00"
    sunday_start nil
    sunday_end nil
    association :brand, factory: :agnes_brand
  end
  factory :gerard_store, class: :store do
    address "24 rue du Faubourg Saint-Honoré"
    state "Paris"
    city "Paris"
    zip_code "75008"
    country "France"
    monday true
    tuesday true
    wednesday true
    thursday true
    friday true
    saturday true
    sunday false
    monday_start "10:30"
    monday_end "18:30"
    tuesday_start "10:30"
    tuesday_end "18:30"
    wednesday_start "10:30"
    wednesday_end "18:30"
    thursday_start "10:30"
    thursday_end "18:30"
    friday_start "10:30"
    friday_end "18:30"
    saturday_start "10:30"
    saturday_end "18:30"
    sunday_start nil
    sunday_end nil
    association :brand, factory: :gerard_brand
  end

  factory :portuguese, class: :language do
    name "Portuguese"
  end

  factory :english, class: :language do
    name "English"
  end
end



