require File.expand_path('../../setup', __FILE__)
require File.expand_path('../../work_order', __FILE__)
require File.expand_path('../../factories', __FILE__)

describe WorkOrder do
  before( :each ) do
    @worker = FactoryGirl.create(:worker)
    @attr = { :work_details => 'Details', :date_of_creation => DateTime.now, :status => 'In progress',
      :status_update_date => DateTime.now }
  end

  describe 'instantiation' do
    it 'should create a new instance given valid attributes' do
      @worker.work_orders.create!(@attr)
    end

    it 'should have work details present' do
      work_no_details = WorkOrder.new(@attr.merge(:work_details => ''))
      work_no_details.should_not be_valid
    end

    it 'should have a date of creation present' do
      work_no_creation_date = WorkOrder.new(@attr.merge(:date_of_creation => nil))
      work_no_creation_date.should_not be_valid
    end

    it 'should have a status present' do
      work_no_status = WorkOrder.new(@attr.merge(:status => ''))
      work_no_status.should_not be_valid
    end

    it 'should have a status update date present' do
      work_no_status_update_date = WorkOrder.new(@attr.merge(:status_update_date => nil))
      work_no_status_update_date.should_not be_valid
    end
  end
  

  describe 'worker associations' do
    before( :each ) do
      @work_order = @worker.work_orders.create(@attr)
    end

    it 'should have a worker attribute' do
      @work_order.should respond_to(:worker)
    end

    it 'should have the right associated worker' do
      @work_order.worker_id.should == @worker.id
      @work_order.worker.should == @worker
    end
  end
end
