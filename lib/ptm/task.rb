# wrapper module
module Ptm
  # task class
  class Task
    attr_accessor :title, :created_at, :complete, :completed_at, :category

    def initialize(title, options)
      self.title = title
      self.created_at = Time
      self.complete = options[:completed_status]
      self.category = category
      self.completed_at = completed_at
    end

    def foo
      'test'
    end

    def to_h
      {
        title: name,
        complete: complete,
        created_at: created_at,
        # completed_at: ,
        category: category
      }
    end
  end
end
