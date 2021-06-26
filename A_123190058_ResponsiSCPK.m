optsKet = detectImportOptions('Real estate valuation data set.xlsx','DataRange', 'C2:E51');
dataKet = readmatrix('Real estate valuation data set.xlsx', optsKet);
optsHarga = detectImportOptions('Real estate valuation data set.xlsx','DataRange', 'H2:H51');
dataHarga = readmatrix('Real estate valuation data set.xlsx', optsHarga);
data = [dataKet dataHarga];%Menggabungkan data dari data yang sudah diambil

k = [1,0,1,0];%attribute tiap kriteria. 1 bila benefit, 0 bila cost.
w = [3,5,4,1];%nilai bobot tiap kriteria
[m,n]=size (data);%menyimpan ukuran data
w=w./sum(w);%Normalisasi bobot
%melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n
    if k(j)==0, w(j)=-1*w(j);
    end
end
for i=1:m
    S(i)=prod(data(i,:).^w);
end
%proses perangkingan nilai
for i=1:m
   V(i) = S(i)/sum(S);
end
[rank,rowRank] = max(V);%mengambil nilai terbaik
disp("real estate yang menjadi alternatif terbaik untuk investasi jangka panjang adalah real estate nomor ");
disp(rowRank);%menampilkan hasil terbaik
