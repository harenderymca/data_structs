require_relative '../../spec/spec_helper'

describe BinaryTree do

  describe 'INSERT' do
    it 'inserts elements into tree' do
      t = BinaryTree.new
      t.should be_empty
      t.insert(1)
      t.should_not be_empty
      t.insert 2
      t.value.should eq 1
      #puts t.inspect
      t.left.parent.should eq t
      t.insert(3, 'right')
      t.right.value.should eq 3
      t.right.parent.should eq t
    end
  end

end