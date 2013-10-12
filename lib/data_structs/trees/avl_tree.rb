class AVLTree

  attr_accessor :height, :value, :left, :right, :parent

  #include TreeUtilities::TreeBalancing
  include TreeUtilities::Methods
  include TreeUtilities::TreeRotation

  def initialize
    @value = nil
    @left = nil
    @right = nil
    @parent = nil
    @height = 0
  end

  def find(e)
    if self.value == e
      self
    else
      if e > self.value
        self.right.find e if right
      else
        self.left.find e if left
      end
    end
  end

  def insert(x)
    if empty?
      self.value = x
    else

      if x > self.value
        self.right = self.class.new if right.nil?
        right.insert x
        if self.balance_factor == -2
          if x > self.right.value
            rotate_left
          else
            right.rotate_right
            rotate_left
          end
        end
      else
        self.left = self.class.new if left.nil?
        self.left.insert x
        if self.balance_factor == 2
          if x < self.left.value
            rotate_right
          else
            left.rotate_left
            rotate_right
          end
        end
      end
    end
    self.height = self.calculate_height
    self
  end

  #def delete(e)
  #  if e > self.value
  #    self.right.delete(e) if right
  #    if self.balance_factor == 2
  #      if self.left.balance_factor >= 0
  #        ll
  #      else
  #        lr
  #      end
  #    else
  #      if e < self.value
  #        self.left.delete e if left
  #        if self.balance_factor == 2
  #          if self.right.balance_factor <= 0
  #            rr
  #          else
  #            rl
  #          end
  #        else
  #          #data is found
  #
  #        end
  #      end
  #    end
  #  end
  #end

  def delete(x)
    if x > self.value
      self.right = self.right.delete(x) if self.right
      if self.balance_factor == 2
        if left.balance_factor >= 0
          rotate_right
        else
          left.rotate_left
          rotate_right
        end
      end
    else
      if x < self.value
        self.left = self.left.delete x if left
        if self.balance_factor == -2
          if right.balance_factor <= 0
            rotate_left
          else
            right.rotate_right
            rotate_left
          end
        end
      else
        if right
          p = self.right
          while p.left
            p = p.left
          end
          self.value = p.value
          self.right = self.right.delete(p.value)
          if self.balance_factor == 2
            if left.balance_factor >= 0 
              rotate_right
            else
              left.rotate_left
              rotate_right
            end
          end
        else
          return self.left
        end
      end
    end
    self.height = self.calculate_height
    self
  end

  def calculate_height
    if empty?
      0
    else
      1 + [left ? left.height : 0, right ? right.height : 0].max
    end
  end

  def balance_factor
    (left ? left.height : 0) - (right ? right.height : 0)
  end

  def balanced?
    return true if self.balance_factor <= 1 and self.balance_factor >= -1
    false
  end

  def full_balanced?
    return true if self.balanced? and (left ? left.full_balanced? : true) and (right ? right.full_balanced? : true)
    false
  end

  def rotate_right
    super
    self.left.height = self.left.calculate_height if left
    self.right.height = self.right.calculate_height if right
    #self.height = self.calculate_height
    self
  end

  def rotate_left
    super
    self.left.height = self.left.calculate_height if left
    self.right.height = self.right.calculate_height if right
    #self.height = self.calculate_height
    self
  end

end