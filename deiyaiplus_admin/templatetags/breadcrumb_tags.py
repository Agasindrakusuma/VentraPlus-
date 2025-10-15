from django import template
from django.utils.text import capfirst
from urllib.parse import unquote

register = template.Library()

@register.simple_tag(takes_context=True)
def breadcrumb(context):
    request = context['request']
    path = unquote(request.path)
    segments = [seg for seg in path.strip('/').split('/') if seg]

    if not segments:
        return 'Dashboard'

    last_segment = segments[-1].replace('-', ' ')
    return capfirst(last_segment)
