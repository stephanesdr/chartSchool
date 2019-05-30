# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#-----------------TRANSFER TEACHER AND STUDENT TABLES TO USER TABLE-------------------------

GeneralQuestion.all.each { |question| question.update(attendee: nil) }
GeneralQuestionVote.all.each { |vote| vote.update(attendee: nil) }
Attendance.all.each { |atd| atd.update(attendee: nil) }
Course.all.each { |course| course.update(creator: nil) }
StepPerson.all.each { |stp| StepPerson.delete(stp) }
GroupPerson.all.each { |grp| GroupPerson.delete(grp) }
puts "Junction Tables forgot person :'( "

Person.all.each { |person| Person.destroy(person.id) }

puts "Clear whole person_table : done"

ActiveRecord::Base.connection.reset_pk_sequence!('people')
puts "Reinitialisation of PK for person_table : done"

Teacher.all.each { |teacher| Person.create(name: teacher.name, email: teacher.email, password: teacher.encrypted_password, created_at: teacher.created_at, confirmed_at: teacher.confirmed_at ) }
puts "teacher_table is now copied inside person_table"

Student.all.each { |student| Person.create(name: student.name, email: student.email, password: student.encrypted_password, created_at: student.created_at, confirmed_at: student.confirmed_at) }
puts "student_table is now copied inside person_table"

Attendance.all.each { |atd| atd.update( attendee_id: Person.find_by(email: Student.find(atd.student_id).email ).id ) }
puts "attendance_table is now adjusted with person_table"

GeneralQuestion.all.each  { |question| question.update( attendee_id: Person.find_by(email: Student.find(question.student_id).email ).id ) }
puts "general_question_table is now adjusted with person_table"

GeneralQuestionVote.all.each { |question_vote| question_vote.update( attendee_id: Person.find_by(email: Student.find(question_vote.student_id).email ).id ) }
puts "general_question_vote_table is now adjusted with person_table"

StepStudent.all.each { |step_student| StepPerson.create(attendee_id: Person.find_by(email: Student.find(step_student.student_id).email ).id, step_id: step_student.step_id ) }
puts "StepPerson_table is now created with person_table"

GroupStudent.all.each { |group_student| GroupPerson.create(attendee_id: Person.find_by(email: Student.find(group_student.student_id).email ).id, group_id: group_student.group_id ) }
puts "StepPerson_table is now created with person_table"

Course.all.each do |course|
  course.creator_id = course.teacher.id
  course.save(validate: false)
end
puts "course_table is now adjusted with person_table"

# ____________________** DEVELOPEMENT SEEDS DB V 2.0 **____________________

# unless Person.find_by(email: "teacher@yopmail.com")
#   Person.create!(
#     name: "teacher",
#     email: "teacher@yopmail.com",
#     password: "000000",
#     confirmed_at: Time.zone.now
#   )
# end
#
#

# random_people = Person.create!(
#   name: "Person",
#   email: "person@yopmail.com",
#   password: "000000",
#   confirmed_at: Time.zone.now
# )
# p "*** Usable random user is now created with \ email: person@yopmail.com \ password : 000000 "

# 1.upto(10) do |i|
#   name = Faker::Name.unique.name
#   Person.create!(
#     name: name,
#     email: Faker::Internet.free_email("#{name}#{rand(1..1000)}"),
#     password: Faker::Internet.password,
#     confirmed_at: Time.zone.now
#   )
#   p "Person #{i} : créé"
# end


# 1.upto(50) do |i|
#   Course.create!(
#     title: Faker::Educator.course_name,
#     resource: Faker::Lorem.sentence,
#     description: Faker::Marketing.buzzwords,
#     start_time: Faker::Date.forward(23),
#     end_time: Faker::Date.forward(24),
#     creator_id: Person.all.sample.id,
#   )
#   p "Course #{i} : créé"
# end

# 1.upto(20) do |i|
#   courseid = Course.all.sample.id
#   unless Attendance.find_by(course_id: courseid, attendee_id: random_people.id)
#     Attendance.create!(
#       attendee_id: random_people.id,
#       course_id: courseid
#     )
#   end
#   p " * Attendance for random people  #{i} : créé"
# end

#
# 1.upto(100) do |i|
#   Step.create!(
#     title: Faker::Appliance.equipment,
#     description: "#{Faker::Marketing.buzzwords}!",
#     teacher_check: false,
#     course_id: Course.all.sample.id,
#   )
#   p "Step #{i} : créé"
# end

# 1.upto(20) do |i|
#   Group.create!(
#     name: Faker::Science.scientist,
#   )
#   p "Group #{i} : créé"
# end

# 1.upto(200) do |i|
#   GeneralQuestion.create!(
#     title: "#{Faker::Books::Lovecraft.sentence}  : #{Faker::Bank.name}?",
#     description: Faker::Movies::Lebowski.quote,
#     attendee_id: Person.all.sample.id,
#     course_id: Course.all.sample.id,
#     teacher_check: false,
#   )
#   p "GeneralQuestion #{i} : créé"
# end

# # __________JUNCTION TABLE SEEDS DB V 2.0______________

# 1.upto(50) do |i|
#   courseid = Course.all.sample.id
#   attendeeid = Person.all.sample.id
#   unless Attendance.find_by(course_id: courseid, attendee_id: attendeeid)
#     Attendance.create!(
#       attendee_id: attendeeid,
#       course_id: courseid
#     )
#   end
#   p "Attendance #{i} : créé"
# end

# 1.upto(100) do |i|
#   GroupPerson.create!(
#     attendee_id: Person.all.sample.id,
#     group_id: Group.all.sample.id
#   )
#   p "GroupPerson #{i} : créé"
# end

# 1.upto(500) do |i|
#   stepid = Step.all.sample.id
#   personid = Person.all.sample.id
#   unless StepPerson.find_by(step_id: stepid, attendee_id: personid)
#     StepPerson.create!(
#       step_id: stepid,
#      attendee_id: personid
#     )
#   end
#   p "ChekStep #{i} : créé"
# end

# 1.upto(100) do |i|
#   GeneralQuestionVote.create!(
#     general_question_id: GeneralQuestion.all.sample.id,
#     attendee_id: Person.all.sample.id
#   )
#   p "Vote #{i} : créé"
# end

###############################################################################

# ____________________** DEVELOPEMENT SEEDS DB V 1.0 **____________________

# unless Teacher.find_by(email: "teacher@yopmail.com")
#   Teacher.create!(
#     name: "teacher",
#     email: "teacher@yopmail.com",
#     password: "000000",
#     confirmed_at: Time.zone.now
#   )
# end

# unless Student.find_by(email: "student@yopmail.com")
#   Student.create!(
#     name: "student",
#     email: "student@yopmail.com",
#     password: "000000",
#     confirmed_at: Time.zone.now
#   )
# end

# 1.upto(10) do |i|
#   name = Faker::Name.unique.name
#   Teacher.create!(
#     name: name,
#     email: Faker::Internet.free_email("#{name}#{rand(1..1000)}"),
#     password: Faker::Internet.password,
#     confirmed_at: Time.zone.now
#   )
#   p "Teacher #{i} : créé"
# end

# 1.upto(10) do |i|
#   name = Faker::Name.unique.name
#   Student.create!(
#     name: name,
#     email: Faker::Internet.free_email("#{name}#{rand(1..1000)}"),
#     password: Faker::Internet.password,
#     confirmed_at: Time.zone.now
#   )
#   p "Student #{i} : créé"
# end

# 1.upto(50) do |i|
#   Course.create!(
#     title: Faker::Educator.course_name,
#     resource: Faker::Lorem.sentence,
#     description: Faker::Marketing.buzzwords,
#     start_time: Faker::Date.forward(23),
#     end_time: Faker::Date.forward(24),
#     teacher_id: Teacher.all.sample.id,
#   )
#   p "Course #{i} : créé"
# end

# 1.upto(100) do |i|
#   Step.create!(
#     title: Faker::Appliance.equipment,
#     description: "#{Faker::Marketing.buzzwords}!",
#     teacher_check: false,
#     course_id: Course.all.sample.id,
#   )
#   p "Step #{i} : créé"
# end

# 1.upto(20) do |i|
#   Group.create!(
#     name: Faker::Science.scientist,
#   )
#   p "Group #{i} : créé"
# end

# 1.upto(200) do |i|
#   GeneralQuestion.create!(
#     title: "#{Faker::Books::Lovecraft.sentence}  : #{Faker::Bank.name}?",
#     description: Faker::Movies::Lebowski.quote,
#     student_id: Student.all.sample.id,
#     course_id: Course.all.sample.id,
#     teacher_check: false,
#   )
#   p "GeneralQuestion #{i} : créé"
# end

# # __________JUNCTION TABLE SEEDS______________

# 1.upto(10) do |i|
#   courseid = Course.all.sample.id
#   studentid = Student.all.sample.id
#   unless Attendance.find_by(course_id: courseid, student_id: studentid)
#     Attendance.create!(
#       student_id: studentid,
#       course_id: courseid
#     )
#   end
#   p "Attendance #{i} : créé"
# end

# 1.upto(50) do |i|
#   courseid = Course.all.sample.id
#   attendeeid = Person.all.sample.id
#   unless Attendance.find_by(course_id: courseid, attendee_id: attendeeid)
#     Attendance.create!(
#       attendee_id: attendeeid,
#       course_id: courseid
#     )
#   end
#   p "Attendance #{i} : créé"
# end

# 1.upto(100) do |i|
#   GroupStudent.create!(
#     student_id: Student.all.sample.id,
#     group_id: Group.all.sample.id
#   )
#   p "GroupStudent #{i} : créé"
# end

# 1.upto(100) do |i|
#   GroupTeacher.create!(
#     group_id: Group.all.sample.id,
#     teacher_id: Teacher.all.sample.id
#   )
#   p "GroupTeacher #{i} : créé"
# end

# 1.upto(500) do |i|
#   stepid = Step.all.sample.id
#   studentid = Student.all.sample.id
#   unless StepStudent.find_by(step_id: stepid, student_id: studentid)
#     StepStudent.create!(
#       step_id: stepid,
#       student_id: studentid
#     )
#   end
#   p "ChekStep #{i} : créé"
# end

# 1.upto(100) do |i|
#   GeneralQuestionVote.create!(
#     general_question_id: GeneralQuestion.all.sample.id,
#     student_id: Student.all.sample.id
#   )
#   p "Vote #{i} : créé"
# end
