class Manage::ServicesController < Manage::MainController
  before_filter :find_service, :only=>[:update, :edit, :destroy]
  configure_igogo_uploader(:options=>{:upload_url=>"/manage/photos", :post_file_name=>"Filedata"})
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
                :only => [:new, :edit])
  def index
    @services = Service.all.paginate(:page => params[:page], :per_page => 7, :order=> 'created_at DESC')
  end
  def create
    @service = Service.new(params[:service])
    @service.save!
    redirect_to manage_services_path
    rescue ActiveRecord::RecordInvalid
      render :action => 'new'
  end
  def update
    @service.update_attributes(params[:service])
    @service.save!
    redirect_to manage_services_path
    rescue ActiveRecord::RecordInvalid
      render :action => 'edit'
  end
  def destroy
    @service.destroy
    redirect_to manage_services_path
  end
  private
  def find_service
    @service = Service.find(params[:id])
  end
end
