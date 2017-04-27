module Ptm
  class Task
    # class obj that will use to generate obj id
    @@obj_id = 1

    # accessor methods
    attr_accessor :title, :id, :category, :created_at, :complete, :completed_at

    def initialize(attrs)
      return unless attrs.is_a?(Hash)

      # puts "passing hash is #{attrs}"
      self.title = attrs[:title]
      self.category = attrs[:category]
      self.created_at = attrs[:created_at]
      self.complete = attrs[:complete]
      self.completed_at = attrs[:completed_at]
      self.id = @@obj_id

      # increment class variable for next obj
      @@obj_id += 1
    end

    def to_hash
      hash = {}
      instance_variables.each do |var|
        key = var.to_s.delete('@').to_sym
        hash[key] = instance_variable_get(var) unless key == :id # skip id
      end

      hash
    end
  end
end
