require_relative '../../spec/spec_helper'

describe MaxMinMultiset do

  describe 'Hash' do

    context 'Fresh Copy' do
      it 'returns an empty hash' do
        s = MaxMinMultiset.new
        s.hash.should eq({})
      end
    end

    context 'After adding some elements' do

      m = MaxMinMultiset.new
      m << 1
      m << 2
      m << 1
      m << 4

      it 'returns the a hash with key => frequency' do
        m.hash.should eq({1=>2, 2=>1, 4=>1})
      end
      it 'matches each element to its frequency' do
        m.hash[1].should eq 2
        m.hash[2].should eq 1
        m.hash[4].should eq 1
        m.hash[3].should be_nil
        m.min.should eq 1
        m.max.should eq 4
      end
    end

  end

  describe 'Size' do

    context 'Fresh' do
      it 'every new set has size 0' do
        s = MaxMinMultiset.new
        s.size.should eq 0
      end
    end

    context 'every new element increases the size by one' do
      it 'returns the size of set = no elements' do
        m = MaxMinMultiset.new
        size = m.size
        size.should eq 0
        FakeData.integer_array.each do |e|
          m << e
          m.size.should eq size+1
          size += 1
        end
      end
    end

  end

  describe 'Max' do

    context 'Fresh copy' do
      it 'every new set has max == nil' do
        m = MaxMinMultiset.new
        m.max.should be_nil
      end
    end

    context 'Dense set' do
      it 'returns the current maximum element in set' do
        m = MaxMinMultiset.new
        FakeData.integer_array(87).each do |e|
          m << e
        end
        m.max.should eq 86
      end
    end

    context 'When the current max element is deleted' do
      it 'searches all the elements and assigns the next max element as @max' do
        m = MaxMinMultiset.new
        FakeData.integer_array.each{ |e| m << e }
        m.max.should eq 99
        m.size.should eq 100
        m.delete(99)
        m.max.should eq 98
        m.size.should eq 99
      end
    end

    context 'When the only element is deleted' do
      it 'assigns the @max = nil, max should return nil' do
        m = MaxMinMultiset.new
        m << 3
        m.size.should eq 1
        m.max.should eq 3
        m.delete 3
        m.size.should eq 0
        m.max.should be_nil
      end
    end

  end

  describe 'Min' do

    context 'Fresh copy' do
      it 'returns nil, every new set has min == nil' do
        s = MaxMinMultiset.new
        s.min.should be_nil
      end
    end

    context 'Dense set' do
      it 'returns the current min element in the set' do
        m = MaxMinMultiset.new
        FakeData.integer_array.each{ |e| m<<e }
        m.min.should eq 0
      end
    end

    context 'When the current min is deleted' do
      it 'searches and returns the next min element in set' do
        m = MaxMinMultiset.new
        FakeData.integer_array.each{ |e| m<<e }
        m.min.should eq 0
        m.size.should eq 100
        m.delete(0)
        m.min.should eq 1
        FakeData.integer_array.each{ |e| m<<e }
        m.min.should eq 0
        m.size.should eq 199
        m.delete 0
        m.min.should eq 1
        m.max.should eq 99
        m.delete 1
        m.min.should eq 1
      end
    end

    context 'when the only element is deleted' do
      it 'assigns @min = nil' do
        m = MaxMinMultiset.new
        m << 1
        m.min.should eq 1
        m.delete 1
        m.min.should be_nil
        m.size.should eq 0
      end
    end

  end

  describe 'Add' do

    m = MaxMinMultiset.new

    context 'When adding in an empty set' do
      it 'checks that size == 1' do
        m.size.should eq 0
        m << 67
        m.size.should eq 1
      end
      it 'checks that min == element just added' do
        m.min.should eq 67
      end

      it 'checks that max == element_just_added' do
        m.max.should eq 67
      end
    end

    context 'random addition in a dense tree' do
      it 'increases the size of set by 1' do
        FakeData.integer_array.each{ |e| m << e }
        m.size.should eq 101
        m << 909
        m.size.should eq 102
        m.max.should eq 909
      end
    end

    context 'When adding element greater than current max' do
      it 'assigns @max = element_just added' do
        m << 1000
        m.max.should eq 1000
      end
    end

    context 'When adding element smaller than current min' do
      it 'assigns @min = element_just added' do
        m << -3
        m.min.should eq -3
      end
    end

    context 'when adding an element that is already present' do
      it 'increases the frequency of element by one' do
        m << 67
        m.hash[67].should eq 3
      end
      it 'increases the size by one' do
        m.size.should eq 105
      end
    end

    context 'adding an element same as max or min' do
      it 'does not changes the max or min' do
        m << 1000
        m.max.should eq 1000
        m.hash[1000].should eq 2
      end
      it 'size is increased by one' do
        m.size.should eq 106
      end
    end

  end

end