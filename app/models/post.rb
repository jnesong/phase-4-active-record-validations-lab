class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate :sufficiently_clickbaity?

    def sufficiently_clickbaity?
        if [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i].none? {|pattern| pattern.match title}
            errors.add(:title, "error: must be clickbait")
        end
    end
end
