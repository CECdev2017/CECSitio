ActiveAdmin.register Order do
	permit_params :shipped

	after_update do |order|
		OrderNotifier.shipped(@order).deliver if order.shipped
	end

	show do |order|

		panel 'Detalles del Cliente o Alumno' do	
			attributes_table_for order, :name, :email, :address, :city, :country, :created_at
		end

		panel 'Created' do
		  "#{time_ago_in_words order.created_at} ago"
		end
		
		panel 'Shipped' do
		  order.shipped
		end
		
		panel 'Detalle de la inscripcion' do
			table_for(order.curso_items) do
				column 'Curso' do |item|
					item.curso.titulo
				end
				column 'Cantidad' do |item|
					item.quantity
				end
				column 'Precio' do |item|
					number_to_currency item.total_precio
				end
			end
		end		
		panel 'Total de la orden' do
			number_to_currency order.total_precio
		end
	end					
end
