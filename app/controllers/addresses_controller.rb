class AddressesController < ApplicationController
  before_action :set_address

  # GET /address/id
  def show
    render json: @address
  end

  private

  def set_address
    @address = Contact.find(params[:contact_id]).address
  end
end
