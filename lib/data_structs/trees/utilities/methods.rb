module TreeUtilities

  #METHODS THAT ARE NOT EXPECTED TO CHANGE
  module Methods

    #PUSH ALL ELEMENTS OF AN ARRAY TO A TREE
    def push(array)
      array.each do |e|
        self.insert e
      end

      self
    end

    #TELLS IF A TREE IS EMPTY OR NOT
    def empty?
      return true if self.value.nil?
      false
    end

    #INORDER TRAVERSAL
    def inorder_traversal(array=[])
      self.left.inorder_traversal array unless self.left.nil?
      array << self.value
      self.right.inorder_traversal array unless self.right.nil?
      array
    end

    #PREORDER TRAVERSAL
    def preorder_traversal(array=[])
      array << self.value
      self.left.preorder_traversal array unless left.nil?
      self.right.preorder_traversal array unless right.nil?
      array
    end

    #POSTORDER TRAVERSAL
    def postorder_traversal(array=[])
      self.left.postorder_traversal array unless left.nil?
      self.right.postorder_traversal array unless right.nil?
      array << self.value
      array
    end

    #RETURNS ROOT OF A SUBTREE
    def root
      return self if self.parent.nil?
      self.parent.root
    end

    #TELLS WHETHER CURRENT SUBTREE IS THE ROOT
    def root?
      return true if self.parent.nil?
      false
    end

    #TELLS WHETHER THE GIVEN TREE INCLUDES (E)
    def include?(e)
      true if find(e)
      false
    end

    #FINDS THE TREE WHOSE VALUE IS (E)
    #find is diff for binary search tree, so not included in common module
    #def find(element)
    #  if value == element
    #    self
    #  else
    #    a = nil
    #    a = left.find element unless left.nil? or left.empty?
    #    return a unless a.nil?
    #    b = nil
    #    b = right.find element unless right.nil? or right.empty?
    #    b unless b.nil?
    #  end
    #end

    #RETURNS AN ARRAY WITH [LEFT_CHILD, RIGHT_CHILD]
    def successors
      a = Array.new
      a << self.left unless self.left.nil?
      a << self.right unless self.right.nil?
      a
    end

    #ITERATES A BLOCK ON ALL SUBTREES
    def each(&block)
      block.call(self) unless self.empty?
      self.successors.each do |s|
        s.each(&block)
      end
      self
    end

    #TELLS WHETHER THE SUBTREE IS LEFT CHILD
    def left_child?
      return nil if parent.nil?
      return true if parent.left == self
      false
    end

    #TELLS WHETHER SUBTREE IS RIGHT CHILD
    def right_child?
      return nil if parent.nil?
      return true if parent.right == self
      false
    end

    #RETURNS THE DEPTH OF THE TREE
    def depth
      if empty?
        0
      else
        1 + [ left ? left.depth : 0 , right ? right.depth : 0 ].max
      end
    end

    #ALTERNATE METHOD FOR INSERT
    def <<(e)
      insert(e)
    end

    #EMPTIES the tree
    def empty
      self.value = nil
      self.left = nil
      self.right = nil

      self
    end

    #THIS TO_S METHOD IS JUST FOR DEVELOPMENT
    #def to_s
    #  "#{@value}"
    #end

    def grandparent
      unless root?
        self.parent.parent
      end
    end

    def uncle
      g = grandparent
      if g
        g.left if right_child?
        g.right if left_child?
      end
    end

  end

end