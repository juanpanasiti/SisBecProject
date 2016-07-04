class AddAttachmentCoverToKindOfScholarships < ActiveRecord::Migration
  def self.up
    change_table :kind_of_scholarships do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :kind_of_scholarships, :cover
  end
end
