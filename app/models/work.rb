class Work < ActiveRecord::Base
  has_one :work_photo
  validates_presence_of :title, :message => "Обов'язкове поле"
  validates_presence_of :content, :message => "Обов'язкове поле"
  acts_as_taggable
end
