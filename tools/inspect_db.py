import pymysql

def main():
    cnx = pymysql.connect(host="localhost", user="root", password="123456", database="secureid")
    cur = cnx.cursor()
    cur.execute("DESCRIBE app_student")
    rows = cur.fetchall()
    print("Columns in app_student:")
    for r in rows:
        print(r[0])

if __name__ == '__main__':
    main()
