module ContactHelper

  # def names_company_in_str(ids_company)
  #   companies = ''
  #   ids_company.each{ |item| companies = companies + (Company.find(item)).name + ', '}
  #   companies.chomp(', ')
  # end

  def region_currect_contact(contact)
    contact.companies.first.region
  end


  end
