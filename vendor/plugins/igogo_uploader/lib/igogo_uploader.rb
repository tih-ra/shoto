module IgogoUploader
   module ClassMethods
     
     def configure_igogo_uploader(options = {})
       configure_igogo_uploader_options = options.delete(:options) || nil
       proc = Proc.new do |c|
         c.instance_variable_set(:@configure_igogo_uploader_options, configure_igogo_uploader_options)
       end
       before_filter(proc, options)
     end
   
   end 
=begin   
   module LoadLanguage
     class << self
       def set lang
         value =File.open(File.dirname(__FILE__) + "/../languages.yml") { |f| YAML.load(f.read) }
         return value[lang]
       end
     end
   end
=end   
   def self.included(base)
     base.extend(ClassMethods)
   end
   
end