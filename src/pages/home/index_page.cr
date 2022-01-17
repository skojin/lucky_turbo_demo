class Home::IndexPage < MainLayout
  def content
    tag("p") do
      link "Turbo Articles", Articles::Index
    end
  end
end
