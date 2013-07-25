require File.expand_path('../../setup', __FILE__)
require File.expand_path('../../worker', __FILE__)

describe Worker do
  before( :each ) do
    @attr = { :last_name => 'Last', :first_name => 'First' }
  end

  it 'should create a new instance given valid attributes' do
    Worker.create!(@attr)
  end

  it 'should have a last name present' do
    no_last_name_worker = Worker.new(@attr.merge(:last_name => ''))
    no_last_name_worker.should_not be_valid
  end

  it 'should have a first name present' do
    no_first_name_worker = Worker.new(@attr.merge(:first_name => ''))
    no_first_name_worker.should_not be_valid
  end
end
