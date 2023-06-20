function highlightLink(event) {
    // Menghapus class "active" dari semua elemen "a" di dalam sidebar
    var links = document.querySelectorAll('.sidebar a');
    links.forEach(function(link) {
        link.classList.remove('active');
    });

    // Menambahkan class "active" ke elemen yang diklik
    event.target.closest('a').classList.add('active');
}

// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");
var sbm = document.getElementById("submit");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }

  function displayResult(nama, nim, angkatan) {
    var table = document.createElement('table');
    table.className = 'table table-striped';
    var tbody = document.createElement('tbody');
    var tr1 = document.createElement('tr');
    var tr2 = document.createElement('tr');
    var tr3 = document.createElement('tr');
    var th1 = document.createElement('th');
    var th2 = document.createElement('th');
    var th3 = document.createElement('th');
    var td1 = document.createElement('td');
    var td2 = document.createElement('td');
    var td3 = document.createElement('td');

    th1.textContent = 'Nama';
    th2.textContent = 'NIM';
    th3.textContent = 'Angkatan';
    td1.textContent = nama;
    td2.textContent = nim;
    td3.textContent = angkatan;

    tr1.appendChild(th1);
    tr1.appendChild(td1);
    tr2.appendChild(th2);
    tr2.appendChild(td2);
    tr3.appendChild(th3);
    tr3.appendChild(td3);

    tbody.appendChild(tr1);
    tbody.appendChild(tr2);
    tbody.appendChild(tr3);

    table.appendChild(tbody);

    document.getElementById('result').appendChild(table);
}

// Fungsi untuk mengambil input dari pengguna dan menampilkan hasil
function submitForm() {
    var isPraktikanPPW1 = confirm('Apakah Anda praktikan PPW1?');
    if (isPraktikanPPW1) {
        var nama = prompt('Masukkan Nama:');
        var nim = prompt('Masukkan NIM:');
        var angkatan = prompt('Masukkan Angkatan:');
        displayResult(nama, nim, angkatan);
    } else {
        var message = document.createElement('p');
        message.textContent = 'Anda bukan praktikan PPW1, anda tidak boleh masuk!';
        document.getElementById('result').appendChild(message);
    }
}  

}



