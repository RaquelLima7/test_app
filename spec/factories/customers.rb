FactoryBot.define do
  factory :customer, aliases: [:user] do

    # transient do
    #   upcased false
    #   qtt_orders 3
    # end

    #toda vez que passar um atributo dinâmico passar em bloco
    name { Faker::Name.name }
    address { Faker::Address.street_address}

    #email { Faker::Internet.email }
    sequence(:email) { |n| "meu_email-#{n}@email.com" }

    # trait :male do
    #   gender 'M'
    # end

    # trait :female do
    #   gender 'F'
    # end

    # trait :vip do
    #   vip true
    #   days_to_pay 30
    # end

    # trait :default do
    #   vip false
    #   days_to_pay 15
    # end

    # # Para poder criar vários pedidos no momento em que invocar um cliente, começa criando uma trait
    # # o padrão é 3 (linha 6) 
    # trait :with_orders do
    #   after(:create) do |customer, evaluator|
    #    create_list(:order, evaluator.qtt_orders, customer: customer) # evaluator e o qtt_orders que é o transient informado na linha 4
    #   end
    #   # Cria uma lista de pedidos com a quantidade que a pessoa enviar, se não enviar vao ser o 3
    #   # que é o valor informado no transient da linha 4 e o cliente vai ser o próprio da fábrica.
    # end

    # factory :customer_with_orders, traits: [:with_orders]
    # factory :customer_male, traits: [:male]
    # factory :customer_female, traits: [:female]
    # factory :customer_vip, traits: [:vip]
    # factory :customer_default, traits: [:default]
    # factory :customer_male_vip, traits: [:male, :vip]
    # factory :customer_female_vip, traits: [:female, :vip]
    # factory :customer_male_default, traits: [:male, :default]
    # factory :customer_female_default, traits: [:female, :default]

    # after(:create) do |customer, evaluator|
    #   customer.name.upcase! if evaluator.upcased
    # end
  end
end