ActiveAdmin.register Comment do
  permit_params :commenter, :body, :article_id

  index do
    selectable_column
    id_column
    column :commenter
    column :body
    column :article
    column :created_at
    column :updated_at
    actions
  end
end
