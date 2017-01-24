class ContactsController < ApplicationController
	
	include CurrentRegistro
	before_action :set_registro, only: [:new, :create]
	
	def new
		@contact = Contact.new
	end
	
	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			redirect_to root_url, notice: 'Gracias por tu comentario'
		else
		  render :new
		end
	end
	
	private
	
	def contact_params
		params.require(:contact).permit(:name, :email, :message)
	end
	
end