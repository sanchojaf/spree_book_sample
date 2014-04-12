module Spree
  module BookSample
    def self.load_book_sample(file)
      path = File.expand_path(book_samples_path + "#{file}.rb")
      # Check to see if the specified file has been loaded before
      if !$LOADED_FEATURES.include?(path)
        require path
        puts "Loaded #{file.titleize} book samples"
      end
    end

    private
      def self.book_samples_path
        Pathname.new(File.join(File.dirname(__FILE__), '..', '..', 'db', 'book_samples'))
      end
  end
end
