##
# Create test data for the searching examples
# All descriptions taken from https://store.kobobooks.com/
namespace :create_test_data do
  desc 'Generate some data for searching on, deletes all old data'
  task seed_data: :environment do
    Book.destroy_all

    Book.create!( title: 'ReWork',
                  author: Author.create!(name: 'David Heinemeier Hansson, Jason Fried'),
                  tags: 'Work from Home, Business and Finance, Self Help',
                  description: 'From the founders of the trailblazing software company '\
                               '37signals, here is a different kind of business book - '\
                               'one that explores a new reality. Today, anyone can be '\
                               'in business. Tools that used to be out of reach are no '\
                               'easily accessible. Technology that cost thousands is '\
                               'now just a few pounds or even free. Stuff that was '\
                               'impossible just a few years ago is now simple.')

    Book.create!( title: 'Secrets and Lies',
                  author: Author.create!(name: 'Bruce Schneier'),
                  tags: 'Computers, Networking & communications, Computer Security',
                  description: 'Bestselling author Bruce Schneier offers his expert '\
                               'guidance on achieving security on a network '\
                               'Internationally recognized computer security expert '\
                               'Bruce Schneier offers a practical, straightforward '\
                               'guide to achieving security throughout computer '\
                               'networks. Schneier uses his extensive field experience '\
                               'with his own clients to dispel the myths that often '\
                               'mislead IT managers as they try to build secure '\
                               'systems. This practical guide provides readers with a '\
                               'better understanding of why protecting information is '\
                               'harder in the digital world, what they need to know to '\
                               'protect digital information, how to assess business and '\
                               'corporate security needs, and much more.')

    Book.create!( title: 'Mastering ElasticSearch',
                  author: Author.create!(name: 'Rafał Kuć, Marek Rogoziński'),
                  tags: 'Computers, Internet, Web Development, Java',
                  description: 'A practical tutorial that covers the difficult design, '\
                               'implementation, and management of search solutions. '\
                               'Mastering ElasticSearch is aimed at to intermediate '\
                               'users who want to extend their knowledge about '\
                               'ElasticSearch. The topics that are described in the '\
                               'book are detailed, but we assume that you already know '\
                               'the basics, like the query DSL or data indexing. '\
                               'Advanced users will also find this book useful, as '\
                               'the examples are getting deep into the internals where '\
                               'it is needed.')
  end
end
