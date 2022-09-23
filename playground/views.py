from django.core.mail import EmailMessage, BadHeaderError
from django.shortcuts import render
from templated_mail.mail import BaseEmailMessage


def say_hello(request):
    try:
        message = BaseEmailMessage(
            template_name = 'emails/hello.html',
            context={'name': 'Ambrose'}
        )
        message.attach_file('playground/static/images/camera.png')
        message.send(['ambrose@hello.com'])
    except BadHeaderError:
        pass
    return render(request, 'hello.html', {'name': 'Mosh'})
