class WelcomeController < ApplicationController
  layout "landing"

  def index
    @last_projects = last_projects
  end

  private

  def last_projects
    [
        {
            title: 'Практический семинар на тему " Особенности трудоустройста в Азербайджане и зарубежом."',
            img: "268x150.png"
        },
        {
            title: 'Müştəriyə yönləndirilmiş xidmətin göstərilməsi və çarpaz satışın əsasları',
            img: "268x150.png"
        },
        {
            title: 'Практический семинар на тему " Особенности трудоустройста в Азербайджане и зарубежом."',
            img: "268x150.png"
        }
    ]
  end
end
