lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include? lib

Dir['./spec/support/**/*.rb'].sort.each {|f| require f}

require 'data_structs'

module TreeTest

  def self.tree_consistent?(tree)
    return true if (tree.left ? (tree.left.parent == tree and tree_consistent?(tree.left)) : true) and ( tree.right ? (tree.right.parent == tree and tree_consistent?(tree.right)) : true )
    false
  end

  #def random_tree
  #  size = (rand*20).round + 10
  #  t = BinaryTree.new
  #  t.insert(rand_integer)
  #  size.times do
  #    side = rand.round
  #    random_sub_tree(t).insert(rand_integer, side == 0 ? 'left' : 'right')
  #  end
  #  t
  #end
  #
  #def rand_integer
  #  (rand*1000).round + 1
  #end
  #
  #def random_sub_tree(tree)
  #  return tree if tree.left.nil? and tree.right.nil?
  #  return tree if (rand*8).round == 0
  #  side = rand.round
  #  side == 0 ? random_sub_tree(tree.left) : random_sub_tree(tree.right)
  #end

end

module FakeData

  def self.integer_array(size=100)
    arr = []
    size.times do |i|
      arr << i
    end

    arr.shuffle
  end

end