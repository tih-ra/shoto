class Manage::ProjectsController < Manage::MainController
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
    
  end
  def new
    @project = Project.new
  end
end
