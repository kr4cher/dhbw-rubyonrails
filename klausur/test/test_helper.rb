require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
Rails.application.eager_load!
check = Thread.new do
  begin
    require 'resolv'
    Resolv::DNS.new(timeouts: 1, nameserver: '8.8.8.8').getaddress("google.de")
    true
  rescue Resolv::ResolvError, Resolv::ResolvTimeout, Errno::ENETUNREACH
    false
  rescue Exception => e
    e.message.inspect
  end
end

Minitest.after_run do
  Thread.current[:test_result] ||= 0.0
  result = (SimpleCov.result.covered_percent * Thread.current[:test_result])
  File.open(Rails.root + "log/klausur.log", 'a') { |f| f.write "['#{Time.now}',#{SimpleCov.result.covered_percent},#{Thread.current[:test_result]},#{result},#{check.value}]\n" }
  puts "=" * 34
  puts " Klausurergebnis: %.2f%%" % result
  puts "=" * 34
end

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)
  parallelize_setup do |worker|
    SimpleCov.command_name "#{SimpleCov.command_name}-#{worker}"
  end

  parallelize_teardown do |worker|
    SimpleCov.result
  end

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
