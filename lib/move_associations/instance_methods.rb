module MoveAssociations
  module InstanceMethods
    def destroy_if_associations_are_empty 
      destroy unless has_associated_records?
    end

    def move_association(association_name, new_id)
      if self.respond_to? association_name
        association_records(association_name).each { |record| record.update_attributes(self.class.name.foreign_key => new_id) }
      end
    end

    def move_associations(new_id)
      self.class.associations_to_move.collect do |association|
        move_association(association.name, new_id)
      end
    end

    def has_associated_records?
      associated_records_size > 0
    end

    def association_records(association_name)
      [send(association_name.to_sym)].flatten.compact
    end

    def associated_records_size
      associated_records = 0
      self.class.associations_to_move.collect do |association|
        associated_records += association_records(association.name).size 
      end
      associated_records
    end
  end
end
