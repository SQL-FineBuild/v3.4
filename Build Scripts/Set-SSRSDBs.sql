--  Copyright FineBuild Team © 2011 - 2015.  Distributed under Ms-Pl License

IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'$(strRSDBName)')
  BEGIN
  CREATE DATABASE [$(strRSDBName)] ON (NAME = N'$(strRSDBName)', FILENAME = N'$(strDirData)\$(strRSDBName).mdf', SIZE = 200 MB, FILEGROWTH = 200 MB, MAXSIZE = UNLIMITED) LOG ON (NAME = N'$(strRSDBName)_log', FILENAME = N'$(strDirLog)\$(strRSDBName)_log.LDF', SIZE = 50 MB, FILEGROWTH = 50 MB, MAXSIZE = UNLIMITED) COLLATE Latin1_General_CI_AS_KS_WS
  ALTER  DATABASE [$(strRSDBName)] SET RECOVERY SIMPLE
  END

IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'$(strRSDBName)TempDB')
  BEGIN
  CREATE DATABASE [$(strRSDBName)TempDB] ON (NAME = N'$(strRSDBName)TempDB', FILENAME = N'$(strRSTemp)\$(strRSDBName)TempDB.mdf', SIZE = 100 MB, FILEGROWTH = 100 MB, MAXSIZE = UNLIMITED) LOG ON (NAME = N'$(strRSDBName)TempDB_log', FILENAME = N'$(strDirLog)\$(strRSDBName)TempDB_log.LDF', SIZE = 50 MB, FILEGROWTH = 50 MB, MAXSIZE = UNLIMITED) COLLATE Latin1_General_CI_AS_KS_WS
  ALTER  DATABASE [$(strRSDBName)TempDB] SET RECOVERY SIMPLE
  END


