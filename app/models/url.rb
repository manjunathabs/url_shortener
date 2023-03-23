class Url < ApplicationRecord
  validates :original, presence: true, format: URI::regexp(%w[http https])
  validates :short, presence: true, uniqueness: true

  def self.generate_short_url
    loop do
      short = SecureRandom.hex(3)
      return short unless Url.exists?(short: short)
    end
  end
end
