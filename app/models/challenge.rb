class Challenge < ApplicationRecord
  # Use UUID as primary key
  self.primary_key = 'id'
  
  # Associations
  belongs_to :user
  
  # Active Storage attachments (quando disponível)
  # has_one_attached :musicxml_file
  # has_one_attached :pdf_file
  
  # Validations
  validates :title, presence: true
  validates :category, presence: true, inclusion: { 
    in: %w[escala acorde arpejo ritmo melodia harmonia tecnica] 
  }
  validates :difficulty, presence: true, inclusion: { 
    in: %w[iniciante intermediario avancado] 
  }
  
  # Scopes
  scope :by_category, ->(category) { where(category: category) }
  scope :by_difficulty, ->(difficulty) { where(difficulty: difficulty) }
  scope :recent, -> { order(created_at: :desc) }
  
  # Instance methods
  def category_humanized
    {
      'escala' => 'Escala',
      'acorde' => 'Acorde', 
      'arpejo' => 'Arpejo',
      'ritmo' => 'Ritmo',
      'melodia' => 'Melodia',
      'harmonia' => 'Harmonia',
      'tecnica' => 'Técnica'
    }[category] || category.humanize
  end
  
  def difficulty_humanized
    {
      'iniciante' => 'Iniciante',
      'intermediario' => 'Intermediário',
      'avancado' => 'Avançado'
    }[difficulty] || difficulty.humanize
  end
end