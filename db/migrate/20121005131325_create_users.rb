class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.text :notes
      t.boolean :learn_about_aichi_targets
      t.boolean :participate_in_learning_group
      t.boolean :workshops_and_study_tours
      t.boolean :identify_peers
      t.boolean :tech_support

      t.timestamps
    end
  end
end
