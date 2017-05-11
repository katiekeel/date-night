require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/tree.rb'
require './lib/node.rb'

class TreeTest < Minitest::Test

  def test_tree_exists
    tree = Tree.new
    assert_instance_of Tree, tree
  end

  def test_tree_can_take_elements
    tree = Tree.new
    tree.insert(72, "A")
    refute_nil tree.tree_root
  end

  def test_root_has_left_and_right_nodes
    tree = Tree.new
    tree.insert(55, "A")
    tree.insert(24, "B")
    tree.insert(72, "C")
    refute_nil tree.tree_root.left
    refute_nil tree.tree_root.right
  end

  def test_tree_has_a_score
    tree = Tree.new
    tree.insert(78, "B")
    tree.insert(64, "C")
    tree.insert(85, "Y")
    tree.insert(43, "F")
    assert tree.include?(64)
  end

  def test_tree_does_not_have_a_certain_score
    tree = Tree.new
    tree.insert(78, "B")
    tree.insert(64, "C")
    tree.insert(85, "Y")
    tree.insert(43, "F")
    refute tree.include?(55)
  end


  def test_depth_of_tree
    tree = Tree.new
    tree.insert(78, "B")
    tree.insert(64, "C")
    tree.insert(85, "Y")
    tree.insert(43, "F")
    assert_equal tree.depth_of?(43), 2
  end

  def test_highest_score
    tree = Tree.new
    tree.insert(78, "B")
    tree.insert(64, "C")
    tree.insert(85, "Y")
    tree.insert(43, "F")
    assert_equal tree.max, ({"Y" => 85})
  end

  def test_another_highest_score
    tree = Tree.new
    tree.insert(78, "B")
    tree.insert(64, "C")
    tree.insert(85, "Y")
    tree.insert(43, "F")
    tree.insert(33, "G")
    tree.insert(21, "H")
    tree.insert(9, "A")
    tree.insert(84, "D")
    tree.insert(99, "Z")
    assert_equal tree.max, ({"Z" => 99})
  end


  def test_lowest_score
    tree = Tree.new
    tree.insert(78, "B")
    tree.insert(64, "C")
    tree.insert(85, "Y")
    tree.insert(43, "F")
    assert_equal tree.min, ({"F" => 43})
  end

  def test_another_lowest_score
    tree = Tree.new
    tree.insert(78, "B")
    tree.insert(64, "C")
    tree.insert(85, "Y")
    tree.insert(43, "F")
    tree.insert(33, "G")
    tree.insert(21, "H")
    tree.insert(9, "A")
    assert_equal tree.min, ({"A" => 9})
  end


end
