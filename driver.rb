require 'active_record'
require './worker'
require './work_order'
require './setup'
require 'date'

def create_worker(first, last)
	Worker.create(:first_name => first, :last_name => last)
end

def assign_work_order(worker, details, status)
	worker.work_orders.create(:work_details => details, :date_of_creation => DateTime.now,
		:status => 'Created', status_update_date => DateTime.now)
end

