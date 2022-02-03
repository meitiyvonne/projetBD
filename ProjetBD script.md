# ProjetBD

```sql
/*
Nom de projet: projetBD
Autheur: Yvonne Meiti Hsia
Date: 2022-02-03
Formateur: Patrick 
*/

use projectbd;

-- create table Etudiant 
drop table if exists Etudiant;
create table Etudiant(
	id int auto_increment not null,
    nom varchar(64) not null,
    prenom varchar(64) not null,
    age int not null default 18 check(age >=18),
    status varchar(20) default 'temps plein',
    nombreCreditReussis int default 15,
    codePermanent varchar(12),
    dateDeNaissance date not null,
    primary key(id)
    
)charset=utf8mb4;


# create table Telephone
drop table if exists Telephone;
create table Telephone(
	id int auto_increment not null primary key,
    indicatif varchar(3) not null,
    numero varchar(8) not null,
    principal boolean default true,
    cellulaire boolean default false,
    etudiantId varchar(64),
    
    foreign key FK_etudiant_telephone (etudiantId) references Etudiant(id)
)charset=utf8mb4;


# create table Adress
drop table if exists adress;
create table Adress(
	id int auto_increment not null primary key,
    numero int not null,
    rue varchar(64) not null,
    ville varchar(64) not null,
    codePostal varchar(7) not null, 
    province varchar(64) not null,
    pays varchar(64) not null,
    principale boolean default true,
    supprime char(1) default '-',
    etudiantId varchar(64),
    foreign key FK_etudiant_adress(etudiantId) references Etudiant(id)
)charset=utf8mb4;

-- insert into Etudiant
insert into 
	Etudiant(nom,prenom,age,status,nombreCreditReussis,codePermanent,dateDeNaissance)
values ('Blow', 'Joe', 72, 'partiel', 12, 'BJOE4578545', '1950-01-01');

insert into 
	Etudiant(nom,prenom,age,status,nombreCreditReussis,codePermanent,dateDeNaissance)
values
('Luke', 'Lucky', 85,'partiel',3,'LUCL2504584','1937-05-06'),
('Allen', 'Woody', 86, 'plein', 21,'WOOA8545788','1933-07-08'),
('Mouse', 'Mickey', 22, 'plein', 30, 'MICM7878802', '1990-11-08'),
('Duck','Donald',28,'partiel',2, 'DOND4512458','1990-11-09'),
('Tarrantino','Quentin',58,'partiel',18,'WEUT2054854','1965-05-06');

insert into 
	Etudiant(nom,prenom,age,status,nombreCreditReussis,codePermanent,dateDeNaissance)
values
('Morisson','Jim',		37,'plein',		3,	'JIM7878545','1949-01-01'),
('John',	'Elton',	33,'partiel',	33,	'ELTJ2004584','1970-12-15'),
('Star',	'Ringo',	47,'plein',		54,	'RINS8545332','1932-07-22'),
('Lennon',	'John',		62,'partiel',	9,	'JOHL7802027','1982-11-08'),
('Trump',	'Donald',	100,'plein',	0,	'DONT0254875','1950-02-09');

insert into 
	Etudiant(nom,prenom,age,status,nombreCreditReussis,codePermanent,dateDeNaissance)
values
('St-Jean','Christiane', 50,'plein',12, 'STJ1235826', '1988-02-25'),
('Brule','Michel', 40, 'partiel', 6, 'BRM147852456', '1975-06-15'),
('Villeneuve','Julie',25,'plein',12,'VIJ456852159', '1995-08-01'),
('Geoffroy','Nicolas', 31, 'plein', 9, 'GEN753159825', '1990-09-04'),
('Brule','Mille', 58, 'partiel', 15, 'BRM456915352','1977-11-25');

-- insert into Telephone
insert into telephone(indicatif,numero,principal,cellulaire, etudiantId)
values 
('518','663-2545',true,false,1),
('514','452-2125',true,false,2),
('418','777-4585',false,true,3),
('418','785-2251',true,false,4),
('819','452-0215',false,true,5),
('819','784-5252',true,false,6);

insert into telephone(indicatif,numero,principal,cellulaire, etudiantId)
values 
('418','555-2360',true,false,7),
('514','875-5850',false,true,8),
('819','458-0258',true,false,9),
('819','785-5541',true,false,10),
('514','774-5582',false,true,11);

insert into telephone(indicatif,numero,principal,cellulaire, etudiantId)
values 
('418','338-6161',true,false,12),
('518','877-3903',false,true,13),
('819','849-1000',true,false,14),
('518','878-1011',false,true,15),
('418','853-6025',true,false,16);

-- insert into Adresse
insert into adress(numero,rue,ville,codePostal,province,pays,principale,etudiantId) 
values
(2906,'rue courcelle','saint-foy','G3C 4R5','Montreal','Canada',
false,1);

insert into adress(numero,rue,ville,codePostal,province,pays,principale,etudiantId) 
values
(1016,'boul rene-levesque','la cite-limoilou','G4F V3R','BC', 'Canada',
false,2);

insert into adress(numero,rue,ville,codePostal,province,pays,principale,etudiantId) 
values
(484,'rue gabreille-roy','les chutes-de-la-chaudiere-quest','F3F R3W', 'Toronto','Canada',
false,3);

insert into adress(numero,rue,ville,codePostal,province,pays,principale,etudiantId)
values
(109,'rue des trois-manoirs','les chutes-de-la-chaudiere-est','G5Y 7U8','Quebec','Canada',
false,4);

insert into adress(numero,rue,ville,codePostal,province,pays,etudiantId) 
values
(3380,'rue pincourt','la haute-saint-charles','2W3 R3W', 'BC', 'Canada',5);

insert into adress(numero,rue,ville,codePostal,province,pays,etudiantId) 
values
(1933,'av de la riviere-jaune','charlesbourg','G5Y R3W','Montreal','Canada',6);

insert into adress(numero,rue,ville,codePostal,province,pays,etudiantId) 
values
(100,'rue de la riviere','boischatel','G3C 4R5', 'Quebec','Canada',7),
(754,'rue ste-olivier','la cite-limoilou','G4F V3R','Montreal','Canada',8),
(138,'carre st-philippe','la malbaie','F3F R3W','Quebec', 'Canada', 9),
(93, 'rg ste-anne','saint-basile','G5Y 7U8', 'BC', 'Canada',10),
(640,'8e avenue','vieux limoilou','W3R R3w','Quebec','Canada',11);

insert into adress(numero,rue,ville,codePostal,province,pays,principale,etudiantId) 
values
(41,'boul johnny parent','loretteville','G3F V3R','Quebec', 'Canada',false,12),
(10, 'rue de la riviere', 'sainte-catherine', 'G5Y R2W', 'Montreal', 'Canada',false, 13),
(315, 'ave mathieu', 'new jersey', '33125', 'NY', 'USA',false, 14),
(100, 'first street', 'new york', '31251', 'NY', 'USA',true,15),
(7300, '3e avenue', 'charlesbourg', 'G4C 4R5', 'BC', 'Canada' ,true, 16);



-- Modification de donnees
# 1. Modifier le numero de telephone principal d un etudiant
select FLOOR(RAND()*(10-5+1)+5);
select FLOOR(RAND()*(16-1+1)+1);

select concat('(',indicatif,')',numero) phone_number
from telephone 
where etudiantId = FLOOR(RAND()*(16-1+1)+1)
and principal = 1; # true, the same result



# 2. changer le status d'un etudiant
select status from etudiant where id = 4; # plein
update etudiant set status = 'partiel' where id = 4;

# 3. changer le numero de telephone d'un 'etudiant
select concat('(',indicatif,')',numero) phone_number
from telephone where etudiantId = 4; # (418)785-2251

update telephone t
set indicatif='514', numero='967-1528'
where  t.etudiantId = 4;


# 4. changer l'adresse principale d'un etudiant
select concat(numero,', ',rue,', ' ,ville,', ',codePostal,', ',province,' ',pays) adresse
from adress
where etudiantId = 4; 
# 109, rue des trois-manoirs, les chutes-de-la-chaudiere-est, G5Y 7U8, Quebec Canada

update adress
set numero = 122, rue='Grand alllee', ville='vieux quebec', codePostal='R3W 1C1'
where etudiantId = 4;

# 5. changer le numero de telephone principal dans la table telephone
select etudiantId, concat('(',indicatif,')',numero) phone_number
from telephone
where principal = true and etudiantId = 16;

update telephone
set indicatif = '819', numero='452-9856'
where etudiantId = 16; # before update:(418)853-6025, 

# 6. Designer un nouveau numero comme etant le numero principal
select etudiantId, concat('(',indicatif,')',numero) phone_number, principal,cellulaire
from telephone
where principal = false;

-- insert into telephone with setting up telephone.id = 0;
insert ignore into telephone(indicatif,numero,etudiantId) 
values('418','589-6321',15);


-- create a tmp table for delete 'duplicate record'
create table tmp select * from telephone group by (numero);
-- drop the exists table 'telephone' with duplicated record, drop with 'structure'
drop table telephone;
-- rename table tmp to 'telephone'
alter table tmp rename to telephone;

select * from telephone where id = 0;
delete from telephone where id =0;

# 7. Affacter une adresse a un autre etudian
select etudiantId from adress where principale = '';

update adress
set principale = '100 rue des hauts, charlevoix, G5Y R2w, Quebe Canada'
where etudiantId = 5;

select etudiantId, principale adresse
from adress 
where principale = '100 rue des hauts, charlevoix, G5Y R2w, Quebe Canada';


#=====================Suppression de donnees=============================
# 1. suppression physique d'elements de la table etudiant
-- truncate table etudiant; 
delete from etudiant;

# 2. supperssion physique de la table telephone
delete from telephone;

# 3. suppression logique d element de la table adresse
select province, principale from adress where province = 'BC';
update adress set province = 1 where province = 'BC' and principale = 0;



#=====================Modification de table===============================
# 1. Ajouter le champ 'DiplomeObtenu' dans la table Etudiant
alter table etudiant add column `DiplomeObtenu` varchar(10) not null default 'n/a';

# 2. Ajouter le chap 'AnneeDiplomation' dans la table etudiant
alter table etudiant add column `AnneeDiplomation` datetime not null default now();

# 3. Ajouter le champ 'Compte' dans la table adresse
alter table adress add column `Compte` varchar(20);

# 4. Ajouter le champ 'Maison' dans la table Telephone
alter table telephone drop column `Maison`;
alter table telephone add column `Maison` boolean default false after cellulaire ;

#=====================Selection de donnees=================================
# 1. Obtenir la liste de tous les etudiants qui possede un numero de telephone commencant par '514
select (concat('(',indicatif,') ',numero)) phoneNo, e.* 
from etudiant e
join telephone t
on e.id = t.etudiantId
where t.indicatif = '514';

# 2. Obtenir la liste (sans restrictions) de la table etudiant
#    et de la table telephone
select *
from etudiant 
full join telephone ;
-- on e.id = t.etudiantId;

# 3. Obtenir la liste des nom, prenom, rue, numero et ville
#    dans une seule ordonne par ordre alphabetique sur le prenom
select e.nom,e.prenom,a.rue,a.numero,a.ville
from etudiant e
join adress a
on e.id = a.etudiantId
order by e.prenom;

# 4. Obtenir la liste (nom, prenom, code permanent, ville)
# ou les etudiants habitent 'Quebec, qui sont ages de 30 
# et plus et sont a temps partiel
select e.nom Nom, e.prenom Prenom, e.codePermanent Code_Permanent,e.age, e.status, a.ville, a.province
from etudiant e
join adress a
on a.province = 'Quebec'
and e.age > 30
and e.status = 'partiel'
group by e.nom;


# 5. Obtenir la liste des numeros etant principals et qui ont un
#    numeros debutant par 819
select (concat('(',t.indicatif,')',t.numero)) numero, principal
from telephone t
where principal = true
and indicatif = '819';

# 6. Obtenir les noms, prenom et numero de cellulaire
#    des etudiants qui ont reussis plus de 12 credits
select e.nom,e.prenom,e.nombreCreditReussis,t.numero, t.cellulaire
from etudiant e
join telephone t
on t.cellulaire = true
and e.nombreCreditReussis > 12
group by e.nom;

#=========================selection de donnees==========================
# 1. Obtenir les nom, prenom et code permanent des
#    etudiants qui habite la ville de quebec ou la vill de montreal
select e.nom, e.prenom, e.codePermanent, a.ville, a.province
from etudiant e
join adress a
on a.etudiantId = e.id
and a.province = 'Montreal'
union
select e.nom, e.prenom, e.codePermanent, a.ville, a.province
from etudiant e
join adress a
on a.etudiantId = e.id
and a.province = 'Quebec';

# 2. Obtenir les nom, prenom, code permanent des etudiant
#    qui nhabite pas le Canada
select e.nom, e.prenom, e.codePermanent, a.ville,a.pays
from etudiant e
join adress a
on a.etudiantId = e.id
and a.pays <> 'Canada';

# 3. Obtenir les rue et les villes des adresses ou le code postal
#    se termine par 'R3W'
select a.id,a.rue Rue, a.ville Ville, a.codePostal Postal
from adress a
where instr(a.codePostal, 'R3W'); # a string contains 'R3W'

-- last 3 character are 'R3W'
select a.id,a.rue Rue, a.ville Ville, a.codePostal Postal
from adress a
where a.codePostal like '%R3W';

# 4. Obtenir tous les etudiants qui ont une adresse dans la table adresse
select *
from etudiant t
join adress a
on a.principale <> ' '
and a.principale <> ''
and a.etudiantId = t.id;

# 5. Obtenir toutes les adresses ainsi que tous les numeros de telephone
select *, (concat('(',indicatif,')',t.numero)) phoneNo
from adress a, etudiant e, telephone t
where a.etudiantId = e.id
and t.etudiantId = e.id;

# 6. Obtenir les nom, prenom, numero, rue, ville des etudiants
#    qui possedent une adresse. Si un etudiant ne possede pas d adresse 
#    il ne doit pas etre affiche.
select e.nom Nom, e.prenom Prenom, a.numero Numero, a.ville Ville, a.principale principale_Adresse
from etudiant e, adress a
where a.principale <> ' '
and e.id = a.etudiantId;

# 7. Obtenir les nom, prenom et code permanent des etudiants qui ont plus de 30 ans.
select e.nom, e.prenom, e.codePermanent, e.age
from etudiant e
where e.age > 30;

# 8. Obtenir les nom, prenom, code permanent et numero de telephone des etudiant 
#    qui ont plus de 35 ans.
select e.nom Nom, e.prenom Prenom, e.codePermanent CodePermanent, e.age Age, t.numero Phone
from etudiant e, telephone t
where e.age > 35
and e.id = t.etudiantId;


```

