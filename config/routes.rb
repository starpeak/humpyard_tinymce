Rails::Application.routes.draw do
  scope "/#{Humpyard::config.admin_prefix}" do 
    get "tiny_mce/link", :controller => 'humpyard/tiny_mce', :action => 'link'
  end
end