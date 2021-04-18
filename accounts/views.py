# External Import
from django.shortcuts import render, redirect
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth import update_session_auth_hash
from django.shortcuts import render, redirect, HttpResponse
from django.contrib.auth import views as auth_views
from django.contrib import messages

# Internal Import
from . import forms

# For Email Verification
from .signals import user_logged_in
from django.utils.http import is_safe_url
from .token_generator import account_activation_token
from django.core.mail import EmailMessage
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_text
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.contrib.auth import get_user_model
from django.contrib.auth import authenticate, login


User = get_user_model()


class LoginView(auth_views.LoginView):
    form_class = forms.LoginForm
    template_name = 'accounts/login.html'


def resend_verification(request):
    form = forms.SendEmailVerificationForm(request.POST or None)
    if request.method == 'POST':
        if form.is_valid():
            email = form.cleaned_data['email']
            user = User.objects.filter(email=email)
            if user:
                user = user.first()
                current_site = get_current_site(request)
                email_subject = 'Activate Your Account'
                message = render_to_string('accounts/activate_account.html', {
                    'user': user,
                    'domain': current_site.domain,
                    'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                    'token': account_activation_token.make_token(user),
                })
                to_email = form.cleaned_data.get('email')
                email = EmailMessage(email_subject, message, to=[to_email])
                email.send()
                messages.success(
                    request, f'We have sent you an email, please confirm your email address to complete registration')
                return redirect('login')
            else:
                messages.error(
                    request, f'The Account with that Email doesn\'t Exist')
    return render(request, 'accounts/resend_verification.html', {'form': form})


def register(request):
    form = forms.UserRegistrationForm(request.POST or None)
    if request.user.is_authenticated:
        return redirect('home:home-page')
    if request.method == 'POST':
        if form.is_valid():
            user = form.save(commit=False)
            user.is_active = False
            user.save()
            current_site = get_current_site(request)
            email_subject = 'Activate Your Account'
            message = render_to_string('accounts/activate_account.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': account_activation_token.make_token(user),
            })
            to_email = form.cleaned_data.get('email')
            email = EmailMessage(email_subject, message, to=[to_email])
            email.send()
            messages.success(
                request, f'We have sent you an email, please confirm your email address to complete registration')
            return redirect('login')
    return render(request, 'accounts/register.html', {'form': form})


def activate_account(request, uidb64, token, backend='accounts.backends.EmailBackend'):
    try:
        uid = force_bytes(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except(TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None
    if user is not None and account_activation_token.check_token(user, token):
        user.is_active = True
        user.save()
        login(request, user, backend='accounts.backends.EmailBackend')
        messages.success(
            request, f'Your account has been activated successfully')
        return redirect('home:home-page')
    else:
        return HttpResponse('Activation link is invalid!')


def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)  # Important!
            messages.success(
                request, 'Your password was successfully updated!')
            return redirect('home:home-page')
        else:
            messages.error(request, 'Please correct the error')
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'accounts/change_password.html', {
        'form': form
    })
