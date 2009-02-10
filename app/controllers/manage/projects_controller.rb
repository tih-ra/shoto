require 'RMagick'
require 'ostruct'
include ActionView::Helpers::DateHelper 
class Manage::ProjectsController < Manage::MainController
  before_filter :find_project, :only=>[:edit, :update, :show]
  before_filter :set_tabs, :only=>[:show]
  before_filter :moderator_required, :only=>[:create, :update, :destroy, :edit, :new]
  configure_igogo_uploader(:options=>{:upload_url=>"/manage/photos", :post_file_name=>"Filedata"})
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
    @projects = Project.all.paginate(:page => params[:page], :per_page => 15, :order=> 'created_at DESC')
  end
  def new
    @project = Project.new
  end
  def create
    @project = Project.new(params[:project])
    @project.save!
    create_milestone_image
    redirect_to manage_projects_path
    rescue ActiveRecord::RecordInvalid
      render :action => 'new'
  end
  def update
    @project.update_attributes(params[:project])
    @project.save!
    create_milestone_image
    redirect_to manage_projects_path
    rescue ActiveRecord::RecordInvalid
      render :action => 'edit'
  end
  def find_project
    @project = Project.find(params[:id])
  end
  def set_tabs
    @tabs = [OpenStruct.new(:title=>"Tasks", :link=>''), OpenStruct.new(:title=>"Файли", :link=>''), OpenStruct.new(:title=>"Обговорення", :link=>'')]
  end
  def create_milestone_image
    milestone_days = distance_of_time_in_words(@project.start_at, @project.finish_at).to_i
    line_distance = (580/milestone_days.to_f).round
    days_from_today_fill_width = (distance_of_time_in_words(@project.start_at, Date.today).to_i*line_distance)+line_distance
    days_after_crytical_date = distance_of_time_in_words(Date.today, @project.crytical_date).to_i
    days_to_crytical_date = distance_of_time_in_words(@project.start_at, @project.crytical_date).to_i
    imgl = Magick::ImageList.new
    imgl.new_image(580, 20) { self.background_color = "#f1f4de" }
    gc = Magick::Draw.new
    if (Date.today >= @project.start_at)
      gc.stroke('#37ffe7')
      gc.stroke_width(20)
      gc.line(0,10, days_from_today_fill_width,10)
    end
    
    if (Date.today >= @project.crytical_date)
      gc.stroke('#ffa2a7')
      gc.stroke_width(20)
      gc.line((days_to_crytical_date*line_distance).to_i,10, ((days_to_crytical_date+1)+days_after_crytical_date)*line_distance,10)
    end
    
    gc.stroke('#9b9b9b')
    gc.stroke_width(1)
    separator = 0
    
    for i in 1..milestone_days do
      separator += line_distance
      if i>=days_to_crytical_date
        gc.stroke('#FF0000')
      end
      gc.line(separator,0, separator,20)
    end
    gc.draw(imgl)
    imgl.write( RAILS_ROOT+"/public/milestones/milestone_#{@project.id}.gif")
  end
end
