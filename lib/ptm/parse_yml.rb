module Ptm
  class ParseYml
    #
    # include
    #

    include FileHelper

    #
    # instance methods
    #

    def initialize(file_path)
      @_file_path = file_path
    end

    def parse
      yml_data = {}

      if valid_yml?(@_file_path)
        yml_data = YAML.load_stream(File.read(@_file_path))
      end

     yml_data
    end
  end
end
