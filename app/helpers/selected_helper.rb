module SelectedHelper

  def typetalk_name_id
    typetalk = Typetalk.all
    typetalk.map { |item| [item.name, item.id] }
  end

  def regions_name_id
    region = Region.all
    region.map { |item| [item.name, item.id] }
  end

  def role_name_id
    role = Role.all
    role.map { |item| [item.name, item.id] }
  end

  def statuses_name_id
    status = Status.all
    status.map { |item| [item.name, item.id] }
  end

  def instruments_name_id
    instruments = Instrument.all
    instruments.map { |item| [item.name, item.id] }
  end

  def contact_name_id
    contact = Contact.all
    contact.map { |item| [item.name, item.id] }
  end

  def service_name_id
    service = Service.all
    service.map { |item| [item.name, item.id] }
  end

  def spherework_name_id
    spherework = Spherework.all
    spherework.map { |item| [item.name, item.id] }
  end

  def user_name_id
    user = User.all
    user.map { |item| [item.name, item.id] }
  end

  def companies_name_id
    company = Company.all
    company.map { |item| [item.name, item.id] }
  end

  def type_machine_name_id
    type_machine = TypeMachine.all
    type_machine.map { |item| [item.name, item.id] }
  end

  def regions_name_id_with_filter(company)
    company = Company.find(company.id).regions.map { |item| [item.name, item.id] }
    region = Region.all.map { |item| [item.name, item.id] }
    region - company
  end


  def instruments_name_id_with_filter(company)
    company = Company.find(company.id).instruments.map { |item| [item.name, item.id] }
    instruments = Instrument.all.map { |item| [item.name, item.id] }
    instruments - company
  end

  def contact_name_id_with_filter(company)
    company = Company.find(company.id).contacts.map { |item| [item.name, item.id] }
    contact = Contact.all.map { |item| [item.name, item.id] }
    contact - company
  end

  def service_name_id_with_filter(company)
    company = Company.find(company.id).services.map { |item| [item.name, item.id] }
    service = Service.all.map { |item| [item.name, item.id] }
    service - company
  end

  def spherework_name_id_with_filter(company)
    company = Company.find(company.id).sphereworks.map { |item| [item.name, item.id] }
    spherework = Spherework.all.map { |item| [item.name, item.id] }
    spherework - company
  end

  def jurface_name_id_with_filter(company)
    company = Company.find(company.id).jurfaces.map { |item| [item.name, item.id] }
    jurface = Jurface.all.map { |item| [item.name, item.id] }
    jurface - company
  end

  def machine_name_id_with_filter(company)
    company = Company.find(company.id).machines.map { |item| [item.name, item.id] }
    machine = Machine.all.map { |item| [item.name, item.id] }
    machine - company
  end

  def names_company_in_str(ids_company)
    companies = ''
    ids_company.each{ |item| companies = companies + (Company.find(item)).name + ', '}
    companies.chomp(', ')
  end

end
