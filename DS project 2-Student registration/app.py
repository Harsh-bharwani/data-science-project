from flask import Flask, render_template, request, redirect
from flask_mysqldb import MySQL
import bcrypt

app = Flask(__name__)

# MySQL Configuration
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'your_username'
app.config['MYSQL_PASSWORD'] = 'your_password'
app.config['MYSQL_DB'] = 'registration_db'

mysql = MySQL(app)

# Root endpoint to render registration form
@app.route('/')
def registration_form():
    return render_template('register.html')

# Register endpoint to handle form submission
@app.route('/register', methods=['POST'])
def register():
    # Get form data
    student_name = request.form['student_name']
    father_name = request.form['father_name']
    mother_name = request.form['mother_name']
    phone_number = request.form['phone_number']
    email = request.form['email']
    date_of_birth = request.form['date_of_birth']
    address = request.form['address']
    blood_group = request.form['blood_group']
    department = request.form['department']
    course = request.form['course']
    password = request.form['password']

    # Hash password
    hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

    # Save data to MySQL
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO users (student_name, father_name, mother_name, phone_number, email, date_of_birth, address, blood_group, department, course, password) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                (student_name, father_name, mother_name, phone_number, email, date_of_birth, address, blood_group, department, course, hashed_password))
    mysql.connection.commit()
    cur.close()

    return redirect('/')

if __name__ == '__main__':
    app.run(debug=True)
