class WorkPhoto < ActiveRecord::Base
  belongs_to :work
  has_attachment :content_type => :image, 
                 :storage => :file_system, :path_prefix => 'public/attachments/works',
                 :max_size => 100.kilobytes,
                 :resize_to => '200x200!',
                 :processor => 'Rmagick'
end
