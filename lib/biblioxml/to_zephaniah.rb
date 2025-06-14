# frozen_string_literal: true
require "nokogiri"

module Biblioxml
  class ToZephaniah
    def initialize(doc)
      @doc = doc
    end

    def convert
      builder = Nokogiri::XML::Builder.new(encoding: "UTF-8") do |xml|
        xml.XMLBIBLE(xmlns: "x-schema:XmlBible.xsd", biblename: "King James Version") do
          xml.INFORMATION do
            xml.translation @doc.root["translation"]
            xml.status @doc.root["status"]
            xml.link @doc.root["link"]
          end

          @doc.xpath("//testament").each do |testament|
            testament.xpath("./book").each do |book|
              xml.BIBLEBOOK(bnumber: book["number"], bname: Books::BOOKS_BY_NUMBER[book["number"].to_i][:bname], bsname: Books::BOOKS_BY_NUMBER[book["number"].to_i][:bsname]) do
                book.xpath("./chapter").each do |chapter|
                  xml.CHAPTER(cnumber: chapter["number"]) do
                    chapter.xpath("./verse").each do |verse|
                      xml.VERS(vnumber: verse["number"]) do
                        xml.text verse.text
                      end
                    end
                  end
                end
              end
            end
          end

        end
      end

      builder.to_xml
    end
  end
end
