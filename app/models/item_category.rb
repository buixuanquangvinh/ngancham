class ItemCategory < ApplicationRecord
    default_scope { where(is_deleted: false) }

    has_paper_trail
    paginates_per 10
    validates :name,:image, presence: {message: "phải điền"}
    mount_uploader :image, PhotoUploader
    has_many :items, :dependent => :destroy

    before_save :to_slug
    private def to_slug
        self.slug = name.parameterize.truncate(80, omission: "")
    end

    #before_destroy :delete_remote_file, prepend: true
    #private def delete_remote_file
    #    if self.image?
    #        self.image.file.delete
    #    end
    #end

    def destroy
        update(:is_deleted, true)
    end
end
