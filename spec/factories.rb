FactoryBot.define do
  factory :animal do
    name "Winslow"
    species "Dog"
    gender "M"
    dob Date.today - 1.year
    description "A sweet and friendly corgi who loves swimming and playing fetch."
    arrival_date Date.today - 1.month
  end
end
