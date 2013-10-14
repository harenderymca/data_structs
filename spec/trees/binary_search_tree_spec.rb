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

    it 'check that inorder_traversal should always return sorted array' do
      t = BinarySearchTree.new
      arr = FakeData.integer_array
      t.push arr
      t.inorder_traversal.should eq arr.sort
    end

  end

  describe 'FIND' do
    it 'returns the subtree that contains the requested value' do
      t = BinarySearchTree.new
      t.push FakeData.integer_array
      t.find(50).value.should eq 50
    end
  end

  describe 'ROOT' do
    context 'empty_tree' do
      it 'assets that an empty tree is a root' do
        t = BinarySearchTree.new
        t.should be_root
      end
    end

    context 'sub_tree' do
      it 'assets that sub tree is not root' do
        t = BinarySearchTree.new
        t.insert 20
        t.push FakeData.integer_array
        t.should be_root
        t.left.each{ |a| a.should_not be_root }
        t.right.each{ |a| a.should_not be_root }
      end
    end
  end

  describe 'EACH' do
    it 'traverse a block on each subtree' do
      t = BinarySearchTree.new
      t.push FakeData.integer_array
      v = t.value
      t.each{ |a| a.value += 1 }
      t.value.should eq v+1
    end

    it 'is a second test for each' do
      t = BinarySearchTree.new
      '1 2 3 4 5 6 7 8 9'.split(' ').map{ |a| a.to_i }.each{ |n|  t.insert n }
      t.each{ |a| a.value += 1 }
      t.inorder_traversal.join(' ').should eq '2 3 4 5 6 7 8 9 10'
    end

  end

  describe 'DELETE' do
    it 'deletes the element form the tree' do
      t = BinarySearchTree.new
      t.push [1,2,3,4,5,6]
      #t.size.should eq 6
      t.inorder_traversal.should eq [1,2,3,4,5,6]
      t.delete(1)
      #t.size.should eq 5
      t.inorder_traversal.should eq [2,3,4,5,6]
      t = BinarySearchTree.new
      t.push [10, 7, 13, 4, 8, 12, 15]
      t.inorder_traversal.should eq [4,7,8,10,12,13,15]
      t.delete(7)
      t.inorder_traversal.should eq [4,8,10,12,13,15]
      t.delete(15).inorder_traversal.should eq [4,8,10,12,13]
    end
  end

  describe 'ROTATION' do

    context 'rotation left' do

      it 'rotates the tree to left' do
        t = BinarySearchTree.new
        t.insert 5
        t.insert 6
        t.insert 4
        t.value.should eq 5
        t.rotate_left.value.should eq 6
        t.right.should be_nil
      end

    end

    context 'rotate right' do

      it 'rotates the tree to right' do
        t = BinarySearchTree.new
        t.insert 5
        t.insert 6
        t.insert 4
        t.value.should eq 5
        t.rotate_right.value.should eq 4
        t.left.should be_nil
      end

    end

  end

  describe 'DEPTH' do

    it 'returns the depth of the tree' do
      t = BinarySearchTree.new
      t.depth.should eq 0
      t.push [6,5,7]
      t.depth.should eq 2
      t << 8
      t.depth.should eq 3
      t << 4
      t.depth.should eq 3
      t.left.depth.should eq 2
      t.left.left.depth.should eq 1
      t.left.left.left.should be_nil
      TreeTest.tree_consistent?(t).should be_true
    end

  end

end