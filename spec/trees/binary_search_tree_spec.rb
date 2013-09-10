require_relative '../../spec/spec_helper'

describe BinarySearchTree do

  describe 'INSERT' do

    context 'when first element is added' do
      it 'is added to root' do
        t = BinarySearchTree.new
        t.insert 3
        t.value.should eq 3
        t.should_not be_empty
      end
    end

    it 'adding second element, greater' do
      t = BinarySearchTree.new
      t.insert(3)
      t.insert 4
      t.value.should eq 3
      t.right.value.should eq 4
      t.right.parent.should eq t
    end

  end

end