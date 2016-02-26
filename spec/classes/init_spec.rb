require 'spec_helper'
describe 'ovn' do

  context 'with defaults for all parameters' do
    it { should contain_class('ovn') }
  end
end
