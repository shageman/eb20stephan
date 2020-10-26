require "eng_bootcamp_2020_stephan/version"

module EngBootcamp2020Stephan
  class Error < StandardError; end

  def self.env=(value)
    @configured_env = value
  end

  def self.hello_gusto
    "hello gusto"
  end

  def self.hello_gusto_with_env_param(env)
    "hello gusto - ENV #{env}"
  end

  def self.hello_gusto_with_rails_env
    env_string = defined?(Rails) ? " - ENV #{Rails.env}" : ""
    "hello gusto#{env_string}"
  end

  def self.hello_gusto_with_configured_env
    env_string = @configured_env ? " - ENV #{@configured_env}" : ""
    "hello gusto#{env_string}"
  end

  # Your code goes here...
end

puts EngBootcamp2020Stephan.hello_gusto
puts EngBootcamp2020Stephan.hello_gusto_with_env_param('some env')
puts EngBootcamp2020Stephan.hello_gusto_with_rails_env
puts EngBootcamp2020Stephan.hello_gusto_with_configured_env
