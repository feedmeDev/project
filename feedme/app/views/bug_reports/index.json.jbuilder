json.array!(@bug_reports) do |bug_report|
  json.extract! bug_report, :id, :platform, :report
  json.url bug_report_url(bug_report, format: :json)
end
