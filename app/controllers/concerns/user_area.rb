module UserArea
  def self.included(base)
    base.class_eval do
       layout "users"

       before_action :set_user
    end
  end
  
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def has_ownership?
    current_user && @user.id == current_user.id
  end
end
