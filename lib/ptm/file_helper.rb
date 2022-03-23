require 'yaml'

module Ptm
  module FileHelper
    YML_PATH = File.expand_path('../tasks.yml', __FILE__).freeze
    SAMPLE_YML_PATH = File.expand_path('../tasks.yml.sample', __FILE__).freeze

    #
    # module methods
    #

    class << self
      def read_yml(file_path)
        unless valid_yml?(file_path)
          create_task_file
        end

        YAML.load(File.read(file_path)) || []
      end

      def append_to_file(file_path, data)
        # make sure tasks.yml exist
        # create new if one does not exist
        unless valid_yml?(file_path)
          create_new_file(file_path)
        end
        new_data = read_yml(file_path) || []
        new_data << data
        write_to_file(file_path, new_data.to_yaml)
      end

      def valid_yml?(path)
        File.file?(path) && File.extname(path) == '.yml'
      end

      def valid_sample?(path)
        File.file?(path) && File.extname(path) == '.sample'
      end

      def write_to_file(file_path, data)
        File.write(file_path, data)
      end

      #
      # private methods
      #

      private

      def create_task_file
        if valid_sample?(SAMPLE_YML_PATH)
          copy_task_file_from_sample(SAMPLE_YML_PATH, YML_PATH)
        else
          create_new_file(YML_PATH)
        end
      end

      def copy_task_file_from_sample(s_file, d_file)
        FileUtils.cp(s_file, d_file)
      end

      def create_new_file(path)
        File.open(path, 'w')
      end
    end
  end
end
