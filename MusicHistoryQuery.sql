

--1. Query all of the entries in the Genre table
SELECT * FROM Genre;


--2. Query all the entries in the Artist table and order by the artist's name. HINT: use the ORDER BY keywords
SELECT * From Artist
ORDER BY ArtistName;


--3. Write a SELECT query that lists all the songs in the Song table and include the Artist name
SELECT s.Title,
       a.ArtistName
  FROM Song s
       LEFT JOIN Artist a on s.ArtistId = a.id;


--4. Write a SELECT query that lists all the Artists that have a Pop Album
SELECT a.ArtistName, g.Name, b.Title
    FROM Album b
        LEFT JOIN Artist a on b.ArtistId = a.id
        LEFT JOIN Genre g on b.GenreId = g.id
    WHERE name = 'pop';


--5. Write a SELECT query that lists all the Artists that have a Jazz or Rock Album
SELECT a.ArtistName, g.Name, b.Title
    FROM Album b
        LEFT JOIN Artist a on b.ArtistId = a.id
        LEFT JOIN Genre g on b.GenreId = g.id
    WHERE name = 'jazz' OR name = 'rock';


--6. Write a SELECT statement that lists the Albums with no songs
SELECT b.title
    FROM Album b
        LEFT JOIN Song s on s.AlbumId = b.id
    WHERE s.AlbumId IS NULL


--7. Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Avenged Sevenfold', 1999);


--8. Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('City of Evil', 2005, 4320, 'Album', 28, 5);

        
--9. Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Sidewinder', 2005, 420, 5, 28, 23);


--10. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
--Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
--NOTE: Direction of join matters. Try the following statements and see the difference in results.
--SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;
--SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;
SELECT b.Title, s.Title, a.ArtistName 
    FROM Album b 
        LEFT JOIN Song s ON s.AlbumId = b.Id
        LEFT JOIN Artist a ON a.id = b.ArtistId
    where ArtistName = 'Avenged Sevenfold';


--11. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT b.Title, b.Id, count(s.title) '# of songs'
    FROM Album b 
        left JOIN Song s ON s.AlbumId = b.Id
    GROUP BY b.title, b.id;


--12. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT a.ArtistName, a.Id, count(s.Title) '# of songs'
    FROM Artist a
        LEFT JOIN Song s ON s.ArtistId = a.Id
    GROUP BY a.ArtistName, a.Id;



--13. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT g.Name, g.Id, count(s.Title) '# of songs'
    From Genre g
        LEFT JOIN Song s ON s.GenreId = g.Id
    GROUP BY g.Name, g.Id;



--14. Write a SELECT query that lists the Artists that have put out records on more than one record label. 
--Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword
SELECT count(b.Label) 'label count', a.id, a.ArtistName 
    FROM Artist a
        LEFT JOIN Album b ON b.ArtistId = a.Id
    Group by a.ArtistName, a.Id
having count(label) > 1;



--15. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT b.Title, AlbumLength
    FROM Album b
WHERE AlbumLength = (SELECT max(AlbumLength) FROM Album);



--16. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT s.Title, SongLength
    FROM Song s
WHERE SongLength = (SELECT max(SongLength) FROM Song);




--17. Modify the previous query to also display the title of the album.
SELECT s.Title, SongLength, b.Title
    FROM Song s
        LEFT JOIN Album b ON b.id = s.AlbumId
    WHERE SongLength = (SELECT max(SongLength) FROM Song); 




