require "net/http"
require "json"

class SlackNotifier
  def self.notify(reception)
    webhook_url = ENV["SLACK_WEBHOOK_URL"]
    return unless webhook_url.present?

    uri = URI.parse(webhook_url)
    payload = {
      text: "📢 新しい来客があります\n" \
            "名前: #{reception.name}\n" \
            "会社名: #{reception.company}\n" \
            "用件: #{reception.purpose}\n" \
            "時刻: #{reception.created_at.strftime('%Y-%m-%d %H:%M')}"
    }

    Net::HTTP.post(uri, payload.to_json, "Content-Type" => "application/json")
  rescue StandardError => e
    Rails.logger.error("Slack notification failed: #{e.message}")
  end
end
