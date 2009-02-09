class Avatar < ActiveRecord::Base
  belongs_to :user
  has_attachment :content_type => :image, 
                 :storage => :file_system, :path_prefix => 'public/attachments/avatars',
                 :max_size => 100.kilobytes,
                 :resize_to => '60x60!',
                 :processor => 'Rmagick'
end
