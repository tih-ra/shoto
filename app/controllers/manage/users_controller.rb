class Manage::UsersController < Manage::MainController
  before_filter :find_user, :only=>[:edit, :update, :destroy]
  before_filter :producer_required, :only=>[:index]
  before_filter :admin_required, :only=>[:create, :destroy]
  before_filter :admin_or_self_idintification, :only=>[:edit, :update]
  def index
    @users = User.all
  end
  def edit
    
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    @user.save!
    avatar = Avatar.new(params[:avatar])
    avatar.user = @user
    avatar.save!
    
    redirect_to manage_users_path
    
    rescue ActiveRecord::RecordInvalid
      render :action => 'new'
  end
  def destroy
    @user.destroy
  end
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    if params[:avatar][:uploaded_data]!=""
    if @user.avatar 
      @user.avatar.update_attributes(params[:avatar])
      @user.avatar.save!
    else
      avatar = Avatar.new(params[:avatar])
      avatar.user = @user
      avatar.save!
    end
    end
    @user.save!
    redirect_to :back
    rescue ActiveRecord::RecordInvalid
      render :action => 'edit'
  end
  
  private
  def find_user
    @user = User.find(params[:id])
  end
  def admin_or_self_idintification
    admin_or_self_idintification_required(@user)
  end
  
end
