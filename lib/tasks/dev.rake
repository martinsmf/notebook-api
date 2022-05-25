namespace :dev do
  desc "set dev environment"
  task setup: :environment do
    %x(rails db:drop db:create db:migrate)

    puts "register contacts types"

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind,
      )
    end

    puts "contacts types registered with success"

    puts "register contacts"
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 35.years.ago, to: 18.years.ago),
        kind: Kind.all.sample,
      )
    end
    puts "contacts registered with success"

    puts "Cadastrando os telefones..."

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.new(number: Faker::PhoneNumber.cell_phone)
        contact.phones << phone
      end
    end

    puts "Telefones cadastrados com sucesso!"

    puts "Cadastrando os addresses..."

    Contact.all.each do |contact|
      address = Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact,
      )
    end

    puts "addresses cadastrados com sucesso!"
  end
end
