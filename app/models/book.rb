##
# A book model for showing example searches
class Book < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # Touch so ElasticSearch gets updated
  belongs_to :author, touch: true

  settings do
    mappings do
      indexes :title, type: :string, analyzer: :phonetic
      indexes :author do
        indexes :name, type: :string
      end
      indexes :tags_array, type: :string, index: :not_analyzed
      indexes :description, type: :string
    end
  end

  ##
  # Define how the data will be stored in elasticsearch
  def as_indexed_json(options={})
    self.as_json(
      only:     [:title, :author, :description],
      methods:  [:tags_array],
      include:  [author: { only: [:name] }]
    )
  end

  ##
  # Split the array on , and downcase to set a standard on
  # tags
  def tags_array
    tags.split(',').map!(&:strip).map!(&:downcase)
  end


  ##
  # Define a base search method for the Book model
  # Searches the query on title and tags with a power of 10
  # then a low weight filter on description.
  # It uses a fuzzy search so you can search for:
  #   secrets with secrts etc
  # Then its highlights the words it matched on with <em></em> tags
  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title^10', 'tags^10', 'description', 'author.name^15'],
            fuzziness: 2
          }
        },
        highlight: {
          pre_tags: ['<em>'],
          post_tags: ['</em>'],
          fields: {
            title: {},
            description: {}
          }
        }
      }
    )
  end
end
