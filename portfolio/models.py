import re

from django.db import models


class Profile(models.Model):
    """Single row holding everything about you. Edit it in /admin/."""
    name = models.CharField(max_length=100, default="Sibi Manikandan V",
                            help_text="Full name. With 3+ words the middle part is shown in gold")
    nickname = models.CharField(max_length=40, default="Sibi", blank=True,
                                help_text="Used in \"Hello, I'm ...!\" (defaults to first name)")
    headline = models.CharField(
        max_length=120, default="Data Analyst",
        help_text="Shown in the pill above your name, e.g. 'Data Analyst'")
    tagline = models.CharField(
        max_length=200, default="Transform raw data into actionable insights",
        help_text="One-line promise under your name")
    photo = models.ImageField(
        upload_to='profile/', blank=True,
        help_text="Shown in a circle in the title section. Square photo works best")
    intro = models.TextField(
        blank=True, help_text="Short summary (2-3 sentences) for the About section")
    about = models.TextField(
        blank=True, help_text="Longer 'About Me' text. Blank lines make paragraphs")
    cv = models.FileField(upload_to='cv/', blank=True,
                          help_text="Upload your CV as a PDF")
    email = models.EmailField(blank=True)
    phone = models.CharField(
        max_length=30, blank=True,
        help_text="With country code, e.g. +91 98765 43210 (used for the WhatsApp link)")
    location = models.CharField(max_length=100, blank=True)
    linkedin = models.URLField(blank=True)
    github = models.URLField(blank=True)
    naukri = models.URLField(blank=True, help_text="Naukri profile link")
    kaggle = models.URLField(blank=True)
    tableau = models.URLField(blank=True, help_text="Tableau Public profile")

    def save(self, *args, **kwargs):
        self.pk = 1  # only ever one profile
        super().save(*args, **kwargs)

    @property
    def short_name(self):
        return self.nickname or (self.name.split() or ["there"])[0]

    @property
    def name_lines(self):
        """[(text, highlighted)] used to colour part of the name gold."""
        words = self.name.split()
        if len(words) >= 3:
            return [(words[0], False), (" ".join(words[1:-1]), True), (words[-1], False)]
        if len(words) == 2:
            return [(words[0], False), (words[1], True)]
        return [(self.name, True)]

    @property
    def whatsapp_url(self):
        digits = re.sub(r'\D', '', self.phone)
        return f"https://wa.me/{digits}" if digits else ""

    def __str__(self):
        return self.name


class Experience(models.Model):
    EDUCATION = 'edu'
    WORK = 'work'
    CERT = 'cert'
    KIND_CHOICES = [
        (EDUCATION, 'Education'),
        (WORK, 'Experience'),
        (CERT, 'Course / Certification'),
    ]
    kind = models.CharField(max_length=4, choices=KIND_CHOICES, default=WORK)
    title = models.CharField(max_length=150, help_text="Role, degree or course name")
    organisation = models.CharField(max_length=150)
    logo = models.ImageField(upload_to='logos/', blank=True,
                             help_text="Company / school logo, shown in a circle")
    period = models.CharField(max_length=60, help_text="e.g. 2023 - Present")
    description = models.TextField(blank=True)
    order = models.PositiveIntegerField(default=0, help_text="Lower comes first")

    class Meta:
        ordering = ['order', '-id']

    def __str__(self):
        return f"{self.title} - {self.organisation}"


class Skill(models.Model):
    name = models.CharField(max_length=60)
    category = models.CharField(
        max_length=60,
        help_text="e.g. Programming Languages, Analytics Tools, "
                  "Visualization Tools, Analytic Methods")
    icon = models.ImageField(upload_to='skills/', blank=True,
                             help_text="Optional logo, shown in a circle")
    order = models.PositiveIntegerField(default=0)

    class Meta:
        ordering = ['order', 'id']

    def __str__(self):
        return self.name


class Project(models.Model):
    title = models.CharField(max_length=140)
    summary = models.CharField(max_length=240, help_text="One-line description")
    banner = models.ImageField(upload_to='projects/', blank=True,
                               help_text="Cover image (title slide)")
    image = models.ImageField(upload_to='projects/', blank=True,
                              help_text="Dashboard screenshot")
    problem = models.TextField(
        blank=True, help_text="The business question you set out to answer")
    description = models.TextField(
        blank=True, help_text="Your approach: data, cleaning, analysis steps")
    result = models.TextField(
        blank=True, help_text="Findings and recommendation. Add real numbers")
    tech = models.CharField(
        max_length=200, blank=True,
        help_text="Tools, comma separated: SQL, Python, Tableau")
    analysis = models.CharField(
        max_length=200, blank=True,
        help_text="Methods, comma separated: EDA, Cohort, A/B Testing")
    deck_url = models.URLField(blank=True, help_text="Slide deck / report")
    notebook_url = models.URLField(blank=True, help_text="Colab / Jupyter")
    dashboard_url = models.URLField(blank=True, help_text="Tableau / Looker / Power BI")
    live_url = models.URLField(blank=True)
    repo_url = models.URLField(blank=True, help_text="GitHub repository")
    year = models.PositiveIntegerField()
    order = models.PositiveIntegerField(default=0)

    class Meta:
        ordering = ['order', '-year']

    @staticmethod
    def _split(value):
        return [t.strip() for t in value.split(',') if t.strip()]

    def tech_list(self):
        return self._split(self.tech)

    def analysis_list(self):
        return self._split(self.analysis)

    def __str__(self):
        return self.title


class Message(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    body = models.TextField()
    sent = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-sent']

    def __str__(self):
        return f"{self.name} ({self.sent:%d %b %Y})"
