
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/04/2019 23:46:07
-- Generated from EDMX file: C:\Users\sheri\source\repos\LetsFly\LetsFly\Models\LetsFlyModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LetsFlyDb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserRoles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Roles] DROP CONSTRAINT [FK_UserRoles];
GO
IF OBJECT_ID(N'[dbo].[FK_UserBooking]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Bookings] DROP CONSTRAINT [FK_UserBooking];
GO
IF OBJECT_ID(N'[dbo].[FK_BookingPassenger]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Passengers] DROP CONSTRAINT [FK_BookingPassenger];
GO
IF OBJECT_ID(N'[dbo].[FK_UserRating]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ratings] DROP CONSTRAINT [FK_UserRating];
GO
IF OBJECT_ID(N'[dbo].[FK_BookingFlight_Booking]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookingFlight] DROP CONSTRAINT [FK_BookingFlight_Booking];
GO
IF OBJECT_ID(N'[dbo].[FK_BookingFlight_Flight]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookingFlight] DROP CONSTRAINT [FK_BookingFlight_Flight];
GO
IF OBJECT_ID(N'[dbo].[FK_RatingAirline]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ratings] DROP CONSTRAINT [FK_RatingAirline];
GO
IF OBJECT_ID(N'[dbo].[FK_FlightAirport]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Airports] DROP CONSTRAINT [FK_FlightAirport];
GO
IF OBJECT_ID(N'[dbo].[FK_AirlineFlight]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Flights] DROP CONSTRAINT [FK_AirlineFlight];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Roles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Roles];
GO
IF OBJECT_ID(N'[dbo].[Bookings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Bookings];
GO
IF OBJECT_ID(N'[dbo].[Passengers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Passengers];
GO
IF OBJECT_ID(N'[dbo].[Airports]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Airports];
GO
IF OBJECT_ID(N'[dbo].[Airlines]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Airlines];
GO
IF OBJECT_ID(N'[dbo].[Ratings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ratings];
GO
IF OBJECT_ID(N'[dbo].[Flights]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Flights];
GO
IF OBJECT_ID(N'[dbo].[BookingFlight]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BookingFlight];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [PhoneNo] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [UserImg] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [RolesId] int IDENTITY(1,1) NOT NULL,
    [RoleType] nvarchar(max)  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'Bookings'
CREATE TABLE [dbo].[Bookings] (
    [BookingNumber] int IDENTITY(1,1) NOT NULL,
    [Price] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL,
    [PaymentMade] bit  NOT NULL,
    [BillingAddress] nvarchar(max)  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'Passengers'
CREATE TABLE [dbo].[Passengers] (
    [PassengerId] int IDENTITY(1,1) NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Insurance] bit  NOT NULL,
    [ExtraLuggage] bit  NOT NULL,
    [TicketClass] nvarchar(max)  NOT NULL,
    [PassportNo] nvarchar(max)  NOT NULL,
    [BookingNumber] int  NOT NULL
);
GO

-- Creating table 'Airports'
CREATE TABLE [dbo].[Airports] (
    [AirportId] int IDENTITY(1,1) NOT NULL,
    [AirportName] nvarchar(max)  NOT NULL,
    [AirportCode] nvarchar(max)  NOT NULL,
    [AirportLocationName] nvarchar(max)  NOT NULL,
    [AirportLong] nvarchar(max)  NOT NULL,
    [AirportLat] nvarchar(max)  NOT NULL,
    [FlightId] int  NULL
);
GO

-- Creating table 'Airlines'
CREATE TABLE [dbo].[Airlines] (
    [AirlineId] int IDENTITY(1,1) NOT NULL,
    [AirlineName] nvarchar(max)  NOT NULL,
    [AirlineImg] nvarchar(max)  NOT NULL,
    [AirlineCode] nvarchar(max)  NOT NULL,
    [AirlineDescription] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Ratings'
CREATE TABLE [dbo].[Ratings] (
    [RatingId] int IDENTITY(1,1) NOT NULL,
    [RatingNumber] int  NOT NULL,
    [RatingImg] nvarchar(max)  NOT NULL,
    [RatingDate] nvarchar(max)  NOT NULL,
    [RatingDescription] nvarchar(max)  NOT NULL,
    [UserId] int  NOT NULL,
    [AirlineId] int  NOT NULL
);
GO

-- Creating table 'Flights'
CREATE TABLE [dbo].[Flights] (
    [FlightId] int IDENTITY(1,1) NOT NULL,
    [FlightNumber] nvarchar(max)  NOT NULL,
    [DepartureDate] datetime  NOT NULL,
    [ArrivalDate] datetime  NOT NULL,
    [NomimalPrice] nvarchar(max)  NOT NULL,
    [Capacity] int  NOT NULL,
    [Duration] nvarchar(max)  NOT NULL,
    [AirlineId] int  NOT NULL
);
GO

-- Creating table 'BookingFlight'
CREATE TABLE [dbo].[BookingFlight] (
    [Bookings_BookingNumber] int  NOT NULL,
    [Flights_FlightId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [UserId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [RolesId] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([RolesId] ASC);
GO

-- Creating primary key on [BookingNumber] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [PK_Bookings]
    PRIMARY KEY CLUSTERED ([BookingNumber] ASC);
GO

-- Creating primary key on [PassengerId] in table 'Passengers'
ALTER TABLE [dbo].[Passengers]
ADD CONSTRAINT [PK_Passengers]
    PRIMARY KEY CLUSTERED ([PassengerId] ASC);
GO

-- Creating primary key on [AirportId] in table 'Airports'
ALTER TABLE [dbo].[Airports]
ADD CONSTRAINT [PK_Airports]
    PRIMARY KEY CLUSTERED ([AirportId] ASC);
GO

-- Creating primary key on [AirlineId] in table 'Airlines'
ALTER TABLE [dbo].[Airlines]
ADD CONSTRAINT [PK_Airlines]
    PRIMARY KEY CLUSTERED ([AirlineId] ASC);
GO

-- Creating primary key on [RatingId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [PK_Ratings]
    PRIMARY KEY CLUSTERED ([RatingId] ASC);
GO

-- Creating primary key on [FlightId] in table 'Flights'
ALTER TABLE [dbo].[Flights]
ADD CONSTRAINT [PK_Flights]
    PRIMARY KEY CLUSTERED ([FlightId] ASC);
GO

-- Creating primary key on [Bookings_BookingNumber], [Flights_FlightId] in table 'BookingFlight'
ALTER TABLE [dbo].[BookingFlight]
ADD CONSTRAINT [PK_BookingFlight]
    PRIMARY KEY CLUSTERED ([Bookings_BookingNumber], [Flights_FlightId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [FK_UserRoles]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserRoles'
CREATE INDEX [IX_FK_UserRoles]
ON [dbo].[Roles]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'Bookings'
ALTER TABLE [dbo].[Bookings]
ADD CONSTRAINT [FK_UserBooking]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserBooking'
CREATE INDEX [IX_FK_UserBooking]
ON [dbo].[Bookings]
    ([UserId]);
GO

-- Creating foreign key on [BookingNumber] in table 'Passengers'
ALTER TABLE [dbo].[Passengers]
ADD CONSTRAINT [FK_BookingPassenger]
    FOREIGN KEY ([BookingNumber])
    REFERENCES [dbo].[Bookings]
        ([BookingNumber])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookingPassenger'
CREATE INDEX [IX_FK_BookingPassenger]
ON [dbo].[Passengers]
    ([BookingNumber]);
GO

-- Creating foreign key on [UserId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [FK_UserRating]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserRating'
CREATE INDEX [IX_FK_UserRating]
ON [dbo].[Ratings]
    ([UserId]);
GO

-- Creating foreign key on [Bookings_BookingNumber] in table 'BookingFlight'
ALTER TABLE [dbo].[BookingFlight]
ADD CONSTRAINT [FK_BookingFlight_Booking]
    FOREIGN KEY ([Bookings_BookingNumber])
    REFERENCES [dbo].[Bookings]
        ([BookingNumber])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Flights_FlightId] in table 'BookingFlight'
ALTER TABLE [dbo].[BookingFlight]
ADD CONSTRAINT [FK_BookingFlight_Flight]
    FOREIGN KEY ([Flights_FlightId])
    REFERENCES [dbo].[Flights]
        ([FlightId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookingFlight_Flight'
CREATE INDEX [IX_FK_BookingFlight_Flight]
ON [dbo].[BookingFlight]
    ([Flights_FlightId]);
GO

-- Creating foreign key on [AirlineId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [FK_RatingAirline]
    FOREIGN KEY ([AirlineId])
    REFERENCES [dbo].[Airlines]
        ([AirlineId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RatingAirline'
CREATE INDEX [IX_FK_RatingAirline]
ON [dbo].[Ratings]
    ([AirlineId]);
GO

-- Creating foreign key on [FlightId] in table 'Airports'
ALTER TABLE [dbo].[Airports]
ADD CONSTRAINT [FK_FlightAirport]
    FOREIGN KEY ([FlightId])
    REFERENCES [dbo].[Flights]
        ([FlightId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FlightAirport'
CREATE INDEX [IX_FK_FlightAirport]
ON [dbo].[Airports]
    ([FlightId]);
GO

-- Creating foreign key on [AirlineId] in table 'Flights'
ALTER TABLE [dbo].[Flights]
ADD CONSTRAINT [FK_AirlineFlight]
    FOREIGN KEY ([AirlineId])
    REFERENCES [dbo].[Airlines]
        ([AirlineId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AirlineFlight'
CREATE INDEX [IX_FK_AirlineFlight]
ON [dbo].[Flights]
    ([AirlineId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------