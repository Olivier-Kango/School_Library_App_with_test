require_relative '../student'

describe Student do
  context 'Detail of a new student is given' do
    before :each do
      @student = Student.new(15, 'B', 'Harry', true)
    end

    it 'Admit a new student' do
      expect(@student).to be_instance_of Student
    end

    it 'Check whether the age given matches or not' do
      expect(@student.age).to eq 15
    end

    it 'Check whether the classroom given matches or not' do
      expect(@student.classroom).to eq 'B'
    end

    it 'Check whether the name given matches or not' do
      expect(@student.name).to eq 'Harry'
    end

    it 'Check whether the play_hooky given matches or not' do
      expect(@student.play_hooky).to eq '¯\(ツ)/¯'
    end
  end
end
