module Humpyard
  module TinyMCE
    ####
    # Humpyard::TinyMCE::Engine is the ::Rails::Engine running the Humpyard TinyMCE Plugin
    class Engine < ::Rails::Engine
      initializer :humpyard_tinymce_initializer do | app |
        app.config.assets.precompile << 'tiny_mce/tiny_mce.js'
      end
    end
  end
end