require 'rails_helper'

RSpec.describe Author, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :author_books}
    it {should have_many(:books).through(:author_books)}
  end

  describe "average_pages" do
    it "can calculate the average number of pages of all author's books" do

      book_1 = Book.create!(title: "Some Title",
                           pages: 600,
                           publication_year: "1654")
      book_2 = Book.create!(title: "Tragic Title",
                           pages: 300,
                           publication_year: "1628")
      author_1 = Author.create!(name: "Shakespeare")

      author_1.books << [book_1, book_2]

      expect(author_1.average_pages).to eq(450)
    end
  end
end
