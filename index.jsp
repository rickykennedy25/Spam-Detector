<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>SpamDetector</title>
    <link href="https://cdn.iconscout.com/public/images/icon/free/png-256/s-character-alphabet-letter-3076c5c4f2f01a4b-256x256.png" rel="icon" type="image/jpeg" />
    <link href="https://cdn.iconscout.com/public/images/icon/free/png-256/s-character-alphabet-letter-3076c5c4f2f01a4b-256x256.png" rel="shortcut icon" type="image/jpeg" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script src="//code.jquery.com/jquery-3.2.1.js"></script>
    <script src="js/index.js"></script>
</head>

<body>
    <header>
        <nav>
        <div class="container">
            <b> SpamDetector </b>
        </div>
        </nav>
    </header>
    <main>
        <div class="container">
            <p> Keyword :
                <input id="keyword" type="text" placeholder="spam">
            </p>
            <p> Pilih Algoritma : 
                <button class="search" id="kmp"> KMP </button>
                <button class="search" id="boyer"> Boyer Moore </button>
                <button class="search" id="regex"> Regex </button>
            </p>
            <p> Hasil : </p>
            <div id="result">
                Tidak ada hasil pencarian.
            </div>
        </div>
    </main>
    <footer>
        <div class="container">
            Copyright &copy; 2018 Ricky - Yonas - Dicky
        </div>
    </footer>
</body>
</html>
