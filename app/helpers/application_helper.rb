module ApplicationHelper
    def format_name(user)
        if user
            "Olá #{user.email.split('@', -1)[0]} !"
        else
            "Inicie sua sessão ou efetue o cadastro!"
        end
    end
end
