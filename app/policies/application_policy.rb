# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true if user.present?
  end

  def new?
    true if user.present?
  end

  def update?
    return true if user.present? && user == record.user
  end

  def edit?
    return update?
  end

  def destroy?
    return update?
  end
end
