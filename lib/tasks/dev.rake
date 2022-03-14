namespace :dev do
  desc "set dev environment"
  task setup: :environment do
    puts "register contacts"
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 35.years.ago, to: 18.years.ago)
      )
    end
    puts "contacts registered with success"
  end

end
