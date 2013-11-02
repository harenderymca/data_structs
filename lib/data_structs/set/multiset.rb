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

  def add(e)
    @hash[e] = 0 unless @hash[e]
    @hash[e] += 1

    #set size
    @size += 1

    #set max
    @max = e if @max.nil? or @max < e

    #set min
    @min = e if @min.nil? or @min > e

    e
  end

  def <<(e)
    add(e)
  end

  def delete(e)
    if frequency(e) > 0

      @hash[e] -= 1
      @size -= 1

      if @hash[@max].nil? or @hash[@max] == 0
        @max = nil
        @hash.each_pair do |k,f|
          if f and f > 0
            @max = k if @max.nil? or @max < k
          end
        end
      end

      if @hash[@min].nil? or @hash[@min] == 0
        @min = nil
        @hash.each_pair do |k, f|
          if f and f > 0
            @min = k if @min.nil? or @min > k
          end
        end
      end

      @hash.delete(e) if @hash[e] == 0
      e
    end
  end

  def frequency(e)
    return @hash[e] if @hash[e] and @hash[e] > 0
    0
  end

end