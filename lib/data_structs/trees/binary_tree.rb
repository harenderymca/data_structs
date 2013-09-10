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

end