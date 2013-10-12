require_relative '../../spec/spec_helper'

describe AVLTree do

  describe '#INSERTION' do
    it 'automatically balances the tree after insertion' do
      t = AVLTree.new
      t.push [20, 10, 30, 5, 15, 25, 35, 4, 5.1, 15.1, 25.1, 35.1, 15.2]
      t.should be_full_balanced
    end

    it 'is a test for random tree' do
      t = AVLTree.new
      tmp = FakeData.integer_array(2000)
      t.push tmp
      t.should be_full_balanced
      t.inorder_traversal.should eq tmp.sort
    end

  end

  describe 'PERFORMANCE test among avl and binary' do

    it 'show that avl has better performance for accessing' do
      b = BinarySearchTree.new
      a = AVLTree.new
      arr = FakeData.integer_array(20000)
      s = Time.now
      b.push arr
      e = Time.now
      bt = e - s
      s = Time.now
      a.push arr
      e = Time.now
      at = e - s
      expect{ at > bt }.to be_true
      #a.should be_full_balanced
      expect{ a.height < b.depth }.to be_true
      s = Time.now
      b.find 10000
      e = Time.now
      bt = e - s
      s = Time.now
      a.find 10000
      e = Time.now
      at = e - s
      #puts bt
      #puts at
      expect{ at < bt }.to be_true
    end

  end

  describe 'DELETE' do

    it 'deletes the element and balances the tree' do
      t = AVLTree.new
      t.push FakeData.integer_array
      t.find(50).value.should eq 50
      t.should be_full_balanced
      t.delete(50)
      t.should be_full_balanced
      t.find(50).should be_nil
    end

  end

end