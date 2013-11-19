class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.datetime :release_date_theater
      t.datetime :release_date_dvd
      t.string :poster_image

      t.timestamps
    end
  end
end
