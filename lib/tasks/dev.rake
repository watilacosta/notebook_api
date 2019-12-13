namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

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

  end

end
