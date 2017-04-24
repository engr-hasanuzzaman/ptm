require 'thor'

# wrapper module
module Ptm
  # thor command container class
  class Command < Thor
    desc 'list', 'This will show all of your tasks'
    def list
      task_number = 0

      FileHelper.read_yml(FileHelper::YML_PATH).each do |task|
        print_task(task,
                   task_number,
          task_color(task['complete'])
        )
        task_number += 1
      end
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
      def print_task(task, serial, color)
        say(set_color("Task number: #{serial}", :black, :on_white, :bold))
        say("title: #{task[:title]}", color, true)
        say("category: #{task[:category]}", color, true)
        say("complete: #{task[:complete]}", color, true)
        say("created_at: #{task[:created_at]}", color, true)
        say("completed_at: #{task[:created_at]}", color, true)
        puts ''
      end

      def task_color(status)
        if status
          :green
        else
          :yellow
        end
      end
    end
  end
end
