class AddRottenTomatoesUriToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :rotten_tomatoes_uri, :integer
  end
end
