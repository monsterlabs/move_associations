module MoveAssociations
  class Railtie < Rails::Railtie
     railtie_name :move_associations
     initializer "move_associations.active_record" do |app|
       if defined? ::ActiveRecord
         ::ActiveRecord::Base.class_eval do
           extend MoveAssociations::ClassMethods
         end
         ::ActiveRecord::Base.send(:include, MoveAssociations::InstanceMethods)
        end
      end
  end
end