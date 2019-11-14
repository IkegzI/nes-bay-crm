module RegionHelper

  def sample_company(cycles)
    company = []
    (cycles.to_i).times { || company << Company.all.sample }
    company
  end

  def sample_contact(cycles)
    contact = []
    (cycles.to_i).times { || contact << Contact.all.sample }
    contact
  end

  def amount_company(region_id)
    Company.where(region_id: region_id).size
  end

  def amount_contact(region_id)
    contact_region(region_id).size
  end


  private

  def contact_region(region_id)
    contact = []
    company = Company.where(region_id: region_id)
    company.each do |item|
      item.contacts.each { |cnt| contact << cnt }
    end
    contact
  end

end
