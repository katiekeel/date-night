require './lib/node.rb'
require 'pry'

# Creating a class Tree that
class Tree

  attr_accessor :tree_root, :depth

  def initialize
    @tree_root = nil
    @depth = depth
  end

# We call insert
# If no root exists we make one with a new node
# If a root does exist, we call insert_node on the current node

  def insert(rating, title)
    # current_node = tree_root
    # binding.pry
    if tree_root == nil
      @tree_root = Node.new(rating, title)
      @depth = 0
      puts @depth
    else
      insert_node(rating, title, tree_root)
    end
  end


  def insert_node(rating, title, current_node, node_depth = 1)
    if rating > current_node.rating
      if current_node.right == nil
        current_node.right = Node.new(rating, title)
        puts node_depth
      else current_node.right != nil
        insert_node(rating, title, current_node.right, node_depth += 1)
      end
    else rating < current_node.rating
      if current_node.left == nil
        current_node.left = Node.new(rating, title)
        puts node_depth
      else current_node.left != nil
        insert_node(rating, title, current_node.left, node_depth += 1)
      end
    end
  end

  def include?(rating, current_node = @tree_root)
    if current_node == nil
      return false
    elsif rating == current_node.rating
      return true
    elsif rating < current_node.rating
      current_node = current_node.left
      include?(rating, current_node)
    else rating > current_node.rating
      current_node = current_node.right
      include?(rating, current_node)
    end
  end

  def depth_of?(rating, current_node = @tree_root, node_depth = 0)
    # Reports the depth of the tree where a score appears. Return nil if the score does not exist
    if current_node == nil
      return nil
    elsif rating == current_node.rating
      return node_depth
    elsif rating < current_node.rating
      current_node = current_node.left
      depth_of?(rating, current_node, node_depth += 1)
    else rating > current_node.rating
      current_node = current_node.right
      depth_of?(rating, current_node, node_depth += 1)
    end
  end

  def max(current_node = tree_root)
    # Which movie has the highest score in the list? What is it’s score?
    # Right side traversal
    if current_node.right == nil
      return {current_node.title => current_node.rating}
    else
      max(current_node.right)
    end
  end

  def min(current_node = tree_root)
    # Which movie has the lowest score in the list? What is it’s score?
    # Left side traversal
    if current_node.left == nil
      return {current_node.title => current_node.rating}
    else
      min(current_node.left)
    end
  end

  def sort(current_node = tree_root, left_side = [], right_side = [])
    # Return an array of all the movies and scores in sorted ascending order.
    # Return them as an array of hashes.
    # Left and right side traversal, then merge sort
    if current_node.right == nil
      right_side << {current_node.title => current_node.rating}
    elsif current_node.right != nil
      sort(current_node.right)
    elsif current_node.left == nil
      left_side << {current_node.title => current_node.rating}
    else
      sort(current_node.right)
    end
  end

  def load
    # Assuming we have a file named movies.txt with one score/movie pair per line:
    # tree.load('movies.txt')
        # => 26
    # Where the return value is the number of movies inserted into the tree.
    # If a score is already present in the tree when load is called, ignore it.
  end

  def health
    # Report on the health of the tree by summarizing the number of child nodes (nodes beneath each node)
    # at a given depth. For health, we’re worried about 3 values:
      # Score of the node
      # Total number of child nodes including the current node
      # Percentage of all the nodes that are this node or it’s children
    # Where the return value is an Array with one nested array per node at that level. The nested array is:
      # [score in the node, 1 + number of child nodes, floored percentage of (1+children) over the total number of nodes]
  end

end
