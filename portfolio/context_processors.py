from .models import Profile


def profile(request):
    """Makes `profile` available in every template.

    Falls back to an unsaved default Profile so the site still renders
    before you have filled in the admin.
    """
    return {'profile': Profile.objects.first() or Profile()}
