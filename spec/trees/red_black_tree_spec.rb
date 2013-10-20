require_relative '../../spec/spec_helper'

#module RedBlackTreeConditions
#
#  def color_is_either_red_or_black?
#    return true if self.color == red or self.color == black
#    false
#  end
#
#  def root_is_black?
#    return true if self.root.color == black
#    false
#  end
#
#  def red_have_only_black_children?
#    if self.color == red
#      self.successors.each do |s|
#        return false unless s.color == black
#      end
#      true
#    else
#
#    end
#  end
#
#end



#describe RedBlackTree do
#
#  describe 'INSERT' do
#
#    it 'adds an element and balanced the tree' do
#      t = RedBlackTree.new
#      t.push FakeData.integer_array
#      #t.should be_full_balanced
#      #TODO this
#
#    end
#
#  end
#
#end