module TalkHelper
  include CompanyHelper

  def typetalk_name_id
    typetalk = Typetalk.all
    typetalk.map{|item| [item.name, item.id]}
  end
end
