class PagesController < ApplicationController

	include CurrentRegistro
	before_action :set_registro, only: [:index, :shop, :about]

  def index
  	@cursos = Curso.all
  end

  def shop
  	@cursos = Curso.all
  end 

  	def about
	end

end
