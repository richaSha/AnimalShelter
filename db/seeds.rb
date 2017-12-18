
Animal.destroy_all

50.times do |index|
  Animal.create!(
    name: Faker::Name.name,
    species: Faker::Lorem.word,
    gender: index % 2 == 0 ? "Male" : "Female",
    dob: Faker::Date.birthday(3, 17),
    description: Faker::Lorem.sentence,
    arrival_date: Faker::Date.between(364.days.ago, Date.today)
  )
end

p "Created #{Animal.count} animals"
