"""secure_id_new URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from APP import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('loginn',views.loginn),
    path('loginn_post',views.loginn_post),
    path('admin_home',views.admin_home),
    path('change_password_admin',views.change_password_admin),
    path('change_password_admin_post',views.change_password_admin_post),
    path('add_course',views.add_course),
    path('add_course_post',views.add_course_post),
    path('manage_course',views.manage_course),
    path('edit_course/<id>',views.edit_course),
    path('edit_course_post/<id>',views.edit_course_post),
    path('delete_course/<id>',views.delete_course),
    path('view_subject/<id>',views.view_subject),
    path('add_subject/<id>',views.add_subject),
    path('add_subject_post/<id>',views.add_subject_post),
    path('edit_subject/<id>',views.edit_subject),
    path('edit_subject_post/<id>', views.edit_subject_post),
    path('delete_subject/<id>',views.delete_subject),
    # path('forget_password', views.forget_password),
    # path('forget_password_post', views.forget_password_post),
    # path('set_password',views.set_password),
    # path('set_password_post',views.set_password_post),
    path('college_home',views.college_home),
    path('college_register',views.college_register),
    path('college_register_post',views.college_register_post),
    path('verify_college',views.verify_college),
    path('reject_college/<id>',views.reject_college),
    path('accept_college/<id>',views.accept_college),
    path('approved_colleges',views.approved_colleges),
    path('verify_company',views.verify_company),
    path('accept_company/<id>',views.accept_company),
    path('reject_company/<id>',views.reject_company),
    path('view_approved_company',views.view_approved_company),
    path('view_student/<id>',views.view_student),
    path('view_student_post/<id>',views.view_student_post),
    path('view_internals/<id>',views.view_internals),
    path('add_external_mark/<id>',views.add_external_mark),
    path('add_external_mark_post/<id>',views.add_external_mark_post),
    path('publish_result/<id>',views.publish_result),
    path('view_complaint_from_student',views.view_complaint_from_student),
    path('reply_to_student/<id>',views.reply_to_student),
    path('reply_to_student_post/<id>',views.reply_to_student_post),




    path('college_register',views.college_register),
    path('college_register_post',views.college_register_post),
    path('view_college',views.view_college),
    path('view_course_college',views.view_course_college),
    path('add_to_offered_list/<id>',views.add_to_offered_list),
    path('view_own_course',views.view_own_course),
    path('add_student/<id>',views.add_student),
    path('add_student_post/<id>',views.add_student_post),
    path('view_student_college',views.view_student_college),
    path('edit_student/<id>',views.edit_student),
    path('edit_student_post/<id>',views.edit_student_post),
    path('delete_student/<id>',views.delete_student),
    path('view_internal_mark',views.view_internal_mark),
    path('add_internal_mark/<id>',views.add_internal_mark),
    path('add_internal_mark_post',views.add_internal_mark_post),
    path('edit_internal_mark/<id>',views.edit_internal_mark),
    path('edit_internal_mark_post/<id>',views.edit_internal_mark_post),
    path('delete_internal_mark/<id>',views.delete_internal_mark),
    path('college_change_password_admin',views.college_change_password_admin),
    path('college_change_password_admin_post',views.college_change_password_admin_post),
    path('college_view_subject/<id>',views.college_view_subject),
    path('cmpny_register',views.cmpny_register),
    path('cmpny_login',views.cmpny_login),
    path('cmpny_add_vacancy',views.cmpny_add_vacancy),
    path('cmpny_view_vacancy',views.cmpny_view_vacancy),
    path('cmpny_edit_vacancy',views.cmpny_edit_vacancy),
    path('remove',views.remove),
    path('cmpny_view_application',views.cmpny_view_application),
    path('viewcandidate',views.viewcandidate),
    path('update_date',views.update_date),
    path('cmpny_change_password', views.cmpny_change_password),
    path('user_applyvaccy', views.user_applyvaccy),
    path('user_change_password', views.user_change_password),
    path('user_forgot_password', views.user_forgot_password),
    path('user_view_application_status', views.user_view_application_status),
    path('user_view_certificate', views.user_view_certificate),
    path('user_view_company', views.user_view_company),
    path('user_view_complaint_reply', views.user_view_complaint_reply),
    path('user_marks', views.user_marks),
    path('studcmpny_change_password', views.studcmpny_change_password),
    path('logout1', views.logout1),
    path('user_view_subject', views.user_view_subject),
    path('user_view_vacancy', views.user_view_vacancy),
    path('user_view_profile', views.user_view_profile),
    path('send_complaint',views.send_complaint),
    path('accept_application', views.accept_application),
    path('reject_application', views.reject_application),
    path('forgotemail', views.forgotemail),
    path('forgotpass', views.forgotpass),
    path('forgotpassword', views.forgotpassword),
    path('forgotpasswordbuttonclick', views.forgotpasswordbuttonclick),
    path('otp', views.otp),
    path('otpbuttonclick', views.otpbuttonclick),
    path('forgotpswdpswed', views.forgotpswdpswed),
    path('forgotpswdpswedbuttonclick', views.forgotpswdpswedbuttonclick),
    path('', views.index),
    path('download_certificate/<student_id>', views.download_certificate),
    # path('process_image', views.process_image),
    path('ajaxinternal/<id>',views.ajaxinternal),
    path('process_image', views.process_image),

]
urlpatterns+=static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)