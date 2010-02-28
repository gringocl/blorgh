class ActiveRecord::Base
  def self.ensure(value)
    # Find the record if it already exists.
    find_by_lookup_field(value)
  end
  
  private
  
    def find_by_lookup_field(value)
      send()
    end
end