class Articles::Show < BrowserAction
  get "/articles/:article_id" do
    html ShowPage, article: ArticleQuery.find(article_id)
  end
end
