class Articles::Update < BrowserAction
  put "/articles/:article_id" do
    article = ArticleQuery.find(article_id)
    SaveArticle.update(article, params) do |operation, updated_article|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(updated_article.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, article: updated_article
      end
    end
  end
end
