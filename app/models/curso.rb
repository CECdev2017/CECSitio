class Curso < ActiveRecord::Base

	before_destroy :ensure_not_curso_item
	
	has_many :curso_items

	validates :titulo, :descripccion, :duracion, :inicio,   presence: true

	validates :precio, numericality: {greater_than_or_equal_to: 0.01}

	validates :titulo, uniqueness: true
	
	has_attached_file :image, styles: { medium: "730x730>", thumb: "100x100>" }
	#do_not_validate_attachment_file_type :image
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	def ensure_not_curso_item
  		if curso_items.empty?
  			return true
  		else
  			errors.add(:base, 'Usted tiene Cursos registrados')
  			return false
  		end
  	end

end
