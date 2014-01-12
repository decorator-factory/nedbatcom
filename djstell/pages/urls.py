from django.conf.urls import patterns, url
from django.views.generic.base import TemplateView

PLANET_PYTHON_TAGS = [
    'python', 'pycon', 'math', 'proglang', 'ruby', 'js',
    'coverage', 'cog', 'mycode',
    'browsers', 'charset', 'coding', 'compsci', 'concurrency',
    'db', 'debugging', 'devmindset', 'development', 'django', 'ide',
    'exceptions', 'feeds', 'geeky', 'regex', 'security', 'srcctrl',
    'testing', 'webpage',
    'windows', 'mac', 'unix',
    ]

urlpatterns = patterns('djstell.pages.views',
    url(r'^index.html$', 'index'),
    url(r'^blog/index.html$', 'blogmain'),
    url(r'^blog/(?P<year>\d\d\d\d)(?P<month>\d\d).html$', 'month'),
    url(r'^blog/(?P<year>\d\d\d\d)(?P<month>\d\d)/(?P<slug>[^/]+).html$', 'entry'),

    url(r'^blog/tags.html$', 'tags'),
    url(r'^blog/tag/none.html$', 'untagged'),
    url(r'^blog/tag/(?P<slug>.*).html$', 'tag'),

    url(r'^blog/archive(?P<year>\d\d\d\d).html$', 'archiveyear'),
    url(r'^blog/archiveall.html$', 'archiveall'),

    url(r'^blog/rss.xml$', 'blog_rss'),
    url(r'^blog/planetpython.xml$', 'tags_rss', {'tags': PLANET_PYTHON_TAGS}),
    url(r'^blog/moved.php$', 'blog_moved_php'),

    url(r'^(?P<path>(text|code|site)/.*)$', 'article'),
    url(r'^(?P<path>err404.html)$', 'article'),

    url(r'^sidebar_(?P<which>\w+).inc$', 'sidebar'),
    )

urlpatterns += patterns('',
    url(r'^tabblo_badge_(?P<tabblos>\w+).html$', TemplateView.as_view(template_name='tabblo_badge.html')),
    )
