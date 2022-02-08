class Job < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :languages, presence: true
    before_validation :clean_empty_array_languages
    has_many :user_applied_jobs

    private

    def clean_empty_array_languages
      self.languages = languages.presence
    end

    def self.search(search)
      if search
        where("title like ?", "%#{search}%")
      else
        all
      end
    end

end
