class CursoItem < ActiveRecord::Base
  belongs_to :curso
  belongs_to :registro
  belongs_to :order
  


  def total_precio
		curso.precio * quantity
	end
end
