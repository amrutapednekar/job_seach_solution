class Job < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :languages, presence: true
    before_validation :clean_empty_array_languages

    private

    def clean_empty_array_languages
      self.languages = languages.presence
    end

    
end
