module V1
  class PhonesController < ApplicationController
    before_action :set_contact

    # POST /contacts/:contact_id/phone
    def create
      @contact.phones << Phone.new(phone_params)

      if @contact.save
        render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
      else
        render json: @contact.erros, status: :unprocessable_entity
      end
    end

    # GET /contacts/:contact_id/phones
    def show
      render json: @contact.phones
    end

    # PATCH /contacts/:contact_id/phone
    def update
      phone = Phone.find(phone_params[:id])
      if phone.update(phone_params)
        render json: @contact.phones
      end
    end

    # DELETE /contacts/:contact_id/phones
    def destroy
      phone = Phone.find(phone_params[:id])
      phone.destroy
    end

    private

    def set_contact
      @contact = Contact.find(params[:contact_id])
    end

    def phone_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
  end
end
