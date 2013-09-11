module TreeUtilities

  module Methods

    def push(array)
      array.each do |e|
        self.insert e
      end

      self
    end

    def empty?
      return true if self.value.nil?
      false
    end

    def inorder_traversal(array=[])
      self.left.inorder_traversal array unless self.left.nil?
      array << self.value
      self.right.inorder_traversal array unless self.right.nil?
      array
    end

    def preorder_traversal(array=[])
      array << self.value
      self.left.preorder_traversal array unless left.nil?
      self.right.preorder_traversal array unless right.nil?
      array
    end

    def postorder_traversal(array=[])
      self.left.postorder_traversal array unless left.nil?
      self.right.postorder_traversal array unless right.nil?
      array << self.value
      array
    end

  end

end