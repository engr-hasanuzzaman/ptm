require 'thor'

# wrapper module
module Ptm
  # thor command container class
  class Command < Thor
    desc 'list', 'This will show all of your tasks'
    def list
      print_table(table(load_tasks))
    end
    map :'-l' => :list

    desc 'add_task TITLE', 'add new task with given title.'
    method_option :category, aliases: '-c', type: :string, default: 'general'
    method_option :completed_status, aliases: '-s', type: :boolean, default: false
    def add_task(title)
      task = {}
      task[:title] = title
      task[:category] = options[:category]
      task[:created_at] = Time.now
      task[:completed_at] = Time.now if options[:completed_status]
      task[:complete] = options[:completed_status]
      FileHelper.append_to_file(FileHelper::YML_PATH, task)
    end

    desc 'remove_tasks', 'remove task with given id.'
    method_option :id, aliases: 'i', type: :numeric, default: 0
    def remove_tasks
      if options[:id].zero?
        remove_all_tasks
      else
        remove_task(options[:id])
      end
    end

    # this will not be treated as command
    no_commands do
      # create table from data
      def table(tasks)
        table = []
        table_header = [
          header_col('Id'),
          header_col('title'),
          header_col('category'),
          header_col('created at'),
          header_col('complete'),
          header_col('completed at')
        ]
        table << table_header

        tasks.each do |task|
          decorated_task = if task.complete
                             CompletedTask.new(task)
                           else
                             PendingTask.new(task)
                           end
          table << decorated_task.attrs_val
        end

        table
      end

      def header_col(val)
        val.color(:white)
      end

      # load task data from YAML file &
      # make task object
      def load_tasks
        FileHelper.read_yml(FileHelper::YML_PATH).map do |task_attrs|
          Ptm::Task.new(task_attrs)
        end
      end

      def tasks_hash(tasks)
        tasks.map do |task|
          task.to_hash
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
    end
  end
end
