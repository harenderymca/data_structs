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
      it 'returns the a hash with key => frequency'
      it 'matches each element to its frequency'
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
      it 'returns the size of set = no elements'
    end

  end

  describe 'Max' do

    context 'Fresh copy' do
      it 'every new set has max == nil'
    end

    context 'Dense set' do
      it 'returns the current maximum element in set'
    end

    context 'When the current max element is deleted' do
      it 'searches all the elements and assigns the next max element as @max'
    end

    context 'When the only element is deleted' do
      it 'assigns the @max = nil, max should return nil'
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
      it 'returns the current min element in the set'
    end

    context 'When the current min is deleted' do
      it 'searches and returns the next min element in set'
    end

    context 'when the only element is deleted' do
      it 'assigns @min = nil'
    end

  end

  describe 'Add' do

    context 'When adding in an empty set' do
      it 'checks that size == 1'
      it 'checks that min == element just added'
      it 'checks that max == element_just_added'
    end

    context 'random addition in a dense tree' do
      it 'increases the size of set by 1'
    end

    context 'When adding element greater than current max' do
      it 'assigns @max = element_just added'
    end

    context 'When adding element smaller than current min' do
      it 'assigns @min = element_just added'
    end

    context 'when adding an element that is already present' do
      it 'increases the frequency of element by one'
      it 'increases the size by one'
    end

    context 'adding an element same as max or min' do
      it 'does not changes the max or min'
      it 'size id increased by one'
    end

  end

end