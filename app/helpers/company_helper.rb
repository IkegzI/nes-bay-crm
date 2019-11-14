module CompanyHelper

  def regions_name_id
    region = Region.all
    region.map{|item| [item.name, item.id]}
  end

  def names_contacts_in_str(ids_contacts)
    contacts = ''
    ids_contacts.each do |item| contacts = contacts +
        (Contact.find(item)).name + ', '
    end
    contacts.chomp(', ')
  end

  def user_name_id
    user = User.all
    user.map{|item| [item.name, item.id]}
  end

end
