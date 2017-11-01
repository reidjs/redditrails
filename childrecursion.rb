class Comment
  attr_reader :name

  def initialize(name)
    @children = []
    @name = name
  end

  def add_child(child)
    @children << child
  end

  def children
    @children
  end

end

a = Comment.new('a')
b = Comment.new('b')
c = Comment.new('c')
d = Comment.new('d')
e = Comment.new('e')

a.add_child(b)
b.add_child(c)
b.add_child(d)
c.add_child(e)


def child_rec(comment)
  p comment.name #relative top level comment
  comment.children.each do |child|
    child_rec(child) #all direct children of the relative top level comment 
  end
end

all = child_rec(a)
# all.each {|a| p a.name}
