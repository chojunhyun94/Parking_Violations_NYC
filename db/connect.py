#!/usr/bin/python
import psycopg2
from config import config

def connect():
    """ Connect to the PostgreSQL database server """
    conn = None
    try:
        # read connection parameters
        params = config()

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)
		
        # create a cursor
        cur = conn.cursor()
        
	# execute a statement
        print('PostgreSQL database version:')
        cur.execute('SELECT version()')

        # display the PostgreSQL database server version
        db_version = cur.fetchone()
        print(db_version)

    
        try:
            #check if table exists
            sql = '''SELECT * FROM parking_violations_clean;'''
            cur.execute(sql)
            for i in cur.fetchmany(10):
                print(i)
        except (Exception, psycopg2.DatabaseError) as error:
            cur.execute("ROLLBACK")
            conn.commit()
            try:
                print(error)
                sql2 = '''CREATE TABLE parking_violations_clean(\
                registration_state varchar(2)   NOT NULL,\
                plate_type varchar(3)   NOT NULL,\
                violation_code int   NOT NULL,\
                vehicle_body_type varchar(4)   NOT NULL,\
                vehicle_make varchar(5)   NOT NULL,\
                violation_time varchar(5)   NOT NULL,\
                vehicle_color varchar(3)   NOT NULL,\
                vehicle_year int   NOT NULL);'''
                cur.execute(sql2)
                print('created table')

                sql3 = '''COPY parking_violations_clean(\
                registration_state,\
                plate_type,\
                violation_code,\
                vehicle_body_type,\
                vehicle_make,\
                violation_time,\
                vehicle_color,\
                vehicle_year)
                FROM 'E:bootcamp/Group_Final_Project/Resources/cleaned_data.csv'
                DELIMITER ','
                CSV HEADER;'''
                cur.execute(sql3)
                print('filled table')
                conn.commit()
                cur.execute(sql)
                for i in cur.fetchmany(10):
                    print(i)
            except (Exception, psycopg2.DatabaseError) as error:
                cur.execute("ROLLBACK")
                conn.commit()
                print(error)
                print('failed to fill table')
        try:
            #check if table exists
            sql4 = '''SELECT * FROM parking_violations_ml;'''
            cur.execute(sql4)
            for i in cur.fetchmany(10):
                print(i)
        except (Exception, psycopg2.DatabaseError) as error:
            cur.execute("ROLLBACK")
            conn.commit()
            try: 
                print(error)
                sql5 = '''CREATE TABLE parking_violations_ml(\
                registration_state int   NOT NULL,\
                plate_type int   NOT NULL,\
                violation_code float   NOT NULL,\
                violation_time float   NOT NULL,\
                vehicle_year int   NOT NULL,\
                body_type int   NOT NULL,\
                make_type int   NOT NULL,\
                color_type int   NOT NULL);'''
                cur.execute(sql5)
                print('created table')

                sql6 = '''COPY parking_violations_ml(\
                registration_state,\
                plate_type,\
                violation_code,\
                violation_time,\
                vehicle_year,\
                body_type,\
                make_type,\
                color_type)
                FROM 'E:bootcamp/Group_Final_Project/Resources/training_data.csv'
                DELIMITER ','
                CSV HEADER;'''
                cur.execute(sql6)
                print('filled table')
                conn.commit()
                cur.execute(sql4)
                for i in cur.fetchmany(10):
                    print(i)
            except (Exception, psycopg2.DatabaseError) as error:
                cur.execute("ROLLBACK")
                conn.commit()
                print(error)
                print('failed to fill table')
       
	# close the communication with the PostgreSQL
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')


if __name__ == '__main__':
    connect()