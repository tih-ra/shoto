class Album < ActiveRecord::Base
  has_many :photos, :as => :assetable, :dependent => :destroy
  belongs_to :user
  validates_presence_of :title, :slug
  per_page = 16
   
  def to_param
    id.to_s+"-"+slug
  end
  
  def before_validation
    self.slug = title.dirify
  end
  

end

