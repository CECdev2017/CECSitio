class Order < ActiveRecord::Base

	has_many :curso_items, dependent: :destroy
	
	validates :name, :email, :address, :telefono, :city, :country, presence: true
	
	def add_curso_items_from_registro(registro)
		registro.curso_items.each do |item|
			item.registro_id = nil 
			curso_items << item
		end
	end
	
	def total_precio
	  curso_items.map(&:total_precio).sum
	end
		

end
