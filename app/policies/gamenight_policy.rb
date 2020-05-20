class GamenightPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # show pour tout le monde (pas besoin d'être connecté)
  def show?
    true
  end

  # new & create seulement si le user est connecté à son compte
  def create?
    user_loggedin?
  end

  # edit & update seulement si le current_user connecté est enregistré dans le user_id du boardgame lié à la gamenight
  def update?
    authorization
  end

  # destroy seulement si le current_user connecté est enregistré dans le user_id du boardgame lié à la gamenight
  def destroy?
    authorization
  end

  # renvoi true si le user est connecté à son compte (user == current_user)
  def user_loggedin?
    user != nil
  end

  # renvoi true si le user est connecté à son compte et que son id est identique au user_id du boardgame lié à la gamenight
  def authorization
    if user_loggedin?
      record.boardgame.user == user
    end
  end

end
