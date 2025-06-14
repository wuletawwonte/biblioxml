# frozen_string_literal: true
require "nokogiri"

module Biblioxml
  class Parser
    def self.read(file_path)
      File.read(file_path) do |bible_file|
        doc = Nokogiri::XML(bible_file)

        bible_tree = Biblioxml::BibleTree.new(translation: doc.root["translation"], status: doc.root["status"], link: doc.root["link"])
        doc.root.xpath("testament").each do |testament_node|
          testament = Biblioxml::TestamentNode.new(name: testament_node["name"])
          bible_tree.add_testament(testament)
          testament_node.xpath("book").each do |book_node|
            book = Biblioxml::BookNode.new(name: book_node["name"])
            testament.add_book(book)
            book_node.xpath("chapter").each do |chapter_node|
              chapter = Biblioxml::ChapterNode.new(number: chapter_node["number"])
              book.add_chapter(chapter)
              chapter_node.xpath("verse").each do |verse_node|
                verse = Biblioxml::VerseNode.new(number: verse_node["number"], text: verse_node.text)
                chapter.add_verse(verse)
              end
            end
          end
        end

        bible_tree
      end
    rescue Errno::ENOENT
      puts "Error: File not found - #{file_path}"
    end
  end
end

if __FILE__ == $0
  my_bible = Biblioxml::Parser.read("tmp/AmharicGamo2017Bible.xml")
  p my_bible
end
