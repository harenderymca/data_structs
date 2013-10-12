module TreeUtilities
  #MODULE
  #ROTATION IS IMPLEMENTED SEPARATELY
  module TreeRotation

    def rotate_left
      raise RuntimeError, 'left rotation on a tree with no right child, is not possible' if self.right.nil?

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
      raise RuntimeError, 'right rotation on a tree with no left child, is not possible' if left.nil?

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