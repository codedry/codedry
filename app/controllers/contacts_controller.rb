class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        Notifier.contact_received(@contact).deliver_later!
        Notifier.contact_received_acknowledgement(@contact).deliver_later!

        format.js { render :success }
      else
        format.js { render :new }
      end
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
