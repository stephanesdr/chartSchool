# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

teacher1 = Teacher.create(name: "teacher1", email: "teacher1@email.com", password: "password")
student1 = Student.create(name: "student1", email: "student1@email.com", password: "password")

course1 = Course.new(title: "course1")
course1.teacher = teacher1
course1.save
question1 = GeneralQuestion.new(title: "title1", description: "description1")
question1.course = course1
question1.student = student1
question1.save
