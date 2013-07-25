require File.expand_path('../../setup', __FILE__)
require File.expand_path('../../work_order', __FILE__)

describe WorkOrder do
  before { @work_order = WorkOrder.new(worker_id: 1, work_details: 'Details', date_of_creation: DateTime.now,
    status: 'In progress', status_update_date: DateTime.now) }
  
  subject { @work_order }

  it { should respond_to( :worker_id ) }
  it { should respond_to( :work_details ) }
  it { should respond_to( :date_of_creation ) }
  it { should respond_to( :status ) }
  it { should respond_to( :status_update_date ) }

  it { should be_valid }

  describe 'without a worker_id present' do
    before { @work_order.worker_id = nil }
    it { should_not be_valid }
  end

  describe 'without work_details present' do
    before { @work_order.work_details = '' }
    it { should_not be_valid }
  end

  describe 'without a date_of_creation present' do
    before { @work_order.date_of_creation = nil }
    it { should_not be_valid }
  end

  describe 'without a status present' do
    before { @work_order.status = '' }
    it { should_not be_valid }
  end

  describe 'without a status_update_date present' do
    before { @work_order.status_update_date = nil }
    it { should_not be_valid }
  end
end
