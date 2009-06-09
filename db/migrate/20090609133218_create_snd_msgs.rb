class CreateSndMsgs < ActiveRecord::Migration
  def self.up
    create_table :snd_msgs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :snd_msgs
  end
end
