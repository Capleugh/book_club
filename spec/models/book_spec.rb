require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :pages}
    it {should validate_presence_of :publication_year}

    it {should have_many :author_books}
    it {should have_many(:authors).through(:author_books)}
  end
  #
  # describe "#author_n" do
  #   it "can return names associated with an author" do
  #     book_1 = Book.create!(title: "Some Title",
  #                          pages: 600,
  #                          publication_year: "1854")
  #     author_1 = Author.create!(name: "Shakespeare")
  #     author_2 = Author.create!(name: "Sedaris")
  #
  #     book_1.authors << author_1
  #     book_1.authors << author_2
  #
  #     expect(book_1.author_names).to eq(["Shakespeare", "Sedaris"])
  #   end
  # end
end
