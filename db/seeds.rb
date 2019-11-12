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
            role_id: Role.all.sample.id,
            region_id: Region.all.sample.id)
puts
User.create(name: 'Иван Иванов', login: 'manager2', pass: '123',
            role_id: Role.all.sample.id,
            region_id: Region.all.sample.id)

User.create(name: 'Артур Нитаньяху', login: 'manager3', pass: '123',
            role_id: Role.all.sample.id,
            region_id: Region.all.sample.id)

User.create(name: 'Иван Ургант', login: 'manager4', pass: '123',
            role_id: Role.all.sample.id,
            region_id: Region.all.sample.id)

Instrument.create(name: 'Дисковые пилы')
Instrument.create(name: 'Сверла')
Instrument.create(name: 'Насадные фрезы')
Instrument.create(name: 'Концевой ЧПУ')
Instrument.create(name: 'Концевой без ЧПУ')
Instrument.create(name: 'Нож. пластины')
Instrument.create(name: 'Ленточные пилы')
Instrument.create(name: 'Другой инструмент')

Service.create(name: 'Заточка HW')
Service.create(name: 'Заточка DIA')

Spherework.create(name: 'Мебель плитн.')
Spherework.create(name: 'Мебель массив')
Spherework.create(name: 'Лесопиление')
Spherework.create(name: 'Раскрой плитн.')
Spherework.create(name: 'Пластик')
Spherework.create(name: 'Композит')
Spherework.create(name: 'Алюминий')
Spherework.create(name: 'Камень')
Spherework.create(name: 'Напольные покрытия')
Spherework.create(name: 'Другое')

Status.create(name: 'Приоритетный')
Status.create(name: 'Постоянный')
Status.create(name: 'Хотим сотрудничать')
Status.create(name: 'Покупает Редко')
Status.create(name: 'Перекупщик')
Status.create(name: 'Прекратил сотрудничество')


100.times do
  company = Company.new(
      name: 'Компания ' + random_str,
      address: 'ул. ' + random_str + ' ДОМ ' + random_num(rand(1..2)) ,
      phone: '+7' + random_num(10),
      region_id: Region.all.sample.id,
      user_id: (User.all.sample).id,
      active: true,
      status_id: Status.all.sample.id
  )
  puts 'Создание компании ' + (company.save).to_s
  # company.status =

  company.save

  rand(1..Instrument.all.size).times{ |rnd| company.instruments << Instrument.all.sample}
  rand(1..Service.all.size).times{ |rnd| company.services << Service.all.sample}
  rand(1..Spherework.all.size).times{ |rnd| company.sphereworks << Spherework.all.sample}
end

200.times do |item|
  contact = Contact.new(
      name: 'Господин ' + random_str,
      phone: '+7' + random_num(10),
      position: random_psn,
      birthday: "#{rand(1900 + 2019)}.#{rand(12)}.#{rand(28)}",
      comment: 'Этот чувак ' + random_text
  )
  company = Company.all.sample

  company.contacts << contact
  puts 'Создание контакта ' + (contact.save).to_s
  contact.save
end