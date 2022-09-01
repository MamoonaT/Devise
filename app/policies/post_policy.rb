class PostPolicy < ApplicationPolicy

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
		user.present?
  end

  def edit?
    update?
  end

  def destroy?
		user.present?
  end


end