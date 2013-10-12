class AVLTree < BinarySearchTree

  include TreeUtilities::TreeBalancing

  def insert(e)
    if self.empty?
      self.value = e
      self.balancify # balance <- here
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

end