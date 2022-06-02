class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :test ]
  # before_action :check_signed_in

  def check_signed_in
    redirect_to questionnaires_path if signed_in?
  end

  def home
  end

  def test
    @questionnaire = Questionnaire.find(16)
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
    @numeros = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,32,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49]
    @loop = @numeros[0..@n]
    @o = @options.length
    @loop2 = @numeros[0..@o]
    @loop2.each do |n|
      instance_variable_set "@op#{n}".to_sym, @options[n]
    end
    # @primeira_opção = @options[0]
    # @segunda_opção = @options[1]
    # @terceira_opção = @options[2]
    # @quarta_opção = @options[3]
    # @quinta_opção = @options[4]
    # @sexta_opção = @options[5]

  end
end
