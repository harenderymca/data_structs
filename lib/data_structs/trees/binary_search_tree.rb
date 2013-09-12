class BinarySearchTree

  attr_accessor :value, :left, :right, :parent

  #methods that are most unlikely to cause errors
  include TreeUtilities::Methods

  def left=(tree)
    raise ArgumentError unless tree.is_a? self.class or tree.nil?
    @left = tree
    @left.parent = self unless @left.nil?
    tree
  end

  def right=(tree)
    raise ArgumentError unless tree.is_a? self.class or tree.nil?
    @right = tree
    @right.parent = self unless @right.nil?
    tree
  end

  def initialize
    @key = nil
    @left = nil
    @right = nil
    @parent = nil
  end

  def insert(e)
    if self.empty?
      self.value = e
    else
      if e > self.value
        self.right = self.class.new if self.right.nil?
        self.right.insert e
      else
        self.left = self.class.new if self.left.nil?
        self.left.insert e
      end
    end

    self
  end

  def delete(element)
    tree = self.find element
    if tree
      succ = tree.successors

      if succ.count == 0
        if tree.parent.nil?
          tree.value = nil
          tree.size = 0
        else
          #tree.parents.each{ |p| p.size -= 1 }
          tree.parent.left = nil if tree.left_child?
          tree.parent.right = nil if tree.right_child?
        end
      end

      if succ.count == 1
        if tree.parent.nil?
          tree.value = succ[0].value
          succ[0].value = element
          succ[0].delete element
        else
          #tree.parents.each{ |p| p.size-= 1 }
          tree.parent.left = succ[0] if tree.left_child?
          tree.parent.right = succ[0] if tree.right_child?
          succ[0].parent = tree.parent
        end
      end

      if succ.count == 2
        if rand.round == 0
          tmp = tree.value
          tree.value = tree.left.value
          tree.left.value = tmp
          tree.left.delete(element)
        else
          tmp = tree.value
          tree.value = tree.right.value
          tree.right.value = tmp
          tree.right.delete element
        end
      end

    end
    self
  end

end