class ProductPolicy < ApplicationPolicy
  def new?
    Category.any?
  end
end
