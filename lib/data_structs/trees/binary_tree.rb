class BinaryTree

  attr_accessor :value, :left, :right, :parent

  def initialize
    @value = nil
    @left = nil
    @right = nil
  end

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

  def empty?
    return true if self.value.nil?
    false
  end

  def insert(e, side='left')
    if self.empty?
      self.value = e
    else
      if side == 'left'
        self.left = self.class.new if self.left.nil?
        self.left.insert(e, side)
      elsif side == 'right'
        self.right = self.class.new if self.right.nil?
        self.right.insert e, side
      end
    end
    self
  end

  #find the subtree whose value is (e)
  def find(e)
    if self.value == e
      self
    else
      a = nil
      a = left.find(e) unless left.nil?
      return a unless a.nil?
      b = nil
      b = right.find(e) unless b.nil?
      b unless b.nil?
    end
  end

  #delete (e) from tree, if present
  def delete(e)

  end

end