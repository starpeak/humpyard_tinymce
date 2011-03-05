module Humpyard
  module TinyMCE
    class Config
      def initialize(&block) #:nodoc:
        configure(&block) if block_given?
      end

      # Configure your Humpyard TinyMCE with the given parameters in 
      # the block. 
      def configure(&block)
        yield(self)
      end
    end
  end
end