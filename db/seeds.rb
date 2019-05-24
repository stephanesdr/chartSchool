# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# unless Teacher.find_by(email: "teacher@yopmail.com")
#   Teacher.create!(
#     name: "teacher",
#     email: "teacher@yopmail.com",
#     password: "000000",
#     confirmed_at: Time.zone.now
#   )
# end
#
# unless Student.find_by(email: "student@yopmail.com")
#   Student.create!(
#     name: "student",
#     email: "student@yopmail.com",
#     password: "000000",
#     confirmed_at: Time.zone.now
#   )
# end
#
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
#
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
#
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
#
# 1.upto(20) do |i|
#   Group.create!(
#     name: Faker::Science.scientist,
#   )
#   p "Group #{i} : créé"
# end
#
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
#
# # __________JUNCTION TABLE SEEDS______________
#
# 1.upto(100) do |i|
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
#
# 1.upto(100) do |i|
#   GroupStudent.create!(
#     student_id: Student.all.sample.id,
#     group_id: Group.all.sample.id
#   )
#   p "GroupStudent #{i} : créé"
# end
#
# 1.upto(100) do |i|
#   GroupTeacher.create!(
#     group_id: Group.all.sample.id,
#     teacher_id: Teacher.all.sample.id
#   )
#   p "GroupTeacher #{i} : créé"
# end
#
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
#
# 1.upto(100) do |i|
#   GeneralQuestionVote.create!(
#     general_question_id: GeneralQuestion.all.sample.id,
#     student_id: Student.all.sample.id
#   )
#   p "Vote #{i} : créé"
# end
