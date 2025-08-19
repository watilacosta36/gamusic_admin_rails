class Challenge < ApplicationRecord
  self.primary_key = "id"

  belongs_to :user

  has_one_attached :musicxml_file
  has_one_attached :pdf_file

  validates :title, presence: true
  validates :category, presence: true, inclusion: { 
    in: %w[escala acorde arpejo ritmo melodia harmonia tecnica] 
  }
  validates :difficulty, presence: true, inclusion: { 
    in: %w[iniciante intermediario avancado] 
  }

  scope :by_category, ->(category) { where(category: category) }
  scope :by_difficulty, ->(difficulty) { where(difficulty: difficulty) }
  scope :recent, -> { order(created_at: :desc) }

  def category_humanized
    {
      "escala" => "Escala",
      "acorde" => "Acorde", 
      "arpejo" => "Arpejo",
      "ritmo" => "Ritmo",
      "melodia" => "Melodia",
      "harmonia" => "Harmonia",
      "tecnica" => "Técnica"
    }[category] || category.humanize
  end

  def difficulty_humanized
    {
      "iniciante" => "Iniciante",
      "intermediario" => "Intermediário",
      "avancado" => "Avançado"
    }[difficulty] || difficulty.humanize
  end
end
