#require 'active_record'

class Worker < ActiveRecord::Base
  validates_presence_of :last_name, :first_name
end
