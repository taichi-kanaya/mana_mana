class PublicCategoryCgController < ApplicationController
  def index
    @categories = Category.where("id = ? and all_share_flg = 1", params[:category_id]).first
    if @categories.blank? then
      raise
    end

    @questions = Question.where(category_id: params[:category_id]).order("id")
    @questionCount = @questions.length
    session[:question] = []
    @questions.load.each do |record|
      session[:question] << record.id
    end
    session[:questionCount] = 1
    @count = session[:questionCount]

    questionRecord = choiseQuestion
    @question = questionRecord.question
    @answer = questionRecord.answer
  end

  def getQuestion
    if session[:question].blank? then
      return {}
    else
      session[:questionCount] = session[:questionCount].to_i + 1
      questionRecord = choiseQuestion
      jsonQuestion = {'count' => session[:questionCount], 'question' => questionRecord.question, 'answer' => questionRecord.answer}
      render :json => jsonQuestion
    end
  end

  private

  def choiseQuestion
    chosenQuestionId = session[:question].shift
    return Question.select("question, answer").where("id = ?", chosenQuestionId).first
  end
end
