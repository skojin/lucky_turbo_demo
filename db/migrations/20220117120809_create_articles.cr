class CreateArticles::V20220117120809 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Article) do
      primary_key id : Int64
      add_timestamps
      add title : String
    end
  end

  def rollback
    drop table_for(Article)
  end
end
