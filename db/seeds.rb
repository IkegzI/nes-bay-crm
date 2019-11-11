# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
def random_str
  words  = ('а'..'я').map{ |item| item }
  words << ' '
  word = ''
  rand(2..10).times {|i| word += words[rand(words.size)]}
  word
end
def random_text
  words  = ('а'..'я').map{ |item| item}
  words << ' '
  word = ''
  rand(60..255).times {|i| word += words[rand(words.size)]}
  word
end
def random_num(cycles)
  words  = ('0'..'9').map{ |item| item}
  word = ''
  cycles.times {|i| word += words[rand(words.size)]}
  word
end
def random_psn
  words = ['Менеджер', 'Директор', 'Водитель', 'Снабженец']
  words[rand(words.size)]
end


Region.create(name: 'Иркутская область')
Region.create(name: 'Красноярский край')

Role.create(name: "Директор")
Role.create(name: "Руководитель подразделения")
Role.create(name: "Менеджер")
Role.create(name: "Заточник")

User.create(name: 'Артур Пирожков', login: 'manager1', pass: '123',
            role_id: Role.ids[rand(0..Role.all.size-1)],
            region_id: Region.ids[rand(0..(Region.all.size-1))])
puts
User.create(name: 'Иван Иванов', login: 'manager2', pass: '123',
            role_id: Role.ids[rand(0..Role.all.size)],
            region_id: Region.ids[rand(0..(Region.all.size-1))])

User.create(name: 'Артур Нитаньяху', login: 'manager3', pass: '123',
            role_id: Role.ids[rand(0..Role.all.size)],
            region_id: Region.ids[rand(0..(Region.all.size-1))])

User.create(name: 'Иван Ургант', login: 'manager4', pass: '123',
            role_id: Role.ids[rand(0..Role.all.size)],
            region_id: Region.ids[rand(0..(Region.all.size-1))])

100.times do
  company = Company.new(
      name: 'Компания ' + random_str,
      address: 'ул. ' + random_str + ' ДОМ ' + random_num(rand(1..2)) ,
      phone: '+7' + random_num(10),
      region_id: (Region.find(rand(1..Region.ids.size))).id,
      user_id: User.ids[rand(0..(User.all.size-1))]
  )
  puts 'Создание компании ' + (company.save).to_s
  company.save
end

200.times do |item|
  contact = Contact.new(
      name: 'Господин ' + random_str,
      phone: '+7' + random_num(10),
      position: random_psn,
      birthday: "#{rand(1900 + 2019)}.#{rand(12)}.#{rand(28)}",
      comment: 'Этот чувак ' + random_text
  )
  company = Company.find(Company.ids[rand(1..Company.ids.size-1)])
  company.contacts << contact
  puts 'Создание контакта ' + (contact.save).to_s
  contact.save
end