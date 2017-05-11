# Creating a Node class that allows us to create nodes for insertion into tree

class Node

  # Each node has a rating (value), and a pointer to left and/or right
  attr_accessor :rating, :title, :left, :right

  def initialize(rating, title, left=nil, right=nil)
    @rating = rating
    @title = title
    @left = left
    @right = right
  end

end
