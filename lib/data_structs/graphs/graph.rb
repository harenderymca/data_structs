##graph is a list of nodes and edges
#
##both with be stored in a Set, since ordered is irrelevant
#
#class GraphNode
#
#  attr_accessor :key
#
#  def initialize(key=nil)
#    @key = key
#  end
#
#end
#
#class GraphEdge
#
#  attr_accessor :from,
#                :to
#
#  def initialize(from=nil, to=nil)
#    raise ArgumentError if (from.nil? and !to.nil?) or (!from.nil? and to.nil?)
#    @from = from
#    @to = to
#  end
#
#end
#
#
#require 'set'
#
#class Graph
#
#  attr_accessor :nodes,
#                :edges
#
#  def initialize
#    @node = Set.new
#    @edge = Set.new
#  end
#
#  #inserting a node
#  #insert the node in @nodes set
#  #insert all edges in @edges set
#  #THE graph is already made, in this case
#  #Making a new graph from given data, is other game.
#  def insert(node_key, adjacent_node_keys=[])
#    new_node = GraphNode.new(node_key)
#    self.nodes << new_node
#
#    adjacent_node_keys.each do |adjacent_node_key|
#      self.edges << GraphEdge.new(node_key, adjacent_node_key)
#    end
#
#    self
#  end
#
#  def include?(node_key)
#
#  end
#
#end

class Graph



end