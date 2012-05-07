namespace :humpyard do
  namespace :tinymce do
    task :copy_assets do
      target = File.join(Rails.public_path, Rails.application.config.assets.prefix)
      mkdir_p target
      %(vender app).each do |t|
      assets = File.expand_path(File.dirname(__FILE__) + "/../../#{t}/assets/javascripts/tiny_mce")
        cp_r assets, target
      end
    end
  end
end

# Copy TinyMCE assets when assets:precompile rake task is called
Rake::Task['assets:precompile'].enhance(['humpyard:tinymce:copy_assets'])