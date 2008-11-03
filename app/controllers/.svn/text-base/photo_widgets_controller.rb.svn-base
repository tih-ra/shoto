class PhotoWidgetsController < ApplicationController
def index
  assetable_id = params[:assetable_id] ? params[:assetable_id] : nil
  @photos = Photo.paginate(:page => params[:page], :per_page => 42, :order=> 'id DESC', :conditions=>{:assetable_type=>params[:assetable_type], :assetable_id=>assetable_id}) 
    
  respond_to do |format|
    format.html { render :template=> '/photo_widgets/index', :layout => false }
    format.js { 
      if params[:selector]
        render :template=> '/photo_widgets/index.html.erb', :layout => false
      end
    }
  end
end
    
 end
