class PostPolicy < ApplicationPolicy
  class Scope < PostPolicy
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      @scope.where(post_id: @user.post_id)
    end
  end

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
		user.present?
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