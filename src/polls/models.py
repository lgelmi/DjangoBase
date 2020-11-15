import datetime

from django.db import models
from django.utils import timezone


class Question(models.Model):
    question_text = models.CharField("Body of the question.", max_length=200)
    pub_date = models.DateTimeField("Date the question is published.")

    def __str__(self):
        return self.question_text

    def was_published_recently(self):
        # noinspection PyTypeChecker
        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField("Body of the choice.", max_length=200)
    votes = models.IntegerField("Number of votes the choice got.", default=0)

    def __str__(self):
        return self.choice_text
