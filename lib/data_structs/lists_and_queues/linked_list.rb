class LinkedList

  attr_accessor :value, :next , :length

  def initialize
    @value = nil
    @next = nil
    @length = 0
  end

  def insert(e)
    if self.empty?
      self.value = e
    else
      self.next = self.class.new if self.next.nil?
      self.next.insert e
    end
    self.length += 1
    self
  end

  def empty?
    return true if self.value.nil?
    false
  end

end