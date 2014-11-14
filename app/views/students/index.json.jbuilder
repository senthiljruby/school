json.array!(@students) do |student|
  json.extract! student, :id, :name, :father_name, :phone_number, :email, :address
  json.url student_url(student, format: :json)
end
