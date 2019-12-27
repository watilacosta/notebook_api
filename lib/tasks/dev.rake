namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

    puts "Recriando DATABASE"
    %x(rails db:drop db:create db:migrate)
    puts "DATABASE recriado com sucesso!"

    # CADASTRANDO TIPOS
    puts "Cadastrando tipos"
    kinds = %W(Família Amigos Trabalho)
    kinds.each do |kind|
      Kind.find_or_create_by!(description: kind)
    end
    puts 'Tipos criados com sucesso.'
    
    # CADASTRANDO CONTATOS
    puts "Cadastrando Contacts..."
    100.times do |i|
      Contact.find_or_create_by!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
        kind: Kind.all.sample
      )
    end
    puts "#{Contact.all.count} contatos cadastrados"

    # CADASTRANDO PHONES
    puts "Cadastrando phones..."
    Contact.all.each do |contact|
      # Gera de 1 a 5 phones randomicamente
      Random.rand(5).times do |i|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone, contact_id: contact.id)
        contact.phones << phone
        contact.save!
      end
    end
    puts "Phones cadastrados"


     # CADASTRANDO ADDRESS
     puts "Cadastrando endereços..."
     Contact.all.each do |contact|
       Address.create!(
         street: Faker::Address.street_address,
         city: Faker::Address.city,
         contact: contact
       )
     end
     puts "Endereços cadastrados"
  end

end
