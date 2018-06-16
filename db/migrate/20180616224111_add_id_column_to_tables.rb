class AddIdColumnToTables < ActiveRecord::Migration[5.2]
  def change
    tables = [
        "event_performances",
        "featuring",
        "genre_dependencies",
        "member_functions",
        "radio_performances",
        "soundtracks"
    ]

    tables.each do |table|
      execute <<~HEREDOC
        ALTER TABLE public.#{table}
          DROP CONSTRAINT #{table}_pkey,
          ADD COLUMN id SERIAL PRIMARY KEY;
      HEREDOC
    end
  end
end
