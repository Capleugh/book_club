class Book < ApplicationRecord
  validates_presence_of :title, :pages, :publication_year

  has_many :author_books
  has_many :authors, through: :author_books

  # def self.author_names
  #   self.authors.select(:name)
  # end
end
