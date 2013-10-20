# aa tree is requires lesser operations in balancing than red-black tree


class AATree

  include TreeUtilities::Methods
  include TreeUtilities::TreeRotation

  attr_accessor :value, :left, :right, :parent

end