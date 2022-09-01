class PostPolicy < class ApplicationPolicy

	def index?
		authorize @posts
	end

end