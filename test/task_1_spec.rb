require 'rspec'

require_relative '../task_1'

describe 'TEST task 1' do
  context 'calculation' do
    x = [-3, -2, -1, 0, 1, 2, 3, 4]
    a = 1
    b = 2
    c = 3
    y = [-20, -1, 6, 7, 4.0/3, 8.0/3, 4, 16.0/3]

    x.each_index { |i|
      it "should return #{y[i]} when x = #{x[i]}" do
        real_answer = f(x[i], a, b, c)
        expect(real_answer).to eq(y[i])
      end
    }
  end

  context 'rounding' do
    a = [1, 0, 2/33, 3.48, 0.4]
    b = [0.2, 2, 0.5, -3, 0.45]
    c = [3, 0.3, 0.4, -7, 0.5]
    expected_answer = [true, false, false, true, false]

    expected_answer.each_index { |i|
      it "should_F_be_double should return #{expected_answer[i]} when a = #{a[i]}, b = #{b[i]}, c = #{c[i]}" do
        real_answer = should_F_be_double(a[i], b[i], c[i])
        #p real_answer
        expect(real_answer).to eq(expected_answer[i])
      end
    }
  end

  context 'rounding F' do
    x = [-3, -2, -1, 0, 1, 2, 3, 4]
    a = 0.1
    b = 2
    c = 0.3
    y = [1, 3, 4, 4, 13, 26, 40, 53]

    x.each_index { |i|
      it "should return #{y[i]} when x = #{x[i]}" do
        real_answer = F(x[i], a, b, c)
        expect(real_answer).to eq(y[i])
      end
    }
  end
end