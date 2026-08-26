from django.contrib.auth.models import User
from django.db import models

# Create your models here

class college(models.Model):
    name = models.CharField(max_length=300)
    email = models.CharField(max_length=300)
    phone = models.CharField(max_length=300)
    place = models.CharField(max_length=300)
    post = models.CharField(max_length=300)
    pin = models.CharField(max_length=300)
    status = models.CharField(max_length=300)
    pic = models.CharField(max_length=300)
    latitude = models.CharField(max_length=300)
    longitude = models.CharField(max_length=300)
    proof = models.CharField(max_length=300)
    LOGIN = models.ForeignKey(User,on_delete=models.CASCADE,default=1)

class course(models.Model):
    title = models.CharField(max_length=300)
    description = models.CharField(max_length=300)

class subject(models.Model):
    name = models.CharField(max_length=300)
    description = models.CharField(max_length=300)
    semester = models.CharField(max_length=300)
    code = models.CharField(max_length=300)
    credit= models.CharField(max_length=300)
    max_mark = models.CharField(max_length=300)
    COURSE = models.ForeignKey(course,on_delete=models.CASCADE)

class company(models.Model):
    name = models.CharField(max_length=300)
    email = models.CharField(max_length=300)
    phone = models.CharField(max_length=300)
    place = models.CharField(max_length=300)
    post = models.CharField(max_length=300)
    pin = models.CharField(max_length=300)
    status = models.CharField(max_length=300)
    bio = models.CharField(max_length=300)
    proof = models.CharField(max_length=300)
    LOGIN = models.ForeignKey(User,on_delete=models.CASCADE,default=1)


class offered_list(models.Model):
    COLLEGE = models.ForeignKey(college, on_delete=models.CASCADE)
    COURSE = models.ForeignKey(course, on_delete=models.CASCADE)


class student(models.Model):
    name = models.CharField(max_length=300)
    email = models.CharField(max_length=300)
    phone = models.CharField(max_length=300)
    place = models.CharField(max_length=300)
    post = models.CharField(max_length=300)
    pin = models.CharField(max_length=300)
    LOGIN = models.ForeignKey(User, on_delete=models.CASCADE, default=1)
    date_of_birth = models.CharField(max_length=300)
    joining_year = models.CharField(max_length=300)
    roll_number = models.CharField(max_length=300)
    image = models.CharField(max_length=300, default="")
    OFFERED_LIST = models.ForeignKey(offered_list, on_delete=models.CASCADE)

class complaints(models.Model):
    complaint = models.CharField(max_length=300)
    c_date = models.CharField(max_length=300)
    replay = models.CharField(max_length=300)
    r_date = models.CharField(max_length=300)
    STUDENT = models.ForeignKey(student, on_delete=models.CASCADE)


class vacancy(models.Model):
    COMPANY = models.ForeignKey(company, on_delete=models.CASCADE)
    jobname = models.CharField(max_length=300)
    qualification = models.CharField(max_length=300)
    skills = models.CharField(max_length=300)
    experience = models.CharField(max_length=300)
    apply_form = models.CharField(max_length=300)
    apply_to = models.CharField(max_length=300)


class applications(models.Model):
    VACANCY = models.ForeignKey(vacancy, on_delete=models.CASCADE)
    STUDENT = models.ForeignKey(student, on_delete=models.CASCADE)
    apply_to = models.CharField(max_length=300)
    date = models.CharField(max_length=300)
    interview_date = models.CharField(max_length=300)
    status = models.CharField(max_length=300)



class mark(models.Model):
    STUDENT = models.ForeignKey(student, on_delete=models.CASCADE)
    SUBJECT = models.ForeignKey(subject, on_delete=models.CASCADE)
    internal_mark= models.CharField(max_length=300)
    external_mark = models.CharField(max_length=300)
    result = models.CharField(max_length=300)
    total = models.CharField(max_length=300)
    grade_point = models.CharField(max_length=300)
    grade = models.CharField(max_length=300)
    credit_point = models.CharField(max_length=300)
    public_status = models.CharField(max_length=300)


class certificate(models.Model):
    STUDENT = models.ForeignKey(student, on_delete=models.CASCADE)
    semester = models.CharField(max_length=300)
    issue_date = models.CharField(max_length=300)
    file = models.CharField(max_length=300)
    qrcode = models.CharField(max_length=300)





