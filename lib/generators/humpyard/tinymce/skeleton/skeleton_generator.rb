require 'generators/humpyard_tinymce'

module Humpyard
  module Tinymce
    module Generators
      ####
      # == Skeleton Generator
      #
      #   rails humpyard:skeleton [options]
      #
      # === Description
      # The humpyard skeleton generator creates a basic layout, stylesheet and
      # helper which will give some structure to a starting Rails app.
      #
      # === Options
      # <tt>[--skip-compass]</tt>::
      #   Don't generate COMPASS related files (do this only if you really know what you are doing)
      # <tt>[--table-name-prefix=TABLE_NAME_PREFIX]</tt>::
      #  The SQL table name prefix for humpyard as string
      #
      #  Default: <tt>humpyard_</tt>
      # <tt>[--locales=one two three]</tt>::
      #   The locales used in humpyard as array
      #
      #   Default: <tt>en</tt>
      # <tt>[--www-prefix=WWW_PREFIX]</tt>::
      #   The prefix for humpyard www pages as string
      #
      #   Default: <tt>:locale/</tt>
      # <tt>[--skip-haml-init]</tt>::
      #   Don't generate HAML initializer (if you are already using HAML)
      # <tt>[--admin-prefix=ADMIN_PREFIX]</tt>::
      #   The prefix for humpyard admin controllers as string
      #
      #   Default: <tt>admin</tt>
      # <tt>[--skip-compass-init]</tt>::
      #   Don't generate COMPASS initializer (if you are already using COMPASS)
      #
      # === Runtime options
      # <tt>-q, [--quiet]</tt>:: Supress status output
      # <tt>-p, [--pretend]</tt>:: Run but do not make any changes
      # <tt>-s, [--skip]</tt>:: Skip files that already exist
      # <tt>-f, [--force]</tt>:: Overwrite files that already exist
      #
      # === Examples
      #   rails generate humpyard:skeleton
    
      class SkeletonGenerator < Base
        class_option :templates, :desc => 'The page template', :group => 'Humpyard Layout', :type => :hash, :default => Humpyard::config.templates.map{|name, template| name}
        class_option :skip_js_init, :desc => 'Don\'t generate Javascript related files', :group => 'JavaScript config', :type => :boolean
        class_option :js_framework, :desk => 'The javascript framework used in humpyard application', :group => 'JavaScript config', :type => :string, :default => Humpyard::config.js_framework
	
        def create_skeleton # :nodoc:      
          template 'initializers/humpyard_tinymce.rb', "config/initializers/humpyard_tinymce.rb"
          template_path = "#{::File.dirname(__FILE__)}/templates/"
          unless options[:skip_js]
  		      Dir.glob("#{template_path}#{options[:js_framework]}/**/*.*").each do |file|
              copy_file file.gsub(template_path, ''), "public/#{file.gsub("#{template_path}#{options[:js_framework]}", '')}"
            end
          end  
        end
    
        private
      
        def file_name
          layout_name.underscore
        end
      end
    end
  end
end