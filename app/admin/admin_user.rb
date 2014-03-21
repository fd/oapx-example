ActiveAdmin.register AdminUser do
  index do
    column :picture do |v|
      unless v.picture.blank?
        image_tag v.picture, width: 50
      end
    end
    column :name
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
