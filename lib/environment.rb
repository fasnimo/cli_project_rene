require "pry"
require "nokogiri"
require "open-uri"
require_relative "./cli_project_rene/version"

#environment
module CliProjectRene
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./restaurant.rb"
require_relative "./scraper.rb"
require_relative "./cli.rb"
