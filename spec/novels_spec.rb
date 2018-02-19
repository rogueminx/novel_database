require('rspec')
require('pg')
require('novels')
require('pry')

DB = PG.connect({:dbname => 'library_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM novels *;')
  end
end

describe(Novels) do
  describe('#==') do
    it('is the same book if titles are the same') do
      one = Novels.new({:title => 'Bone Clocks', :author => 'David Mitchell', :genre => 'Fantasy', :id => nil})
      two = Novels.new({:title => 'Bone Clocks', :author => 'David Mitchell', :genre => 'Fantasy', :id => nil})
      expect(one).to(eq(two))
    end
  end # ==

  describe('.all') do
    it('empty at first') do
      expect(Novels.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds novels to array of novels') do
      novel_one = Novels.new({:title => 'The Goldfinch', :author => 'Donna Tartt', :genre => 'Drama', :id => nil})
      novel_one.save
      novel_two = Novels.new({:title => 'Between the World and Me', :author => 'Ta Nehisi Coates', :genre => 'Memoire', :id => nil})
      novel_two.save
      expect(Novels.all()).to(eq([novel_one, novel_two]))
    end
  end # save

  describe("#title") do
    it("lets you read out the title.") do
      test_novel = Novels.new({:title => 'The Goldfinch', :author => 'Donna Tartt', :genre => 'Drama', :id => nil})
      expect(test_novel.title()).to(eq('The Goldfinch'))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      novel_one = Novels.new({:title => 'The Goldfinch', :author => 'Donna Tartt', :genre => 'Drama', :id => nil})
      novel_one.save()
      expect(novel_one.id()).to(be_an_instance_of(Integer))
    end
  end


end # Novels
