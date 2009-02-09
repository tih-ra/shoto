class Photo < Asset
  belongs_to :user
  has_attachment :content_type => :image, 
                 :storage => :file_system, :path_prefix => 'public/attachments/photos',
                 :max_size => 2.megabytes,
                 :resize_to => '1280x800>',
                 :processor => 'Rmagick',
                 :thumbnails => { :content => '600>' }
end
