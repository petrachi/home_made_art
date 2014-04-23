module UserArea
  def self.included(base)
    base.class_eval do
       layout 'users'

       before_action :set_user
    end
  end
  
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def has_ownership?
    current_user && @user == current_user
  end
  
  def check_ownership!
    if !has_ownership?
      redirect_to root_url, alert: I18n.t('account.unauthorized')
    end
  end
end
