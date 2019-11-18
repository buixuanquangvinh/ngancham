class Photo < ApplicationRecord
    mount_uploader :image, PhotoUploader
    belongs_to :item, optional: true
    before_destroy :delete_remote_file, prepend: true

    private
    def delete_remote_file
        self.image.file.delete
    end
end
