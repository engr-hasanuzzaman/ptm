module Ptm
  class Task
    # class obj that will use to generate obj id
    @@obj_id = 1

    # accessor methods
    attr_accessor :title, :id, :category, :created_at, :complete, :completed_at

    def initialize(attrs)
      return unless attrs.is_a?(Hash)

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

    #
    # class methods
    #

    class << self
      # load task data from YAML file &
      # make task object
      def load_tasks
        FileHelper.read_yml(FileHelper::YML_PATH).map do |task_attrs|
          Ptm::Task.new(task_attrs)
        end
      end

      def remove_task(id)
        tasks = load_tasks
        tasks.reject! { |task| task.id == id }
        new_data = tasks_hash(tasks)
        FileHelper.write_to_file(FileHelper::YML_PATH, new_data.to_yaml)
      end

      def remove_all_tasks
        new_data = []
        FileHelper.write_to_file(FileHelper::YML_PATH, new_data.to_yaml)
      end

      def complete_all_tasks
        tasks = load_tasks
        tasks.each { |task| task.complete = true }
        new_data = tasks_hash(tasks)
        FileHelper.write_to_file(FileHelper::YML_PATH, new_data.to_yaml)
      end

      def complete_task(id)
        tasks = load_tasks
        tasks.each { |task| task.complete = true; task.completed_at = Time.now if task.id == id.to_i }
        new_data = tasks_hash(tasks)
        FileHelper.write_to_file(FileHelper::YML_PATH, new_data.to_yaml)
      end

      def valid_task?(task)
        task && task.is_a?(Hash) && !task[:title].nil?
      end

      #
      # private class methods
      #

      private

      def tasks_hash(tasks)
        tasks.map do |task|
          task.to_hash
        end
      end
    end
  end
end
