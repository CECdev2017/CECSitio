class RegistrosController < ApplicationController

	before_action :set_registro, only: [:show, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :invalid_registro
	
	def new 
		@registro = Registro.new
	end

	def show

	end

	def destroy
	@registro.destroy if @registro.id == session[:registro_id]
	session[:registro_id] = nil

	redirect_to shop_url, notice:  'Su Registro para inscribirse esta incompleto'

	end

	private

	def set_registro
		@registro = Registro.find(params[:id])

	end

	def registro_params	
		params[:registro]
	end

	def invalid_registro
		logger_error  'Su Inscripccion es invalida'
		redirect_to shop_url, notice: 'Inscripccion Invalida'

		

	end

end
