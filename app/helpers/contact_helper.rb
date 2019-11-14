module ContactHelper

  def names_company_in_str(ids_company)
    companies = ''
    ids_company.each{ |item| companies = companies + (Company.find(item)).name + ', '}
    companies.chomp(', ')
  end

  def companies_name_id
    company = Company.all
    company.map{|item| [item.name, item.id]}
  end

  def contact_name_id
    contact = Contact.all
    contact.map{|item| [item.name, item.id]}
  end

  def region_currect_contact(contact)
    contact.companies.first.region
  end


  end
