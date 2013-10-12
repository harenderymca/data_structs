module TreeUtilities

  module TreeBalancing

    def balance_factor
      (left ? left.depth : 0) - (right ? right.depth : 0)
    end

    def balanced?
      return true if balance_factor <= 1 and balance_factor >= -1
      false
    end

    def full_balanced?
      return true if self.balanced? and (left ? left.full_balanced? : true) and (right ? right.full_balanced? : true)
      false
    end

  end

end
