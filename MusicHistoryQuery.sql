

--1.
--SELECT * FROM Genre;


--2.
--SELECT * From Artist
--ORDER BY ArtistName;


--3.
--SELECT s.Title,
--       a.ArtistName
--  FROM Song s
--       LEFT JOIN Artist a on s.ArtistId = a.id;


--4.
--SELECT a.ArtistName, g.Name, b.Title
--    FROM Album b
--        LEFT JOIN Artist a on b.ArtistId = a.id
--        LEFT JOIN Genre g on b.GenreId = g.id
--    WHERE name = 'pop';


--5.
--SELECT a.ArtistName, g.Name, b.Title
--    FROM Album b
--        LEFT JOIN Artist a on b.ArtistId = a.id
--        LEFT JOIN Genre g on b.GenreId = g.id
--    WHERE name = 'jazz' OR name = 'rock';


--6.
--SELECT b.title
--    FROM Album b
--        LEFT JOIN Song s on s.AlbumId = b.id
--    WHERE s.AlbumId IS NULL


--7.
--INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Avenged Sevenfold', 1999);


--8.
--INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('City of Evil', 2005, 4320, 'Album', 28, 5);

        
--9.
--INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Sidewinder', 2005, 420, 5, 28, 23);


--10.
--SELECT b.Title, s.Title, a.ArtistName 
--FROM Album b 
--LEFT JOIN Song s ON s.AlbumId = b.Id
--LEFT JOIN Artist a ON a.id = b.ArtistId
--where ArtistName = 'Avenged Sevenfold';


--11.
--SELECT b.Title, b.Id, count(s.title) '# of songs'
--    FROM Album b 
--        left JOIN Song s ON s.AlbumId = b.Id
--    GROUP BY b.title, b.id;


--12.
--SELECT a.ArtistName, a.Id, count(s.Title) '# of songs'
--    FROM Artist a
--        LEFT JOIN Song s ON s.ArtistId = a.Id
--    GROUP BY a.ArtistName, a.Id;



--13.
--SELECT g.Name, g.Id, count(s.Title) '# of songs'
--    From Genre g
--        LEFT JOIN Song s ON s.GenreId = g.Id
--    GROUP BY g.Name, g.Id;



--14.
--SELECT count(b.Label) 'label count', a.id, a.ArtistName 
--    FROM Artist a
--        LEFT JOIN Album b ON b.ArtistId = a.Id
--    Group by a.ArtistName, a.Id
--having count(label) > 1;



--15.
--SELECT b.Title, AlbumLength
--    FROM Album b
--WHERE AlbumLength = (SELECT max(AlbumLength) FROM Album);



--16.
--SELECT s.Title, SongLength
--    FROM Song s
--WHERE SongLength = (SELECT max(SongLength) FROM Song);




--17.
--SELECT s.Title, SongLength, b.Title
--    FROM Song s
--        LEFT JOIN Album b ON b.id = s.AlbumId
--    WHERE SongLength = (SELECT max(SongLength) FROM Song); 




