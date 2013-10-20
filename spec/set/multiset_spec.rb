require_relative '../../spec/spec_helper'

#describe Multiset do
#
#  describe 'INITIALIZATION' do
#    it 'returns a new multiset' do
#      m = Multiset.new
#      m.class.should eq Multiset
#    end
#  end
#
#  describe 'basic methods' do
#    it 'is a test to see all basic methods of multiset' do
#      m = Multiset.new
#      m.size.should eq 0
#      m << 1
#      m.size.should eq 1
#      m.to_s.should eq({ 1 => 1 }.to_s)
#      m << 1
#      m.size.should eq 2
#      m.to_s.should eq( { 1 => 2 }.to_s)
#      m << 3
#      m.should include 3
#      m.should_not include 2
#    end
#  end
#
#end