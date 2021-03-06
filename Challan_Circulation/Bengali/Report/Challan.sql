if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Challan]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[Challan]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE VIEW dbo.Challan
AS
SELECT     TOP 100 PERCENT dbo.OEORDH.ORDNUMBER, dbo.OEORDH.ORDUNIQ, dbo.OEORDD.LINENUM, dbo.OEORDH.ORDDATE, dbo.OEORDH.CUSTOMER, 
                      dbo.ARCUS.NAMECUST, dbo.OEORDD.ITEM, dbo.OEORDD.[DESC] AS ItemDescription, dbo.OEORDD.PRICELIST, dbo.OEORDD.QTYORDERED, 
                      dbo.OEChallanSupplimentCopyQuantity.PRICELIST AS PricelistSupplimentary, 
                      dbo.OEChallanSupplimentCopyQuantity.QTYORDERED AS QuantitySupplimentary, dbo.OEChallanAROPT1010_CircultionArea.CirculationAreaValue, 
                      dbo.OEChallanAROPT1010_CircultionArea.CirculationArea, dbo.OEChallanOPT1010_CirculationStation.CirculationStationValue, 
                      dbo.OEChallanOPT1010_CirculationStation.CirculationStation, dbo.OEChallanOPT1020_NewsCopyPacket.NewsCopyValue, 
                      dbo.OEChallanOPT1020_NewsCopyPacket.NewsCopy, dbo.OEChallanOPT1025_SupplimentCopyPacket.SupplimentCopyValue, 
                      dbo.OEChallanOPT1025_SupplimentCopyPacket.SupplimentCopy, dbo.OEChallanOPT1015_NewsSupplimentCopyPacket.NewsSupplimentValue, 
                      dbo.OEChallanOPT1015_NewsSupplimentCopyPacket.NewsSuppliment, 
                      dbo.OEChallanOPT1005_CirculationTransportation.CirculationTransportationValue, 
                      dbo.OEChallanOPT1005_CirculationTransportation.CirculationTransportation
FROM         dbo.OEChallanOPT1015_NewsSupplimentCopyPacket INNER JOIN
                      dbo.OEORDH INNER JOIN
                      dbo.OEORDD ON dbo.OEORDH.ORDUNIQ = dbo.OEORDD.ORDUNIQ INNER JOIN
                      dbo.OEChallanAROPT1010_CircultionArea ON dbo.OEORDH.ORDUNIQ = dbo.OEChallanAROPT1010_CircultionArea.ORDUNIQ INNER JOIN
                      dbo.OEChallanOPT1020_NewsCopyPacket ON dbo.OEORDD.ORDUNIQ = dbo.OEChallanOPT1020_NewsCopyPacket.ORDUNIQ AND 
                      dbo.OEORDD.LINENUM = dbo.OEChallanOPT1020_NewsCopyPacket.LINENUM INNER JOIN
                      dbo.OEChallanOPT1025_SupplimentCopyPacket ON dbo.OEORDD.ORDUNIQ = dbo.OEChallanOPT1025_SupplimentCopyPacket.ORDUNIQ AND 
                      dbo.OEORDD.LINENUM = dbo.OEChallanOPT1025_SupplimentCopyPacket.LINENUM ON 
                      dbo.OEChallanOPT1015_NewsSupplimentCopyPacket.ORDUNIQ = dbo.OEORDD.ORDUNIQ AND 
                      dbo.OEChallanOPT1015_NewsSupplimentCopyPacket.LINENUM = dbo.OEORDD.LINENUM INNER JOIN
                      dbo.OEChallanOPT1005_CirculationTransportation ON 
                      dbo.OEORDD.ORDUNIQ = dbo.OEChallanOPT1005_CirculationTransportation.ORDUNIQ INNER JOIN
                      dbo.ARCUS ON dbo.OEORDH.CUSTOMER = dbo.ARCUS.IDCUST LEFT OUTER JOIN
                      dbo.OEChallanSupplimentCopyQuantity RIGHT OUTER JOIN
                      dbo.OEChallanOPT1010_CirculationStation ON 
                      dbo.OEChallanSupplimentCopyQuantity.ORDUNIQ = dbo.OEChallanOPT1010_CirculationStation.ORDUNIQ AND 
                      dbo.OEChallanSupplimentCopyQuantity.CirculationStationValue = dbo.OEChallanOPT1010_CirculationStation.CirculationStationValue ON 
                      dbo.OEORDD.ORDUNIQ = dbo.OEChallanOPT1010_CirculationStation.ORDUNIQ AND 
                      dbo.OEORDD.LINENUM = dbo.OEChallanOPT1010_CirculationStation.LINENUM
WHERE     (dbo.OEORDD.PRICELIST = '01')
ORDER BY dbo.OEORDH.ORDUNIQ, dbo.OEORDD.LINENUM


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

