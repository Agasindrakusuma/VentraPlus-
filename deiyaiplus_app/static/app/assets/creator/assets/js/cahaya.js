document.querySelectorAll(".input-box input").forEach(input => {
    input.addEventListener("input", function () {
        // Tambahkan kelas 'typing' saat pengguna mengetik
        input.classList.add("typing");

        // Hapus kelas 'typing' setelah animasi selesai
        setTimeout(() => {
            input.classList.remove("typing");
        }, 500); // Waktu ini harus sesuai dengan durasi animasi di CSS
    });
});
