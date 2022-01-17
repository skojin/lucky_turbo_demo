class Articles::RandomFramePage
  include Lucky::HTMLPage

  needs article : Article

  def render
    mount Articles::ShowView, article
  end
end
