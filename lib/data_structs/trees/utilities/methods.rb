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
    def find(element)
      if value == element
        self
      else
        a = nil
        a = left.find element unless left.nil? or left.empty?
        return a unless a.nil?
        b = nil
        b = right.find element unless right.nil? or right.empty?
        b unless b.nil?
      end
    end

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

    def left_child?
      return nil if parent.nil?
      return true if parent.left == self
      false
    end

    def right_child?
      return nil if parent.nil?
      return true if parent.right == self
      false
    end

  end

  #MODULE
  #ROTATION IS IMPLEMENTED SEPARATED
  module TreeRotation

    def rotate_left
      raise RuntimeError, 'left rotation on a tree with no right child is not possible' if self.right.nil?

      #insert empty tree b/w left child and self
      tmp = self.left
      self.left = self.class.new
      self.left.left = tmp

      #pass self's value to its left
      self.left.value = self.value

      #assign self's value as self's right child value
      self.value = self.right.value

      #assign left 's right child as self's right.left
      self.left.right = self.right.left
      self.right.left = nil

      #self's right is now self.right.right
      self.right = self.right.right

      self
    end

    def rotate_right
      raise RuntimeError, 'left rotation on a tree with no right child is not possible' if self.right.nil?

      tmp = self.right
      self.right = self.class.new
      self.right.right = tmp

      self.right.value = self.value

      self.value = self.left.value

      self.right.left = self.left.right
      self.left.right = nil

      self.left = self.left.left

      self
    end

  end

end