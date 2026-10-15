from django import template

register = template.Library()


@register.filter
def firstword(value):
    return str(value).split(' ', 1)[0]


@register.filter
def restwords(value):
    parts = str(value).split(' ', 1)
    return parts[1] if len(parts) > 1 else ''


@register.filter
def initial(value):
    return str(value).strip()[:1].upper()
