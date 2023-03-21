ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :description, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:description, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  scope :all
  scope :long_description 

  filter :description, filters: [:starts_with, :ends_with]
  filter :user

  config.per_page = 3
  menu priority: 1
  menu parent: "Blog"

  index do
    id_column
    column :description
    column :user
    actions
  end
  index as: :blog do
  end

  action_item :view,only: :show do
    link_to "view on site", post
  end

  sidebar :help do
    "Need help? Email us at help@example.com"
  end
  
end
