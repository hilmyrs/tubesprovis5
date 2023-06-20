import sqlite3
from typing import Union
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware
from flask import jsonify
from flask import request
import json
app = FastAPI()

app.add_middleware(
 CORSMiddleware,
 allow_origins=["*"],
 allow_credentials=True,
 allow_methods=["*"],
 allow_headers=["*"],
)

@app.get("/")
def read_root():
 return {"Hello": "World"}

@app.get("/init/")
def init_db():
    try:
        DB_NAME = "tubesProvis.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        
        create_table = """ CREATE TABLE jenis_transaksi(
                id_jenis_transaksi INTEGER PRIMARY KEY AUTOINCREMENT,
                jenis_transaksi TEXT NOT NULL
            )  
            """
        cur.execute(create_table)
        
        create_table = """ CREATE TABLE dompet(
                id_dompet INTEGER PRIMARY KEY AUTOINCREMENT,
                total_saldo INTEGER NOT NULL
            )  
            """
        cur.execute(create_table)
        
        create_table = """ CREATE TABLE history_transaksi(
                id_history INTEGER PRIMARY KEY AUTOINCREMENT,
                id_jenis_transaksi INTEGER NOT NULL,
                id_dompet INTEGER NOT NULL,
                jumlah_transaksi INTEGER NOT NULL,
                tanggal INTEGER NOT NULL,
                keterangan TEXT NOT NULL,
                FOREIGN KEY (id_jenis_transaksi) REFERENCES jenis_transaksi(id_jenis_transaksi),
                FOREIGN KEY (id_dompet) REFERENCES dompet(id_dompet)
            )  
            """
        cur.execute(create_table)
        
        create_table = """ CREATE TABLE investor(
                id_investor INTEGER PRIMARY KEY AUTOINCREMENT,
                id_dompet INTEGER NOT NULL,
                email text NOT NULL,
                password text NOT NULL,
                nama_investor text NOT NULL,
                tanggal_lahir text NOT NULL,
                alamat text NOT NULL,
                no_handphone text NOT NULL,
                FOREIGN KEY (id_dompet) REFERENCES dompet(id_dompet)
            )  
            """
        cur.execute(create_table)
        
        create_table = """ CREATE TABLE peminjam(
                id_peminjam INTEGER PRIMARY KEY AUTOINCREMENT,
                id_akun INTEGER NOT NULL,
                id_dompet INTEGER NOT NULL,
                nama_investor text NOT NULL,
                tanggal_lahir text NOT NULL,
                lokasi_peminjam text NOT NULL,
                jenis_umkm text NOT NULL,
                foto_usaha text NOT NULL,
                foto_ktp text NOT NULL,
                foto_selfie text NOT NULL,
                no_handphone text NOT NULL,
                FOREIGN KEY (id_dompet) REFERENCES dompet(id_dompet),
                FOREIGN KEY (id_akun) REFERENCES akun(id_akun)
            ) 
            """ 
        cur.execute(create_table)
        
        create_table = """ CREATE TABLE pinjaman(
                id_pinjaman INTEGER PRIMARY KEY AUTOINCREMENT,
                id_peminjam INTEGER NOT NULL,
                jumlah_pinjaman INTEGER NOT NULL,
                kali_angsuran INTEGER NOT NULL,
                sisa_angsuran INTEGER NOT NULL,
                status_pinjaman text NOT NULL,
                keterangan text NOT NULL,
                FOREIGN KEY (id_peminjam) REFERENCES peminjam(id_peminjam)
            )  
            """
        cur.execute(create_table)
        
        create_table = """ CREATE TABLE pendanaan(
                id_pendanaan INTEGER PRIMARY KEY AUTOINCREMENT,
                id_pinjaman INTEGER NOT NULL,
                id_investor INTEGER NOT NULL,
                jumlah_pendanaan INTEGER NOT NULL,
                FOREIGN KEY (id_pinjaman) REFERENCES pinjaman(id_pinjaman),
                FOREIGN KEY (id_investor) REFERENCES investor(id_investor)
                
            )  
            """
        cur.execute(create_table)
        
        create_table = """ CREATE TABLE status_angsuran(
                id_status_angsuran INTEGER PRIMARY KEY AUTOINCREMENT,
                status_angsuran TEXT NOT NULL
            )  
            """
        cur.execute(create_table)
        
        create_table = """ CREATE TABLE angsuran(
                id_angsuran INTEGER PRIMARY KEY AUTOINCREMENT,
                id_pinjaman INTEGER NOT NULL,
                id_status_angsuran INTEGER NOT NULL,
                jatuh_tempo INTEGER NOT NULL,
                tanggal_pembayaran INTEGER NOT NULL,
                jumlah_angsuran INTEGER NOT NULL,
                FOREIGN KEY (id_pinjaman) REFERENCES pinjaman(id_pinjaman),
                FOREIGN KEY (id_status_angsuran) REFERENCES angsuran(id_status_angsuran)
            )  
            """
        cur.execute(create_table)
        
        
        con.commit
    except:
        return ({"status":"terjadi error"})  
    
    return ({"status":"ok, db dan tabel berhasil dicreate"})

class JenisAkun(BaseModel):
   jenis_akun: str
   
@app.post("/tambah_jenis_akun")
def tambah_jenis_akun(j: JenisAkun):
    try:
        DB_NAME = "tubesProvis.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        cur.execute("""insert into jenis_akun (jenis) values ("{}")""".format(j.jenis_akun))
        con.commit()
    except:
        return ({"status":"terjadi error"})   
    finally:   
        con.close()
    return {"status":"ok berhasil insert satu record"}

class JenisTransaksi(BaseModel):
   jenis_transaksi: str
   
@app.post("/tambah_jenis_transaksi")
def tambah_jenis_transaksi(j: JenisTransaksi):
    try:
        DB_NAME = "tubesProvis.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        cur.execute("""insert into jenis_transaksi (jenis_transaksi) values ("{}")""".format(j.jenis_transaksi))
        con.commit()
    except:
        return ({"status":"terjadi error"})   
    finally:   
        con.close()
    return {"status":"ok berhasil insert satu record"}

class Dompet(BaseModel):
   total_saldo: int

def add_dompet():
    try:
        DB_NAME = "tubesProvis.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        cur.execute("""insert into dompet (total_saldo) values ("100000")""")
        con.commit()
    except:
        return ({"status":"terjadi error"})   
    finally:   
        con.close()
    return ({"status":"SUKSES"}) 

def get_latest_dompet():
    try:
        DB_NAME = "tubesProvis.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        cur.execute("SELECT * FROM dompet ORDER BY id_dompet DESC LIMIT 1")
        row = cur.fetchone()
    except:
        return ({"status":"terjadi errors"})   
    finally:   
        con.close()
    return row[0]

@app.get("/get_id_investor/{email}")
def get_id(email:str):
    try:
        DB_NAME = "tubesProvis.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        cur.execute("SELECT id_investor FROM investor WHERE email = {}".format(email))
        row = cur.fetchone()
    except:
        return ({"status":"terjadi errors"})   
    finally:   
        con.close()
    return row[0]

   
class AddTransaction(BaseModel):
   id_jenis : int
   id_dompet : int
   nama_transaksi : str
   jml_transaksi : int
   tanggal : str
   keterangan : str
   
@app.post("/add_transaction")
def add_transaction(i : AddTransaction):
    try:
        DB_NAME = "tubesProvis.db"
        con = sqlite3.connect(DB_NAME)
        cur1 = con.cursor()
        cur1.execute("""insert into history_transaksi (id_jenis_transaksi, id_dompet, nama_transaksi, jumlah_transaksi, tanggal, keterangan) 
                    VALUES ("{}","{}","{}","{}","{}","{}")""".format(i.id_jenis, i.id_dompet, i.nama_transaksi, i.jml_transaksi, i.tanggal, i.keterangan))
        con.commit()
    except:
        return ({"status":"terjadi error"})   
    finally:   
        con.close()
        return ({"status":"sukses bro"})  
   
class UpdateSaldo(BaseModel):
   id_dompet : int
   update_saldo : int
   
@app.put("/update_saldo/")
def update_saldo(i : UpdateSaldo):
    try:
        DB_NAME = "tubesProvis.db"
        con = sqlite3.connect(DB_NAME)
        cur1 = con.cursor()
        cur1.execute("""UPDATE dompet set total_saldo = {} WHERE id_dompet = {}""".format(i.update_saldo, i.id_dompet))
        con.commit()
    except:
        return ({"status":"terjadi error"})   
    finally:   
        con.close()
        return ({"status":"sukses bro"})
    
class Pinjaman(BaseModel):
    id_peminjam : int
    nama_pinjaman : str
    jumlah_pinjaman : int
    lama_tenor : int 
    bagi_hasil : int
    sisa_angsuran : int
    status : str
    keterangan : str
   
@app.post("/tambah_pinjaman")
def tambah_pinjaman(i: Pinjaman):
    try:
        DB_NAME = "tubesProvis.db"
        con = sqlite3.connect(DB_NAME)
        cur1 = con.cursor()
        cur1.execute("""insert into pinjaman (id_peminjam, nama_pinjaman, jumlah_pinjaman, lama_tenor, bagi_hasil, sisa_angsuran, status_pinjaman, keterangan) 
                    VALUES ("{}","{}","{}","{}","{}","{}","{}","{}")""".format(i.id_peminjam,i.nama_pinjaman, i.jumlah_pinjaman, i.lama_tenor, i.bagi_hasil, i.sisa_angsuran,i.status, i.keterangan))
        con.commit()
    except:
        return ({"status":"terjadi error"})   
    finally:   
        con.close()
        return ({"status":"sukses bro"})
     
class Pendanaan(BaseModel):
    id_pinjaman : int
    id_investor : int
    jumlah : int
    keuntungan : int

@app.post("/tambah_pendanaan")
def tambah_pendanaan(i: Pendanaan):
    try:
        DB_NAME = "tubesProvis.db"
        con = sqlite3.connect(DB_NAME)
        cur1 = con.cursor()
        cur1.execute("""insert into pendanaan (id_pinjaman, id_investor, jumlah_pendanaan, total_profit) 
                    VALUES ("{}","{}","{}","{}")""".format(i.id_pinjaman,i.id_investor, i.jumlah, i.keuntungan))
        con.commit()
    except:
        return ({"status":"terjadi error"})   
    finally:   
        con.close()
        return ({"status":"sukses bro"})
    
class Angsuran(BaseModel):
    id_pinjaman : int
    id_status : int
    jatuh_tempo : str
    tanggal_pembayaran : str
    jml_angsuran : int
    jml_bagi_hasil : int

@app.post("/tambah_angsuran")
def tambah_angsuran(i: Angsuran):
    try:
        DB_NAME = "tubesProvis.db"
        con = sqlite3.connect(DB_NAME)
        cur1 = con.cursor()
        cur1.execute("""insert into angsuran (id_pinjaman, id_status_angsuran, jatuh_tempo, tanggal_pembayaran, jumlah_angsuran, jumlah_bagi_hasil) 
                    VALUES ("{}","{}","{}","{}","{}","{}")""".format(i.id_pinjaman,i.id_status, i.jatuh_tempo, i.tanggal_pembayaran, i.jml_angsuran, i.jml_bagi_hasil))
        con.commit()
    except:
        return ({"status":"terjadi error"})   
    finally:   
        con.close()
        return ({"status":"sukses bro"}) 
    
class Borrower(BaseModel):
    email : str
    password : str
    nama_peminjam : str
    tanggal_lahir : str
    lokasi_peminjam : str
    no_handphone : str
    
@app.post("/register_borrower")
def register_borrower(i: Borrower):
    add_dompet()
    id_dompet = get_latest_dompet()
    try:
        DB_NAME = "tubesProvis.db"
        con = sqlite3.connect(DB_NAME)
        cur1 = con.cursor()
        cur1.execute("""insert into peminjam (id_dompet, email, password, nama_peminjam, tanggal_lahir, lokasi_peminjam, no_handphone) 
                    VALUES ("{}","{}","{}","{}","{}","{}","{}")""".format(id_dompet,i.email, i.password, i.nama_peminjam, i.tanggal_lahir, i.lokasi_peminjam, i.no_handphone))
        con.commit()
    except:
        return ({"status":"terjadi error"})   
    finally:   
        con.close()
        return ({"status":"sukses bro"})   
    
class Investor(BaseModel):
   email : str
   password : str
   nama_investor : str
   tanggal_lahir : str
   alamat : str
   no_handphone : str
   
@app.post("/register_investor")
def register_investor(i: Investor):
    add_dompet()
    id_dompet = get_latest_dompet()
    try:
        DB_NAME = "tubesProvis.db"
        con = sqlite3.connect(DB_NAME)
        cur1 = con.cursor()
        cur1.execute("""insert into investor (id_dompet, email, password, nama_investor, tanggal_lahir,alamat, no_handphone) 
                    VALUES ("{}","{}","{}","{}","{}","{}","{}")""".format(id_dompet,i.email, i.password, i.nama_investor, i.tanggal_lahir, i.alamat, i.no_handphone))
        con.commit()
    except:
        return ({"status":"terjadi error"})   
    finally:   
        con.close()
        return ({"status":"sukses bro"})   

class LoginData(BaseModel):
   email : str
   password : str

@app.post("/login_investor")
def login_investor(login_data: LoginData):
    # Proses validasi login
    email = login_data.email
    password = login_data.password

    # Koneksi ke database SQLite
    conn = sqlite3.connect('tubesProvis.db')
    cursor = conn.cursor()

    # Eksekusi query untuk validasi login
    query = "SELECT * FROM investor WHERE email = ? AND password = ?"
    cursor.execute(query, (email, password))
    result = cursor.fetchone()
    
    if result:
        # Login berhasil
        return {"id": "{}".format(result[0]),
                "id_dompet": "{}".format(result[1])}
    else:
        # Login gagal, lempar HTTPException dengan status code 401 Unauthorized
        raise HTTPException(status_code=401, detail="Invalid email or password")

@app.post("/login_borrower")
def login_borrower(login_data: LoginData):
    # Proses validasi login
    email = login_data.email
    password = login_data.password

    # Koneksi ke database SQLite
    conn = sqlite3.connect('tubesProvis.db')
    cursor = conn.cursor()

    # Eksekusi query untuk validasi login
    query = "SELECT * FROM peminjam WHERE email = ? AND password = ?"
    cursor.execute(query, (email, password))
    result = cursor.fetchone()
    
    if result:
        # Login berhasil
        return {"id": "{}".format(result[0]),
                "id_dompet": "{}".format(result[1])}
    else:
        # Login gagal, lempar HTTPException dengan status code 401 Unauthorized
        raise HTTPException(status_code=401, detail="Invalid email or password")


class Peminjam(BaseModel):
   id_akun: int
   id_dompet : int
   nama_investor : str
   jenis_kelamin : str
   lokasi : str
   jenis_umkm : str
   foto_usaha : str
   foto_ktp : str
   foto_selfie : str
   no_handphone : str
   
@app.post("/tambah_peminjam")
def tambah_peminjam(i: Peminjam):
    try:
        DB_NAME = "tubesProvis.db"
        con = sqlite3.connect(DB_NAME)
        cur = con.cursor()
        cur.execute("""insert into peminjam (id_akun, id_dompet, nama_investor, jenis_kelamin, lokasi_peminjam, jenis_umkm, foto_usaha, foto_ktp, foto_selfie, no_handphone) 
                    VALUES ("{}","{}","{}","{}","{}","{}","{}","{}","{}","{}")""".format(i.id_akun, i.id_dompet, i.nama_investor, i.jenis_kelamin, i.lokasi, i.jenis_umkm, i.foto_usaha, i.foto_ktp,i.foto_selfie,i.no_handphone))
        con.commit()
    except:
        return ({"status":"terjadi error"})   
    finally:   
        con.close()
    return {"status":"ok berhasil insert satu record"}

@app.get("/get_asset/{id_investor}")
def get_asset(id_investor):
   try:
    DB_NAME = "tubesProvis.db"
    con = sqlite3.connect(DB_NAME)
    cur = con.cursor()
    asset = 0
    profit = 0
    for row in cur.execute("select * from pendanaan JOIN pinjaman on pendanaan.id_pinjaman = pinjaman.id_pinjaman WHERE id_investor = {} ".format(id_investor)):
        asset += row[3]
        profit += row[4]
    total_aset = {'asset': asset,
                  'profit':profit,}
   except:
    return ({"status":"terjadi error"})   
   finally:    
    con.close()
    return ({"data": total_aset})

@app.get("/get_id_history/{id_dompet}")
def get_id__history(id_dompet):
   try:
    DB_NAME = "tubesProvis.db"
    con = sqlite3.connect(DB_NAME)
    cur = con.cursor()
    data_history = []
    for row in cur.execute("select * from history_transaksi WHERE id_dompet = {} ORDER BY id_history DESC".format(id_dompet)):
        history_data = {
                'id_jenis': row[1],
                'nama' : row[3],
                'jumlah': row[4],
                'tanggal' : row[5],
                'keterangan' : row[6],
            }
        data_history.append(history_data)
   except:
    return ({"status":"terjadi error"})   
   finally:    
    con.close()
    return ({"data": data_history})
    
@app.get("/get_dompet/{id_dompet}")
def get_dompet(id_dompet):
   try:
    DB_NAME = "tubesProvis.db"
    con = sqlite3.connect(DB_NAME)
    cur = con.cursor()
    recs = []
    for row in cur.execute("select * from dompet WHERE id_dompet = {}".format(id_dompet)):
        recs.append(row)
   except:
    return ({"status":"terjadi error"})   
   finally:    
    con.close()
   return {"data":recs}


@app.get("/get_all_pinjaman/")
def get_pinjaman():
   try:
    DB_NAME = "tubesProvis.db"
    con = sqlite3.connect(DB_NAME)
    cur = con.cursor()
    listPinjaman = []
    for row in cur.execute("select * from pinjaman JOIN peminjam ON pinjaman.id_peminjam = peminjam.id_peminjam"):
        dataPinjaman = {
                'id_pinjaman': row[0],
                'nama_pinjaman' : row[2],
                'jumlah': row[3],
                'lama_tenor' : row[4],
                'bagi_hasil' : row[5],
                'status_pinjaman' : row[7],
                'keterangan' : row[8],
                'dana_terkumpul' : row[9],
                'target_date' : row[10],
                'id_peminjam' : row[11],
                'nama_peminjam' : row[15],
                'lokasi' : row[17],
                
            }
        listPinjaman.append(dataPinjaman)
   except:
    return ({"status":"terjadi error"})   
   finally:    
    con.close()
    return ({"data": listPinjaman})


@app.get("/get_pinjaman/{id_peminjam}")
def get_pinjaman(id_peminjam):
   try:
    DB_NAME = "tubesProvis.db"
    con = sqlite3.connect(DB_NAME)
    cur = con.cursor()
    listPinjaman = []
    for row in cur.execute("select * from pinjaman JOIN peminjam ON pinjaman.id_peminjam = peminjam.id_peminjam WHERE pinjaman.id_peminjam = {}".format(id_peminjam)):
        dataPinjaman = {
                'id_pinjaman': row[0],
                'nama_pinjaman' : row[2],
                'jumlah': row[3],
                'lama_tenor' : row[4],
                'bagi_hasil' : row[5],
                'status_pinjaman' : row[7],
                'keterangan' : row[8],
                'nama_peminjam' : row[13],
                'lokasi' : row[15],
                
            }
        listPinjaman.append(dataPinjaman)
   except:
    return ({"status":"terjadi error"})   
   finally:    
    con.close()
    return ({"data": listPinjaman})

@app.get("/get_investor/{id_investor}")
def get_investor(id_investor):
   try:
    DB_NAME = "tubesProvis.db"
    con = sqlite3.connect(DB_NAME)
    cur = con.cursor()
    investor = {}
    for row in cur.execute("select * from investor JOIN dompet ON investor.id_dompet = dompet.id_dompet WHERE id_investor = {}".format(id_investor)):
        investor_data = {
                'id_akun': row[0],
                'email' : row[2],
                'name': row[4],
                'tanggal_lahir' : row[5],
                'alamat' : row[6],
                'phone' : row[7],
                'id_dompet' : row[8],
                'saldo' : row[9], 
            }
        investor = investor_data
   except:
    return ({"status":"terjadi error"})   
   finally:    
    con.close()
    return ({"data": investor})


@app.get("/get_borrower/{id_borrower}")
def get_investor(id_borrower):
   try:
    DB_NAME = "tubesProvis.db"
    con = sqlite3.connect(DB_NAME)
    cur = con.cursor()
    investor = {}
    for row in cur.execute("select * from peminjam JOIN dompet ON peminjam.id_dompet = dompet.id_dompet WHERE id_peminjam = {}".format(id_borrower)):
        investor_data = {
                'id_akun': row[0],
                'email' : row[2],
                'name': row[4],
                'tanggal_lahir' : row[5],
                'alamat' : row[6],
                'phone' : row[7],
                'id_dompet' : row[8],
                'saldo' : row[9], 
            }
        investor = investor_data
   except:
    return ({"status":"terjadi error"})   
   finally:    
    con.close()
    return ({"data": investor})