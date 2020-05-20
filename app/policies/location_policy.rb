class LocationPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # new & create seulement si le user est connecté à son compte
  def create?
    user_loggedin?
  end

  # edit & update seulement si le current_user connecté est enregistré dans le user_id de la location
  def update?
    authorization
  end

  # destroy seulement si le current_user connecté est enregistré dans le user_id de la location
  def destroy?
    authorization
  end

  # renvoi true si le user est connecté à son compte (user == current_user)
  def user_loggedin?
    user != nil
  end

  # renvoi true si le user est connecté à son compte et que son id est identique au user_id de la location
  def authorization
    if user_loggedin?
      record.user == user
    end
  end

end
