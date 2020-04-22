ActiveAdmin.register Gamenight do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :date, :start_time, :end_time, :description, :location_id, :boardgame_id, :status

  index do
    selectable_column
    column :id
    column :date
    column :start_time
    column :created_at
    column :location_id
    column :boardgame_id
    actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:date, :start_time, :end_time, :description, :location_id, :boardgame_id, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
