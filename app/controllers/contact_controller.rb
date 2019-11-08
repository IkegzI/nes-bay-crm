class ContactController < ApplicationController
  def new
    Contact.new
  end

  def create
    @contact = Contact.new()
  end

  def index
    @contact = Contact.all
  end

  def show
    @contact = Contact.find(params_id)
  end

  def destroy
  end

  private

  def params_id
    params.require(:id).to_i
  end

  def params_contact
    param = {}
    params.require(:contact).each { |item| param[item[0].to_sym] = item[1] }
    return param
  end

end
