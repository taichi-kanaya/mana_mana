class User < ActiveRecord::Base
  has_many :categories, through: :user_access_categories_share_user
  has_many :user_access_categories_share_user, class_name: "UserAccessCategory", :foreign_key => "created_user_id"
  has_many :user_access_categories_shared_user, class_name: "UserAccessCategory", :foreign_key => "user_id"
  has_secure_password
end