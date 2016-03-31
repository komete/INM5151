json.array!(@works) do |work|
  json.extract! work, :id, :type, :description, :debut, :fin, :intervenant
  json.url work_url(work, format: :json)
end
