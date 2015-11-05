require_dependency 'contacts/application_controller'

module Contacts
  class ContactsController < ApplicationController

    before_action :set_contact, only: [:show, :edit, :update, :destroy]

    respond_to :html

    def index
      @contacts = Contact.all
      respond_with(@contacts)
    end

    def new
      @contact = Contact.new
      respond_with(@contact)
    end

    def create
      @contact = Contact.new(contact_params)
      @contact.save
      respond_with(@contact)
    end

    def edit
    end

    def update
      @contact.update(contact_params)
      respond_with(@contact)
    end

    def destroy
      if !@contact.company.nil? && @contact.company.main_contact_id == @contact.id && Contact.by_company(@contact.company).count > 1
        redirect_to contacts_path, flash: { error: "Company '#{@contact.company.name}' stilled used by other contacts!" }
        return
      end
      @contact.destroy
      respond_with(@contact)
    end

    private

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:firstname, :lastname, :birthdate, :note, :created_at, :update_at, :supplier, :company_id,
      company_attributes:[:id, :name, :_destroy],
      phones_attributes:[:id, :phonetype, :phonenumber, :_destroy],
      emails_attributes:[:id, :emailtype, :email, :_destroy],
      addresses_attributes:[:id, :addresstype, :street, :housenumber, :postalcode, :city, :country, :_destroy],
      homepages_attributes:[:id, :homepagetype, :url, :_destroy])
    end

  end
end
