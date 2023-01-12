require_relative '../student'
require_relative '../classroom'

describe Classroom do
  context 'Put a classroom' do
    before :each do
      @classroom = Classroom.new('class')
    end

    it 'allots a new classroom' do
      expect(@classroom).to be_instance_of Classroom
    end

    it 'allocate a new student into a class' do
      student = Student.new(18, 'A', 'Olivier', true)
      classroom = @classroom.add_student(student)
      expect(classroom.label).to eq 'class'
    end
  end
end
