class CalendarsController < ApplicationController

  # １週間のカレンダーと予定が表示されるページ
  def index
    get_week
    @plan = Plan.new
  end

  # 予定の保存
  def create
    Plan.create(plan_params)
    redirect_to action: :index
  end

  private

  def plan_params
    params.require(:plan).permit(:date, :plan)
  end

  def get_week
    wdays = ['日','月','火','水','木','金','土'] # 曜日の文字列配列
    
    @todays_date = Date.today
<<<<<<< Updated upstream
=======
    # 例)　今日が2月1日の場合・・・ Date.today.day => 1日
>>>>>>> Stashed changes
    @week_days = []
  
    plans = Plan.where(date: @todays_date..@todays_date + 6)
  
    7.times do |x|
      today_plans = []
      plans.each do |plan|
        today_plans.push(plan.plan) if plan.date == @todays_date + x
      end
<<<<<<< Updated upstream
      # 曜日の文字列を取得し、日付と一緒に表示する
      day_of_week = wdays[(@todays_date + x).wday]
      days = { :month => (@todays_date + x).month, :date => (@todays_date+x).day, :day_of_week => day_of_week, :plans => today_plans }
=======
      day_of_week = wdays[(@todays_date + x).wday]
      days = { :month => (@todays_date + x).month, :date => (@todays_date+x).day,:day_of_week => day_of_week, :plans => today_plans}
>>>>>>> Stashed changes
      @week_days.push(days)
    end
  end
end
