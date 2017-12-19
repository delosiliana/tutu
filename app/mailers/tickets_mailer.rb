class TicketsMailer < ApplicationMailer

  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вы только что купили билет')
  end

  def return_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Вы вернули билет')
  end
end
