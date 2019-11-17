module CompanyHelper

  def regions_name_id
    region = Region.all
    region.map { |item| [item.name, item.id] }
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
    contact.map{|item| [item.name, item.id]}
  end


  def service_name_id
    service = Service.all
    service.map { |item| [item.name, item.id] }
  end

  def spherework_name_id
    spherework = Spherework.all
    spherework.map { |item| [item.name, item.id] }
  end

  def names_contacts_in_str(ids_contacts)
    contacts = ''
    ids_contacts.each do |item|
      contacts = contacts +
          (Contact.find(item)).name + ', '
    end
    contacts.chomp(', ')
  end

  def user_name_id
    user = User.all
    user.map { |item| [item.name, item.id] }
  end

  def add_info_companies(company, clas, item)
    case
    when clas == :instrument
      company.instruments << Instrument.find(item.to_i)
    when clas == :contact
      company.contacts << Contact.find(item.to_i)
    when clas == :service
      company.services << Service.find(item.to_i)
    when clas == :spherework
      company.sphereworks << Spherework.find(item.to_i)
    end
  end

end
