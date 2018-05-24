require 'spec_helper'
describe 'ppbind' do
  context 'with default values for all parameters' do
    it { should contain_class('ppbind') }
  end
end
