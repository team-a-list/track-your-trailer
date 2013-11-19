class CreateUserMovies < ActiveRecord::Migration
  def change
    create_table :user_movies do |t|
      t.references :user, index: true
      t.references :movie, index: true

      t.timestamps
    end
  end
end
