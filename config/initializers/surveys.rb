require 'active_support'
require 'rapidfire'

Rails.application.config.to_prepare do

  Rapidfire::QuestionGroup.class_eval do
    has_and_belongs_to_many :surveys, :join_table => "surveys_question_groups", :foreign_key => "rapidfire_question_group_id"
  end

  Rapidfire::ApplicationController.class_eval do
    layout 'surveys'
  end

  Rapidfire::AnswerGroupsController.class_eval do
    def new
      @answer_group_builder = Rapidfire::AnswerGroupBuilder.new(answer_group_params)
      @intro_slide = @question_group.intro_slide? ? @question_group.intro_slide.html_safe : nil
      @final_slide = @question_group.final_slide? ? @question_group.final_slide.html_safe : nil
    end
  end
end