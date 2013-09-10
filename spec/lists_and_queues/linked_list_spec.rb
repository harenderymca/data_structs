require_relative '../../spec/spec_helper'

describe LinkedList do
  describe 'EMPTY?' do
    it 'tells whether a list is empty or not' do
      t = LinkedList.new
      t.should be_empty
      t.insert 1
      t.should_not be_empty
      t.next.should be_nil
    end
  end

  describe 'INSERT' do

  end

end