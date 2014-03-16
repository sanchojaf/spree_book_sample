module Spree
  module PeachSample
    def self.load_peach_sample(file)
      path = File.expand_path(peach_samples_path + "#{file}.rb")
      # Check to see if the specified file has been loaded before
      if !$LOADED_FEATURES.include?(path)
        require path
        puts "Loaded #{file.titleize} peach samples"
      end
    end

    private
      def self.peach_samples_path
        Pathname.new(File.join(File.dirname(__FILE__), '..', '..', 'db', 'peach_samples'))
      end
  end
end
