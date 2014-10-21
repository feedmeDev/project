class CreateBugReports < ActiveRecord::Migration
  def change
    create_table :bug_reports do |t|
      t.string :platform
      t.string :report

      t.timestamps
    end
  end
end
