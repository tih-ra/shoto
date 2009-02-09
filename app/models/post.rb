require 'ostruct'
class Post < ActiveRecord::Base
 validates_presence_of :title, :message => "Обязательное поле"
 validates_presence_of :content, :message => "Обязательное поле"
 #acts_as_commentable
 #acts_as_ferret :fields => [:title, :content]
 belongs_to :user
 has_many :post_attachments
 has_many :albums, :source => :attachable, :through => :post_attachments, :source_type => "Album", :class_name => "Album", :dependent => :destroy
 has_and_belongs_to_many :events
 #has_many :comments, :as => :commentable, :dependent => :destroy
 #has_one :access, :as => :accessible, :dependent => :destroy
 acts_as_taggable
 acts_as_commentable
 POST_ACCESS_LEVEL = [OpenStruct.new(:name=>"Публічний", :status=>0), OpenStruct.new(:name=>"Тільки для своїх", :status=>1)]
 COMMENTS_ACCESS_LEVEL = [OpenStruct.new(:name=>"Без коментарів", :status=>0), OpenStruct.new(:name=>"Тільки для своїх", :status=>1), OpenStruct.new(:name=>"Публічні", :status=>2)]
 
 def to_param
   id.to_s + "-" + slug
 end
 
 def before_save
   self.slug = title.dirify
 end

end
