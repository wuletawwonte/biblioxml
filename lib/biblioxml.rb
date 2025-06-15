# frozen_string_literal: true

require "nokogiri"
require "zeitwerk"
require "thor"

# loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
# loader.ignore("#{__dir__}/biblioxml.rb")
# loader.setup

module Biblioxml
  class << self
    def loader
      @loader ||= Zeitwerk::Loader.for_gem.tap do |loader|
        loader.inflector.inflect(
          "cli" => "CLI"
        )
        loader.setup
      end
    end
  end

  loader
end
