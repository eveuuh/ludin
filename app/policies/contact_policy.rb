class ContactPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # new & create pour tout le monde (pas besoin d'être connecté)
  def create?
    true
  end

end
