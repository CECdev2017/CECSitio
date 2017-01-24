class CursoItemsController < ApplicationController

	include CurrentRegistro
	before_action :set_registro, only: [:create]
	before_action :set_curso_item, only: [:show, :destroy]

def create
	curso = Curso.find(params[:curso_id])
	@curso_item = @registro.add_curso(curso.id)
	if @curso_item.save
		redirect_to shop_url, notice: 'Curso Agregado al registro de Inscripccion'

	else

		render :new
	end
	
end

	private

	def set_curso_items
		@curso_item = CursoItem.find(params[:curso_id])

	end

def curso_item_params
	params.require(:curso_item).permit(:curso_id)
end


end
