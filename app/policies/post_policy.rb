class PostPolicy < class ApplicationPolicy

	def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
		post.admin? or not record.published?

  end

  def edit?
    update?
  end

  def destroy?
    false
  end


end