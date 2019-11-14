class TalkController < ApplicationController

  def create
    binding.pry
     talk = Talk.new(params_talk)
      if talk.save!
        redirect_to Company.find(params_talk[:company_id])
      end
  end

  private

  def params_talk
    param ={}
    params.require(:talk).each { |item| param[item[0].to_sym] = item[1] } unless params.require(:talk).nil?
    param[:user_id] = current_user
    param
  end

  def params_id
    params.require(:id).to_i
  end

end
