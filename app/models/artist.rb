
class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  def self.find_by_slug(slug)
    self.all.select {|i| i.slug == slug}.first
  end


end
