require 'yaml'

module Ptm
  module FileHelper
    YML_PATH = File.expand_path('../tasks.yml', __FILE__).freeze

    def self.read_yml(file_path)
      return [] unless valid_yml?(file_path)

      YAML.load(File.read(file_path))
    end

    def self.append_to_file(file_path, data)
      return unless valid_task?(data) || valid_yml?(file_path)
      puts ' write to file now'
      new_data = read_yml(file_path)
      new_data << data
      puts "-------- after adding new data #{data}, new data is #{new_data}"
      write_to_file(file_path, new_data.to_yaml)
    end

    def self.write_to_file(file_path, data)
      File.write(file_path, data)
    end

    def self.valid_yml?(path)
      File.file?(path) && File.extname(path) == '.yml'
    end

    def self.valid_task?(task)
      task && task.is_a?(Hash) && task[:tittle]
    end
  end
end
