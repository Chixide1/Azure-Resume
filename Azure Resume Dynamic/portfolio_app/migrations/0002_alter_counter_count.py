# Generated by Django 5.0.1 on 2024-03-07 20:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('portfolio_app', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='counter',
            name='count',
            field=models.IntegerField(default=0),
        ),
    ]