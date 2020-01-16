module CompanyHelper

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
