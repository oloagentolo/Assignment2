require File.expand_path('../../setup', __FILE__)
require File.expand_path('../../worker', __FILE__)

describe Worker do
  before { @worker = Worker.new(last_name: 'Last', first_name: 'first') }

  subject { @worker }

  it { should respond_to( :last_name ) }
  it { should respond_to( :first_name ) }

  it { should be_valid }

  describe 'without a last name present' do
    before { @worker.last_name = '' }
    it { should_not be_valid }
  end

  describe 'without a first name present' do
    before { @worker.first_name = '' }
    it { should_not be_valid }
  end
end
