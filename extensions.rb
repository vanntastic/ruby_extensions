# Standard Ruby Core class extensions
# Extract this out to separate files when this file gets too long

module Extensions
  
  module Array

    # divides an array into a smaller chunks
    # [1,2,3,4].divide_by 2 # => [[1,2],[3,4]]
    def divide_by(number_of_chunks)
      chunks = (1..number_of_chunks).collect { [] }
      self.each_with_index do |item, index|
        chunks[index % number_of_chunks] << item
      end
      chunks
    end

    alias / divide_by

  end
  
  module String
    # grab the first character
    def first
      self[0..0]
    end

    # grab the last character
    def last
      self[(self.length-1)..(self.length-1)]
    end
  end
  
  module Symbol
    
    # :rice => @rice
    def instance_variable
      eval("@#{self.to_s}")
    end
    
  end
  
end

Array.send :include, Extensions::Array
String.send :include, Extensions::String
Symbol.send :include, Extensions::Symbol