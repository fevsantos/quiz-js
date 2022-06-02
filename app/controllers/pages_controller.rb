class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :test ]
  # before_action :check_signed_in

  def check_signed_in
    redirect_to questionnaires_path if signed_in?
  end

  def home
  end

  def test
    @questionnaire = Questionnaire.find(17)
    @questions = []
    @options = []
    @resposta = []
    @questionnaire.questions.each do |q|
      @questions << q.name
    end
    @questionnaire.questions.each do |q|
      q.answers.each do |a|
        @options << a.name
      end
    end
    @questionnaire.questions.each do |q|
      q.answers.each do |a|
        if a.correct == true
          @resposta << a.name
        end
      end
    end
    @n = @questions.length
    @numeros = (0..100).to_a
    @loop = @numeros[0...@n]
    @o = @options.length
    @loop2 = @numeros[0...@o]
    a = []
    @loop2.each do |n|
      instance_variable_set "@op#{n}".to_sym, @options[n]
    end

    @questionsr = []
    @loop.each do |n|
      @questionsr << {
        numb: n + 1,
        question: @questions[n],
        answer: @resposta[n],
        options: [
          instance_variable_get("@op#{n * 4}"),
          instance_variable_get("@op#{(n * 4) + 1}"),
          instance_variable_get("@op#{(n * 4) + 2}"),
          instance_variable_get("@op#{(n * 4) + 3}")
      ]
    }
    end
  end
end
