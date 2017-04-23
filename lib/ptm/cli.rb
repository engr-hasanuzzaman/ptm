require 'thor'

# wrapper module
module Ptm
  # thor command container class
  class Command < Thor
    desc 'list', 'This will show all of your tasks'
    def list
      data = File.read(FileHelper::YML_PATH)
      puts FileHelper::read_yml(data)
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
      FileHelper::append_to_file(FileHelper::YML_PATH, task)
    end

  end
end
