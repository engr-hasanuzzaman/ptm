require 'thor'

# wrapper module
module Ptm
  # thor command container class
  class Command < Thor
    desc 'list', 'This will show all of your tasks'
    def list
      print_table(table(FileHelper.read_yml(FileHelper::YML_PATH)))
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
      task[:complete] = options[:completed_status]
      FileHelper.append_to_file(FileHelper::YML_PATH, task)
    end

    # this will not be treated as command
    no_commands do
      # def print_task(task, color)
      #   say(set_color("Task number: #{task[:number]}", :black, :on_white, :bold))
      #   say("title: #{task[:title]}", color, true)
      #   say("category: #{task[:category]}", color, true)
      #   say("complete: #{task[:complete]}", color, true)
      #   say("created_at: #{task[:created_at]}", color, true)
      #   say("completed_at: #{task[:created_at]}", color, true)
      # end

      # def task_color(status)
      #   if status
      #     :green
      #   else
      #     :yellow
      #   end
      # end

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

        tasks.each do |task_attrs|
          task = Ptm::Task.new(task_attrs)
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
    end
  end
end
