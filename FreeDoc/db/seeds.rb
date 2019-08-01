
require 'faker'


Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all



10.times do
	array_specialty = ["Dermatologue","Urologue","Dentiste","Ophtamologue","Generaliste","Pediatre"].sample
	city = City.create(name: Faker::Address.city)
	doctor = Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city_id: city.id)
	patient = Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: city.id)
	rdv = Appointment.create(date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30, format: :long), doctor_id: doctor.id, patient_id: patient.id, city_id: city.id)
	specialty = Specialty.create(name: array_specialty)
	lien = JoinTableDoctorSpecialty.create(specialty_id: specialty.id, doctor_id: doctor.id)
end