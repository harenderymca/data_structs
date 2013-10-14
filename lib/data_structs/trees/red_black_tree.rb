class RedBlackTree

  attr_accessor :value, :left, :right, :parent, :color

  include TreeUtilities::Methods
  include TreeUtilities::TreeRotation
  include TreeUtilities::TreeBalancing # only to use full_balanced?

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
    @value = nil
    @left = nil
    @right = nil
    @parent = nil
    @color = nil
  end

  def insert(e)
    if self.empty?
      self.value = e
      self.color = red
      self.insert_case1
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

  def insert_case1
    if self.root?
      self.color = black
    else
      self.insert_case2
    end
  end

  def insert_case2
    if self.parent.color == black
      #do nothing, tree is valid
    else
      self.insert_case3
    end
  end

  def insert_case3
    u = self.uncle
    if u and u.color == red
      self.parent.color = black
      u.color = black
      g = self.grandparent
      g.color = red
      g.insert_case1
    else
      self.insert_case4
    end
  end

  def insert_case4
    n = self
    if self.right_child? and self.parent.left_child?
      self.parent.rotate_left
      n = self.parent.left
    elsif self.left_child? and parent.right_child?
      self.parent.rotate_right
      n = self.parent.right
    end
    n.insert_case5
  end

  def insert_case5

    g = self.grandparent
    #debugger if g.nil?
    self.parent.color = black
    g.color = red
    if self.left_child?
      g.rotate_right
    else
      g.rotate_left
    end
    #g = grandparent
    #parent.color = black
    #g.color = red
    #if left_child?
    #  g.rotate_right
    #else
    #  g.rotate_left
    #end
  end

  def to_s
    "#{@left.to_s} #{@value}:#{balance_factor} #{@right}"
  end

  private

  def black
    0
  end

  def red
    1
  end

end