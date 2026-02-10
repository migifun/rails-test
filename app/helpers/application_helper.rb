module ApplicationHelper
  PURPOSE_LABELS = {
    "meeting" => "打ち合わせ",
    "interview" => "面接",
    "delivery" => "配達",
    "other" => "その他"
  }.freeze

  def purpose_label(purpose)
    PURPOSE_LABELS[purpose] || purpose
  end
end
