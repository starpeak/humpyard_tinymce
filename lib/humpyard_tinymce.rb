####
# Welcome to Humpyard TinyMCE Plugin
require 'humpyard'

module Humpyard
  module TinyMCE
    def self.load options = {} #:nodoc:
    end
  end
end

require File.expand_path('../humpyard_tinymce/engine', __FILE__)

require 'i18n'
I18n.load_path += Dir.glob("#{File.dirname(__FILE__)}/../config/locales/*.yml")
I18n.backend.reload!