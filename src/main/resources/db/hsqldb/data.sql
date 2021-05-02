
INSERT INTO users(username,password,enabled) VALUES ('admin1','admin',TRUE);
INSERT INTO authorities(id,username,authority) VALUES (1,'admin1','admin');


INSERT INTO users(username,password,enabled) VALUES ('owner1','owner',TRUE);
INSERT INTO users(username,password,enabled) VALUES ('owner2','owner',TRUE);
INSERT INTO users(username,password,enabled) VALUES ('owner3','owner',TRUE);
INSERT INTO users(username,password,enabled) VALUES ('owner4','owner',TRUE);
INSERT INTO users(username,password,enabled) VALUES ('owner5','owner',TRUE);
INSERT INTO users(username,password,enabled) VALUES ('owner6','owner',TRUE);
INSERT INTO users(username,password,enabled) VALUES ('owner7','owner',TRUE);
INSERT INTO users(username,password,enabled) VALUES ('owner8','owner',TRUE);
INSERT INTO users(username,password,enabled) VALUES ('owner9','owner',TRUE);
INSERT INTO users(username,password,enabled) VALUES ('owner10','owner',TRUE);

INSERT INTO authorities(id,username,authority) VALUES (2,'owner1','owner');
INSERT INTO authorities(id,username,authority) VALUES (3,'owner2','owner');
INSERT INTO authorities(id,username,authority) VALUES (4,'owner3','owner');
INSERT INTO authorities(id,username,authority) VALUES (5,'owner4','owner');
INSERT INTO authorities(id,username,authority) VALUES (6,'owner5','owner');
INSERT INTO authorities(id,username,authority) VALUES (7,'owner6','owner');
INSERT INTO authorities(id,username,authority) VALUES (8,'owner7','owner');
INSERT INTO authorities(id,username,authority) VALUES (9,'owner8','owner');
INSERT INTO authorities(id,username,authority) VALUES (10,'owner9','owner');
INSERT INTO authorities(id,username,authority) VALUES (11,'owner10','owner');

INSERT INTO users(username,password,enabled) VALUES ('vet1','vet',TRUE);

INSERT INTO authorities(id,username,authority) VALUES (12,'vet1','veterinarian');

INSERT INTO vets VALUES (1, 'James', 'Carter');
INSERT INTO vets VALUES (2, 'Helen', 'Leary');
INSERT INTO vets VALUES (3, 'Linda', 'Douglas');
INSERT INTO vets VALUES (4, 'Rafael', 'Ortega');
INSERT INTO vets VALUES (5, 'Henry', 'Stevens');
INSERT INTO vets VALUES (6, 'Sharon', 'Jenkins');

INSERT INTO specialties VALUES (1, 'radiology');
INSERT INTO specialties VALUES (2, 'surgery');
INSERT INTO specialties VALUES (3, 'dentistry');

INSERT INTO vet_specialties VALUES (2, 1);
INSERT INTO vet_specialties VALUES (3, 2);
INSERT INTO vet_specialties VALUES (3, 3);
INSERT INTO vet_specialties VALUES (4, 2);
INSERT INTO vet_specialties VALUES (5, 1);

INSERT INTO types VALUES (1, 'cat');
INSERT INTO types VALUES (2, 'dog');
INSERT INTO types VALUES (3, 'lizard');
INSERT INTO types VALUES (4, 'snake');
INSERT INTO types VALUES (5, 'bird');
INSERT INTO types VALUES (6, 'hamster');

INSERT INTO owners VALUES (1, 'George', 'Franklin', '110 W. Liberty St.', 'Madison', '6085551023', 'owner1');
INSERT INTO owners VALUES (2, 'Betty', 'Davis', '638 Cardinal Ave.', 'Sun Prairie', '6085551749', 'owner2');
INSERT INTO owners VALUES (3, 'Eduardo', 'Rodriquez', '2693 Commerce St.', 'McFarland', '6085558763', 'owner3');
INSERT INTO owners VALUES (4, 'Harold', 'Davis', '563 Friendly St.', 'Windsor', '6085553198', 'owner4');
INSERT INTO owners VALUES (5, 'Peter', 'McTavish', '2387 S. Fair Way', 'Madison', '6085552765', 'owner5');
INSERT INTO owners VALUES (6, 'Jean', 'Coleman', '105 N. Lake St.', 'Monona', '6085552654', 'owner6');
INSERT INTO owners VALUES (7, 'Jeff', 'Black', '1450 Oak Blvd.', 'Monona', '6085555387', 'owner7');
INSERT INTO owners VALUES (8, 'Maria', 'Escobito', '345 Maple St.', 'Madison', '6085557683', 'owner8');
INSERT INTO owners VALUES (9, 'David', 'Schroeder', '2749 Blackhawk Trail', 'Madison', '6085559435', 'owner9');
INSERT INTO owners VALUES (10, 'Carlos', 'Estaban', '2335 Independence La.', 'Waunakee', '6085555487', 'owner10');

INSERT INTO pets(id,name,birth_date,type_id,owner_id, adoption) VALUES (1, 'Leo', '2010-09-07', 1, 1, false);
INSERT INTO pets(id,name,birth_date,type_id,owner_id, adoption) VALUES (2, 'Basil', '2012-08-06', 6, 2, false);
INSERT INTO pets(id,name,birth_date,type_id,owner_id, adoption) VALUES (3, 'Rosy', '2011-04-17', 2, 3, false);
INSERT INTO pets(id,name,birth_date,type_id,owner_id, adoption) VALUES (4, 'Jewel', '2010-03-07', 2, 3, false);
INSERT INTO pets(id,name,birth_date,type_id,owner_id, adoption) VALUES (5, 'Iggy', '2010-11-30', 3, 4, false);
INSERT INTO pets(id,name,birth_date,type_id,owner_id, adoption) VALUES (6, 'George', '2010-01-20', 4, 5, false);
INSERT INTO pets(id,name,birth_date,type_id,owner_id, adoption) VALUES (7, 'Samantha', '2012-09-04', 1, 6, false);
INSERT INTO pets(id,name,birth_date,type_id,owner_id, adoption) VALUES (8, 'Max', '2012-09-04', 1, 6, false);
INSERT INTO pets(id,name,birth_date,type_id,owner_id, adoption) VALUES (9, 'Lucky', '2011-08-06', 5, 7, false);
INSERT INTO pets(id,name,birth_date,type_id,owner_id, adoption) VALUES (10, 'Mulligan', '2007-02-24', 2, 8, false);
INSERT INTO pets(id,name,birth_date,type_id,owner_id, adoption) VALUES (11, 'Freddy', '2010-03-09', 5, 9, true);
INSERT INTO pets(id,name,birth_date,type_id,owner_id, adoption) VALUES (12, 'Lucky', '2010-06-24', 2, 10, true);
INSERT INTO pets(id,name,birth_date,type_id,owner_id, adoption) VALUES (13, 'Sly', '2012-06-08', 1, 10, true);

INSERT INTO visits(id,pet_id,visit_date,description) VALUES (1, 7, '2013-01-01', 'rabies shot');
INSERT INTO visits(id,pet_id,visit_date,description) VALUES (2, 8, '2013-01-02', 'rabies shot');
INSERT INTO visits(id,pet_id,visit_date,description) VALUES (3, 8, '2013-01-03', 'neutered');
INSERT INTO visits(id,pet_id,visit_date,description) VALUES (4, 7, '2013-01-04', 'spayed');

INSERT INTO books(id, pet_id, start_date, end_date) VALUES (1, 1, '2030-02-01', '2030-02-03');
INSERT INTO books(id, pet_id, start_date, end_date) VALUES (2, 1, '2030-03-01', '2030-03-03');
INSERT INTO books(id, pet_id, start_date, end_date) VALUES (3, 2, '2030-02-01', '2030-02-28');

INSERT INTO requests(id, pet_id, owner_id, accepted, date, comment) VALUES (1, 13, 1, false, '2030-02-28', 'Me gustaria tener otra mascota para acompañar a la mia');
INSERT INTO requests(id, pet_id, owner_id, accepted, date,comment) VALUES (2, 12, 2, false, '2030-02-28', 'Me gustan mucho los animales');
INSERT INTO requests(id, pet_id, owner_id, accepted, date,comment) VALUES (3, 13, 3, false, '2030-02-28', 'Me gustaria adoptar su mascota');

INSERT INTO causes(id,name,active_status,budget,description,organization) VALUES (1,'Hambruna y educación infantil',true,150000.,'Para la compra de alimentos y bebidas, así como financiar educación para los niños de Uganda', 'UNICEF');
INSERT INTO causes(id,name,active_status,budget,description,organization) VALUES (2,'Información gratuita y libre',true, 350000,'Donativos para mantener la infraestructura permitiendo continuar la difusión de contenido públicamente y sin coste alguno', 'Wikimedia Foundation');
INSERT INTO causes(id,name,active_status,budget,description,organization) VALUES (3,'Lucha contra el cambio climático',false, 100000,'Para la lucha contra el cambio climático y la deforestación', 'Green Peace');
INSERT INTO causes(id,name,active_status,budget,description,organization) VALUES (4,'Pobreza infantil',true, 100000,'Para la lucha contra la pobreza infantil', 'Org2');

INSERT INTO donations(id, author, amount, donation_date ,  message ,  cause_id) VALUES (1, 'Lucas', 123452.27, parsedatetime(LOCALTIMESTAMP(0), 'yyyy-MM-dd HH:mm'), 'Dono de prueba', 1);
INSERT INTO donations(id, author, amount, donation_date ,  message ,  cause_id) VALUES (2, 'Alex', 24.74, parsedatetime(LOCALTIMESTAMP(0), 'yyyy-MM-dd HH:mm'), 'Dono de prueba 2', 1);
INSERT INTO donations(id, author, amount, donation_date ,  message ,  cause_id) VALUES (3, 'Nick', 32503.1, parsedatetime(LOCALTIMESTAMP(0), 'yyyy-MM-dd HH:mm'), 'Dono de prueba 2', 2);
INSERT INTO donations(id, author, amount, donation_date ,  message ,  cause_id) VALUES (4, 'Hannah', 24.74, parsedatetime(LOCALTIMESTAMP(0), 'yyyy-MM-dd HH:mm'), 'Dono de prueba 2', 2);

