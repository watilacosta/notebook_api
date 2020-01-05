class PhonesController < ApplicationController

  before_action :set_phone, only: [:show]

  # GET /phones/1
  def show
    render json: @phones
  end

  private

  def set_phone
    @phones = Contact.find(params[:contact_id]).phones
  end
end
