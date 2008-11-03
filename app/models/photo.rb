class Photo < Asset
  belongs_to :user
  has_attachment :content_type => :image, 
                 :storage => :file_system, :path_prefix => 'public/attachments/galleries',
                 :max_size => 2.megabytes,
                 :resize_to => '1280x800>',
                 :processor => 'Rmagick',
                 :thumbnails => { :content => '740>', :small => '67x67!', :middle => '80x60!', :cover => '150x150!', :thumb => '214x156!', :poster=>'300x423>' }
end
