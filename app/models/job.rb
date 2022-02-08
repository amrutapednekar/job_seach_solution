class Job < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :languages, presence: true
    before_validation :clean_empty_array_languages
    has_many :user_applied_jobs

    private
    # Checks for emepty array in languages
    def clean_empty_array_languages
      self.languages = languages.presence
    end

    # Searches for a record in jobs table where 
    # search query is in title 
    # or is in languages
    def self.search(search)
      if search
        search_array = "#{search}".split(',')
        where("lower(title) like ?", "%#{search.downcase}%").or(where("languages @> ARRAY[?]::varchar[]", search_array))
      else
        all
      end
    end
end
