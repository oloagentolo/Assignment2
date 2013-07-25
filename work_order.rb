class WorkOrder < ActiveRecord::Base
  validates_presence_of :worker_id, :work_details, :date_of_creation, :status, :status_update_date
end
