
module HelperMethods

  # module InstanceHelper
    def slug
      self.name.parameterize
    end
  # end

  # module ClassHelper
    def self.find_by_slug(slug)
      puts self.class
      puts self.class.count
      self.class.all.select {|i| i.slug == slug}
    end
  # end
end
