class Novels
  attr_accessor(:title, :author, :genre, :id)

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @author = attributes.fetch(:author)
    @genre = attributes.fetch(:genre)
    @id = attributes.fetch(:id)
  end

  def ==(other_book)
    self.title().==(other_book.title())
  end

  def self.all
    returned_novels = DB.exec('SELECT * FROM novels;')
    novels = []
    returned_novels.each do |item|
      title = item.fetch('title')
      author = item.fetch('author')
      genre = item.fetch('genre')
      id = item.fetch('id').to_i
      novels.push(Novels.new({:title => title, :author => author, :genre => genre, :id => id}))
    end
    novels
  end # self

  def save
    result = DB.exec("INSERT INTO novels (title, author, genre) VALUES ('#{@title}', '#{@author}', '#{@genre}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def title
    @title
  end


end #Novels
