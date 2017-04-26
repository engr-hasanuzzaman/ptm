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
      def print_task(task, color)
        say(set_color("Task number: #{task[:number]}", :black, :on_white, :bold))
        say("title: #{task[:title]}", color, true)
        say("category: #{task[:category]}", color, true)
        say("complete: #{task[:complete]}", color, true)
        say("created_at: #{task[:created_at]}", color, true)
        say("completed_at: #{task[:created_at]}", color, true)
      end

      def task_color(status)
        if status
          :green
        else
          :yellow
        end
      end

      # create table from data
      def table(tasks)
        table = []
        table_header = ['Id', 'title', 'category', 'created at', 'complete', 'completed at']
        table << table_header

        id = 1
        tasks.each do |task_attrs|
          task = Ptm::Task.new(task_attrs)
          complete_task = CompletedTask.new(task)
          column = []
          column << complete_task.id
          column << complete_task.title
          # column << set_color((task[:title] || 'no title'), :red)
          # column << task[:category] || 'no category'
          # column << task[:created_at] || 'no created_at'
          # column << task[:complete] || 'no complete'
          # column << task[:completed_at] || 'no completed_at'
          #
          # # push column to table
          table << column
          # id += 1
        end

        table
      end
    end
  end
end
