module MoveAssociations
   autoload :ClassMethods,     'move_associations/class_methods'
   autoload :InstanceMethods,  'move_associations/instance_methods'
   autoload :Railtie,          'move_associations/railtie'
end

if defined?(::Rails::Railtie)
  require 'move_associations/railtie'
end

