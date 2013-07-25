require 'factory_girl'
require File.expand_path('../worker', __FILE__)

FactoryGirl.define do
  factory :worker do |worker|
    worker.first_name  'FirstName'
    worker.last_name   'LastName'
  end
end
