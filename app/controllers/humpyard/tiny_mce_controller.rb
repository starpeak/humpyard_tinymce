class Humpyard::TinyMceController < ApplicationController
  def link
    @pages = _page_tree 
    @medias = Humpyard::Asset.all
    render layout: false
  end

  protected
  def _page_tree page=nil, indent = 0
    if page.nil?
      pages = []
      root_page = Humpyard::Page.root_page
      ([root_page] + root_page.siblings).each do |page|
        pages += _page_tree page, 0
      end 
    else
      pages = []
      pages << ["#{indent > 1 ? '| '*(indent-1) : ''}#{indent > 0 ? '+-' : ''}#{page.title}", page.id]
      page.child_pages.each do |child|
        pages += _page_tree child, indent + 1
      end
    end
    pages
  end
end
