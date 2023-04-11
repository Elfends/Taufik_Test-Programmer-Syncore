--1. Menampilkan data member yang berada pada provinsi sumatera utara dan dalam satu kabupaten
select mk.nama_kabupaten, mm.* from mst_member mm
join mst_provinsi mp on mm.id_provinsi=mp.kode_propinsi
join mst_kabupaten mk on mm.id_kabupaten=mk.kode_kabupaten 
where mp.nama_propinsi="SUMATERA UTARA"
order by mm.id_kabupaten asc;

--2. Menampilkan data provinsi yang tidak ada dalam data member
select * from mst_provinsi mp
where mp.kode_propinsi not in (
	select distinct(id_povinsi) from mst_member
);

--3. Menampilkan data kabupaten yang tidak ada dalam data member
select * from mst_kabupaten mk
where mk.kode_kabupaten not in (
	select distinct(id_kabupaten) from mst_member
);

--4. Menampilkan data kecamatan yang tidak ada dalam data member
select * from mst_kecamatan mk
where mk.kode_kecamatan not in (
	select distinct(id_kecamatan) from mst_member
);

--5. Menampilkan nama member yang terdapat di Kab. Simalungun
select mm.nama from mst_member mm
join mst_kabupaten mk on mm.id_kabupaten=mp.kode_kabupaten
where mk.nama_kabupaten="KAB. SIMALUNGUN";

--6. Menampilkan jumlah data instansi pada Kab. Bireuen dan Kab. Bener Meriah
select mk.nama_kabupaten, count(1) from mst_kabupaten
join mst_instansi mi on mk.kode_kabupaten = mi.kode_kabupaten
where mk.nama_kabupaten = "KAB. BIREUEN" or mk.nama_kabupaten = "KAB. BENER MERIAH"
group by mk.nama_kabupaten;

--7. Menampilkan data member yang berawalan huruf “M”
select * from mst_member mm
where mm.nama like "M%";

--8. Menampilkan alamat email yang mempunyai karakter “no” dan terdapat di provinsi Sumatera Utara
select mm.email from mst_member mm
join mst_provinsi mp on mm.id_provinsi=mp.kode_propinsi
where mp.nama_propinsi="SUMATERA UTARA"
and mm.email like "%no%";

--9. Menampilkan data member yang mempunyai kode instansi “2004”
select * from mst_member mm
where mm.kode_instansi like "%.2004";

--10. Menampilkan data member yang mempunyai karakter kode kecamatan “.08.”
select * from mst_member mm
where mm.id_kecamatan like "%.08.%";