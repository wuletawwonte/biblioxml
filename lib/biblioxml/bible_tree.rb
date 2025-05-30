class BibleTree
  attr_reader :translation, :status, :link, :books

  def initialize
    @translation = ""
    @status = ""
    @link = ""
    @books = []
  end

  def add_book(book)
    @books << book
  end
end
