"""Fill the folio with clearly-labelled PLACEHOLDER content so you can see the
layout straight away. Replace everything in /admin/ with your own details.

Usage:  python manage.py seed_demo
"""
from django.core.management.base import BaseCommand

from portfolio.models import Experience, Profile, Project, Skill


class Command(BaseCommand):
    help = "Create placeholder data for the data-analyst portfolio"

    def handle(self, *args, **options):
        if Profile.objects.exists() or Project.objects.exists():
            self.stdout.write(self.style.WARNING(
                "Data already exists - nothing seeded (to avoid overwriting your content)."))
            return

        Profile.objects.create(
            name="Sibi Manikandan V",
            nickname="Sibi",
            headline="Data Analyst",
            tagline="I help people find insights through data",
            intro="[Placeholder] Data analyst skilled in SQL, Python, Excel and "
                  "dashboarding, turning raw data into clear, actionable insight.",
            about="[Placeholder] Write who you are, what drew you to data, the "
                  "kinds of problems you enjoy, and the role you are looking for.\n\n"
                  "Mention your strengths: data cleaning, EDA, statistics, "
                  "storytelling with dashboards, and communicating with stakeholders.",
            email="you@example.com",
        )

        skills = {
            "Programming Languages": ["SQL", "Python"],
            "Analytics Tools": ["Microsoft Excel", "Google Sheets", "Google BigQuery",
                                "VS Code / Jupyter"],
            "Visualization Tools": ["Tableau", "Power BI", "Looker Studio"],
            "Analytic Methods": ["EDA", "Segmentation / Clustering", "Cohort Analysis",
                                 "Linear / Logistic Regression", "A/B Testing", "ANOVA / T-Test"],
        }
        n = 0
        for cat, names in skills.items():
            for name in names:
                Skill.objects.create(name=name, category=cat, order=n)
                n += 1

        Experience.objects.create(
            kind=Experience.WORK, title="[Your role]", organisation="[Company / internship]",
            period="2024 - Present", order=0,
            description="[Placeholder] One or two lines on what you analysed and the outcome.")
        Experience.objects.create(
            kind=Experience.EDUCATION, title="[Your degree]", organisation="[University]",
            period="20XX", order=0)
        Experience.objects.create(
            kind=Experience.CERT, title="[Data analytics course / certificate]",
            organisation="[Provider]", period="2025", order=0)

        ideas = [
            ("Pricing Optimisation with Regression", "Linear regression to evaluate and improve a pricing model.",
             "SQL, Python, Tableau", "EDA, Linear Regression", 2026),
            ("Employee Attrition Prediction", "Logistic regression to predict attrition and plan retention actions.",
             "Python, Tableau", "EDA, Logistic Regression", 2026),
            ("Marketing Campaign A/B Test", "ANOVA and post-hoc t-tests to pick the most profitable campaign.",
             "Excel / Google Sheets", "Statistics, A/B Testing", 2026),
            ("Cohort Analysis and RFM Segmentation", "Customer segments and retention cohorts for an e-commerce shop.",
             "SQL (BigQuery), Python, Looker Studio", "RFM, Cohort Analysis", 2026),
        ]
        for i, (t, s, tech, ana, yr) in enumerate(ideas):
            Project.objects.create(
                title=t, summary=s, tech=tech, analysis=ana, year=yr, order=i,
                problem="[Placeholder] What business question were you answering?",
                description="[Placeholder] Dataset used, cleaning steps, analysis method.",
                result="[Placeholder] State your real finding with numbers, e.g. "
                       "'Segment X had 2x the repeat rate; recommend targeting them.'")

        self.stdout.write(self.style.SUCCESS(
            "Placeholder data created. Now open /admin/ and replace it with your own."))
