class Manage::PostsController < Manage::MainController
    before_filter :find_post, :only => [:show, :edit, :update, :destroy]
    configure_igogo_uploader(:options=>{:upload_url=>"/manage/photos", :post_file_name=>"Filedata"})
    before_filter :editor_required
    before_filter :producer_or_my_content, :only=>[:edit, :update, :destroy]
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
      @posts = current_user.posts.paginate(:page => params[:page], :per_page => 15, :order=> 'created_at DESC')
    end
    def new
      @post = current_user.posts.new
    end
    
    
    def create
      @post = current_user.posts.new(params[:post])
      @post.save!
      redirect_to manage_posts_path
      rescue ActiveRecord::RecordInvalid
        render :action => 'new'
    end

    def update
      @post.update_attributes(params[:post])
      @post.save!
      redirect_to manage_posts_path
      rescue ActiveRecord::RecordInvalid
        render :action => 'edit'
    end

    def edit
      @album = @post.albums.find(:first)
    end

    def destroy
      @post.destroy
      redirect_to new_manage_post_path
    end
    

    def show
    end
    
    
    private
    def find_post
      @post = Post.find(params[:id])
    end
    def producer_or_my_content
      producer_or_my_content_required(@post)
    end
   
end
