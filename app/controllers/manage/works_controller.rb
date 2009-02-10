class Manage::WorksController < Manage::MainController
  before_filter :find_work, :only => [:show, :edit, :update, :destroy]
  configure_igogo_uploader(:options=>{:upload_url=>"/manage/photos", :work_file_name=>"Filedata"})
  before_filter :producer_required
  uses_tiny_mce(:options => {:theme => 'advanced',
                             #:browsers => %w{msie gecko safari},
                             :cleanup_on_startup => true,
                             :cleanup => true,
                             :theme_advanced_toolbar_location => "top",
                             :theme_advanced_toolbar_align => "center",
                             :theme_advanced_resizing => true,
                             :theme_advanced_resize_horizontal => true,
                             :paste_auto_cleanup_on_paste => false,
                             :extended_valid_elements => "object[classid|codebase|width|height|align], param[name|value], embed[quality|type|pluginspage|width|height|src|align|wmode|allowscriptaccess|allowfullscreen|flashvars]",
                             :convert_urls => false,
                             :theme_advanced_buttons1 => %w{code template bold italic underline strikethrough separator justifyleft justifycenter justifyright separator bullist numlist separator link unlink image media hrcut suser formatselect},
                             :theme_advanced_buttons2 => [],
                             :theme_advanced_buttons3 => [],
                             :plugins => %w{contextmenu paste template safari media hrcut xhtmlxtras pagebreak suser},
                             :apply_source_formatting => true,
                             },
                :only => [:new, :edit, :show, :index])
                
  
  def index
    @works = Work.all.paginate(:page => params[:page], :per_page => 15, :order=> 'created_at DESC')
  end
  def new
    @work = Work.new
  end
  
  
  def create
    @work = Work.new(params[:work])
    @work.save!
    if params[:work_photo][:uploaded_data]!=""
     work_photo = WorkPhoto.new(params[:work_photo])
     work_photo.work = @work
     work_photo.save!
    end
    redirect_to manage_works_path
    rescue ActiveRecord::RecordInvalid
      render :action => 'new'
  end

  def update
    @work.update_attributes(params[:work])
    if params[:work_photo][:uploaded_data]!=""
    if @work.work_photo 
      @work.work_photo.update_attributes(params[:work_photo])
      @work.work_photo.save!
    else
      work_photo = WorkPhoto.new(params[:work_photo])
      work_photo.work = @work
      work_photo.save!
    end
    end
    @work.save!
    redirect_to manage_works_path
    rescue ActiveRecord::RecordInvalid
      render :action => 'edit'
  end

  def edit
    
  end

  def destroy
    @work.destroy
    redirect_to new_manage_work_path
  end
  

  def show
  end
  
  
  private
  def find_work
    @work = Work.find(params[:id])
  end
end
