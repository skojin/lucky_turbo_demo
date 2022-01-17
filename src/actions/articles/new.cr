class Articles::New < BrowserAction
  get "/articles/new" do
    html NewPage, operation: SaveArticle.new
  end
end
