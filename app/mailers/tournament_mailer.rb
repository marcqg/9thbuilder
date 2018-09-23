class TournamentMailer < ApplicationMailer

  def create_team_leader(user)
    mail(to: user.email, subject: 'Votre team vient d\'être créée')
  end
end
