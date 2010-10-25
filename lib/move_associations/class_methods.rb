module MoveAssociations
  module ClassMethods
    def destroy_all_with_empty_associations
      all.each do |record|
        record.destroy_if_associations_are_empty
      end
    end

    def associations_to_move
      (self.reflect_on_all_associations(:has_many) + self.reflect_on_all_associations(:has_one)).collect do |association|
        association unless association.options.has_key? :through
      end.compact
    end
  end
end