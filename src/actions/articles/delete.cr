class Articles::Delete < BrowserAction
  delete "/articles/:article_id" do
    article = ArticleQuery.find(article_id)
    DeleteArticle.delete(article) do |_operation, _deleted|
      flash.success = "Deleted the article"
      redirect Index, status: HTTP::Status::SEE_OTHER
    end
  end
end
