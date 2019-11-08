class ContactController < ApplicationController
  def new
  end

  def create
    @contact = Contact.new(params_contact)

    if @contact.save
      @contact.companies << company_selected
    end
    redirect_to action: "index"
  end

  def index
    @contact = Contact.all
  end

  def show
    @contact = Contact.find(params_id)
  end

  def destroy
    Contact.delete(params_id)
    redirect_to action: 'index'
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

  def company_selected
    Company.find(params.require(:company).values.first)
  end

end
