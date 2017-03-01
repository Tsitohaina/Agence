
create table CLIENT (
   IDCLIENT             SERIAL               not null,
   NOMCLIENT            VARCHAR(35)          not null,
   CONTACTCLIENT        CHAR(20)             not null,
   ADRESSECLIENT        CHAR(40)             not null,
   constraint PK_CLIENT primary key (IDCLIENT)
);


create unique index CLIENT_PK on CLIENT (
IDCLIENT
);


create table RESERVATION (
   IDRESERVATION        SERIAL               not null,
   IDUTILISATEUR        INT4                 not null,
   IDCLIENT             INT4                 not null,
   DATEDEBUT            DATE                 not null,
   DATEFIN              DATE                 not null,
   constraint PK_RESERVATION primary key (IDRESERVATION)
);

create unique index RESERVATION_PK on RESERVATION (
IDRESERVATION
);


create  index ASSOCIATION_1_FK on RESERVATION (
IDUTILISATEUR
);


create  index ASSOCIATION_3_FK on RESERVATION (
IDCLIENT
);


create table RESERVATIONVOITURE (
   IDRESERVATION        INT4                 not null,
   IDVOITURE            INT4                 not null,
   constraint PK_RESERVATIONVOITURE primary key (IDRESERVATION, IDVOITURE)
);


create unique index RESERVATIONVOITURE_PK on RESERVATIONVOITURE (
IDRESERVATION,
IDVOITURE
);


create  index RESERVATIONVOITURE_FK on RESERVATIONVOITURE (
IDRESERVATION
);


create  index RESERVATIONVOITURE2_FK on RESERVATIONVOITURE (
IDVOITURE
);

create table UTILISATEUR (
   IDUTILISATEUR        SERIAL               not null,
   NOMUTILISATEUR       CHAR(30)             not null,
   PRENOMUTILISATEUR    CHAR(30)             not null,
   LOGIN                VARCHAR(20)          not null,
   PASSWORD             VARCHAR(20)          not null,
   constraint PK_UTILISATEUR primary key (IDUTILISATEUR)
);

create unique index UTILISATEUR_PK on UTILISATEUR (
IDUTILISATEUR
);


create table VOITURE (
   IDVOITURE            SERIAL               not null,
   NBPLACE              INT4                 not null,
   PRIX                 NUMERIC              not null,
   constraint PK_VOITURE primary key (IDVOITURE)
);

create unique index VOITURE_PK on VOITURE (
IDVOITURE
);

alter table RESERVATION
   add constraint FK_RESERVAT_ASSOCIATI_UTILISAT foreign key (IDUTILISATEUR)
      references UTILISATEUR (IDUTILISATEUR)
      on delete restrict on update restrict;

alter table RESERVATION
   add constraint FK_RESERVAT_ASSOCIATI_CLIENT foreign key (IDCLIENT)
      references CLIENT (IDCLIENT)
      on delete restrict on update restrict;

alter table RESERVATIONVOITURE
   add constraint FK_RESERVAT_RESERVATI_RESERVAT foreign key (IDRESERVATION)
      references RESERVATION (IDRESERVATION)
      on delete restrict on update restrict;

alter table RESERVATIONVOITURE
   add constraint FK_RESERVAT_RESERVATI_VOITURE foreign key (IDVOITURE)
      references VOITURE (IDVOITURE)
      on delete restrict on update restrict;

