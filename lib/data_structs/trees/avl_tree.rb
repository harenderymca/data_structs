class AVLTree < BinarySearchTree

  include TreeUtilities::TreeBalancing

  def insert(e)

    if empty?
      self.value = e
    else
      if e > self.value
        self.right = self.class.new if right.nil?
        self.right.insert e

        if self.balance_factor == -2
          if e > self.right.value
            rotate_left
          else
            self.right.rotate_right
            self.rotate_left
          end
        end
      else
        self.left = self.class.new if left.nil?
        self.left.insert e
        if self.balance_factor == 2
          if e < self.left.value
            rotate_right
          else
            self.left.rotate_left
            self.rotate_right
          end
        end
      end
    end

    self
  end

end