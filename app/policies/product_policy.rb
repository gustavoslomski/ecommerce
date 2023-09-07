class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def new?
      Category.any?
    end
  end
end
