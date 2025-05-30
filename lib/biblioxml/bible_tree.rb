require_relative 'testament_node'

class BibleTree
  attr_reader :testaments
  attr_accessor :translation, :status, :link

  def initialize(translation: "", status: "", link: "")
    @translation = translation
    @status = status
    @link = link
    @testaments = [TestamentNode.new(name: "old"), TestamentNode.new(name: "new")]
  end
end
