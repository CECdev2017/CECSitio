module CurrentRegistro

	private 

	def set_registro
		@registro = Registro.find(session[:registro_id])
	rescue ActiveRecord::RecordNotFound
		@registro = Registro.create
		session[:registro_id] = @registro.id
	end
end