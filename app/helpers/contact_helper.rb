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

end
