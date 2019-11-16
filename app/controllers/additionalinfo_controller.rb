class AdditionalinfoController < ApplicationController
  def new
  end

  def instrument
    @instrument = Instrument.find(params_id)
    @company = @instrument.companies
  end

  def service
    @service = Service.find(params_id)
    @company = @service.companies
  end

  def spherework
    @spherework = Spherework.find(params_id)
    @company = @spherework.companies
  end

  private

  def params_id
    params.require(:id).to_i
  end
end
