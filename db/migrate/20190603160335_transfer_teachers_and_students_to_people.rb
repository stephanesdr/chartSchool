# frozen_string_literal: true

class TransferTeachersAndStudentsToPeople < ActiveRecord::Migration[5.2]
  def change
    GeneralQuestion.all.each { |question| question.update(attendee: nil) }
    GeneralQuestionVote.all.each { |vote| vote.update(attendee: nil) }
    Attendance.all.each { |atd| atd.update(attendee: nil) }
    Course.all.each { |course| course.update(creator: nil) }
    # StepPerson.all.each { |stp| StepPerson.delete(stp) }
    # GroupPerson.all.each { |grp| GroupPerson.delete(grp) }
    puts "Junction Tables forgot person :'( "

    Person.all.each do |person|
      StepPerson.where(attendee_id: person.id).each { |stp| StepPerson.delete(stp) }
      GroupPerson.where(attendee_id: person.id).each { |grp| GroupPerson.delete(grp) }
      Person.destroy(person.id)
    end

    puts "Clear whole person_table : done"

    ActiveRecord::Base.connection.reset_pk_sequence!('people')
    puts "Reinitialisation of PK for person_table : done"

    Teacher.all.each do |teacher|
      person = Person.create(name: teacher.name, email: teacher.email, created_at: teacher.created_at, confirmed_at: teacher.confirmed_at )
      pw = teacher.encrypted_password
      person.update_attribute(:encrypted_password, pw)
    end
    puts "teacher_table is now copied inside person_table"

    Student.all.each do |student|
      person = Person.create(name: student.name, email: student.email, created_at: student.created_at, confirmed_at: student.confirmed_at)
      pw = student.encrypted_password
      person.update_attribute(:encrypted_password, pw)
    end
    puts "student_table is now copied inside person_table"

    Attendance.where.not(student_id: nil).each { |atd| atd.update( attendee_id: Person.find_by(email: Student.find(atd.student_id).email ).id ) }
    puts "attendance_table is now adjusted with person_table"

    GeneralQuestion.where.not(student_id: nil).each { |question| question.update( attendee_id: Person.find_by(email: Student.find(question.student_id).email ).id ) }
    puts "general_question_table is now adjusted with person_table"

    GeneralQuestionVote.where.not(student_id: nil).each { |question_vote| question_vote.update( attendee_id: Person.find_by(email: Student.find(question_vote.student_id).email ).id ) }
    puts "general_question_vote_table is now adjusted with person_table"

    StepStudent.where.not(student_id: nil).each { |step_student| StepPerson.create(attendee_id: Person.find_by(email: Student.find(step_student.student_id).email ).id, step_id: step_student.step_id ) }
    puts "StepPerson_table is now created with person_table"

    GroupStudent.where.not(student_id: nil).each { |group_student| GroupPerson.create(attendee_id: Person.find_by(email: Student.find(group_student.student_id).email ).id, group_id: group_student.group_id ) }
    puts "StepPerson_table is now created with person_table"

    Course.where.not(teacher_id: nil).each do |course|
      course.creator_id = course.teacher.id
      course.save(validate: false)
    end
    puts "course_table is now adjusted with person_table"
  end
end
