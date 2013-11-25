class AddSynopsisAndLinksToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :synopsis, :text
    add_column :movies, :poster_image_small, :string
    add_column :movies, :rotten_tomatoes_link, :string
  end
end
