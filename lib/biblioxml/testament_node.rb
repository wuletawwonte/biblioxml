class TestamentNode
  TESTAMENTS = %w[old new].freeze

  attr_reader :books
  attr_accessor :name

  def initialize(name: "new")
    @name = name
    @books = []
  end

  def add_book(book)
    @books << book
  end
end
