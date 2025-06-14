# frozen_string_literal: true


module Biblioxml
  module Writer
    def self.write_to_file(file_path, content)
      File.open(file_path, 'w') do |file|
        file.write(content)
      end
    end
  end
end
