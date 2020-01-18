# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
def random_str
  words = ('а'..'я').map { |item| item }
  words << ' '
  word = ''
  rand(2..10).times { |i| word += words[rand(words.size)] }
  word
end

def random_text
  words = ('а'..'я').map { |item| item }
  words << ' '
  word = ''
  rand(60..255).times { |i| word += words[rand(words.size)] }
  word
end

def random_num(cycles)
  words = ('0'..'9').map { |item| item }
  word = ''
  cycles.times { |i| word += words[rand(words.size)] }
  word
end

def random_psn
  words = ['Менеджер', 'Директор', 'Водитель', 'Снабженец']
  words[rand(words.size)]
end


Region.create(name: 'Все регионы')
Region.create(name: 'Иркутская область')
Region.create(name: 'Красноярский край')

Role.create(name: "Администратор")
Role.create(name: "Менеджер")
Role.create(name: "Директор")
Role.create(name: "Руководитель подразделения")
Role.create(name: "Заточник")

User.create(name: 'admin', login: 'admin', pass: '123',
            role_id: Role.find_by(name: 'Администратор').id,
            region_id: Region.find_by(name: 'Все регионы').id)

User.create(name: 'Артур Пирожков', login: 'manager1', pass: '123',
            role_id: Role.all.sample.id,
            region_id: Region.all.sample.id)

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

Status.create(name: 'Неопределено')
Status.create(name: 'Прекратил сотрудничество')
Status.create(name: 'Приоритетный')
Status.create(name: 'Постоянный')
Status.create(name: 'Хотим сотрудничать')
Status.create(name: 'Покупает Редко')
Status.create(name: 'Перекупщик')


Typetalk.create(name: 'Телефон')
Typetalk.create(name: 'Почта')
Typetalk.create(name: 'Посещение')

Company.create(
    name: 'Нет информации',
    address: 'нет информации',
    phone: 'нет информации',
    active: false,
    email: '',
    site: '',
    equipment: '',
    region_id: 1,
    user_id: 1,
    status_id: 1
)

100.times do
  region = Region.all.sample.id
  company = Company.new(
      name: 'Компания ' + random_str,
      address: 'ул. ' + random_str + ' ДОМ ' + random_num(rand(1..2)),
      phone: '+7' + random_num(10),
      active: rand(10) > 5 ? true : false,
      email: random_str + "@#{rand(321312)}.ru",
      site: random_str + '.ru',
      equipment: 'Станок' + random_str,
      region_id: region,
      user_id: User.where(region_id: region).sample.id,
      status_id: Status.all.sample.id
  )
  rand(1..Instrument.all.size).times { |rnd| company.instruments << Instrument.all.sample }
  rand(1..Service.all.size).times { |rnd| company.services << Service.all.sample }
  rand(1..Spherework.all.size).times { |rnd| company.sphereworks << Spherework.all.sample }
  company.save
  puts 'Создание компании ' + (company.save).to_s

end

200.times do |item|
  contact = Contact.new(
      name: 'Господин ' + random_str,
      phone: '+7' + random_num(10),
      email: random_str + "@#{rand(321312)}.ru",
      position: random_psn,
      birthday: "#{rand(1900 + 2019)}.#{rand(12)}.#{rand(28)}",
      comment: 'Этот чувак ' + random_text
  )
  company = Company.all.sample

  company.contacts << contact
  puts 'Создание контакта ' + (contact.save).to_s
  contact.save
end

100.times do
  jurface = Jurface.create(name: "ООО '#{random_str.capitalize}'", inn: random_num(10), acc: random_num(20), company_id: Company.all.sample.id)
  puts 'Создание юр.лица ' + (jurface.save).to_s
  jurface.save
end