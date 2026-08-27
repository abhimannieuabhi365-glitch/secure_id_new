import datetime
import email
import os
import random
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.hashers import check_password, make_password
from django.contrib.auth.models import User, Group
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

# from APP.face_check import check_face
from APP.face_check import check_face
from .models import *

# Create your views here.
def loginn(request):
    return render(request, 'LOGIN.html')


def loginn_post(request):
    uname = request.POST['textfield']
    passw = request.POST['textfield2']
    data = authenticate(request, username=uname, password=passw)
    if data is not None:
        login(request, data)
        if data.is_superuser:
            return redirect('/admin_home')
        if data.groups.filter(name='college').exists():
            request.session['cid'] = college.objects.get(LOGIN=request.user.id).id
            return redirect('/college_home')
        return HttpResponse("<script>alert('Unauthorized User');window.location='/'</script>")
    return HttpResponse("<script>alert('Invalid User');window.location='/'</script>")

@login_required(login_url='/')
def change_password_admin(request):
    return render(request, 'ADMIN/CHANGE PASSWORD.html')


def change_password_admin_post(request):
    old = request.POST['textfield']
    new = request.POST['textfield2']
    confirm = request.POST['textfield3']
    data = check_password(old, request.user.password)
    if data:
        if new == confirm:
            obj = request.user
            obj.set_password(new)
            obj.save()
            return HttpResponse("<script>alert('Password Changed');window.location='/'</script>")
        return HttpResponse("<script>alert('Password Must Be Equal');window.location='/change_password_admin'</script>")
    return HttpResponse("<script>alert('Invalid');window.location='/change_password_admin'</script>")


def admin_home(request):
    return render(request, 'ADMIN/adminhome.html')

@login_required(login_url='/')
def add_course(request):
    return render(request, 'ADMIN/ADD COURSE.html')


def add_course_post(request):
    tit = request.POST['textfield']
    dis = request.POST['textarea']
    if course.objects.filter(title=tit).exists():
        return HttpResponse("<script>alert('Already added');window.location='/add_course'</script>")

    obj = course()
    obj.title = tit
    obj.description = dis
    obj.save()
    return HttpResponse("<script>alert('course added');window.location='/admin_home'</script>")
    # return HttpResponse("added")

@login_required(login_url='/')
def manage_course(request):
    data = course.objects.all()
    return render(request, 'ADMIN/MANAGE COURSE.html', {'data': data})


def edit_course(request, id):
    data = course.objects.get(id=id)
    return render(request, 'ADMIN/EDIT COURSE.html', {'data': data})


def edit_course_post(request, id):
    tit = request.POST['textfield']
    dis = request.POST['textarea']
    course.objects.filter(id=id).update(title=tit, description=dis)
    return HttpResponse("<script>alert('course edited');window.location='/manage_course'</script>")


def delete_course(request, id):
    course.objects.get(id=id).delete()
    return HttpResponse("<script>alert('course deleted');window.location='/manage_course'</script>")


def add_subject(request, id):
    return render(request, 'ADMIN/ADD SUBJECT.html', {'id': id})


def add_subject_post(request, id):
    n = request.POST['textfield']
    des = request.POST['textarea']
    sem = request.POST['semester']
    cod = request.POST['code']
    cred = request.POST['credit']
    max = request.POST['max_mark']
    if subject.objects.filter(name=n,COURSE_id=id).exists():
        return HttpResponse("<script>alert('Already added');window.location='/admin_home'</script>")
    obj = subject()
    obj.name = n
    obj.description = des
    obj.semester = sem
    obj.code = cod
    obj.credit = cred
    obj.max_mark = max
    obj.COURSE_id = id
    obj.save()
    return HttpResponse("<script>alert('subject added');window.location='/admin_home'</script>")


def view_subject(request,id):
    data = subject.objects.filter(COURSE_id=id)
    return render(request, 'ADMIN/manage_subject.html', {'data': data})


def edit_subject(request, id):
    data = subject.objects.get(id=id)
    return render(request, 'ADMIN/EDIT SUBJECT.html', {'data': data})


def edit_subject_post(request, id):
    n = request.POST['textfield']
    des = request.POST['textarea']
    sem = request.POST['semester']
    cod = request.POST['code']
    cred = request.POST['credit']
    max = request.POST['max_mark']
    subject.objects.filter(id=id).update(name=n, description=des, semester=sem, code=cod, credit=cred, max_mark=max)
    return HttpResponse("<script>alert('subject edited');window.location='/manage_course'</script>")


def delete_subject(request, id):
    subject.objects.get(id=id).delete()
    return HttpResponse("<script>alert('subject deleted');window.location='/manage_course'</script>")


@login_required(login_url='/')
def verify_college(request):
    data = college.objects.filter(status="pending")
    return render(request, 'ADMIN/VERIFY COLLEGES.html', {'data': data})


def accept_college(request, id):
    college.objects.filter(id=id).update(status='college')
    return HttpResponse("<script>alert('Approved');window.location='/verify_college'</script>")


def reject_college(request, id):
    college.objects.filter(id=id).update(status='reject')
    return HttpResponse("<script>alert('Rejected');window.location='/verify_college'</script>")

@login_required(login_url='/')
def approved_colleges(request):
    data = college.objects.filter(status='college')
    return render(request, 'ADMIN/APPROVED COLLEGES.html', {'data': data})

@login_required(login_url='/')
def verify_company(request):
    data = company.objects.filter(status = 'pending')
    return render(request, 'admin/verify_company.html', {'data':data})

def accept_company(request,id):
    company.objects.filter(id = id).update(status = 'company')
    return HttpResponse("<script>alert(' Accepted');window.location='/verify_company'</script>")


def reject_company(request,id):
    company.objects.filter(id = id).update(status = 'rejected')
    return HttpResponse("<script>alert(' Rejected');window.location='/verify_company'</script>")


@login_required(login_url='/')
def view_approved_company(request):
    data = company.objects.filter(status = 'company')
    return render(request,'admin/view_appfoved_company.html',{'data':data})


from django.db.models import Q
from .models import student, mark, subject


def check_student_pass_status(student_id):
    """
    Check if a student has passed all subjects.
    Returns "yes" if pass in all subjects, "no" if fail in at least one subject.

    Parameters:
    student_id (int): The ID of the student to check

    Returns:
    str: "yes" if passed all subjects, "no" otherwise
    """

    try:
        # Get the student object
        student_obj = student.objects.get(id=student_id)

        # Get all marks for this student
        student_marks = mark.objects.filter(STUDENT=student_obj)

        # If student has no marks recorded, return "no"
        if not student_marks.exists():
            return "no"

        # Check each subject's total marks
        for mark_obj in student_marks:
            # Convert total to integer (handle empty strings or None)
            try:
                total_mark = int(mark_obj.total) if mark_obj.total else 0
            except (ValueError, TypeError):
                total_mark = 0

            # If any subject has less than 40 marks, student fails
            if total_mark < 40:
                return "no"

        # If we reach here, all subjects have >= 40 marks
        return "yes"

    except student.DoesNotExist:
        # Student doesn't exist
        return "no"
    except Exception as e:
        # Handle any other exceptions
        print(f"Error checking student pass status: {e}")
        return "no"



# Simple version with database query optimization:
def is_student_pass_all_subjects(student_id):
    """
    Optimized version using database query to check for any failed subjects.
    Returns "yes" if all passed, "no" if any failed or error.
    """

    try:
        # Get the student
        student_obj = student.objects.get(id=student_id)
        print(student_id, student_obj.name)

        # Check if there are any subjects where total < 40
        # This is more efficient as it stops at first failure found
        failed_subjects=False
        mark_obj=mark.objects.filter(STUDENT=student_obj)
        for kk in mark_obj:
            if kk.total=='':
                failed_subjects=True
            elif kk.total == "pending":
                failed_subjects=True
            elif int(kk.total) < 40:
                failed_subjects=True

        print(failed_subjects)

        # If no failed subjects found, check if student has any marks at all
        has_marks = mark.objects.filter(STUDENT=student_obj).exists()

        if not has_marks:
            return "no"  # No marks recorded

        return "no" if failed_subjects else "yes"

    except student.DoesNotExist:
        return "no"
    except Exception as e:
        print(f"Error: {e}")
        return "no"



def view_student(request, id):
    data = student.objects.filter(OFFERED_LIST__COLLEGE_id=id)
    data2=offered_list.objects.filter(COURSE_id=id)
    return render(request, 'admin/view_student.html', {'data':data, "data2":data2, "id":id})

def view_student_post(request, id):
    cid=request.POST['select']
    data = student.objects.filter(OFFERED_LIST__COLLEGE_id=id, OFFERED_LIST__COURSE_id=cid)
    data2=offered_list.objects.filter(COURSE_id=id)
    return render(request, 'admin/view_student.html', {'data':data, "data2":data2, "id":id})



def view_internals(request,id):
    data = mark.objects.filter(STUDENT=id)
    request.session['mid'] = id
    stat = is_student_pass_all_subjects(id)
    print("Stat", stat)
    return render(request,'admin/view_internal_mark.html',{'data':data, "stat":stat, "id":id})


def add_external_mark(request, id):
    sid=request.session['mid']
    mrk=mark.objects.get(id=id)
    STUDENT=student.objects.get(id=sid)
    SUBJECT=subject.objects.get(id=mrk.SUBJECT_id)
    mx_mrk=SUBJECT.max_mark
    SUBJECT.max_mark=int(mx_mrk)-20
    return render(request, 'admin/add_external_mark.html', {'id': id, "STUDENT":STUDENT, "SUBJECT":SUBJECT})


def add_external_mark_post(request,id):
    external_mark = request.POST['external_mark']
    mrk=mark.objects.get(id=id)
    intern=mrk.internal_mark
    tot=int(external_mark)+int(intern)
    gp=""
    grd=""
    if tot>90 and tot<=100:
        gp=10
        grd="A1"
    elif tot>80 and tot<=90:
        gp=9
        grd="A2"
    elif tot>70 and tot<=80:
        gp=8
        grd="B1"
    elif tot>60 and tot<=70:
        gp=7
        grd="B2"
    elif tot>50 and tot<=60:
        gp=6
        grd="C1"
    elif tot>40 and tot<=50:
        gp=5
        grd="C2"
    elif tot>32 and tot<=40:
        gp=4
        grd="D"
    else:
        gp="Fail"
        grd="E"

    mark.objects.filter(id = id).update(external_mark = external_mark, total=tot, grade_point=gp, grade=grd)
    return HttpResponse(f"<script>alert('Mark added');window.location='/view_internals/{request.session['mid']}'</script>")

def publish_result(request,id):

    mark1 = mark.objects.get(id=id)
    if mark1.external_mark == "pending":
        return HttpResponse(f"<script>alert('External mark not added');window.location='/view_internals/{request.session['mid']}'</script>")


    internal = int(mark1.internal_mark)
    external = int(mark1.external_mark)
    total = internal + external
    mark1.total = total

    max = int(mark1.SUBJECT.max_mark)
    percentage = (total / max) * 100
    if percentage >= 90:
        mark1.grade = "A+"
    elif percentage >= 80:
        mark1.grade = "A"
    elif percentage >= 70:
        mark1.grade = "B+"
    elif percentage >= 60:
        mark1.grade = "B"
    elif percentage >= 50:
        mark1.grade = "C+"
    elif percentage >= 40:
        mark1.grade = "C"
    else:
        mark1.grade = "Fail"

    gp = (total/max)*10
    print(gp)
    mark.grade_point = gp

    cr = int(mark1.SUBJECT.credit)
    cp = cr*gp
    print(cp)
    mark1.credit_point = round(cp, 3)

    extern = (external/max)*100
    tot = (total/max)*100
    print("Exter", extern)
    print("Tot", tot)

    if int(extern) > 40 and int(tot) > 40:
        mark1.result = "Pass"
    else:
        mark1.result = "Fail"

    mark1.publish_status = "Published"
    mark1.save()

    # return HttpResponse("<script>alert('');window.location='/admin_home'</script>")
    return HttpResponse(f"<script>alert('Result Published');window.location='/view_internals/{request.session['mid']}'</script>")



@login_required(login_url='/')
def view_complaint_from_student(request):
    data = complaints.objects.all()
    return render(request,'admin/view_complaint_from_student.html',{'data':data})

def reply_to_student(request,id):
    return render(request,'admin/reply_to_student.html',{'id':id})

def reply_to_student_post(request,id):
    reply = request.POST['reply']
    complaints.objects.filter(id = id).update(replay = reply ,r_date =datetime.datetime.now().date() )
    return HttpResponse("<script>alert('Replied');window.location='/view_complaint_from_student'</script>")






######################################## COLLEGE MODULE ##################################



def college_home(request):
    return render(request, 'COLLEGE/collegehome.html')


def college_register(request):
    return render(request, 'COLLEGE/REGISTER.html')


def college_register_post(request):
    name = request.POST['name']
    email = request.POST['email']
    phone = request.POST['phone']
    place = request.POST['place']
    post = request.POST['post']
    pin = request.POST['pin']
    pic = request.FILES['pic']
    fs = FileSystemStorage()
    pic = fs.save(pic.name, pic)
    proof = request.FILES['proof']
    proof = fs.save(proof.name, proof)
    latitude = request.POST['latitude']
    longitude = request.POST['longitude']
    password = request.POST['password']
    confirmpass = request.POST['cpassword']
    z = User.objects.filter(username=email)
    if z.exists():
        return HttpResponse("<script>alert('Email Exist');window.location='/college_register'</script>")
    if college.objects.filter(phone=phone).exists():
        return HttpResponse("<script>alert('Phone Exist');window.location='/college_register'</script>")

    if password == confirmpass:
        obj1 = User()
        obj1.username = email
        obj1.password = make_password(password)
        obj1.save()

        obj1.groups.add(Group.objects.get(name='college'))

        obj = college()
        obj.name = name
        obj.email = email
        obj.phone = phone
        obj.place = place
        obj.post = post
        obj.pin = pin
        obj.status = "pending"
        obj.latitude = latitude
        obj.longitude = longitude
        obj.pic = fs.url(pic)
        obj.proof = fs.url(proof)
        obj.LOGIN_id = obj1.id
        obj.save()
        return HttpResponse("<script>alert('Registered Successfully');window.location='/'</script>")
    return HttpResponse("<script>alert('password Must Be Equal');window.location='/college_register'</script>")


def collegehome(request):
    return render(request, 'COLLEGE/collegehome.html')

@login_required(login_url='/')
def view_course_college(request):
    data = course.objects.all()
    return render(request, 'college/view_course_college.html', {'data':data})


@login_required(login_url='/')
def view_college(request):
    data = college.objects.filter(id=request.session['cid'])
    return render(request, 'COLLEGE/view_college.html', {'data': data})


# def edit_college(request):
#     name = request.POST['textfield2']
#     email = request.POST['textfield3']
#     phone = request.POST['textfield4']
#     place = request.POST['textfield5']
#     post = request.POST['textfield6']
#     pin = request.POST['textfield7']
#     pic = request.FILES['fileField']
#     if 'fileField' in request.FILES:
#         fs = FileSystemStorage()
#         pic = fs.save(pic.name, pic)
#         college.objects.filter(id=id).update(pic =fs.url(pic))
#     proof = request.FILES['fileField2']
#     if 'fileField2' in request.FILES:
#         fss = FileSystemStorage()
#         proo = fss.save(proof.name, proof)
#         college.objects.filter(id=id).update(proof=fss.url(proo))
#     latitude = request.POST['textfield8']
#     longitude = request.POST['textfield9']
#     college.objects.filter(id=request.session['cid']).update(name=name, email=email, phone=phone, place=place,
#                                                              post=post, pin=pin,latitude=latitude, longitude=longitude)
#     return HttpResponse("<script>alert('edited Successfully');window.location='/view_college'</script>")
#

# def view_course(request):
#     data = course.objects.all()
#     return render(request, 'COLLEGE/view_course.html', {'data': data})


def add_to_offered_list(request, id):
    obj = offered_list()
    obj.COLLEGE_id = request.session['cid']
    obj.COURSE_id = id
    obj.save()
    return HttpResponse("<script>alert('Added ');window.location='/view_course_college'</script>")


@login_required(login_url='/')
def view_own_course(request):
    data = offered_list.objects.filter(COLLEGE_id=request.session['cid'])
    return render(request, 'COLLEGE/view_own_course.html', {'data': data})


def add_student(request, id):
    return render(request, 'college/ADD_STUDENT.html', {'id': id})


def add_student_post(request, id):
    NAME = request.POST['name']
    EMAIL = request.POST['email']
    PHONE = request.POST['phone']
    PLACE = request.POST['place']
    POST = request.POST['post']
    PIN = request.POST['pin']
    DATE_OF_BIRTH = request.POST['dob']
    JOINING_YEAR = request.POST['joining_year']
    ROLL_NUMBER = request.POST['roll_number']
    password = str(random.randint(1000, 9999))
    print(password, )
    if student.objects.filter(roll_number=ROLL_NUMBER).exists():
        return HttpResponse("<script>alert('Roll number already exist');window.location='/add_student/"+id+"'</script>")
    if student.objects.filter(phone=PHONE).exists():
        return HttpResponse("<script>alert('Phone number already exist');window.location='/add_student/" + id + "'</script>")
    if User.objects.filter(username=EMAIL).exists():
        return HttpResponse("<script>alert('Email already exist');window.location='/view_own_course'</script>")
    else:
        img=request.FILES['file']
        dt=datetime.datetime.now().strftime("%Y%m%d_%H%M%S")+".jpg"
        fs=FileSystemStorage()
        fs.save(r"C:\Users\abhim\PycharmProjects\secure_id_new\media\\"+dt, img)
        obj1 = User()
        obj1.username = EMAIL
        obj1.password = make_password(password)
        obj1.save()
        obj1.groups.add(Group.objects.get(name='student'))

        try:
            sender_email = os.getenv('EMAIL_HOST_USER')
            app_password = os.getenv('EMAIL_HOST_PASSWORD')

            server = smtplib.SMTP("smtp.gmail.com", 587)
            server.starttls()
            server.login(sender_email, app_password)

            msg = MIMEMultipart("alternative")
            msg["From"] = sender_email
            msg["To"] = EMAIL
            msg["Subject"] = "🎓 Student Login Credentials"

            html = f"""
                    <html>
                    <body style="font-family:Arial; background:#f4f6f8; padding:20px;">
                        <div style="max-width:600px; background:white; padding:30px; border-radius:10px;">
                            <h2 style="color:#4f46e5;">Welcome to Secure ID</h2>
                            <p>Your student account has been created.</p>
                            <p><strong>Email:</strong> {EMAIL}</p>
                            <p><strong>Password:</strong> {password}</p>
                            <p>Please login and change your password.</p>
                            <p style="font-size:12px;color:#777;">© {datetime.date.today()} Secure ID</p>
                        </div>
                    </body>
                    </html>
                    """

            msg.attach(MIMEText(html, "html"))
            server.send_message(msg)
            server.quit()

        except Exception as e:
            print("Email error:", e)


        obj = student()
        obj.name = NAME
        obj.email = EMAIL
        obj.phone = PHONE
        obj.place = PLACE
        obj.post = POST
        obj.pin = PIN
        obj.date_of_birth = DATE_OF_BIRTH
        obj.joining_year = JOINING_YEAR
        obj.roll_number = ROLL_NUMBER
        obj.LOGIN_id = obj1.id
        obj.OFFERED_LIST_id = id
        obj.image="/media/"+dt
        obj.save()
        return HttpResponse("<script>alert('student added');window.location='/view_student_college'</script>")


def view_student_college(request):
    data = student.objects.filter(OFFERED_LIST__COLLEGE=request.session['cid'])
    return render(request, 'COLLEGE/view_student_college.html', {'data': data})


def edit_student(request, id):
    data = student.objects.get(id=id)
    return render(request, 'college/edit_student.html', {'data': data})


def edit_student_post(request, id):
    NAME = request.POST['textfield']
    PHONE = request.POST['textfield3']
    PLACE = request.POST['textfield4']
    POST = request.POST['textfield5']
    PIN = request.POST['textfield6']
    DATE_OF_BIRTH = request.POST['textfield7']
    JOINING_YEAR = request.POST['textfield8']
    student.objects.filter(id=id).update(name=NAME,  phone=PHONE, place=PLACE, post=POST, pin=PIN,
                                         date_of_birth=DATE_OF_BIRTH, joining_year=JOINING_YEAR,
                                         )
    if 'file' in request.FILES:
        img = request.FILES['file']
        dt = datetime.datetime.now().strftime("%Y%m%d_%H%M%S") + ".jpg"
        fs = FileSystemStorage()
        # fs.save(r"C:\Users\abhim\PycharmProjects\secure_id_new\media\\" + dt, img)
        path=fs.save(img.name,img)
        student.objects.filter(id=id).update(image=fs.url(path))
    return HttpResponse("<script>alert('edited');window.location='/view_student_college'</script>")


def delete_student(request, id):
    student.objects.get(id=id).delete()
    return HttpResponse("<script>alert('student deleted');window.location='/view_student_college'</script>")


def add_internal_mark(request,id):
    # sub = subject.objects.all()
    # stud = student.objects.filter(OFFERED_LIST__COLLEGE=request.session['cid'])
    request.session['iid']=id
    cid=offered_list.objects.get(id=id).COURSE_id
    sub=subject.objects.filter(COURSE_id=cid)

    return render(request, 'COLLEGE/add_internal.html', {'sub': sub,'id':id})


@login_required(login_url='/')
def add_internal_mark_post(request):
    sub = request.POST['select']
    marks=request.POST.getlist('mark')
    studentid=request.POST.getlist('studentid')
    print(sub)
    print(marks)
    print(studentid)
    for i in range(0,len(studentid)):
        obj = mark()
        obj.STUDENT_id = studentid[i]
        obj.SUBJECT_id = sub
        obj.internal_mark = marks[i]
        obj.external_mark = "pending"
        obj.result = "pending"
        obj.total = "pending"
        obj.grade_point = "pending"
        obj.grade = "pending"
        obj.credit_point = "pending"
        obj.public_status = "pending"
        obj.save()
    return HttpResponse("<script>alert('mark collegehome');window.location='/view_internal_mark'</script>")


@login_required(login_url='/')
def view_internal_mark(request):
    data = mark.objects.filter(STUDENT__OFFERED_LIST__COLLEGE_id=request.session['cid'])
    return render(request, 'COLLEGE/INTERNAL_MARK.html', {'data': data})


def edit_internal_mark(request, id):
    data = mark.objects.get(id=id)
    return render(request, 'college/edit_internal.html', {'data': data})


def edit_internal_mark_post(request, id):
    marks = request.POST['textfield5']
    # if mark.objects.filter(internal_mark=mark).exists():
    #      return HttpResponse("<script>alert('already exist');window.location='/view_internal_mark'</script>")
    # else:
    mark.objects.filter(id=id).update(internal_mark=marks)
    return HttpResponse("<script>alert('mark edited');window.location='/view_internal_mark'</script>")


def delete_internal_mark(request, id):
    mark.objects.get(id=id).delete()
    return HttpResponse("<script>alert('mark deleted');window.location='/view_internal_mark'</script>")


@login_required(login_url='/')
def college_change_password_admin(request):
    return render(request, 'COLLEGE/CHANGE PASSWORD.html')


def college_change_password_admin_post(request):
    old = request.POST['textfield']
    new = request.POST['textfield2']
    confirm = request.POST['textfield3']
    data = check_password(old, request.user.password)
    if data:
        if new == confirm:
            obj = request.user
            obj.set_password(new)
            obj.save()
            logout(request)
            return HttpResponse("<script>alert('Password Changed');window.location='/loginn'</script>")
        return HttpResponse("<script>alert('Password Must Be Equal');window.location='/college_change_password_admin'</script>")
    return HttpResponse("<script>alert('Invalid');window.location='/college_change_password_admin'</script>")


def college_view_subject(request,id):
    data=subject.objects.filter(COURSE_id=id)
    return render(request,'COLLEGE/view_subject.html',{'data':data})

# @login_required(login_url='/')
# def view_result(request):
#     data=mark.objects.filter(STUDENT__OFFERED_LIST__COLLEGE_id=request.session['cid'])
#     return render(request,'COLLEGE/')
# ==========Companyy

def cmpny_register(request):
    nm = request.POST['name']
    em = request.POST['email']
    ph = request.POST['phone']
    pl = request.POST['place']
    po = request.POST['post']
    pi = request.POST['pin']
    bi = request.POST['bio']
    pr = request.FILES['file']
    fs = FileSystemStorage()
    pr = fs.save(pr.name, pr)
    pas = request.POST['password']
    rpas = request.POST['repassword']
    if company.objects.filter(email=em).exists():
        return JsonResponse({'status':'email'})

    if company.objects.filter(phone=ph).exists():
        return JsonResponse({'status':'phone'})

    auth_usr = User()
    auth_usr.username = em
    auth_usr.password = make_password(pas)
    auth_usr.save()
    auth_usr.groups.add(Group.objects.get(name='company'))

    obj = company()
    obj.name = nm
    obj.email = em
    obj.phone = ph
    obj.place = pl
    obj.post = po
    obj.pin = pi
    obj.status = 'pending'
    obj.bio = bi
    obj.proof = fs.url(pr)
    obj.password = pas
    obj.repassword = rpas
    obj.LOGIN = auth_usr
    obj.save()

    return JsonResponse({'status': 'ok'})


def cmpny_login(request):
    usern = request.POST['username']
    userpas = request.POST['password']
    data = authenticate(request, username=usern, password=userpas)
    print(data)
    if data is not None:
        login(request, data)

        if data.groups.filter(name='company').exists():
            cid = company.objects.get(LOGIN=request.user.id).id
            return JsonResponse({'status': 'ok', 'cid': str(cid),'type':'company'})
        if data.groups.filter(name='student').exists():
            sid = student.objects.get(LOGIN=request.user.id).id
            return JsonResponse({'status': 'ok', 'sid': str(sid),'type':'student'})
        return JsonResponse({'status':"invalid"})
    else:
      return JsonResponse({'status': 'not ok'})


def cmpny_add_vacancy(request):
    jobname = request.POST['jobname']
    qualification = request.POST['qualification']
    skills = request.POST['skills']
    experience = request.POST['experience']
    apply_form = request.POST['apply_form']
    apply_to = request.POST['apply_to']
    cid = request.POST['cid']
    obj = vacancy()
    obj.jobname = jobname
    obj.qualification = qualification
    obj.skills = skills
    obj.experience = experience
    obj.apply_form = apply_form
    obj.apply_to = apply_to
    obj.COMPANY_id = cid
    obj.save()

    return JsonResponse({'status': 'ok'})


def cmpny_view_vacancy(request):
    cid=request.POST['cid']
    data = vacancy.objects.filter(COMPANY_id=cid)
    ar = []
    for i in data:
        ar.append({'id': i.id, 'jobname': i.jobname, 'qualification': i.qualification, 'skills': i.skills,
                   'experience': i.experience, 'apply_form': i.apply_form, 'apply_to': i.apply_to, })
    return JsonResponse({'status': 'ok', 'data': ar})


def cmpny_edit_vacancy(request):
    jobname = request.POST['jobname']
    qualification = request.POST['qualification']
    skills = request.POST['skills']
    experience = request.POST['experience']
    apply_form = request.POST['apply_form']
    apply_to = request.POST['apply_to']
    id=request.POST['id']
    vacancy.objects.filter(id=id).update(jobname=jobname,qualification=qualification,skills=skills,
                                         experience=experience,apply_form=apply_form,apply_to=apply_to)
    return JsonResponse({'status': 'ok'})

def remove(request):
    id=request.POST['id']
    d=vacancy.objects.get(id=id)
    d.delete()
    return JsonResponse({'status': 'ok'})

def cmpny_view_application(request):
    vid=request.POST['vid']
    data = applications.objects.filter(status='pending',VACANCY_id=vid)
    ar = []
    for i in data:
        ar.append({
            'id': i.id,


            'jobname': i.VACANCY.jobname,
            'qualification': i.VACANCY.qualification,
            'skills': i.VACANCY.skills,
            'experience': i.VACANCY.experience,
            'apply_form': i.VACANCY.apply_form,

            'apply_to': i.apply_to,
            'date': i.date,
            'interview_date': i.interview_date,

        })
    return JsonResponse({"status": "ok", "message": ar})


def accept_application(request):
    id=request.POST['id']
    applications.objects.filter(id=id).update(status='approve')
    return JsonResponse({'status': 'ok'})

def reject_application(request):
    id=request.POST['id']
    applications.objects.filter(id=id).update(status='reject')
    return JsonResponse({'status': 'ok'})



def viewcandidate(request):
    cid = request.POST['cid']
    data = applications.objects.filter(status="approve",VACANCY__COMPANY_id=cid)
    ar = []
    for i in data:
        ar.append({
            'id': i.id,
            'Vacancy': i.VACANCY.jobname,
            'Candidate_Name': i.STUDENT.name,
            'Email': i.STUDENT.email,
            'Phone': i.STUDENT.phone,
            'Place':i.STUDENT.place,
            'post':i.STUDENT.post,
            'pin':i.STUDENT.pin,
            'date_of_birth':i.STUDENT.date_of_birth,
            'joining_year':i.STUDENT.joining_year,
            'roll':i.STUDENT.roll_number,
            'course':i.STUDENT.OFFERED_LIST.COURSE.title,
            'college_name':i.STUDENT.OFFERED_LIST.COLLEGE.name

        })
    return JsonResponse({"status": "ok", "message": ar})

def update_date(request):
    date=request.POST['date']
    applid=request.POST['applid']
    applications.objects.filter(id=applid).update(interview_date=date)
    return JsonResponse({'status': 'ok'})


def cmpny_change_password(request):
    newp = request.POST['newp']
    cid = request.POST['cid']
    data = company.objects.get(id=cid).LOGIN_id
    User.objects.filter(id=data).update(password=make_password(newp))
    return JsonResponse({'status': 'ok'})


# student--------------------------------------

def user_applyvaccy(request):
    vid=request.POST['id']
    sid=request.POST['sid']
    obj=applications()
    obj.VACANCY_id=vid
    obj.STUDENT_id=sid
    obj.status='pending'
    obj.date=datetime.date.today()
    obj.save()
    return JsonResponse({"status": "ok"})


def user_change_password(request):
    return JsonResponse({"status": "ok"})


def user_forgot_password(request):
    return JsonResponse({"status": "ok"})


def user_view_application_status(request):
    sid=request.POST['sid']
    data = applications.objects.filter(STUDENT_id=sid)
    ar = []
    for i in data:
        ar.append({
            'id': i.id,
            'compname':i.VACANCY.COMPANY.name,
            'jobname': i.VACANCY.jobname,
            'qualification': i.VACANCY.qualification,
            'skills': i.VACANCY.skills,
            'experience': i.VACANCY.experience,
            'apply_form': i.VACANCY.apply_form,

            'apply_to': i.apply_to,
            'date': i.date,
            'interview_date': i.interview_date,
            'status': i.status,

        })
    return JsonResponse({"status": "ok", "message": ar})


def user_view_certificate(request):
    sid=request.POST['sid']
    data = certificate.objects.filter(STUDENT_id=sid)
    ar = []
    for i in data:
        ar.append({
            'id': i.id,
            'semester': i.semester,
            'issue_date': i.issue_date,
            'file': i.file,
            'qrcode': i.qrcode,
        })
    return JsonResponse({"status": "ok",'message':ar})


def user_view_company(request):
    data = company.objects.filter()
    ar = []
    for i in data:
        ar.append({
            'id': i.id,
            'name': i.name,
            'email': i.email,
            'phone': i.phone,
            'place': i.place,
            'post': i.post,
            'pin': i.pin,
            'bio': i.bio,
            'proof': i.proof,

        })
    return JsonResponse({"status": "ok",'message':ar})


def user_view_complaint_reply(request):
    sid=request.POST['sid']
    data = complaints.objects.filter(STUDENT_id=sid)
    ar = []
    for i in data:
        ar.append({
            'id': i.id,
            'complaint': i.complaint,
            'c_date': i.c_date,
            'reply': i.replay,
            'r_date': i.r_date,

        })

    return JsonResponse({"status": "ok",'message':ar})


def user_marks(request):
    sid=request.POST['sid']
    subid=request.POST['subid']
    data = mark.objects.filter(STUDENT_id=sid,SUBJECT_id=subid)
    ar = []
    for i in data:
        ar.append({
            'id': i.id,
            'external_mark': i.external_mark,
            'internal_mark': i.internal_mark,
            'result': i.result,
            'total': i.result,
            'grade_point': i.grade_point,
            'grade': i.grade,
            'credit_point': i.credit_point,
            'public_status': i.public_status,

        })
    return JsonResponse({"status": "ok",'message':ar})



def user_view_subject(request):
    sid=request.POST['sid']
    cid=student.objects.get(id=sid).OFFERED_LIST.COURSE_id
    data=subject.objects.filter(COURSE_id=cid)
    # data = subject.objects.filter(id=subid)
    ar = []
    for i in data:
        ar.append({
            'id': i.id,
            'name': i.name,
            'semester': i.semester,
            'code': i.code,
            'credit': i.credit,
            'max_mark': i.max_mark,
            'title': i.COURSE.title,
            'description': i.description,
            'cdescription':i.COURSE.description

        })
    return JsonResponse({"status": "ok",'message':ar})


def user_view_vacancy(request):
    compid=request.POST['compid']
    print(compid)
    data = vacancy.objects.filter(COMPANY_id=compid)
    ar = []
    for i in data:
        ar.append({
            'id': i.id,
            'jobname': i.jobname,
            'qualification': i.qualification,
            'skills': i.skills,
            'experience': i.experience,
            'apply_form': i.apply_form,
            'to_date': i.apply_to,

        })
    print(ar)

    return JsonResponse({"status": "ok",'message':ar})


def user_view_profile(request):
    sid=request.POST['sid']
    print(sid)
    data = student.objects.filter(id=sid)
    ar = []
    for i in data:
        ar.append({
            'id': i.id,
            'name': i.name,
            'email': i.email,
            'phone': i.phone,
            'place': i.place,
            'post': i.post,
            'pin': i.pin,
            'date_of_birth': i.date_of_birth,
            'joining_year': i.joining_year,
            'roll_number': i.roll_number,
            'cname': i.OFFERED_LIST.COLLEGE.name,
            'title': i.OFFERED_LIST.COURSE.title,
            'description': i.OFFERED_LIST.COURSE.description,

        })

    return JsonResponse({"status": "ok",'message':ar})


def index(request):
    return render(request,'index.html')

def send_complaint(request):
    sid=request.POST['sid']
    print(sid)
    complaint = request.POST['complaint']

    obj=complaints()
    obj.complaint=complaint
    obj.c_date=datetime.datetime.now().date()
    obj.STUDENT_id=sid
    obj.replay='pending'
    obj.save()

    return JsonResponse({'status': 'ok'})

def studcmpny_change_password(request):
    newp = request.POST['newp']
    sid = request.POST['sid']
    data = student.objects.get(id=sid).LOGIN_id
    User.objects.filter(id=data).update(password=make_password(newp))
    return JsonResponse({'status': 'ok'})


def logout1(request):
    logout(request)
    return HttpResponse("<script>alert('logged out');window.location='/'</script>")




def forgotemail(request):
    import random
    import smtplib
    email = request.POST['email']
    print(email)
    data = User.objects.filter(username=email)
    print(data)
    if data.exists():
        otp = str(random.randint(100000, 999999))
        # *✨ Python Email Codeimport smtplib*

        from email.mime.text import MIMEText
        from email.mime.multipart import MIMEMultipart

        # ✅ Gmail credentials (use App Password, not real password)
        try:
            sender_email =  os.getenv('EMAIL_HOST_USER')
            receiver_email = email  # change to actual recipient
            app_password = os.getenv('EMAIL_HOST_PASSWORD')
            # Setup SMTP
            server = smtplib.SMTP("smtp.gmail.com", 587)
            server.starttls()
            server.login(sender_email, app_password)

            # Create the email
            msg = MIMEMultipart("alternative")
            msg["From"] = sender_email
            msg["To"] = receiver_email
            msg["Subject"] = "🔑 Forgot Password "

            # Plain text (backup)
            # text = f"""
            # Hello,

            # Your password for Smart Donation Website is: {pwd}

            # Please keep it safe and do not share it with anyone.
            # """

            # HTML (attractive)
            html = f"""
                <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Password Reset OTP</title>
                </head>
                <body style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
                            line-height: 1.6; color: #333; max-width: 600px; margin: 0 auto; padding: 20px;">

                    <div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); 
                                padding: 30px; text-align: center; border-radius: 10px 10px 0 0;">
                        <h1 style="color: white; margin: 0; font-size: 28px;">
                            🔐 Secure id
                        </h1>
                    </div>

                    <div style="background-color: #f9f9f9; padding: 40px 30px; border-radius: 0 0 10px 10px; 
                                border: 1px solid #eaeaea;">

                        <h2 style="color: #2d3748; margin-top: 0;">Password Reset Request</h2>

                        <p style="color: #4a5568; font-size: 16px;">
                            Hello,
                        </p>

                        <p style="color: #4a5568; font-size: 16px;">
                            You requested to reset your password. Use the OTP below to proceed:
                        </p>

                        <div style="background: white; border-radius: 8px; padding: 20px; 
                                    text-align: center; margin: 30px 0; border: 2px dashed #cbd5e0;">
                            <div style="font-size: 32px; font-weight: bold; letter-spacing: 10px; 
                                        color: #2c7be5; margin: 10px 0;">
                                {otp}
                            </div>
                            <div style="font-size: 14px; color: #718096; margin-top: 10px;">
                                (Valid for 10 minutes)
                            </div>
                        </div>

                        <p style="color: #4a5568; font-size: 16px;">
                            Enter this code on the password reset page to complete the process.
                        </p>

                        <div style="background-color: #fef3c7; border-left: 4px solid #d97706; 
                                    padding: 15px; margin: 25px 0; border-radius: 4px;">
                            <p style="color: #92400e; margin: 0; font-size: 14px;">
                                ⚠️ <strong>Security tip:</strong> Never share this OTP with anyone. 
                                Our team will never ask for your password or OTP.
                            </p>
                        </div>

                        <p style="color: #718096; font-size: 14px;">
                            If you didn't request this password reset, please ignore this email or 
                            contact our support team if you have concerns.
                        </p>

                        <hr style="border: none; border-top: 1px solid #e2e8f0; margin: 30px 0;">

                        <p style="text-align: center; color: #a0aec0; font-size: 12px;">
                            This is an automated email from Secure id System.<br>
                            © {datetime.date.today()} Secure id. All rights reserved.
                        </p>

                    </div>
                </body>
                </html>
                """

            # Attach both versions
            # msg.attach(MIMEText(text, "plain"))
            msg.attach(MIMEText(html, "html"))

            # Send email
            server.send_message(msg)
            print("✅ Email sent successfully!", otp)

            # Close connection
            server.quit()

        except Exception as e:
            print("❌ Error loading email credentials:", e)
            return JsonResponse({'status': "ok", 'otpp': otp})

        return JsonResponse({'status': 'ok', 'otpp': otp})
    return JsonResponse({'status': "not found"})


def forgotpass(request):
    email = request.POST['email']
    npass = request.POST['password']
    cpass = request.POST['confirmpassword']
    if npass == cpass:
        User.objects.filter(username=email).update(password=make_password(npass))
        return JsonResponse({'status': 'ok'})
    return JsonResponse({'status': 'invalid'})




def forgotpassword(request):
    return render(request,"forgotpassword.html")
def forgotpasswordbuttonclick(request):
    email = request.POST['textfield']
    if User.objects.filter(username=email).exists():
        from email.mime.text import MIMEText
        from email.mime.multipart import MIMEMultipart

        # ✅ Gmail credentials (use App Password, not real password)
        sender_email = os.getenv('EMAIL_HOST_USER')
        receiver_email = email  # change to actual recipient
        app_password = os.getenv('EMAIL_HOST_PASSWORD')  # App Password from Google
        pwd = str(random.randint(1100,9999))  # Example password to send
        request.session['otp'] = pwd
        request.session['email'] = email

        # Setup SMTP
        server = smtplib.SMTP("smtp.gmail.com", 587)
        server.starttls()
        server.login(sender_email, app_password)

        # Create the email
        msg = MIMEMultipart("alternative")
        msg["From"] = sender_email
        msg["To"] = receiver_email
        msg["Subject"] = "Your OTP"

        # Plain text (backup)
        # text = f"""
        # Hello,

        # Your password for Smart Donation Website is: {pwd}

        # Please keep it safe and do not share it with anyone.
        # """

        # HTML (attractive)
        html = f"""
        <html>
          <body style="font-family: Arial, sans-serif; color: #333;">
            <h2 style="color:#2c7be5;">Secureid</h2>
            <p>Hello,</p>
            <p>Your OTP is:</p>
            <p style="padding:10px; background:#f4f4f4; 
                      border:1px solid #ddd; 
                      display:inline-block;
                      font-size:18px;
                      font-weight:bold;
                      color:#2c7be5;">
              {pwd}
            </p>
            <p>Please keep it safe and do not share it with anyone.</p>
            <hr>
            <small style="color:gray;">This is an automated email from Secureid System.</small>
          </body>
        </html>
        """

        # Attach both versions
        # msg.attach(MIMEText(text, "plain"))
        msg.attach(MIMEText(html, "html"))

        # Send email
        server.send_message(msg)
        print("✅ Email sent successfully!")

        # Close connection
        server.quit()
        return HttpResponse("<script>window.location='/otp'</script>")
    else:
        return HttpResponse("<script>alert('Email not found');window.location='/forgotpassword'</script>")


def otp(request):
    return render(request,"otp.html")
def otpbuttonclick(request):
    otp  = request.POST["textfield"]
    if otp == str(request.session['otp']):
        return HttpResponse("<script>window.location='/forgotpswdpswed'</script>")
    else:
        return HttpResponse("<script>alert('incorrect otp');window.location='/otp'</script>")

def forgotpswdpswed(request):
    return render(request,"forgotpswdpswed.html")
def forgotpswdpswedbuttonclick(request):
    np = request.POST["password"]
    User.objects.filter(username=request.session['email']).update(password=make_password(np))
    return HttpResponse("<script>alert('password has been changed');window.location='/' </script>")



#   main
from io import BytesIO
from django.http import HttpResponse
from reportlab.lib.pagesizes import letter, A4
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle, Image
from reportlab.lib.units import inch, cm
from reportlab.lib import colors
from reportlab.pdfgen import canvas
from reportlab.lib.enums import TA_CENTER, TA_LEFT, TA_RIGHT
from .models import student, mark, subject, course, offered_list
from django.db.models import Sum
import datetime


def generate_student_certificate(student_id):
    """
    Generate a PDF certificate for a student with details from models.

    Args:
        student_id (int): ID of the student

    Returns:
        HttpResponse: PDF file response
    """

    try:
        # Get student data
        student_obj = student.objects.get(id=student_id)

        # Get course details through offered_list
        offered_list_obj = student_obj.OFFERED_LIST
        course_obj = offered_list_obj.COURSE

        # Get all marks for the student
        student_marks = mark.objects.filter(STUDENT=student_obj).select_related('SUBJECT')

        # Calculate totals
        total_credit_points = 0
        total_credits = 0
        sgpa = 0

        for mark_obj in student_marks:
            try:
                credit_point = round(float(mark_obj.credit_point), 2) if mark_obj.credit_point else 0
                credit = float(mark_obj.SUBJECT.credit) if mark_obj.SUBJECT and mark_obj.SUBJECT.credit else 0
                total_credit_points += credit_point
                total_credits += credit
            except (ValueError, TypeError):
                continue

        if total_credits > 0:
            sgpa = round(total_credit_points / total_credits, 2)

        # Create PDF buffer
        buffer = BytesIO()

        # Create PDF document
        doc = SimpleDocTemplate(
            buffer,
            pagesize=A4,
            topMargin=0.5 * inch,
            bottomMargin=0.5 * inch,
            leftMargin=0.5 * inch,
            rightMargin=0.5 * inch
        )

        # Story will hold the content
        story = []

        # Define custom styles
        styles = getSampleStyleSheet()

        # Add custom styles
        styles.add(ParagraphStyle(
            name='CertificateTitle',
            parent=styles['Heading1'],
            fontSize=20,
            textColor=colors.HexColor('#1a2980'),  # Dark blue
            alignment=TA_CENTER,
            spaceAfter=5,
            fontName='Helvetica-Bold'
        ))

        styles.add(ParagraphStyle(
            name='InstitutionName',
            parent=styles['Heading2'],
            fontSize=16,
            textColor=colors.HexColor('#2c3e50'),
            alignment=TA_CENTER,
            spaceAfter=10,
            fontName='Helvetica-Bold'
        ))

        styles.add(ParagraphStyle(
            name='StudentName',
            parent=styles['Heading2'],
            fontSize=18,
            textColor=colors.HexColor('#2980b9'),
            alignment=TA_CENTER,
            spaceAfter=5,
            fontName='Helvetica-Bold'
        ))

        styles.add(ParagraphStyle(
            name='CertificateText',
            parent=styles['Normal'],
            fontSize=12,
            textColor=colors.black,
            alignment=TA_CENTER,
            spaceAfter=5
        ))

        styles.add(ParagraphStyle(
            name='DetailsLabel',
            parent=styles['Normal'],
            fontSize=8,
            textColor=colors.HexColor('#2c3e50'),
            alignment=TA_LEFT,
            fontName='Helvetica-Bold'
        ))

        styles.add(ParagraphStyle(
            name='DetailsValue',
            parent=styles['Normal'],
            fontSize=8,
            textColor=colors.black,
            alignment=TA_LEFT
        ))

        styles.add(ParagraphStyle(
            name='TableHeader',
            parent=styles['Normal'],
            fontSize=10,
            textColor=colors.white,
            alignment=TA_CENTER,
            fontName='Helvetica-Bold',
            backColor=colors.HexColor('#3498db')
        ))

        styles.add(ParagraphStyle(
            name='Signature',
            parent=styles['Normal'],
            fontSize=12,
            textColor=colors.black,
            alignment=TA_CENTER,
            spaceBefore=40
        ))

        styles.add(ParagraphStyle(
            name='QRText',
            parent=styles['Normal'],
            fontSize=9,
            textColor=colors.HexColor('#666666'),
            alignment=TA_CENTER,
            spaceBefore=5,
            fontName='Helvetica-Oblique'
        ))

        # Certificate Title
        story.append(Paragraph("CERTIFICATE OF ACADEMIC ACHIEVEMENT", styles['CertificateTitle']))
        story.append(Spacer(1, 5))

        # Institution Name (you might want to add a college model field)
        story.append(Paragraph("UNIVERSITY OF EXCELLENCE", styles['InstitutionName']))
        story.append(Spacer(1, 10))

        # Certificate Text
        story.append(Paragraph("This is to certify that", styles['CertificateText']))
        story.append(Spacer(1, 5))

        # Student Name
        story.append(Paragraph(student_obj.name.upper(), styles['StudentName']))
        story.append(Spacer(1, 5))

        # Certificate Description
        story.append(Paragraph(
            f"has successfully completed the {course_obj.title} program "
            f"during the academic year {student_obj.joining_year}.",
            styles['CertificateText']
        ))
        story.append(Spacer(1, 5))

        # Student Details Table
        details_data = [
            ['Registration No:', student_obj.roll_number],
            ['Course:', course_obj.title],
            ['Academic Year:', student_obj.joining_year],
            ['SGPA:', str(sgpa)],
            ['Overall Result:', 'PASS' if sgpa >= 4.0 else 'COMPLETED']
        ]

        details_table = Table(details_data, colWidths=[3 * cm, 10 * cm])
        details_table.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (0, -1), colors.HexColor('#ecf0f1')),
            ('TEXTCOLOR', (0, 0), (0, -1), colors.HexColor('#2c3e50')),
            ('ALIGN', (0, 0), (0, -1), 'LEFT'),
            ('ALIGN', (1, 0), (1, -1), 'LEFT'),
            ('FONTNAME', (0, 0), (0, -1), 'Helvetica-Bold'),
            ('FONTSIZE', (0, 0), (-1, -1), 11),
            ('BOTTOMPADDING', (0, 0), (-1, -1), 8),
            ('TOPPADDING', (0, 0), (-1, -1), 8),
            ('GRID', (0, 0), (-1, -1), 0.5, colors.grey),
        ]))

        story.append(details_table)
        story.append(Spacer(1, 15))

        # Academic Performance Header
        story.append(Paragraph("ACADEMIC PERFORMANCE", styles['InstitutionName']))
        story.append(Spacer(1, 15))

        # Marks Table
        table_data = []
        # Header row
        header_row = ['Subject Code', 'Subject Name', 'Credits', 'Grade', 'Grade Points', 'Credit Points']
        table_data.append(header_row)

        # Add marks for each subject
        for mark_obj in student_marks:
            if mark_obj.SUBJECT:
                row = [
                    mark_obj.SUBJECT.code,
                    mark_obj.SUBJECT.name,
                    mark_obj.SUBJECT.credit,
                    mark_obj.grade,
                    mark_obj.grade_point,
                    mark_obj.credit_point
                ]
                table_data.append(row)

        # Summary row
        table_data.append(['', 'TOTAL', str(total_credits), '', '', str(total_credit_points)])
        table_data.append(['', 'SGPA', '', '', '', str(sgpa)])

        marks_table = Table(table_data, colWidths=[2.5 * cm, 7 * cm, 2 * cm, 2 * cm, 2.5 * cm, 2.5 * cm])
        marks_table.setStyle(TableStyle([
            # Header style
            ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#3498db')),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.white),
            ('ALIGN', (0, 0), (-1, 0), 'CENTER'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('FONTSIZE', (0, 0), (-1, 0), 10),

            # Data rows
            ('ALIGN', (2, 1), (5, -1), 'CENTER'),
            ('ALIGN', (0, 1), (0, -1), 'CENTER'),
            ('FONTSIZE', (0, 1), (-1, -3), 9),

            # Last two rows (summary)
            ('BACKGROUND', (0, -2), (-1, -1), colors.HexColor('#f8f9fa')),
            ('FONTNAME', (0, -2), (-1, -1), 'Helvetica-Bold'),
            ('FONTSIZE', (0, -2), (-1, -1), 10),

            # Grid
            ('GRID', (0, 0), (-1, -1), 0.5, colors.grey),
            ('BOX', (0, 0), (-1, -1), 1, colors.black),

            # Padding
            ('PADDING', (0, 0), (-1, -1), 6),
        ]))

        story.append(marks_table)
        story.append(Spacer(1, 30))

        # Declaration
        story.append(Paragraph(
            "This certificate is issued on the basis of the candidate's performance "
            "in the examinations conducted by the University.",
            styles['CertificateText']
        ))
        story.append(Spacer(1, 40))

        # Create QR Code for verification
        try:
            # Generate verification URL - update with your actual verification URL
            verification_url = f"{student_obj.roll_number}_{ student_obj.joining_year}_{student_obj.id}"

            # Generate QR code image
            import qrcode
            from reportlab.lib.utils import ImageReader
            from PIL import Image as PILImage
            import io

            # Create QR code
            qr = qrcode.QRCode(
                version=1,
                error_correction=qrcode.constants.ERROR_CORRECT_L,
                box_size=4,
                border=2,
            )
            qr.add_data(verification_url)
            qr.make(fit=True)

            # Create QR code as PIL Image
            qr_img = qr.make_image(fill_color="black", back_color="white")

            # Convert PIL Image to bytes
            img_byte_array = io.BytesIO()
            qr_img.save(img_byte_array, format='PNG')
            img_byte_array.seek(0)

            # Add QR code to PDF
            qr_image = Image(img_byte_array, width=2 * cm, height=2 * cm)

            # Create QR code section table
            qr_section_data = [
                [qr_image, '', ''],
                ['Scan to verify', '', '']
            ]

            qr_table = Table(qr_section_data, colWidths=[4 * cm, 7 * cm, 7 * cm])
            qr_table.setStyle(TableStyle([
                ('ALIGN', (0, 0), (0, 0), 'CENTER'),
                ('ALIGN', (0, 1), (0, 1), 'CENTER'),
                ('VALIGN', (0, 0), (0, 0), 'MIDDLE'),
                ('FONTSIZE', (0, 1), (0, 1), 8),
                ('TEXTCOLOR', (0, 1), (0, 1), colors.HexColor('#666666')),
                ('LEFTPADDING', (0, 0), (0, 0), 0),
                ('RIGHTPADDING', (0, 0), (0, 0), 0),
                ('TOPPADDING', (0, 1), (0, 1), 2),
                ('BOTTOMPADDING', (0, 1), (0, 1), 2),
            ]))

            story.append(qr_table)
            story.append(Spacer(1, 10))

        except ImportError:
            # If qrcode library is not installed, add a note
            story.append(Paragraph(
                "QR Code Verification: Install 'qrcode[pil]' package for QR code generation",
                styles['QRText']
            ))
            story.append(Spacer(1, 20))
        except Exception as e:
            # If any error occurs with QR code generation
            story.append(Paragraph(
                f"Verification QR code could not be generated: {str(e)[:50]}...",
                styles['QRText']
            ))
            story.append(Spacer(1, 20))

        # Signatures area
        signature_data = [
            ['', '', ''],
            ['________________________', '________________________', '________________________'],
            ['Registrar', 'Dean of Academics', 'Controller of Examinations'],
            ['University of Excellence', 'Faculty of Studies', 'Examination Division']
        ]

        signature_table = Table(signature_data, colWidths=[6 * cm, 6 * cm, 6 * cm])
        signature_table.setStyle(TableStyle([
            ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
            ('FONTSIZE', (0, 1), (-1, -1), 10),
            ('FONTNAME', (0, 2), (-1, 2), 'Helvetica-Bold'),
            ('SPACEAFTER', (0, 0), (-1, -1), 5),
        ]))

        story.append(signature_table)
        story.append(Spacer(1, 20))

        # Certificate number and date
        current_date = datetime.datetime.now().strftime("%d/%m/%Y")
        cert_number = f"CERT/{student_obj.roll_number}/{datetime.datetime.now().strftime('%Y%m%d')}"

        footer_text = f"Certificate No: {cert_number} | Date of Issue: {current_date}"
        story.append(Paragraph(footer_text, styles['CertificateText']))

        # Build PDF
        doc.build(story)

        # Get PDF value from buffer
        pdf = buffer.getvalue()
        buffer.close()

        fname = f"{student_obj.name.replace(' ', '_')}_Certificate_{student_id}.pdf"
        filepath = r"C:\Users\abhim\PycharmProjects\secure_id_new\media\certificates\\" + fname
        # Save the PDF
        with open(filepath, 'wb') as f:
            f.write(pdf)

        # Optional: Return the file path
        print(f"PDF saved to: {filepath}")

        obj=certificate()
        obj.STUDENT_id=student_id
        obj.semester=""
        obj.issue_date=datetime.datetime.now().date()
        obj.file="/media/certificates/"+fname
        obj.qrcode=""
        obj.save()

        # Create HTTP response
        response = HttpResponse(content_type='application/pdf')
        response[
            'Content-Disposition'] = f'attachment; filename="Certificate_{student_obj.name.replace(" ", "_")}_{student_obj.roll_number}_{student_id}.pdf"'
        response.write(pdf)
        return response

    except student.DoesNotExist:
        return HttpResponse("Student not found", status=404)
    except Exception as e:
        return HttpResponse(f"Error generating certificate: {str(e)}", status=500)




# Utility function to use in views
def download_certificate(request, student_id):
    return generate_student_certificate(student_id)


import cv2
import numpy as np
import os
def process_image(request):

        # Check if image exists in request
        if 'image' not in request.FILES:
            return JsonResponse({
                'status': 'error',
                'message': 'No image provided'
            }, status=400)

        cert_id = request.POST['cert_id']
        image_file = request.FILES['image']
        print("UU")
        print(cert_id)
        cc=cert_id.split("_")[-1]
        stud_id=cc.split(".")[0]

        # Read image data
        image_bytes = image_file.read()
        nparr = np.frombuffer(image_bytes, np.uint8)

        # Decode image
        image = cv2.imdecode(nparr, cv2.IMREAD_COLOR)

        if image is None:
            return JsonResponse({
                'status': 'error',
                'message': 'Invalid image format'
            }, status=400)



        # You can save the image if needed
        timestamp_str = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")+".jpg"
        save_path = r"C:\Users\abhim\PycharmProjects\secure_id_new\APP\static\faces\\"+timestamp_str
        os.makedirs(os.path.dirname(save_path), exist_ok=True)
        cv2.imwrite(save_path, image)

        stat=check_face(stud_id, save_path)
        if stat=="ok":
            return JsonResponse({
                'status': 'success',
                'message': f'Face detected successfully',
            })
        else:
            return JsonResponse({
                'status': 'no',
                'message': f'Face not matching',
            })




def ajaxinternal(request,id):
    stud = student.objects.filter(OFFERED_LIST_id=request.session['iid'])
    for i in stud:
        intern = mark.objects.filter(STUDENT_id=i.id,SUBJECT_id=id)
        if intern.exists():
            i.mark = intern[0].internal_mark
        else:
            i.mark = 0

    return render(request,'COLLEGE/ajaxinternal.html',{'stud':stud})