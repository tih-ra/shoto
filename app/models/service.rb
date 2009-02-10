require 'ostruct'
class Service < ActiveRecord::Base
  
  validates_uniqueness_of :category, :message=>"Інформація про дану послугу вже існує!"
  CETEGORIES = [OpenStruct.new(:name=>"Video Production", :name_ukr=>"Виготовлення відео продукції", :idn=>1, :image=>"services/video_production.gif"), 
                OpenStruct.new(:name=>"Viral Marketing", :name_ukr=>"Вірусний маркетинг", :idn=>2, :image=>"services/viral.gif"),
                OpenStruct.new(:name=>"Creative", :name_ukr=>"Креатив", :idn=>3, :image=>"services/creative.gif"),
                OpenStruct.new(:name=>"Design & Interfaces", :name_ukr=>"Дизайн та Інтерфейси", :idn=>4, :image=>"services/design.gif"),
                OpenStruct.new(:name=>"Interactive Media System", :name_ukr=>"Інтерактивні Медіа Системи", :idn=>5, :image=>"services/interactive.gif"),
                OpenStruct.new(:name=>"Progressive IT Solutions", :name_ukr=>"Прогресивні ІТ Рішення", :idn=>6, :image=>"services/progressive.gif"),
                OpenStruct.new(:name=>"Complex Solutions", :name_ukr=>"Комплексні Рішення", :idn=>7, :image=>"services/complex.gif")]
  
end
