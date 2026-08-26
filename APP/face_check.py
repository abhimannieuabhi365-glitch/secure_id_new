
import face_recognition
# import time
import cv2
import datetime
d=datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
try:
    from .models import student
except Exception:
    import os, sys, django
    base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    if base_dir not in sys.path:
        sys.path.insert(0, base_dir)
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'secure_id_new.settings')
    django.setup()
    from APP.models import student

img_counter = 0
path=r"C:\Users\abhim\PycharmProjects\secure_id_new\media\\"
imgpath=r"C:\Users\abhim\PycharmProjects\secure_id_new\media\\"


def check_face(stud_id, camera_imgpath):
    print(camera_imgpath,"Okyyyyyy")
    print("[INFO] checking image...")
    print("[INFO] Database connected...")
    # fetch student record using Django ORM
    try:
        s = student.objects.get(id=stud_id)
    except student.DoesNotExist:
        print("[ERROR] student not found")
        return "no"
    print("[INFO] Data fetched from ORM...")
    knownlist = []
    print(s)
    knownlist.append({'user_id': s.id, 'name': s.name, 'image': s.image})
    print(knownlist, "lkj")
    known_faces = []
    userids = []
    person_name = []
    identified = []
    if knownlist:
        for result in knownlist:
            picc = result["image"]
            pname = picc.split("/")
            img = imgpath + pname[len(pname) - 1]
            print(img)
            b_img = face_recognition.load_image_file(img)
            b_imgs = face_recognition.face_encodings(b_img)[0]
            known_faces.append(b_imgs)
            userids.append(result["user_id"])
            person_name.append(result["name"])
            print(str(len(known_faces)) + " done")

        # unknown_image = face_recognition.load_image_file(staticpath + "a_270.jpg")
        unknown_image = face_recognition.load_image_file(camera_imgpath)
        unkonownpersons = face_recognition.face_encodings(unknown_image)
        print(len(unkonownpersons), "llllllllllllllllllllllll")
        if len(unkonownpersons) > 0:
            for i in range(0, len(unkonownpersons)):
                h = unkonownpersons[i]
                print("HH ", h)

                red = face_recognition.compare_faces(known_faces, h, tolerance=0.45)  # true,false,false,false]
                print(red)
                for i in range(0, len(red)):
                    if red[i] == True:
                        identified.append(userids[i])

            print(identified,"kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk")
            l=identified
            print("LL", l)
            if len(l) > 0:
                if int(stud_id) in l:
                    return "ok"
                else:
                    print("Fraud detected")
                    return "no"
            else:
                print("Fraud detected")
                return "no"
