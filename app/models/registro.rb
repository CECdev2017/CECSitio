class Registro < ActiveRecord::Base

	has_many :curso_items,  dependent:  :destroy

	def add_curso(curso_id)

		current_item = curso_items.find_by(curso_id: curso_id)

		if current_item

			current_item.quantity += 1
		else
		current_item = curso_items.build(curso_id: curso_id)
		end
	current_item
	end

	def total_precio
		curso_items.to_a.sum{ |item| item.total_precio }
	end

end
