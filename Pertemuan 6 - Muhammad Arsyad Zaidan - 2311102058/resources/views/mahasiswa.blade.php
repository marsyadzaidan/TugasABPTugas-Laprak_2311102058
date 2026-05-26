<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tugas Praktikum - Arsyad Zaidan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f0f2f5;
            min-height: 100vh;
        }
        .header-section {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            color: white;
            padding: 60px 0;
            border-bottom-left-radius: 50px;
            border-bottom-right-radius: 50px;
            margin-bottom: 40px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .btn-custom {
            background: #ff4b2b;
            background: -webkit-linear-gradient(to right, #ff416c, #ff4b2b);
            background: linear-gradient(to right, #ff416c, #ff4b2b);
            border: none;
            color: white;
            padding: 12px 30px;
            font-weight: 600;
            border-radius: 30px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(255, 75, 43, 0.3);
        }
        .btn-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(255, 75, 43, 0.5);
            color: white;
        }
        .card-mhs {
            border: none;
            border-radius: 15px;
            transition: all 0.3s ease;
            background: white;
            overflow: hidden;
        }
        .card-mhs:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1) !important;
        }
        .card-mhs .card-header {
            background: #2a5298;
            color: white;
            font-weight: 600;
            border: none;
        }
        .badge-nim {
            background: #e9ecef;
            color: #2a5298;
            font-weight: bold;
            padding: 5px 12px;
            border-radius: 10px;
        }
        /* Animasi Muncul */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .fade-in {
            animation: fadeIn 0.5s ease forwards;
        }
    </style>
</head>
<body>

    <div class="header-section text-center">
        <div class="container">
            <h1 class="display-5 fw-bold">Data Mahasiswa Informatika</h1>
            <p class="lead">Praktikum Pemrograman Web - Muhammad Arsyad Zaidan</p>
            <button id="btnTampilData" class="btn btn-custom mt-3">
                Ambil Data via AJAX
            </button>
        </div>
    </div>

    <div class="container pb-5">
        <div class="row g-4" id="areaHasilData">
            </div>
    </div>

    <script>
        document.getElementById('btnTampilData').addEventListener('click', function () {
            const areaHasil = document.getElementById('areaHasilData');
            areaHasil.innerHTML = '<div class="col-12 text-center text-muted">Sedang mengambil data dari server...</div>';

            fetch('/mahasiswa')
                .then(response => response.json())
                .then(data => {
                    areaHasil.innerHTML = '';
                    data.forEach((mhs, index) => {
                        const cardHtml = `
                            <div class="col-md-4 fade-in" style="animation-delay: ${index * 0.1}s">
                                <div class="card card-mhs shadow-sm">
                                    <div class="card-header text-center">
                                        Mahasiswa
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title fw-bold text-dark text-center mb-3">${mhs.nama}</h5>
                                        <div class="d-flex justify-content-between align-items-center mb-2">
                                            <span class="text-muted">NIM</span>
                                            <span class="badge-nim">${mhs.nim}</span>
                                        </div>
                                        <div class="d-flex justify-content-between mb-2">
                                            <span class="text-muted">Kelas</span>
                                            <span class="fw-bold">${mhs.kelas}</span>
                                        </div>
                                        <hr>
                                        <p class="text-center text-primary mb-0 fw-semibold">${mhs.prodi}</p>
                                    </div>
                                </div>
                            </div>`;
                        areaHasil.innerHTML += cardHtml;
                    });
                })
                .catch(error => {
                    areaHasil.innerHTML = '<div class="col-12 text-center text-danger">Gagal memuat data! Cek Controller atau JSON kamu.</div>';
                });
        });
    </script>
</body>
</html>