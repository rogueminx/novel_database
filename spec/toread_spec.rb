# require('rspec')
# require('pg')
# require('toread')
#
# DB = PG.connect({:dbname => 'library_test'})
#
# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec('DELETE FROM toread *;')
#   end
# end
#
# describe(Toread) do
#   describe('#==') do
#     it('is the same book if titles are the same') do
#       one = Novels.new({:title => 'Bone Clocks', :author => 'David Mitchell', :genre => 'Fantasy', :toread_id => 1})
#       two = Novels.new({:title => 'Bone Clocks', :author => 'David Mitchell', :genre => 'Fantasy', :toread_id => 1})
#       expect(one).to(eq(two))
#     end
#   end # ==
#
# end #Toread
