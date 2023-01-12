require_relative '../teacher'

describe Teacher do
  context 'Detail of a new teacher is given' do
    before :each do
      @teacher = Teacher.new(52, 'CS', 'Roger', true)
    end

    it 'Welcome a new Teacher' do
      expect(@teacher).to be_instance_of Teacher
    end

    it 'Check whether the age given matches or not' do
      expect(@teacher.age).to eq 52
    end

    it 'Check whether the name given matches or not' do
      expect(@teacher.name).to eq 'Roger'
    end

    it 'Check whether the specialization given matches or not' do
      expect(@teacher.specialization).to eq 'CS'
    end

    it 'Check whether the can use the services or not' do
      expect(@teacher.can_use_services?).to eq true
    end
  end
end
