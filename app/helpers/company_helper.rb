module CompanyHelper

  # def regions_name_id_with_filter(company)
  #   company = Company.find(company.id).regions.map { |item| [item.name, item.id] }
  #   region = Region.all.map { |item| [item.name, item.id] }
  #   region - company
  # end
  #
  #
  # def instruments_name_id_with_filter(company)
  #   company = Company.find(company.id).instruments.map { |item| [item.name, item.id] }
  #   instruments = Instrument.all.map { |item| [item.name, item.id] }
  #   instruments - company
  # end
  #
  # def contact_name_id_with_filter(company)
  #   company = Company.find(company.id).contacts.map { |item| [item.name, item.id] }
  #   contact = Contact.all.map { |item| [item.name, item.id] }
  #   contact - company
  # end
  #
  # def service_name_id_with_filter(company)
  #   company = Company.find(company.id).services.map { |item| [item.name, item.id] }
  #   service = Service.all.map { |item| [item.name, item.id] }
  #   service - company
  # end
  #
  # def spherework_name_id_with_filter(company)
  #   company = Company.find(company.id).sphereworks.map { |item| [item.name, item.id] }
  #   spherework = Spherework.all.map { |item| [item.name, item.id] }
  #   spherework - company
  # end

  def names_contacts_in_str(ids_contacts)
    contacts = ''
    ids_contacts.each do |item|
      contacts = contacts +
          (Contact.find(item)).name + ', '
    end
    contacts.chomp(', ')
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
