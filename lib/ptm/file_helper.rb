require 'yaml'

module Ptm
  module FileHelper
    YML_PATH = File.expand_path('../tasks.yml', __FILE__).freeze

    def self.read_yml(file_path)
      return [] unless valid_yml?(file_path)

      YAML.load(File.read(file_path))
    end

    def self.append_to_file(file_path, data)
      return unless valid_task?(data)

      new_data = read_yml(file_path)
      new_data << data
      File.write(file_path, new_data)
    end

    def self.valid_yml?(path)
      File.file?(path) && File.extname(path) == '.yml'
    end

    def self.valid_task?(task)
      task && task.is_a?(Hash) && task[:tittle]
    end
  end
end
