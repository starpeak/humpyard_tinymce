namespace :humpyard do
  namespace :tinymce do
    task :copy_assets do
      assets = File.expand_path(File.dirname(__FILE__) + "/../../app/assets/javascripts/tiny_mce")
      target = File.join(Rails.public_path, Rails.application.config.assets.prefix)
    
      mkdir_p target
      cp_r assets, target
    end
  end
end

# Copy TinyMCE assets when assets:precompile rake task is called
Rake::Task['assets:precompile'].enhance(['humpyard:tinymce:copy_assets'])