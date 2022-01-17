class Articles::Index < BrowserAction
  get "/articles" do
    html IndexPage, articles: ArticleQuery.new
  end
end
