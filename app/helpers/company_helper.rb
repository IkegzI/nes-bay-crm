module CompanyHelper

  def names_contacts_in_str(ids_contacts)
    contacts = ''
    ids_contacts.each{ |item| contacts = contacts + (Contact.find(item)).name + ', '}
    contacts.chomp(', ')
  end

end
