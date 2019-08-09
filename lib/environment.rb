require "pry"
require "nokogiri"
require "open-uri"
require "cli_project_rene/version"

#environment
module CliProjectRene
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./lib/cli_project_rene/airport"
require_relative "./lib/cli_project_rene/scraper"
require_relative "./lib/cli_project_rene/cli"
