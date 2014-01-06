module Spree
  module RegattableSample
    def self.load_regattable_sample(file)
      path = File.expand_path(regattable_samples_path + "#{file}.rb")
      # Check to see if the specified file has been loaded before
      if !$LOADED_FEATURES.include?(path)
        require path
        puts "Loaded #{file.titleize} regattable samples"
      end
    end

    private
      def self.regattable_samples_path
        Pathname.new(File.join(File.dirname(__FILE__), '..', '..', 'db', 'regattable_samples'))
      end
  end
end
