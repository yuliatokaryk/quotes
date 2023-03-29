# frozen_string_literal: true

class AuthorPolicy < ApplicationPolicy
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
    true
  end

  def new?
    true
  end

  def update?
    return true if user == record.user || user.admin? || user.moderator?
  end

  def edit?
    return update?
  end

  def destroy?
    return update?
  end
end
