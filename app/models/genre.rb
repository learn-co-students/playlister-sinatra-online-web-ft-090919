
class Genre < ActiveRecord::Base

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def self.find_by_slug(slug)
    self.all.select {|i| i.slug == slug}.first
  end

end
