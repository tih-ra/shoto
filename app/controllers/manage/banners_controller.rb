class Manage::BannersController < Manage::MainController
  before_filter :find_banner, :only=>[:destroy, :edit, :update]
  before_filter :login_required
  def index
    @banners = Banner.paginate(:page => params[:page], :per_page => 15, :order=>"created_at DESC")
  end
  def create
    @baner = Banner.new(params[:banner])
    @baner.save
    redirect_to manage_banners_path
  end
  def destroy
    @banner.destroy
    redirect_to manage_banners_path
  end
  def update
    @banner.update_attributes(params[:banner])
    @banner.save!
    redirect_to manage_banners_path
  end
  private
  def find_banner
    @banner = Banner.find(params[:id])
  end
end
