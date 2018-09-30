class TournamentMailer < ApplicationMailer

  def create_team_leader(user)
    mail(to: user.email, subject: 'Votre team vient d\'être créée')
  end

  def add_team_member(team, leader, user)
  	mail(to: user.email, subject: "Le capitaine #{leader.name} vient de vous rajouter à l'équipe #{team.name}")
  end
end
