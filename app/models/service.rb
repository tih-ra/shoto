require 'ostruct'
class Service < ActiveRecord::Base
  
  validates_uniqueness_of :category, :message=>"Інформація про дану послугу вже існує!"
  CETEGORIES = [OpenStruct.new(:name=>"Video Production", :name_ukr=>"Виготовлення відео продукції", :idn=>1), 
                OpenStruct.new(:name=>"Viral Marketing", :name_ukr=>"Вірусний маркетинг", :idn=>2),
                OpenStruct.new(:name=>"Creative", :name_ukr=>"Креатив", :idn=>3),
                OpenStruct.new(:name=>"Design & Interfaces", :name_ukr=>"Дизайн та Інтерфейси", :idn=>4),
                OpenStruct.new(:name=>"Interactive Media System", :name_ukr=>"Інтерактивні Медіа Системи", :idn=>5),
                OpenStruct.new(:name=>"Progressive IT Solutions", :name_ukr=>"Прогресивні ІТ Рішення", :idn=>6),
                OpenStruct.new(:name=>"Complex Solutions", :name_ukr=>"Комплексні Рішення", :idn=>6)]
  
end
