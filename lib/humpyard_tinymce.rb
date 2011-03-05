####
# Welcome to Humpyard TinyMCE Plugin
require 'humpyard'

module Humpyard
  module TinyMCE
    # This is the actual version of the Humpyard gem
    VERSION = ::File.read(::File.join(::File.dirname(__FILE__), "..", "VERSION")).strip  
    
    def self.load options = {} #:nodoc:
    end
  
    # This is the path to the Humpyard gem's root directory
    def base_directory
      ::File.expand_path(::File.join(::File.dirname(__FILE__), '..'))
    end
  
    # This is the path to the Humpyard gem's lib directory
    def lib_directory
      ::File.expand_path(::File.join(::File.dirname(__FILE__)))
    end
    
    module_function :base_directory, :lib_directory

    class << self    
      # To access the actual configuration of your Humpyard TinyMCE, you can call this.
      #
      # See Humpyard::TinyMCE::Config for configuration options.
      def config
        @config ||= Humpyard::TinyMCE::Config.new
      end

      # Configure the Humpyard 
      # See Humpyard::Config.configure for details
      def configure(&block)
        config.configure(&block)
      end
    end
  end
end

require File.expand_path('../humpyard_tinymce/config', __FILE__)
require File.expand_path('../humpyard_tinymce/engine', __FILE__)

require 'i18n'
I18n.load_path += Dir.glob("#{File.dirname(__FILE__)}/../config/locales/*.yml")
I18n.backend.reload!

