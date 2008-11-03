class Video < Asset
  belongs_to :user
  has_attachment :content_type => :image, 
                 :storage => :file_system, :path_prefix => 'public/attachments/vidoes',
                 :max_size => 100.megabytes
  
   def full_filename(thumbnail = nil)
      file_system_path = self.attachment_options[:path_prefix]
      File.join(RAILS_ROOT, file_system_path, file_name_for(self.id))
     end
    def file_name_for(asset = nil)
      extension = filename.scan(/\.\w+$/)
      return "#{asset}_#{filename}"
    end
end
