module UserHelper

  def regions_name_id
    region = Region.all
    region.map{|item| [item.name, item.id]}
  end

  def role_name_id
    role = Role.all
    role.map{|item| [item.name, item.id]}
  end



end
