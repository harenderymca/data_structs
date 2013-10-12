require_relative '../../spec/spec_helper'

describe AVLTree do

  describe '#INSERTION' do
    it 'automatically balances the tree after insertion' do
      t = AVLTree.new
      t.push [20, 10, 30, 5, 15, 25, 35, 4, 5.1, 15.1, 25.1, 35.1, 15.2]
      t.should be_full_balanced
      t.left.right.value.should eq 15.1
    end

    it 'is a test for random tree' do
      t = AVLTree.new
      t.push FakeData.integer_array(2000)
      t.should be_full_balanced
    end

  end

end