import psycopg2 

class DeloreanLibrary():

    def connect(self):
        return  psycopg2.connect(
            host='ec2-34-233-105-94.compute-1.amazonaws.com',
            database='d1hgctag1catk2',
            user='vnbefgstfddtzi',
            password='f6afe4a257bcd2b0a416c27d76e18405f80872819af6781df8d3efb2296da29e'
        )


    def remove_student(self, email):

        query = "delete from students where email = '{}'".format(email)

        conn = self.connect()

        cur = conn.cursor()

        cur.execute(query)

        conn.commit()
        conn.close()


    def remove_student_by_name(self, name):

        query = "delete from students where name LIKE  '%{}%'".format(name)

        conn = self.connect()

        cur = conn.cursor()

        cur.execute(query)

        conn.commit()
        conn.close()


    def insert_student(self, student):

        self.remove_student(student['email'])

        query = ("insert into students (name, email, age, weight, feet_tall, created_at, updated_at)"
                "values('{}','{}',{},{},{}, NOW(), NOW());"
                .format(student['name'], student['email'], student['age'], student['weight'], student['feet_tall']))

        conn = self.connect()

        cur = conn.cursor()

        cur.execute(query)

        conn.commit()
        conn.close()

    def remove_plan(self, title):

        query = "delete from plans where title LIKE  '%{}%'".format(title)

        conn = self.connect()

        cur = conn.cursor()

        cur.execute(query)

        conn.commit()
        conn.close()

    
    def insert_plan(self, plan):

        self.remove_plan(plan['title'])

        query = ("insert into plans (title, duration, price, created_at, updated_at)"
                "values('{}','{}',{}, NOW(), NOW());"
                .format(plan['title'], plan['duration'], plan['price']))

        conn = self.connect()

        cur = conn.cursor()

        cur.execute(query)

        conn.commit()
        conn.close()        
