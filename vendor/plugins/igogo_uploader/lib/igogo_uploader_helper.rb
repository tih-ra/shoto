module IgogoUploaderHelper
  def include_swf_javascripts
     #cc = stylesheet_link_tag "igogo_uploader/default"
     cc = stylesheet_link_tag "igogo_uploader/style"
     cc += javascript_include_tag "igogo_uploader/swfupload/swfupload"
     cc += javascript_include_tag "igogo_uploader/swfupload.queue"
     cc += javascript_include_tag "igogo_uploader/fileprogress"
     cc += javascript_include_tag "igogo_uploader/handlers"
     cc
  end
  def igogo_upload_file user_id, options={}
    cc = include_swf_javascripts
    cc += include_swf_loader user_id, options
  	cc +=	"<span id='IgogoPlaceholder'></span>"
  	cc += "<input id='btnCancel' type='image' onclick='igogoUpload.cancelQueue();return false;' src='/stylesheets/igogo_uploader/funny-cancel.png' />"
  	cc += "<div id='IgogoUploadProgress' style='position:absolute;margin:-38px 0 0 155px;'></div>"
		return cc
  end
  def include_swf_loader user_id, options={}, global_options=@configure_igogo_uploader_options
    "<script type='text/javascript'>
    		var igogoUpload;
    		window.onload = function () {
    			igogoUpload = new SWFUpload({
    				upload_url: '#{global_options[:upload_url]}',
    				file_post_name: '#{global_options[:post_file_name]}',
    				post_params: {'user_id' : '#{user_id}', 'assetable_type' : '#{options[:assetable_type]}', 'assetable_id' : '#{options[:assetable_id]}', 'community_id' : '#{options[:community_id]}'},
    				
    				file_size_limit : '153700',	// 10 MB
    				file_types : '*.*',	
    				file_types_description : 'All Files',
    				file_upload_limit : '0', 
    				file_queue_limit : '1', 

    					// Event Handler Settings (all my handlers are in the Handler.js file)
    					
    					file_queued_handler : Igogo_fileQueued,
    					file_queue_error_handler : Igogo_fileQueueError,
    					file_dialog_complete_handler : Igogo_fileDialogComplete,
    					upload_start_handler : Igogo_uploadStart,
    					upload_progress_handler : Igogo_uploadProgress,
    					upload_error_handler : Igogo_uploadError,
    					upload_success_handler : Igogo_uploadSuccess,
    					upload_complete_handler : Igogo_uploadComplete,

    					// Button Settings
    					button_image_url : '#{options[:button_image_url]}',
    					button_placeholder_id : 'IgogoPlaceholder',
    					button_width: 76,
    					button_height: 27,

    				// Flash Settings
    				flash_url : '/javascripts/igogo_uploader/swfupload/swfupload.swf',

    				
    				custom_settings : {
            		progressTarget : 'IgogoUploadProgress'
            },

    				// Debug settings
    				debug: false
    			});

    		};
    	</script>"
  end
end