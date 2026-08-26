import os
import pymysql


class Db:
    def __init__(self):
        try:
            self.cnx = pymysql.connect(
   		host="localhost",
    		user=os.getenv("DB_USER", "root"),
    		password=os.getenv("DB_PASSWORD"),
    		database=os.getenv("DB_NAME", "secureid_new")
	    )
            self.cur = self.cnx.cursor()
        except pymysql.Error as e:
            print(f"Database connection failed: {e}")
            raise


    def select(self, q):
        self.cur.execute(q)
        rows = self.cur.fetchall()
        cols = [d[0] for d in self.cur.description]
        result = [dict(zip(cols, row)) for row in rows]
        return result

    def selectOne(self, q):
        self.cur.execute(q)
        row = self.cur.fetchone()
        if row is None:
            return None
        cols = [d[0] for d in self.cur.description]
        return dict(zip(cols, row))


    def insert(self, q):
        self.cur.execute(q)
        self.cnx.commit()
        return self.cur.lastrowid

    def update(self, q):
        self.cur.execute(q)
        self.cnx.commit()
        return self.cur.rowcount

    def delete(self, q):
        self.cur.execute(q)
        self.cnx.commit()
        return self.cur.rowcount

