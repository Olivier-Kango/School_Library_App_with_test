require './student'
require './teacher'
require 'json'

module PeopleData
  def list_of_people
    read_people_data
  end

  def student_or_teacher
    print 'Are you a student (s) or teacher (t) ? [Put s/t for you]: '
    input = gets.chomp.downcase

    case input
    when 's'
      create_student
    when 't'
      create_teacher
    else
      puts 'You are not a valid member'
    end
  end

  def create_student
    print 'Name of the student: '
    name = gets.chomp

    print 'Age of the student: '
    age = gets.chomp.to_i

    print 'Do you have Parent permission? [Y/N]:'
    parent_permission = gets.chomp.upcase
    case parent_permission
    when 'Y' then parent_permission = true
    when 'N' then parent_permission = false
    end

    print 'In which Classroom do you belong? '
    classroom = gets.chomp
    student = Student.new(age, classroom, name, parent_permission)

    @people << student
    save_people_data(student)
    puts 'Data for Student is entered successfully!!!'
  end

  def create_teacher
    print 'Name of the Teacher: '
    name = gets.chomp

    print 'Age of the Teacher: '
    age = gets.chomp.to_i

    print 'Specialization of the Teacher: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name, true)

    @people << teacher
    save_people_data(teacher)
    puts 'Data for Teacher is entered successfully!!!'
  end

  def save_people_data(_person)
    data = []

    @people.each do |person|
      data << { type: person.class, name: person.name, id: person.id, age: person.age }
    end

    File.write('people.json', data.to_json)
  end

  def read_people_data
    if File.exist?('people.json')
      people = File.read('people.json')

      if people == ''
        puts 'You need to Add people first !!!'
      else
        people_data = JSON.parse(people)
        people_data.each do |sot|
          puts "[#{sot['type']}] Name: #{sot['name']}, ID: #{sot['id']}, Age: #{sot['age']}"
        end
      end
    else
      puts 'No Students or Teachers are not available in Database'
    end
  end
end
