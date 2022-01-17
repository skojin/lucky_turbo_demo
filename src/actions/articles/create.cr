class Articles::Create < BrowserAction
  post "/articles" do
    SaveArticle.create(params) do |operation, article|
      if article
        flash.success = "The record has been saved"
        redirect Show.with(article.id)
      else
        flash.failure = "It looks like the form is not valid"
        html_with_status NewPage, HTTP::Status::UNPROCESSABLE_ENTITY,
          operation: operation
      end
    end
  end
end
