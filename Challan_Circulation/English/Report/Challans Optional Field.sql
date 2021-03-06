if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OEChallanAROPT1010_CircultionArea]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[OEChallanAROPT1010_CircultionArea]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OEChallanOPT1005_CirculationTransportation]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[OEChallanOPT1005_CirculationTransportation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OEChallanOPT1010_CirculationStation]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[OEChallanOPT1010_CirculationStation]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OEChallanOPT1015_NewsSupplimentCopyPacket]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[OEChallanOPT1015_NewsSupplimentCopyPacket]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OEChallanOPT1020_NewsCopyPacket]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[OEChallanOPT1020_NewsCopyPacket]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OEChallanOPT1025_SupplimentCopyPacket]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[OEChallanOPT1025_SupplimentCopyPacket]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[OEChallanSupplimentCopyQuantity]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[OEChallanSupplimentCopyQuantity]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.OEChallanAROPT1010_CircultionArea
AS
SELECT     dbo.OEORDHO.ORDUNIQ, dbo.OEORDHO.OPTFIELD, dbo.OEORDHO.[VALUE] AS CirculationAreaValue, dbo.CSOPTFD.VDESC AS CirculationArea
FROM         dbo.OEORDHO INNER JOIN
                      dbo.CSOPTFD ON dbo.OEORDHO.OPTFIELD = dbo.CSOPTFD.OPTFIELD AND dbo.OEORDHO.[VALUE] = dbo.CSOPTFD.[VALUE]
WHERE     (dbo.OEORDHO.OPTFIELD = 'AR1010')



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.OEChallanOPT1005_CirculationTransportation
AS
SELECT     dbo.OEORDHO.ORDUNIQ, dbo.OEORDHO.OPTFIELD, dbo.OEORDHO.[VALUE] AS CirculationTransportationValue, 
                      dbo.CSOPTFD.VDESC AS CirculationTransportation
FROM         dbo.OEORDHO INNER JOIN
                      dbo.CSOPTFD ON dbo.OEORDHO.OPTFIELD = dbo.CSOPTFD.OPTFIELD AND dbo.OEORDHO.[VALUE] = dbo.CSOPTFD.[VALUE]
WHERE     (dbo.OEORDHO.OPTFIELD = 'OE1005')

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.OEChallanOPT1010_CirculationStation
AS
SELECT     TOP 100 PERCENT dbo.OEORDDO.ORDUNIQ, dbo.OEORDDO.LINENUM, dbo.OEORDDO.OPTFIELD, dbo.OEORDDO.[VALUE] AS CirculationStationValue, 
                      dbo.CSOPTFD.VDESC AS CirculationStation
FROM         dbo.OEORDDO INNER JOIN
                      dbo.CSOPTFD ON dbo.OEORDDO.OPTFIELD = dbo.CSOPTFD.OPTFIELD AND dbo.OEORDDO.[VALUE] = dbo.CSOPTFD.[VALUE]
WHERE     (dbo.OEORDDO.OPTFIELD = 'OE1010')
ORDER BY dbo.OEORDDO.ORDUNIQ, dbo.OEORDDO.LINENUM

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.OEChallanOPT1015_NewsSupplimentCopyPacket
AS
SELECT     TOP 100 PERCENT dbo.OEORDDO.ORDUNIQ, dbo.OEORDDO.LINENUM, dbo.OEORDDO.OPTFIELD, dbo.OEORDDO.[VALUE] AS NewsSupplimentValue, 
                      dbo.CSOPTFD.VDESC AS NewsSuppliment
FROM         dbo.OEORDDO INNER JOIN
                      dbo.CSOPTFD ON dbo.OEORDDO.OPTFIELD = dbo.CSOPTFD.OPTFIELD AND dbo.OEORDDO.[VALUE] = dbo.CSOPTFD.[VALUE]
WHERE     (dbo.OEORDDO.OPTFIELD = 'OE1015')
ORDER BY dbo.OEORDDO.ORDUNIQ, dbo.OEORDDO.LINENUM

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.OEChallanOPT1020_NewsCopyPacket
AS
SELECT     TOP 100 PERCENT dbo.OEORDDO.ORDUNIQ, dbo.OEORDDO.LINENUM, dbo.OEORDDO.OPTFIELD, dbo.OEORDDO.[VALUE] AS NewsCopyValue, 
                      dbo.CSOPTFD.VDESC AS NewsCopy
FROM         dbo.OEORDDO INNER JOIN
                      dbo.CSOPTFD ON dbo.OEORDDO.OPTFIELD = dbo.CSOPTFD.OPTFIELD AND dbo.OEORDDO.[VALUE] = dbo.CSOPTFD.[VALUE]
WHERE     (dbo.OEORDDO.OPTFIELD = 'OE1020')
ORDER BY dbo.OEORDDO.ORDUNIQ, dbo.OEORDDO.LINENUM

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.OEChallanOPT1025_SupplimentCopyPacket
AS
SELECT     TOP 100 PERCENT dbo.OEORDDO.ORDUNIQ, dbo.OEORDDO.LINENUM, dbo.OEORDDO.OPTFIELD, dbo.OEORDDO.[VALUE] AS SupplimentCopyValue, 
                      dbo.CSOPTFD.VDESC AS SupplimentCopy
FROM         dbo.OEORDDO INNER JOIN
                      dbo.CSOPTFD ON dbo.OEORDDO.OPTFIELD = dbo.CSOPTFD.OPTFIELD AND dbo.OEORDDO.[VALUE] = dbo.CSOPTFD.[VALUE]
WHERE     (dbo.OEORDDO.OPTFIELD = 'OE1025')
ORDER BY dbo.OEORDDO.ORDUNIQ, dbo.OEORDDO.LINENUM

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE VIEW dbo.OEChallanSupplimentCopyQuantity
AS
SELECT     TOP 100 PERCENT dbo.OEORDD.ORDUNIQ, dbo.OEORDDO.OPTFIELD, dbo.OEORDDO.[VALUE] AS CirculationStationValue, dbo.OEORDD.ITEM, 
                      dbo.OEORDD.[DESC] AS ItemDescription, dbo.OEORDD.PRICELIST, dbo.OEORDD.QTYORDERED
FROM         dbo.OEORDD INNER JOIN
                      dbo.OEORDDO ON dbo.OEORDD.ORDUNIQ = dbo.OEORDDO.ORDUNIQ AND dbo.OEORDD.LINENUM = dbo.OEORDDO.LINENUM
WHERE     (dbo.OEORDD.PRICELIST = '00') AND (dbo.OEORDDO.OPTFIELD = 'OE1010')
ORDER BY dbo.OEORDD.ORDUNIQ

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

