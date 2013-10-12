require_relative '../../spec_helper'

tree = BinarySearchTree.new

class <<tree
  include TreeUtilities::TreeBalancing
end

describe TreeUtilities::TreeBalancing do
  describe 'BALANCE FACTOR' do
    it 'returns the balance factor' do
      tree.balance_factor.should eq 0
    end

    it 'when tree has one left child' do
      tree.insert 5
      tree.insert 4
      tree.balance_factor.should eq 1
    end

    it 'when tree has one left and one right child, b.f. is 0' do
      tree.insert 6
      tree.balance_factor.should eq 0
    end

    it 'when tree has three levels on left and one on right, b.f is 2' do
      tree.insert 3.5
      tree.insert 2
      tree.balance_factor.should eq 2
    end

  end

  describe 'BALANCED?' do

    it 'tree is currently unbalanced, because of earlier entries' do
      tree.should_not be_balanced
    end

    it 'if we remove 2 from tree it should be balanced' do
      tree.delete(2)
      tree.should be_balanced
    end

    it 'this tree is balanced, but not full balanced' do
      tree.empty
      tree.insert (10)
      tree.push [9 ,8 ,7 ,6 ,5 ,4 ,3 ,2 ,1]
      tree.push [11,12,13,14,15,16,17,18,19]
      tree.should be_balanced
      tree.successors.each{ |s|
        class <<s
          include TreeUtilities::TreeBalancing
        end
        s.should_not be_balanced
      }

      #thus tree should return false for full balanced?
      tree.should_not be_full_balanced

    end
  end

  describe '#FULL_BALANCED' do
    it 'returns true only if tree is full balanced' do
      tree.should_not be_full_balanced
      tree.empty
      tree.push [20, 10, 30, 5, 15, 25, 35, 4, 5.1, 15.1, 25.1, 35.1, 15.2]
      tree.should be_balanced
      tree.balance_factor.should eq 1

      include_balancing = Proc.new do |s|
        class <<s
          include TreeUtilities::TreeBalancing
        end
        s.successors.each{ |s| include_balancing.call(s) }
      end

      tree.successors.each{ |s| include_balancing.call(s) }

      tree.should_not be_full_balanced

      tree.left.should be_balanced
      tree.left.should_not be_full_balanced
      tree.right.should be_balanced
      tree.right.should be_full_balanced
    end
  end

end