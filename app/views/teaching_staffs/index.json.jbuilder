json.array!(@teaching_staffs) do |teaching_staff|
  json.extract! teaching_staff, :id, :full_name, :father_name, :date_of_joining, :date_of_birth, :married, :spouse_name, :aniversary_date, :qualification, :role
  json.url teaching_staff_url(teaching_staff, format: :json)
end
