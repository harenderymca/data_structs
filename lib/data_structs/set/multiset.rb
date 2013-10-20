#set is already implemented in ruby
#this module is to implement multiset
#multiset can include more than one occurrences of an object

#class Multiset
#
#  include Enumerable
#
#  attr_reader :size
#
#  def initialize
#    @hash = {}
#    @size = 0
#  end
#
#  def add(e)
#    @hash[e] = 0 unless @hash[e]
#    @hash[e] += 1
#    @size += 1
#    e
#  end
#
#  def <<(e)
#    add e
#  end
#
#  #delete one occurrence of e
#  def delete(e)
#    if @hash[e]
#      @hash[e] -= e
#      @size -= 1
#      e
#    end
#  end
#
#  #delete all occurrences of e
#  def delete_all(e)
#    if @hash[e]
#      @size -= @hash[e]
#      @hash[e] = nil
#      e
#    end
#  end
#
#  def include?(e)
#    @hash[e] ? true : false
#  end
#
#  def frequency(e)
#    @hash[e] ? @hash[e] : 0
#  end
#
#  def each(&block)
#    @hash.each_key &block
#  end
#
#  def to_s
#    @hash.to_s
#  end
#
#end

class MaxMinMultiset

  attr_accessor :hash, :size, :max, :min

  def initialize
    @hash = {}
    @size = 0
    @max = nil
    @min = nil
  end

end