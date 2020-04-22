ActiveAdmin.register Participation do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :rating, :description, :user_id, :gamenight_id


  index do
    selectable_column
    column :id
    column :rating
    column :description
    column :user_id
    column :gamenight_id
    actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:rating, :description, :user_id, :gamenight_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
