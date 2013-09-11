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

  def delete(e)

  end

end