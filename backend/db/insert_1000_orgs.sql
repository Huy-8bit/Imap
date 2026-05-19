-- iMapBE — 1000 dummy organizations INSERT
-- Requires imap_schema_full.sql to have been run first
-- All FK IDs mapped from seeded taxonomy rows

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0001', 'HarvestBuild', 'Công ty Cổ phần HarvestBuild Việt Nam', '1958682846', 1995, 1, NULL, 1, 18, FALSE, 1, 2, 'imported'),
    ('ORG0002', 'SparkSystem', 'Công ty TNHH SparkSystem Việt Nam', '5693307665', 2001, 1, NULL, 4, 3, TRUE, 2, 1, 'imported'),
    ('ORG0003', 'GoldenConnect', 'Hợp tác xã GoldenConnect Việt Nam', '5993561321', 2007, 3, NULL, 2, 6, TRUE, 2, NULL, 'imported'),
    ('ORG0004', 'SunriseBuild', 'Công ty TNHH SunriseBuild Việt Nam', '2351531223', 2005, 2, '2024', 4, 19, TRUE, 2, NULL, 'imported'),
    ('ORG0005', 'NovaStudio', 'Công ty TNHH NovaStudio Việt Nam', '6947530309', 2016, 1, NULL, 3, 4, TRUE, 2, NULL, 'imported'),
    ('ORG0006', 'RiverLine', 'Công ty Cổ phần RiverLine Việt Nam', '9592390865', 1999, 1, NULL, 2, 19, TRUE, 1, NULL, 'imported'),
    ('ORG0007', 'AgriMedia', 'Công ty TNHH MTV AgriMedia Việt Nam', '6633778586', 2012, 1, NULL, 2, 19, TRUE, 1, NULL, 'imported'),
    ('ORG0008', 'AquaCore', 'Công ty Cổ phần AquaCore Việt Nam', '3084839399', 2005, 1, NULL, 4, 12, TRUE, 2, NULL, 'imported'),
    ('ORG0009', 'SeedSystem', 'Công ty TNHH SeedSystem Việt Nam', '2067970820', 2007, 1, NULL, 4, 18, TRUE, 1, NULL, 'imported'),
    ('ORG0010', 'SunriseGroup', 'Công ty Cổ phần SunriseGroup Việt Nam', '2627677155', 2001, 1, NULL, 4, 5, TRUE, 1, NULL, 'imported'),
    ('ORG0011', 'CircleLogistics', 'Công ty TNHH CircleLogistics Việt Nam', '1798112150', 2011, 1, NULL, 1, 20, TRUE, 1, NULL, 'imported'),
    ('ORG0012', 'HydroInstitute', 'Hợp tác xã HydroInstitute Việt Nam', '7258731893', 1999, 1, NULL, 2, 17, TRUE, 2, NULL, 'imported'),
    ('ORG0013', 'CycleDynamics', 'Hợp tác xã CycleDynamics Việt Nam', '9623534576', 2009, 1, NULL, 3, 10, TRUE, 1, 2, 'imported'),
    ('ORG0014', 'PearlWorks', 'Hợp tác xã PearlWorks Việt Nam', '8325785916', 2005, 1, NULL, 2, 2, TRUE, 2, NULL, 'imported'),
    ('ORG0015', 'ForestBase', 'Công ty TNHH MTV ForestBase Việt Nam', '4993808565', 1998, 1, NULL, 2, 9, TRUE, 1, 2, 'imported'),
    ('ORG0016', 'SkyHealth', 'Công ty Cổ phần SkyHealth Việt Nam', '9691572571', 2006, 2, '2021', 4, 22, TRUE, 2, 1, 'imported'),
    ('ORG0017', 'CleanVietnam', 'Công ty TNHH MTV CleanVietnam Việt Nam', '6111349421', 2011, 1, NULL, 2, 12, TRUE, 2, NULL, 'imported'),
    ('ORG0018', 'OceanGate', 'Công ty Cổ phần OceanGate Việt Nam', '6118914230', 2017, 1, NULL, 3, 7, TRUE, 2, 1, 'imported'),
    ('ORG0019', 'SafeSystem', 'Công ty TNHH SafeSystem Việt Nam', '4226113732', 2015, 1, NULL, 4, 14, TRUE, 1, 2, 'imported'),
    ('ORG0020', 'AlphaGroup', 'Công ty TNHH MTV AlphaGroup Việt Nam', '4643576871', 2011, 2, '2023', 4, 18, TRUE, 2, 1, 'imported'),
    ('ORG0021', 'LotusBuild', 'Hợp tác xã LotusBuild Việt Nam', '3319936135', 2004, 1, NULL, 4, 14, TRUE, 1, NULL, 'imported'),
    ('ORG0022', 'PioneerFlow', 'Công ty TNHH MTV PioneerFlow Việt Nam', '4856070374', 2007, 1, NULL, 2, 15, TRUE, 1, 2, 'imported'),
    ('ORG0023', 'SolarMedia', 'Doanh nghiệp Tư nhân SolarMedia Việt Nam', '2405969000', 2000, 3, NULL, 4, 1, FALSE, 1, 2, 'imported'),
    ('ORG0024', 'SafeServices', 'Công ty Cổ phần SafeServices Việt Nam', '5837082260', 1995, 1, NULL, 1, 6, FALSE, 2, NULL, 'imported'),
    ('ORG0025', 'PearlSupply', 'Công ty TNHH MTV PearlSupply Việt Nam', '4459716271', 2017, 1, NULL, 4, 4, TRUE, 2, 1, 'imported'),
    ('ORG0026', 'SmartBuild', 'Doanh nghiệp Tư nhân SmartBuild Việt Nam', '6922713963', 2002, 1, NULL, 3, 18, FALSE, 1, 2, 'imported'),
    ('ORG0027', 'SunriseCo', 'Công ty Cổ phần SunriseCo Việt Nam', '7792729530', 2002, 1, NULL, 3, 10, TRUE, 2, NULL, 'imported'),
    ('ORG0028', 'SwiftTrade', 'Công ty TNHH SwiftTrade Việt Nam', '4576111591', 2011, 2, '2024', 3, 5, FALSE, 2, NULL, 'imported'),
    ('ORG0029', 'AquaAsia', 'Doanh nghiệp Tư nhân AquaAsia Việt Nam', '9908115095', 1998, 3, NULL, 2, 17, FALSE, 2, 1, 'imported'),
    ('ORG0030', 'NanoFood', 'Hợp tác xã NanoFood Việt Nam', '3836517266', 2001, 3, NULL, 1, 8, FALSE, 2, 1, 'imported'),
    ('ORG0031', 'FreshCorp', 'Công ty TNHH FreshCorp Việt Nam', '6534540349', 2003, 1, NULL, 1, 20, TRUE, 1, 2, 'imported'),
    ('ORG0032', 'BrightPartners', 'Công ty TNHH BrightPartners Việt Nam', '4248149900', 2022, 1, NULL, 1, 16, TRUE, 2, NULL, 'imported'),
    ('ORG0033', 'SparkGate', 'Công ty TNHH SparkGate Việt Nam', '2953462417', 2007, 1, NULL, 4, 14, TRUE, 1, NULL, 'imported'),
    ('ORG0034', 'TerraMarket', 'Công ty TNHH TerraMarket Việt Nam', '4433026356', 2023, 1, NULL, 4, 4, TRUE, 1, 2, 'imported'),
    ('ORG0035', 'FuturePoint', 'Công ty Cổ phần FuturePoint Việt Nam', '4710967433', 2014, 1, NULL, 3, 19, TRUE, 2, 1, 'imported'),
    ('ORG0036', 'BioNetwork', 'Doanh nghiệp Tư nhân BioNetwork Việt Nam', '8779941999', 2008, 3, NULL, 1, 15, FALSE, 1, 2, 'imported'),
    ('ORG0037', 'MicroVenture', 'Hợp tác xã MicroVenture Việt Nam', '8556573246', 2007, 1, NULL, 4, 4, TRUE, 1, NULL, 'imported'),
    ('ORG0038', 'LotusLink', 'Doanh nghiệp Tư nhân LotusLink Việt Nam', '4403845222', 1999, 1, NULL, 4, 21, TRUE, 2, 1, 'imported'),
    ('ORG0039', 'SkyWater', 'Doanh nghiệp Tư nhân SkyWater Việt Nam', '8960015186', 2009, 1, NULL, 4, 9, TRUE, 1, 2, 'imported'),
    ('ORG0040', 'WindLine', 'Công ty Cổ phần WindLine Việt Nam', '3698305085', 2003, 1, NULL, 3, 11, FALSE, 2, NULL, 'imported'),
    ('ORG0041', 'OceanPoint', 'Hợp tác xã OceanPoint Việt Nam', '4454152476', 2020, 2, '2021', 3, 3, TRUE, 2, NULL, 'imported'),
    ('ORG0042', 'RenewNetwork', 'Công ty TNHH MTV RenewNetwork Việt Nam', '9861449701', 2023, 1, NULL, 4, 4, TRUE, 1, NULL, 'imported'),
    ('ORG0043', 'DigitalFactory', 'Doanh nghiệp Tư nhân DigitalFactory Việt Nam', '2201474778', 2021, 1, NULL, 3, 2, TRUE, 2, NULL, 'imported'),
    ('ORG0044', 'BrightFood', 'Công ty TNHH BrightFood Việt Nam', '3380304322', 2020, 3, NULL, 2, 5, TRUE, 2, 1, 'imported'),
    ('ORG0045', 'UrbanTech', 'Công ty Cổ phần UrbanTech Việt Nam', '2139744790', 2013, 2, '2019', 1, 15, TRUE, 1, 2, 'imported'),
    ('ORG0046', 'NovaFund', 'Công ty TNHH NovaFund Việt Nam', '9202102595', 2007, 1, NULL, 3, 13, FALSE, 2, 1, 'imported'),
    ('ORG0047', 'SeedHub', 'Hợp tác xã SeedHub Việt Nam', '7127904756', 2008, 2, '2021', 4, 4, TRUE, 2, 1, 'imported'),
    ('ORG0048', 'SkyPlus', 'Công ty TNHH SkyPlus Việt Nam', '1913706213', 2014, 3, NULL, 2, 14, FALSE, 1, 2, 'imported'),
    ('ORG0049', 'SunriseCorp', 'Công ty Cổ phần SunriseCorp Việt Nam', '5173893550', 2016, 1, NULL, 3, 19, FALSE, 1, 2, 'imported'),
    ('ORG0050', 'PioneerBuild', 'Công ty Cổ phần PioneerBuild Việt Nam', '5783809766', 2009, 1, NULL, 1, 1, FALSE, 1, NULL, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0051', 'MountainFlow', 'Công ty Cổ phần MountainFlow Việt Nam', '8757570742', 1999, 2, '2019', 4, 19, FALSE, 2, 1, 'imported'),
    ('ORG0052', 'BlueEdu', 'Doanh nghiệp Tư nhân BlueEdu Việt Nam', '7824150224', 2022, 1, NULL, 1, 17, TRUE, 1, 2, 'imported'),
    ('ORG0053', 'FreshLine', 'Công ty TNHH FreshLine Việt Nam', '7417183769', 2014, 1, NULL, 4, 21, TRUE, 2, 1, 'imported'),
    ('ORG0054', 'OceanCorp', 'Công ty TNHH OceanCorp Việt Nam', '7472806994', 2021, 1, NULL, 4, 17, FALSE, 1, 2, 'imported'),
    ('ORG0055', 'PrimeLink', 'Công ty TNHH MTV PrimeLink Việt Nam', '3619094295', 2009, 1, NULL, 3, 3, TRUE, 2, NULL, 'imported'),
    ('ORG0056', 'MicroCo', 'Doanh nghiệp Tư nhân MicroCo Việt Nam', '5658832688', 2004, 3, NULL, 1, 21, TRUE, 2, 1, 'imported'),
    ('ORG0057', 'AquaTrade', 'Công ty TNHH AquaTrade Việt Nam', '3261436148', 1999, 3, NULL, 2, 15, TRUE, 1, NULL, 'imported'),
    ('ORG0058', 'OmegaWater', 'Hợp tác xã OmegaWater Việt Nam', '7187318744', 2020, 1, NULL, 1, 21, TRUE, 2, 1, 'imported'),
    ('ORG0059', 'FutureServices', 'Doanh nghiệp Tư nhân FutureServices Việt Nam', '4910589015', 2009, 1, NULL, 3, 8, FALSE, 1, NULL, 'imported'),
    ('ORG0060', 'PureLine', 'Doanh nghiệp Tư nhân PureLine Việt Nam', '1340272119', 2021, 2, '2023', 2, 10, TRUE, 1, NULL, 'imported'),
    ('ORG0061', 'FloraServices', 'Hợp tác xã FloraServices Việt Nam', '2843567009', 2002, 1, NULL, 1, 13, TRUE, 2, NULL, 'imported'),
    ('ORG0062', 'PearlPartners', 'Hợp tác xã PearlPartners Việt Nam', '1572989855', 1998, 2, '2023', 2, 5, FALSE, 1, 2, 'imported'),
    ('ORG0063', 'SparkInstitute', 'Công ty Cổ phần SparkInstitute Việt Nam', '6523804237', 1996, 1, NULL, 4, 13, TRUE, 2, 1, 'imported'),
    ('ORG0064', 'TechFlow', 'Hợp tác xã TechFlow Việt Nam', '2379592595', 2021, 1, NULL, 3, 15, TRUE, 1, 2, 'imported'),
    ('ORG0065', 'HarvestFund', 'Công ty Cổ phần HarvestFund Việt Nam', '5092199300', 2020, 1, NULL, 4, 19, TRUE, 1, 2, 'imported'),
    ('ORG0066', 'LotusLab', 'Công ty TNHH LotusLab Việt Nam', '4159699467', 2003, 1, NULL, 3, 16, TRUE, 1, NULL, 'imported'),
    ('ORG0067', 'SkyLogistics', 'Công ty Cổ phần SkyLogistics Việt Nam', '8703867299', 2004, 1, NULL, 3, 15, FALSE, 1, 2, 'imported'),
    ('ORG0068', 'AquaLocal', 'Doanh nghiệp Tư nhân AquaLocal Việt Nam', '2479679716', 2015, 3, NULL, 2, 10, TRUE, 1, NULL, 'imported'),
    ('ORG0069', 'SkyFactory', 'Công ty TNHH MTV SkyFactory Việt Nam', '9991206531', 2015, 1, NULL, 1, 1, TRUE, 1, NULL, 'imported'),
    ('ORG0070', 'OceanInstitute', 'Hợp tác xã OceanInstitute Việt Nam', '3074232200', 2012, 3, NULL, 3, 20, TRUE, 1, NULL, 'imported'),
    ('ORG0071', 'CleanBuild', 'Doanh nghiệp Tư nhân CleanBuild Việt Nam', '2064803502', 2009, 1, NULL, 3, 19, FALSE, 2, NULL, 'imported'),
    ('ORG0072', 'LotusFood', 'Công ty TNHH MTV LotusFood Việt Nam', '2515672889', 2009, 1, NULL, 3, 13, FALSE, 2, NULL, 'imported'),
    ('ORG0073', 'WindFactory', 'Công ty TNHH WindFactory Việt Nam', '5710211115', 2014, 1, NULL, 4, 17, FALSE, 1, NULL, 'imported'),
    ('ORG0074', 'AgriAsia', 'Công ty TNHH MTV AgriAsia Việt Nam', '7581349462', 2005, 3, NULL, 1, 20, TRUE, 2, NULL, 'imported'),
    ('ORG0075', 'PearlVietnam', 'Công ty Cổ phần PearlVietnam Việt Nam', '2040226318', 2014, 1, NULL, 4, 2, TRUE, 1, 2, 'imported'),
    ('ORG0076', 'SeedFund', 'Hợp tác xã SeedFund Việt Nam', '7915226263', 2019, 1, NULL, 2, 16, FALSE, 2, 1, 'imported'),
    ('ORG0077', 'SmartPlus', 'Doanh nghiệp Tư nhân SmartPlus Việt Nam', '8112345816', 2017, 1, NULL, 2, 8, TRUE, 1, 2, 'imported'),
    ('ORG0078', 'PureFarm', 'Công ty TNHH MTV PureFarm Việt Nam', '5973319056', 2019, 1, NULL, 2, 18, TRUE, 1, 2, 'imported'),
    ('ORG0079', 'SkyZone', 'Công ty TNHH MTV SkyZone Việt Nam', '9516893896', 1995, 3, NULL, 3, 6, FALSE, 2, 1, 'imported'),
    ('ORG0080', 'SunriseAlliance', 'Công ty TNHH SunriseAlliance Việt Nam', '5898890707', 1997, 1, NULL, 3, 19, TRUE, 1, NULL, 'imported'),
    ('ORG0081', 'FloraBase', 'Hợp tác xã FloraBase Việt Nam', '3964774623', 2011, 1, NULL, 3, 14, TRUE, 2, 1, 'imported'),
    ('ORG0082', 'CleanGroup', 'Công ty TNHH MTV CleanGroup Việt Nam', '3304937838', 2013, 1, NULL, 4, 2, TRUE, 2, NULL, 'imported'),
    ('ORG0083', 'ClearCorp', 'Công ty TNHH ClearCorp Việt Nam', '7114733717', 2001, 1, NULL, 2, 21, TRUE, 2, NULL, 'imported'),
    ('ORG0084', 'SunriseLink', 'Công ty Cổ phần SunriseLink Việt Nam', '6576426590', 1998, 3, NULL, 1, 2, FALSE, 2, 1, 'imported'),
    ('ORG0085', 'SolarEdu', 'Công ty TNHH SolarEdu Việt Nam', '7022683808', 2017, 1, NULL, 3, 19, TRUE, 2, NULL, 'imported'),
    ('ORG0086', 'HarvestEnergy', 'Doanh nghiệp Tư nhân HarvestEnergy Việt Nam', '7682327733', 2013, 1, NULL, 4, 6, FALSE, 2, NULL, 'imported'),
    ('ORG0087', 'MountainEdu', 'Hợp tác xã MountainEdu Việt Nam', '6168291913', 1999, 1, NULL, 4, 22, TRUE, 1, 2, 'imported'),
    ('ORG0088', 'MekongWater', 'Công ty TNHH MekongWater Việt Nam', '8534793156', 1995, 3, NULL, 4, 18, TRUE, 2, NULL, 'imported'),
    ('ORG0089', 'BioZone', 'Công ty Cổ phần BioZone Việt Nam', '4183654731', 2008, 1, NULL, 4, 18, TRUE, 2, NULL, 'imported'),
    ('ORG0090', 'CycleInstitute', 'Công ty TNHH CycleInstitute Việt Nam', '3250324141', 2000, 2, '2021', 2, 1, FALSE, 1, 2, 'imported'),
    ('ORG0091', 'GoldenFlow', 'Hợp tác xã GoldenFlow Việt Nam', '9663561486', 2018, 1, NULL, 3, 12, TRUE, 2, 1, 'imported'),
    ('ORG0092', 'MicroLine', 'Công ty TNHH MicroLine Việt Nam', '5696548897', 2022, 1, NULL, 4, 21, TRUE, 2, 1, 'imported'),
    ('ORG0093', 'AquaFund', 'Hợp tác xã AquaFund Việt Nam', '1141312095', 1996, 1, NULL, 1, 10, TRUE, 1, 2, 'imported'),
    ('ORG0094', 'DeltaCorp', 'Hợp tác xã DeltaCorp Việt Nam', '7853087029', 2008, 1, NULL, 4, 14, FALSE, 1, 2, 'imported'),
    ('ORG0095', 'NanoServices', 'Doanh nghiệp Tư nhân NanoServices Việt Nam', '6655089949', 2020, 1, NULL, 4, 15, FALSE, 2, NULL, 'imported'),
    ('ORG0096', 'BrightLink', 'Công ty Cổ phần BrightLink Việt Nam', '8238377072', 2020, 2, '2022', 3, 16, TRUE, 1, NULL, 'imported'),
    ('ORG0097', 'SafeVietnam', 'Hợp tác xã SafeVietnam Việt Nam', '7185710340', 2005, 3, NULL, 2, 13, TRUE, 2, NULL, 'imported'),
    ('ORG0098', 'BrightWater', 'Công ty TNHH MTV BrightWater Việt Nam', '8418324922', 1998, 2, '2020', 4, 5, TRUE, 2, NULL, 'imported'),
    ('ORG0099', 'TerraPacific', 'Công ty TNHH MTV TerraPacific Việt Nam', '9454334062', 2022, 1, NULL, 4, 11, FALSE, 2, NULL, 'imported'),
    ('ORG0100', 'ForestTech', 'Doanh nghiệp Tư nhân ForestTech Việt Nam', '5744003377', 2017, 2, '2022', 4, 7, FALSE, 2, NULL, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0101', 'WindLogistics', 'Công ty Cổ phần WindLogistics Việt Nam', '3216176949', 1998, 2, '2023', 4, 13, TRUE, 1, 2, 'imported'),
    ('ORG0102', 'AquaZone', 'Công ty TNHH AquaZone Việt Nam', '3305920746', 2020, 2, '2024', 3, 20, TRUE, 2, 1, 'imported'),
    ('ORG0103', 'SkyLab', 'Công ty Cổ phần SkyLab Việt Nam', '6963404324', 2002, 1, NULL, 2, 16, TRUE, 2, NULL, 'imported'),
    ('ORG0104', 'MicroMarket', 'Doanh nghiệp Tư nhân MicroMarket Việt Nam', '8235717104', 2011, 2, '2022', 3, 2, FALSE, 2, NULL, 'imported'),
    ('ORG0105', 'CycleFood', 'Doanh nghiệp Tư nhân CycleFood Việt Nam', '4227004325', 2014, 2, '2018', 1, 8, TRUE, 1, 2, 'imported'),
    ('ORG0106', 'SwiftFlow', 'Công ty Cổ phần SwiftFlow Việt Nam', '8318855178', 2003, 1, NULL, 2, 5, TRUE, 1, NULL, 'imported'),
    ('ORG0107', 'PearlVenture', 'Doanh nghiệp Tư nhân PearlVenture Việt Nam', '6880115912', 2015, 1, NULL, 3, 3, TRUE, 2, NULL, 'imported'),
    ('ORG0108', 'DigitalSystem', 'Công ty TNHH DigitalSystem Việt Nam', '1197323378', 2013, 1, NULL, 2, 5, TRUE, 2, NULL, 'imported'),
    ('ORG0109', 'NanoSupply', 'Công ty Cổ phần NanoSupply Việt Nam', '9981632126', 2007, 1, NULL, 4, 1, TRUE, 1, 2, 'imported'),
    ('ORG0110', 'BlueHub', 'Hợp tác xã BlueHub Việt Nam', '2285291868', 2020, 1, NULL, 2, 15, TRUE, 2, 1, 'imported'),
    ('ORG0111', 'UrbanWorks', 'Công ty Cổ phần UrbanWorks Việt Nam', '1361845490', 2008, 1, NULL, 2, 13, TRUE, 2, 1, 'imported'),
    ('ORG0112', 'WindEnergy', 'Doanh nghiệp Tư nhân WindEnergy Việt Nam', '4308701294', 2012, 1, NULL, 3, 21, TRUE, 2, NULL, 'imported'),
    ('ORG0113', 'FreshFlow', 'Hợp tác xã FreshFlow Việt Nam', '5578929439', 2001, 1, NULL, 1, 10, TRUE, 1, NULL, 'imported'),
    ('ORG0114', 'HarvestBase', 'Hợp tác xã HarvestBase Việt Nam', '4865030023', 1999, 1, NULL, 4, 15, TRUE, 2, NULL, 'imported'),
    ('ORG0115', 'CleanHealth', 'Công ty TNHH MTV CleanHealth Việt Nam', '1011031667', 2018, 1, NULL, 4, 8, TRUE, 2, NULL, 'imported'),
    ('ORG0116', 'TechHealth', 'Công ty TNHH MTV TechHealth Việt Nam', '5215140451', 1996, 1, NULL, 4, 1, TRUE, 2, NULL, 'imported'),
    ('ORG0117', 'VietAgency', 'Công ty TNHH MTV VietAgency Việt Nam', '2052811909', 2019, 3, NULL, 3, 1, FALSE, 2, 1, 'imported'),
    ('ORG0118', 'CirclePacific', 'Hợp tác xã CirclePacific Việt Nam', '4212203479', 2002, 1, NULL, 2, 10, TRUE, 2, 1, 'imported'),
    ('ORG0119', 'BlueServices', 'Công ty TNHH BlueServices Việt Nam', '6000952470', 2019, 1, NULL, 3, 4, TRUE, 1, NULL, 'imported'),
    ('ORG0120', 'ForestAsia', 'Công ty TNHH MTV ForestAsia Việt Nam', '9800175892', 2002, 1, NULL, 2, 4, TRUE, 2, NULL, 'imported'),
    ('ORG0121', 'NanoInstitute', 'Công ty TNHH NanoInstitute Việt Nam', '4490722186', 2016, 2, '2020', 1, 2, TRUE, 2, NULL, 'imported'),
    ('ORG0122', 'GoldenBuild', 'Doanh nghiệp Tư nhân GoldenBuild Việt Nam', '4794276323', 2000, 1, NULL, 1, 9, FALSE, 2, NULL, 'imported'),
    ('ORG0123', 'ForestZone', 'Công ty TNHH MTV ForestZone Việt Nam', '6676247763', 2010, 1, NULL, 4, 17, TRUE, 2, 1, 'imported'),
    ('ORG0124', 'MountainPlus', 'Công ty Cổ phần MountainPlus Việt Nam', '1756345332', 2020, 1, NULL, 2, 19, TRUE, 1, 2, 'imported'),
    ('ORG0125', 'CircleCapital', 'Công ty TNHH CircleCapital Việt Nam', '3637688758', 1995, 1, NULL, 2, 4, TRUE, 2, 1, 'imported'),
    ('ORG0126', 'SeedGlobal', 'Doanh nghiệp Tư nhân SeedGlobal Việt Nam', '8083175325', 2000, 1, NULL, 3, 5, TRUE, 1, 2, 'imported'),
    ('ORG0127', 'BlueMarket', 'Công ty Cổ phần BlueMarket Việt Nam', '1334176969', 2013, 1, NULL, 3, 15, FALSE, 1, NULL, 'imported'),
    ('ORG0128', 'SolarVietnam', 'Doanh nghiệp Tư nhân SolarVietnam Việt Nam', '8441393731', 1995, 1, NULL, 2, 6, TRUE, 2, NULL, 'imported'),
    ('ORG0129', 'SeedCorp', 'Công ty TNHH MTV SeedCorp Việt Nam', '5200656353', 2000, 3, NULL, 2, 2, TRUE, 1, NULL, 'imported'),
    ('ORG0130', 'DigitalServices', 'Công ty TNHH DigitalServices Việt Nam', '2549748436', 2012, 1, NULL, 4, 4, TRUE, 2, 1, 'imported'),
    ('ORG0131', 'TechLocal', 'Công ty TNHH TechLocal Việt Nam', '6425814872', 2006, 3, NULL, 3, 18, TRUE, 2, 1, 'imported'),
    ('ORG0132', 'FloraSolutions', 'Công ty TNHH MTV FloraSolutions Việt Nam', '1633282877', 2022, 1, NULL, 4, 7, TRUE, 1, 2, 'imported'),
    ('ORG0133', 'GoldenLink', 'Doanh nghiệp Tư nhân GoldenLink Việt Nam', '8652281649', 2005, 1, NULL, 1, 10, TRUE, 2, 1, 'imported'),
    ('ORG0134', 'SunriseSolutions', 'Doanh nghiệp Tư nhân SunriseSolutions Việt Nam', '2020395327', 2017, 1, NULL, 1, 8, TRUE, 1, NULL, 'imported'),
    ('ORG0135', 'PioneerPoint', 'Doanh nghiệp Tư nhân PioneerPoint Việt Nam', '9019515562', 2001, 1, NULL, 1, 6, TRUE, 1, 2, 'imported'),
    ('ORG0136', 'NanoLab', 'Công ty TNHH NanoLab Việt Nam', '6334083514', 2007, 2, '2022', 1, 10, FALSE, 1, NULL, 'imported'),
    ('ORG0137', 'PioneerCore', 'Công ty TNHH PioneerCore Việt Nam', '3930025537', 2015, 1, NULL, 3, 14, FALSE, 2, 1, 'imported'),
    ('ORG0138', 'WindHub', 'Doanh nghiệp Tư nhân WindHub Việt Nam', '5569145346', 2004, 1, NULL, 2, 17, TRUE, 1, 2, 'imported'),
    ('ORG0139', 'ClearDynamics', 'Công ty TNHH MTV ClearDynamics Việt Nam', '4504756453', 1996, 1, NULL, 3, 17, FALSE, 2, 1, 'imported'),
    ('ORG0140', 'SkyPacific', 'Hợp tác xã SkyPacific Việt Nam', '6891331174', 2018, 1, NULL, 1, 16, TRUE, 1, 2, 'imported'),
    ('ORG0141', 'AlphaServices', 'Hợp tác xã AlphaServices Việt Nam', '5642049890', 2023, 3, NULL, 2, 16, TRUE, 1, NULL, 'imported'),
    ('ORG0142', 'UrbanLine', 'Công ty TNHH MTV UrbanLine Việt Nam', '1818520766', 2023, 3, NULL, 3, 6, TRUE, 1, 2, 'imported'),
    ('ORG0143', 'SparkWater', 'Công ty Cổ phần SparkWater Việt Nam', '2732553940', 2006, 3, NULL, 1, 13, TRUE, 2, 1, 'imported'),
    ('ORG0144', 'CleanPacific', 'Doanh nghiệp Tư nhân CleanPacific Việt Nam', '2633177480', 2017, 2, '2018', 1, 22, TRUE, 2, 1, 'imported'),
    ('ORG0145', 'SwiftWater', 'Hợp tác xã SwiftWater Việt Nam', '5179517389', 2001, 1, NULL, 3, 8, FALSE, 1, NULL, 'imported'),
    ('ORG0146', 'DeltaConnect', 'Hợp tác xã DeltaConnect Việt Nam', '6429375645', 2015, 3, NULL, 4, 4, FALSE, 1, 2, 'imported'),
    ('ORG0147', 'RiverSystem', 'Công ty Cổ phần RiverSystem Việt Nam', '5783872028', 1997, 3, NULL, 2, 4, TRUE, 1, 2, 'imported'),
    ('ORG0148', 'PearlPlus', 'Công ty TNHH MTV PearlPlus Việt Nam', '5856127658', 2007, 1, NULL, 2, 22, TRUE, 2, 1, 'imported'),
    ('ORG0149', 'GreenInstitute', 'Công ty Cổ phần GreenInstitute Việt Nam', '1710404224', 1996, 2, '2022', 2, 3, TRUE, 2, NULL, 'imported'),
    ('ORG0150', 'BioGate', 'Công ty TNHH MTV BioGate Việt Nam', '8178927766', 2008, 1, NULL, 4, 22, FALSE, 2, 1, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0151', 'CirclePro', 'Công ty TNHH CirclePro Việt Nam', '6000009225', 2020, 1, NULL, 2, 15, TRUE, 1, 2, 'imported'),
    ('ORG0152', 'PrimeConnect', 'Công ty TNHH MTV PrimeConnect Việt Nam', '3142452709', 2023, 1, NULL, 2, 5, TRUE, 1, NULL, 'imported'),
    ('ORG0153', 'PrimeWorks', 'Công ty Cổ phần PrimeWorks Việt Nam', '8991678061', 2004, 3, NULL, 2, 17, TRUE, 2, 1, 'imported'),
    ('ORG0154', 'HydroGroup', 'Công ty Cổ phần HydroGroup Việt Nam', '4373835078', 1996, 1, NULL, 1, 12, TRUE, 2, NULL, 'imported'),
    ('ORG0155', 'MountainVietnam', 'Doanh nghiệp Tư nhân MountainVietnam Việt Nam', '3371357111', 1996, 1, NULL, 3, 19, FALSE, 1, 2, 'imported'),
    ('ORG0156', 'RenewMedia', 'Công ty Cổ phần RenewMedia Việt Nam', '8928570600', 2003, 1, NULL, 3, 16, TRUE, 2, NULL, 'imported'),
    ('ORG0157', 'DeltaFood', 'Hợp tác xã DeltaFood Việt Nam', '6716887234', 2007, 1, NULL, 3, 15, TRUE, 1, 2, 'imported'),
    ('ORG0158', 'EcoLink', 'Hợp tác xã EcoLink Việt Nam', '7479970041', 2004, 1, NULL, 2, 18, TRUE, 1, 2, 'imported'),
    ('ORG0159', 'AlphaDynamics', 'Hợp tác xã AlphaDynamics Việt Nam', '1162720486', 1995, 2, '2019', 4, 15, FALSE, 2, NULL, 'imported'),
    ('ORG0160', 'FutureHub', 'Hợp tác xã FutureHub Việt Nam', '5666504394', 2006, 2, '2018', 3, 21, TRUE, 1, NULL, 'imported'),
    ('ORG0161', 'SwiftAsia', 'Công ty TNHH MTV SwiftAsia Việt Nam', '5660584367', 2013, 1, NULL, 2, 8, FALSE, 2, NULL, 'imported'),
    ('ORG0162', 'BambooHub', 'Công ty Cổ phần BambooHub Việt Nam', '6715961218', 1997, 1, NULL, 4, 11, TRUE, 2, 1, 'imported'),
    ('ORG0163', 'MicroGlobal', 'Hợp tác xã MicroGlobal Việt Nam', '8903212516', 2018, 2, '2023', 1, 6, TRUE, 1, 2, 'imported'),
    ('ORG0164', 'MekongSolutions', 'Công ty TNHH MTV MekongSolutions Việt Nam', '7612862866', 2007, 2, '2022', 1, 13, TRUE, 2, 1, 'imported'),
    ('ORG0165', 'HydroServices', 'Doanh nghiệp Tư nhân HydroServices Việt Nam', '9328694308', 2013, 1, NULL, 2, 17, TRUE, 2, NULL, 'imported'),
    ('ORG0166', 'GoldenPoint', 'Hợp tác xã GoldenPoint Việt Nam', '3448819206', 2015, 3, NULL, 2, 17, TRUE, 2, NULL, 'imported'),
    ('ORG0167', 'GoldenFood', 'Công ty Cổ phần GoldenFood Việt Nam', '1802753761', 2015, 1, NULL, 4, 16, FALSE, 1, 2, 'imported'),
    ('ORG0168', 'FreshGroup', 'Công ty Cổ phần FreshGroup Việt Nam', '9410569618', 2011, 1, NULL, 2, 8, TRUE, 2, 1, 'imported'),
    ('ORG0169', 'PureHub', 'Công ty TNHH PureHub Việt Nam', '1413599241', 2007, 1, NULL, 2, 20, TRUE, 1, 2, 'imported'),
    ('ORG0170', 'ClearPoint', 'Công ty TNHH MTV ClearPoint Việt Nam', '5714658227', 2019, 2, '2024', 2, 1, TRUE, 1, 2, 'imported'),
    ('ORG0171', 'ClearMedia', 'Hợp tác xã ClearMedia Việt Nam', '8218146534', 2015, 1, NULL, 3, 13, TRUE, 1, 2, 'imported'),
    ('ORG0172', 'WindDynamics', 'Công ty TNHH WindDynamics Việt Nam', '5985331805', 2017, 2, '2022', 2, 12, TRUE, 1, 2, 'imported'),
    ('ORG0173', 'HydroLink', 'Hợp tác xã HydroLink Việt Nam', '1836429847', 2022, 1, NULL, 2, 3, TRUE, 2, 1, 'imported'),
    ('ORG0174', 'RenewPartners', 'Hợp tác xã RenewPartners Việt Nam', '8797577040', 2018, 1, NULL, 1, 18, TRUE, 1, 2, 'imported'),
    ('ORG0175', 'WindConnect', 'Công ty TNHH MTV WindConnect Việt Nam', '4702361794', 2009, 2, '2024', 3, 14, TRUE, 2, 1, 'imported'),
    ('ORG0176', 'OmegaNetwork', 'Hợp tác xã OmegaNetwork Việt Nam', '7759044245', 2000, 1, NULL, 2, 8, FALSE, 1, 2, 'imported'),
    ('ORG0177', 'OmegaPro', 'Công ty TNHH MTV OmegaPro Việt Nam', '6649672597', 2022, 3, NULL, 4, 16, TRUE, 1, 2, 'imported'),
    ('ORG0178', 'MekongVietnam', 'Công ty TNHH MTV MekongVietnam Việt Nam', '5727675931', 2016, 1, NULL, 3, 12, TRUE, 1, 2, 'imported'),
    ('ORG0179', 'WindHealth', 'Công ty TNHH WindHealth Việt Nam', '8390846127', 2013, 1, NULL, 2, 14, TRUE, 2, NULL, 'imported'),
    ('ORG0180', 'TerraLogistics', 'Công ty TNHH TerraLogistics Việt Nam', '6387133174', 1998, 1, NULL, 3, 1, TRUE, 2, NULL, 'imported'),
    ('ORG0181', 'DigitalBase', 'Doanh nghiệp Tư nhân DigitalBase Việt Nam', '4820942294', 2011, 1, NULL, 4, 21, FALSE, 2, 1, 'imported'),
    ('ORG0182', 'PrimeBase', 'Hợp tác xã PrimeBase Việt Nam', '7228942343', 2003, 1, NULL, 1, 7, FALSE, 1, NULL, 'imported'),
    ('ORG0183', 'SmartInstitute', 'Doanh nghiệp Tư nhân SmartInstitute Việt Nam', '2328736852', 1999, 1, NULL, 3, 11, TRUE, 2, 1, 'imported'),
    ('ORG0184', 'NanoFlow', 'Hợp tác xã NanoFlow Việt Nam', '9198762527', 2015, 1, NULL, 1, 17, TRUE, 1, NULL, 'imported'),
    ('ORG0185', 'SwiftHealth', 'Công ty TNHH SwiftHealth Việt Nam', '7649520759', 2004, 2, '2024', 2, 9, FALSE, 1, NULL, 'imported'),
    ('ORG0186', 'AquaEnergy', 'Công ty Cổ phần AquaEnergy Việt Nam', '2243802345', 2022, 1, NULL, 1, 18, FALSE, 1, NULL, 'imported'),
    ('ORG0187', 'SkyMarket', 'Hợp tác xã SkyMarket Việt Nam', '4399143287', 2008, 1, NULL, 2, 9, TRUE, 2, 1, 'imported'),
    ('ORG0188', 'HydroFood', 'Doanh nghiệp Tư nhân HydroFood Việt Nam', '9423349548', 2011, 2, '2018', 3, 7, TRUE, 2, 1, 'imported'),
    ('ORG0189', 'ClearCo', 'Doanh nghiệp Tư nhân ClearCo Việt Nam', '5960652625', 1996, 2, '2018', 1, 2, FALSE, 2, 1, 'imported'),
    ('ORG0190', 'PureMedia', 'Công ty TNHH PureMedia Việt Nam', '8288721755', 2018, 1, NULL, 2, 3, TRUE, 1, NULL, 'imported'),
    ('ORG0191', 'SafePro', 'Công ty TNHH MTV SafePro Việt Nam', '6320547759', 1995, 1, NULL, 3, 11, FALSE, 2, 1, 'imported'),
    ('ORG0192', 'DigitalWater', 'Công ty TNHH DigitalWater Việt Nam', '9726588217', 1998, 1, NULL, 2, 21, TRUE, 2, 1, 'imported'),
    ('ORG0193', 'SkyCorp', 'Công ty Cổ phần SkyCorp Việt Nam', '1417124022', 1996, 1, NULL, 4, 4, TRUE, 2, 1, 'imported'),
    ('ORG0194', 'PrimePlus', 'Hợp tác xã PrimePlus Việt Nam', '9576406794', 2014, 1, NULL, 4, 18, TRUE, 2, NULL, 'imported'),
    ('ORG0195', 'SkyFarm', 'Hợp tác xã SkyFarm Việt Nam', '5227941857', 2023, 1, NULL, 2, 4, FALSE, 1, 2, 'imported'),
    ('ORG0196', 'SeedNetwork', 'Doanh nghiệp Tư nhân SeedNetwork Việt Nam', '6037577831', 2001, 1, NULL, 1, 11, TRUE, 2, 1, 'imported'),
    ('ORG0197', 'UrbanFlow', 'Công ty TNHH MTV UrbanFlow Việt Nam', '5937408591', 1996, 1, NULL, 1, 8, TRUE, 2, NULL, 'imported'),
    ('ORG0198', 'SmartAsia', 'Công ty TNHH MTV SmartAsia Việt Nam', '3997331061', 2003, 1, NULL, 2, 8, TRUE, 1, NULL, 'imported'),
    ('ORG0199', 'UrbanPlus', 'Công ty TNHH MTV UrbanPlus Việt Nam', '3814963909', 2001, 1, NULL, 1, 8, TRUE, 1, 2, 'imported'),
    ('ORG0200', 'OceanFarm', 'Hợp tác xã OceanFarm Việt Nam', '5772902637', 1999, 1, NULL, 4, 20, TRUE, 1, 2, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0201', 'TerraFactory', 'Hợp tác xã TerraFactory Việt Nam', '5522966707', 2020, 1, NULL, 3, 21, TRUE, 2, NULL, 'imported'),
    ('ORG0202', 'VietCore', 'Doanh nghiệp Tư nhân VietCore Việt Nam', '4060031897', 2000, 1, NULL, 3, 12, TRUE, 2, NULL, 'imported'),
    ('ORG0203', 'FreshSystem', 'Doanh nghiệp Tư nhân FreshSystem Việt Nam', '3821500440', 2002, 3, NULL, 3, 15, FALSE, 1, NULL, 'imported'),
    ('ORG0204', 'PearlServices', 'Công ty TNHH MTV PearlServices Việt Nam', '4938966574', 2008, 3, NULL, 4, 14, TRUE, 2, NULL, 'imported'),
    ('ORG0205', 'SafeFactory', 'Hợp tác xã SafeFactory Việt Nam', '3630074869', 2019, 1, NULL, 4, 21, TRUE, 2, NULL, 'imported'),
    ('ORG0206', 'PioneerHealth', 'Công ty Cổ phần PioneerHealth Việt Nam', '4254625665', 2003, 2, '2018', 4, 13, TRUE, 1, 2, 'imported'),
    ('ORG0207', 'CircleFlow', 'Doanh nghiệp Tư nhân CircleFlow Việt Nam', '9758519013', 2002, 3, NULL, 4, 6, TRUE, 2, NULL, 'imported'),
    ('ORG0208', 'TerraFlow', 'Công ty Cổ phần TerraFlow Việt Nam', '6983175999', 2000, 2, '2018', 1, 9, TRUE, 2, 1, 'imported'),
    ('ORG0209', 'SeedCore', 'Công ty TNHH MTV SeedCore Việt Nam', '5079161918', 2007, 1, NULL, 2, 5, TRUE, 1, 2, 'imported'),
    ('ORG0210', 'GreenConnect', 'Doanh nghiệp Tư nhân GreenConnect Việt Nam', '8968929797', 2003, 1, NULL, 1, 20, TRUE, 1, NULL, 'imported'),
    ('ORG0211', 'FreshSolutions', 'Công ty TNHH MTV FreshSolutions Việt Nam', '6576763981', 1996, 1, NULL, 2, 15, TRUE, 2, 1, 'imported'),
    ('ORG0212', 'TerraBuild', 'Hợp tác xã TerraBuild Việt Nam', '7558641561', 1998, 1, NULL, 1, 16, TRUE, 2, NULL, 'imported'),
    ('ORG0213', 'TechFactory', 'Công ty Cổ phần TechFactory Việt Nam', '8338325582', 2020, 1, NULL, 4, 14, TRUE, 1, NULL, 'imported'),
    ('ORG0214', 'FutureGate', 'Hợp tác xã FutureGate Việt Nam', '4294379963', 2004, 2, '2020', 2, 7, TRUE, 2, 1, 'imported'),
    ('ORG0215', 'SolarLink', 'Hợp tác xã SolarLink Việt Nam', '8207803934', 2009, 3, NULL, 2, 9, TRUE, 1, NULL, 'imported'),
    ('ORG0216', 'BioBuild', 'Doanh nghiệp Tư nhân BioBuild Việt Nam', '5667760951', 2017, 2, '2020', 2, 3, TRUE, 2, 1, 'imported'),
    ('ORG0217', 'BlueLink', 'Công ty Cổ phần BlueLink Việt Nam', '5451959254', 2019, 1, NULL, 3, 15, TRUE, 1, NULL, 'imported'),
    ('ORG0218', 'OceanBuild', 'Công ty TNHH MTV OceanBuild Việt Nam', '5800273809', 2001, 1, NULL, 3, 18, TRUE, 2, NULL, 'imported'),
    ('ORG0219', 'PrimeGroup', 'Công ty Cổ phần PrimeGroup Việt Nam', '5419489933', 2012, 3, NULL, 4, 20, TRUE, 2, NULL, 'imported'),
    ('ORG0220', 'BlueConnect', 'Hợp tác xã BlueConnect Việt Nam', '7293830307', 2009, 2, '2023', 3, 11, TRUE, 2, 1, 'imported'),
    ('ORG0221', 'FloraHub', 'Hợp tác xã FloraHub Việt Nam', '7274839226', 2021, 1, NULL, 2, 19, TRUE, 2, 1, 'imported'),
    ('ORG0222', 'SwiftConnect', 'Hợp tác xã SwiftConnect Việt Nam', '3384083537', 2013, 2, '2018', 3, 16, TRUE, 1, NULL, 'imported'),
    ('ORG0223', 'SafeZone', 'Doanh nghiệp Tư nhân SafeZone Việt Nam', '1840381733', 2007, 1, NULL, 1, 20, FALSE, 2, 1, 'imported'),
    ('ORG0224', 'EcoEdu', 'Doanh nghiệp Tư nhân EcoEdu Việt Nam', '6939036170', 2004, 1, NULL, 4, 5, FALSE, 2, 1, 'imported'),
    ('ORG0225', 'NovaWorks', 'Công ty TNHH NovaWorks Việt Nam', '8756460189', 2016, 2, '2021', 4, 12, TRUE, 1, NULL, 'imported'),
    ('ORG0226', 'OmegaDynamics', 'Hợp tác xã OmegaDynamics Việt Nam', '3965663196', 2013, 3, NULL, 4, 21, TRUE, 1, 2, 'imported'),
    ('ORG0227', 'PioneerPlus', 'Hợp tác xã PioneerPlus Việt Nam', '2242140808', 2005, 1, NULL, 2, 19, TRUE, 1, 2, 'imported'),
    ('ORG0228', 'BambooFarm', 'Công ty TNHH BambooFarm Việt Nam', '3593393772', 2014, 1, NULL, 1, 11, TRUE, 1, 2, 'imported'),
    ('ORG0229', 'ForestGroup', 'Hợp tác xã ForestGroup Việt Nam', '1498192006', 2018, 1, NULL, 4, 22, TRUE, 2, 1, 'imported'),
    ('ORG0230', 'BlueFlow', 'Hợp tác xã BlueFlow Việt Nam', '8981576848', 1996, 1, NULL, 2, 17, TRUE, 2, 1, 'imported'),
    ('ORG0231', 'BlueFund', 'Doanh nghiệp Tư nhân BlueFund Việt Nam', '2509751531', 2008, 1, NULL, 1, 4, TRUE, 1, 2, 'imported'),
    ('ORG0232', 'AquaCenter', 'Doanh nghiệp Tư nhân AquaCenter Việt Nam', '6683977453', 2016, 1, NULL, 3, 6, TRUE, 2, NULL, 'imported'),
    ('ORG0233', 'MicroHub', 'Doanh nghiệp Tư nhân MicroHub Việt Nam', '8367588279', 2014, 2, '2019', 4, 5, FALSE, 1, 2, 'imported'),
    ('ORG0234', 'AquaFlow', 'Công ty Cổ phần AquaFlow Việt Nam', '5309172294', 2020, 2, '2024', 1, 12, TRUE, 2, NULL, 'imported'),
    ('ORG0235', 'SkyCo', 'Doanh nghiệp Tư nhân SkyCo Việt Nam', '4850269395', 2001, 1, NULL, 2, 16, TRUE, 2, NULL, 'imported'),
    ('ORG0236', 'MekongInstitute', 'Công ty TNHH MTV MekongInstitute Việt Nam', '3488270884', 1998, 2, '2021', 1, 8, TRUE, 1, NULL, 'imported'),
    ('ORG0237', 'BlueLab', 'Doanh nghiệp Tư nhân BlueLab Việt Nam', '3644104389', 2021, 1, NULL, 1, 22, TRUE, 1, NULL, 'imported'),
    ('ORG0238', 'SparkPacific', 'Công ty Cổ phần SparkPacific Việt Nam', '8285534922', 1999, 1, NULL, 1, 16, FALSE, 1, NULL, 'imported'),
    ('ORG0239', 'CircleLocal', 'Doanh nghiệp Tư nhân CircleLocal Việt Nam', '3970715367', 2003, 1, NULL, 2, 7, TRUE, 1, 2, 'imported'),
    ('ORG0240', 'CleanServices', 'Doanh nghiệp Tư nhân CleanServices Việt Nam', '3136809970', 2001, 1, NULL, 4, 2, FALSE, 1, 2, 'imported'),
    ('ORG0241', 'PrimePartners', 'Công ty TNHH MTV PrimePartners Việt Nam', '6695007725', 2018, 3, NULL, 4, 7, TRUE, 2, 1, 'imported'),
    ('ORG0242', 'SeedWater', 'Hợp tác xã SeedWater Việt Nam', '9484947955', 2009, 1, NULL, 4, 14, TRUE, 1, 2, 'imported'),
    ('ORG0243', 'ClearCapital', 'Doanh nghiệp Tư nhân ClearCapital Việt Nam', '2199029793', 2001, 1, NULL, 2, 19, FALSE, 1, NULL, 'imported'),
    ('ORG0244', 'BlueLocal', 'Doanh nghiệp Tư nhân BlueLocal Việt Nam', '2032989010', 2021, 2, '2023', 1, 16, TRUE, 2, NULL, 'imported'),
    ('ORG0245', 'TechPro', 'Doanh nghiệp Tư nhân TechPro Việt Nam', '3694254580', 2007, 3, NULL, 2, 22, TRUE, 1, 2, 'imported'),
    ('ORG0246', 'SafeSolutions', 'Hợp tác xã SafeSolutions Việt Nam', '2573817755', 2009, 1, NULL, 2, 8, FALSE, 2, NULL, 'imported'),
    ('ORG0247', 'CleanCapital', 'Công ty TNHH MTV CleanCapital Việt Nam', '6550233140', 2011, 1, NULL, 2, 10, FALSE, 1, NULL, 'imported'),
    ('ORG0248', 'PureCapital', 'Hợp tác xã PureCapital Việt Nam', '7099411776', 2012, 3, NULL, 3, 14, TRUE, 2, 1, 'imported'),
    ('ORG0249', 'RiverTrade', 'Công ty TNHH RiverTrade Việt Nam', '5932075590', 2010, 2, '2019', 2, 6, TRUE, 1, NULL, 'imported'),
    ('ORG0250', 'FreshPro', 'Doanh nghiệp Tư nhân FreshPro Việt Nam', '2295189353', 2006, 1, NULL, 3, 21, TRUE, 2, 1, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0251', 'WindGate', 'Công ty TNHH WindGate Việt Nam', '2323202998', 1999, 3, NULL, 2, 9, TRUE, 1, NULL, 'imported'),
    ('ORG0252', 'FutureGroup', 'Hợp tác xã FutureGroup Việt Nam', '2707498619', 2014, 1, NULL, 1, 7, TRUE, 2, 1, 'imported'),
    ('ORG0253', 'CircleSystem', 'Công ty TNHH CircleSystem Việt Nam', '2613930214', 2010, 1, NULL, 2, 6, TRUE, 2, NULL, 'imported'),
    ('ORG0254', 'FreshMedia', 'Hợp tác xã FreshMedia Việt Nam', '3029548895', 1995, 1, NULL, 1, 20, TRUE, 2, 1, 'imported'),
    ('ORG0255', 'SolarServices', 'Hợp tác xã SolarServices Việt Nam', '3977628013', 2013, 1, NULL, 3, 17, TRUE, 1, 2, 'imported'),
    ('ORG0256', 'GoldenFund', 'Hợp tác xã GoldenFund Việt Nam', '7786248655', 2004, 2, '2024', 2, 4, FALSE, 1, NULL, 'imported'),
    ('ORG0257', 'EcoCapital', 'Hợp tác xã EcoCapital Việt Nam', '2557220130', 1999, 1, NULL, 2, 5, FALSE, 1, NULL, 'imported'),
    ('ORG0258', 'HydroCore', 'Công ty TNHH MTV HydroCore Việt Nam', '5549509559', 2020, 1, NULL, 1, 20, FALSE, 1, 2, 'imported'),
    ('ORG0259', 'FutureBase', 'Công ty TNHH MTV FutureBase Việt Nam', '3449142215', 2000, 1, NULL, 1, 4, TRUE, 1, 2, 'imported'),
    ('ORG0260', 'SparkNetwork', 'Công ty TNHH SparkNetwork Việt Nam', '3001032544', 1998, 1, NULL, 4, 4, TRUE, 2, NULL, 'imported'),
    ('ORG0261', 'OmegaFund', 'Hợp tác xã OmegaFund Việt Nam', '1770075995', 2020, 3, NULL, 4, 19, FALSE, 1, 2, 'imported'),
    ('ORG0262', 'GoldenLine', 'Công ty TNHH MTV GoldenLine Việt Nam', '7844674517', 2010, 2, '2023', 3, 16, TRUE, 2, NULL, 'imported'),
    ('ORG0263', 'TechVietnam', 'Công ty TNHH MTV TechVietnam Việt Nam', '8212127816', 1995, 1, NULL, 2, 10, TRUE, 2, 1, 'imported'),
    ('ORG0264', 'BioSolutions', 'Công ty Cổ phần BioSolutions Việt Nam', '4032501215', 2007, 1, NULL, 4, 16, FALSE, 1, 2, 'imported'),
    ('ORG0265', 'RiverPlus', 'Công ty TNHH MTV RiverPlus Việt Nam', '6760652905', 1999, 1, NULL, 3, 19, TRUE, 1, 2, 'imported'),
    ('ORG0266', 'NovaZone', 'Công ty TNHH MTV NovaZone Việt Nam', '9166493111', 2022, 1, NULL, 4, 11, TRUE, 1, 2, 'imported'),
    ('ORG0267', 'NanoCorp', 'Công ty TNHH MTV NanoCorp Việt Nam', '6214434351', 2010, 1, NULL, 1, 19, FALSE, 1, 2, 'imported'),
    ('ORG0268', 'NovaAlliance', 'Công ty TNHH MTV NovaAlliance Việt Nam', '2345840745', 2004, 1, NULL, 2, 19, TRUE, 2, NULL, 'imported'),
    ('ORG0269', 'VietPro', 'Doanh nghiệp Tư nhân VietPro Việt Nam', '1634554320', 2011, 2, '2018', 2, 14, FALSE, 2, 1, 'imported'),
    ('ORG0270', 'DigitalGate', 'Doanh nghiệp Tư nhân DigitalGate Việt Nam', '4889761307', 2009, 2, '2020', 1, 16, TRUE, 1, NULL, 'imported'),
    ('ORG0271', 'SeedWorks', 'Công ty Cổ phần SeedWorks Việt Nam', '5006927241', 2021, 1, NULL, 3, 19, TRUE, 2, 1, 'imported'),
    ('ORG0272', 'BambooPartners', 'Công ty TNHH BambooPartners Việt Nam', '5074682264', 2008, 1, NULL, 3, 16, TRUE, 2, 1, 'imported'),
    ('ORG0273', 'SkyCenter', 'Hợp tác xã SkyCenter Việt Nam', '3943119201', 2007, 1, NULL, 3, 3, TRUE, 1, NULL, 'imported'),
    ('ORG0274', 'HarvestPacific', 'Hợp tác xã HarvestPacific Việt Nam', '8376116786', 2010, 2, '2021', 3, 15, TRUE, 1, 2, 'imported'),
    ('ORG0275', 'SmartLab', 'Công ty Cổ phần SmartLab Việt Nam', '9329737841', 2013, 1, NULL, 2, 3, TRUE, 2, NULL, 'imported'),
    ('ORG0276', 'VietMedia', 'Công ty Cổ phần VietMedia Việt Nam', '5508783501', 2009, 3, NULL, 4, 15, TRUE, 2, NULL, 'imported'),
    ('ORG0277', 'SwiftFood', 'Hợp tác xã SwiftFood Việt Nam', '6108275915', 2001, 1, NULL, 3, 19, TRUE, 2, NULL, 'imported'),
    ('ORG0278', 'SolarGroup', 'Hợp tác xã SolarGroup Việt Nam', '4998892039', 2012, 1, NULL, 3, 5, FALSE, 1, 2, 'imported'),
    ('ORG0279', 'BambooLab', 'Hợp tác xã BambooLab Việt Nam', '5844171168', 1999, 1, NULL, 3, 14, TRUE, 1, NULL, 'imported'),
    ('ORG0280', 'BioCapital', 'Hợp tác xã BioCapital Việt Nam', '7301287567', 2000, 1, NULL, 4, 4, FALSE, 1, NULL, 'imported'),
    ('ORG0281', 'ClearFood', 'Công ty TNHH MTV ClearFood Việt Nam', '9607654443', 2016, 1, NULL, 3, 22, TRUE, 1, NULL, 'imported'),
    ('ORG0282', 'SwiftAlliance', 'Công ty TNHH SwiftAlliance Việt Nam', '9778256009', 2003, 1, NULL, 1, 18, FALSE, 2, NULL, 'imported'),
    ('ORG0283', 'FreshLab', 'Hợp tác xã FreshLab Việt Nam', '5858839243', 2015, 1, NULL, 4, 3, TRUE, 2, 1, 'imported'),
    ('ORG0284', 'CircleVenture', 'Hợp tác xã CircleVenture Việt Nam', '7305953323', 2015, 1, NULL, 4, 10, TRUE, 1, 2, 'imported'),
    ('ORG0285', 'FutureTech', 'Công ty TNHH FutureTech Việt Nam', '2988049941', 2019, 1, NULL, 4, 22, TRUE, 2, 1, 'imported'),
    ('ORG0286', 'NovaFlow', 'Công ty TNHH NovaFlow Việt Nam', '5320080287', 2003, 3, NULL, 4, 10, TRUE, 2, 1, 'imported'),
    ('ORG0287', 'EcoFood', 'Doanh nghiệp Tư nhân EcoFood Việt Nam', '3785815533', 2001, 1, NULL, 1, 6, TRUE, 1, 2, 'imported'),
    ('ORG0288', 'NanoDynamics', 'Doanh nghiệp Tư nhân NanoDynamics Việt Nam', '9501831663', 1998, 1, NULL, 4, 8, TRUE, 1, 2, 'imported'),
    ('ORG0289', 'NovaTech', 'Công ty Cổ phần NovaTech Việt Nam', '6120465592', 2017, 1, NULL, 4, 5, TRUE, 2, 1, 'imported'),
    ('ORG0290', 'HydroCapital', 'Công ty Cổ phần HydroCapital Việt Nam', '1744279636', 1997, 1, NULL, 1, 1, TRUE, 2, 1, 'imported'),
    ('ORG0291', 'CleanGate', 'Công ty Cổ phần CleanGate Việt Nam', '7383890366', 2002, 1, NULL, 1, 2, TRUE, 2, 1, 'imported'),
    ('ORG0292', 'MekongPro', 'Công ty Cổ phần MekongPro Việt Nam', '8423203617', 2022, 1, NULL, 1, 7, FALSE, 2, 1, 'imported'),
    ('ORG0293', 'PioneerPro', 'Công ty Cổ phần PioneerPro Việt Nam', '1980034265', 2019, 1, NULL, 4, 5, FALSE, 1, 2, 'imported'),
    ('ORG0294', 'FreshZone', 'Công ty TNHH FreshZone Việt Nam', '9472515108', 2015, 1, NULL, 3, 17, TRUE, 1, 2, 'imported'),
    ('ORG0295', 'MountainAgency', 'Công ty Cổ phần MountainAgency Việt Nam', '7617643635', 2005, 1, NULL, 3, 8, TRUE, 2, 1, 'imported'),
    ('ORG0296', 'RuralEdu', 'Công ty TNHH MTV RuralEdu Việt Nam', '3557863130', 2018, 1, NULL, 2, 12, TRUE, 2, NULL, 'imported'),
    ('ORG0297', 'MekongLocal', 'Công ty TNHH MekongLocal Việt Nam', '7555217903', 2010, 3, NULL, 4, 6, TRUE, 1, 2, 'imported'),
    ('ORG0298', 'CleanStudio', 'Doanh nghiệp Tư nhân CleanStudio Việt Nam', '1473890212', 2006, 2, '2022', 3, 16, TRUE, 1, 2, 'imported'),
    ('ORG0299', 'AquaSolutions', 'Doanh nghiệp Tư nhân AquaSolutions Việt Nam', '6915482645', 2006, 1, NULL, 1, 20, TRUE, 2, NULL, 'imported'),
    ('ORG0300', 'FloraTech', 'Công ty TNHH MTV FloraTech Việt Nam', '3770939734', 2000, 1, NULL, 1, 22, TRUE, 1, 2, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0301', 'EcoSystem', 'Doanh nghiệp Tư nhân EcoSystem Việt Nam', '6070243272', 2010, 1, NULL, 2, 10, TRUE, 1, NULL, 'imported'),
    ('ORG0302', 'BlueNetwork', 'Công ty Cổ phần BlueNetwork Việt Nam', '6687472117', 2007, 2, '2020', 4, 4, TRUE, 2, NULL, 'imported'),
    ('ORG0303', 'MicroWorks', 'Hợp tác xã MicroWorks Việt Nam', '7735563741', 2016, 3, NULL, 4, 18, TRUE, 2, NULL, 'imported'),
    ('ORG0304', 'ClearCore', 'Hợp tác xã ClearCore Việt Nam', '1195355435', 2006, 2, '2021', 4, 7, TRUE, 2, 1, 'imported'),
    ('ORG0305', 'RuralTech', 'Công ty Cổ phần RuralTech Việt Nam', '9598728606', 2014, 1, NULL, 4, 13, TRUE, 1, 2, 'imported'),
    ('ORG0306', 'TerraFarm', 'Công ty TNHH TerraFarm Việt Nam', '7282216597', 2019, 1, NULL, 2, 3, FALSE, 2, 1, 'imported'),
    ('ORG0307', 'NanoAsia', 'Công ty TNHH NanoAsia Việt Nam', '9031229072', 2021, 1, NULL, 1, 19, FALSE, 1, 2, 'imported'),
    ('ORG0308', 'RenewConnect', 'Công ty TNHH RenewConnect Việt Nam', '9323175775', 2016, 1, NULL, 4, 16, TRUE, 2, 1, 'imported'),
    ('ORG0309', 'SmartZone', 'Công ty TNHH SmartZone Việt Nam', '8256557537', 2005, 1, NULL, 4, 14, TRUE, 1, 2, 'imported'),
    ('ORG0310', 'SwiftFactory', 'Doanh nghiệp Tư nhân SwiftFactory Việt Nam', '4281778398', 2019, 3, NULL, 1, 5, FALSE, 1, 2, 'imported'),
    ('ORG0311', 'SafeLine', 'Doanh nghiệp Tư nhân SafeLine Việt Nam', '5340522065', 1998, 2, '2021', 4, 17, FALSE, 2, 1, 'imported'),
    ('ORG0312', 'SeedFactory', 'Doanh nghiệp Tư nhân SeedFactory Việt Nam', '1798534963', 2010, 1, NULL, 3, 19, TRUE, 1, NULL, 'imported'),
    ('ORG0313', 'RenewGroup', 'Doanh nghiệp Tư nhân RenewGroup Việt Nam', '2476678923', 2011, 1, NULL, 4, 20, TRUE, 2, 1, 'imported'),
    ('ORG0314', 'NanoHealth', 'Công ty Cổ phần NanoHealth Việt Nam', '1915422939', 1995, 1, NULL, 3, 1, TRUE, 1, NULL, 'imported'),
    ('ORG0315', 'OceanEnergy', 'Công ty Cổ phần OceanEnergy Việt Nam', '9097655015', 2001, 1, NULL, 1, 22, TRUE, 1, NULL, 'imported'),
    ('ORG0316', 'CircleFactory', 'Doanh nghiệp Tư nhân CircleFactory Việt Nam', '1280794323', 2000, 2, '2023', 4, 21, TRUE, 1, 2, 'imported'),
    ('ORG0317', 'FuturePartners', 'Doanh nghiệp Tư nhân FuturePartners Việt Nam', '1278627610', 1999, 2, '2024', 4, 16, TRUE, 2, NULL, 'imported'),
    ('ORG0318', 'LotusAsia', 'Công ty Cổ phần LotusAsia Việt Nam', '6609223166', 2022, 1, NULL, 4, 17, FALSE, 2, NULL, 'imported'),
    ('ORG0319', 'MountainTech', 'Công ty Cổ phần MountainTech Việt Nam', '2897037643', 2003, 2, '2020', 3, 8, TRUE, 1, NULL, 'imported'),
    ('ORG0320', 'GoldenWater', 'Công ty TNHH MTV GoldenWater Việt Nam', '5286358927', 2016, 2, '2024', 4, 19, TRUE, 1, 2, 'imported'),
    ('ORG0321', 'AlphaSystem', 'Công ty TNHH AlphaSystem Việt Nam', '6101762091', 2021, 2, '2023', 3, 1, TRUE, 2, 1, 'imported'),
    ('ORG0322', 'RuralZone', 'Công ty TNHH MTV RuralZone Việt Nam', '2637750783', 1999, 3, NULL, 3, 3, TRUE, 1, NULL, 'imported'),
    ('ORG0323', 'AquaVietnam', 'Hợp tác xã AquaVietnam Việt Nam', '1884300678', 2001, 1, NULL, 4, 6, TRUE, 1, NULL, 'imported'),
    ('ORG0324', 'SkyPartners', 'Công ty Cổ phần SkyPartners Việt Nam', '8236315216', 2013, 1, NULL, 3, 19, TRUE, 2, 1, 'imported'),
    ('ORG0325', 'PioneerEdu', 'Công ty Cổ phần PioneerEdu Việt Nam', '8444226103', 2000, 2, '2024', 2, 9, TRUE, 2, 1, 'imported'),
    ('ORG0326', 'PearlNetwork', 'Doanh nghiệp Tư nhân PearlNetwork Việt Nam', '2936755326', 1998, 1, NULL, 4, 11, FALSE, 2, 1, 'imported'),
    ('ORG0327', 'RenewAlliance', 'Công ty Cổ phần RenewAlliance Việt Nam', '2880008770', 1997, 1, NULL, 4, 6, TRUE, 1, 2, 'imported'),
    ('ORG0328', 'PrimeCo', 'Công ty TNHH PrimeCo Việt Nam', '4852628125', 2001, 1, NULL, 2, 12, FALSE, 1, NULL, 'imported'),
    ('ORG0329', 'AquaHealth', 'Công ty TNHH AquaHealth Việt Nam', '1717462505', 2016, 2, '2023', 4, 14, FALSE, 1, NULL, 'imported'),
    ('ORG0330', 'HydroBuild', 'Công ty TNHH MTV HydroBuild Việt Nam', '2584756879', 2009, 1, NULL, 2, 9, TRUE, 1, 2, 'imported'),
    ('ORG0331', 'OmegaCorp', 'Hợp tác xã OmegaCorp Việt Nam', '9665735603', 2016, 3, NULL, 1, 10, TRUE, 1, 2, 'imported'),
    ('ORG0332', 'MountainFood', 'Công ty TNHH MountainFood Việt Nam', '9063079139', 1999, 1, NULL, 2, 11, TRUE, 2, NULL, 'imported'),
    ('ORG0333', 'GreenCorp', 'Doanh nghiệp Tư nhân GreenCorp Việt Nam', '1826632812', 2015, 1, NULL, 2, 17, TRUE, 1, NULL, 'imported'),
    ('ORG0334', 'BrightLocal', 'Công ty Cổ phần BrightLocal Việt Nam', '8650577678', 2004, 1, NULL, 4, 5, TRUE, 2, NULL, 'imported'),
    ('ORG0335', 'AlphaTrade', 'Doanh nghiệp Tư nhân AlphaTrade Việt Nam', '3065210717', 2004, 1, NULL, 3, 16, TRUE, 2, 1, 'imported'),
    ('ORG0336', 'MountainZone', 'Công ty Cổ phần MountainZone Việt Nam', '8396987201', 1998, 3, NULL, 2, 16, TRUE, 1, 2, 'imported'),
    ('ORG0337', 'ClearAlliance', 'Công ty Cổ phần ClearAlliance Việt Nam', '1052988672', 2014, 1, NULL, 2, 14, TRUE, 1, 2, 'imported'),
    ('ORG0338', 'ForestServices', 'Hợp tác xã ForestServices Việt Nam', '4215771198', 2020, 1, NULL, 4, 17, FALSE, 2, 1, 'imported'),
    ('ORG0339', 'TechWater', 'Công ty TNHH TechWater Việt Nam', '4220863567', 2009, 3, NULL, 1, 10, FALSE, 1, NULL, 'imported'),
    ('ORG0340', 'SparkFarm', 'Công ty TNHH MTV SparkFarm Việt Nam', '1179784541', 2003, 1, NULL, 4, 11, TRUE, 2, NULL, 'imported'),
    ('ORG0341', 'RuralHub', 'Công ty TNHH RuralHub Việt Nam', '8294178468', 2006, 1, NULL, 3, 15, FALSE, 2, 1, 'imported'),
    ('ORG0342', 'SunrisePoint', 'Công ty TNHH MTV SunrisePoint Việt Nam', '4410033885', 2010, 1, NULL, 2, 5, TRUE, 1, NULL, 'imported'),
    ('ORG0343', 'SparkAlliance', 'Công ty TNHH SparkAlliance Việt Nam', '5747956127', 2000, 1, NULL, 1, 22, FALSE, 1, 2, 'imported'),
    ('ORG0344', 'HarvestAgency', 'Doanh nghiệp Tư nhân HarvestAgency Việt Nam', '2002305548', 2018, 3, NULL, 1, 19, TRUE, 2, NULL, 'imported'),
    ('ORG0345', 'MountainGlobal', 'Hợp tác xã MountainGlobal Việt Nam', '8607593563', 2022, 1, NULL, 3, 8, TRUE, 2, 1, 'imported'),
    ('ORG0346', 'GoldenDynamics', 'Công ty TNHH MTV GoldenDynamics Việt Nam', '4559184883', 1998, 3, NULL, 2, 2, FALSE, 1, 2, 'imported'),
    ('ORG0347', 'ForestLine', 'Doanh nghiệp Tư nhân ForestLine Việt Nam', '2679603225', 2010, 1, NULL, 2, 11, TRUE, 1, 2, 'imported'),
    ('ORG0348', 'HarvestWater', 'Công ty TNHH HarvestWater Việt Nam', '4686932034', 2020, 1, NULL, 4, 6, TRUE, 1, NULL, 'imported'),
    ('ORG0349', 'DigitalSupply', 'Công ty TNHH MTV DigitalSupply Việt Nam', '5099784081', 2007, 1, NULL, 4, 12, FALSE, 1, NULL, 'imported'),
    ('ORG0350', 'HarvestHub', 'Công ty TNHH MTV HarvestHub Việt Nam', '6072771245', 2017, 1, NULL, 2, 13, TRUE, 1, NULL, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0351', 'MekongAlliance', 'Công ty TNHH MekongAlliance Việt Nam', '1772825941', 2019, 1, NULL, 3, 2, TRUE, 1, 2, 'imported'),
    ('ORG0352', 'DigitalCo', 'Hợp tác xã DigitalCo Việt Nam', '4520856549', 2013, 1, NULL, 2, 19, TRUE, 2, NULL, 'imported'),
    ('ORG0353', 'NovaCo', 'Công ty Cổ phần NovaCo Việt Nam', '3301691543', 2016, 3, NULL, 2, 14, TRUE, 1, NULL, 'imported'),
    ('ORG0354', 'PioneerCorp', 'Hợp tác xã PioneerCorp Việt Nam', '3749541399', 2012, 1, NULL, 4, 8, FALSE, 2, 1, 'imported'),
    ('ORG0355', 'RenewBuild', 'Công ty TNHH MTV RenewBuild Việt Nam', '1206000737', 2004, 1, NULL, 4, 16, TRUE, 1, NULL, 'imported'),
    ('ORG0356', 'NanoPro', 'Công ty Cổ phần NanoPro Việt Nam', '2966178433', 2018, 1, NULL, 2, 10, TRUE, 1, 2, 'imported'),
    ('ORG0357', 'SmartPoint', 'Hợp tác xã SmartPoint Việt Nam', '4755317390', 1996, 1, NULL, 1, 13, TRUE, 1, 2, 'imported'),
    ('ORG0358', 'CircleHealth', 'Công ty Cổ phần CircleHealth Việt Nam', '5617615454', 2000, 1, NULL, 2, 18, TRUE, 1, NULL, 'imported'),
    ('ORG0359', 'FutureSolutions', 'Doanh nghiệp Tư nhân FutureSolutions Việt Nam', '8938610457', 2015, 1, NULL, 2, 13, TRUE, 2, NULL, 'imported'),
    ('ORG0360', 'RiverSupply', 'Hợp tác xã RiverSupply Việt Nam', '8780521609', 2007, 1, NULL, 2, 4, FALSE, 1, NULL, 'imported'),
    ('ORG0361', 'GoldenLab', 'Doanh nghiệp Tư nhân GoldenLab Việt Nam', '5842292127', 2016, 1, NULL, 2, 12, FALSE, 1, 2, 'imported'),
    ('ORG0362', 'LotusFactory', 'Công ty Cổ phần LotusFactory Việt Nam', '1802558618', 2008, 1, NULL, 1, 17, TRUE, 1, NULL, 'imported'),
    ('ORG0363', 'FreshGlobal', 'Công ty TNHH FreshGlobal Việt Nam', '3647707140', 2001, 1, NULL, 3, 14, TRUE, 2, NULL, 'imported'),
    ('ORG0364', 'FloraPacific', 'Công ty Cổ phần FloraPacific Việt Nam', '1204253178', 2006, 1, NULL, 1, 14, TRUE, 1, NULL, 'imported'),
    ('ORG0365', 'RiverPoint', 'Hợp tác xã RiverPoint Việt Nam', '7892193329', 2005, 2, '2019', 1, 2, TRUE, 1, NULL, 'imported'),
    ('ORG0366', 'PioneerGate', 'Hợp tác xã PioneerGate Việt Nam', '6866976974', 2001, 1, NULL, 2, 20, FALSE, 2, 1, 'imported'),
    ('ORG0367', 'FutureCorp', 'Công ty Cổ phần FutureCorp Việt Nam', '7482301234', 2012, 1, NULL, 1, 17, TRUE, 2, 1, 'imported'),
    ('ORG0368', 'GoldenWorks', 'Hợp tác xã GoldenWorks Việt Nam', '9811211199', 1996, 1, NULL, 3, 3, TRUE, 2, 1, 'imported'),
    ('ORG0369', 'CycleAlliance', 'Công ty TNHH MTV CycleAlliance Việt Nam', '8103123072', 1995, 1, NULL, 2, 15, TRUE, 1, 2, 'imported'),
    ('ORG0370', 'BrightMarket', 'Công ty Cổ phần BrightMarket Việt Nam', '8076234670', 2022, 1, NULL, 1, 14, FALSE, 1, 2, 'imported'),
    ('ORG0371', 'GreenLine', 'Công ty TNHH GreenLine Việt Nam', '1567704691', 2021, 1, NULL, 3, 3, TRUE, 1, NULL, 'imported'),
    ('ORG0372', 'GoldenCenter', 'Công ty TNHH MTV GoldenCenter Việt Nam', '1528605335', 2017, 1, NULL, 1, 8, TRUE, 2, NULL, 'imported'),
    ('ORG0373', 'ForestCorp', 'Công ty TNHH MTV ForestCorp Việt Nam', '2433337060', 2004, 3, NULL, 2, 22, TRUE, 2, NULL, 'imported'),
    ('ORG0374', 'PearlInstitute', 'Công ty Cổ phần PearlInstitute Việt Nam', '2375489059', 1999, 2, '2024', 2, 3, TRUE, 2, 1, 'imported'),
    ('ORG0375', 'MicroEdu', 'Doanh nghiệp Tư nhân MicroEdu Việt Nam', '7587494767', 2020, 1, NULL, 1, 8, TRUE, 2, NULL, 'imported'),
    ('ORG0376', 'ForestPro', 'Công ty Cổ phần ForestPro Việt Nam', '6560682527', 1996, 3, NULL, 2, 13, TRUE, 1, 2, 'imported'),
    ('ORG0377', 'SmartEdu', 'Công ty TNHH SmartEdu Việt Nam', '9643525901', 1999, 1, NULL, 4, 14, TRUE, 2, NULL, 'imported'),
    ('ORG0378', 'BioStudio', 'Công ty Cổ phần BioStudio Việt Nam', '3161637381', 2015, 1, NULL, 3, 8, TRUE, 2, 1, 'imported'),
    ('ORG0379', 'HarvestGate', 'Công ty TNHH MTV HarvestGate Việt Nam', '4615129784', 2021, 1, NULL, 2, 9, TRUE, 1, NULL, 'imported'),
    ('ORG0380', 'SwiftFarm', 'Hợp tác xã SwiftFarm Việt Nam', '4990891827', 2001, 1, NULL, 1, 10, TRUE, 1, 2, 'imported'),
    ('ORG0381', 'BlueCore', 'Công ty Cổ phần BlueCore Việt Nam', '9691662212', 2011, 3, NULL, 1, 8, TRUE, 1, 2, 'imported'),
    ('ORG0382', 'NovaSolutions', 'Doanh nghiệp Tư nhân NovaSolutions Việt Nam', '2026972351', 2022, 1, NULL, 1, 16, TRUE, 1, 2, 'imported'),
    ('ORG0383', 'OmegaMedia', 'Doanh nghiệp Tư nhân OmegaMedia Việt Nam', '7737658873', 2003, 2, '2021', 3, 17, TRUE, 2, NULL, 'imported'),
    ('ORG0384', 'RenewFarm', 'Công ty Cổ phần RenewFarm Việt Nam', '4663863897', 2021, 2, '2023', 3, 15, FALSE, 2, 1, 'imported'),
    ('ORG0385', 'RuralStudio', 'Doanh nghiệp Tư nhân RuralStudio Việt Nam', '8478761088', 2005, 1, NULL, 1, 20, TRUE, 2, NULL, 'imported'),
    ('ORG0386', 'GoldenAsia', 'Công ty TNHH GoldenAsia Việt Nam', '8353871802', 1997, 1, NULL, 3, 6, TRUE, 1, NULL, 'imported'),
    ('ORG0387', 'AquaAgency', 'Công ty TNHH MTV AquaAgency Việt Nam', '3647900506', 2023, 1, NULL, 1, 22, TRUE, 2, NULL, 'imported'),
    ('ORG0388', 'PearlLogistics', 'Công ty TNHH MTV PearlLogistics Việt Nam', '2621593120', 2008, 2, '2019', 3, 10, TRUE, 1, 2, 'imported'),
    ('ORG0389', 'CycleGlobal', 'Doanh nghiệp Tư nhân CycleGlobal Việt Nam', '8216755528', 2000, 1, NULL, 4, 4, TRUE, 2, 1, 'imported'),
    ('ORG0390', 'CleanWater', 'Doanh nghiệp Tư nhân CleanWater Việt Nam', '5082587589', 2007, 2, '2022', 1, 12, TRUE, 1, 2, 'imported'),
    ('ORG0391', 'CirclePoint', 'Công ty TNHH MTV CirclePoint Việt Nam', '6658494712', 2006, 1, NULL, 1, 19, TRUE, 2, NULL, 'imported'),
    ('ORG0392', 'PureCore', 'Công ty TNHH PureCore Việt Nam', '8663429809', 2017, 1, NULL, 2, 1, TRUE, 1, 2, 'imported'),
    ('ORG0393', 'SeedBase', 'Doanh nghiệp Tư nhân SeedBase Việt Nam', '8603773960', 2002, 1, NULL, 4, 20, FALSE, 1, NULL, 'imported'),
    ('ORG0394', 'SunriseHub', 'Doanh nghiệp Tư nhân SunriseHub Việt Nam', '4416395064', 2001, 3, NULL, 2, 6, FALSE, 2, NULL, 'imported'),
    ('ORG0395', 'HarvestMedia', 'Công ty TNHH HarvestMedia Việt Nam', '9716873396', 2011, 1, NULL, 2, 8, FALSE, 1, 2, 'imported'),
    ('ORG0396', 'DigitalGlobal', 'Công ty TNHH MTV DigitalGlobal Việt Nam', '9359491014', 2018, 1, NULL, 3, 6, TRUE, 1, 2, 'imported'),
    ('ORG0397', 'RiverCenter', 'Công ty TNHH RiverCenter Việt Nam', '2930172860', 2006, 1, NULL, 3, 13, TRUE, 1, NULL, 'imported'),
    ('ORG0398', 'FreshBase', 'Hợp tác xã FreshBase Việt Nam', '1525289999', 2006, 1, NULL, 1, 13, FALSE, 2, 1, 'imported'),
    ('ORG0399', 'VietWater', 'Công ty TNHH VietWater Việt Nam', '8742645750', 2005, 1, NULL, 3, 19, FALSE, 2, NULL, 'imported'),
    ('ORG0400', 'PureAsia', 'Công ty TNHH PureAsia Việt Nam', '5462987469', 2004, 3, NULL, 4, 3, TRUE, 2, 1, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0401', 'GreenWorks', 'Công ty TNHH GreenWorks Việt Nam', '9562190704', 1996, 1, NULL, 1, 2, FALSE, 2, 1, 'imported'),
    ('ORG0402', 'MountainBuild', 'Công ty Cổ phần MountainBuild Việt Nam', '4972236629', 2020, 1, NULL, 4, 22, TRUE, 1, 2, 'imported'),
    ('ORG0403', 'FloraVenture', 'Hợp tác xã FloraVenture Việt Nam', '4748958133', 2004, 1, NULL, 2, 16, TRUE, 1, NULL, 'imported'),
    ('ORG0404', 'DeltaPro', 'Doanh nghiệp Tư nhân DeltaPro Việt Nam', '9482838229', 1999, 1, NULL, 1, 5, FALSE, 2, 1, 'imported'),
    ('ORG0405', 'NovaFood', 'Công ty Cổ phần NovaFood Việt Nam', '2433400257', 2003, 1, NULL, 2, 13, TRUE, 1, 2, 'imported'),
    ('ORG0406', 'GoldenEdu', 'Công ty TNHH GoldenEdu Việt Nam', '3285488356', 2013, 3, NULL, 3, 16, FALSE, 1, NULL, 'imported'),
    ('ORG0407', 'TerraEdu', 'Công ty Cổ phần TerraEdu Việt Nam', '1298305388', 2004, 1, NULL, 2, 9, TRUE, 1, NULL, 'imported'),
    ('ORG0408', 'DigitalEdu', 'Doanh nghiệp Tư nhân DigitalEdu Việt Nam', '1469809301', 1995, 1, NULL, 1, 10, TRUE, 2, 1, 'imported'),
    ('ORG0409', 'HydroStudio', 'Doanh nghiệp Tư nhân HydroStudio Việt Nam', '5779272394', 2019, 3, NULL, 3, 16, TRUE, 1, NULL, 'imported'),
    ('ORG0410', 'BlueBuild', 'Công ty TNHH MTV BlueBuild Việt Nam', '3263047835', 2015, 3, NULL, 2, 2, TRUE, 2, 1, 'imported'),
    ('ORG0411', 'CircleTrade', 'Công ty TNHH MTV CircleTrade Việt Nam', '5993358302', 1999, 1, NULL, 1, 16, TRUE, 2, NULL, 'imported'),
    ('ORG0412', 'FutureAlliance', 'Công ty TNHH MTV FutureAlliance Việt Nam', '9959316663', 2020, 3, NULL, 3, 8, TRUE, 2, NULL, 'imported'),
    ('ORG0413', 'UrbanPartners', 'Công ty Cổ phần UrbanPartners Việt Nam', '6151841907', 2023, 1, NULL, 2, 13, TRUE, 2, NULL, 'imported'),
    ('ORG0414', 'EcoBase', 'Doanh nghiệp Tư nhân EcoBase Việt Nam', '9189853166', 2012, 1, NULL, 4, 5, TRUE, 2, 1, 'imported'),
    ('ORG0415', 'OceanZone', 'Doanh nghiệp Tư nhân OceanZone Việt Nam', '8261041225', 1998, 1, NULL, 2, 8, TRUE, 1, NULL, 'imported'),
    ('ORG0416', 'FreshStudio', 'Công ty TNHH FreshStudio Việt Nam', '3232620908', 1995, 1, NULL, 1, 10, TRUE, 2, 1, 'imported'),
    ('ORG0417', 'TechServices', 'Công ty Cổ phần TechServices Việt Nam', '3347977123', 1995, 1, NULL, 4, 13, FALSE, 1, 2, 'imported'),
    ('ORG0418', 'MicroAlliance', 'Công ty TNHH MTV MicroAlliance Việt Nam', '2909024435', 2015, 1, NULL, 2, 12, TRUE, 2, 1, 'imported'),
    ('ORG0419', 'AquaInstitute', 'Doanh nghiệp Tư nhân AquaInstitute Việt Nam', '3830262384', 2007, 2, '2020', 4, 3, TRUE, 1, NULL, 'imported'),
    ('ORG0420', 'SeedEdu', 'Công ty TNHH SeedEdu Việt Nam', '9128109021', 2020, 3, NULL, 3, 20, FALSE, 1, 2, 'imported'),
    ('ORG0421', 'DeltaWater', 'Công ty Cổ phần DeltaWater Việt Nam', '4393042281', 2004, 1, NULL, 4, 19, TRUE, 1, NULL, 'imported'),
    ('ORG0422', 'RenewWorks', 'Công ty TNHH RenewWorks Việt Nam', '7179934236', 2023, 1, NULL, 1, 20, TRUE, 2, NULL, 'imported'),
    ('ORG0423', 'BrightEdu', 'Công ty TNHH MTV BrightEdu Việt Nam', '7442652840', 2004, 3, NULL, 1, 11, TRUE, 2, NULL, 'imported'),
    ('ORG0424', 'BrightFactory', 'Công ty TNHH BrightFactory Việt Nam', '4991586232', 1997, 1, NULL, 3, 14, TRUE, 2, NULL, 'imported'),
    ('ORG0425', 'SwiftVietnam', 'Công ty TNHH SwiftVietnam Việt Nam', '7667919375', 2012, 2, '2019', 4, 4, TRUE, 2, NULL, 'imported'),
    ('ORG0426', 'CycleZone', 'Công ty TNHH CycleZone Việt Nam', '4091632789', 2019, 1, NULL, 2, 10, TRUE, 1, 2, 'imported'),
    ('ORG0427', 'DeltaLocal', 'Hợp tác xã DeltaLocal Việt Nam', '9338365438', 2022, 3, NULL, 1, 12, FALSE, 2, 1, 'imported'),
    ('ORG0428', 'LotusCo', 'Doanh nghiệp Tư nhân LotusCo Việt Nam', '1490651227', 2018, 1, NULL, 3, 20, TRUE, 2, 1, 'imported'),
    ('ORG0429', 'CycleGroup', 'Hợp tác xã CycleGroup Việt Nam', '9724393265', 2008, 1, NULL, 3, 20, TRUE, 2, 1, 'imported'),
    ('ORG0430', 'AlphaPoint', 'Công ty Cổ phần AlphaPoint Việt Nam', '5360179576', 2007, 1, NULL, 3, 12, FALSE, 2, 1, 'imported'),
    ('ORG0431', 'BioPlus', 'Doanh nghiệp Tư nhân BioPlus Việt Nam', '3390614928', 2009, 1, NULL, 2, 9, TRUE, 2, NULL, 'imported'),
    ('ORG0432', 'BioEnergy', 'Công ty TNHH MTV BioEnergy Việt Nam', '8991088511', 2015, 1, NULL, 3, 1, TRUE, 2, 1, 'imported'),
    ('ORG0433', 'UrbanZone', 'Hợp tác xã UrbanZone Việt Nam', '8219909864', 2001, 1, NULL, 3, 16, TRUE, 2, 1, 'imported'),
    ('ORG0434', 'HarvestCore', 'Công ty TNHH MTV HarvestCore Việt Nam', '8356592812', 2019, 1, NULL, 1, 8, TRUE, 2, 1, 'imported'),
    ('ORG0435', 'VietZone', 'Hợp tác xã VietZone Việt Nam', '4913013819', 2003, 1, NULL, 4, 14, TRUE, 2, NULL, 'imported'),
    ('ORG0436', 'PrimePacific', 'Công ty Cổ phần PrimePacific Việt Nam', '3309042717', 2002, 1, NULL, 4, 14, TRUE, 1, 2, 'imported'),
    ('ORG0437', 'FloraCapital', 'Công ty TNHH FloraCapital Việt Nam', '2852934216', 2012, 1, NULL, 2, 13, TRUE, 1, 2, 'imported'),
    ('ORG0438', 'PioneerCenter', 'Doanh nghiệp Tư nhân PioneerCenter Việt Nam', '7166242227', 2009, 3, NULL, 2, 1, TRUE, 2, 1, 'imported'),
    ('ORG0439', 'CirclePartners', 'Công ty TNHH MTV CirclePartners Việt Nam', '7127584892', 2023, 1, NULL, 2, 14, FALSE, 2, 1, 'imported'),
    ('ORG0440', 'AgriTrade', 'Hợp tác xã AgriTrade Việt Nam', '4236123879', 2023, 1, NULL, 1, 18, TRUE, 1, NULL, 'imported'),
    ('ORG0441', 'NovaAgency', 'Doanh nghiệp Tư nhân NovaAgency Việt Nam', '3237222263', 2013, 3, NULL, 4, 9, TRUE, 1, 2, 'imported'),
    ('ORG0442', 'NanoPoint', 'Công ty TNHH MTV NanoPoint Việt Nam', '9908142289', 2005, 1, NULL, 1, 21, TRUE, 1, NULL, 'imported'),
    ('ORG0443', 'OceanWorks', 'Công ty Cổ phần OceanWorks Việt Nam', '1919935099', 2010, 2, '2023', 2, 21, TRUE, 2, 1, 'imported'),
    ('ORG0444', 'OceanHub', 'Công ty Cổ phần OceanHub Việt Nam', '6528788381', 2010, 1, NULL, 4, 5, TRUE, 2, 1, 'imported'),
    ('ORG0445', 'PioneerGroup', 'Công ty TNHH MTV PioneerGroup Việt Nam', '8609817285', 2022, 1, NULL, 3, 16, TRUE, 1, NULL, 'imported'),
    ('ORG0446', 'PureStudio', 'Công ty TNHH MTV PureStudio Việt Nam', '4101948739', 2014, 1, NULL, 2, 12, TRUE, 1, 2, 'imported'),
    ('ORG0447', 'EcoLine', 'Công ty TNHH MTV EcoLine Việt Nam', '3082629429', 1996, 2, '2018', 1, 13, TRUE, 2, NULL, 'imported'),
    ('ORG0448', 'PioneerTech', 'Công ty TNHH PioneerTech Việt Nam', '4946965703', 2018, 2, '2024', 1, 10, FALSE, 2, 1, 'imported'),
    ('ORG0449', 'OmegaTrade', 'Công ty TNHH MTV OmegaTrade Việt Nam', '3175802532', 2003, 1, NULL, 1, 15, TRUE, 1, 2, 'imported'),
    ('ORG0450', 'SmartHub', 'Công ty TNHH MTV SmartHub Việt Nam', '1726947767', 2015, 1, NULL, 2, 2, TRUE, 2, NULL, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0451', 'GoldenCo', 'Công ty Cổ phần GoldenCo Việt Nam', '8708159741', 1995, 1, NULL, 1, 4, FALSE, 2, 1, 'imported'),
    ('ORG0452', 'CleanSolutions', 'Doanh nghiệp Tư nhân CleanSolutions Việt Nam', '3126801368', 2009, 1, NULL, 3, 17, TRUE, 2, 1, 'imported'),
    ('ORG0453', 'RuralPoint', 'Công ty Cổ phần RuralPoint Việt Nam', '3035257974', 2001, 1, NULL, 2, 4, FALSE, 2, NULL, 'imported'),
    ('ORG0454', 'VietBuild', 'Hợp tác xã VietBuild Việt Nam', '9023399012', 1995, 1, NULL, 2, 4, FALSE, 1, NULL, 'imported'),
    ('ORG0455', 'MekongLogistics', 'Công ty TNHH MekongLogistics Việt Nam', '4364526708', 2014, 2, '2024', 2, 17, TRUE, 2, NULL, 'imported'),
    ('ORG0456', 'ForestSupply', 'Công ty TNHH MTV ForestSupply Việt Nam', '7191825941', 2010, 2, '2023', 3, 14, TRUE, 1, 2, 'imported'),
    ('ORG0457', 'SkySystem', 'Công ty TNHH SkySystem Việt Nam', '9207857552', 2013, 1, NULL, 1, 9, TRUE, 2, 1, 'imported'),
    ('ORG0458', 'FloraPoint', 'Công ty Cổ phần FloraPoint Việt Nam', '1565424740', 2023, 1, NULL, 3, 7, TRUE, 1, NULL, 'imported'),
    ('ORG0459', 'HydroAlliance', 'Công ty TNHH HydroAlliance Việt Nam', '1278979168', 2008, 1, NULL, 4, 6, TRUE, 1, NULL, 'imported'),
    ('ORG0460', 'SmartEnergy', 'Hợp tác xã SmartEnergy Việt Nam', '5147931679', 2018, 1, NULL, 3, 22, TRUE, 1, 2, 'imported'),
    ('ORG0461', 'TechTrade', 'Hợp tác xã TechTrade Việt Nam', '8290956795', 2001, 1, NULL, 2, 2, TRUE, 2, NULL, 'imported'),
    ('ORG0462', 'RenewPoint', 'Hợp tác xã RenewPoint Việt Nam', '9979735078', 2011, 1, NULL, 4, 5, TRUE, 2, 1, 'imported'),
    ('ORG0463', 'GreenLogistics', 'Doanh nghiệp Tư nhân GreenLogistics Việt Nam', '7337206747', 2023, 1, NULL, 1, 15, TRUE, 2, 1, 'imported'),
    ('ORG0464', 'SunriseSupply', 'Công ty TNHH SunriseSupply Việt Nam', '4768544804', 2016, 1, NULL, 2, 10, FALSE, 1, 2, 'imported'),
    ('ORG0465', 'AlphaAsia', 'Công ty Cổ phần AlphaAsia Việt Nam', '2978209240', 2006, 2, '2024', 1, 8, FALSE, 1, 2, 'imported'),
    ('ORG0466', 'HydroVietnam', 'Doanh nghiệp Tư nhân HydroVietnam Việt Nam', '4033209410', 2010, 1, NULL, 4, 20, TRUE, 2, 1, 'imported'),
    ('ORG0467', 'FutureFarm', 'Công ty TNHH MTV FutureFarm Việt Nam', '9921805120', 2005, 1, NULL, 2, 14, TRUE, 1, NULL, 'imported'),
    ('ORG0468', 'WindAgency', 'Công ty TNHH WindAgency Việt Nam', '4465676206', 2011, 1, NULL, 4, 2, TRUE, 2, NULL, 'imported'),
    ('ORG0469', 'SparkVietnam', 'Công ty TNHH SparkVietnam Việt Nam', '1645908204', 2012, 2, '2021', 1, 15, TRUE, 2, NULL, 'imported'),
    ('ORG0470', 'PearlTech', 'Công ty TNHH MTV PearlTech Việt Nam', '2147767812', 2004, 1, NULL, 1, 18, FALSE, 2, NULL, 'imported'),
    ('ORG0471', 'SeedLink', 'Công ty TNHH MTV SeedLink Việt Nam', '2968897085', 2002, 1, NULL, 4, 17, TRUE, 1, NULL, 'imported'),
    ('ORG0472', 'BambooSupply', 'Công ty TNHH MTV BambooSupply Việt Nam', '4431481733', 1998, 2, '2021', 3, 17, TRUE, 1, 2, 'imported'),
    ('ORG0473', 'NanoNetwork', 'Công ty TNHH NanoNetwork Việt Nam', '1950578005', 2020, 1, NULL, 4, 21, TRUE, 2, 1, 'imported'),
    ('ORG0474', 'FreshConnect', 'Doanh nghiệp Tư nhân FreshConnect Việt Nam', '3996707622', 2009, 1, NULL, 3, 3, TRUE, 1, 2, 'imported'),
    ('ORG0475', 'PioneerLine', 'Công ty TNHH PioneerLine Việt Nam', '8490646376', 2008, 1, NULL, 2, 7, TRUE, 1, 2, 'imported'),
    ('ORG0476', 'WindCenter', 'Hợp tác xã WindCenter Việt Nam', '7582073468', 2016, 1, NULL, 4, 10, TRUE, 1, 2, 'imported'),
    ('ORG0477', 'VietCenter', 'Công ty TNHH VietCenter Việt Nam', '3658052055', 2008, 3, NULL, 2, 6, FALSE, 2, 1, 'imported'),
    ('ORG0478', 'VietNetwork', 'Công ty Cổ phần VietNetwork Việt Nam', '2258347772', 2000, 3, NULL, 4, 17, TRUE, 1, 2, 'imported'),
    ('ORG0479', 'MountainCorp', 'Doanh nghiệp Tư nhân MountainCorp Việt Nam', '9407719829', 2010, 3, NULL, 1, 12, TRUE, 2, 1, 'imported'),
    ('ORG0480', 'RuralServices', 'Công ty Cổ phần RuralServices Việt Nam', '8711841827', 2016, 1, NULL, 3, 11, TRUE, 2, 1, 'imported'),
    ('ORG0481', 'RiverZone', 'Hợp tác xã RiverZone Việt Nam', '8360728408', 2002, 1, NULL, 2, 5, FALSE, 1, 2, 'imported'),
    ('ORG0482', 'HarvestLink', 'Doanh nghiệp Tư nhân HarvestLink Việt Nam', '4865487796', 2011, 1, NULL, 4, 6, TRUE, 2, 1, 'imported'),
    ('ORG0483', 'GoldenStudio', 'Công ty TNHH GoldenStudio Việt Nam', '3791714419', 1999, 1, NULL, 2, 12, FALSE, 1, NULL, 'imported'),
    ('ORG0484', 'SolarLocal', 'Công ty TNHH MTV SolarLocal Việt Nam', '3246047970', 2021, 2, '2022', 4, 6, TRUE, 1, 2, 'imported'),
    ('ORG0485', 'ClearLine', 'Công ty TNHH MTV ClearLine Việt Nam', '7344879191', 2002, 1, NULL, 1, 16, TRUE, 1, NULL, 'imported'),
    ('ORG0486', 'NanoFactory', 'Doanh nghiệp Tư nhân NanoFactory Việt Nam', '5261628430', 2013, 2, '2019', 3, 9, TRUE, 1, NULL, 'imported'),
    ('ORG0487', 'OmegaMarket', 'Công ty Cổ phần OmegaMarket Việt Nam', '1767919393', 2011, 3, NULL, 2, 4, TRUE, 1, NULL, 'imported'),
    ('ORG0488', 'AgriWater', 'Doanh nghiệp Tư nhân AgriWater Việt Nam', '4375033100', 2005, 1, NULL, 3, 8, TRUE, 2, 1, 'imported'),
    ('ORG0489', 'SolarPacific', 'Hợp tác xã SolarPacific Việt Nam', '2177711456', 2014, 2, '2018', 3, 18, TRUE, 1, 2, 'imported'),
    ('ORG0490', 'PearlAlliance', 'Doanh nghiệp Tư nhân PearlAlliance Việt Nam', '3091826686', 1996, 1, NULL, 4, 10, TRUE, 1, 2, 'imported'),
    ('ORG0491', 'PrimeEdu', 'Hợp tác xã PrimeEdu Việt Nam', '1093852809', 1997, 1, NULL, 2, 11, TRUE, 2, NULL, 'imported'),
    ('ORG0492', 'DigitalGroup', 'Công ty TNHH MTV DigitalGroup Việt Nam', '2604060189', 2020, 1, NULL, 1, 19, TRUE, 1, 2, 'imported'),
    ('ORG0493', 'NovaBuild', 'Doanh nghiệp Tư nhân NovaBuild Việt Nam', '4173708484', 2016, 2, '2024', 1, 13, TRUE, 2, NULL, 'imported'),
    ('ORG0494', 'DeltaPartners', 'Hợp tác xã DeltaPartners Việt Nam', '7581454446', 2003, 1, NULL, 3, 6, TRUE, 1, NULL, 'imported'),
    ('ORG0495', 'VietSupply', 'Công ty Cổ phần VietSupply Việt Nam', '2164270893', 2002, 1, NULL, 1, 15, TRUE, 1, NULL, 'imported'),
    ('ORG0496', 'CleanLogistics', 'Công ty Cổ phần CleanLogistics Việt Nam', '7892771428', 2013, 1, NULL, 4, 1, TRUE, 1, NULL, 'imported'),
    ('ORG0497', 'NovaInstitute', 'Hợp tác xã NovaInstitute Việt Nam', '4011690926', 1997, 1, NULL, 2, 6, FALSE, 1, NULL, 'imported'),
    ('ORG0498', 'OceanPro', 'Công ty TNHH MTV OceanPro Việt Nam', '5971350322', 2016, 3, NULL, 2, 1, TRUE, 2, NULL, 'imported'),
    ('ORG0499', 'HarvestServices', 'Doanh nghiệp Tư nhân HarvestServices Việt Nam', '9789648210', 1996, 3, NULL, 1, 4, TRUE, 2, 1, 'imported'),
    ('ORG0500', 'CyclePro', 'Công ty TNHH MTV CyclePro Việt Nam', '5708994795', 2016, 1, NULL, 1, 4, TRUE, 2, NULL, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0501', 'ClearLink', 'Công ty TNHH MTV ClearLink Việt Nam', '9089926693', 2016, 2, '2021', 1, 7, TRUE, 1, NULL, 'imported'),
    ('ORG0502', 'ForestWater', 'Công ty TNHH MTV ForestWater Việt Nam', '7037250227', 2010, 1, NULL, 3, 11, TRUE, 1, NULL, 'imported'),
    ('ORG0503', 'EcoFlow', 'Công ty Cổ phần EcoFlow Việt Nam', '1406233127', 2015, 2, '2021', 4, 18, TRUE, 1, 2, 'imported'),
    ('ORG0504', 'ForestLink', 'Công ty TNHH MTV ForestLink Việt Nam', '4349806896', 2018, 1, NULL, 2, 4, TRUE, 1, 2, 'imported'),
    ('ORG0505', 'OceanVietnam', 'Công ty TNHH MTV OceanVietnam Việt Nam', '9469713575', 2007, 1, NULL, 3, 7, TRUE, 1, NULL, 'imported'),
    ('ORG0506', 'LotusPlus', 'Công ty TNHH LotusPlus Việt Nam', '9371106368', 2001, 1, NULL, 2, 22, TRUE, 2, 1, 'imported'),
    ('ORG0507', 'CleanFlow', 'Công ty TNHH MTV CleanFlow Việt Nam', '2951493270', 2021, 1, NULL, 1, 21, FALSE, 2, NULL, 'imported'),
    ('ORG0508', 'LotusAlliance', 'Doanh nghiệp Tư nhân LotusAlliance Việt Nam', '9432070587', 2019, 2, '2022', 3, 14, FALSE, 2, 1, 'imported'),
    ('ORG0509', 'FloraMarket', 'Công ty TNHH MTV FloraMarket Việt Nam', '7724287042', 2019, 1, NULL, 1, 4, TRUE, 1, NULL, 'imported'),
    ('ORG0510', 'BioAsia', 'Doanh nghiệp Tư nhân BioAsia Việt Nam', '1110125417', 2009, 2, '2024', 4, 9, TRUE, 2, 1, 'imported'),
    ('ORG0511', 'BambooBase', 'Công ty Cổ phần BambooBase Việt Nam', '4502414628', 2015, 1, NULL, 3, 10, TRUE, 1, 2, 'imported'),
    ('ORG0512', 'PrimePro', 'Công ty Cổ phần PrimePro Việt Nam', '5120197934', 2005, 2, '2020', 3, 18, TRUE, 1, NULL, 'imported'),
    ('ORG0513', 'PureVietnam', 'Công ty TNHH PureVietnam Việt Nam', '8724443850', 2007, 1, NULL, 1, 16, FALSE, 1, 2, 'imported'),
    ('ORG0514', 'SafeCapital', 'Doanh nghiệp Tư nhân SafeCapital Việt Nam', '3439909513', 2022, 3, NULL, 3, 9, TRUE, 2, NULL, 'imported'),
    ('ORG0515', 'LotusFlow', 'Công ty TNHH MTV LotusFlow Việt Nam', '1553040088', 2017, 3, NULL, 2, 15, TRUE, 2, 1, 'imported'),
    ('ORG0516', 'WindPlus', 'Công ty TNHH WindPlus Việt Nam', '9708376770', 2006, 1, NULL, 3, 11, FALSE, 1, 2, 'imported'),
    ('ORG0517', 'AquaFactory', 'Công ty TNHH AquaFactory Việt Nam', '7570320619', 2019, 1, NULL, 4, 4, TRUE, 2, NULL, 'imported'),
    ('ORG0518', 'TechDynamics', 'Doanh nghiệp Tư nhân TechDynamics Việt Nam', '9070520735', 1998, 1, NULL, 3, 15, TRUE, 1, 2, 'imported'),
    ('ORG0519', 'CircleFarm', 'Công ty TNHH CircleFarm Việt Nam', '6698818860', 1995, 1, NULL, 2, 21, FALSE, 2, NULL, 'imported'),
    ('ORG0520', 'PearlEnergy', 'Công ty TNHH MTV PearlEnergy Việt Nam', '8812525969', 2022, 1, NULL, 2, 19, FALSE, 1, 2, 'imported'),
    ('ORG0521', 'RiverServices', 'Công ty Cổ phần RiverServices Việt Nam', '3107833160', 1997, 1, NULL, 1, 17, TRUE, 1, 2, 'imported'),
    ('ORG0522', 'NovaAsia', 'Doanh nghiệp Tư nhân NovaAsia Việt Nam', '2619490213', 2015, 1, NULL, 4, 10, FALSE, 1, 2, 'imported'),
    ('ORG0523', 'MountainWater', 'Hợp tác xã MountainWater Việt Nam', '9047502562', 2004, 1, NULL, 4, 6, TRUE, 1, 2, 'imported'),
    ('ORG0524', 'HydroSystem', 'Công ty Cổ phần HydroSystem Việt Nam', '9534467201', 2002, 1, NULL, 4, 22, TRUE, 2, NULL, 'imported'),
    ('ORG0525', 'VietBase', 'Doanh nghiệp Tư nhân VietBase Việt Nam', '9634729829', 2021, 1, NULL, 1, 4, FALSE, 1, 2, 'imported'),
    ('ORG0526', 'SparkLab', 'Doanh nghiệp Tư nhân SparkLab Việt Nam', '4796865162', 2004, 1, NULL, 1, 8, FALSE, 1, 2, 'imported'),
    ('ORG0527', 'PrimeStudio', 'Công ty TNHH PrimeStudio Việt Nam', '5185478299', 1999, 1, NULL, 2, 12, TRUE, 2, NULL, 'imported'),
    ('ORG0528', 'RuralAlliance', 'Doanh nghiệp Tư nhân RuralAlliance Việt Nam', '2892064066', 2001, 1, NULL, 1, 14, TRUE, 1, 2, 'imported'),
    ('ORG0529', 'MountainBase', 'Công ty TNHH MTV MountainBase Việt Nam', '3698470384', 1996, 1, NULL, 3, 22, TRUE, 2, NULL, 'imported'),
    ('ORG0530', 'RiverHealth', 'Công ty Cổ phần RiverHealth Việt Nam', '4139528900', 2023, 1, NULL, 4, 14, TRUE, 1, 2, 'imported'),
    ('ORG0531', 'UrbanAlliance', 'Doanh nghiệp Tư nhân UrbanAlliance Việt Nam', '3276061103', 2005, 1, NULL, 3, 15, TRUE, 2, NULL, 'imported'),
    ('ORG0532', 'SafePacific', 'Công ty TNHH SafePacific Việt Nam', '1856458337', 2022, 2, '2024', 1, 7, FALSE, 2, 1, 'imported'),
    ('ORG0533', 'LotusPoint', 'Công ty Cổ phần LotusPoint Việt Nam', '7385263415', 2009, 1, NULL, 1, 11, TRUE, 1, NULL, 'imported'),
    ('ORG0534', 'PrimeCapital', 'Hợp tác xã PrimeCapital Việt Nam', '4021952801', 2013, 3, NULL, 2, 18, TRUE, 2, 1, 'imported'),
    ('ORG0535', 'MountainCapital', 'Công ty Cổ phần MountainCapital Việt Nam', '4294833050', 2010, 3, NULL, 3, 11, FALSE, 1, 2, 'imported'),
    ('ORG0536', 'DigitalTech', 'Công ty TNHH MTV DigitalTech Việt Nam', '6021075141', 2020, 1, NULL, 1, 21, TRUE, 1, 2, 'imported'),
    ('ORG0537', 'RenewSolutions', 'Công ty Cổ phần RenewSolutions Việt Nam', '9635795733', 2005, 1, NULL, 4, 11, TRUE, 2, 1, 'imported'),
    ('ORG0538', 'HydroVenture', 'Hợp tác xã HydroVenture Việt Nam', '4847513935', 2009, 1, NULL, 1, 3, TRUE, 1, 2, 'imported'),
    ('ORG0539', 'PureWater', 'Công ty TNHH PureWater Việt Nam', '1797037746', 2017, 1, NULL, 1, 13, TRUE, 2, 1, 'imported'),
    ('ORG0540', 'TerraLab', 'Công ty TNHH TerraLab Việt Nam', '1808306475', 1995, 1, NULL, 3, 7, TRUE, 2, NULL, 'imported'),
    ('ORG0541', 'AquaMarket', 'Hợp tác xã AquaMarket Việt Nam', '9849367682', 1996, 1, NULL, 1, 19, TRUE, 2, 1, 'imported'),
    ('ORG0542', 'AgriSolutions', 'Hợp tác xã AgriSolutions Việt Nam', '7054754528', 2001, 3, NULL, 4, 14, TRUE, 1, 2, 'imported'),
    ('ORG0543', 'FreshPartners', 'Công ty Cổ phần FreshPartners Việt Nam', '1931981239', 2021, 2, '2023', 3, 8, TRUE, 1, 2, 'imported'),
    ('ORG0544', 'UrbanDynamics', 'Doanh nghiệp Tư nhân UrbanDynamics Việt Nam', '7905524242', 1997, 3, NULL, 2, 11, TRUE, 2, 1, 'imported'),
    ('ORG0545', 'AquaTech', 'Doanh nghiệp Tư nhân AquaTech Việt Nam', '6884141787', 2010, 1, NULL, 3, 18, TRUE, 2, 1, 'imported'),
    ('ORG0546', 'EcoNetwork', 'Công ty TNHH MTV EcoNetwork Việt Nam', '4782698673', 2010, 1, NULL, 3, 3, FALSE, 2, NULL, 'imported'),
    ('ORG0547', 'RenewServices', 'Hợp tác xã RenewServices Việt Nam', '9403823468', 1995, 1, NULL, 1, 10, TRUE, 1, 2, 'imported'),
    ('ORG0548', 'FreshTrade', 'Công ty TNHH FreshTrade Việt Nam', '9713720840', 2001, 1, NULL, 2, 20, TRUE, 2, 1, 'imported'),
    ('ORG0549', 'UrbanGate', 'Doanh nghiệp Tư nhân UrbanGate Việt Nam', '2584078422', 1995, 1, NULL, 3, 20, TRUE, 1, 2, 'imported'),
    ('ORG0550', 'FloraEdu', 'Công ty TNHH FloraEdu Việt Nam', '8536205444', 1998, 1, NULL, 4, 21, TRUE, 2, 1, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0551', 'RenewTech', 'Công ty TNHH RenewTech Việt Nam', '3994828174', 2016, 1, NULL, 3, 11, FALSE, 2, 1, 'imported'),
    ('ORG0552', 'MekongHealth', 'Công ty TNHH MTV MekongHealth Việt Nam', '3110826315', 1996, 1, NULL, 1, 21, TRUE, 2, NULL, 'imported'),
    ('ORG0553', 'CleanInstitute', 'Hợp tác xã CleanInstitute Việt Nam', '2939820995', 2007, 3, NULL, 2, 7, TRUE, 2, 1, 'imported'),
    ('ORG0554', 'BambooFood', 'Công ty TNHH MTV BambooFood Việt Nam', '5397241324', 2021, 3, NULL, 3, 15, TRUE, 2, 1, 'imported'),
    ('ORG0555', 'SafeGroup', 'Công ty TNHH SafeGroup Việt Nam', '9361386989', 1995, 1, NULL, 2, 21, FALSE, 1, 2, 'imported'),
    ('ORG0556', 'MekongLab', 'Công ty TNHH MekongLab Việt Nam', '9298062261', 2009, 1, NULL, 3, 9, FALSE, 1, 2, 'imported'),
    ('ORG0557', 'AlphaPacific', 'Công ty Cổ phần AlphaPacific Việt Nam', '5178604256', 2008, 1, NULL, 3, 7, TRUE, 1, 2, 'imported'),
    ('ORG0558', 'DigitalHealth', 'Công ty TNHH DigitalHealth Việt Nam', '6525548910', 2017, 1, NULL, 2, 11, TRUE, 2, NULL, 'imported'),
    ('ORG0559', 'SmartStudio', 'Hợp tác xã SmartStudio Việt Nam', '4800068305', 2008, 1, NULL, 3, 17, TRUE, 1, 2, 'imported'),
    ('ORG0560', 'BlueZone', 'Công ty TNHH BlueZone Việt Nam', '5047104149', 2011, 1, NULL, 4, 17, TRUE, 2, NULL, 'imported'),
    ('ORG0561', 'FloraFarm', 'Công ty TNHH MTV FloraFarm Việt Nam', '4435695558', 2017, 1, NULL, 1, 7, FALSE, 1, NULL, 'imported'),
    ('ORG0562', 'ForestAlliance', 'Doanh nghiệp Tư nhân ForestAlliance Việt Nam', '9635325734', 2008, 3, NULL, 1, 22, TRUE, 2, 1, 'imported'),
    ('ORG0563', 'ClearFactory', 'Hợp tác xã ClearFactory Việt Nam', '8236367804', 1998, 2, '2024', 2, 21, FALSE, 1, 2, 'imported'),
    ('ORG0564', 'MekongFactory', 'Doanh nghiệp Tư nhân MekongFactory Việt Nam', '1407823323', 2009, 2, '2024', 4, 18, FALSE, 1, NULL, 'imported'),
    ('ORG0565', 'CleanFund', 'Công ty Cổ phần CleanFund Việt Nam', '1329942192', 2008, 1, NULL, 1, 10, TRUE, 1, NULL, 'imported'),
    ('ORG0566', 'SwiftZone', 'Công ty TNHH SwiftZone Việt Nam', '7176580843', 2018, 1, NULL, 1, 14, TRUE, 2, NULL, 'imported'),
    ('ORG0567', 'ForestCapital', 'Doanh nghiệp Tư nhân ForestCapital Việt Nam', '1590675140', 2016, 3, NULL, 3, 16, TRUE, 1, 2, 'imported'),
    ('ORG0568', 'TerraAsia', 'Công ty TNHH TerraAsia Việt Nam', '2597120365', 2018, 1, NULL, 2, 11, FALSE, 1, 2, 'imported'),
    ('ORG0569', 'AquaServices', 'Công ty Cổ phần AquaServices Việt Nam', '4266400036', 2020, 1, NULL, 3, 8, TRUE, 2, NULL, 'imported'),
    ('ORG0570', 'HydroAgency', 'Hợp tác xã HydroAgency Việt Nam', '6973338427', 2001, 1, NULL, 2, 8, TRUE, 2, 1, 'imported'),
    ('ORG0571', 'BioPro', 'Hợp tác xã BioPro Việt Nam', '6984037689', 2023, 1, NULL, 4, 13, TRUE, 1, 2, 'imported'),
    ('ORG0572', 'FutureHealth', 'Hợp tác xã FutureHealth Việt Nam', '6116450998', 2014, 3, NULL, 2, 20, FALSE, 1, 2, 'imported'),
    ('ORG0573', 'OceanCenter', 'Công ty Cổ phần OceanCenter Việt Nam', '8861462036', 2018, 1, NULL, 4, 18, TRUE, 2, NULL, 'imported'),
    ('ORG0574', 'ClearBuild', 'Công ty TNHH MTV ClearBuild Việt Nam', '7732162114', 2012, 1, NULL, 3, 4, TRUE, 1, NULL, 'imported'),
    ('ORG0575', 'BioAlliance', 'Công ty TNHH MTV BioAlliance Việt Nam', '1257182161', 2003, 1, NULL, 3, 18, FALSE, 2, 1, 'imported'),
    ('ORG0576', 'HarvestFactory', 'Hợp tác xã HarvestFactory Việt Nam', '8771959511', 2000, 1, NULL, 3, 4, TRUE, 1, NULL, 'imported'),
    ('ORG0577', 'MountainFactory', 'Doanh nghiệp Tư nhân MountainFactory Việt Nam', '9688833034', 2018, 1, NULL, 4, 15, TRUE, 1, NULL, 'imported'),
    ('ORG0578', 'LotusDynamics', 'Hợp tác xã LotusDynamics Việt Nam', '4858824552', 2003, 1, NULL, 4, 1, TRUE, 2, 1, 'imported'),
    ('ORG0579', 'OmegaLogistics', 'Công ty Cổ phần OmegaLogistics Việt Nam', '6933257157', 2003, 1, NULL, 3, 3, FALSE, 2, 1, 'imported'),
    ('ORG0580', 'SmartFactory', 'Công ty TNHH SmartFactory Việt Nam', '4182978511', 2002, 1, NULL, 1, 3, TRUE, 1, NULL, 'imported'),
    ('ORG0581', 'UrbanLogistics', 'Hợp tác xã UrbanLogistics Việt Nam', '9678917545', 1995, 1, NULL, 3, 19, FALSE, 2, 1, 'imported'),
    ('ORG0582', 'OceanConnect', 'Công ty TNHH MTV OceanConnect Việt Nam', '8725950616', 2007, 1, NULL, 4, 9, TRUE, 2, NULL, 'imported'),
    ('ORG0583', 'SwiftPacific', 'Doanh nghiệp Tư nhân SwiftPacific Việt Nam', '6909635425', 2021, 3, NULL, 2, 15, TRUE, 1, 2, 'imported'),
    ('ORG0584', 'AlphaWorks', 'Doanh nghiệp Tư nhân AlphaWorks Việt Nam', '5121529498', 2018, 2, '2020', 4, 3, TRUE, 2, NULL, 'imported'),
    ('ORG0585', 'HarvestDynamics', 'Công ty TNHH MTV HarvestDynamics Việt Nam', '2157960161', 1995, 1, NULL, 3, 10, TRUE, 2, NULL, 'imported'),
    ('ORG0586', 'MountainSystem', 'Doanh nghiệp Tư nhân MountainSystem Việt Nam', '8023150671', 2011, 2, '2022', 3, 1, TRUE, 1, NULL, 'imported'),
    ('ORG0587', 'BambooAgency', 'Doanh nghiệp Tư nhân BambooAgency Việt Nam', '4380191457', 1997, 1, NULL, 3, 16, TRUE, 2, 1, 'imported'),
    ('ORG0588', 'NovaCapital', 'Hợp tác xã NovaCapital Việt Nam', '7480397097', 1995, 1, NULL, 2, 18, TRUE, 1, 2, 'imported'),
    ('ORG0589', 'PioneerZone', 'Hợp tác xã PioneerZone Việt Nam', '2284558276', 2007, 1, NULL, 4, 14, TRUE, 1, NULL, 'imported'),
    ('ORG0590', 'SunriseGlobal', 'Công ty Cổ phần SunriseGlobal Việt Nam', '2230368944', 2007, 3, NULL, 1, 5, TRUE, 2, 1, 'imported'),
    ('ORG0591', 'RiverFund', 'Hợp tác xã RiverFund Việt Nam', '1375896352', 2021, 1, NULL, 1, 7, FALSE, 1, 2, 'imported'),
    ('ORG0592', 'BambooLogistics', 'Công ty TNHH MTV BambooLogistics Việt Nam', '5707800373', 2022, 1, NULL, 3, 17, TRUE, 2, NULL, 'imported'),
    ('ORG0593', 'BioVenture', 'Công ty TNHH BioVenture Việt Nam', '1505595570', 1999, 1, NULL, 2, 16, TRUE, 2, NULL, 'imported'),
    ('ORG0594', 'SolarSolutions', 'Hợp tác xã SolarSolutions Việt Nam', '2673143473', 2001, 1, NULL, 4, 22, FALSE, 2, 1, 'imported'),
    ('ORG0595', 'LotusCore', 'Công ty TNHH MTV LotusCore Việt Nam', '6070264390', 1999, 1, NULL, 4, 17, TRUE, 1, NULL, 'imported'),
    ('ORG0596', 'SeedSolutions', 'Doanh nghiệp Tư nhân SeedSolutions Việt Nam', '2960379288', 2019, 1, NULL, 4, 20, TRUE, 1, 2, 'imported'),
    ('ORG0597', 'GreenLink', 'Công ty Cổ phần GreenLink Việt Nam', '1174135798', 2003, 1, NULL, 4, 1, TRUE, 2, 1, 'imported'),
    ('ORG0598', 'VietFarm', 'Doanh nghiệp Tư nhân VietFarm Việt Nam', '5637176934', 2015, 1, NULL, 3, 22, TRUE, 2, NULL, 'imported'),
    ('ORG0599', 'RenewCenter', 'Công ty TNHH RenewCenter Việt Nam', '5024825971', 2017, 3, NULL, 4, 17, TRUE, 1, 2, 'imported'),
    ('ORG0600', 'SeedTech', 'Công ty TNHH MTV SeedTech Việt Nam', '1272442575', 2003, 2, '2022', 4, 14, FALSE, 1, 2, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0601', 'RiverWater', 'Công ty TNHH RiverWater Việt Nam', '5451215980', 2015, 1, NULL, 3, 14, FALSE, 1, 2, 'imported'),
    ('ORG0602', 'CleanFactory', 'Công ty TNHH CleanFactory Việt Nam', '8035501292', 2018, 3, NULL, 2, 9, TRUE, 2, 1, 'imported'),
    ('ORG0603', 'EcoTrade', 'Hợp tác xã EcoTrade Việt Nam', '5724990673', 2004, 1, NULL, 1, 8, TRUE, 1, NULL, 'imported'),
    ('ORG0604', 'PioneerVenture', 'Hợp tác xã PioneerVenture Việt Nam', '1223567941', 2004, 2, '2018', 1, 9, FALSE, 1, 2, 'imported'),
    ('ORG0605', 'WindCore', 'Công ty Cổ phần WindCore Việt Nam', '9545468157', 2021, 1, NULL, 2, 2, TRUE, 2, NULL, 'imported'),
    ('ORG0606', 'CleanDynamics', 'Doanh nghiệp Tư nhân CleanDynamics Việt Nam', '7894521683', 2014, 1, NULL, 1, 22, FALSE, 1, NULL, 'imported'),
    ('ORG0607', 'CleanZone', 'Công ty TNHH CleanZone Việt Nam', '3799687315', 2003, 3, NULL, 1, 12, TRUE, 2, 1, 'imported'),
    ('ORG0608', 'LotusMarket', 'Doanh nghiệp Tư nhân LotusMarket Việt Nam', '9371505482', 2022, 1, NULL, 1, 15, FALSE, 2, NULL, 'imported'),
    ('ORG0609', 'MicroHealth', 'Doanh nghiệp Tư nhân MicroHealth Việt Nam', '9005165377', 2009, 1, NULL, 4, 13, FALSE, 1, 2, 'imported'),
    ('ORG0610', 'BrightHub', 'Công ty Cổ phần BrightHub Việt Nam', '9155179392', 1997, 2, '2018', 3, 18, TRUE, 2, 1, 'imported'),
    ('ORG0611', 'BrightPlus', 'Công ty TNHH BrightPlus Việt Nam', '6926717770', 2016, 1, NULL, 3, 16, TRUE, 1, NULL, 'imported'),
    ('ORG0612', 'CyclePoint', 'Công ty TNHH CyclePoint Việt Nam', '7651049165', 2001, 3, NULL, 4, 4, TRUE, 2, 1, 'imported'),
    ('ORG0613', 'CycleLogistics', 'Công ty TNHH CycleLogistics Việt Nam', '5261711194', 2002, 2, '2024', 4, 12, FALSE, 2, 1, 'imported'),
    ('ORG0614', 'BioAgency', 'Công ty Cổ phần BioAgency Việt Nam', '1897952768', 2018, 2, '2019', 2, 12, FALSE, 2, 1, 'imported'),
    ('ORG0615', 'CycleEnergy', 'Doanh nghiệp Tư nhân CycleEnergy Việt Nam', '1466108861', 1996, 1, NULL, 3, 15, TRUE, 1, 2, 'imported'),
    ('ORG0616', 'EcoWater', 'Doanh nghiệp Tư nhân EcoWater Việt Nam', '6564277090', 2021, 2, '2024', 1, 18, TRUE, 2, NULL, 'imported'),
    ('ORG0617', 'PureEdu', 'Công ty TNHH PureEdu Việt Nam', '4798559347', 2020, 3, NULL, 2, 6, TRUE, 1, NULL, 'imported'),
    ('ORG0618', 'SeedCenter', 'Công ty TNHH MTV SeedCenter Việt Nam', '9934205769', 2008, 1, NULL, 1, 22, FALSE, 1, 2, 'imported'),
    ('ORG0619', 'PrimeFlow', 'Hợp tác xã PrimeFlow Việt Nam', '9700921983', 1998, 3, NULL, 3, 9, TRUE, 1, NULL, 'imported'),
    ('ORG0620', 'UrbanVietnam', 'Doanh nghiệp Tư nhân UrbanVietnam Việt Nam', '9763378972', 2011, 2, '2020', 3, 21, TRUE, 2, NULL, 'imported'),
    ('ORG0621', 'GoldenCore', 'Công ty Cổ phần GoldenCore Việt Nam', '9549851997', 2020, 1, NULL, 1, 21, FALSE, 2, NULL, 'imported'),
    ('ORG0622', 'GoldenGroup', 'Công ty TNHH GoldenGroup Việt Nam', '9011193445', 1996, 1, NULL, 3, 21, TRUE, 1, 2, 'imported'),
    ('ORG0623', 'FreshFund', 'Công ty TNHH FreshFund Việt Nam', '8206538713', 2002, 1, NULL, 2, 12, TRUE, 2, NULL, 'imported'),
    ('ORG0624', 'MountainLogistics', 'Hợp tác xã MountainLogistics Việt Nam', '4751511984', 2015, 3, NULL, 2, 1, TRUE, 1, 2, 'imported'),
    ('ORG0625', 'FutureLink', 'Công ty Cổ phần FutureLink Việt Nam', '6477943864', 2017, 1, NULL, 3, 8, TRUE, 1, 2, 'imported'),
    ('ORG0626', 'DeltaServices', 'Công ty TNHH DeltaServices Việt Nam', '1386794567', 2018, 2, '2021', 2, 16, TRUE, 1, NULL, 'imported'),
    ('ORG0627', 'SparkCore', 'Doanh nghiệp Tư nhân SparkCore Việt Nam', '2672205455', 2014, 3, NULL, 2, 7, TRUE, 1, 2, 'imported'),
    ('ORG0628', 'RuralCapital', 'Doanh nghiệp Tư nhân RuralCapital Việt Nam', '6212809380', 2007, 1, NULL, 3, 4, TRUE, 2, NULL, 'imported'),
    ('ORG0629', 'AgriFood', 'Công ty TNHH MTV AgriFood Việt Nam', '1635149757', 2018, 1, NULL, 3, 5, TRUE, 2, 1, 'imported'),
    ('ORG0630', 'CleanPoint', 'Công ty Cổ phần CleanPoint Việt Nam', '4635848624', 1998, 1, NULL, 1, 1, TRUE, 2, NULL, 'imported'),
    ('ORG0631', 'NovaCore', 'Công ty TNHH MTV NovaCore Việt Nam', '6082681041', 2021, 1, NULL, 3, 10, TRUE, 1, NULL, 'imported'),
    ('ORG0632', 'PioneerSolutions', 'Công ty Cổ phần PioneerSolutions Việt Nam', '4108943608', 1999, 2, '2022', 3, 19, TRUE, 1, 2, 'imported'),
    ('ORG0633', 'PearlFactory', 'Công ty TNHH MTV PearlFactory Việt Nam', '8765601772', 2008, 3, NULL, 4, 21, TRUE, 1, NULL, 'imported'),
    ('ORG0634', 'DeltaTrade', 'Công ty Cổ phần DeltaTrade Việt Nam', '7141264617', 2021, 2, '2024', 1, 21, FALSE, 2, NULL, 'imported'),
    ('ORG0635', 'PureAlliance', 'Công ty TNHH MTV PureAlliance Việt Nam', '4251342697', 2015, 3, NULL, 4, 11, TRUE, 1, 2, 'imported'),
    ('ORG0636', 'AquaFood', 'Công ty TNHH AquaFood Việt Nam', '7707854414', 2013, 2, '2021', 3, 7, FALSE, 2, NULL, 'imported'),
    ('ORG0637', 'SunriseVietnam', 'Công ty TNHH SunriseVietnam Việt Nam', '5288282161', 1995, 2, '2018', 3, 1, TRUE, 1, 2, 'imported'),
    ('ORG0638', 'NanoLink', 'Công ty Cổ phần NanoLink Việt Nam', '9372711075', 2008, 1, NULL, 4, 15, FALSE, 2, NULL, 'imported'),
    ('ORG0639', 'RenewVenture', 'Doanh nghiệp Tư nhân RenewVenture Việt Nam', '8842636165', 1995, 1, NULL, 1, 13, FALSE, 2, NULL, 'imported'),
    ('ORG0640', 'CycleVenture', 'Doanh nghiệp Tư nhân CycleVenture Việt Nam', '1045704406', 2007, 1, NULL, 2, 17, TRUE, 2, NULL, 'imported'),
    ('ORG0641', 'CycleTrade', 'Hợp tác xã CycleTrade Việt Nam', '9801179137', 2016, 1, NULL, 4, 9, TRUE, 2, 1, 'imported'),
    ('ORG0642', 'DigitalAlliance', 'Công ty TNHH MTV DigitalAlliance Việt Nam', '1801648461', 2023, 3, NULL, 2, 9, TRUE, 2, NULL, 'imported'),
    ('ORG0643', 'FutureEnergy', 'Công ty TNHH MTV FutureEnergy Việt Nam', '6662663704', 2022, 3, NULL, 4, 13, TRUE, 1, 2, 'imported'),
    ('ORG0644', 'FreshVenture', 'Công ty Cổ phần FreshVenture Việt Nam', '1775022450', 1995, 1, NULL, 3, 18, TRUE, 2, 1, 'imported'),
    ('ORG0645', 'BrightAsia', 'Doanh nghiệp Tư nhân BrightAsia Việt Nam', '5101226530', 2005, 1, NULL, 3, 2, TRUE, 1, 2, 'imported'),
    ('ORG0646', 'OceanPlus', 'Doanh nghiệp Tư nhân OceanPlus Việt Nam', '7474813107', 2022, 1, NULL, 4, 13, TRUE, 2, NULL, 'imported'),
    ('ORG0647', 'HydroConnect', 'Doanh nghiệp Tư nhân HydroConnect Việt Nam', '7410114897', 1997, 2, '2022', 3, 17, TRUE, 1, 2, 'imported'),
    ('ORG0648', 'EcoAlliance', 'Hợp tác xã EcoAlliance Việt Nam', '6970667812', 1996, 2, '2020', 3, 12, TRUE, 2, NULL, 'imported'),
    ('ORG0649', 'PureFund', 'Công ty TNHH MTV PureFund Việt Nam', '8931701298', 2015, 1, NULL, 1, 11, FALSE, 2, NULL, 'imported'),
    ('ORG0650', 'BrightLogistics', 'Doanh nghiệp Tư nhân BrightLogistics Việt Nam', '3983274325', 2005, 1, NULL, 4, 12, TRUE, 2, NULL, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0651', 'SafeLab', 'Công ty TNHH MTV SafeLab Việt Nam', '4575118400', 2001, 1, NULL, 3, 2, TRUE, 1, 2, 'imported'),
    ('ORG0652', 'RiverFactory', 'Công ty Cổ phần RiverFactory Việt Nam', '8806269776', 2000, 1, NULL, 3, 5, TRUE, 1, NULL, 'imported'),
    ('ORG0653', 'OmegaGate', 'Công ty TNHH OmegaGate Việt Nam', '4585920387', 2011, 1, NULL, 3, 13, TRUE, 1, 2, 'imported'),
    ('ORG0654', 'PureMarket', 'Hợp tác xã PureMarket Việt Nam', '7486295541', 2003, 1, NULL, 3, 6, TRUE, 1, NULL, 'imported'),
    ('ORG0655', 'FreshSupply', 'Hợp tác xã FreshSupply Việt Nam', '3745192936', 1996, 3, NULL, 3, 11, TRUE, 1, NULL, 'imported'),
    ('ORG0656', 'CircleLink', 'Công ty TNHH MTV CircleLink Việt Nam', '6940229940', 2004, 1, NULL, 4, 5, TRUE, 1, NULL, 'imported'),
    ('ORG0657', 'MekongEnergy', 'Công ty TNHH MTV MekongEnergy Việt Nam', '1574347894', 2011, 3, NULL, 4, 1, FALSE, 1, 2, 'imported'),
    ('ORG0658', 'TechEnergy', 'Hợp tác xã TechEnergy Việt Nam', '7356893391', 2009, 2, '2023', 1, 11, TRUE, 1, 2, 'imported'),
    ('ORG0659', 'PrimeLab', 'Doanh nghiệp Tư nhân PrimeLab Việt Nam', '1753977213', 2017, 3, NULL, 2, 1, FALSE, 2, NULL, 'imported'),
    ('ORG0660', 'LotusGate', 'Công ty TNHH MTV LotusGate Việt Nam', '1617929641', 2004, 1, NULL, 2, 11, FALSE, 2, NULL, 'imported'),
    ('ORG0661', 'RuralMedia', 'Hợp tác xã RuralMedia Việt Nam', '1500273103', 2013, 3, NULL, 1, 11, TRUE, 1, 2, 'imported'),
    ('ORG0662', 'CircleEdu', 'Công ty Cổ phần CircleEdu Việt Nam', '1640979105', 2012, 1, NULL, 2, 6, TRUE, 1, 2, 'imported'),
    ('ORG0663', 'TechEdu', 'Công ty TNHH MTV TechEdu Việt Nam', '4300977393', 2006, 1, NULL, 3, 4, TRUE, 2, NULL, 'imported'),
    ('ORG0664', 'EcoVenture', 'Hợp tác xã EcoVenture Việt Nam', '6148976416', 2018, 1, NULL, 4, 16, TRUE, 1, NULL, 'imported'),
    ('ORG0665', 'TerraConnect', 'Doanh nghiệp Tư nhân TerraConnect Việt Nam', '3835463608', 2018, 1, NULL, 1, 4, TRUE, 1, NULL, 'imported'),
    ('ORG0666', 'MekongFlow', 'Công ty TNHH MekongFlow Việt Nam', '3836126778', 2008, 1, NULL, 1, 3, TRUE, 2, NULL, 'imported'),
    ('ORG0667', 'PureTech', 'Công ty TNHH MTV PureTech Việt Nam', '8932259541', 1999, 1, NULL, 3, 5, FALSE, 2, 1, 'imported'),
    ('ORG0668', 'RiverVietnam', 'Hợp tác xã RiverVietnam Việt Nam', '1559778590', 2012, 1, NULL, 4, 4, FALSE, 2, 1, 'imported'),
    ('ORG0669', 'SmartGlobal', 'Doanh nghiệp Tư nhân SmartGlobal Việt Nam', '5391090337', 2018, 1, NULL, 2, 22, TRUE, 1, NULL, 'imported'),
    ('ORG0670', 'SunriseMarket', 'Công ty TNHH MTV SunriseMarket Việt Nam', '8043053505', 2023, 1, NULL, 3, 10, FALSE, 2, 1, 'imported'),
    ('ORG0671', 'PearlLab', 'Công ty TNHH MTV PearlLab Việt Nam', '1526721134', 1996, 1, NULL, 4, 13, TRUE, 2, 1, 'imported'),
    ('ORG0672', 'ClearTech', 'Công ty TNHH ClearTech Việt Nam', '9479129458', 1999, 1, NULL, 2, 11, TRUE, 1, 2, 'imported'),
    ('ORG0673', 'BrightGlobal', 'Công ty Cổ phần BrightGlobal Việt Nam', '8199937700', 1995, 2, '2018', 3, 7, TRUE, 1, 2, 'imported'),
    ('ORG0674', 'AquaLink', 'Công ty Cổ phần AquaLink Việt Nam', '4567799446', 2013, 1, NULL, 3, 11, FALSE, 1, 2, 'imported'),
    ('ORG0675', 'PearlGate', 'Công ty TNHH PearlGate Việt Nam', '8286145992', 2012, 1, NULL, 1, 19, TRUE, 2, 1, 'imported'),
    ('ORG0676', 'PioneerVietnam', 'Công ty TNHH MTV PioneerVietnam Việt Nam', '2256776246', 2021, 1, NULL, 4, 19, TRUE, 2, NULL, 'imported'),
    ('ORG0677', 'PrimeFarm', 'Công ty TNHH PrimeFarm Việt Nam', '9207986756', 2013, 1, NULL, 2, 4, TRUE, 1, NULL, 'imported'),
    ('ORG0678', 'TerraLine', 'Công ty TNHH MTV TerraLine Việt Nam', '1480850393', 2012, 3, NULL, 4, 9, TRUE, 2, 1, 'imported'),
    ('ORG0679', 'EcoMedia', 'Công ty TNHH MTV EcoMedia Việt Nam', '5496067653', 1996, 1, NULL, 3, 20, TRUE, 2, NULL, 'imported'),
    ('ORG0680', 'RenewCore', 'Công ty Cổ phần RenewCore Việt Nam', '8525455135', 2008, 1, NULL, 1, 19, TRUE, 2, NULL, 'imported'),
    ('ORG0681', 'RenewGate', 'Công ty Cổ phần RenewGate Việt Nam', '6915831426', 2017, 3, NULL, 2, 10, TRUE, 1, 2, 'imported'),
    ('ORG0682', 'FreshGate', 'Hợp tác xã FreshGate Việt Nam', '5733954521', 2004, 1, NULL, 2, 1, TRUE, 1, NULL, 'imported'),
    ('ORG0683', 'AquaGlobal', 'Công ty TNHH AquaGlobal Việt Nam', '1272343789', 2010, 1, NULL, 2, 7, FALSE, 2, NULL, 'imported'),
    ('ORG0684', 'SunriseSystem', 'Công ty TNHH SunriseSystem Việt Nam', '4908462150', 2003, 1, NULL, 4, 11, FALSE, 1, 2, 'imported'),
    ('ORG0685', 'BambooStudio', 'Công ty TNHH MTV BambooStudio Việt Nam', '9769596935', 2017, 2, '2019', 3, 14, TRUE, 1, 2, 'imported'),
    ('ORG0686', 'ClearAsia', 'Công ty TNHH MTV ClearAsia Việt Nam', '7655275658', 2017, 2, '2019', 3, 19, FALSE, 2, 1, 'imported'),
    ('ORG0687', 'TerraVietnam', 'Công ty TNHH TerraVietnam Việt Nam', '2508654691', 2002, 3, NULL, 4, 7, TRUE, 2, NULL, 'imported'),
    ('ORG0688', 'MountainMarket', 'Công ty TNHH MountainMarket Việt Nam', '1211105058', 1996, 1, NULL, 4, 13, TRUE, 2, 1, 'imported'),
    ('ORG0689', 'NovaPro', 'Doanh nghiệp Tư nhân NovaPro Việt Nam', '8543106319', 2005, 2, '2020', 2, 17, FALSE, 1, NULL, 'imported'),
    ('ORG0690', 'SolarHub', 'Doanh nghiệp Tư nhân SolarHub Việt Nam', '8012066748', 2004, 1, NULL, 1, 6, TRUE, 1, NULL, 'imported'),
    ('ORG0691', 'SafeCorp', 'Doanh nghiệp Tư nhân SafeCorp Việt Nam', '1119180627', 2005, 1, NULL, 4, 2, FALSE, 1, 2, 'imported'),
    ('ORG0692', 'BrightStudio', 'Hợp tác xã BrightStudio Việt Nam', '8739161742', 2000, 3, NULL, 2, 4, TRUE, 1, NULL, 'imported'),
    ('ORG0693', 'SolarConnect', 'Công ty TNHH MTV SolarConnect Việt Nam', '6019973365', 2012, 3, NULL, 3, 9, FALSE, 2, 1, 'imported'),
    ('ORG0694', 'FreshWater', 'Công ty TNHH FreshWater Việt Nam', '1478475087', 2018, 1, NULL, 1, 15, TRUE, 2, 1, 'imported'),
    ('ORG0695', 'CycleVietnam', 'Công ty Cổ phần CycleVietnam Việt Nam', '4520360280', 2012, 3, NULL, 4, 8, TRUE, 1, NULL, 'imported'),
    ('ORG0696', 'DeltaSystem', 'Công ty Cổ phần DeltaSystem Việt Nam', '9079248270', 2023, 1, NULL, 1, 13, TRUE, 2, 1, 'imported'),
    ('ORG0697', 'HydroPro', 'Hợp tác xã HydroPro Việt Nam', '6419765847', 2003, 1, NULL, 2, 15, TRUE, 1, NULL, 'imported'),
    ('ORG0698', 'BambooFlow', 'Doanh nghiệp Tư nhân BambooFlow Việt Nam', '5556620439', 2011, 1, NULL, 3, 13, FALSE, 1, NULL, 'imported'),
    ('ORG0699', 'LotusEdu', 'Công ty TNHH MTV LotusEdu Việt Nam', '4403112126', 2011, 1, NULL, 2, 6, FALSE, 1, 2, 'imported'),
    ('ORG0700', 'EcoCorp', 'Công ty TNHH MTV EcoCorp Việt Nam', '6952566201', 1995, 1, NULL, 4, 13, FALSE, 1, NULL, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0701', 'RenewTrade', 'Hợp tác xã RenewTrade Việt Nam', '3791194627', 2002, 3, NULL, 2, 7, TRUE, 2, NULL, 'imported'),
    ('ORG0702', 'SparkAsia', 'Công ty Cổ phần SparkAsia Việt Nam', '5310035375', 2009, 2, '2018', 4, 14, FALSE, 2, NULL, 'imported'),
    ('ORG0703', 'FloraHealth', 'Hợp tác xã FloraHealth Việt Nam', '2391273095', 1997, 1, NULL, 2, 14, TRUE, 2, 1, 'imported'),
    ('ORG0704', 'RenewLink', 'Công ty TNHH MTV RenewLink Việt Nam', '5803118954', 2012, 1, NULL, 4, 6, TRUE, 2, 1, 'imported'),
    ('ORG0705', 'SparkPlus', 'Doanh nghiệp Tư nhân SparkPlus Việt Nam', '6097146801', 1999, 3, NULL, 3, 5, TRUE, 1, 2, 'imported'),
    ('ORG0706', 'SwiftEnergy', 'Công ty TNHH SwiftEnergy Việt Nam', '3368355864', 2018, 2, '2023', 3, 17, TRUE, 1, NULL, 'imported'),
    ('ORG0707', 'DigitalSolutions', 'Hợp tác xã DigitalSolutions Việt Nam', '3172384206', 2016, 1, NULL, 1, 2, TRUE, 1, 2, 'imported'),
    ('ORG0708', 'OmegaEnergy', 'Công ty TNHH MTV OmegaEnergy Việt Nam', '8677457907', 2022, 1, NULL, 3, 15, TRUE, 1, NULL, 'imported'),
    ('ORG0709', 'ForestGate', 'Công ty TNHH ForestGate Việt Nam', '1392847032', 1996, 1, NULL, 1, 11, TRUE, 1, NULL, 'imported'),
    ('ORG0710', 'BrightWorks', 'Công ty Cổ phần BrightWorks Việt Nam', '1188334950', 2022, 3, NULL, 1, 17, TRUE, 2, 1, 'imported'),
    ('ORG0711', 'BambooBuild', 'Doanh nghiệp Tư nhân BambooBuild Việt Nam', '4289906774', 2022, 1, NULL, 2, 10, TRUE, 1, NULL, 'imported'),
    ('ORG0712', 'SafeAsia', 'Công ty Cổ phần SafeAsia Việt Nam', '3940344797', 2019, 1, NULL, 3, 17, TRUE, 1, NULL, 'imported'),
    ('ORG0713', 'PrimeWater', 'Công ty TNHH MTV PrimeWater Việt Nam', '3353443187', 2008, 1, NULL, 3, 13, TRUE, 1, 2, 'imported'),
    ('ORG0714', 'SmartPro', 'Doanh nghiệp Tư nhân SmartPro Việt Nam', '1684857302', 2006, 1, NULL, 1, 2, TRUE, 2, 1, 'imported'),
    ('ORG0715', 'AlphaBase', 'Công ty TNHH MTV AlphaBase Việt Nam', '9338265776', 1998, 1, NULL, 4, 2, FALSE, 1, NULL, 'imported'),
    ('ORG0716', 'SmartAlliance', 'Công ty Cổ phần SmartAlliance Việt Nam', '6077685928', 1995, 1, NULL, 1, 3, FALSE, 2, NULL, 'imported'),
    ('ORG0717', 'BioLocal', 'Hợp tác xã BioLocal Việt Nam', '8880206400', 2015, 1, NULL, 3, 19, TRUE, 2, 1, 'imported'),
    ('ORG0718', 'SeedFarm', 'Công ty Cổ phần SeedFarm Việt Nam', '3486692500', 2019, 3, NULL, 3, 3, TRUE, 1, 2, 'imported'),
    ('ORG0719', 'BrightSystem', 'Công ty Cổ phần BrightSystem Việt Nam', '5491267092', 2016, 2, '2020', 1, 13, FALSE, 2, 1, 'imported'),
    ('ORG0720', 'OceanSupply', 'Công ty TNHH MTV OceanSupply Việt Nam', '9532169229', 2016, 2, '2019', 3, 11, TRUE, 1, NULL, 'imported'),
    ('ORG0721', 'CycleMedia', 'Công ty Cổ phần CycleMedia Việt Nam', '3500156103', 2003, 1, NULL, 1, 2, TRUE, 1, 2, 'imported'),
    ('ORG0722', 'RenewPacific', 'Công ty TNHH MTV RenewPacific Việt Nam', '2087815852', 2012, 1, NULL, 1, 10, TRUE, 2, 1, 'imported'),
    ('ORG0723', 'PearlGlobal', 'Hợp tác xã PearlGlobal Việt Nam', '6014318886', 2013, 1, NULL, 2, 15, FALSE, 2, NULL, 'imported'),
    ('ORG0724', 'ForestLogistics', 'Công ty Cổ phần ForestLogistics Việt Nam', '3365370642', 1997, 1, NULL, 3, 17, TRUE, 1, 2, 'imported'),
    ('ORG0725', 'SmartAgency', 'Công ty TNHH MTV SmartAgency Việt Nam', '9077650488', 2008, 1, NULL, 1, 11, FALSE, 1, 2, 'imported'),
    ('ORG0726', 'SolarAlliance', 'Công ty TNHH SolarAlliance Việt Nam', '1593144041', 2004, 3, NULL, 2, 5, FALSE, 1, NULL, 'imported'),
    ('ORG0727', 'FloraWater', 'Công ty TNHH FloraWater Việt Nam', '3891055285', 2006, 1, NULL, 2, 15, TRUE, 2, NULL, 'imported'),
    ('ORG0728', 'PearlLine', 'Công ty Cổ phần PearlLine Việt Nam', '3161820783', 2023, 1, NULL, 3, 20, TRUE, 1, 2, 'imported'),
    ('ORG0729', 'MicroLogistics', 'Công ty TNHH MTV MicroLogistics Việt Nam', '5680049096', 1995, 1, NULL, 2, 4, TRUE, 1, NULL, 'imported'),
    ('ORG0730', 'VietLab', 'Doanh nghiệp Tư nhân VietLab Việt Nam', '3090995743', 1997, 1, NULL, 4, 2, TRUE, 2, NULL, 'imported'),
    ('ORG0731', 'PrimeGlobal', 'Doanh nghiệp Tư nhân PrimeGlobal Việt Nam', '5207764721', 1996, 1, NULL, 4, 6, TRUE, 2, NULL, 'imported'),
    ('ORG0732', 'HarvestSystem', 'Công ty TNHH MTV HarvestSystem Việt Nam', '8281800690', 1999, 2, '2023', 4, 20, FALSE, 1, 2, 'imported'),
    ('ORG0733', 'RenewSystem', 'Công ty Cổ phần RenewSystem Việt Nam', '4811188866', 2001, 1, NULL, 3, 7, FALSE, 1, 2, 'imported'),
    ('ORG0734', 'PearlAgency', 'Doanh nghiệp Tư nhân PearlAgency Việt Nam', '6448436558', 2016, 2, '2020', 3, 7, TRUE, 2, 1, 'imported'),
    ('ORG0735', 'MekongBuild', 'Công ty Cổ phần MekongBuild Việt Nam', '1339640247', 2020, 1, NULL, 3, 17, TRUE, 1, 2, 'imported'),
    ('ORG0736', 'LotusFarm', 'Doanh nghiệp Tư nhân LotusFarm Việt Nam', '2186200767', 1998, 2, '2019', 3, 21, TRUE, 1, NULL, 'imported'),
    ('ORG0737', 'BrightPacific', 'Công ty Cổ phần BrightPacific Việt Nam', '2966655877', 2009, 2, '2018', 3, 6, TRUE, 1, 2, 'imported'),
    ('ORG0738', 'AlphaMedia', 'Hợp tác xã AlphaMedia Việt Nam', '8210015775', 2021, 1, NULL, 1, 17, FALSE, 2, 1, 'imported'),
    ('ORG0739', 'GreenLab', 'Hợp tác xã GreenLab Việt Nam', '4912830079', 2009, 1, NULL, 3, 11, TRUE, 1, NULL, 'imported'),
    ('ORG0740', 'SwiftSupply', 'Công ty Cổ phần SwiftSupply Việt Nam', '4944811666', 2016, 1, NULL, 4, 20, FALSE, 2, NULL, 'imported'),
    ('ORG0741', 'PureAgency', 'Hợp tác xã PureAgency Việt Nam', '2007733711', 2010, 2, '2024', 2, 1, TRUE, 2, NULL, 'imported'),
    ('ORG0742', 'FuturePlus', 'Công ty TNHH FuturePlus Việt Nam', '7311636686', 1997, 1, NULL, 2, 7, FALSE, 2, NULL, 'imported'),
    ('ORG0743', 'SmartMarket', 'Doanh nghiệp Tư nhân SmartMarket Việt Nam', '8567924811', 2016, 3, NULL, 2, 5, TRUE, 1, 2, 'imported'),
    ('ORG0744', 'HydroFund', 'Công ty Cổ phần HydroFund Việt Nam', '9411067740', 2021, 1, NULL, 1, 13, TRUE, 1, 2, 'imported'),
    ('ORG0745', 'GoldenHub', 'Công ty Cổ phần GoldenHub Việt Nam', '5322081054', 2010, 1, NULL, 1, 8, TRUE, 2, NULL, 'imported'),
    ('ORG0746', 'SeedBuild', 'Doanh nghiệp Tư nhân SeedBuild Việt Nam', '5488382244', 2005, 1, NULL, 1, 14, TRUE, 2, NULL, 'imported'),
    ('ORG0747', 'BrightAgency', 'Doanh nghiệp Tư nhân BrightAgency Việt Nam', '6673825968', 1997, 3, NULL, 2, 14, TRUE, 1, 2, 'imported'),
    ('ORG0748', 'LotusLine', 'Doanh nghiệp Tư nhân LotusLine Việt Nam', '7959153537', 1997, 1, NULL, 2, 14, FALSE, 2, 1, 'imported'),
    ('ORG0749', 'TerraZone', 'Công ty TNHH MTV TerraZone Việt Nam', '7634421476', 2005, 1, NULL, 2, 4, TRUE, 1, 2, 'imported'),
    ('ORG0750', 'AquaPlus', 'Công ty TNHH AquaPlus Việt Nam', '8621830672', 2013, 1, NULL, 1, 2, TRUE, 1, NULL, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0751', 'ClearLocal', 'Hợp tác xã ClearLocal Việt Nam', '5677334850', 2009, 1, NULL, 1, 14, TRUE, 1, NULL, 'imported'),
    ('ORG0752', 'NanoZone', 'Hợp tác xã NanoZone Việt Nam', '8284030207', 2009, 3, NULL, 3, 12, FALSE, 1, NULL, 'imported'),
    ('ORG0753', 'SafeTrade', 'Công ty TNHH MTV SafeTrade Việt Nam', '6984912063', 2005, 1, NULL, 2, 10, TRUE, 2, 1, 'imported'),
    ('ORG0754', 'OceanHealth', 'Công ty TNHH MTV OceanHealth Việt Nam', '9078479267', 2009, 1, NULL, 4, 7, FALSE, 2, NULL, 'imported'),
    ('ORG0755', 'SkyLink', 'Hợp tác xã SkyLink Việt Nam', '6122677895', 1996, 1, NULL, 1, 2, TRUE, 2, NULL, 'imported'),
    ('ORG0756', 'EcoServices', 'Hợp tác xã EcoServices Việt Nam', '1457998503', 2021, 1, NULL, 4, 7, TRUE, 2, 1, 'imported'),
    ('ORG0757', 'TerraNetwork', 'Doanh nghiệp Tư nhân TerraNetwork Việt Nam', '2665958959', 2003, 1, NULL, 2, 22, FALSE, 1, NULL, 'imported'),
    ('ORG0758', 'DeltaAlliance', 'Doanh nghiệp Tư nhân DeltaAlliance Việt Nam', '8121196375', 2004, 1, NULL, 2, 19, TRUE, 2, NULL, 'imported'),
    ('ORG0759', 'PrimeTrade', 'Công ty TNHH PrimeTrade Việt Nam', '7295632688', 2010, 1, NULL, 1, 6, TRUE, 1, 2, 'imported'),
    ('ORG0760', 'SafeHealth', 'Công ty TNHH SafeHealth Việt Nam', '1585370448', 1999, 1, NULL, 2, 9, TRUE, 2, 1, 'imported'),
    ('ORG0761', 'SolarEnergy', 'Hợp tác xã SolarEnergy Việt Nam', '8051283796', 2006, 1, NULL, 2, 8, TRUE, 1, NULL, 'imported'),
    ('ORG0762', 'SmartConnect', 'Công ty Cổ phần SmartConnect Việt Nam', '5112911537', 2020, 1, NULL, 4, 4, TRUE, 2, 1, 'imported'),
    ('ORG0763', 'CycleLocal', 'Công ty Cổ phần CycleLocal Việt Nam', '5932073933', 2002, 1, NULL, 3, 13, TRUE, 2, 1, 'imported'),
    ('ORG0764', 'PearlCorp', 'Công ty Cổ phần PearlCorp Việt Nam', '1428335739', 2013, 1, NULL, 3, 18, TRUE, 2, 1, 'imported'),
    ('ORG0765', 'SwiftServices', 'Hợp tác xã SwiftServices Việt Nam', '7946038106', 2020, 1, NULL, 2, 5, FALSE, 2, 1, 'imported'),
    ('ORG0766', 'WindNetwork', 'Hợp tác xã WindNetwork Việt Nam', '8069726553', 1999, 1, NULL, 3, 15, TRUE, 1, NULL, 'imported'),
    ('ORG0767', 'WindVietnam', 'Công ty TNHH MTV WindVietnam Việt Nam', '8234248424', 2022, 1, NULL, 2, 13, FALSE, 2, 1, 'imported'),
    ('ORG0768', 'AgriPlus', 'Công ty TNHH MTV AgriPlus Việt Nam', '1659754058', 2010, 3, NULL, 3, 19, FALSE, 1, NULL, 'imported'),
    ('ORG0769', 'HydroCo', 'Công ty TNHH MTV HydroCo Việt Nam', '2727535486', 2005, 1, NULL, 2, 2, TRUE, 2, NULL, 'imported'),
    ('ORG0770', 'DeltaInstitute', 'Công ty TNHH MTV DeltaInstitute Việt Nam', '1173720701', 1998, 1, NULL, 2, 4, TRUE, 1, 2, 'imported'),
    ('ORG0771', 'DigitalAsia', 'Hợp tác xã DigitalAsia Việt Nam', '4838109500', 2012, 1, NULL, 3, 10, FALSE, 1, 2, 'imported'),
    ('ORG0772', 'PearlPoint', 'Doanh nghiệp Tư nhân PearlPoint Việt Nam', '8034322712', 2005, 1, NULL, 2, 7, TRUE, 2, 1, 'imported'),
    ('ORG0773', 'BioTrade', 'Công ty Cổ phần BioTrade Việt Nam', '7922345853', 1997, 1, NULL, 1, 3, FALSE, 2, 1, 'imported'),
    ('ORG0774', 'EcoGroup', 'Công ty Cổ phần EcoGroup Việt Nam', '9053851299', 2012, 1, NULL, 3, 7, FALSE, 2, NULL, 'imported'),
    ('ORG0775', 'PioneerFactory', 'Công ty Cổ phần PioneerFactory Việt Nam', '3626220903', 2023, 3, NULL, 2, 18, TRUE, 1, 2, 'imported'),
    ('ORG0776', 'CleanCenter', 'Công ty TNHH MTV CleanCenter Việt Nam', '8593345998', 2015, 1, NULL, 1, 7, FALSE, 1, 2, 'imported'),
    ('ORG0777', 'TechConnect', 'Công ty TNHH MTV TechConnect Việt Nam', '9861808974', 2006, 2, '2019', 1, 14, FALSE, 2, 1, 'imported'),
    ('ORG0778', 'AlphaStudio', 'Doanh nghiệp Tư nhân AlphaStudio Việt Nam', '9403200099', 1999, 1, NULL, 2, 18, TRUE, 2, NULL, 'imported'),
    ('ORG0779', 'SunriseFlow', 'Doanh nghiệp Tư nhân SunriseFlow Việt Nam', '4280149722', 2021, 1, NULL, 2, 11, FALSE, 2, NULL, 'imported'),
    ('ORG0780', 'EcoLocal', 'Hợp tác xã EcoLocal Việt Nam', '7989636574', 2014, 1, NULL, 4, 19, TRUE, 2, 1, 'imported'),
    ('ORG0781', 'OceanAsia', 'Hợp tác xã OceanAsia Việt Nam', '3186391513', 2013, 1, NULL, 3, 7, TRUE, 2, 1, 'imported'),
    ('ORG0782', 'AgriAlliance', 'Công ty TNHH MTV AgriAlliance Việt Nam', '8757585120', 2014, 1, NULL, 4, 2, TRUE, 2, NULL, 'imported'),
    ('ORG0783', 'BlueBase', 'Công ty Cổ phần BlueBase Việt Nam', '9592274341', 2011, 2, '2020', 4, 9, TRUE, 1, 2, 'imported'),
    ('ORG0784', 'SeedVietnam', 'Doanh nghiệp Tư nhân SeedVietnam Việt Nam', '1873191606', 1995, 1, NULL, 3, 14, TRUE, 2, 1, 'imported'),
    ('ORG0785', 'BioTech', 'Công ty TNHH BioTech Việt Nam', '6171333520', 2020, 3, NULL, 2, 20, FALSE, 1, NULL, 'imported'),
    ('ORG0786', 'CleanNetwork', 'Hợp tác xã CleanNetwork Việt Nam', '3051649180', 1999, 1, NULL, 2, 7, FALSE, 2, NULL, 'imported'),
    ('ORG0787', 'SwiftGlobal', 'Hợp tác xã SwiftGlobal Việt Nam', '1733247365', 2002, 1, NULL, 3, 7, TRUE, 1, NULL, 'imported'),
    ('ORG0788', 'SmartCorp', 'Doanh nghiệp Tư nhân SmartCorp Việt Nam', '9460701413', 2000, 1, NULL, 3, 22, FALSE, 2, 1, 'imported'),
    ('ORG0789', 'FutureNetwork', 'Doanh nghiệp Tư nhân FutureNetwork Việt Nam', '5655887998', 1998, 1, NULL, 3, 15, TRUE, 2, NULL, 'imported'),
    ('ORG0790', 'SeedPoint', 'Hợp tác xã SeedPoint Việt Nam', '2981028339', 2011, 1, NULL, 3, 8, FALSE, 2, 1, 'imported'),
    ('ORG0791', 'CircleStudio', 'Công ty Cổ phần CircleStudio Việt Nam', '9750714819', 2015, 1, NULL, 4, 7, TRUE, 1, NULL, 'imported'),
    ('ORG0792', 'PioneerNetwork', 'Công ty Cổ phần PioneerNetwork Việt Nam', '9274607445', 2004, 1, NULL, 4, 7, TRUE, 2, NULL, 'imported'),
    ('ORG0793', 'MekongAsia', 'Công ty Cổ phần MekongAsia Việt Nam', '7767115101', 1997, 1, NULL, 1, 2, TRUE, 1, NULL, 'imported'),
    ('ORG0794', 'PioneerAlliance', 'Công ty TNHH MTV PioneerAlliance Việt Nam', '2234759461', 2014, 2, '2022', 4, 19, TRUE, 2, NULL, 'imported'),
    ('ORG0795', 'HarvestLab', 'Công ty TNHH MTV HarvestLab Việt Nam', '1220512797', 2011, 1, NULL, 1, 5, TRUE, 2, 1, 'imported'),
    ('ORG0796', 'NovaMarket', 'Công ty Cổ phần NovaMarket Việt Nam', '3247857318', 2003, 3, NULL, 1, 3, TRUE, 1, 2, 'imported'),
    ('ORG0797', 'BrightCenter', 'Công ty Cổ phần BrightCenter Việt Nam', '4579402178', 1995, 3, NULL, 2, 8, TRUE, 2, NULL, 'imported'),
    ('ORG0798', 'EcoPoint', 'Công ty TNHH EcoPoint Việt Nam', '3510378462', 2007, 1, NULL, 3, 4, TRUE, 1, 2, 'imported'),
    ('ORG0799', 'PureSupply', 'Công ty Cổ phần PureSupply Việt Nam', '8364295431', 1996, 1, NULL, 2, 15, TRUE, 1, NULL, 'imported'),
    ('ORG0800', 'NovaVenture', 'Hợp tác xã NovaVenture Việt Nam', '6548663007', 2012, 1, NULL, 2, 12, FALSE, 2, 1, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0801', 'AgriFlow', 'Công ty TNHH MTV AgriFlow Việt Nam', '6919368238', 2022, 1, NULL, 1, 22, TRUE, 2, NULL, 'imported'),
    ('ORG0802', 'BambooSolutions', 'Hợp tác xã BambooSolutions Việt Nam', '5137490437', 2008, 3, NULL, 4, 7, TRUE, 2, NULL, 'imported'),
    ('ORG0803', 'UrbanFood', 'Công ty TNHH UrbanFood Việt Nam', '7766052970', 2013, 2, '2019', 1, 19, TRUE, 1, NULL, 'imported'),
    ('ORG0804', 'PearlSystem', 'Công ty TNHH MTV PearlSystem Việt Nam', '2948517122', 2021, 2, '2024', 1, 4, TRUE, 2, 1, 'imported'),
    ('ORG0805', 'SparkLink', 'Công ty TNHH SparkLink Việt Nam', '7473620066', 2011, 1, NULL, 2, 13, FALSE, 2, 1, 'imported'),
    ('ORG0806', 'NanoPacific', 'Công ty TNHH NanoPacific Việt Nam', '5843504590', 2006, 3, NULL, 1, 20, TRUE, 1, 2, 'imported'),
    ('ORG0807', 'AgriBuild', 'Hợp tác xã AgriBuild Việt Nam', '1323339558', 2017, 1, NULL, 4, 1, TRUE, 2, NULL, 'imported'),
    ('ORG0808', 'FreshEnergy', 'Hợp tác xã FreshEnergy Việt Nam', '5355048664', 2004, 1, NULL, 3, 13, TRUE, 2, NULL, 'imported'),
    ('ORG0809', 'TerraInstitute', 'Công ty Cổ phần TerraInstitute Việt Nam', '4994178161', 2009, 1, NULL, 2, 3, TRUE, 2, NULL, 'imported'),
    ('ORG0810', 'LotusWorks', 'Hợp tác xã LotusWorks Việt Nam', '1052932290', 1996, 1, NULL, 2, 3, TRUE, 1, NULL, 'imported'),
    ('ORG0811', 'BambooNetwork', 'Hợp tác xã BambooNetwork Việt Nam', '8488196081', 2020, 1, NULL, 1, 15, TRUE, 2, NULL, 'imported'),
    ('ORG0812', 'PureEnergy', 'Hợp tác xã PureEnergy Việt Nam', '1619440350', 2023, 3, NULL, 2, 22, TRUE, 1, 2, 'imported'),
    ('ORG0813', 'NanoPlus', 'Hợp tác xã NanoPlus Việt Nam', '1405330575', 2015, 1, NULL, 2, 9, TRUE, 2, 1, 'imported'),
    ('ORG0814', 'ClearVenture', 'Công ty Cổ phần ClearVenture Việt Nam', '8754233587', 2012, 1, NULL, 4, 17, TRUE, 2, NULL, 'imported'),
    ('ORG0815', 'HarvestHealth', 'Doanh nghiệp Tư nhân HarvestHealth Việt Nam', '3424745782', 2011, 1, NULL, 2, 13, TRUE, 1, 2, 'imported'),
    ('ORG0816', 'UrbanBuild', 'Doanh nghiệp Tư nhân UrbanBuild Việt Nam', '1805270533', 2013, 1, NULL, 1, 12, FALSE, 2, NULL, 'imported'),
    ('ORG0817', 'FloraAsia', 'Doanh nghiệp Tư nhân FloraAsia Việt Nam', '1020741500', 2002, 1, NULL, 1, 13, TRUE, 1, 2, 'imported'),
    ('ORG0818', 'SkyFlow', 'Công ty TNHH SkyFlow Việt Nam', '7646947955', 2020, 1, NULL, 3, 22, FALSE, 1, NULL, 'imported'),
    ('ORG0819', 'RenewInstitute', 'Hợp tác xã RenewInstitute Việt Nam', '8276975466', 2014, 1, NULL, 1, 3, TRUE, 2, NULL, 'imported'),
    ('ORG0820', 'FloraBuild', 'Doanh nghiệp Tư nhân FloraBuild Việt Nam', '7150145929', 2023, 1, NULL, 2, 18, TRUE, 1, 2, 'imported'),
    ('ORG0821', 'BambooCo', 'Hợp tác xã BambooCo Việt Nam', '4886234597', 2011, 1, NULL, 3, 15, FALSE, 1, NULL, 'imported'),
    ('ORG0822', 'TechCenter', 'Hợp tác xã TechCenter Việt Nam', '5371842591', 2015, 3, NULL, 4, 14, FALSE, 1, NULL, 'imported'),
    ('ORG0823', 'VietWorks', 'Công ty TNHH MTV VietWorks Việt Nam', '2834877455', 2000, 2, '2023', 4, 14, TRUE, 2, 1, 'imported'),
    ('ORG0824', 'DeltaCenter', 'Hợp tác xã DeltaCenter Việt Nam', '5150625811', 2015, 3, NULL, 2, 10, FALSE, 2, 1, 'imported'),
    ('ORG0825', 'BluePoint', 'Công ty Cổ phần BluePoint Việt Nam', '8842825710', 2019, 3, NULL, 4, 5, FALSE, 1, NULL, 'imported'),
    ('ORG0826', 'AlphaVenture', 'Công ty Cổ phần AlphaVenture Việt Nam', '3483268925', 2010, 2, '2020', 4, 10, TRUE, 1, NULL, 'imported'),
    ('ORG0827', 'SmartSystem', 'Doanh nghiệp Tư nhân SmartSystem Việt Nam', '8917671868', 2018, 1, NULL, 3, 10, TRUE, 1, 2, 'imported'),
    ('ORG0828', 'HydroGlobal', 'Công ty Cổ phần HydroGlobal Việt Nam', '2317365278', 2022, 1, NULL, 3, 19, TRUE, 2, 1, 'imported'),
    ('ORG0829', 'VietAlliance', 'Hợp tác xã VietAlliance Việt Nam', '4119036928', 2000, 1, NULL, 4, 1, TRUE, 1, 2, 'imported'),
    ('ORG0830', 'SwiftLocal', 'Công ty TNHH MTV SwiftLocal Việt Nam', '1212595084', 1998, 1, NULL, 2, 4, TRUE, 2, 1, 'imported'),
    ('ORG0831', 'FloraFactory', 'Công ty TNHH FloraFactory Việt Nam', '2109692905', 2016, 2, '2020', 1, 3, FALSE, 1, 2, 'imported'),
    ('ORG0832', 'HarvestFarm', 'Doanh nghiệp Tư nhân HarvestFarm Việt Nam', '4266119897', 2016, 1, NULL, 4, 5, FALSE, 1, 2, 'imported'),
    ('ORG0833', 'BlueFarm', 'Công ty Cổ phần BlueFarm Việt Nam', '8723506101', 2023, 1, NULL, 2, 21, FALSE, 2, 1, 'imported'),
    ('ORG0834', 'BioVietnam', 'Công ty TNHH MTV BioVietnam Việt Nam', '7253012472', 2013, 2, '2021', 1, 8, FALSE, 2, 1, 'imported'),
    ('ORG0835', 'FreshVietnam', 'Công ty TNHH FreshVietnam Việt Nam', '5313915933', 2004, 1, NULL, 2, 10, TRUE, 1, 2, 'imported'),
    ('ORG0836', 'SkyHub', 'Doanh nghiệp Tư nhân SkyHub Việt Nam', '4476731220', 1995, 1, NULL, 4, 12, TRUE, 2, 1, 'imported'),
    ('ORG0837', 'CleanLine', 'Hợp tác xã CleanLine Việt Nam', '9212338132', 1995, 1, NULL, 3, 16, TRUE, 1, 2, 'imported'),
    ('ORG0838', 'PureHealth', 'Công ty TNHH MTV PureHealth Việt Nam', '7712120056', 2010, 3, NULL, 4, 6, FALSE, 1, 2, 'imported'),
    ('ORG0839', 'PrimeHub', 'Công ty TNHH PrimeHub Việt Nam', '2978659497', 1997, 1, NULL, 2, 16, TRUE, 1, NULL, 'imported'),
    ('ORG0840', 'AquaSupply', 'Công ty TNHH MTV AquaSupply Việt Nam', '8931413717', 2021, 1, NULL, 4, 5, TRUE, 2, NULL, 'imported'),
    ('ORG0841', 'MicroVietnam', 'Công ty Cổ phần MicroVietnam Việt Nam', '5912655931', 2009, 1, NULL, 4, 5, TRUE, 2, 1, 'imported'),
    ('ORG0842', 'TechGroup', 'Hợp tác xã TechGroup Việt Nam', '8645780953', 2013, 3, NULL, 4, 7, TRUE, 2, 1, 'imported'),
    ('ORG0843', 'HarvestCapital', 'Công ty TNHH MTV HarvestCapital Việt Nam', '7285140889', 1996, 1, NULL, 3, 5, TRUE, 1, 2, 'imported'),
    ('ORG0844', 'OmegaHub', 'Công ty TNHH OmegaHub Việt Nam', '4270947149', 1999, 3, NULL, 1, 10, FALSE, 1, 2, 'imported'),
    ('ORG0845', 'EcoEnergy', 'Doanh nghiệp Tư nhân EcoEnergy Việt Nam', '1059760920', 2022, 1, NULL, 1, 15, TRUE, 2, 1, 'imported'),
    ('ORG0846', 'OceanPartners', 'Công ty Cổ phần OceanPartners Việt Nam', '1896267656', 1996, 1, NULL, 4, 6, TRUE, 2, 1, 'imported'),
    ('ORG0847', 'ForestFactory', 'Công ty TNHH MTV ForestFactory Việt Nam', '7657378385', 2000, 1, NULL, 2, 18, TRUE, 1, NULL, 'imported'),
    ('ORG0848', 'NovaGroup', 'Công ty Cổ phần NovaGroup Việt Nam', '8861702173', 2013, 3, NULL, 3, 7, TRUE, 2, NULL, 'imported'),
    ('ORG0849', 'DigitalPro', 'Doanh nghiệp Tư nhân DigitalPro Việt Nam', '1093202500', 2008, 3, NULL, 2, 3, TRUE, 2, 1, 'imported'),
    ('ORG0850', 'ClearHealth', 'Công ty Cổ phần ClearHealth Việt Nam', '4860111577', 1996, 1, NULL, 1, 5, TRUE, 2, 1, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0851', 'OceanCo', 'Công ty Cổ phần OceanCo Việt Nam', '3679121703', 2007, 1, NULL, 2, 1, TRUE, 1, NULL, 'imported'),
    ('ORG0852', 'ClearGroup', 'Doanh nghiệp Tư nhân ClearGroup Việt Nam', '8645367105', 2023, 1, NULL, 1, 16, TRUE, 2, NULL, 'imported'),
    ('ORG0853', 'RuralFactory', 'Công ty TNHH RuralFactory Việt Nam', '3516665536', 2015, 2, '2020', 2, 14, TRUE, 2, 1, 'imported'),
    ('ORG0854', 'PearlHealth', 'Công ty TNHH PearlHealth Việt Nam', '9609302596', 2009, 1, NULL, 1, 3, TRUE, 2, 1, 'imported'),
    ('ORG0855', 'PrimeMarket', 'Công ty TNHH MTV PrimeMarket Việt Nam', '5894791950', 2004, 1, NULL, 2, 9, TRUE, 2, 1, 'imported'),
    ('ORG0856', 'NanoVietnam', 'Công ty TNHH MTV NanoVietnam Việt Nam', '7692375192', 2010, 1, NULL, 3, 2, TRUE, 2, 1, 'imported'),
    ('ORG0857', 'TechTech', 'Công ty TNHH MTV TechTech Việt Nam', '6437967568', 2020, 1, NULL, 3, 3, FALSE, 2, NULL, 'imported'),
    ('ORG0858', 'SunriseLogistics', 'Hợp tác xã SunriseLogistics Việt Nam', '2920804426', 2015, 2, '2023', 2, 9, TRUE, 1, NULL, 'imported'),
    ('ORG0859', 'PurePacific', 'Doanh nghiệp Tư nhân PurePacific Việt Nam', '5296026957', 1996, 2, '2021', 3, 21, FALSE, 1, NULL, 'imported'),
    ('ORG0860', 'VietFlow', 'Công ty TNHH MTV VietFlow Việt Nam', '1762943237', 2002, 1, NULL, 1, 14, TRUE, 1, 2, 'imported'),
    ('ORG0861', 'SolarCapital', 'Doanh nghiệp Tư nhân SolarCapital Việt Nam', '4737946098', 2008, 1, NULL, 3, 14, TRUE, 1, NULL, 'imported'),
    ('ORG0862', 'SafeMedia', 'Hợp tác xã SafeMedia Việt Nam', '4060384519', 2020, 1, NULL, 1, 7, TRUE, 2, NULL, 'imported'),
    ('ORG0863', 'NovaCorp', 'Doanh nghiệp Tư nhân NovaCorp Việt Nam', '2461065744', 2004, 2, '2022', 2, 10, FALSE, 1, NULL, 'imported'),
    ('ORG0864', 'BambooLocal', 'Công ty TNHH MTV BambooLocal Việt Nam', '1046300897', 2008, 1, NULL, 1, 9, TRUE, 2, NULL, 'imported'),
    ('ORG0865', 'RuralCenter', 'Hợp tác xã RuralCenter Việt Nam', '9347726341', 2022, 1, NULL, 1, 19, FALSE, 1, 2, 'imported'),
    ('ORG0866', 'MekongConnect', 'Công ty TNHH MekongConnect Việt Nam', '2611370734', 2009, 1, NULL, 4, 8, TRUE, 2, 1, 'imported'),
    ('ORG0867', 'FreshLocal', 'Doanh nghiệp Tư nhân FreshLocal Việt Nam', '4621186982', 1996, 1, NULL, 4, 1, TRUE, 2, 1, 'imported'),
    ('ORG0868', 'EcoAsia', 'Doanh nghiệp Tư nhân EcoAsia Việt Nam', '8063555243', 2008, 1, NULL, 2, 6, TRUE, 1, NULL, 'imported'),
    ('ORG0869', 'RuralFood', 'Công ty TNHH MTV RuralFood Việt Nam', '8558831076', 2008, 1, NULL, 4, 13, TRUE, 1, 2, 'imported'),
    ('ORG0870', 'MicroGate', 'Doanh nghiệp Tư nhân MicroGate Việt Nam', '4284972830', 2009, 2, '2023', 4, 6, TRUE, 1, 2, 'imported'),
    ('ORG0871', 'UrbanBase', 'Công ty Cổ phần UrbanBase Việt Nam', '6297328564', 2017, 1, NULL, 4, 19, FALSE, 2, NULL, 'imported'),
    ('ORG0872', 'SwiftCo', 'Công ty TNHH SwiftCo Việt Nam', '5780104156', 2015, 1, NULL, 3, 18, TRUE, 2, NULL, 'imported'),
    ('ORG0873', 'LotusGroup', 'Công ty Cổ phần LotusGroup Việt Nam', '5618570260', 2016, 2, '2020', 1, 11, TRUE, 1, NULL, 'imported'),
    ('ORG0874', 'BioLab', 'Doanh nghiệp Tư nhân BioLab Việt Nam', '5965308273', 2019, 3, NULL, 1, 17, FALSE, 1, 2, 'imported'),
    ('ORG0875', 'CircleCore', 'Công ty TNHH MTV CircleCore Việt Nam', '9443651533', 1995, 1, NULL, 1, 20, TRUE, 2, 1, 'imported'),
    ('ORG0876', 'CleanConnect', 'Công ty TNHH CleanConnect Việt Nam', '4455149413', 1995, 1, NULL, 2, 21, TRUE, 2, NULL, 'imported'),
    ('ORG0877', 'MekongPacific', 'Công ty TNHH MTV MekongPacific Việt Nam', '9669680778', 1999, 2, '2023', 4, 13, TRUE, 1, NULL, 'imported'),
    ('ORG0878', 'SparkCo', 'Hợp tác xã SparkCo Việt Nam', '5475478934', 2022, 1, NULL, 3, 9, TRUE, 1, 2, 'imported'),
    ('ORG0879', 'SunrisePacific', 'Công ty Cổ phần SunrisePacific Việt Nam', '5290941764', 2002, 3, NULL, 4, 10, TRUE, 1, NULL, 'imported'),
    ('ORG0880', 'SafeWorks', 'Công ty TNHH SafeWorks Việt Nam', '6943511680', 2000, 1, NULL, 2, 19, TRUE, 1, NULL, 'imported'),
    ('ORG0881', 'GreenSupply', 'Công ty TNHH GreenSupply Việt Nam', '6356077885', 2008, 3, NULL, 2, 20, FALSE, 1, NULL, 'imported'),
    ('ORG0882', 'SolarInstitute', 'Doanh nghiệp Tư nhân SolarInstitute Việt Nam', '9289056003', 2004, 1, NULL, 3, 19, FALSE, 1, NULL, 'imported'),
    ('ORG0883', 'MountainSupply', 'Công ty Cổ phần MountainSupply Việt Nam', '3994858214', 2012, 1, NULL, 2, 8, TRUE, 2, 1, 'imported'),
    ('ORG0884', 'PearlFlow', 'Công ty TNHH PearlFlow Việt Nam', '8977070713', 2013, 1, NULL, 4, 20, TRUE, 2, NULL, 'imported'),
    ('ORG0885', 'FloraLogistics', 'Hợp tác xã FloraLogistics Việt Nam', '9901502713', 2020, 1, NULL, 2, 21, TRUE, 1, NULL, 'imported'),
    ('ORG0886', 'SafePoint', 'Công ty TNHH MTV SafePoint Việt Nam', '9894802782', 2005, 1, NULL, 3, 9, TRUE, 2, NULL, 'imported'),
    ('ORG0887', 'GreenCo', 'Doanh nghiệp Tư nhân GreenCo Việt Nam', '7071103164', 1997, 2, '2020', 3, 3, TRUE, 2, 1, 'imported'),
    ('ORG0888', 'AquaGate', 'Hợp tác xã AquaGate Việt Nam', '3185637929', 2003, 1, NULL, 3, 9, TRUE, 2, 1, 'imported'),
    ('ORG0889', 'FloraSupply', 'Hợp tác xã FloraSupply Việt Nam', '9129464505', 2013, 1, NULL, 2, 3, TRUE, 1, 2, 'imported'),
    ('ORG0890', 'TerraPoint', 'Công ty TNHH TerraPoint Việt Nam', '8129952678', 2016, 1, NULL, 3, 14, TRUE, 1, 2, 'imported'),
    ('ORG0891', 'EcoCore', 'Công ty TNHH MTV EcoCore Việt Nam', '4865482211', 2022, 1, NULL, 1, 18, FALSE, 2, 1, 'imported'),
    ('ORG0892', 'RuralLogistics', 'Doanh nghiệp Tư nhân RuralLogistics Việt Nam', '2034953232', 2003, 1, NULL, 2, 1, TRUE, 2, NULL, 'imported'),
    ('ORG0893', 'CycleFund', 'Công ty Cổ phần CycleFund Việt Nam', '4845713748', 1996, 2, '2024', 2, 19, TRUE, 2, NULL, 'imported'),
    ('ORG0894', 'GreenPro', 'Công ty Cổ phần GreenPro Việt Nam', '5192846042', 2007, 2, '2022', 4, 1, FALSE, 1, 2, 'imported'),
    ('ORG0895', 'NovaFarm', 'Hợp tác xã NovaFarm Việt Nam', '1189050701', 2002, 1, NULL, 1, 1, TRUE, 1, 2, 'imported'),
    ('ORG0896', 'SwiftMedia', 'Hợp tác xã SwiftMedia Việt Nam', '9344080961', 2006, 1, NULL, 1, 2, TRUE, 2, NULL, 'imported'),
    ('ORG0897', 'UrbanTrade', 'Công ty TNHH MTV UrbanTrade Việt Nam', '2414666332', 1996, 3, NULL, 3, 17, TRUE, 1, NULL, 'imported'),
    ('ORG0898', 'SafeMarket', 'Công ty TNHH SafeMarket Việt Nam', '7044742221', 2010, 1, NULL, 1, 15, TRUE, 1, NULL, 'imported'),
    ('ORG0899', 'FuturePro', 'Công ty TNHH FuturePro Việt Nam', '5599936845', 2006, 3, NULL, 4, 4, TRUE, 2, NULL, 'imported'),
    ('ORG0900', 'MekongEdu', 'Công ty TNHH MTV MekongEdu Việt Nam', '6696832837', 1997, 1, NULL, 1, 22, TRUE, 2, 1, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0901', 'HarvestSupply', 'Doanh nghiệp Tư nhân HarvestSupply Việt Nam', '3494244073', 2008, 1, NULL, 3, 21, TRUE, 2, NULL, 'imported'),
    ('ORG0902', 'TechLogistics', 'Công ty TNHH TechLogistics Việt Nam', '7886851189', 2002, 1, NULL, 4, 7, TRUE, 1, NULL, 'imported'),
    ('ORG0903', 'AlphaVietnam', 'Công ty TNHH MTV AlphaVietnam Việt Nam', '3803500437', 2023, 2, '2024', 3, 21, FALSE, 1, NULL, 'imported'),
    ('ORG0904', 'VietHealth', 'Công ty Cổ phần VietHealth Việt Nam', '7512311568', 2014, 1, NULL, 1, 22, TRUE, 2, NULL, 'imported'),
    ('ORG0905', 'TerraStudio', 'Công ty TNHH MTV TerraStudio Việt Nam', '1298242731', 2005, 3, NULL, 2, 6, TRUE, 2, 1, 'imported'),
    ('ORG0906', 'SunriseAsia', 'Hợp tác xã SunriseAsia Việt Nam', '8430779852', 1996, 1, NULL, 3, 20, TRUE, 2, NULL, 'imported'),
    ('ORG0907', 'GoldenTech', 'Doanh nghiệp Tư nhân GoldenTech Việt Nam', '8553175739', 2015, 2, '2019', 4, 6, TRUE, 1, 2, 'imported'),
    ('ORG0908', 'SwiftMarket', 'Công ty TNHH MTV SwiftMarket Việt Nam', '1897071684', 2005, 1, NULL, 1, 9, TRUE, 2, NULL, 'imported'),
    ('ORG0909', 'OceanFood', 'Công ty Cổ phần OceanFood Việt Nam', '7831049288', 2008, 1, NULL, 1, 22, FALSE, 1, NULL, 'imported'),
    ('ORG0910', 'HarvestCo', 'Công ty Cổ phần HarvestCo Việt Nam', '9226667183', 2016, 1, NULL, 1, 17, FALSE, 1, 2, 'imported'),
    ('ORG0911', 'TerraCorp', 'Công ty Cổ phần TerraCorp Việt Nam', '8054199537', 2007, 1, NULL, 4, 20, FALSE, 2, 1, 'imported'),
    ('ORG0912', 'BrightServices', 'Doanh nghiệp Tư nhân BrightServices Việt Nam', '5654344473', 2007, 1, NULL, 4, 9, TRUE, 2, 1, 'imported'),
    ('ORG0913', 'GreenGroup', 'Doanh nghiệp Tư nhân GreenGroup Việt Nam', '7544563342', 1995, 1, NULL, 1, 14, TRUE, 2, NULL, 'imported'),
    ('ORG0914', 'GreenServices', 'Công ty Cổ phần GreenServices Việt Nam', '2828799704', 2004, 1, NULL, 1, 8, TRUE, 2, NULL, 'imported'),
    ('ORG0915', 'TerraSystem', 'Công ty TNHH TerraSystem Việt Nam', '1959232992', 2020, 1, NULL, 1, 20, FALSE, 2, 1, 'imported'),
    ('ORG0916', 'SkyNetwork', 'Công ty TNHH SkyNetwork Việt Nam', '2993031008', 2003, 1, NULL, 3, 16, TRUE, 1, 2, 'imported'),
    ('ORG0917', 'GoldenServices', 'Công ty TNHH GoldenServices Việt Nam', '4442119003', 2017, 1, NULL, 2, 10, FALSE, 1, NULL, 'imported'),
    ('ORG0918', 'HydroSupply', 'Công ty TNHH HydroSupply Việt Nam', '1682757684', 1998, 1, NULL, 3, 4, TRUE, 2, NULL, 'imported'),
    ('ORG0919', 'AgriConnect', 'Doanh nghiệp Tư nhân AgriConnect Việt Nam', '8896914305', 2003, 2, '2024', 4, 6, TRUE, 1, 2, 'imported'),
    ('ORG0920', 'MountainPro', 'Hợp tác xã MountainPro Việt Nam', '7713576894', 1999, 1, NULL, 2, 21, TRUE, 2, NULL, 'imported'),
    ('ORG0921', 'FloraLine', 'Doanh nghiệp Tư nhân FloraLine Việt Nam', '8034135302', 2013, 1, NULL, 1, 21, TRUE, 2, NULL, 'imported'),
    ('ORG0922', 'UrbanMarket', 'Công ty TNHH MTV UrbanMarket Việt Nam', '9839378298', 2006, 1, NULL, 4, 14, TRUE, 1, 2, 'imported'),
    ('ORG0923', 'NanoAlliance', 'Công ty TNHH MTV NanoAlliance Việt Nam', '9709580819', 1998, 1, NULL, 4, 21, TRUE, 1, 2, 'imported'),
    ('ORG0924', 'SwiftSolutions', 'Công ty TNHH SwiftSolutions Việt Nam', '5497154265', 2019, 1, NULL, 2, 9, TRUE, 2, 1, 'imported'),
    ('ORG0925', 'CircleAgency', 'Công ty Cổ phần CircleAgency Việt Nam', '6115344363', 2008, 1, NULL, 2, 4, TRUE, 2, NULL, 'imported'),
    ('ORG0926', 'OmegaFactory', 'Công ty TNHH MTV OmegaFactory Việt Nam', '4174628090', 2011, 1, NULL, 1, 3, TRUE, 2, NULL, 'imported'),
    ('ORG0927', 'UrbanCenter', 'Doanh nghiệp Tư nhân UrbanCenter Việt Nam', '3584455732', 2012, 1, NULL, 2, 8, TRUE, 2, 1, 'imported'),
    ('ORG0928', 'NovaSupply', 'Công ty TNHH NovaSupply Việt Nam', '5580125883', 2018, 2, '2021', 3, 19, TRUE, 2, NULL, 'imported'),
    ('ORG0929', 'MekongDynamics', 'Công ty TNHH MekongDynamics Việt Nam', '4564248927', 2012, 1, NULL, 1, 13, TRUE, 2, NULL, 'imported'),
    ('ORG0930', 'SkyTrade', 'Doanh nghiệp Tư nhân SkyTrade Việt Nam', '8930910676', 2001, 3, NULL, 1, 21, TRUE, 2, NULL, 'imported'),
    ('ORG0931', 'AgriLogistics', 'Công ty TNHH AgriLogistics Việt Nam', '5698880348', 1995, 1, NULL, 4, 13, TRUE, 1, 2, 'imported'),
    ('ORG0932', 'HydroCenter', 'Công ty Cổ phần HydroCenter Việt Nam', '5170814559', 2004, 1, NULL, 4, 6, TRUE, 1, 2, 'imported'),
    ('ORG0933', 'HarvestAsia', 'Công ty Cổ phần HarvestAsia Việt Nam', '2193506322', 2005, 1, NULL, 1, 3, TRUE, 1, 2, 'imported'),
    ('ORG0934', 'AquaNetwork', 'Công ty Cổ phần AquaNetwork Việt Nam', '8025126426', 2014, 3, NULL, 1, 15, TRUE, 2, 1, 'imported'),
    ('ORG0935', 'ForestPoint', 'Doanh nghiệp Tư nhân ForestPoint Việt Nam', '8016712477', 2001, 2, '2021', 1, 10, TRUE, 1, NULL, 'imported'),
    ('ORG0936', 'PearlTrade', 'Hợp tác xã PearlTrade Việt Nam', '7010077437', 2016, 2, '2019', 1, 9, TRUE, 2, NULL, 'imported'),
    ('ORG0937', 'TerraPartners', 'Doanh nghiệp Tư nhân TerraPartners Việt Nam', '8833588689', 2003, 1, NULL, 4, 14, TRUE, 1, 2, 'imported'),
    ('ORG0938', 'LotusVenture', 'Hợp tác xã LotusVenture Việt Nam', '5657066246', 2010, 1, NULL, 1, 16, FALSE, 1, 2, 'imported'),
    ('ORG0939', 'PioneerInstitute', 'Công ty TNHH MTV PioneerInstitute Việt Nam', '1009876694', 1996, 1, NULL, 2, 7, FALSE, 1, NULL, 'imported'),
    ('ORG0940', 'TerraTech', 'Hợp tác xã TerraTech Việt Nam', '1593158202', 2005, 1, NULL, 1, 11, TRUE, 1, NULL, 'imported'),
    ('ORG0941', 'CircleServices', 'Công ty Cổ phần CircleServices Việt Nam', '5881789005', 2018, 1, NULL, 2, 2, TRUE, 2, NULL, 'imported'),
    ('ORG0942', 'SkyFood', 'Công ty Cổ phần SkyFood Việt Nam', '3473368930', 2012, 1, NULL, 2, 8, TRUE, 2, NULL, 'imported'),
    ('ORG0943', 'GreenEnergy', 'Hợp tác xã GreenEnergy Việt Nam', '7142011256', 2019, 1, NULL, 4, 21, TRUE, 1, NULL, 'imported'),
    ('ORG0944', 'TerraEnergy', 'Doanh nghiệp Tư nhân TerraEnergy Việt Nam', '7031354683', 2005, 2, '2018', 2, 21, TRUE, 1, 2, 'imported'),
    ('ORG0945', 'PearlBuild', 'Doanh nghiệp Tư nhân PearlBuild Việt Nam', '6297091582', 2009, 1, NULL, 2, 5, TRUE, 2, NULL, 'imported'),
    ('ORG0946', 'MicroConnect', 'Doanh nghiệp Tư nhân MicroConnect Việt Nam', '5084093531', 2000, 1, NULL, 2, 22, FALSE, 1, NULL, 'imported'),
    ('ORG0947', 'SparkLine', 'Công ty TNHH MTV SparkLine Việt Nam', '5626383982', 2014, 1, NULL, 2, 15, FALSE, 1, NULL, 'imported'),
    ('ORG0948', 'CycleFactory', 'Doanh nghiệp Tư nhân CycleFactory Việt Nam', '8793296499', 2003, 3, NULL, 3, 13, TRUE, 1, 2, 'imported'),
    ('ORG0949', 'NanoLogistics', 'Doanh nghiệp Tư nhân NanoLogistics Việt Nam', '6568587223', 2013, 1, NULL, 3, 1, TRUE, 1, NULL, 'imported'),
    ('ORG0950', 'FloraTrade', 'Công ty TNHH MTV FloraTrade Việt Nam', '2976391858', 2007, 1, NULL, 1, 2, FALSE, 1, 2, 'imported');

INSERT INTO organizations (external_code, trade_name, registered_name, tax_code, founded_year,
    operational_status_id, closed_year, organization_type_id, primary_industry_sector_id,
    has_positive_social_impact, primary_product_type_id, other_product_type_id, source_status)
VALUES
    ('ORG0951', 'SeedPartners', 'Công ty TNHH SeedPartners Việt Nam', '1349197256', 2003, 1, NULL, 2, 22, FALSE, 2, 1, 'imported'),
    ('ORG0952', 'BlueAsia', 'Công ty TNHH BlueAsia Việt Nam', '9483932995', 2003, 1, NULL, 2, 17, TRUE, 2, 1, 'imported'),
    ('ORG0953', 'CleanBase', 'Công ty Cổ phần CleanBase Việt Nam', '9308764420', 1999, 1, NULL, 4, 19, FALSE, 1, 2, 'imported'),
    ('ORG0954', 'TerraVenture', 'Doanh nghiệp Tư nhân TerraVenture Việt Nam', '1498242535', 2022, 1, NULL, 3, 15, TRUE, 1, NULL, 'imported'),
    ('ORG0955', 'AlphaCenter', 'Hợp tác xã AlphaCenter Việt Nam', '2361993358', 2012, 1, NULL, 3, 16, TRUE, 2, NULL, 'imported'),
    ('ORG0956', 'OceanLogistics', 'Công ty Cổ phần OceanLogistics Việt Nam', '3754858574', 2007, 1, NULL, 1, 14, TRUE, 2, 1, 'imported'),
    ('ORG0957', 'PureCenter', 'Hợp tác xã PureCenter Việt Nam', '6510424579', 1995, 3, NULL, 3, 14, TRUE, 2, 1, 'imported'),
    ('ORG0958', 'NovaLocal', 'Hợp tác xã NovaLocal Việt Nam', '9233514739', 2017, 3, NULL, 4, 5, TRUE, 2, NULL, 'imported'),
    ('ORG0959', 'DeltaFarm', 'Doanh nghiệp Tư nhân DeltaFarm Việt Nam', '6068201504', 1997, 1, NULL, 4, 14, TRUE, 1, 2, 'imported'),
    ('ORG0960', 'CleanPlus', 'Công ty Cổ phần CleanPlus Việt Nam', '1601325463', 1998, 1, NULL, 3, 5, TRUE, 1, NULL, 'imported'),
    ('ORG0961', 'RiverHub', 'Công ty TNHH RiverHub Việt Nam', '5020143092', 2019, 1, NULL, 2, 21, TRUE, 1, 2, 'imported'),
    ('ORG0962', 'PureFlow', 'Công ty TNHH PureFlow Việt Nam', '4657110154', 1995, 1, NULL, 3, 3, TRUE, 2, 1, 'imported'),
    ('ORG0963', 'PureGate', 'Công ty TNHH PureGate Việt Nam', '1752848400', 2020, 1, NULL, 1, 22, TRUE, 1, 2, 'imported'),
    ('ORG0964', 'ForestMarket', 'Hợp tác xã ForestMarket Việt Nam', '4299204248', 2005, 1, NULL, 3, 12, FALSE, 1, 2, 'imported'),
    ('ORG0965', 'LotusHealth', 'Doanh nghiệp Tư nhân LotusHealth Việt Nam', '8542589747', 2009, 1, NULL, 4, 22, TRUE, 1, NULL, 'imported'),
    ('ORG0966', 'OmegaAgency', 'Doanh nghiệp Tư nhân OmegaAgency Việt Nam', '7003375034', 2011, 1, NULL, 3, 22, FALSE, 1, NULL, 'imported'),
    ('ORG0967', 'CleanAgency', 'Hợp tác xã CleanAgency Việt Nam', '2468913247', 1997, 1, NULL, 1, 13, FALSE, 1, 2, 'imported'),
    ('ORG0968', 'WindStudio', 'Hợp tác xã WindStudio Việt Nam', '2541190313', 2005, 1, NULL, 1, 9, TRUE, 1, 2, 'imported'),
    ('ORG0969', 'SwiftWorks', 'Công ty Cổ phần SwiftWorks Việt Nam', '5408538274', 2000, 1, NULL, 4, 20, TRUE, 1, 2, 'imported'),
    ('ORG0970', 'CycleBase', 'Hợp tác xã CycleBase Việt Nam', '1032598523', 2004, 1, NULL, 2, 7, TRUE, 2, 1, 'imported'),
    ('ORG0971', 'ClearInstitute', 'Hợp tác xã ClearInstitute Việt Nam', '2848068225', 2017, 1, NULL, 3, 12, TRUE, 2, NULL, 'imported'),
    ('ORG0972', 'MekongWorks', 'Công ty Cổ phần MekongWorks Việt Nam', '7990165022', 2020, 2, '2023', 4, 1, FALSE, 1, 2, 'imported'),
    ('ORG0973', 'FloraGlobal', 'Hợp tác xã FloraGlobal Việt Nam', '5545850584', 2008, 1, NULL, 3, 16, FALSE, 1, NULL, 'imported'),
    ('ORG0974', 'SunriseCapital', 'Công ty TNHH MTV SunriseCapital Việt Nam', '2897512416', 1998, 1, NULL, 4, 4, TRUE, 2, 1, 'imported'),
    ('ORG0975', 'VietTech', 'Công ty TNHH VietTech Việt Nam', '4206011215', 2004, 2, '2022', 1, 7, TRUE, 1, NULL, 'imported'),
    ('ORG0976', 'VietFund', 'Doanh nghiệp Tư nhân VietFund Việt Nam', '7067648660', 2012, 1, NULL, 3, 22, FALSE, 1, 2, 'imported'),
    ('ORG0977', 'DigitalEnergy', 'Hợp tác xã DigitalEnergy Việt Nam', '2483594333', 1999, 1, NULL, 4, 9, FALSE, 2, 1, 'imported'),
    ('ORG0978', 'UrbanFarm', 'Doanh nghiệp Tư nhân UrbanFarm Việt Nam', '3485044295', 1999, 1, NULL, 4, 5, FALSE, 2, 1, 'imported'),
    ('ORG0979', 'AquaWorks', 'Công ty TNHH MTV AquaWorks Việt Nam', '5768474727', 2023, 1, NULL, 4, 18, TRUE, 1, NULL, 'imported'),
    ('ORG0980', 'SafeLink', 'Công ty Cổ phần SafeLink Việt Nam', '5697007311', 2009, 1, NULL, 1, 19, TRUE, 2, NULL, 'imported'),
    ('ORG0981', 'CircleGlobal', 'Công ty Cổ phần CircleGlobal Việt Nam', '1018658620', 2022, 1, NULL, 3, 17, TRUE, 2, NULL, 'imported'),
    ('ORG0982', 'FutureLogistics', 'Công ty TNHH MTV FutureLogistics Việt Nam', '7894504944', 2013, 2, '2023', 3, 20, FALSE, 2, 1, 'imported'),
    ('ORG0983', 'SparkVenture', 'Công ty TNHH MTV SparkVenture Việt Nam', '4996589311', 2003, 1, NULL, 1, 11, TRUE, 2, NULL, 'imported'),
    ('ORG0984', 'SparkAgency', 'Công ty TNHH SparkAgency Việt Nam', '6522646143', 2011, 1, NULL, 3, 3, TRUE, 1, 2, 'imported'),
    ('ORG0985', 'BioFactory', 'Công ty TNHH BioFactory Việt Nam', '9295286514', 2001, 1, NULL, 1, 5, TRUE, 2, 1, 'imported'),
    ('ORG0986', 'CircleVietnam', 'Doanh nghiệp Tư nhân CircleVietnam Việt Nam', '2814173307', 2006, 1, NULL, 2, 22, FALSE, 1, NULL, 'imported'),
    ('ORG0987', 'MicroFlow', 'Công ty TNHH MicroFlow Việt Nam', '7820676300', 2006, 1, NULL, 2, 10, TRUE, 1, NULL, 'imported'),
    ('ORG0988', 'RenewMarket', 'Công ty TNHH MTV RenewMarket Việt Nam', '4732356431', 2008, 2, '2021', 2, 16, TRUE, 2, NULL, 'imported'),
    ('ORG0989', 'SkyGlobal', 'Công ty TNHH SkyGlobal Việt Nam', '5158734449', 2000, 2, '2018', 4, 5, TRUE, 1, 2, 'imported'),
    ('ORG0990', 'CleanLab', 'Công ty TNHH MTV CleanLab Việt Nam', '2256232489', 2019, 3, NULL, 1, 1, FALSE, 2, 1, 'imported'),
    ('ORG0991', 'SolarPlus', 'Doanh nghiệp Tư nhân SolarPlus Việt Nam', '3017135943', 2016, 1, NULL, 4, 15, TRUE, 2, NULL, 'imported'),
    ('ORG0992', 'FreshLogistics', 'Hợp tác xã FreshLogistics Việt Nam', '5058642877', 2006, 1, NULL, 2, 3, TRUE, 1, 2, 'imported'),
    ('ORG0993', 'CleanSystem', 'Doanh nghiệp Tư nhân CleanSystem Việt Nam', '3520045631', 2019, 1, NULL, 2, 14, FALSE, 1, NULL, 'imported'),
    ('ORG0994', 'RenewFood', 'Công ty Cổ phần RenewFood Việt Nam', '6663535015', 2022, 1, NULL, 4, 16, FALSE, 1, 2, 'imported'),
    ('ORG0995', 'TerraWorks', 'Doanh nghiệp Tư nhân TerraWorks Việt Nam', '7112952318', 2010, 1, NULL, 2, 16, FALSE, 1, NULL, 'imported'),
    ('ORG0996', 'SolarVenture', 'Hợp tác xã SolarVenture Việt Nam', '5369991885', 2016, 1, NULL, 2, 2, TRUE, 1, 2, 'imported'),
    ('ORG0997', 'SolarAgency', 'Công ty TNHH SolarAgency Việt Nam', '3531165558', 1996, 2, '2018', 1, 6, TRUE, 1, NULL, 'imported'),
    ('ORG0998', 'SolarFactory', 'Công ty Cổ phần SolarFactory Việt Nam', '7199705913', 2016, 2, '2022', 1, 5, TRUE, 1, 2, 'imported'),
    ('ORG0999', 'AquaVenture', 'Công ty TNHH AquaVenture Việt Nam', '9501793997', 2002, 3, NULL, 4, 20, TRUE, 2, 1, 'imported'),
    ('ORG1000', 'ForestInstitute', 'Công ty TNHH ForestInstitute Việt Nam', '5740981652', 2018, 3, NULL, 2, 14, TRUE, 1, NULL, 'imported');

-- Capture inserted IDs into a temp mapping table
CREATE TEMP TABLE org_id_map AS
    SELECT id, external_code FROM organizations WHERE external_code LIKE 'ORG%' ORDER BY id;

-- organization_contacts
INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0001', 'https://harvestbuild.vn', NULL, '0742621108'),
    ('ORG0002', NULL, NULL, '0334031070'),
    ('ORG0003', 'https://goldenconnect.vn', 'contact@goldenconnect.vn', '0383758720'),
    ('ORG0004', NULL, 'contact@sunrisebuild.vn', '0482116655'),
    ('ORG0005', 'https://novastudio.vn', 'contact@novastudio.vn', '0486501362'),
    ('ORG0006', 'https://riverline.vn', 'contact@riverline.vn', '0262196678'),
    ('ORG0008', 'https://aquacore.vn', 'contact@aquacore.vn', '0304078666'),
    ('ORG0009', NULL, 'contact@seedsystem.vn', '0280943908'),
    ('ORG0010', 'https://sunrisegroup.vn', 'contact@sunrisegroup.vn', '0796751693'),
    ('ORG0011', NULL, 'contact@circlelogistics.vn', '0838360085'),
    ('ORG0012', 'https://hydroinstitute.vn', 'contact@hydroinstitute.vn', NULL),
    ('ORG0013', NULL, 'contact@cycledynamics.vn', '0366910922'),
    ('ORG0014', NULL, 'contact@pearlworks.vn', '0661479973'),
    ('ORG0015', NULL, 'contact@forestbase.vn', '0642073642'),
    ('ORG0016', NULL, 'contact@skyhealth.vn', '0746970178'),
    ('ORG0017', 'https://cleanvietnam.vn', 'contact@cleanvietnam.vn', '0996662826'),
    ('ORG0018', 'https://oceangate.vn', 'contact@oceangate.vn', '0526283245'),
    ('ORG0019', NULL, 'contact@safesystem.vn', '0278198716'),
    ('ORG0020', 'https://alphagroup.vn', 'contact@alphagroup.vn', '0675209597'),
    ('ORG0021', NULL, 'contact@lotusbuild.vn', '0555281184'),
    ('ORG0022', NULL, 'contact@pioneerflow.vn', '0634131719'),
    ('ORG0023', 'https://solarmedia.vn', 'contact@solarmedia.vn', '0287946147'),
    ('ORG0024', 'https://safeservices.vn', 'contact@safeservices.vn', '0852027025'),
    ('ORG0025', 'https://pearlsupply.vn', 'contact@pearlsupply.vn', '0651034639'),
    ('ORG0026', 'https://smartbuild.vn', 'contact@smartbuild.vn', '0500281010'),
    ('ORG0027', 'https://sunriseco.vn', 'contact@sunriseco.vn', '0687205269'),
    ('ORG0028', NULL, 'contact@swifttrade.vn', '0258546865'),
    ('ORG0029', 'https://aquaasia.vn', NULL, '0851028618'),
    ('ORG0030', NULL, 'contact@nanofood.vn', '0512737284'),
    ('ORG0031', 'https://freshcorp.vn', 'contact@freshcorp.vn', '0670040006'),
    ('ORG0032', NULL, 'contact@brightpartners.vn', '0727986559'),
    ('ORG0033', 'https://sparkgate.vn', 'contact@sparkgate.vn', '0906157458'),
    ('ORG0034', 'https://terramarket.vn', 'contact@terramarket.vn', '0321827951'),
    ('ORG0035', 'https://futurepoint.vn', 'contact@futurepoint.vn', '0503696046'),
    ('ORG0036', 'https://bionetwork.vn', NULL, '0556476596'),
    ('ORG0037', 'https://microventure.vn', 'contact@microventure.vn', '0297044071'),
    ('ORG0038', 'https://lotuslink.vn', 'contact@lotuslink.vn', '0449310440'),
    ('ORG0039', NULL, 'contact@skywater.vn', NULL),
    ('ORG0040', 'https://windline.vn', 'contact@windline.vn', NULL),
    ('ORG0041', 'https://oceanpoint.vn', 'contact@oceanpoint.vn', '0626717340'),
    ('ORG0042', 'https://renewnetwork.vn', NULL, '0526808977'),
    ('ORG0043', 'https://digitalfactory.vn', NULL, '0784615760'),
    ('ORG0044', 'https://brightfood.vn', 'contact@brightfood.vn', '0497721596'),
    ('ORG0045', NULL, 'contact@urbantech.vn', '0837444033'),
    ('ORG0046', NULL, NULL, '0828530544'),
    ('ORG0047', 'https://seedhub.vn', NULL, '0300105056'),
    ('ORG0048', 'https://skyplus.vn', 'contact@skyplus.vn', '0816435189'),
    ('ORG0049', 'https://sunrisecorp.vn', 'contact@sunrisecorp.vn', '0974807770'),
    ('ORG0050', 'https://pioneerbuild.vn', NULL, '0843520276')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0051', NULL, 'contact@mountainflow.vn', '0818216692'),
    ('ORG0052', NULL, 'contact@blueedu.vn', '0748127255'),
    ('ORG0053', 'https://freshline.vn', 'contact@freshline.vn', '0703500181'),
    ('ORG0054', 'https://oceancorp.vn', 'contact@oceancorp.vn', '0849620068'),
    ('ORG0055', 'https://primelink.vn', 'contact@primelink.vn', '0877409303'),
    ('ORG0056', NULL, 'contact@microco.vn', '0935958147'),
    ('ORG0057', 'https://aquatrade.vn', NULL, '0870809983'),
    ('ORG0058', 'https://omegawater.vn', 'contact@omegawater.vn', '0468438908'),
    ('ORG0059', NULL, 'contact@futureservices.vn', '0287623171'),
    ('ORG0060', 'https://pureline.vn', 'contact@pureline.vn', '0509346714'),
    ('ORG0061', 'https://floraservices.vn', NULL, '0272670118'),
    ('ORG0062', 'https://pearlpartners.vn', 'contact@pearlpartners.vn', '0878321204'),
    ('ORG0063', NULL, 'contact@sparkinstitute.vn', '0998120571'),
    ('ORG0064', 'https://techflow.vn', 'contact@techflow.vn', '0676642996'),
    ('ORG0065', NULL, 'contact@harvestfund.vn', '0588856231'),
    ('ORG0066', 'https://lotuslab.vn', 'contact@lotuslab.vn', '0856998124'),
    ('ORG0067', NULL, 'contact@skylogistics.vn', NULL),
    ('ORG0068', 'https://aqualocal.vn', 'contact@aqualocal.vn', '0756307931'),
    ('ORG0069', 'https://skyfactory.vn', 'contact@skyfactory.vn', '0805180256'),
    ('ORG0070', NULL, 'contact@oceaninstitute.vn', '0419068042'),
    ('ORG0071', 'https://cleanbuild.vn', 'contact@cleanbuild.vn', '0371476207'),
    ('ORG0072', 'https://lotusfood.vn', 'contact@lotusfood.vn', '0483975609'),
    ('ORG0073', 'https://windfactory.vn', 'contact@windfactory.vn', '0746666136'),
    ('ORG0074', NULL, NULL, '0530366556'),
    ('ORG0075', 'https://pearlvietnam.vn', 'contact@pearlvietnam.vn', '0738824588'),
    ('ORG0076', NULL, 'contact@seedfund.vn', '0510315830'),
    ('ORG0077', 'https://smartplus.vn', NULL, '0830104453'),
    ('ORG0078', 'https://purefarm.vn', 'contact@purefarm.vn', '0296057712'),
    ('ORG0079', 'https://skyzone.vn', 'contact@skyzone.vn', '0320953538'),
    ('ORG0080', 'https://sunrisealliance.vn', 'contact@sunrisealliance.vn', '0553932473'),
    ('ORG0081', 'https://florabase.vn', 'contact@florabase.vn', '0850407244'),
    ('ORG0082', 'https://cleangroup.vn', 'contact@cleangroup.vn', '0748011361'),
    ('ORG0083', 'https://clearcorp.vn', 'contact@clearcorp.vn', '0393253475'),
    ('ORG0084', 'https://sunriselink.vn', NULL, '0978488534'),
    ('ORG0085', 'https://solaredu.vn', 'contact@solaredu.vn', '0985460919'),
    ('ORG0086', 'https://harvestenergy.vn', 'contact@harvestenergy.vn', '0522002819'),
    ('ORG0087', 'https://mountainedu.vn', 'contact@mountainedu.vn', NULL),
    ('ORG0088', 'https://mekongwater.vn', 'contact@mekongwater.vn', '0608732434'),
    ('ORG0089', NULL, 'contact@biozone.vn', '0463850592'),
    ('ORG0090', NULL, NULL, '0272980019'),
    ('ORG0091', 'https://goldenflow.vn', 'contact@goldenflow.vn', '0865484610'),
    ('ORG0092', 'https://microline.vn', 'contact@microline.vn', NULL),
    ('ORG0093', NULL, NULL, '0627667092'),
    ('ORG0094', NULL, 'contact@deltacorp.vn', '0582049366'),
    ('ORG0095', 'https://nanoservices.vn', 'contact@nanoservices.vn', '0401210399'),
    ('ORG0096', 'https://brightlink.vn', NULL, '0652155193'),
    ('ORG0097', NULL, 'contact@safevietnam.vn', '0537351729'),
    ('ORG0098', 'https://brightwater.vn', 'contact@brightwater.vn', '0639312437'),
    ('ORG0099', 'https://terrapacific.vn', NULL, '0804753177'),
    ('ORG0100', 'https://foresttech.vn', 'contact@foresttech.vn', '0568365044')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0101', NULL, 'contact@windlogistics.vn', '0887708952'),
    ('ORG0102', NULL, 'contact@aquazone.vn', '0886237617'),
    ('ORG0103', 'https://skylab.vn', 'contact@skylab.vn', '0386009450'),
    ('ORG0104', NULL, 'contact@micromarket.vn', '0436791759'),
    ('ORG0105', NULL, 'contact@cyclefood.vn', NULL),
    ('ORG0106', 'https://swiftflow.vn', 'contact@swiftflow.vn', '0497773877'),
    ('ORG0107', 'https://pearlventure.vn', 'contact@pearlventure.vn', '0692256138'),
    ('ORG0108', 'https://digitalsystem.vn', NULL, '0659346003'),
    ('ORG0109', 'https://nanosupply.vn', NULL, '0930125895'),
    ('ORG0110', 'https://bluehub.vn', NULL, '0209099680'),
    ('ORG0111', 'https://urbanworks.vn', 'contact@urbanworks.vn', '0851682766'),
    ('ORG0112', NULL, 'contact@windenergy.vn', '0627322429'),
    ('ORG0113', NULL, 'contact@freshflow.vn', '0857448675'),
    ('ORG0114', NULL, 'contact@harvestbase.vn', '0282753316'),
    ('ORG0115', 'https://cleanhealth.vn', NULL, '0237971349'),
    ('ORG0116', NULL, 'contact@techhealth.vn', '0793877361'),
    ('ORG0117', 'https://vietagency.vn', 'contact@vietagency.vn', '0210302352'),
    ('ORG0118', 'https://circlepacific.vn', NULL, '0340346956'),
    ('ORG0119', 'https://blueservices.vn', 'contact@blueservices.vn', '0697514616'),
    ('ORG0120', 'https://forestasia.vn', 'contact@forestasia.vn', '0790687810'),
    ('ORG0121', 'https://nanoinstitute.vn', NULL, '0555998988'),
    ('ORG0122', NULL, 'contact@goldenbuild.vn', '0265475776'),
    ('ORG0123', NULL, 'contact@forestzone.vn', '0262911855'),
    ('ORG0124', NULL, 'contact@mountainplus.vn', '0805167856'),
    ('ORG0125', 'https://circlecapital.vn', 'contact@circlecapital.vn', NULL),
    ('ORG0126', 'https://seedglobal.vn', 'contact@seedglobal.vn', '0988121101'),
    ('ORG0127', 'https://bluemarket.vn', NULL, '0886231285'),
    ('ORG0128', 'https://solarvietnam.vn', 'contact@solarvietnam.vn', '0820682356'),
    ('ORG0129', NULL, 'contact@seedcorp.vn', '0666219118'),
    ('ORG0130', NULL, 'contact@digitalservices.vn', '0287978213'),
    ('ORG0131', NULL, 'contact@techlocal.vn', '0292027526'),
    ('ORG0132', 'https://florasolutions.vn', NULL, '0933500385'),
    ('ORG0133', 'https://goldenlink.vn', 'contact@goldenlink.vn', '0313424523'),
    ('ORG0134', NULL, 'contact@sunrisesolutions.vn', '0727872109'),
    ('ORG0135', NULL, 'contact@pioneerpoint.vn', '0762948033'),
    ('ORG0136', 'https://nanolab.vn', 'contact@nanolab.vn', '0477733976'),
    ('ORG0137', 'https://pioneercore.vn', 'contact@pioneercore.vn', '0527984850'),
    ('ORG0138', 'https://windhub.vn', 'contact@windhub.vn', '0402250101'),
    ('ORG0139', 'https://cleardynamics.vn', 'contact@cleardynamics.vn', '0921413281'),
    ('ORG0140', NULL, 'contact@skypacific.vn', '0866422911'),
    ('ORG0141', 'https://alphaservices.vn', NULL, '0381039053'),
    ('ORG0142', 'https://urbanline.vn', 'contact@urbanline.vn', '0611834185'),
    ('ORG0143', 'https://sparkwater.vn', 'contact@sparkwater.vn', '0593624575'),
    ('ORG0144', 'https://cleanpacific.vn', 'contact@cleanpacific.vn', '0910456933'),
    ('ORG0145', NULL, 'contact@swiftwater.vn', '0716108982'),
    ('ORG0146', NULL, 'contact@deltaconnect.vn', '0535766697'),
    ('ORG0147', 'https://riversystem.vn', 'contact@riversystem.vn', '0896693603'),
    ('ORG0148', NULL, 'contact@pearlplus.vn', '0956524312'),
    ('ORG0149', NULL, 'contact@greeninstitute.vn', '0633015368'),
    ('ORG0150', NULL, 'contact@biogate.vn', '0865460052')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0151', NULL, NULL, '0621869399'),
    ('ORG0152', 'https://primeconnect.vn', 'contact@primeconnect.vn', '0390269669'),
    ('ORG0153', NULL, 'contact@primeworks.vn', '0898024936'),
    ('ORG0154', NULL, 'contact@hydrogroup.vn', '0781079105'),
    ('ORG0155', 'https://mountainvietnam.vn', 'contact@mountainvietnam.vn', '0442180853'),
    ('ORG0156', NULL, 'contact@renewmedia.vn', NULL),
    ('ORG0157', 'https://deltafood.vn', 'contact@deltafood.vn', NULL),
    ('ORG0158', 'https://ecolink.vn', NULL, '0303032434'),
    ('ORG0159', NULL, 'contact@alphadynamics.vn', '0637692362'),
    ('ORG0160', NULL, 'contact@futurehub.vn', '0785967190'),
    ('ORG0161', 'https://swiftasia.vn', 'contact@swiftasia.vn', '0372823429'),
    ('ORG0162', NULL, NULL, '0721689527'),
    ('ORG0163', 'https://microglobal.vn', 'contact@microglobal.vn', '0792353117'),
    ('ORG0164', 'https://mekongsolutions.vn', 'contact@mekongsolutions.vn', '0738076911'),
    ('ORG0165', NULL, 'contact@hydroservices.vn', NULL),
    ('ORG0166', 'https://goldenpoint.vn', 'contact@goldenpoint.vn', '0604079950'),
    ('ORG0167', NULL, 'contact@goldenfood.vn', '0717024564'),
    ('ORG0168', NULL, 'contact@freshgroup.vn', '0717187507'),
    ('ORG0169', 'https://purehub.vn', 'contact@purehub.vn', NULL),
    ('ORG0170', NULL, 'contact@clearpoint.vn', '0476815988'),
    ('ORG0171', 'https://clearmedia.vn', 'contact@clearmedia.vn', '0529266242'),
    ('ORG0172', 'https://winddynamics.vn', 'contact@winddynamics.vn', NULL),
    ('ORG0173', NULL, NULL, '0200308454'),
    ('ORG0174', 'https://renewpartners.vn', 'contact@renewpartners.vn', '0637157475'),
    ('ORG0175', 'https://windconnect.vn', 'contact@windconnect.vn', '0446885603'),
    ('ORG0176', 'https://omeganetwork.vn', 'contact@omeganetwork.vn', '0484976854'),
    ('ORG0177', NULL, 'contact@omegapro.vn', NULL),
    ('ORG0178', 'https://mekongvietnam.vn', 'contact@mekongvietnam.vn', '0858293983'),
    ('ORG0179', NULL, 'contact@windhealth.vn', '0210460711'),
    ('ORG0180', 'https://terralogistics.vn', 'contact@terralogistics.vn', '0476719186'),
    ('ORG0181', 'https://digitalbase.vn', 'contact@digitalbase.vn', '0562267940'),
    ('ORG0182', 'https://primebase.vn', 'contact@primebase.vn', '0952367594'),
    ('ORG0183', NULL, 'contact@smartinstitute.vn', '0237747372'),
    ('ORG0184', NULL, 'contact@nanoflow.vn', '0211334226'),
    ('ORG0185', NULL, 'contact@swifthealth.vn', '0606258874'),
    ('ORG0186', 'https://aquaenergy.vn', NULL, NULL),
    ('ORG0187', NULL, 'contact@skymarket.vn', '0394995530'),
    ('ORG0188', 'https://hydrofood.vn', 'contact@hydrofood.vn', '0885605643'),
    ('ORG0189', 'https://clearco.vn', 'contact@clearco.vn', '0871230728'),
    ('ORG0190', 'https://puremedia.vn', 'contact@puremedia.vn', '0795411648'),
    ('ORG0191', 'https://safepro.vn', 'contact@safepro.vn', '0858245879'),
    ('ORG0192', 'https://digitalwater.vn', 'contact@digitalwater.vn', NULL),
    ('ORG0193', 'https://skycorp.vn', 'contact@skycorp.vn', '0392090149'),
    ('ORG0194', 'https://primeplus.vn', 'contact@primeplus.vn', '0429703585'),
    ('ORG0195', 'https://skyfarm.vn', 'contact@skyfarm.vn', '0794491286'),
    ('ORG0196', 'https://seednetwork.vn', 'contact@seednetwork.vn', NULL),
    ('ORG0197', 'https://urbanflow.vn', 'contact@urbanflow.vn', '0839018322'),
    ('ORG0198', 'https://smartasia.vn', 'contact@smartasia.vn', '0989917232'),
    ('ORG0199', 'https://urbanplus.vn', 'contact@urbanplus.vn', '0672944000'),
    ('ORG0200', 'https://oceanfarm.vn', 'contact@oceanfarm.vn', '0477731914')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0201', 'https://terrafactory.vn', 'contact@terrafactory.vn', '0220485196'),
    ('ORG0202', 'https://vietcore.vn', 'contact@vietcore.vn', NULL),
    ('ORG0203', NULL, NULL, '0850009892'),
    ('ORG0204', NULL, 'contact@pearlservices.vn', '0542188032'),
    ('ORG0205', NULL, 'contact@safefactory.vn', '0849304307'),
    ('ORG0206', 'https://pioneerhealth.vn', 'contact@pioneerhealth.vn', '0464982130'),
    ('ORG0207', NULL, 'contact@circleflow.vn', '0506998453'),
    ('ORG0208', 'https://terraflow.vn', 'contact@terraflow.vn', '0688212379'),
    ('ORG0209', NULL, 'contact@seedcore.vn', '0361157630'),
    ('ORG0210', NULL, 'contact@greenconnect.vn', '0674460059'),
    ('ORG0211', 'https://freshsolutions.vn', NULL, '0856152630'),
    ('ORG0212', NULL, 'contact@terrabuild.vn', '0767952106'),
    ('ORG0213', NULL, 'contact@techfactory.vn', '0422619790'),
    ('ORG0214', 'https://futuregate.vn', 'contact@futuregate.vn', NULL),
    ('ORG0215', 'https://solarlink.vn', 'contact@solarlink.vn', NULL),
    ('ORG0216', 'https://biobuild.vn', NULL, '0240152609'),
    ('ORG0217', NULL, NULL, '0293497030'),
    ('ORG0218', 'https://oceanbuild.vn', 'contact@oceanbuild.vn', '0782535775'),
    ('ORG0219', 'https://primegroup.vn', NULL, '0836467148'),
    ('ORG0220', 'https://blueconnect.vn', 'contact@blueconnect.vn', '0396873862'),
    ('ORG0221', NULL, 'contact@florahub.vn', NULL),
    ('ORG0222', 'https://swiftconnect.vn', 'contact@swiftconnect.vn', '0606852607'),
    ('ORG0223', 'https://safezone.vn', 'contact@safezone.vn', '0825698331'),
    ('ORG0224', NULL, NULL, '0586856173'),
    ('ORG0225', NULL, 'contact@novaworks.vn', '0683232960'),
    ('ORG0226', 'https://omegadynamics.vn', 'contact@omegadynamics.vn', '0463315107'),
    ('ORG0227', 'https://pioneerplus.vn', 'contact@pioneerplus.vn', '0820774271'),
    ('ORG0228', NULL, 'contact@bamboofarm.vn', '0394142387'),
    ('ORG0229', 'https://forestgroup.vn', 'contact@forestgroup.vn', '0450891920'),
    ('ORG0230', 'https://blueflow.vn', 'contact@blueflow.vn', '0459627518'),
    ('ORG0231', 'https://bluefund.vn', NULL, '0432813761'),
    ('ORG0232', NULL, 'contact@aquacenter.vn', '0477281586'),
    ('ORG0233', NULL, 'contact@microhub.vn', '0220148538'),
    ('ORG0234', 'https://aquaflow.vn', 'contact@aquaflow.vn', '0894790862'),
    ('ORG0236', NULL, 'contact@mekonginstitute.vn', '0863971973'),
    ('ORG0237', 'https://bluelab.vn', 'contact@bluelab.vn', '0548144622'),
    ('ORG0238', NULL, 'contact@sparkpacific.vn', '0369386707'),
    ('ORG0239', 'https://circlelocal.vn', 'contact@circlelocal.vn', '0798836985'),
    ('ORG0240', 'https://cleanservices.vn', 'contact@cleanservices.vn', '0558946122'),
    ('ORG0241', 'https://primepartners.vn', 'contact@primepartners.vn', NULL),
    ('ORG0242', 'https://seedwater.vn', 'contact@seedwater.vn', '0699863643'),
    ('ORG0243', NULL, 'contact@clearcapital.vn', '0835409949'),
    ('ORG0244', NULL, 'contact@bluelocal.vn', '0297420069'),
    ('ORG0245', NULL, 'contact@techpro.vn', '0857668199'),
    ('ORG0246', 'https://safesolutions.vn', 'contact@safesolutions.vn', '0713778444'),
    ('ORG0247', 'https://cleancapital.vn', 'contact@cleancapital.vn', NULL),
    ('ORG0248', 'https://purecapital.vn', 'contact@purecapital.vn', '0892211324'),
    ('ORG0249', 'https://rivertrade.vn', 'contact@rivertrade.vn', '0388290663'),
    ('ORG0250', NULL, 'contact@freshpro.vn', '0204610971')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0251', 'https://windgate.vn', 'contact@windgate.vn', '0409540440'),
    ('ORG0252', NULL, 'contact@futuregroup.vn', '0802404613'),
    ('ORG0253', NULL, 'contact@circlesystem.vn', '0347024288'),
    ('ORG0254', 'https://freshmedia.vn', NULL, '0729408646'),
    ('ORG0255', 'https://solarservices.vn', 'contact@solarservices.vn', '0511230727'),
    ('ORG0256', 'https://goldenfund.vn', 'contact@goldenfund.vn', '0565408396'),
    ('ORG0257', 'https://ecocapital.vn', NULL, '0438754922'),
    ('ORG0259', NULL, NULL, '0776735181'),
    ('ORG0260', NULL, 'contact@sparknetwork.vn', NULL),
    ('ORG0261', 'https://omegafund.vn', 'contact@omegafund.vn', '0623925579'),
    ('ORG0262', 'https://goldenline.vn', NULL, '0331200576'),
    ('ORG0263', NULL, 'contact@techvietnam.vn', '0700387133'),
    ('ORG0264', 'https://biosolutions.vn', 'contact@biosolutions.vn', '0726728039'),
    ('ORG0265', 'https://riverplus.vn', 'contact@riverplus.vn', '0895873638'),
    ('ORG0266', 'https://novazone.vn', NULL, '0812412455'),
    ('ORG0267', 'https://nanocorp.vn', 'contact@nanocorp.vn', '0997669938'),
    ('ORG0268', 'https://novaalliance.vn', NULL, NULL),
    ('ORG0269', 'https://vietpro.vn', 'contact@vietpro.vn', '0269178531'),
    ('ORG0270', NULL, 'contact@digitalgate.vn', '0388962695'),
    ('ORG0271', 'https://seedworks.vn', 'contact@seedworks.vn', '0536521776'),
    ('ORG0272', NULL, 'contact@bamboopartners.vn', '0355597570'),
    ('ORG0273', 'https://skycenter.vn', 'contact@skycenter.vn', '0474377213'),
    ('ORG0274', NULL, 'contact@harvestpacific.vn', '0788118169'),
    ('ORG0275', NULL, 'contact@smartlab.vn', '0502577583'),
    ('ORG0276', 'https://vietmedia.vn', NULL, '0215155764'),
    ('ORG0277', NULL, 'contact@swiftfood.vn', '0466629382'),
    ('ORG0278', NULL, 'contact@solargroup.vn', '0623802474'),
    ('ORG0279', 'https://bamboolab.vn', 'contact@bamboolab.vn', '0483207928'),
    ('ORG0280', 'https://biocapital.vn', 'contact@biocapital.vn', '0691515743'),
    ('ORG0281', 'https://clearfood.vn', 'contact@clearfood.vn', '0227876667'),
    ('ORG0282', 'https://swiftalliance.vn', 'contact@swiftalliance.vn', '0259630273'),
    ('ORG0283', 'https://freshlab.vn', 'contact@freshlab.vn', '0844610969'),
    ('ORG0284', NULL, NULL, '0466989670'),
    ('ORG0285', 'https://futuretech.vn', 'contact@futuretech.vn', '0977490744'),
    ('ORG0286', 'https://novaflow.vn', 'contact@novaflow.vn', '0906218351'),
    ('ORG0287', NULL, 'contact@ecofood.vn', '0223425640'),
    ('ORG0288', 'https://nanodynamics.vn', 'contact@nanodynamics.vn', '0856588065'),
    ('ORG0289', 'https://novatech.vn', 'contact@novatech.vn', '0967939251'),
    ('ORG0290', 'https://hydrocapital.vn', 'contact@hydrocapital.vn', '0424876907'),
    ('ORG0291', 'https://cleangate.vn', 'contact@cleangate.vn', '0941027438'),
    ('ORG0292', 'https://mekongpro.vn', NULL, '0347932060'),
    ('ORG0293', 'https://pioneerpro.vn', 'contact@pioneerpro.vn', '0231957698'),
    ('ORG0294', 'https://freshzone.vn', 'contact@freshzone.vn', NULL),
    ('ORG0295', NULL, 'contact@mountainagency.vn', NULL),
    ('ORG0296', 'https://ruraledu.vn', 'contact@ruraledu.vn', '0754535921'),
    ('ORG0297', 'https://mekonglocal.vn', 'contact@mekonglocal.vn', '0725640719'),
    ('ORG0298', NULL, 'contact@cleanstudio.vn', '0525623035'),
    ('ORG0299', 'https://aquasolutions.vn', 'contact@aquasolutions.vn', '0549198328'),
    ('ORG0300', 'https://floratech.vn', 'contact@floratech.vn', '0220040394')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0302', NULL, 'contact@bluenetwork.vn', '0729332643'),
    ('ORG0303', 'https://microworks.vn', 'contact@microworks.vn', '0463240138'),
    ('ORG0304', NULL, NULL, '0500066062'),
    ('ORG0305', NULL, NULL, '0947850381'),
    ('ORG0306', NULL, 'contact@terrafarm.vn', '0584207398'),
    ('ORG0307', 'https://nanoasia.vn', 'contact@nanoasia.vn', '0388472661'),
    ('ORG0308', 'https://renewconnect.vn', 'contact@renewconnect.vn', '0756515311'),
    ('ORG0309', NULL, NULL, '0229928143'),
    ('ORG0310', 'https://swiftfactory.vn', 'contact@swiftfactory.vn', '0944493568'),
    ('ORG0311', 'https://safeline.vn', 'contact@safeline.vn', '0227887311'),
    ('ORG0312', NULL, 'contact@seedfactory.vn', '0584124308'),
    ('ORG0313', NULL, NULL, '0942858623'),
    ('ORG0314', 'https://nanohealth.vn', 'contact@nanohealth.vn', '0207221330'),
    ('ORG0315', NULL, NULL, '0308652175'),
    ('ORG0316', NULL, 'contact@circlefactory.vn', '0541397938'),
    ('ORG0317', 'https://futurepartners.vn', NULL, '0764225204'),
    ('ORG0318', 'https://lotusasia.vn', NULL, NULL),
    ('ORG0319', NULL, 'contact@mountaintech.vn', '0283922596'),
    ('ORG0320', NULL, 'contact@goldenwater.vn', '0633588911'),
    ('ORG0321', 'https://alphasystem.vn', 'contact@alphasystem.vn', '0337810085'),
    ('ORG0322', 'https://ruralzone.vn', 'contact@ruralzone.vn', '0886124569'),
    ('ORG0323', NULL, 'contact@aquavietnam.vn', '0641158894'),
    ('ORG0324', NULL, 'contact@skypartners.vn', '0764634125'),
    ('ORG0325', 'https://pioneeredu.vn', 'contact@pioneeredu.vn', '0457370819'),
    ('ORG0326', NULL, 'contact@pearlnetwork.vn', '0695965611'),
    ('ORG0327', 'https://renewalliance.vn', 'contact@renewalliance.vn', '0333306531'),
    ('ORG0328', 'https://primeco.vn', NULL, '0416614577'),
    ('ORG0329', 'https://aquahealth.vn', NULL, '0781648793'),
    ('ORG0330', 'https://hydrobuild.vn', 'contact@hydrobuild.vn', '0965074455'),
    ('ORG0331', 'https://omegacorp.vn', 'contact@omegacorp.vn', '0861799351'),
    ('ORG0332', 'https://mountainfood.vn', 'contact@mountainfood.vn', '0225440523'),
    ('ORG0333', NULL, 'contact@greencorp.vn', '0419444197'),
    ('ORG0334', 'https://brightlocal.vn', 'contact@brightlocal.vn', '0854332056'),
    ('ORG0336', NULL, 'contact@mountainzone.vn', '0464990693'),
    ('ORG0337', 'https://clearalliance.vn', 'contact@clearalliance.vn', NULL),
    ('ORG0338', 'https://forestservices.vn', NULL, NULL),
    ('ORG0339', 'https://techwater.vn', 'contact@techwater.vn', '0378376576'),
    ('ORG0340', 'https://sparkfarm.vn', 'contact@sparkfarm.vn', '0721759233'),
    ('ORG0341', NULL, 'contact@ruralhub.vn', '0466865257'),
    ('ORG0342', 'https://sunrisepoint.vn', 'contact@sunrisepoint.vn', '0515532960'),
    ('ORG0343', 'https://sparkalliance.vn', 'contact@sparkalliance.vn', '0711425712'),
    ('ORG0344', NULL, 'contact@harvestagency.vn', '0999527218'),
    ('ORG0345', 'https://mountainglobal.vn', 'contact@mountainglobal.vn', '0355371286'),
    ('ORG0346', 'https://goldendynamics.vn', 'contact@goldendynamics.vn', '0426144079'),
    ('ORG0347', 'https://forestline.vn', 'contact@forestline.vn', '0304496093'),
    ('ORG0348', 'https://harvestwater.vn', 'contact@harvestwater.vn', NULL),
    ('ORG0349', 'https://digitalsupply.vn', 'contact@digitalsupply.vn', '0878962940'),
    ('ORG0350', 'https://harvesthub.vn', NULL, NULL)
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0351', NULL, 'contact@mekongalliance.vn', '0803975707'),
    ('ORG0352', NULL, 'contact@digitalco.vn', '0344104747'),
    ('ORG0353', 'https://novaco.vn', NULL, '0905789882'),
    ('ORG0354', 'https://pioneercorp.vn', 'contact@pioneercorp.vn', NULL),
    ('ORG0355', NULL, 'contact@renewbuild.vn', '0770889348'),
    ('ORG0356', NULL, 'contact@nanopro.vn', '0971447859'),
    ('ORG0357', 'https://smartpoint.vn', 'contact@smartpoint.vn', '0771670179'),
    ('ORG0358', 'https://circlehealth.vn', NULL, '0562880277'),
    ('ORG0359', NULL, NULL, '0975707160'),
    ('ORG0360', NULL, 'contact@riversupply.vn', NULL),
    ('ORG0362', NULL, 'contact@lotusfactory.vn', '0958556609'),
    ('ORG0363', 'https://freshglobal.vn', 'contact@freshglobal.vn', '0438129347'),
    ('ORG0364', 'https://florapacific.vn', 'contact@florapacific.vn', '0500818814'),
    ('ORG0365', 'https://riverpoint.vn', 'contact@riverpoint.vn', '0997347186'),
    ('ORG0366', 'https://pioneergate.vn', 'contact@pioneergate.vn', '0223487997'),
    ('ORG0367', NULL, NULL, '0948099284'),
    ('ORG0368', NULL, 'contact@goldenworks.vn', '0596329017'),
    ('ORG0369', NULL, 'contact@cyclealliance.vn', '0624625607'),
    ('ORG0370', 'https://brightmarket.vn', 'contact@brightmarket.vn', NULL),
    ('ORG0371', 'https://greenline.vn', 'contact@greenline.vn', '0990415185'),
    ('ORG0372', 'https://goldencenter.vn', 'contact@goldencenter.vn', '0440853982'),
    ('ORG0373', 'https://forestcorp.vn', NULL, '0843827930'),
    ('ORG0374', NULL, 'contact@pearlinstitute.vn', '0499011485'),
    ('ORG0375', 'https://microedu.vn', 'contact@microedu.vn', '0954940701'),
    ('ORG0376', NULL, 'contact@forestpro.vn', '0325880985'),
    ('ORG0377', 'https://smartedu.vn', 'contact@smartedu.vn', '0521593943'),
    ('ORG0378', 'https://biostudio.vn', 'contact@biostudio.vn', '0477083754'),
    ('ORG0379', 'https://harvestgate.vn', NULL, '0655504789'),
    ('ORG0380', 'https://swiftfarm.vn', 'contact@swiftfarm.vn', NULL),
    ('ORG0381', NULL, 'contact@bluecore.vn', NULL),
    ('ORG0382', 'https://novasolutions.vn', NULL, '0787482857'),
    ('ORG0383', 'https://omegamedia.vn', 'contact@omegamedia.vn', '0673335114'),
    ('ORG0384', NULL, 'contact@renewfarm.vn', '0300398208'),
    ('ORG0385', NULL, 'contact@ruralstudio.vn', '0543797765'),
    ('ORG0386', 'https://goldenasia.vn', NULL, '0567240263'),
    ('ORG0387', NULL, 'contact@aquaagency.vn', '0539740334'),
    ('ORG0388', 'https://pearllogistics.vn', NULL, '0217385244'),
    ('ORG0389', 'https://cycleglobal.vn', NULL, '0861704528'),
    ('ORG0390', 'https://cleanwater.vn', 'contact@cleanwater.vn', '0624996202'),
    ('ORG0391', 'https://circlepoint.vn', 'contact@circlepoint.vn', '0622321705'),
    ('ORG0392', NULL, NULL, '0875269926'),
    ('ORG0393', NULL, 'contact@seedbase.vn', '0319111815'),
    ('ORG0394', 'https://sunrisehub.vn', 'contact@sunrisehub.vn', '0684127135'),
    ('ORG0395', 'https://harvestmedia.vn', NULL, '0551693111'),
    ('ORG0396', 'https://digitalglobal.vn', 'contact@digitalglobal.vn', '0310482235'),
    ('ORG0397', 'https://rivercenter.vn', 'contact@rivercenter.vn', '0769618090'),
    ('ORG0398', 'https://freshbase.vn', 'contact@freshbase.vn', '0803056990'),
    ('ORG0399', NULL, NULL, '0845781277'),
    ('ORG0400', 'https://pureasia.vn', 'contact@pureasia.vn', '0571326196')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0401', 'https://greenworks.vn', 'contact@greenworks.vn', '0777198900'),
    ('ORG0402', NULL, 'contact@mountainbuild.vn', '0643770966'),
    ('ORG0403', NULL, NULL, '0613455267'),
    ('ORG0404', NULL, 'contact@deltapro.vn', '0819809183'),
    ('ORG0405', 'https://novafood.vn', 'contact@novafood.vn', '0515686428'),
    ('ORG0406', 'https://goldenedu.vn', 'contact@goldenedu.vn', '0942689810'),
    ('ORG0407', 'https://terraedu.vn', 'contact@terraedu.vn', '0222362658'),
    ('ORG0408', NULL, 'contact@digitaledu.vn', '0300835200'),
    ('ORG0409', 'https://hydrostudio.vn', 'contact@hydrostudio.vn', '0352077412'),
    ('ORG0410', 'https://bluebuild.vn', 'contact@bluebuild.vn', '0532133365'),
    ('ORG0411', 'https://circletrade.vn', 'contact@circletrade.vn', '0332538144'),
    ('ORG0412', 'https://futurealliance.vn', NULL, '0708070753'),
    ('ORG0413', NULL, 'contact@urbanpartners.vn', '0695160746'),
    ('ORG0414', 'https://ecobase.vn', 'contact@ecobase.vn', '0257483870'),
    ('ORG0415', NULL, NULL, '0731829323'),
    ('ORG0416', 'https://freshstudio.vn', 'contact@freshstudio.vn', NULL),
    ('ORG0417', NULL, 'contact@techservices.vn', '0495473725'),
    ('ORG0418', 'https://microalliance.vn', NULL, '0737556364'),
    ('ORG0419', 'https://aquainstitute.vn', 'contact@aquainstitute.vn', '0827594817'),
    ('ORG0420', NULL, NULL, '0674087562'),
    ('ORG0422', 'https://renewworks.vn', 'contact@renewworks.vn', '0447576416'),
    ('ORG0423', 'https://brightedu.vn', 'contact@brightedu.vn', '0232188671'),
    ('ORG0424', NULL, NULL, '0898294005'),
    ('ORG0425', NULL, 'contact@swiftvietnam.vn', '0324106516'),
    ('ORG0426', NULL, NULL, '0903525252'),
    ('ORG0427', 'https://deltalocal.vn', 'contact@deltalocal.vn', '0312075212'),
    ('ORG0428', 'https://lotusco.vn', 'contact@lotusco.vn', '0264123910'),
    ('ORG0429', 'https://cyclegroup.vn', 'contact@cyclegroup.vn', '0229361620'),
    ('ORG0430', 'https://alphapoint.vn', 'contact@alphapoint.vn', '0860938831'),
    ('ORG0431', 'https://bioplus.vn', 'contact@bioplus.vn', '0672918333'),
    ('ORG0432', 'https://bioenergy.vn', NULL, '0478157917'),
    ('ORG0433', NULL, 'contact@urbanzone.vn', '0638234355'),
    ('ORG0434', 'https://harvestcore.vn', 'contact@harvestcore.vn', '0284229641'),
    ('ORG0435', 'https://vietzone.vn', 'contact@vietzone.vn', '0458821682'),
    ('ORG0436', NULL, 'contact@primepacific.vn', '0287516357'),
    ('ORG0437', 'https://floracapital.vn', 'contact@floracapital.vn', '0580499500'),
    ('ORG0438', 'https://pioneercenter.vn', 'contact@pioneercenter.vn', '0289968284'),
    ('ORG0439', NULL, 'contact@circlepartners.vn', '0984889041'),
    ('ORG0440', NULL, 'contact@agritrade.vn', '0229366972'),
    ('ORG0441', 'https://novaagency.vn', 'contact@novaagency.vn', '0664142028'),
    ('ORG0442', NULL, 'contact@nanopoint.vn', '0404439023'),
    ('ORG0443', NULL, 'contact@oceanworks.vn', '0608333520'),
    ('ORG0444', NULL, 'contact@oceanhub.vn', '0573209649'),
    ('ORG0445', 'https://pioneergroup.vn', 'contact@pioneergroup.vn', '0258662128'),
    ('ORG0446', 'https://purestudio.vn', 'contact@purestudio.vn', '0756895122'),
    ('ORG0447', 'https://ecoline.vn', 'contact@ecoline.vn', NULL),
    ('ORG0448', 'https://pioneertech.vn', 'contact@pioneertech.vn', '0656504247'),
    ('ORG0449', 'https://omegatrade.vn', 'contact@omegatrade.vn', '0786887321'),
    ('ORG0450', 'https://smarthub.vn', 'contact@smarthub.vn', '0808424215')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0451', 'https://goldenco.vn', 'contact@goldenco.vn', '0994230707'),
    ('ORG0452', NULL, NULL, '0973032900'),
    ('ORG0453', NULL, 'contact@ruralpoint.vn', '0401513886'),
    ('ORG0454', 'https://vietbuild.vn', 'contact@vietbuild.vn', '0836341420'),
    ('ORG0455', NULL, 'contact@mekonglogistics.vn', '0256037713'),
    ('ORG0456', NULL, NULL, '0700445166'),
    ('ORG0457', NULL, 'contact@skysystem.vn', '0627664933'),
    ('ORG0458', 'https://florapoint.vn', 'contact@florapoint.vn', '0784205193'),
    ('ORG0459', NULL, NULL, '0939503930'),
    ('ORG0460', 'https://smartenergy.vn', NULL, '0464926597'),
    ('ORG0461', 'https://techtrade.vn', 'contact@techtrade.vn', '0877559442'),
    ('ORG0462', NULL, NULL, '0400172866'),
    ('ORG0463', 'https://greenlogistics.vn', 'contact@greenlogistics.vn', '0399888553'),
    ('ORG0464', NULL, 'contact@sunrisesupply.vn', '0376121538'),
    ('ORG0465', NULL, NULL, '0668740794'),
    ('ORG0466', 'https://hydrovietnam.vn', 'contact@hydrovietnam.vn', '0504077884'),
    ('ORG0467', NULL, 'contact@futurefarm.vn', '0902275407'),
    ('ORG0468', 'https://windagency.vn', 'contact@windagency.vn', '0631325735'),
    ('ORG0469', 'https://sparkvietnam.vn', 'contact@sparkvietnam.vn', '0666957486'),
    ('ORG0470', NULL, 'contact@pearltech.vn', '0583588343'),
    ('ORG0471', 'https://seedlink.vn', 'contact@seedlink.vn', '0308579695'),
    ('ORG0472', 'https://bamboosupply.vn', 'contact@bamboosupply.vn', '0399408320'),
    ('ORG0473', 'https://nanonetwork.vn', 'contact@nanonetwork.vn', '0694612888'),
    ('ORG0474', 'https://freshconnect.vn', 'contact@freshconnect.vn', '0802718913'),
    ('ORG0475', 'https://pioneerline.vn', 'contact@pioneerline.vn', NULL),
    ('ORG0476', 'https://windcenter.vn', 'contact@windcenter.vn', '0390725138'),
    ('ORG0477', 'https://vietcenter.vn', 'contact@vietcenter.vn', NULL),
    ('ORG0478', NULL, 'contact@vietnetwork.vn', '0389921188'),
    ('ORG0479', 'https://mountaincorp.vn', 'contact@mountaincorp.vn', '0627775236'),
    ('ORG0480', 'https://ruralservices.vn', 'contact@ruralservices.vn', '0462775165'),
    ('ORG0481', 'https://riverzone.vn', 'contact@riverzone.vn', '0516624578'),
    ('ORG0482', 'https://harvestlink.vn', 'contact@harvestlink.vn', '0381592156'),
    ('ORG0483', 'https://goldenstudio.vn', 'contact@goldenstudio.vn', '0445211832'),
    ('ORG0484', 'https://solarlocal.vn', 'contact@solarlocal.vn', '0970281257'),
    ('ORG0485', 'https://clearline.vn', NULL, '0674484446'),
    ('ORG0486', 'https://nanofactory.vn', 'contact@nanofactory.vn', '0504680363'),
    ('ORG0487', 'https://omegamarket.vn', 'contact@omegamarket.vn', '0396125033'),
    ('ORG0488', 'https://agriwater.vn', 'contact@agriwater.vn', '0647652803'),
    ('ORG0489', 'https://solarpacific.vn', NULL, '0610605678'),
    ('ORG0490', NULL, 'contact@pearlalliance.vn', '0596692661'),
    ('ORG0491', 'https://primeedu.vn', 'contact@primeedu.vn', '0430653508'),
    ('ORG0492', 'https://digitalgroup.vn', 'contact@digitalgroup.vn', '0272058248'),
    ('ORG0493', 'https://novabuild.vn', 'contact@novabuild.vn', '0664282926'),
    ('ORG0494', 'https://deltapartners.vn', NULL, '0421345622'),
    ('ORG0495', 'https://vietsupply.vn', 'contact@vietsupply.vn', '0602775535'),
    ('ORG0496', 'https://cleanlogistics.vn', 'contact@cleanlogistics.vn', '0320250872'),
    ('ORG0497', 'https://novainstitute.vn', 'contact@novainstitute.vn', NULL),
    ('ORG0498', 'https://oceanpro.vn', 'contact@oceanpro.vn', '0317458307'),
    ('ORG0499', NULL, 'contact@harvestservices.vn', '0650845807'),
    ('ORG0500', NULL, NULL, '0442184443')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0501', NULL, 'contact@clearlink.vn', '0613422831'),
    ('ORG0502', 'https://forestwater.vn', 'contact@forestwater.vn', '0752430400'),
    ('ORG0503', 'https://ecoflow.vn', NULL, '0685937780'),
    ('ORG0504', NULL, 'contact@forestlink.vn', '0602086382'),
    ('ORG0505', 'https://oceanvietnam.vn', NULL, '0796739938'),
    ('ORG0506', 'https://lotusplus.vn', 'contact@lotusplus.vn', '0676077104'),
    ('ORG0507', 'https://cleanflow.vn', NULL, '0474289896'),
    ('ORG0508', 'https://lotusalliance.vn', 'contact@lotusalliance.vn', '0470229471'),
    ('ORG0509', 'https://floramarket.vn', 'contact@floramarket.vn', '0305845958'),
    ('ORG0510', 'https://bioasia.vn', NULL, '0230466968'),
    ('ORG0511', 'https://bamboobase.vn', 'contact@bamboobase.vn', '0444352419'),
    ('ORG0512', NULL, 'contact@primepro.vn', '0889672680'),
    ('ORG0513', 'https://purevietnam.vn', 'contact@purevietnam.vn', '0493977947'),
    ('ORG0514', 'https://safecapital.vn', 'contact@safecapital.vn', '0480775198'),
    ('ORG0515', 'https://lotusflow.vn', 'contact@lotusflow.vn', '0970479048'),
    ('ORG0516', NULL, 'contact@windplus.vn', '0924418845'),
    ('ORG0517', 'https://aquafactory.vn', 'contact@aquafactory.vn', '0231662023'),
    ('ORG0518', NULL, 'contact@techdynamics.vn', '0287583407'),
    ('ORG0519', 'https://circlefarm.vn', 'contact@circlefarm.vn', '0385105531'),
    ('ORG0520', 'https://pearlenergy.vn', 'contact@pearlenergy.vn', '0933400081'),
    ('ORG0521', NULL, 'contact@riverservices.vn', '0908304553'),
    ('ORG0522', NULL, 'contact@novaasia.vn', '0528455028'),
    ('ORG0523', 'https://mountainwater.vn', 'contact@mountainwater.vn', '0305925419'),
    ('ORG0524', NULL, 'contact@hydrosystem.vn', '0477224347'),
    ('ORG0525', 'https://vietbase.vn', NULL, '0275724946'),
    ('ORG0526', NULL, 'contact@sparklab.vn', '0317407113'),
    ('ORG0527', NULL, NULL, '0469296768'),
    ('ORG0528', NULL, 'contact@ruralalliance.vn', '0319578115'),
    ('ORG0529', 'https://mountainbase.vn', 'contact@mountainbase.vn', '0614523135'),
    ('ORG0530', 'https://riverhealth.vn', 'contact@riverhealth.vn', '0245692965'),
    ('ORG0531', NULL, 'contact@urbanalliance.vn', '0864513319'),
    ('ORG0532', 'https://safepacific.vn', 'contact@safepacific.vn', '0675646523'),
    ('ORG0534', NULL, NULL, '0639890432'),
    ('ORG0535', 'https://mountaincapital.vn', 'contact@mountaincapital.vn', '0808578617'),
    ('ORG0536', 'https://digitaltech.vn', NULL, '0379188100'),
    ('ORG0537', 'https://renewsolutions.vn', NULL, '0948243535'),
    ('ORG0538', NULL, 'contact@hydroventure.vn', '0454418108'),
    ('ORG0539', 'https://purewater.vn', 'contact@purewater.vn', NULL),
    ('ORG0540', 'https://terralab.vn', 'contact@terralab.vn', '0642684413'),
    ('ORG0541', 'https://aquamarket.vn', 'contact@aquamarket.vn', '0588135963'),
    ('ORG0542', 'https://agrisolutions.vn', 'contact@agrisolutions.vn', '0992270274'),
    ('ORG0543', NULL, NULL, '0525904401'),
    ('ORG0544', NULL, 'contact@urbandynamics.vn', '0878077202'),
    ('ORG0545', NULL, 'contact@aquatech.vn', '0711302630'),
    ('ORG0546', 'https://econetwork.vn', 'contact@econetwork.vn', '0981498108'),
    ('ORG0547', 'https://renewservices.vn', NULL, '0849701221'),
    ('ORG0548', 'https://freshtrade.vn', NULL, '0796210575'),
    ('ORG0549', NULL, 'contact@urbangate.vn', '0391124362'),
    ('ORG0550', 'https://floraedu.vn', 'contact@floraedu.vn', '0763370153')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0551', NULL, 'contact@renewtech.vn', '0347825381'),
    ('ORG0552', 'https://mekonghealth.vn', NULL, '0775772566'),
    ('ORG0553', NULL, NULL, '0997589822'),
    ('ORG0554', NULL, 'contact@bamboofood.vn', '0973061127'),
    ('ORG0555', 'https://safegroup.vn', NULL, NULL),
    ('ORG0556', NULL, 'contact@mekonglab.vn', '0822530817'),
    ('ORG0557', NULL, 'contact@alphapacific.vn', '0226213124'),
    ('ORG0558', 'https://digitalhealth.vn', NULL, '0598650571'),
    ('ORG0559', 'https://smartstudio.vn', 'contact@smartstudio.vn', '0245908616'),
    ('ORG0560', NULL, 'contact@bluezone.vn', '0788894456'),
    ('ORG0561', 'https://florafarm.vn', 'contact@florafarm.vn', '0424674061'),
    ('ORG0562', NULL, 'contact@forestalliance.vn', '0882061852'),
    ('ORG0563', 'https://clearfactory.vn', 'contact@clearfactory.vn', '0289082650'),
    ('ORG0564', 'https://mekongfactory.vn', 'contact@mekongfactory.vn', '0948538764'),
    ('ORG0565', 'https://cleanfund.vn', 'contact@cleanfund.vn', '0604499601'),
    ('ORG0566', 'https://swiftzone.vn', 'contact@swiftzone.vn', '0783562180'),
    ('ORG0567', NULL, 'contact@forestcapital.vn', '0798469846'),
    ('ORG0568', 'https://terraasia.vn', 'contact@terraasia.vn', NULL),
    ('ORG0569', NULL, 'contact@aquaservices.vn', '0871758113'),
    ('ORG0570', 'https://hydroagency.vn', 'contact@hydroagency.vn', '0893681192'),
    ('ORG0571', 'https://biopro.vn', 'contact@biopro.vn', '0704564045'),
    ('ORG0572', 'https://futurehealth.vn', 'contact@futurehealth.vn', '0919068385'),
    ('ORG0573', NULL, 'contact@oceancenter.vn', '0810088706'),
    ('ORG0574', 'https://clearbuild.vn', 'contact@clearbuild.vn', '0615414277'),
    ('ORG0575', 'https://bioalliance.vn', 'contact@bioalliance.vn', '0812695440'),
    ('ORG0576', NULL, 'contact@harvestfactory.vn', '0436590009'),
    ('ORG0577', 'https://mountainfactory.vn', 'contact@mountainfactory.vn', '0735831691'),
    ('ORG0578', 'https://lotusdynamics.vn', 'contact@lotusdynamics.vn', '0269465682'),
    ('ORG0579', 'https://omegalogistics.vn', NULL, '0253756960'),
    ('ORG0580', NULL, 'contact@smartfactory.vn', '0965072262'),
    ('ORG0581', NULL, 'contact@urbanlogistics.vn', '0459765594'),
    ('ORG0582', 'https://oceanconnect.vn', 'contact@oceanconnect.vn', '0850169102'),
    ('ORG0583', 'https://swiftpacific.vn', 'contact@swiftpacific.vn', '0885534409'),
    ('ORG0584', 'https://alphaworks.vn', 'contact@alphaworks.vn', '0901617283'),
    ('ORG0585', 'https://harvestdynamics.vn', 'contact@harvestdynamics.vn', '0572508682'),
    ('ORG0586', 'https://mountainsystem.vn', 'contact@mountainsystem.vn', '0247259052'),
    ('ORG0587', 'https://bambooagency.vn', NULL, '0568011193'),
    ('ORG0588', 'https://novacapital.vn', 'contact@novacapital.vn', '0314350071'),
    ('ORG0589', NULL, 'contact@pioneerzone.vn', '0667747088'),
    ('ORG0590', 'https://sunriseglobal.vn', NULL, NULL),
    ('ORG0591', NULL, 'contact@riverfund.vn', '0859667622'),
    ('ORG0592', 'https://bamboologistics.vn', 'contact@bamboologistics.vn', '0685877250'),
    ('ORG0593', 'https://bioventure.vn', 'contact@bioventure.vn', '0543544114'),
    ('ORG0594', 'https://solarsolutions.vn', 'contact@solarsolutions.vn', '0551014988'),
    ('ORG0595', NULL, 'contact@lotuscore.vn', '0312310447'),
    ('ORG0596', 'https://seedsolutions.vn', 'contact@seedsolutions.vn', '0648013530'),
    ('ORG0597', NULL, NULL, '0774728504'),
    ('ORG0598', NULL, 'contact@vietfarm.vn', '0905939260'),
    ('ORG0599', NULL, 'contact@renewcenter.vn', '0774013671'),
    ('ORG0600', 'https://seedtech.vn', 'contact@seedtech.vn', '0565266320')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0601', 'https://riverwater.vn', 'contact@riverwater.vn', '0896554388'),
    ('ORG0602', NULL, NULL, '0913848970'),
    ('ORG0603', NULL, 'contact@ecotrade.vn', '0427966627'),
    ('ORG0604', 'https://pioneerventure.vn', NULL, '0635927034'),
    ('ORG0605', 'https://windcore.vn', 'contact@windcore.vn', '0787942122'),
    ('ORG0606', NULL, 'contact@cleandynamics.vn', '0397952816'),
    ('ORG0607', NULL, 'contact@cleanzone.vn', '0977726463'),
    ('ORG0608', NULL, 'contact@lotusmarket.vn', NULL),
    ('ORG0609', 'https://microhealth.vn', 'contact@microhealth.vn', '0451707595'),
    ('ORG0610', 'https://brighthub.vn', 'contact@brighthub.vn', '0221013174'),
    ('ORG0611', 'https://brightplus.vn', 'contact@brightplus.vn', '0771752477'),
    ('ORG0612', 'https://cyclepoint.vn', NULL, NULL),
    ('ORG0613', 'https://cyclelogistics.vn', 'contact@cyclelogistics.vn', '0200099764'),
    ('ORG0614', 'https://bioagency.vn', 'contact@bioagency.vn', NULL),
    ('ORG0615', NULL, 'contact@cycleenergy.vn', '0485765752'),
    ('ORG0616', 'https://ecowater.vn', 'contact@ecowater.vn', '0951908729'),
    ('ORG0617', 'https://pureedu.vn', NULL, '0789384867'),
    ('ORG0619', 'https://primeflow.vn', 'contact@primeflow.vn', '0511236729'),
    ('ORG0620', NULL, 'contact@urbanvietnam.vn', '0605762456'),
    ('ORG0621', 'https://goldencore.vn', 'contact@goldencore.vn', '0244960954'),
    ('ORG0622', 'https://goldengroup.vn', 'contact@goldengroup.vn', '0987358775'),
    ('ORG0623', NULL, NULL, '0969863359'),
    ('ORG0624', 'https://mountainlogistics.vn', 'contact@mountainlogistics.vn', '0515500894'),
    ('ORG0625', 'https://futurelink.vn', NULL, '0261765307'),
    ('ORG0626', NULL, 'contact@deltaservices.vn', '0298160064'),
    ('ORG0627', 'https://sparkcore.vn', 'contact@sparkcore.vn', '0211458911'),
    ('ORG0628', 'https://ruralcapital.vn', NULL, '0332256694'),
    ('ORG0629', 'https://agrifood.vn', NULL, '0946698400'),
    ('ORG0630', 'https://cleanpoint.vn', 'contact@cleanpoint.vn', '0852220209'),
    ('ORG0631', 'https://novacore.vn', 'contact@novacore.vn', '0426407711'),
    ('ORG0632', 'https://pioneersolutions.vn', NULL, '0744816038'),
    ('ORG0633', 'https://pearlfactory.vn', 'contact@pearlfactory.vn', '0593183310'),
    ('ORG0634', 'https://deltatrade.vn', 'contact@deltatrade.vn', '0648505886'),
    ('ORG0635', 'https://purealliance.vn', NULL, '0946404164'),
    ('ORG0636', NULL, 'contact@aquafood.vn', '0329048667'),
    ('ORG0637', NULL, NULL, '0857011739'),
    ('ORG0638', 'https://nanolink.vn', 'contact@nanolink.vn', '0731790821'),
    ('ORG0639', 'https://renewventure.vn', 'contact@renewventure.vn', '0482980228'),
    ('ORG0640', NULL, 'contact@cycleventure.vn', '0653011201'),
    ('ORG0641', NULL, 'contact@cycletrade.vn', '0301486041'),
    ('ORG0642', 'https://digitalalliance.vn', 'contact@digitalalliance.vn', '0309884550'),
    ('ORG0643', NULL, 'contact@futureenergy.vn', '0972216788'),
    ('ORG0644', 'https://freshventure.vn', 'contact@freshventure.vn', '0215925900'),
    ('ORG0645', 'https://brightasia.vn', NULL, '0240574697'),
    ('ORG0646', 'https://oceanplus.vn', NULL, '0631271977'),
    ('ORG0647', 'https://hydroconnect.vn', 'contact@hydroconnect.vn', '0339036162'),
    ('ORG0648', 'https://ecoalliance.vn', NULL, '0388878927'),
    ('ORG0649', 'https://purefund.vn', 'contact@purefund.vn', '0814818630'),
    ('ORG0650', NULL, 'contact@brightlogistics.vn', '0801224039')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0651', NULL, 'contact@safelab.vn', '0453422413'),
    ('ORG0652', 'https://riverfactory.vn', 'contact@riverfactory.vn', '0217240808'),
    ('ORG0653', 'https://omegagate.vn', 'contact@omegagate.vn', '0798938358'),
    ('ORG0654', 'https://puremarket.vn', 'contact@puremarket.vn', '0540727571'),
    ('ORG0655', 'https://freshsupply.vn', 'contact@freshsupply.vn', '0324267947'),
    ('ORG0656', 'https://circlelink.vn', 'contact@circlelink.vn', '0514250072'),
    ('ORG0657', 'https://mekongenergy.vn', 'contact@mekongenergy.vn', '0263334116'),
    ('ORG0658', 'https://techenergy.vn', 'contact@techenergy.vn', '0813341529'),
    ('ORG0659', 'https://primelab.vn', 'contact@primelab.vn', '0903726191'),
    ('ORG0660', 'https://lotusgate.vn', 'contact@lotusgate.vn', '0779996203'),
    ('ORG0662', 'https://circleedu.vn', 'contact@circleedu.vn', NULL),
    ('ORG0663', 'https://techedu.vn', 'contact@techedu.vn', '0288057432'),
    ('ORG0664', 'https://ecoventure.vn', NULL, NULL),
    ('ORG0665', NULL, 'contact@terraconnect.vn', '0394032644'),
    ('ORG0666', 'https://mekongflow.vn', NULL, '0389125842'),
    ('ORG0667', 'https://puretech.vn', 'contact@puretech.vn', '0430444499'),
    ('ORG0668', 'https://rivervietnam.vn', NULL, '0257783846'),
    ('ORG0669', 'https://smartglobal.vn', 'contact@smartglobal.vn', '0480313031'),
    ('ORG0670', NULL, 'contact@sunrisemarket.vn', '0573696649'),
    ('ORG0671', 'https://pearllab.vn', 'contact@pearllab.vn', '0307779186'),
    ('ORG0672', NULL, 'contact@cleartech.vn', '0696010919'),
    ('ORG0673', NULL, NULL, '0205869805'),
    ('ORG0674', NULL, 'contact@aqualink.vn', '0307553685'),
    ('ORG0675', 'https://pearlgate.vn', NULL, '0738842340'),
    ('ORG0676', NULL, 'contact@pioneervietnam.vn', NULL),
    ('ORG0677', NULL, NULL, '0780411499'),
    ('ORG0678', 'https://terraline.vn', 'contact@terraline.vn', '0786926776'),
    ('ORG0679', 'https://ecomedia.vn', 'contact@ecomedia.vn', '0291405534'),
    ('ORG0680', NULL, 'contact@renewcore.vn', '0477724867'),
    ('ORG0681', 'https://renewgate.vn', 'contact@renewgate.vn', '0627519094'),
    ('ORG0682', 'https://freshgate.vn', 'contact@freshgate.vn', '0782633420'),
    ('ORG0683', 'https://aquaglobal.vn', 'contact@aquaglobal.vn', '0909937839'),
    ('ORG0684', NULL, NULL, '0304541057'),
    ('ORG0685', 'https://bamboostudio.vn', NULL, NULL),
    ('ORG0686', NULL, 'contact@clearasia.vn', NULL),
    ('ORG0687', 'https://terravietnam.vn', 'contact@terravietnam.vn', '0796183751'),
    ('ORG0688', 'https://mountainmarket.vn', 'contact@mountainmarket.vn', NULL),
    ('ORG0689', 'https://novapro.vn', 'contact@novapro.vn', '0437009909'),
    ('ORG0690', 'https://solarhub.vn', 'contact@solarhub.vn', '0400508459'),
    ('ORG0691', 'https://safecorp.vn', 'contact@safecorp.vn', '0469725069'),
    ('ORG0692', NULL, NULL, '0281754369'),
    ('ORG0693', NULL, 'contact@solarconnect.vn', '0449710178'),
    ('ORG0694', 'https://freshwater.vn', 'contact@freshwater.vn', '0727479376'),
    ('ORG0695', 'https://cyclevietnam.vn', 'contact@cyclevietnam.vn', NULL),
    ('ORG0696', 'https://deltasystem.vn', 'contact@deltasystem.vn', '0311494095'),
    ('ORG0697', 'https://hydropro.vn', 'contact@hydropro.vn', NULL),
    ('ORG0698', 'https://bambooflow.vn', 'contact@bambooflow.vn', '0347672031'),
    ('ORG0699', 'https://lotusedu.vn', 'contact@lotusedu.vn', '0808361982'),
    ('ORG0700', 'https://ecocorp.vn', 'contact@ecocorp.vn', '0799264339')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0701', 'https://renewtrade.vn', 'contact@renewtrade.vn', '0790913910'),
    ('ORG0702', 'https://sparkasia.vn', 'contact@sparkasia.vn', '0249475018'),
    ('ORG0703', 'https://florahealth.vn', NULL, '0594368460'),
    ('ORG0704', 'https://renewlink.vn', 'contact@renewlink.vn', '0834970011'),
    ('ORG0705', 'https://sparkplus.vn', 'contact@sparkplus.vn', '0813793422'),
    ('ORG0706', 'https://swiftenergy.vn', NULL, '0712741724'),
    ('ORG0707', 'https://digitalsolutions.vn', 'contact@digitalsolutions.vn', '0962685924'),
    ('ORG0708', 'https://omegaenergy.vn', 'contact@omegaenergy.vn', '0372784128'),
    ('ORG0709', 'https://forestgate.vn', 'contact@forestgate.vn', '0905381009'),
    ('ORG0710', NULL, NULL, '0475334983'),
    ('ORG0711', 'https://bamboobuild.vn', 'contact@bamboobuild.vn', '0709098500'),
    ('ORG0712', 'https://safeasia.vn', 'contact@safeasia.vn', '0670138283'),
    ('ORG0713', NULL, NULL, '0610840544'),
    ('ORG0714', NULL, 'contact@smartpro.vn', '0548485542'),
    ('ORG0715', NULL, 'contact@alphabase.vn', '0932267407'),
    ('ORG0716', 'https://smartalliance.vn', NULL, '0951228478'),
    ('ORG0717', NULL, 'contact@biolocal.vn', NULL),
    ('ORG0718', 'https://seedfarm.vn', 'contact@seedfarm.vn', '0950255295'),
    ('ORG0719', 'https://brightsystem.vn', 'contact@brightsystem.vn', '0891624301'),
    ('ORG0720', 'https://oceansupply.vn', 'contact@oceansupply.vn', '0368765947'),
    ('ORG0721', 'https://cyclemedia.vn', 'contact@cyclemedia.vn', '0274887063'),
    ('ORG0722', 'https://renewpacific.vn', 'contact@renewpacific.vn', '0861710897'),
    ('ORG0723', 'https://pearlglobal.vn', 'contact@pearlglobal.vn', '0945407515'),
    ('ORG0724', 'https://forestlogistics.vn', 'contact@forestlogistics.vn', '0272504595'),
    ('ORG0725', 'https://smartagency.vn', NULL, '0247735409'),
    ('ORG0726', 'https://solaralliance.vn', 'contact@solaralliance.vn', '0871380753'),
    ('ORG0727', NULL, 'contact@florawater.vn', '0340875515'),
    ('ORG0728', NULL, NULL, '0261676939'),
    ('ORG0729', 'https://micrologistics.vn', 'contact@micrologistics.vn', '0770034425'),
    ('ORG0730', 'https://vietlab.vn', 'contact@vietlab.vn', '0622255656'),
    ('ORG0731', NULL, 'contact@primeglobal.vn', NULL),
    ('ORG0732', 'https://harvestsystem.vn', 'contact@harvestsystem.vn', '0242188165'),
    ('ORG0733', 'https://renewsystem.vn', 'contact@renewsystem.vn', '0463627860'),
    ('ORG0734', 'https://pearlagency.vn', 'contact@pearlagency.vn', '0974968535'),
    ('ORG0735', 'https://mekongbuild.vn', NULL, '0863921816'),
    ('ORG0736', NULL, NULL, '0256520835'),
    ('ORG0737', 'https://brightpacific.vn', 'contact@brightpacific.vn', '0769974638'),
    ('ORG0738', 'https://alphamedia.vn', 'contact@alphamedia.vn', '0926606951'),
    ('ORG0739', NULL, 'contact@greenlab.vn', '0226399671'),
    ('ORG0740', 'https://swiftsupply.vn', 'contact@swiftsupply.vn', '0412725013'),
    ('ORG0741', 'https://pureagency.vn', NULL, '0852753126'),
    ('ORG0742', 'https://futureplus.vn', 'contact@futureplus.vn', '0329700675'),
    ('ORG0743', NULL, 'contact@smartmarket.vn', '0425292708'),
    ('ORG0744', 'https://hydrofund.vn', 'contact@hydrofund.vn', '0598992396'),
    ('ORG0745', NULL, 'contact@goldenhub.vn', '0908660307'),
    ('ORG0746', NULL, 'contact@seedbuild.vn', NULL),
    ('ORG0747', 'https://brightagency.vn', NULL, '0472323413'),
    ('ORG0748', NULL, 'contact@lotusline.vn', '0279664509'),
    ('ORG0749', 'https://terrazone.vn', 'contact@terrazone.vn', '0531536457'),
    ('ORG0750', 'https://aquaplus.vn', 'contact@aquaplus.vn', '0715329445')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0751', 'https://clearlocal.vn', NULL, '0235461667'),
    ('ORG0752', 'https://nanozone.vn', 'contact@nanozone.vn', NULL),
    ('ORG0753', NULL, 'contact@safetrade.vn', '0513704286'),
    ('ORG0754', NULL, 'contact@oceanhealth.vn', '0337765049'),
    ('ORG0755', 'https://skylink.vn', 'contact@skylink.vn', '0462458848'),
    ('ORG0756', 'https://ecoservices.vn', 'contact@ecoservices.vn', '0838775022'),
    ('ORG0757', 'https://terranetwork.vn', 'contact@terranetwork.vn', '0637437786'),
    ('ORG0758', 'https://deltaalliance.vn', 'contact@deltaalliance.vn', '0963168039'),
    ('ORG0759', 'https://primetrade.vn', NULL, '0593647374'),
    ('ORG0761', 'https://solarenergy.vn', 'contact@solarenergy.vn', '0723595439'),
    ('ORG0762', 'https://smartconnect.vn', 'contact@smartconnect.vn', '0478038469'),
    ('ORG0763', NULL, 'contact@cyclelocal.vn', '0828067325'),
    ('ORG0764', 'https://pearlcorp.vn', 'contact@pearlcorp.vn', NULL),
    ('ORG0765', 'https://swiftservices.vn', 'contact@swiftservices.vn', '0385396014'),
    ('ORG0766', 'https://windnetwork.vn', NULL, '0516139273'),
    ('ORG0767', 'https://windvietnam.vn', 'contact@windvietnam.vn', '0953756887'),
    ('ORG0768', 'https://agriplus.vn', NULL, '0229825287'),
    ('ORG0769', 'https://hydroco.vn', 'contact@hydroco.vn', '0913050798'),
    ('ORG0770', 'https://deltainstitute.vn', NULL, '0389816316'),
    ('ORG0771', NULL, 'contact@digitalasia.vn', NULL),
    ('ORG0772', NULL, 'contact@pearlpoint.vn', '0977625813'),
    ('ORG0773', 'https://biotrade.vn', 'contact@biotrade.vn', '0810263266'),
    ('ORG0774', NULL, NULL, '0373187740'),
    ('ORG0775', 'https://pioneerfactory.vn', 'contact@pioneerfactory.vn', '0443888017'),
    ('ORG0776', 'https://cleancenter.vn', 'contact@cleancenter.vn', '0200880981'),
    ('ORG0777', 'https://techconnect.vn', 'contact@techconnect.vn', '0898622196'),
    ('ORG0778', 'https://alphastudio.vn', 'contact@alphastudio.vn', '0890686045'),
    ('ORG0779', NULL, 'contact@sunriseflow.vn', '0836918536'),
    ('ORG0780', 'https://ecolocal.vn', 'contact@ecolocal.vn', NULL),
    ('ORG0781', 'https://oceanasia.vn', 'contact@oceanasia.vn', '0876364739'),
    ('ORG0782', 'https://agrialliance.vn', 'contact@agrialliance.vn', '0349830992'),
    ('ORG0783', 'https://bluebase.vn', 'contact@bluebase.vn', '0454435136'),
    ('ORG0784', NULL, 'contact@seedvietnam.vn', '0781283349'),
    ('ORG0785', NULL, 'contact@biotech.vn', '0470652738'),
    ('ORG0786', 'https://cleannetwork.vn', NULL, '0556251669'),
    ('ORG0787', 'https://swiftglobal.vn', NULL, '0557574208'),
    ('ORG0788', 'https://smartcorp.vn', 'contact@smartcorp.vn', '0796662282'),
    ('ORG0789', 'https://futurenetwork.vn', NULL, '0299585411'),
    ('ORG0790', NULL, 'contact@seedpoint.vn', '0239349446'),
    ('ORG0791', 'https://circlestudio.vn', NULL, '0715309123'),
    ('ORG0792', 'https://pioneernetwork.vn', 'contact@pioneernetwork.vn', '0936113452'),
    ('ORG0793', 'https://mekongasia.vn', 'contact@mekongasia.vn', '0817525639'),
    ('ORG0794', 'https://pioneeralliance.vn', 'contact@pioneeralliance.vn', '0977600763'),
    ('ORG0795', 'https://harvestlab.vn', 'contact@harvestlab.vn', '0877745924'),
    ('ORG0796', NULL, 'contact@novamarket.vn', '0666452152'),
    ('ORG0797', NULL, 'contact@brightcenter.vn', '0654148187'),
    ('ORG0798', 'https://ecopoint.vn', 'contact@ecopoint.vn', '0538388789'),
    ('ORG0799', 'https://puresupply.vn', 'contact@puresupply.vn', '0631705400'),
    ('ORG0800', 'https://novaventure.vn', 'contact@novaventure.vn', '0809992542')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0801', NULL, NULL, '0475333978'),
    ('ORG0802', 'https://bamboosolutions.vn', 'contact@bamboosolutions.vn', '0722489642'),
    ('ORG0803', 'https://urbanfood.vn', 'contact@urbanfood.vn', '0851559604'),
    ('ORG0804', NULL, 'contact@pearlsystem.vn', '0801242434'),
    ('ORG0805', 'https://sparklink.vn', 'contact@sparklink.vn', '0451294700'),
    ('ORG0806', 'https://nanopacific.vn', NULL, '0449799332'),
    ('ORG0807', 'https://agribuild.vn', 'contact@agribuild.vn', '0497477863'),
    ('ORG0808', 'https://freshenergy.vn', 'contact@freshenergy.vn', NULL),
    ('ORG0809', NULL, 'contact@terrainstitute.vn', '0644641400'),
    ('ORG0810', NULL, 'contact@lotusworks.vn', '0384324080'),
    ('ORG0811', NULL, 'contact@bamboonetwork.vn', '0708911742'),
    ('ORG0812', NULL, 'contact@pureenergy.vn', '0288349807'),
    ('ORG0813', 'https://nanoplus.vn', 'contact@nanoplus.vn', '0225884092'),
    ('ORG0814', 'https://clearventure.vn', 'contact@clearventure.vn', '0714289576'),
    ('ORG0815', 'https://harvesthealth.vn', NULL, '0991323080'),
    ('ORG0816', 'https://urbanbuild.vn', 'contact@urbanbuild.vn', '0359326530'),
    ('ORG0817', NULL, 'contact@floraasia.vn', NULL),
    ('ORG0818', NULL, NULL, '0832956260'),
    ('ORG0819', 'https://renewinstitute.vn', NULL, '0913749161'),
    ('ORG0820', 'https://florabuild.vn', 'contact@florabuild.vn', '0217214207'),
    ('ORG0821', 'https://bambooco.vn', 'contact@bambooco.vn', '0438659718'),
    ('ORG0822', 'https://techcenter.vn', NULL, NULL),
    ('ORG0823', 'https://vietworks.vn', 'contact@vietworks.vn', '0212378468'),
    ('ORG0824', NULL, 'contact@deltacenter.vn', '0872078117'),
    ('ORG0825', 'https://bluepoint.vn', 'contact@bluepoint.vn', '0576971843'),
    ('ORG0826', 'https://alphaventure.vn', NULL, '0737513593'),
    ('ORG0827', 'https://smartsystem.vn', NULL, '0941908766'),
    ('ORG0828', 'https://hydroglobal.vn', 'contact@hydroglobal.vn', '0269549344'),
    ('ORG0829', 'https://vietalliance.vn', 'contact@vietalliance.vn', '0766820349'),
    ('ORG0830', NULL, 'contact@swiftlocal.vn', '0325387752'),
    ('ORG0831', 'https://florafactory.vn', 'contact@florafactory.vn', '0875046798'),
    ('ORG0832', 'https://harvestfarm.vn', 'contact@harvestfarm.vn', '0860962673'),
    ('ORG0833', 'https://bluefarm.vn', 'contact@bluefarm.vn', '0215816735'),
    ('ORG0834', 'https://biovietnam.vn', 'contact@biovietnam.vn', '0669150720'),
    ('ORG0835', 'https://freshvietnam.vn', 'contact@freshvietnam.vn', '0477055078'),
    ('ORG0836', NULL, 'contact@skyhub.vn', NULL),
    ('ORG0837', 'https://cleanline.vn', 'contact@cleanline.vn', '0331296592'),
    ('ORG0838', NULL, 'contact@purehealth.vn', '0920960294'),
    ('ORG0839', 'https://primehub.vn', 'contact@primehub.vn', '0716130880'),
    ('ORG0840', NULL, NULL, '0623513020'),
    ('ORG0841', NULL, 'contact@microvietnam.vn', '0710980840'),
    ('ORG0842', NULL, 'contact@techgroup.vn', '0355467352'),
    ('ORG0843', 'https://harvestcapital.vn', 'contact@harvestcapital.vn', '0459029536'),
    ('ORG0844', 'https://omegahub.vn', 'contact@omegahub.vn', '0376503487'),
    ('ORG0845', 'https://ecoenergy.vn', NULL, '0227136978'),
    ('ORG0846', 'https://oceanpartners.vn', 'contact@oceanpartners.vn', '0321475051'),
    ('ORG0847', 'https://forestfactory.vn', NULL, '0729629907'),
    ('ORG0848', NULL, 'contact@novagroup.vn', '0526119443'),
    ('ORG0849', 'https://digitalpro.vn', 'contact@digitalpro.vn', '0378138015'),
    ('ORG0850', NULL, 'contact@clearhealth.vn', '0272193741')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0851', 'https://oceanco.vn', 'contact@oceanco.vn', '0658224412'),
    ('ORG0852', NULL, 'contact@cleargroup.vn', '0412695284'),
    ('ORG0853', NULL, 'contact@ruralfactory.vn', '0630336688'),
    ('ORG0854', 'https://pearlhealth.vn', 'contact@pearlhealth.vn', '0957149631'),
    ('ORG0855', 'https://primemarket.vn', 'contact@primemarket.vn', '0300313598'),
    ('ORG0856', NULL, 'contact@nanovietnam.vn', '0665242667'),
    ('ORG0857', NULL, 'contact@techtech.vn', '0542397086'),
    ('ORG0858', 'https://sunriselogistics.vn', NULL, '0374510156'),
    ('ORG0859', 'https://purepacific.vn', NULL, NULL),
    ('ORG0860', NULL, 'contact@vietflow.vn', '0206215913'),
    ('ORG0861', NULL, 'contact@solarcapital.vn', '0414625089'),
    ('ORG0862', NULL, 'contact@safemedia.vn', '0508921355'),
    ('ORG0863', 'https://novacorp.vn', 'contact@novacorp.vn', '0402707032'),
    ('ORG0864', NULL, 'contact@bamboolocal.vn', '0800663963'),
    ('ORG0865', NULL, 'contact@ruralcenter.vn', NULL),
    ('ORG0866', NULL, 'contact@mekongconnect.vn', '0929539485'),
    ('ORG0867', NULL, 'contact@freshlocal.vn', '0803549679'),
    ('ORG0868', 'https://ecoasia.vn', 'contact@ecoasia.vn', '0329109694'),
    ('ORG0869', 'https://ruralfood.vn', 'contact@ruralfood.vn', '0947727591'),
    ('ORG0870', 'https://microgate.vn', 'contact@microgate.vn', '0274870017'),
    ('ORG0871', 'https://urbanbase.vn', 'contact@urbanbase.vn', '0384270925'),
    ('ORG0872', NULL, 'contact@swiftco.vn', '0862423784'),
    ('ORG0873', 'https://lotusgroup.vn', 'contact@lotusgroup.vn', '0438149490'),
    ('ORG0874', 'https://biolab.vn', 'contact@biolab.vn', '0779199142'),
    ('ORG0875', NULL, NULL, '0654173839'),
    ('ORG0876', NULL, 'contact@cleanconnect.vn', '0876687201'),
    ('ORG0877', 'https://mekongpacific.vn', 'contact@mekongpacific.vn', '0485894632'),
    ('ORG0878', 'https://sparkco.vn', NULL, '0672033469'),
    ('ORG0879', 'https://sunrisepacific.vn', 'contact@sunrisepacific.vn', '0767944560'),
    ('ORG0880', 'https://safeworks.vn', NULL, '0604752715'),
    ('ORG0881', 'https://greensupply.vn', NULL, '0766807042'),
    ('ORG0882', NULL, 'contact@solarinstitute.vn', '0236244918'),
    ('ORG0883', 'https://mountainsupply.vn', 'contact@mountainsupply.vn', NULL),
    ('ORG0884', 'https://pearlflow.vn', 'contact@pearlflow.vn', '0202983016'),
    ('ORG0885', 'https://floralogistics.vn', NULL, '0732434303'),
    ('ORG0886', 'https://safepoint.vn', NULL, '0515597642'),
    ('ORG0887', 'https://greenco.vn', NULL, '0798464103'),
    ('ORG0888', 'https://aquagate.vn', NULL, '0685215053'),
    ('ORG0889', NULL, 'contact@florasupply.vn', '0360643932'),
    ('ORG0890', 'https://terrapoint.vn', 'contact@terrapoint.vn', '0610315979'),
    ('ORG0891', 'https://ecocore.vn', NULL, '0326147990'),
    ('ORG0892', NULL, 'contact@rurallogistics.vn', '0370652170'),
    ('ORG0893', 'https://cyclefund.vn', NULL, '0563953900'),
    ('ORG0894', 'https://greenpro.vn', NULL, '0796489365'),
    ('ORG0895', 'https://novafarm.vn', 'contact@novafarm.vn', NULL),
    ('ORG0896', 'https://swiftmedia.vn', 'contact@swiftmedia.vn', '0621361157'),
    ('ORG0897', 'https://urbantrade.vn', 'contact@urbantrade.vn', '0573512658'),
    ('ORG0898', 'https://safemarket.vn', 'contact@safemarket.vn', '0654254200'),
    ('ORG0899', NULL, 'contact@futurepro.vn', '0654365071'),
    ('ORG0900', 'https://mekongedu.vn', 'contact@mekongedu.vn', '0429559732')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0901', NULL, 'contact@harvestsupply.vn', '0731390697'),
    ('ORG0902', 'https://techlogistics.vn', NULL, '0950119209'),
    ('ORG0903', 'https://alphavietnam.vn', 'contact@alphavietnam.vn', '0774363277'),
    ('ORG0904', 'https://viethealth.vn', 'contact@viethealth.vn', '0852950895'),
    ('ORG0905', 'https://terrastudio.vn', 'contact@terrastudio.vn', '0429183846'),
    ('ORG0906', NULL, 'contact@sunriseasia.vn', '0237101218'),
    ('ORG0907', NULL, 'contact@goldentech.vn', NULL),
    ('ORG0908', 'https://swiftmarket.vn', 'contact@swiftmarket.vn', '0842266101'),
    ('ORG0909', 'https://oceanfood.vn', 'contact@oceanfood.vn', '0773021063'),
    ('ORG0910', 'https://harvestco.vn', 'contact@harvestco.vn', '0727953677'),
    ('ORG0911', NULL, 'contact@terracorp.vn', '0937336933'),
    ('ORG0912', NULL, 'contact@brightservices.vn', '0934851529'),
    ('ORG0913', 'https://greengroup.vn', NULL, '0583769627'),
    ('ORG0914', 'https://greenservices.vn', NULL, NULL),
    ('ORG0915', 'https://terrasystem.vn', NULL, '0885015124'),
    ('ORG0916', 'https://skynetwork.vn', 'contact@skynetwork.vn', '0215204964'),
    ('ORG0917', 'https://goldenservices.vn', 'contact@goldenservices.vn', '0703202486'),
    ('ORG0918', 'https://hydrosupply.vn', 'contact@hydrosupply.vn', '0625665387'),
    ('ORG0919', 'https://agriconnect.vn', 'contact@agriconnect.vn', '0612262186'),
    ('ORG0920', 'https://mountainpro.vn', 'contact@mountainpro.vn', '0355060901'),
    ('ORG0921', 'https://floraline.vn', 'contact@floraline.vn', '0478625365'),
    ('ORG0922', 'https://urbanmarket.vn', 'contact@urbanmarket.vn', '0791088471'),
    ('ORG0923', 'https://nanoalliance.vn', 'contact@nanoalliance.vn', '0891033824'),
    ('ORG0924', 'https://swiftsolutions.vn', 'contact@swiftsolutions.vn', '0447999758'),
    ('ORG0925', 'https://circleagency.vn', 'contact@circleagency.vn', '0383404229'),
    ('ORG0926', NULL, 'contact@omegafactory.vn', '0424666067'),
    ('ORG0927', 'https://urbancenter.vn', 'contact@urbancenter.vn', NULL),
    ('ORG0928', NULL, 'contact@novasupply.vn', '0327802344'),
    ('ORG0929', NULL, 'contact@mekongdynamics.vn', '0522214785'),
    ('ORG0930', 'https://skytrade.vn', 'contact@skytrade.vn', '0898256177'),
    ('ORG0931', NULL, 'contact@agrilogistics.vn', '0916879784'),
    ('ORG0932', 'https://hydrocenter.vn', 'contact@hydrocenter.vn', '0817549691'),
    ('ORG0933', 'https://harvestasia.vn', 'contact@harvestasia.vn', '0831771542'),
    ('ORG0934', NULL, 'contact@aquanetwork.vn', '0576305554'),
    ('ORG0935', NULL, 'contact@forestpoint.vn', '0482080773'),
    ('ORG0936', NULL, 'contact@pearltrade.vn', '0450638350'),
    ('ORG0937', NULL, 'contact@terrapartners.vn', '0732089656'),
    ('ORG0938', 'https://lotusventure.vn', 'contact@lotusventure.vn', '0311545348'),
    ('ORG0939', 'https://pioneerinstitute.vn', 'contact@pioneerinstitute.vn', '0482692545'),
    ('ORG0940', 'https://terratech.vn', NULL, '0239372167'),
    ('ORG0941', NULL, 'contact@circleservices.vn', '0397771678'),
    ('ORG0942', NULL, 'contact@skyfood.vn', '0430507942'),
    ('ORG0943', 'https://greenenergy.vn', 'contact@greenenergy.vn', '0687282360'),
    ('ORG0944', 'https://terraenergy.vn', 'contact@terraenergy.vn', '0596996648'),
    ('ORG0945', 'https://pearlbuild.vn', 'contact@pearlbuild.vn', '0564088549'),
    ('ORG0946', NULL, 'contact@microconnect.vn', '0660813379'),
    ('ORG0947', 'https://sparkline.vn', NULL, '0753265930'),
    ('ORG0948', 'https://cyclefactory.vn', 'contact@cyclefactory.vn', '0331518435'),
    ('ORG0949', NULL, NULL, '0832037910'),
    ('ORG0950', 'https://floratrade.vn', 'contact@floratrade.vn', '0436946513')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_contacts (organization_id, website, email, phone)
SELECT m.id, v.website, v.email, v.phone FROM (VALUES
    ('ORG0951', 'https://seedpartners.vn', 'contact@seedpartners.vn', '0905224457'),
    ('ORG0952', NULL, 'contact@blueasia.vn', '0241502816'),
    ('ORG0953', NULL, NULL, '0946635979'),
    ('ORG0954', 'https://terraventure.vn', 'contact@terraventure.vn', '0345340361'),
    ('ORG0955', 'https://alphacenter.vn', 'contact@alphacenter.vn', '0747690382'),
    ('ORG0956', 'https://oceanlogistics.vn', NULL, '0555941387'),
    ('ORG0957', 'https://purecenter.vn', 'contact@purecenter.vn', '0764478772'),
    ('ORG0958', 'https://novalocal.vn', NULL, '0292794938'),
    ('ORG0959', 'https://deltafarm.vn', 'contact@deltafarm.vn', NULL),
    ('ORG0960', 'https://cleanplus.vn', 'contact@cleanplus.vn', '0705777985'),
    ('ORG0961', NULL, 'contact@riverhub.vn', '0356357107'),
    ('ORG0962', NULL, 'contact@pureflow.vn', '0460473451'),
    ('ORG0963', 'https://puregate.vn', 'contact@puregate.vn', '0800485168'),
    ('ORG0964', 'https://forestmarket.vn', 'contact@forestmarket.vn', '0252440411'),
    ('ORG0965', 'https://lotushealth.vn', NULL, '0439090854'),
    ('ORG0966', 'https://omegaagency.vn', 'contact@omegaagency.vn', '0209825050'),
    ('ORG0967', NULL, 'contact@cleanagency.vn', '0828095020'),
    ('ORG0968', 'https://windstudio.vn', 'contact@windstudio.vn', '0443052008'),
    ('ORG0969', 'https://swiftworks.vn', 'contact@swiftworks.vn', '0636068253'),
    ('ORG0970', NULL, 'contact@cyclebase.vn', '0457010335'),
    ('ORG0971', 'https://clearinstitute.vn', 'contact@clearinstitute.vn', '0268709102'),
    ('ORG0972', NULL, 'contact@mekongworks.vn', '0463134226'),
    ('ORG0973', NULL, 'contact@floraglobal.vn', '0292922198'),
    ('ORG0974', 'https://sunrisecapital.vn', 'contact@sunrisecapital.vn', '0413054541'),
    ('ORG0975', 'https://viettech.vn', 'contact@viettech.vn', '0461230342'),
    ('ORG0976', 'https://vietfund.vn', NULL, NULL),
    ('ORG0977', 'https://digitalenergy.vn', 'contact@digitalenergy.vn', '0703865874'),
    ('ORG0978', NULL, 'contact@urbanfarm.vn', NULL),
    ('ORG0979', NULL, 'contact@aquaworks.vn', '0729813958'),
    ('ORG0980', NULL, 'contact@safelink.vn', '0367568157'),
    ('ORG0981', 'https://circleglobal.vn', 'contact@circleglobal.vn', '0973138581'),
    ('ORG0982', NULL, NULL, '0927114774'),
    ('ORG0983', 'https://sparkventure.vn', 'contact@sparkventure.vn', NULL),
    ('ORG0984', NULL, 'contact@sparkagency.vn', '0746503654'),
    ('ORG0985', 'https://biofactory.vn', 'contact@biofactory.vn', '0297936506'),
    ('ORG0986', 'https://circlevietnam.vn', 'contact@circlevietnam.vn', '0965370460'),
    ('ORG0987', 'https://microflow.vn', 'contact@microflow.vn', '0465713640'),
    ('ORG0988', NULL, 'contact@renewmarket.vn', '0696096543'),
    ('ORG0989', NULL, 'contact@skyglobal.vn', '0805915629'),
    ('ORG0990', 'https://cleanlab.vn', 'contact@cleanlab.vn', NULL),
    ('ORG0991', 'https://solarplus.vn', 'contact@solarplus.vn', '0628166318'),
    ('ORG0992', 'https://freshlogistics.vn', 'contact@freshlogistics.vn', '0395742031'),
    ('ORG0993', 'https://cleansystem.vn', NULL, NULL),
    ('ORG0994', 'https://renewfood.vn', NULL, '0504607709'),
    ('ORG0995', 'https://terraworks.vn', 'contact@terraworks.vn', '0835917832'),
    ('ORG0996', NULL, NULL, '0630188639'),
    ('ORG0997', 'https://solaragency.vn', 'contact@solaragency.vn', '0532562086'),
    ('ORG0998', NULL, 'contact@solarfactory.vn', NULL),
    ('ORG0999', 'https://aquaventure.vn', 'contact@aquaventure.vn', '0849249037'),
    ('ORG1000', 'https://forestinstitute.vn', 'contact@forestinstitute.vn', '0906739067')
) AS v(ext_code, website, email, phone)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

-- organization_locations
INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0001', 7, 'P. 3'),
    ('ORG0002', 7, 'X. 4'),
    ('ORG0003', 23, 'X. 7'),
    ('ORG0004', 32, 'TT. Hoàng Mai'),
    ('ORG0005', 30, 'P. 6'),
    ('ORG0006', 21, 'P. Ninh Kiều'),
    ('ORG0007', 24, 'TT. Đống Đa'),
    ('ORG0008', 9, 'TT. Bình Thạnh'),
    ('ORG0009', 13, 'Q. Long Bình'),
    ('ORG0010', 25, 'TT. Thủ Đức'),
    ('ORG0011', 5, 'Q. Hồng Bàng'),
    ('ORG0012', 5, NULL),
    ('ORG0013', 20, 'P. Hoàng Mai'),
    ('ORG0014', 1, 'Q. 2'),
    ('ORG0015', 11, 'Q. Long Bình'),
    ('ORG0016', 13, 'X. 15'),
    ('ORG0017', 3, 'P. 1'),
    ('ORG0018', 25, 'Q. 4'),
    ('ORG0019', 20, 'Q. Hoàng Mai'),
    ('ORG0020', 30, 'TT. 6'),
    ('ORG0021', 9, 'TT. 7'),
    ('ORG0022', 32, 'TT. Vĩnh Hải'),
    ('ORG0023', 30, 'TT. Gò Vấp'),
    ('ORG0024', 8, 'Q. Mỹ Long'),
    ('ORG0025', 3, 'TT. 6'),
    ('ORG0026', 2, 'X. Long Biên'),
    ('ORG0027', 31, 'X. Long Bình'),
    ('ORG0028', 19, 'Q. Thủ Đức'),
    ('ORG0029', 4, 'X. Cầu Giấy'),
    ('ORG0030', 11, 'P. Long Biên'),
    ('ORG0031', 8, 'X. 7'),
    ('ORG0032', 31, 'TT. Gò Vấp'),
    ('ORG0033', 21, 'P. 9'),
    ('ORG0034', 11, 'P. 2'),
    ('ORG0035', 18, 'TT. Hải Châu'),
    ('ORG0036', 25, 'Q. Vĩnh Hải'),
    ('ORG0037', 3, 'Q. 5'),
    ('ORG0038', 11, 'TT. 4'),
    ('ORG0039', 7, 'X. 3'),
    ('ORG0040', 3, 'TT. Bến Nghé'),
    ('ORG0041', 30, 'Q. 9'),
    ('ORG0042', 30, 'X. 5'),
    ('ORG0043', 24, 'TT. Bình Thạnh'),
    ('ORG0044', 14, 'Q. Hải Châu'),
    ('ORG0045', 9, 'P. 8'),
    ('ORG0046', 5, 'X. 4'),
    ('ORG0047', 17, 'Q. 6'),
    ('ORG0048', 31, 'P. Ninh Kiều'),
    ('ORG0049', 6, 'Q. Hồng Bàng'),
    ('ORG0050', 28, 'TT. 1')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0051', 5, 'P. Long Bình'),
    ('ORG0052', 34, 'X. 8'),
    ('ORG0053', 29, 'X. 15'),
    ('ORG0054', 30, 'P. Mỹ Long'),
    ('ORG0055', 24, 'X. Hồng Bàng'),
    ('ORG0056', 25, 'X. 12'),
    ('ORG0057', 22, 'Q. 4'),
    ('ORG0058', 19, 'TT. Long Biên'),
    ('ORG0059', 29, 'P. Long Bình'),
    ('ORG0060', 17, 'Q. 2'),
    ('ORG0061', 23, 'TT. Long Biên'),
    ('ORG0062', 23, 'Q. 12'),
    ('ORG0063', 4, 'X. Gò Vấp'),
    ('ORG0064', 6, 'X. Thủ Đức'),
    ('ORG0065', 10, 'TT. Bến Nghé'),
    ('ORG0066', 32, 'P. Gò Vấp'),
    ('ORG0067', 33, 'Q. 10'),
    ('ORG0068', 12, 'Q. Long Bình'),
    ('ORG0069', 11, 'Q. Long Biên'),
    ('ORG0070', 26, 'P. 7'),
    ('ORG0071', 7, 'TT. 15'),
    ('ORG0072', 4, 'TT. Thủ Đức'),
    ('ORG0073', 24, 'X. 2'),
    ('ORG0074', 20, 'P. Ninh Kiều'),
    ('ORG0075', 8, 'TT. Hải Châu'),
    ('ORG0076', 13, 'X. 2'),
    ('ORG0077', 31, 'X. 2'),
    ('ORG0078', 31, 'Q. 9'),
    ('ORG0079', 19, 'TT. Hoàng Mai'),
    ('ORG0080', 21, 'P. Gò Vấp'),
    ('ORG0081', 19, 'Q. Bình Thạnh'),
    ('ORG0082', 11, 'TT. Đống Đa'),
    ('ORG0083', 5, 'P. Cầu Giấy'),
    ('ORG0084', 28, 'Q. Bình Thạnh'),
    ('ORG0085', 15, 'P. Hoàng Mai'),
    ('ORG0086', 4, 'TT. 10'),
    ('ORG0087', 6, 'X. Cầu Giấy'),
    ('ORG0088', 16, 'Q. Hồng Bàng'),
    ('ORG0089', 2, 'TT. Thủ Đức'),
    ('ORG0090', 5, 'P. 9'),
    ('ORG0091', 28, 'Q. Đống Đa'),
    ('ORG0092', 25, 'TT. Bến Nghé'),
    ('ORG0093', 21, NULL),
    ('ORG0094', 21, NULL),
    ('ORG0095', 7, 'X. Mỹ Long'),
    ('ORG0096', 11, 'X. Gò Vấp'),
    ('ORG0097', 28, 'Q. Thủ Đức'),
    ('ORG0098', 14, 'X. 12'),
    ('ORG0099', 6, 'Q. 6'),
    ('ORG0100', 27, 'P. Đống Đa')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0101', 11, 'TT. Mỹ Long'),
    ('ORG0102', 24, 'TT. Đống Đa'),
    ('ORG0103', 9, 'TT. Long Biên'),
    ('ORG0104', 27, 'TT. Vĩnh Hải'),
    ('ORG0105', 20, 'P. Mỹ Long'),
    ('ORG0106', 19, 'P. Hoàng Mai'),
    ('ORG0107', 32, 'P. 15'),
    ('ORG0108', 30, NULL),
    ('ORG0109', 7, NULL),
    ('ORG0110', 25, 'Q. 5'),
    ('ORG0111', 19, 'P. 15'),
    ('ORG0112', 2, 'P. Gò Vấp'),
    ('ORG0113', 28, 'Q. Bến Nghé'),
    ('ORG0114', 22, 'X. 1'),
    ('ORG0115', 1, 'TT. Ninh Kiều'),
    ('ORG0116', 26, 'TT. 15'),
    ('ORG0117', 1, 'P. Bình Thạnh'),
    ('ORG0118', 7, 'TT. Cầu Giấy'),
    ('ORG0119', 30, 'P. 2'),
    ('ORG0120', 20, 'Q. An Khánh'),
    ('ORG0121', 2, 'Q. 5'),
    ('ORG0122', 3, 'Q. 5'),
    ('ORG0123', 18, 'X. 4'),
    ('ORG0124', 21, 'X. 3'),
    ('ORG0125', 9, 'Q. 10'),
    ('ORG0126', 12, 'X. Bình Thạnh'),
    ('ORG0127', 23, 'Q. 5'),
    ('ORG0128', 11, 'TT. Hồng Bàng'),
    ('ORG0129', 22, 'TT. 7'),
    ('ORG0130', 28, 'TT. Tân Bình'),
    ('ORG0131', 30, 'X. 3'),
    ('ORG0132', 29, 'Q. Tân Bình'),
    ('ORG0133', 8, 'Q. 3'),
    ('ORG0134', 31, 'X. An Khánh'),
    ('ORG0135', 4, 'Q. Cầu Giấy'),
    ('ORG0136', 32, 'Q. 15'),
    ('ORG0137', 31, 'Q. 4'),
    ('ORG0138', 18, 'X. Gò Vấp'),
    ('ORG0139', 22, 'Q. 6'),
    ('ORG0140', 19, 'P. Vĩnh Hải'),
    ('ORG0141', 22, 'Q. Hải Châu'),
    ('ORG0142', 1, 'Q. Bình Thạnh'),
    ('ORG0143', 15, 'Q. Tân Bình'),
    ('ORG0144', 17, 'Q. Tân Bình'),
    ('ORG0145', 23, 'X. Long Biên'),
    ('ORG0146', 4, 'Q. 15'),
    ('ORG0147', 26, 'X. 12'),
    ('ORG0148', 32, 'TT. Mỹ Long'),
    ('ORG0149', 32, 'X. Gò Vấp'),
    ('ORG0150', 22, 'P. 12')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0151', 9, 'TT. Đống Đa'),
    ('ORG0152', 34, 'TT. 12'),
    ('ORG0153', 14, 'X. 6'),
    ('ORG0154', 19, 'Q. 12'),
    ('ORG0155', 1, 'Q. 4'),
    ('ORG0156', 1, 'Q. Bến Nghé'),
    ('ORG0157', 19, 'TT. 2'),
    ('ORG0158', 32, NULL),
    ('ORG0159', 5, 'X. 2'),
    ('ORG0160', 29, 'P. Vĩnh Hải'),
    ('ORG0161', 14, 'X. Tân Bình'),
    ('ORG0162', 9, 'Q. Đống Đa'),
    ('ORG0163', 9, 'X. Vĩnh Hải'),
    ('ORG0164', 10, 'Q. 9'),
    ('ORG0165', 3, 'TT. Bình Thạnh'),
    ('ORG0166', 25, 'X. 3'),
    ('ORG0167', 24, 'P. 6'),
    ('ORG0168', 2, 'X. Cầu Giấy'),
    ('ORG0169', 31, 'P. 10'),
    ('ORG0170', 9, 'Q. 15'),
    ('ORG0171', 14, 'TT. Long Biên'),
    ('ORG0172', 1, 'Q. Vĩnh Hải'),
    ('ORG0173', 33, 'Q. 4'),
    ('ORG0174', 15, 'Q. Mỹ Long'),
    ('ORG0175', 31, 'P. Hồng Bàng'),
    ('ORG0176', 12, 'Q. Vĩnh Hải'),
    ('ORG0177', 18, 'X. Hồng Bàng'),
    ('ORG0178', 24, 'X. Long Biên'),
    ('ORG0179', 16, 'TT. Tân Bình'),
    ('ORG0180', 7, 'X. Gò Vấp'),
    ('ORG0181', 25, 'TT. 5'),
    ('ORG0182', 11, 'P. Hoàng Mai'),
    ('ORG0183', 16, 'TT. 5'),
    ('ORG0184', 31, 'P. Mỹ Long'),
    ('ORG0185', 13, 'TT. Hồng Bàng'),
    ('ORG0186', 30, 'X. 7'),
    ('ORG0187', 22, 'Q. Bến Nghé'),
    ('ORG0188', 21, 'P. 8'),
    ('ORG0189', 6, 'TT. Cầu Giấy'),
    ('ORG0190', 13, 'X. Hải Châu'),
    ('ORG0191', 5, 'TT. Tân Bình'),
    ('ORG0192', 25, 'X. Bến Nghé'),
    ('ORG0193', 15, 'Q. Tân Bình'),
    ('ORG0194', 24, 'TT. 12'),
    ('ORG0195', 14, 'P. 9'),
    ('ORG0196', 7, 'X. Bến Nghé'),
    ('ORG0197', 33, 'Q. Bến Nghé'),
    ('ORG0198', 9, 'Q. Vĩnh Hải'),
    ('ORG0199', 20, 'X. 4'),
    ('ORG0200', 29, 'X. Tân Bình')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0201', 1, 'X. 6'),
    ('ORG0202', 3, 'X. Hải Châu'),
    ('ORG0203', 6, 'Q. Long Bình'),
    ('ORG0204', 21, 'P. Long Biên'),
    ('ORG0205', 15, 'P. Ninh Kiều'),
    ('ORG0206', 5, 'TT. 15'),
    ('ORG0207', 25, 'P. Tân Bình'),
    ('ORG0208', 21, 'Q. Mỹ Long'),
    ('ORG0209', 25, 'P. 9'),
    ('ORG0210', 1, 'TT. Bình Thạnh'),
    ('ORG0211', 6, NULL),
    ('ORG0212', 34, 'Q. 4'),
    ('ORG0213', 13, NULL),
    ('ORG0214', 8, 'X. Hồng Bàng'),
    ('ORG0215', 2, 'X. 10'),
    ('ORG0216', 16, 'X. Tân Bình'),
    ('ORG0217', 25, 'P. An Khánh'),
    ('ORG0218', 10, 'P. An Khánh'),
    ('ORG0219', 4, 'P. Cầu Giấy'),
    ('ORG0220', 15, 'Q. 15'),
    ('ORG0221', 27, 'Q. 2'),
    ('ORG0222', 29, 'TT. Cầu Giấy'),
    ('ORG0223', 21, 'X. Long Bình'),
    ('ORG0224', 25, 'Q. 6'),
    ('ORG0225', 30, 'TT. 4'),
    ('ORG0226', 10, 'X. Mỹ Long'),
    ('ORG0227', 3, 'X. 8'),
    ('ORG0228', 10, 'X. 10'),
    ('ORG0229', 11, 'TT. Thủ Đức'),
    ('ORG0230', 22, 'P. Gò Vấp'),
    ('ORG0231', 19, 'P. An Khánh'),
    ('ORG0232', 11, 'X. 9'),
    ('ORG0233', 7, NULL),
    ('ORG0234', 31, 'X. Hải Châu'),
    ('ORG0235', 23, 'TT. 8'),
    ('ORG0236', 5, NULL),
    ('ORG0237', 5, 'TT. Hải Châu'),
    ('ORG0238', 11, 'P. Hoàng Mai'),
    ('ORG0239', 12, 'P. 5'),
    ('ORG0240', 11, 'P. Bến Nghé'),
    ('ORG0241', 13, 'X. Bình Thạnh'),
    ('ORG0242', 13, 'P. 7'),
    ('ORG0243', 28, 'Q. Bình Thạnh'),
    ('ORG0244', 1, 'TT. Tân Bình'),
    ('ORG0245', 25, 'X. 1'),
    ('ORG0246', 5, 'Q. Hoàng Mai'),
    ('ORG0247', 24, 'P. Tân Bình'),
    ('ORG0248', 2, 'P. An Khánh'),
    ('ORG0249', 19, 'Q. 4'),
    ('ORG0250', 2, 'TT. 9')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0251', 26, 'Q. Mỹ Long'),
    ('ORG0252', 28, 'X. An Khánh'),
    ('ORG0253', 1, 'X. Long Bình'),
    ('ORG0254', 19, 'TT. 7'),
    ('ORG0255', 23, 'X. Ninh Kiều'),
    ('ORG0256', 10, NULL),
    ('ORG0257', 29, 'X. Long Biên'),
    ('ORG0258', 8, 'P. Cầu Giấy'),
    ('ORG0259', 7, 'P. 1'),
    ('ORG0260', 34, 'X. 7'),
    ('ORG0261', 32, 'TT. Mỹ Long'),
    ('ORG0262', 26, 'TT. Vĩnh Hải'),
    ('ORG0263', 10, 'P. 9'),
    ('ORG0264', 32, 'X. 7'),
    ('ORG0265', 7, 'X. Long Bình'),
    ('ORG0266', 18, NULL),
    ('ORG0267', 17, NULL),
    ('ORG0268', 27, 'TT. 6'),
    ('ORG0269', 10, 'X. 15'),
    ('ORG0270', 13, 'Q. An Khánh'),
    ('ORG0271', 34, 'X. Vĩnh Hải'),
    ('ORG0272', 21, 'TT. 6'),
    ('ORG0273', 16, 'TT. An Khánh'),
    ('ORG0274', 7, 'X. 1'),
    ('ORG0275', 29, 'Q. Gò Vấp'),
    ('ORG0276', 28, 'Q. Cầu Giấy'),
    ('ORG0277', 12, 'Q. An Khánh'),
    ('ORG0278', 31, 'P. An Khánh'),
    ('ORG0279', 18, 'TT. Thủ Đức'),
    ('ORG0280', 8, 'TT. Bến Nghé'),
    ('ORG0281', 12, 'P. Bình Thạnh'),
    ('ORG0282', 29, 'Q. Tân Bình'),
    ('ORG0283', 7, 'Q. Vĩnh Hải'),
    ('ORG0284', 6, 'TT. Thủ Đức'),
    ('ORG0285', 12, 'P. Cầu Giấy'),
    ('ORG0286', 8, NULL),
    ('ORG0287', 16, 'Q. Cầu Giấy'),
    ('ORG0288', 32, 'X. Bến Nghé'),
    ('ORG0289', 23, 'Q. 3'),
    ('ORG0290', 11, 'P. 10'),
    ('ORG0291', 22, 'P. 9'),
    ('ORG0292', 29, 'TT. 8'),
    ('ORG0293', 28, 'TT. Mỹ Long'),
    ('ORG0294', 27, 'X. 8'),
    ('ORG0295', 14, 'X. 1'),
    ('ORG0296', 23, 'Q. 7'),
    ('ORG0297', 34, 'X. 3'),
    ('ORG0298', 24, 'P. 1'),
    ('ORG0299', 9, 'TT. 9'),
    ('ORG0300', 6, 'P. 3')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0301', 2, 'X. Hồng Bàng'),
    ('ORG0302', 25, 'P. Bến Nghé'),
    ('ORG0303', 29, 'Q. 10'),
    ('ORG0304', 5, 'TT. 7'),
    ('ORG0305', 31, NULL),
    ('ORG0306', 13, 'Q. 8'),
    ('ORG0307', 33, 'Q. 6'),
    ('ORG0308', 4, 'X. Long Bình'),
    ('ORG0309', 5, 'Q. Long Biên'),
    ('ORG0310', 29, 'P. Bến Nghé'),
    ('ORG0311', 25, 'TT. 4'),
    ('ORG0312', 9, 'P. Hoàng Mai'),
    ('ORG0313', 13, 'Q. 10'),
    ('ORG0314', 31, 'X. 10'),
    ('ORG0315', 12, 'Q. Long Biên'),
    ('ORG0316', 10, 'Q. 10'),
    ('ORG0317', 33, 'X. Vĩnh Hải'),
    ('ORG0318', 25, 'X. Gò Vấp'),
    ('ORG0319', 17, 'X. Cầu Giấy'),
    ('ORG0320', 17, NULL),
    ('ORG0321', 27, 'TT. 15'),
    ('ORG0322', 26, 'TT. Tân Bình'),
    ('ORG0323', 19, 'P. Mỹ Long'),
    ('ORG0324', 18, 'Q. Mỹ Long'),
    ('ORG0325', 30, 'Q. 7'),
    ('ORG0326', 17, 'P. Mỹ Long'),
    ('ORG0327', 31, 'Q. Long Biên'),
    ('ORG0328', 25, 'TT. Bến Nghé'),
    ('ORG0329', 27, 'X. Hải Châu'),
    ('ORG0330', 5, 'TT. Thủ Đức'),
    ('ORG0331', 29, 'Q. 1'),
    ('ORG0332', 9, 'P. 1'),
    ('ORG0333', 10, 'Q. Cầu Giấy'),
    ('ORG0334', 6, 'X. Hồng Bàng'),
    ('ORG0335', 22, 'TT. Tân Bình'),
    ('ORG0336', 33, 'X. 7'),
    ('ORG0337', 6, 'TT. Hồng Bàng'),
    ('ORG0338', 26, 'P. Long Biên'),
    ('ORG0339', 13, 'TT. Mỹ Long'),
    ('ORG0340', 14, 'P. Hồng Bàng'),
    ('ORG0341', 9, NULL),
    ('ORG0342', 23, 'TT. 6'),
    ('ORG0343', 2, 'X. Hồng Bàng'),
    ('ORG0344', 17, 'P. Đống Đa'),
    ('ORG0345', 9, 'Q. Đống Đa'),
    ('ORG0346', 32, 'TT. Bến Nghé'),
    ('ORG0347', 34, 'X. 7'),
    ('ORG0348', 25, 'TT. 6'),
    ('ORG0349', 25, 'P. 9'),
    ('ORG0350', 31, 'TT. Thủ Đức')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0351', 29, 'P. Bến Nghé'),
    ('ORG0352', 16, NULL),
    ('ORG0353', 5, 'X. 5'),
    ('ORG0354', 24, 'X. Hoàng Mai'),
    ('ORG0355', 21, 'TT. Long Biên'),
    ('ORG0356', 29, 'TT. 1'),
    ('ORG0357', 28, 'Q. Vĩnh Hải'),
    ('ORG0358', 9, 'P. Long Bình'),
    ('ORG0359', 4, 'TT. Hải Châu'),
    ('ORG0360', 7, 'TT. Long Biên'),
    ('ORG0361', 26, 'TT. Hoàng Mai'),
    ('ORG0362', 18, 'X. 7'),
    ('ORG0363', 6, 'TT. Long Bình'),
    ('ORG0364', 3, NULL),
    ('ORG0365', 16, 'Q. 3'),
    ('ORG0366', 8, 'P. Vĩnh Hải'),
    ('ORG0367', 25, 'X. Tân Bình'),
    ('ORG0368', 16, 'Q. 2'),
    ('ORG0369', 14, 'Q. Hải Châu'),
    ('ORG0370', 2, 'Q. 12'),
    ('ORG0371', 6, 'P. 10'),
    ('ORG0372', 3, 'X. Đống Đa'),
    ('ORG0373', 24, 'P. Bến Nghé'),
    ('ORG0374', 25, 'TT. 12'),
    ('ORG0375', 15, 'TT. 1'),
    ('ORG0376', 10, 'TT. Bình Thạnh'),
    ('ORG0377', 27, 'Q. Vĩnh Hải'),
    ('ORG0378', 1, 'TT. 6'),
    ('ORG0379', 30, 'TT. 12'),
    ('ORG0380', 16, 'P. 3'),
    ('ORG0381', 25, 'P. Thủ Đức'),
    ('ORG0382', 5, 'TT. Đống Đa'),
    ('ORG0383', 3, 'X. Hồng Bàng'),
    ('ORG0384', 19, 'TT. 15'),
    ('ORG0385', 8, 'P. 2'),
    ('ORG0386', 27, 'X. Long Biên'),
    ('ORG0387', 21, 'X. An Khánh'),
    ('ORG0388', 23, 'Q. 6'),
    ('ORG0389', 19, 'P. Cầu Giấy'),
    ('ORG0390', 23, 'TT. Long Bình'),
    ('ORG0391', 11, 'TT. Bình Thạnh'),
    ('ORG0392', 17, 'Q. Hải Châu'),
    ('ORG0393', 4, 'Q. 5'),
    ('ORG0394', 27, 'P. Tân Bình'),
    ('ORG0395', 2, 'Q. Tân Bình'),
    ('ORG0396', 13, 'Q. 6'),
    ('ORG0397', 3, 'X. 3'),
    ('ORG0398', 21, 'X. Tân Bình'),
    ('ORG0399', 32, NULL),
    ('ORG0400', 2, 'P. 12')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0401', 28, 'P. Tân Bình'),
    ('ORG0402', 30, 'X. 15'),
    ('ORG0403', 14, 'P. Vĩnh Hải'),
    ('ORG0404', 33, 'TT. Tân Bình'),
    ('ORG0405', 29, 'P. Bến Nghé'),
    ('ORG0406', 18, 'TT. Hồng Bàng'),
    ('ORG0407', 12, 'TT. Hoàng Mai'),
    ('ORG0408', 2, 'X. 12'),
    ('ORG0409', 34, 'P. Hoàng Mai'),
    ('ORG0410', 17, 'X. Hải Châu'),
    ('ORG0411', 32, 'X. An Khánh'),
    ('ORG0412', 18, 'Q. Long Bình'),
    ('ORG0413', 9, 'Q. Thủ Đức'),
    ('ORG0414', 16, 'X. Hoàng Mai'),
    ('ORG0415', 4, 'P. 7'),
    ('ORG0416', 16, 'TT. An Khánh'),
    ('ORG0417', 31, 'X. 6'),
    ('ORG0418', 23, 'TT. 8'),
    ('ORG0419', 33, 'X. Hoàng Mai'),
    ('ORG0420', 27, 'P. 4'),
    ('ORG0421', 6, 'P. Tân Bình'),
    ('ORG0422', 25, 'P. Hoàng Mai'),
    ('ORG0423', 26, 'P. 3'),
    ('ORG0424', 31, 'X. 8'),
    ('ORG0425', 4, 'TT. 7'),
    ('ORG0426', 4, 'Q. Mỹ Long'),
    ('ORG0427', 19, 'Q. 1'),
    ('ORG0428', 32, 'X. Gò Vấp'),
    ('ORG0429', 23, 'X. 12'),
    ('ORG0430', 18, 'Q. 9'),
    ('ORG0431', 27, 'P. Gò Vấp'),
    ('ORG0432', 21, NULL),
    ('ORG0433', 5, 'X. Hoàng Mai'),
    ('ORG0434', 14, 'P. 6'),
    ('ORG0435', 22, 'X. Bình Thạnh'),
    ('ORG0436', 27, 'Q. 4'),
    ('ORG0437', 11, 'Q. 1'),
    ('ORG0438', 31, 'Q. 8'),
    ('ORG0439', 21, 'Q. Hoàng Mai'),
    ('ORG0440', 15, 'Q. Đống Đa'),
    ('ORG0441', 30, 'P. 7'),
    ('ORG0442', 21, 'P. Long Bình'),
    ('ORG0443', 28, 'Q. 7'),
    ('ORG0444', 29, 'TT. Đống Đa'),
    ('ORG0445', 17, 'TT. Hồng Bàng'),
    ('ORG0446', 25, 'X. Ninh Kiều'),
    ('ORG0447', 11, 'P. Bình Thạnh'),
    ('ORG0448', 7, 'TT. Tân Bình'),
    ('ORG0449', 25, NULL),
    ('ORG0450', 32, 'P. Hoàng Mai')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0451', 32, 'Q. Hải Châu'),
    ('ORG0452', 34, 'TT. Hồng Bàng'),
    ('ORG0453', 21, 'Q. Vĩnh Hải'),
    ('ORG0454', 20, 'TT. Gò Vấp'),
    ('ORG0455', 14, 'Q. Hoàng Mai'),
    ('ORG0456', 17, 'TT. 5'),
    ('ORG0457', 17, 'P. 4'),
    ('ORG0458', 27, 'P. Bến Nghé'),
    ('ORG0459', 33, 'X. Cầu Giấy'),
    ('ORG0460', 11, 'Q. 5'),
    ('ORG0461', 17, 'X. 3'),
    ('ORG0462', 14, 'TT. Gò Vấp'),
    ('ORG0463', 22, 'P. Long Biên'),
    ('ORG0464', 33, 'TT. 9'),
    ('ORG0465', 10, 'Q. Thủ Đức'),
    ('ORG0466', 7, 'X. 9'),
    ('ORG0467', 15, 'Q. Bến Nghé'),
    ('ORG0468', 11, 'TT. 6'),
    ('ORG0469', 22, 'X. Tân Bình'),
    ('ORG0470', 19, 'P. Mỹ Long'),
    ('ORG0471', 5, 'P. Hoàng Mai'),
    ('ORG0472', 24, 'Q. 9'),
    ('ORG0473', 2, 'Q. Cầu Giấy'),
    ('ORG0474', 25, 'P. 6'),
    ('ORG0475', 16, 'Q. Hồng Bàng'),
    ('ORG0476', 15, 'TT. 9'),
    ('ORG0477', 9, 'P. 4'),
    ('ORG0478', 2, 'TT. Mỹ Long'),
    ('ORG0479', 8, 'P. Mỹ Long'),
    ('ORG0480', 14, 'X. 5'),
    ('ORG0481', 20, 'Q. 3'),
    ('ORG0482', 23, 'X. 1'),
    ('ORG0483', 23, 'P. 12'),
    ('ORG0484', 16, 'Q. 7'),
    ('ORG0485', 7, 'P. Hải Châu'),
    ('ORG0486', 17, 'X. Vĩnh Hải'),
    ('ORG0487', 28, 'P. 15'),
    ('ORG0488', 11, 'Q. Hải Châu'),
    ('ORG0489', 13, 'X. Thủ Đức'),
    ('ORG0490', 18, 'TT. Bến Nghé'),
    ('ORG0491', 5, 'X. 15'),
    ('ORG0492', 28, 'X. 10'),
    ('ORG0493', 22, 'X. Mỹ Long'),
    ('ORG0494', 13, 'X. 7'),
    ('ORG0495', 14, 'P. Hoàng Mai'),
    ('ORG0496', 21, 'Q. Cầu Giấy'),
    ('ORG0497', 25, 'P. Gò Vấp'),
    ('ORG0498', 12, 'Q. 8'),
    ('ORG0499', 25, 'Q. Long Biên'),
    ('ORG0500', 32, 'Q. Hoàng Mai')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0501', 9, 'X. 6'),
    ('ORG0502', 14, 'X. 2'),
    ('ORG0503', 30, 'P. 2'),
    ('ORG0504', 34, 'X. 2'),
    ('ORG0505', 31, 'Q. 8'),
    ('ORG0506', 9, 'P. 8'),
    ('ORG0507', 5, 'X. Gò Vấp'),
    ('ORG0508', 27, 'P. 15'),
    ('ORG0509', 34, 'TT. Bến Nghé'),
    ('ORG0510', 12, NULL),
    ('ORG0511', 32, 'X. Ninh Kiều'),
    ('ORG0512', 21, NULL),
    ('ORG0513', 6, 'Q. Mỹ Long'),
    ('ORG0514', 27, 'TT. 5'),
    ('ORG0515', 33, 'X. Đống Đa'),
    ('ORG0516', 32, 'Q. Hồng Bàng'),
    ('ORG0517', 11, 'Q. 4'),
    ('ORG0518', 32, 'X. Hồng Bàng'),
    ('ORG0519', 20, NULL),
    ('ORG0520', 2, 'P. 10'),
    ('ORG0521', 26, NULL),
    ('ORG0522', 32, NULL),
    ('ORG0523', 33, 'Q. 1'),
    ('ORG0524', 15, 'TT. Bến Nghé'),
    ('ORG0525', 26, NULL),
    ('ORG0526', 6, 'TT. Tân Bình'),
    ('ORG0527', 14, 'P. 3'),
    ('ORG0528', 16, 'X. 2'),
    ('ORG0529', 5, NULL),
    ('ORG0530', 25, 'Q. Ninh Kiều'),
    ('ORG0531', 16, 'Q. 3'),
    ('ORG0532', 22, 'Q. 6'),
    ('ORG0533', 34, 'P. 6'),
    ('ORG0534', 19, 'Q. Hoàng Mai'),
    ('ORG0535', 24, 'Q. Mỹ Long'),
    ('ORG0536', 17, 'X. 1'),
    ('ORG0537', 2, 'Q. Vĩnh Hải'),
    ('ORG0538', 2, 'P. Bình Thạnh'),
    ('ORG0539', 6, NULL),
    ('ORG0540', 21, 'Q. Long Biên'),
    ('ORG0541', 28, 'TT. An Khánh'),
    ('ORG0542', 30, 'TT. Mỹ Long'),
    ('ORG0543', 2, 'Q. Gò Vấp'),
    ('ORG0544', 10, 'TT. 10'),
    ('ORG0545', 16, 'X. 7'),
    ('ORG0546', 25, 'X. Cầu Giấy'),
    ('ORG0547', 32, 'Q. 12'),
    ('ORG0548', 27, 'TT. 9'),
    ('ORG0549', 21, 'TT. 2'),
    ('ORG0550', 23, 'TT. Hải Châu')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0551', 31, NULL),
    ('ORG0552', 23, 'X. 1'),
    ('ORG0553', 29, 'TT. Tân Bình'),
    ('ORG0554', 1, 'Q. 15'),
    ('ORG0555', 1, 'TT. 8'),
    ('ORG0556', 12, NULL),
    ('ORG0557', 3, 'X. 7'),
    ('ORG0558', 6, 'TT. 12'),
    ('ORG0559', 22, 'TT. Mỹ Long'),
    ('ORG0560', 15, 'X. Vĩnh Hải'),
    ('ORG0561', 32, 'P. 7'),
    ('ORG0562', 20, 'X. Tân Bình'),
    ('ORG0563', 2, 'TT. 9'),
    ('ORG0564', 9, 'P. 1'),
    ('ORG0565', 31, 'P. Hồng Bàng'),
    ('ORG0566', 24, 'TT. An Khánh'),
    ('ORG0567', 2, 'Q. 6'),
    ('ORG0568', 33, 'P. 1'),
    ('ORG0569', 31, 'P. 3'),
    ('ORG0570', 15, 'Q. Vĩnh Hải'),
    ('ORG0571', 30, 'X. Thủ Đức'),
    ('ORG0572', 20, 'X. 1'),
    ('ORG0573', 12, 'TT. Ninh Kiều'),
    ('ORG0574', 13, 'TT. 5'),
    ('ORG0575', 8, 'X. Thủ Đức'),
    ('ORG0576', 8, 'TT. Bình Thạnh'),
    ('ORG0577', 18, 'TT. Long Bình'),
    ('ORG0578', 25, 'TT. An Khánh'),
    ('ORG0579', 4, 'P. 7'),
    ('ORG0580', 19, 'TT. Long Biên'),
    ('ORG0581', 33, 'TT. Hoàng Mai'),
    ('ORG0582', 26, 'TT. 1'),
    ('ORG0583', 24, NULL),
    ('ORG0584', 16, 'P. Thủ Đức'),
    ('ORG0585', 2, 'X. An Khánh'),
    ('ORG0586', 10, 'Q. Cầu Giấy'),
    ('ORG0587', 15, 'Q. 6'),
    ('ORG0588', 32, 'TT. Bến Nghé'),
    ('ORG0589', 16, 'TT. 6'),
    ('ORG0590', 11, 'X. 3'),
    ('ORG0591', 11, 'X. Đống Đa'),
    ('ORG0592', 15, 'P. Hồng Bàng'),
    ('ORG0593', 7, 'Q. Hoàng Mai'),
    ('ORG0594', 32, 'TT. 10'),
    ('ORG0595', 3, 'X. 7'),
    ('ORG0596', 19, 'TT. 3'),
    ('ORG0597', 29, 'P. Long Bình'),
    ('ORG0598', 16, 'P. Đống Đa'),
    ('ORG0599', 16, 'X. Long Biên'),
    ('ORG0600', 10, 'Q. Vĩnh Hải')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0601', 13, NULL),
    ('ORG0602', 16, 'TT. Thủ Đức'),
    ('ORG0603', 8, 'X. 9'),
    ('ORG0604', 5, 'P. Đống Đa'),
    ('ORG0605', 1, 'X. 3'),
    ('ORG0606', 1, 'TT. 3'),
    ('ORG0607', 8, 'P. Long Bình'),
    ('ORG0608', 28, NULL),
    ('ORG0609', 31, 'X. Long Biên'),
    ('ORG0610', 17, 'Q. 5'),
    ('ORG0611', 13, 'X. Bến Nghé'),
    ('ORG0612', 9, 'Q. Tân Bình'),
    ('ORG0613', 27, 'P. Cầu Giấy'),
    ('ORG0614', 9, 'P. 6'),
    ('ORG0615', 11, 'Q. Long Bình'),
    ('ORG0616', 30, 'P. 10'),
    ('ORG0617', 16, 'P. Hải Châu'),
    ('ORG0618', 21, 'X. 15'),
    ('ORG0619', 10, 'X. Hồng Bàng'),
    ('ORG0620', 28, 'P. 4'),
    ('ORG0621', 24, 'X. Thủ Đức'),
    ('ORG0622', 17, 'P. 2'),
    ('ORG0623', 11, 'X. Long Bình'),
    ('ORG0624', 12, 'Q. 8'),
    ('ORG0625', 9, 'P. 6'),
    ('ORG0626', 30, 'P. 2'),
    ('ORG0627', 30, 'TT. 9'),
    ('ORG0628', 24, 'X. Hoàng Mai'),
    ('ORG0629', 16, 'X. Hải Châu'),
    ('ORG0630', 3, 'P. 1'),
    ('ORG0631', 7, 'TT. Long Bình'),
    ('ORG0632', 4, 'X. Mỹ Long'),
    ('ORG0633', 19, 'TT. Cầu Giấy'),
    ('ORG0634', 4, 'P. 2'),
    ('ORG0635', 19, 'X. Long Bình'),
    ('ORG0636', 28, 'Q. 9'),
    ('ORG0637', 8, 'TT. 1'),
    ('ORG0638', 27, 'P. 8'),
    ('ORG0639', 25, 'Q. 3'),
    ('ORG0640', 11, 'P. 4'),
    ('ORG0641', 11, 'X. Bến Nghé'),
    ('ORG0642', 1, 'P. Vĩnh Hải'),
    ('ORG0643', 2, 'TT. 8'),
    ('ORG0644', 23, 'Q. Cầu Giấy'),
    ('ORG0645', 18, 'X. 10'),
    ('ORG0646', 3, 'TT. Cầu Giấy'),
    ('ORG0647', 10, 'TT. 1'),
    ('ORG0648', 22, 'P. An Khánh'),
    ('ORG0649', 26, 'Q. 15'),
    ('ORG0650', 22, 'X. Đống Đa')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0651', 31, 'Q. Bến Nghé'),
    ('ORG0652', 31, 'P. Bình Thạnh'),
    ('ORG0653', 31, NULL),
    ('ORG0654', 18, 'X. 8'),
    ('ORG0655', 15, 'Q. Hoàng Mai'),
    ('ORG0656', 32, 'Q. Long Bình'),
    ('ORG0657', 5, 'Q. 12'),
    ('ORG0658', 21, 'X. 2'),
    ('ORG0659', 30, 'Q. Mỹ Long'),
    ('ORG0660', 11, 'X. 7'),
    ('ORG0661', 29, 'TT. An Khánh'),
    ('ORG0662', 7, 'X. Hồng Bàng'),
    ('ORG0663', 13, NULL),
    ('ORG0664', 18, 'Q. Bến Nghé'),
    ('ORG0665', 4, 'P. Đống Đa'),
    ('ORG0666', 30, 'X. 9'),
    ('ORG0667', 23, 'P. 10'),
    ('ORG0668', 2, 'P. 8'),
    ('ORG0669', 15, 'X. 1'),
    ('ORG0670', 24, 'X. 4'),
    ('ORG0671', 14, NULL),
    ('ORG0672', 4, 'Q. 1'),
    ('ORG0673', 29, 'TT. 4'),
    ('ORG0674', 31, NULL),
    ('ORG0675', 1, 'P. Hải Châu'),
    ('ORG0676', 27, 'P. Hoàng Mai'),
    ('ORG0677', 11, 'Q. An Khánh'),
    ('ORG0678', 29, 'X. 6'),
    ('ORG0679', 31, 'P. 12'),
    ('ORG0680', 31, 'P. Gò Vấp'),
    ('ORG0681', 7, 'TT. 3'),
    ('ORG0682', 10, 'X. 3'),
    ('ORG0683', 20, 'P. 3'),
    ('ORG0684', 24, 'X. 9'),
    ('ORG0685', 1, 'TT. 12'),
    ('ORG0686', 20, 'TT. 3'),
    ('ORG0687', 5, 'TT. 6'),
    ('ORG0688', 20, 'X. 1'),
    ('ORG0689', 22, 'P. 3'),
    ('ORG0690', 23, 'P. An Khánh'),
    ('ORG0691', 6, 'P. Cầu Giấy'),
    ('ORG0692', 29, 'TT. 10'),
    ('ORG0693', 17, 'Q. Thủ Đức'),
    ('ORG0694', 13, 'TT. Thủ Đức'),
    ('ORG0695', 31, 'P. 5'),
    ('ORG0696', 1, NULL),
    ('ORG0697', 4, 'Q. 12'),
    ('ORG0698', 21, 'Q. 12'),
    ('ORG0699', 10, 'TT. An Khánh'),
    ('ORG0700', 28, 'P. An Khánh')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0701', 6, 'P. 10'),
    ('ORG0702', 18, 'TT. Mỹ Long'),
    ('ORG0703', 26, 'X. 9'),
    ('ORG0704', 34, 'TT. 10'),
    ('ORG0705', 1, 'P. 2'),
    ('ORG0706', 18, 'TT. Hoàng Mai'),
    ('ORG0707', 1, 'Q. Hoàng Mai'),
    ('ORG0708', 1, 'TT. 1'),
    ('ORG0709', 24, 'Q. 15'),
    ('ORG0710', 30, 'TT. 3'),
    ('ORG0711', 27, 'P. 4'),
    ('ORG0712', 5, 'X. Tân Bình'),
    ('ORG0713', 17, 'Q. 2'),
    ('ORG0714', 12, 'P. 4'),
    ('ORG0715', 7, 'P. Hoàng Mai'),
    ('ORG0716', 21, 'X. 15'),
    ('ORG0717', 7, 'Q. 15'),
    ('ORG0718', 1, 'Q. Bến Nghé'),
    ('ORG0719', 25, 'P. Long Bình'),
    ('ORG0720', 15, NULL),
    ('ORG0721', 12, 'Q. Bình Thạnh'),
    ('ORG0722', 1, 'P. Cầu Giấy'),
    ('ORG0723', 3, 'Q. Long Bình'),
    ('ORG0724', 12, 'Q. Đống Đa'),
    ('ORG0725', 30, 'TT. Long Biên'),
    ('ORG0726', 31, 'P. Long Biên'),
    ('ORG0727', 1, 'Q. Bến Nghé'),
    ('ORG0728', 27, 'P. Long Bình'),
    ('ORG0729', 5, 'TT. 15'),
    ('ORG0730', 33, 'TT. 2'),
    ('ORG0731', 20, 'Q. 7'),
    ('ORG0732', 18, 'P. 6'),
    ('ORG0733', 19, 'Q. Ninh Kiều'),
    ('ORG0734', 22, 'TT. 3'),
    ('ORG0735', 22, 'P. 2'),
    ('ORG0736', 16, 'P. Gò Vấp'),
    ('ORG0737', 7, 'P. An Khánh'),
    ('ORG0738', 4, 'Q. 5'),
    ('ORG0739', 3, 'X. 12'),
    ('ORG0740', 26, 'P. Vĩnh Hải'),
    ('ORG0741', 11, 'TT. Bình Thạnh'),
    ('ORG0742', 6, 'TT. Bến Nghé'),
    ('ORG0743', 17, 'TT. Tân Bình'),
    ('ORG0744', 26, 'Q. 12'),
    ('ORG0745', 21, 'X. 9'),
    ('ORG0746', 21, 'P. 10'),
    ('ORG0747', 32, 'Q. Bến Nghé'),
    ('ORG0748', 30, 'TT. Hồng Bàng'),
    ('ORG0749', 23, 'Q. 5'),
    ('ORG0750', 32, 'X. Thủ Đức')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0751', 13, 'X. Long Bình'),
    ('ORG0752', 15, 'P. 7'),
    ('ORG0753', 19, 'TT. Bình Thạnh'),
    ('ORG0754', 27, 'Q. Hoàng Mai'),
    ('ORG0755', 27, 'TT. 10'),
    ('ORG0756', 8, 'TT. Hải Châu'),
    ('ORG0757', 6, 'X. Bến Nghé'),
    ('ORG0758', 2, NULL),
    ('ORG0759', 13, 'X. Tân Bình'),
    ('ORG0760', 9, 'P. Tân Bình'),
    ('ORG0761', 14, 'Q. Bình Thạnh'),
    ('ORG0762', 9, 'X. Bến Nghé'),
    ('ORG0763', 33, 'P. Long Biên'),
    ('ORG0764', 6, 'P. Đống Đa'),
    ('ORG0765', 23, 'X. 8'),
    ('ORG0766', 13, 'P. 7'),
    ('ORG0767', 5, 'X. Tân Bình'),
    ('ORG0768', 27, 'TT. Ninh Kiều'),
    ('ORG0769', 28, 'Q. 5'),
    ('ORG0770', 18, 'Q. 7'),
    ('ORG0771', 7, 'P. 1'),
    ('ORG0772', 19, 'TT. 8'),
    ('ORG0773', 14, 'P. Thủ Đức'),
    ('ORG0774', 28, 'Q. 7'),
    ('ORG0775', 4, 'TT. Long Biên'),
    ('ORG0776', 12, 'P. Bình Thạnh'),
    ('ORG0777', 31, 'P. Hồng Bàng'),
    ('ORG0778', 8, 'P. Ninh Kiều'),
    ('ORG0779', 23, 'P. Hoàng Mai'),
    ('ORG0780', 10, 'TT. Long Bình'),
    ('ORG0781', 33, 'P. Long Bình'),
    ('ORG0782', 1, 'Q. Đống Đa'),
    ('ORG0783', 13, 'P. Hải Châu'),
    ('ORG0784', 23, 'P. 2'),
    ('ORG0785', 24, 'P. Bến Nghé'),
    ('ORG0786', 21, 'Q. Long Biên'),
    ('ORG0787', 15, 'X. An Khánh'),
    ('ORG0788', 32, 'X. 2'),
    ('ORG0789', 5, 'P. 1'),
    ('ORG0790', 23, 'TT. Tân Bình'),
    ('ORG0791', 31, 'Q. 10'),
    ('ORG0792', 15, 'P. Đống Đa'),
    ('ORG0793', 25, 'TT. Gò Vấp'),
    ('ORG0794', 19, 'X. 4'),
    ('ORG0795', 10, 'TT. 8'),
    ('ORG0796', 6, 'Q. 5'),
    ('ORG0797', 29, 'P. Ninh Kiều'),
    ('ORG0798', 1, 'Q. 15'),
    ('ORG0799', 14, 'X. 7'),
    ('ORG0800', 16, 'X. 15')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0801', 1, 'Q. Thủ Đức'),
    ('ORG0802', 3, 'P. Hoàng Mai'),
    ('ORG0803', 3, 'TT. Gò Vấp'),
    ('ORG0804', 32, 'X. Tân Bình'),
    ('ORG0805', 14, 'TT. 5'),
    ('ORG0806', 9, 'Q. Bến Nghé'),
    ('ORG0807', 31, 'X. Đống Đa'),
    ('ORG0808', 14, 'P. Đống Đa'),
    ('ORG0809', 3, NULL),
    ('ORG0810', 30, 'TT. Cầu Giấy'),
    ('ORG0811', 8, 'P. 3'),
    ('ORG0812', 26, NULL),
    ('ORG0813', 9, 'P. 5'),
    ('ORG0814', 26, 'X. 8'),
    ('ORG0815', 3, 'Q. Cầu Giấy'),
    ('ORG0816', 1, 'Q. Tân Bình'),
    ('ORG0817', 34, 'P. Đống Đa'),
    ('ORG0818', 31, 'TT. Bình Thạnh'),
    ('ORG0819', 22, 'X. Hoàng Mai'),
    ('ORG0820', 10, 'P. Bến Nghé'),
    ('ORG0821', 30, 'X. 5'),
    ('ORG0822', 26, 'P. Bến Nghé'),
    ('ORG0823', 23, 'P. 5'),
    ('ORG0824', 7, 'X. Bình Thạnh'),
    ('ORG0825', 12, 'P. 1'),
    ('ORG0826', 14, 'P. Long Bình'),
    ('ORG0827', 23, 'X. 3'),
    ('ORG0828', 22, 'X. 1'),
    ('ORG0829', 16, 'P. 7'),
    ('ORG0830', 6, 'P. An Khánh'),
    ('ORG0831', 19, 'TT. 12'),
    ('ORG0832', 15, 'TT. Đống Đa'),
    ('ORG0833', 1, 'X. 10'),
    ('ORG0834', 26, 'P. Hồng Bàng'),
    ('ORG0835', 1, 'X. Bến Nghé'),
    ('ORG0836', 1, 'Q. Bến Nghé'),
    ('ORG0837', 27, 'Q. Vĩnh Hải'),
    ('ORG0838', 33, 'X. Gò Vấp'),
    ('ORG0839', 4, 'TT. Đống Đa'),
    ('ORG0840', 30, 'TT. Bến Nghé'),
    ('ORG0841', 5, 'Q. Hải Châu'),
    ('ORG0842', 16, 'X. 10'),
    ('ORG0843', 22, 'Q. Long Bình'),
    ('ORG0844', 30, 'TT. Long Bình'),
    ('ORG0845', 18, 'TT. Gò Vấp'),
    ('ORG0846', 27, 'Q. Gò Vấp'),
    ('ORG0847', 7, 'Q. 8'),
    ('ORG0848', 27, 'X. 12'),
    ('ORG0849', 3, 'P. 3'),
    ('ORG0850', 23, 'Q. Tân Bình')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0851', 16, 'Q. Thủ Đức'),
    ('ORG0852', 26, 'Q. Bến Nghé'),
    ('ORG0853', 12, 'P. 7'),
    ('ORG0854', 11, 'X. Hải Châu'),
    ('ORG0855', 30, 'Q. Ninh Kiều'),
    ('ORG0856', 23, 'P. Long Biên'),
    ('ORG0857', 31, 'Q. Ninh Kiều'),
    ('ORG0858', 27, 'X. Long Biên'),
    ('ORG0859', 22, 'P. 3'),
    ('ORG0860', 11, 'TT. Cầu Giấy'),
    ('ORG0861', 26, 'X. An Khánh'),
    ('ORG0862', 28, 'Q. 7'),
    ('ORG0863', 33, 'P. Cầu Giấy'),
    ('ORG0864', 23, 'X. 8'),
    ('ORG0865', 12, 'X. Bình Thạnh'),
    ('ORG0866', 29, 'X. Long Bình'),
    ('ORG0867', 1, 'X. Hải Châu'),
    ('ORG0868', 14, NULL),
    ('ORG0869', 3, 'Q. 3'),
    ('ORG0870', 26, 'TT. An Khánh'),
    ('ORG0871', 6, 'P. 2'),
    ('ORG0872', 23, 'TT. Mỹ Long'),
    ('ORG0873', 8, 'P. Hồng Bàng'),
    ('ORG0874', 20, NULL),
    ('ORG0875', 12, 'TT. 5'),
    ('ORG0876', 27, 'X. Gò Vấp'),
    ('ORG0877', 6, 'Q. Bình Thạnh'),
    ('ORG0878', 23, 'TT. Gò Vấp'),
    ('ORG0879', 9, 'P. Hồng Bàng'),
    ('ORG0880', 26, 'TT. 3'),
    ('ORG0881', 34, 'X. 4'),
    ('ORG0882', 10, 'P. 10'),
    ('ORG0883', 19, 'X. 4'),
    ('ORG0884', 26, 'P. Cầu Giấy'),
    ('ORG0885', 13, 'X. 15'),
    ('ORG0886', 13, 'Q. Tân Bình'),
    ('ORG0887', 5, 'P. 10'),
    ('ORG0888', 23, 'P. 8'),
    ('ORG0889', 8, 'P. 9'),
    ('ORG0890', 1, 'X. Long Biên'),
    ('ORG0891', 28, 'TT. Bến Nghé'),
    ('ORG0892', 8, 'TT. Bến Nghé'),
    ('ORG0893', 6, 'P. Thủ Đức'),
    ('ORG0894', 9, 'P. 8'),
    ('ORG0895', 34, 'P. 5'),
    ('ORG0896', 24, 'X. Bình Thạnh'),
    ('ORG0897', 33, 'P. 5'),
    ('ORG0898', 1, 'TT. Đống Đa'),
    ('ORG0899', 13, 'P. Mỹ Long'),
    ('ORG0900', 29, 'P. 7')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0901', 28, 'P. 2'),
    ('ORG0902', 28, 'Q. Tân Bình'),
    ('ORG0903', 17, 'TT. Bình Thạnh'),
    ('ORG0904', 19, 'X. Vĩnh Hải'),
    ('ORG0905', 15, 'P. 7'),
    ('ORG0906', 2, 'TT. An Khánh'),
    ('ORG0907', 33, 'TT. Long Bình'),
    ('ORG0908', 34, 'TT. 8'),
    ('ORG0909', 25, 'P. Long Biên'),
    ('ORG0910', 32, 'Q. Hải Châu'),
    ('ORG0911', 26, 'X. Hồng Bàng'),
    ('ORG0912', 26, 'P. Long Bình'),
    ('ORG0913', 22, 'TT. 10'),
    ('ORG0914', 33, 'X. 12'),
    ('ORG0915', 18, 'Q. Gò Vấp'),
    ('ORG0916', 23, 'TT. 9'),
    ('ORG0917', 6, 'Q. Hải Châu'),
    ('ORG0918', 1, 'Q. 12'),
    ('ORG0919', 19, 'Q. Đống Đa'),
    ('ORG0920', 27, 'P. Long Bình'),
    ('ORG0921', 4, 'X. 10'),
    ('ORG0922', 20, 'TT. Long Biên'),
    ('ORG0923', 22, 'P. Hoàng Mai'),
    ('ORG0924', 9, 'Q. 3'),
    ('ORG0925', 23, 'P. 10'),
    ('ORG0926', 34, 'X. Gò Vấp'),
    ('ORG0927', 3, 'TT. 15'),
    ('ORG0928', 14, 'X. Vĩnh Hải'),
    ('ORG0929', 22, 'X. 5'),
    ('ORG0930', 17, 'P. Ninh Kiều'),
    ('ORG0931', 5, 'X. Đống Đa'),
    ('ORG0932', 2, 'TT. 15'),
    ('ORG0933', 3, 'Q. Hoàng Mai'),
    ('ORG0934', 18, 'P. Gò Vấp'),
    ('ORG0935', 23, 'Q. 5'),
    ('ORG0936', 10, 'Q. 3'),
    ('ORG0937', 14, 'P. Thủ Đức'),
    ('ORG0938', 6, 'X. Bình Thạnh'),
    ('ORG0939', 28, 'Q. Bình Thạnh'),
    ('ORG0940', 19, 'P. Thủ Đức'),
    ('ORG0941', 3, NULL),
    ('ORG0942', 13, 'Q. Ninh Kiều'),
    ('ORG0943', 13, 'P. 8'),
    ('ORG0944', 22, 'P. Gò Vấp'),
    ('ORG0945', 14, 'TT. Hoàng Mai'),
    ('ORG0946', 15, 'Q. 6'),
    ('ORG0947', 7, 'Q. 6'),
    ('ORG0948', 2, 'Q. Hồng Bàng'),
    ('ORG0949', 26, 'Q. 4'),
    ('ORG0950', 27, 'P. Long Bình')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_locations (organization_id, province_id, ward_name, location_precision)
SELECT m.id, v.province_id, v.ward_name, 'province_centroid' FROM (VALUES
    ('ORG0951', 15, 'X. Tân Bình'),
    ('ORG0952', 6, 'P. 15'),
    ('ORG0953', 20, 'Q. Bến Nghé'),
    ('ORG0954', 9, 'P. 3'),
    ('ORG0955', 32, 'P. 9'),
    ('ORG0956', 8, 'P. Cầu Giấy'),
    ('ORG0957', 5, 'TT. 3'),
    ('ORG0958', 14, 'X. Hoàng Mai'),
    ('ORG0959', 3, 'TT. 9'),
    ('ORG0960', 10, 'Q. Long Biên'),
    ('ORG0961', 23, 'X. Tân Bình'),
    ('ORG0962', 2, 'P. 4'),
    ('ORG0963', 33, 'Q. An Khánh'),
    ('ORG0964', 18, 'P. 12'),
    ('ORG0965', 24, 'P. Cầu Giấy'),
    ('ORG0966', 18, 'TT. 15'),
    ('ORG0967', 26, 'X. 2'),
    ('ORG0968', 15, 'X. 5'),
    ('ORG0969', 6, 'Q. Đống Đa'),
    ('ORG0970', 10, NULL),
    ('ORG0971', 25, 'X. Hồng Bàng'),
    ('ORG0972', 30, 'P. Thủ Đức'),
    ('ORG0973', 12, 'TT. Cầu Giấy'),
    ('ORG0974', 25, 'TT. 5'),
    ('ORG0975', 30, 'Q. 3'),
    ('ORG0976', 5, 'X. Tân Bình'),
    ('ORG0977', 16, 'X. 6'),
    ('ORG0978', 27, 'X. 15'),
    ('ORG0979', 28, 'X. An Khánh'),
    ('ORG0980', 29, 'Q. 9'),
    ('ORG0981', 5, 'Q. An Khánh'),
    ('ORG0982', 32, 'P. 7'),
    ('ORG0983', 24, NULL),
    ('ORG0984', 5, 'P. Gò Vấp'),
    ('ORG0985', 25, 'P. Vĩnh Hải'),
    ('ORG0986', 6, 'TT. 12'),
    ('ORG0987', 28, 'Q. 2'),
    ('ORG0988', 1, 'Q. An Khánh'),
    ('ORG0989', 1, 'TT. 12'),
    ('ORG0990', 21, 'TT. 5'),
    ('ORG0991', 28, 'TT. Đống Đa'),
    ('ORG0992', 25, 'X. Tân Bình'),
    ('ORG0993', 6, 'X. Bến Nghé'),
    ('ORG0994', 33, 'Q. Ninh Kiều'),
    ('ORG0995', 10, 'Q. Thủ Đức'),
    ('ORG0996', 6, 'X. Gò Vấp'),
    ('ORG0997', 34, 'Q. Cầu Giấy'),
    ('ORG0998', 28, 'TT. Hồng Bàng'),
    ('ORG0999', 14, 'Q. An Khánh'),
    ('ORG1000', 32, 'P. 1')
) AS v(ext_code, province_id, ward_name)
JOIN org_id_map m ON m.external_code = v.ext_code
ON CONFLICT (organization_id) DO NOTHING;

-- organization_industry_sectors (primary + others)
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0001'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0001'), 11, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0002'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0002'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0002'), 9, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0003'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0003'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0003'), 9, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0004'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0005'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0005'), 11, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0005'), 18, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0006'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0006'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0006'), 22, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0007'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0008'), 12, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0008'), 22, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0009'), 18, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0010'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0011'), 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0012'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0013'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0013'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0014'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0015'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0015'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0016'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0016'), 11, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0017'), 12, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0017'), 15, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0018'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0018'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0018'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0018'), 11, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0019'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0019'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0019'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0020'), 18, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0021'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0021'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0022'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0022'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0023'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0023'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0023'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0023'), 9, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0024'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0024'), 22, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0025'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0025'), 20, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0025'), 10, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0026'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0026'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0027'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0027'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0028'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0029'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0029'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0030'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0030'), 22, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0031'), 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0032'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0032'), 10, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0033'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0034'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0035'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0035'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0036'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0036'), 9, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0036'), 11, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0037'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0037'), 11, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0037'), 13, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0038'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0038'), 19, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0038'), 10, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0038'), 14, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0039'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0040'), 11, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0041'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0041'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0041'), 9, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0041'), 17, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0042'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0042'), 15, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0043'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0043'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0043'), 12, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0043'), 9, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0044'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0045'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0046'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0046'), 15, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0046'), 11, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0047'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0047'), 15, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0047'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0048'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0049'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0049'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0050'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0051'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0051'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0052'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0053'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0053'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0054'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0055'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0055'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0056'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0056'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0057'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0058'), 21, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0059'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0060'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0060'), 22, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0061'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0061'), 12, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0061'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0062'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0062'), 18, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0062'), 14, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0062'), 19, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0063'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0064'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0064'), 13, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0065'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0065'), 13, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0066'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0066'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0067'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0068'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0068'), 19, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0069'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0069'), 17, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0070'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0070'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0071'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0072'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0072'), 19, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0073'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0074'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0074'), 17, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0075'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0076'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0077'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0077'), 17, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0078'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0078'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0078'), 10, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0079'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0079'), 14, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0079'), 15, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0080'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0081'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0081'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0082'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0083'), 21, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0084'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0084'), 16, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0085'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0086'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0086'), 15, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0087'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0087'), 11, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0087'), 10, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0088'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0088'), 11, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0088'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0089'), 18, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0090'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0090'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0091'), 12, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0091'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0092'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0092'), 19, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0093'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0093'), 13, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0094'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0095'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0095'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0096'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0097'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0098'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0098'), 19, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0099'), 11, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0100'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0100'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0100'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0101'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0102'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0102'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0103'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0103'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0103'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0103'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0104'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0104'), 13, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0104'), 19, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0105'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0105'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0105'), 20, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0106'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0106'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0107'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0108'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0108'), 22, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0109'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0110'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0110'), 20, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0110'), 13, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0111'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0111'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0111'), 14, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0111'), 20, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0112'), 21, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0113'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0113'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0114'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0115'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0116'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0116'), 17, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0117'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0117'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0117'), 10, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0117'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0118'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0119'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0119'), 12, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0119'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0120'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0121'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0122'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0122'), 13, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0122'), 17, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0123'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0123'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0123'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0124'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0125'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0126'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0126'), 21, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0127'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0128'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0129'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0130'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0131'), 18, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0132'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0133'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0134'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0134'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0135'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0136'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0137'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0137'), 21, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0138'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0138'), 9, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0138'), 14, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0138'), 13, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0139'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0139'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0140'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0141'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0141'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0142'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0143'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0144'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0145'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0145'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0146'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0146'), 21, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0146'), 10, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0147'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0147'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0147'), 20, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0147'), 16, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0148'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0149'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0149'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0150'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0151'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0151'), 20, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0152'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0153'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0153'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0154'), 12, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0154'), 10, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0155'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0155'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0155'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0155'), 13, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0156'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0156'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0157'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0158'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0158'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0159'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0159'), 20, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0159'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0160'), 21, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0161'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0161'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0162'), 11, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0163'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0163'), 18, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0163'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0164'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0165'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0166'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0167'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0167'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0168'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0168'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0169'), 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0170'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0171'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0171'), 11, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0172'), 12, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0172'), 16, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0173'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0173'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0174'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0174'), 20, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0174'), 16, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0174'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0175'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0175'), 11, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0176'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0176'), 19, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0177'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0178'), 12, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0179'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0179'), 20, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0180'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0181'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0181'), 20, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0182'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0182'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0182'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0183'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0183'), 20, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0184'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0184'), 16, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0184'), 10, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0184'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0185'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0185'), 10, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0186'), 18, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0187'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0188'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0188'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0189'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0190'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0191'), 11, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0192'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0192'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0192'), 20, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0193'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0194'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0194'), 21, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0194'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0194'), 17, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0195'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0195'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0195'), 20, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0196'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0196'), 14, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0196'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0197'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0197'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0198'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0198'), 15, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0199'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0200'), 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0201'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0201'), 20, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0202'), 12, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0202'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0202'), 19, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0203'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0203'), 18, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0204'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0205'), 21, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0206'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0206'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0207'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0207'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0208'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0208'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0209'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0209'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0209'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0210'), 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0211'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0212'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0212'), 22, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0213'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0213'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0214'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0214'), 19, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0215'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0215'), 11, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0216'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0217'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0217'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0218'), 18, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0219'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0219'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0220'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0220'), 18, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0221'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0221'), 20, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0222'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0222'), 15, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0223'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0223'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0224'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0225'), 12, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0225'), 20, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0225'), 13, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0225'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0226'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0226'), 16, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0227'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0227'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0228'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0228'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0229'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0230'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0231'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0232'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0233'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0233'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0234'), 12, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0235'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0236'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0236'), 20, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0237'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0238'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0238'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0239'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0239'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0240'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0240'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0241'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0242'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0242'), 18, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0243'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0243'), 16, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0244'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0244'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0245'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0245'), 12, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0245'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0245'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0246'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0247'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0247'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0247'), 11, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0247'), 15, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0248'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0248'), 10, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0248'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0249'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0249'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0250'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0250'), 16, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0251'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0252'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0253'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0253'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0254'), 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0255'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0256'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0256'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0257'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0257'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0257'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0258'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0258'), 9, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0258'), 19, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0259'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0259'), 18, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0260'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0260'), 15, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0260'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0260'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0261'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0262'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0262'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0263'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0263'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0263'), 14, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0263'), 16, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0264'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0265'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0266'), 11, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0267'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0267'), 10, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0268'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0268'), 14, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0268'), 20, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0269'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0270'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0270'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0271'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0272'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0272'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0273'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0273'), 10, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0273'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0274'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0275'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0275'), 22, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0275'), 21, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0275'), 9, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0276'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0277'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0277'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0278'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0279'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0280'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0280'), 10, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0281'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0281'), 16, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0282'), 18, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0283'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0283'), 9, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0283'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0283'), 17, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0284'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0284'), 13, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0284'), 9, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0285'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0286'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0287'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0287'), 14, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0287'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0288'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0288'), 22, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0289'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0289'), 11, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0290'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0291'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0291'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0292'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0293'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0294'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0294'), 10, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0294'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0295'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0295'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0295'), 16, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0296'), 12, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0297'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0297'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0298'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0298'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0298'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0299'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0299'), 22, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0300'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0301'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0302'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0302'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0302'), 10, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0302'), 19, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0303'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0303'), 16, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0303'), 9, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0303'), 21, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0304'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0305'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0306'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0306'), 21, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0306'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0306'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0307'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0307'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0307'), 18, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0308'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0309'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0309'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0310'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0310'), 11, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0311'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0311'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0311'), 18, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0311'), 9, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0312'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0312'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0313'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0313'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0313'), 16, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0314'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0315'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0316'), 21, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0317'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0318'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0318'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0319'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0320'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0320'), 18, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0321'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0321'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0322'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0322'), 17, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0323'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0323'), 17, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0324'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0325'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0325'), 19, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0325'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0325'), 13, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0326'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0326'), 17, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0327'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0328'), 12, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0329'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0329'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0330'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0330'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0331'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0332'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0332'), 18, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0332'), 12, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0333'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0334'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0335'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0335'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0336'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0336'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0337'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0338'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0339'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0339'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0340'), 11, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0341'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0341'), 11, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0341'), 16, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0342'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0342'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0343'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0344'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0345'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0346'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0347'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0347'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0348'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0349'), 12, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0349'), 20, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0350'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0350'), 22, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0351'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0351'), 18, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0351'), 11, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0351'), 19, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0352'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0352'), 13, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0352'), 15, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0352'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0353'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0354'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0355'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0355'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0356'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0356'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0357'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0357'), 18, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0357'), 21, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0357'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0358'), 18, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0359'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0359'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0359'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0359'), 9, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0360'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0361'), 12, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0362'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0363'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0364'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0364'), 19, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0365'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0365'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0365'), 19, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0365'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0366'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0366'), 13, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0367'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0368'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0368'), 9, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0368'), 10, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0369'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0370'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0371'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0371'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0372'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0373'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0373'), 12, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0373'), 9, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0373'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0374'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0374'), 22, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0375'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0375'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0376'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0376'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0376'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0377'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0378'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0378'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0379'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0380'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0380'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0380'), 12, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0380'), 15, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0381'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0382'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0383'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0384'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0384'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0384'), 13, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0385'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0385'), 14, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0385'), 9, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0385'), 21, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0386'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0386'), 20, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0386'), 14, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0386'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0387'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0387'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0387'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0387'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0388'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0388'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0389'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0389'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0389'), 9, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0390'), 12, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0391'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0391'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0392'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0393'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0393'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0394'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0394'), 13, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0394'), 17, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0394'), 19, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0395'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0395'), 22, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0396'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0396'), 15, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0397'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0398'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0398'), 15, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0399'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0399'), 20, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0399'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0400'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0400'), 21, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0400'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0401'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0402'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0402'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0403'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0403'), 18, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0404'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0404'), 18, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0405'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0405'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0405'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0405'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0406'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0406'), 21, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0407'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0408'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0408'), 11, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0408'), 12, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0409'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0410'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0410'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0411'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0412'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0413'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0413'), 15, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0414'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0414'), 22, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0414'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0415'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0415'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0416'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0416'), 15, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0417'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0418'), 12, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0419'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0419'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0419'), 12, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0419'), 9, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0420'), 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0421'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0421'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0421'), 12, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0422'), 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0423'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0423'), 12, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0423'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0424'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0425'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0425'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0426'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0426'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0426'), 17, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0426'), 13, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0427'), 12, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0427'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0428'), 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0429'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0429'), 17, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0430'), 12, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0430'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0431'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0431'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0432'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0433'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0433'), 11, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0434'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0434'), 18, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0435'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0436'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0437'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0438'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0438'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0439'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0440'), 18, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0441'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0441'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0442'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0442'), 16, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0443'), 21, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0444'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0445'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0446'), 12, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0446'), 19, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0447'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0448'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0449'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0449'), 11, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0450'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0450'), 21, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0451'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0451'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0452'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0452'), 12, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0452'), 18, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0452'), 9, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0453'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0453'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0454'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0455'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0455'), 13, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0456'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0456'), 18, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0457'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0457'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0457'), 13, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0458'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0459'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0460'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0460'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0461'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0462'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0462'), 22, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0463'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0464'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0465'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0465'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0466'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0466'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0466'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0467'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0467'), 15, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0467'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0467'), 21, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0468'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0468'), 13, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0468'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0469'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0470'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0470'), 12, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0470'), 15, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0471'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0471'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0472'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0473'), 21, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0474'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0474'), 21, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0475'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0475'), 10, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0475'), 12, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0475'), 13, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0476'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0476'), 15, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0477'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0478'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0478'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0478'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0478'), 14, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0479'), 12, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0479'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0479'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0480'), 11, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0481'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0481'), 10, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0482'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0483'), 12, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0483'), 19, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0484'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0484'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0485'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0485'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0485'), 15, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0486'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0487'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0488'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0488'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0489'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0489'), 20, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0490'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0491'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0491'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0491'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0491'), 15, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0492'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0492'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0493'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0494'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0495'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0495'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0495'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0496'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0497'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0497'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0498'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0499'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0499'), 10, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0500'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0501'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0502'), 11, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0503'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0503'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0504'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0505'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0505'), 22, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0505'), 15, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0506'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0507'), 21, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0508'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0508'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0509'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0510'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0511'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0512'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0512'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0512'), 11, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0513'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0514'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0515'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0515'), 22, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0516'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0516'), 13, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0517'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0518'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0518'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0519'), 21, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0520'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0520'), 15, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0520'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0521'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0521'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0522'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0523'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0523'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0523'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0523'), 11, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0524'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0524'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0525'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0525'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0526'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0526'), 13, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0527'), 12, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0528'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0528'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0528'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0528'), 13, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0529'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0529'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0530'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0530'), 13, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0531'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0532'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0532'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0532'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0533'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0533'), 13, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0533'), 21, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0534'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0534'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0534'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0534'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0535'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0535'), 12, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0535'), 10, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0535'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0536'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0536'), 15, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0537'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0537'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0538'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0538'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0538'), 21, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0539'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0539'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0539'), 16, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0540'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0541'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0542'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0543'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0544'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0544'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0544'), 13, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0545'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0545'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0546'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0546'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0546'), 9, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0547'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0547'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0548'), 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0549'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0549'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0550'), 21, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0551'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0551'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0552'), 21, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0553'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0553'), 20, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0554'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0555'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0555'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0555'), 10, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0556'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0556'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0557'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0557'), 15, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0558'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0558'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0558'), 19, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0559'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0559'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0559'), 18, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0560'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0560'), 15, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0561'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0562'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0562'), 13, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0563'), 21, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0564'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0564'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0564'), 10, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0565'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0566'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0567'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0568'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0568'), 22, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0569'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0570'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0571'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0571'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0572'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0572'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0573'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0573'), 9, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0573'), 16, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0574'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0574'), 10, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0574'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0575'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0575'), 13, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0575'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0575'), 19, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0576'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0576'), 15, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0576'), 16, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0577'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0578'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0579'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0580'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0580'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0581'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0581'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0582'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0583'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0583'), 16, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0584'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0585'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0585'), 19, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0586'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0586'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0587'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0587'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0588'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0588'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0589'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0589'), 17, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0590'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0590'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0591'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0592'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0593'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0594'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0594'), 11, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0594'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0595'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0595'), 21, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0596'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0596'), 19, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0597'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0597'), 14, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0597'), 19, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0597'), 12, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0598'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0598'), 10, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0598'), 21, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0599'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0600'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0600'), 16, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0601'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0601'), 19, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0602'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0603'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0603'), 11, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0603'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0603'), 14, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0604'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0604'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0605'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0605'), 15, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0605'), 20, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0605'), 11, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0606'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0606'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0607'), 12, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0608'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0608'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0608'), 18, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0609'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0609'), 10, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0610'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0610'), 20, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0610'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0611'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0612'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0612'), 21, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0612'), 19, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0613'), 12, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0614'), 12, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0614'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0614'), 14, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0614'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0615'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0616'), 18, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0617'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0618'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0618'), 16, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0619'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0620'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0620'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0621'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0621'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0621'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0622'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0622'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0622'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0623'), 12, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0623'), 14, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0623'), 10, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0624'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0624'), 13, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0625'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0626'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0626'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0626'), 22, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0627'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0627'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0628'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0628'), 15, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0628'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0629'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0629'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0630'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0630'), 10, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0630'), 12, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0631'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0631'), 19, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0632'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0632'), 20, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0632'), 21, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0633'), 21, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0634'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0634'), 20, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0635'), 11, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0636'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0636'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0636'), 17, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0637'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0637'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0638'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0638'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0638'), 21, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0639'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0639'), 11, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0639'), 12, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0639'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0640'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0641'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0641'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0642'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0642'), 19, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0642'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0643'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0643'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0643'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0644'), 18, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0645'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0646'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0647'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0647'), 22, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0648'), 12, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0649'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0649'), 17, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0650'), 12, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0650'), 10, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0650'), 9, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0651'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0651'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0651'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0652'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0652'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0653'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0653'), 16, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0654'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0654'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0654'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0654'), 22, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0655'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0655'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0656'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0657'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0657'), 14, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0657'), 18, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0658'), 11, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0659'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0659'), 15, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0659'), 12, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0659'), 20, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0660'), 11, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0661'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0661'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0662'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0662'), 13, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0663'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0663'), 22, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0663'), 20, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0664'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0665'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0666'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0667'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0667'), 13, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0668'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0668'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0669'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0670'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0670'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0671'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0671'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0672'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0672'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0672'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0673'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0673'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0674'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0674'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0675'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0675'), 15, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0676'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0676'), 21, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0677'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0678'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0678'), 13, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0678'), 16, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0678'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0679'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0679'), 9, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0679'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0680'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0681'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0681'), 15, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0681'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0681'), 9, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0682'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0683'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0684'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0684'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0684'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0685'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0685'), 21, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0686'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0686'), 16, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0687'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0687'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0688'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0689'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0689'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0689'), 14, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0690'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0691'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0692'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0692'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0693'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0694'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0695'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0695'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0696'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0696'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0697'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0698'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0698'), 19, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0698'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0698'), 20, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0699'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0700'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0701'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0702'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0702'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0703'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0703'), 18, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0703'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0704'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0705'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0705'), 11, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0706'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0707'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0708'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0708'), 19, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0708'), 12, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0708'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0709'), 11, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0710'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0710'), 20, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0711'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0712'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0712'), 19, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0712'), 14, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0713'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0714'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0715'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0715'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0716'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0716'), 20, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0717'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0717'), 10, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0717'), 21, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0717'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0718'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0719'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0719'), 18, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0719'), 9, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0719'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0720'), 11, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0721'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0722'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0723'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0724'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0725'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0725'), 9, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0725'), 12, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0726'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0726'), 18, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0726'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0726'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0727'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0728'), 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0729'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0730'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0730'), 10, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0731'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0732'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0732'), 13, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0733'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0734'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0734'), 18, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0735'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0736'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0736'), 10, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0736'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0737'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0738'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0738'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0739'), 11, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0740'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0740'), 19, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0741'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0742'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0743'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0743'), 20, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0744'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0745'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0745'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0745'), 13, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0746'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0747'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0747'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0748'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0748'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0749'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0750'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0750'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0750'), 14, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0751'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0751'), 20, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0751'), 15, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0751'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0752'), 12, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0753'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0753'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0754'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0755'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0755'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0756'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0756'), 10, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0756'), 13, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0756'), 19, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0757'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0758'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0758'), 22, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0758'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0759'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0760'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0760'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0760'), 17, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0761'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0761'), 16, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0762'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0762'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0762'), 14, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0762'), 13, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0763'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0764'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0764'), 16, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0764'), 10, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0765'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0766'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0767'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0768'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0768'), 14, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0768'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0768'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0769'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0770'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0770'), 15, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0771'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0772'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0773'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0773'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0774'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0774'), 10, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0774'), 9, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0775'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0775'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0776'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0776'), 18, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0777'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0778'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0778'), 13, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0779'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0779'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0780'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0781'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0782'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0783'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0784'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0785'), 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0786'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0786'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0787'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0787'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0788'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0788'), 11, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0789'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0790'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0790'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0790'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0791'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0792'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0792'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0793'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0793'), 12, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0793'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0793'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0794'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0795'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0795'), 18, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0795'), 11, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0796'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0796'), 12, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0796'), 20, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0796'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0797'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0797'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0797'), 12, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0797'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0798'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0798'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0799'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0799'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0799'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0800'), 12, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0800'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0800'), 22, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0800'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0801'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0801'), 21, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0802'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0802'), 18, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0803'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0804'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0805'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0806'), 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0807'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0808'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0809'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0809'), 21, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0810'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0811'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0812'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0813'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0813'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0814'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0815'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0815'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0815'), 18, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0815'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0816'), 12, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0817'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0818'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0818'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0818'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0818'), 11, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0819'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0819'), 21, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0819'), 22, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0819'), 10, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0820'), 18, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0821'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0821'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0822'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0823'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0824'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0825'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0825'), 10, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0826'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0827'), 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0828'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0828'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0828'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0829'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0830'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0830'), 14, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0830'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0831'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0831'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0832'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0832'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0833'), 21, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0834'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0835'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0835'), 18, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0835'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0836'), 12, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0837'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0837'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0838'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0838'), 16, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0838'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0839'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0840'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0840'), 10, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0841'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0841'), 18, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0841'), 22, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0842'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0842'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0843'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0843'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0844'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0844'), 15, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0844'), 20, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0844'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0845'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0845'), 16, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0845'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0845'), 11, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0846'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0846'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0846'), 14, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0846'), 12, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0847'), 18, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0848'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0848'), 18, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0849'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0850'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0850'), 11, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0850'), 12, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0850'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0851'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0851'), 10, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0851'), 22, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0852'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0853'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0853'), 21, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0854'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0855'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0855'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0855'), 22, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0856'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0856'), 17, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0857'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0857'), 13, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0858'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0859'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0859'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0860'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0861'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0861'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0861'), 15, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0861'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0862'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0862'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0863'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0863'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0863'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0864'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0864'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0864'), 21, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0864'), 12, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0865'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0865'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0866'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0866'), 21, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0866'), 20, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0867'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0867'), 9, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0867'), 22, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0868'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0868'), 16, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0868'), 18, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0869'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0869'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0870'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0870'), 19, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0871'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0871'), 11, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0871'), 10, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0872'), 18, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0872'), 17, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0873'), 11, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0874'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0874'), 11, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0874'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0875'), 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0876'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0876'), 10, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0877'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0877'), 10, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0877'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0877'), 14, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0878'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0878'), 20, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0878'), 16, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0879'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0879'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0879'), 21, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0879'), 18, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0880'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0880'), 12, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0881'), 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0882'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0882'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0883'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0883'), 19, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0883'), 21, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0883'), 14, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0884'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0884'), 22, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0884'), 10, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0884'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0885'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0885'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0885'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0886'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0886'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0887'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0888'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0889'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0889'), 19, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0890'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0890'), 16, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0891'), 18, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0892'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0893'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0894'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0895'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0895'), 22, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0896'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0896'), 22, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0896'), 20, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0897'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0897'), 21, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0897'), 12, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0898'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0899'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0900'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0900'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0900'), 19, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0901'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0901'), 16, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0901'), 22, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0901'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0902'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0902'), 12, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0902'), 9, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0902'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0903'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0903'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0904'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0905'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0905'), 18, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0906'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0906'), 10, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0907'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0907'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0907'), 11, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0907'), 20, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0908'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0908'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0909'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0910'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0910'), 10, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0910'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0910'), 13, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0911'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0911'), 15, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0912'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0912'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0912'), 10, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0912'), 17, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0913'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0913'), 20, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0913'), 21, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0914'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0914'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0915'), 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0916'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0916'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0917'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0917'), 21, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0918'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0918'), 14, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0919'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0919'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0920'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0920'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0920'), 16, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0921'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0921'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0921'), 15, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0922'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0923'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0923'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0923'), 13, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0924'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0925'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0926'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0926'), 22, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0926'), 12, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0926'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0927'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0927'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0927'), 9, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0928'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0929'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0930'), 21, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0931'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0931'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0932'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0932'), 15, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0932'), 22, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0932'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0933'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0934'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0935'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0935'), 12, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0935'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0936'), 9, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0936'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0936'), 13, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0937'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0938'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0939'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0940'), 11, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0940'), 14, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0940'), 15, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0940'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0941'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0942'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0943'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0943'), 12, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0943'), 13, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0944'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0944'), 12, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0944'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0945'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0946'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0946'), 21, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0947'), 15, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0947'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0948'), 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0949'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0950'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0950'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0951'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0951'), 14, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0951'), 16, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0951'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0952'), 17, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0952'), 21, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0952'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0953'), 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0954'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0955'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0955'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0955'), 10, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0955'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0956'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0956'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0956'), 17, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0956'), 10, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0957'), 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0958'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0958'), 17, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0958'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0959'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0959'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0960'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0961'), 21, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0961'), 18, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0961'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0961'), 15, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0962'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0963'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0963'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0964'), 12, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0965'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0966'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0967'), 13, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0967'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0967'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0967'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0968'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0969'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0969'), 19, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0969'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0970'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0971'), 12, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0972'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0972'), 17, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0973'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0974'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0974'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0974'), 22, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0974'), 11, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0975'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0975'), 19, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0975'), 10, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0975'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0976'), 22, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0976'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0976'), 12, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0977'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0978'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0978'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0979'), 18, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0980'), 19, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0980'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0981'), 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0982'), 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0983'), 11, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0984'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0984'), 13, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0985'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0986'), 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0987'), 10, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0987'), 19, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0988'), 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0989'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0989'), 16, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0990'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0990'), 17, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0991'), 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0992'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0992'), 9, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0993'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0993'), 11, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0994'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0994'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0994'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0995'), 16, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0995'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0995'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0996'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0996'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0997'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0997'), 21, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0998'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0998'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0998'), 13, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0999'), 20, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0999'), 16, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_industry_sectors (organization_id, industry_sector_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG1000'), 14, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG1000'), 22, 2) ON CONFLICT DO NOTHING;

-- organization_environmental_impacts
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0001'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0002'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0003'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0003'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0004'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0004'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0004'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0004'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0005'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0005'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0005'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0006'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0007'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0008'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0009'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0010'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0011'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0011'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0011'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0012'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0013'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0013'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0013'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0013'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0014'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0015'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0016'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0016'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0016'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0017'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0017'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0017'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0018'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0018'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0019'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0020'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0020'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0020'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0021'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0022'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0023'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0024'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0024'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0024'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0024'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0025'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0025'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0025'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0026'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0026'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0026'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0026'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0027'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0027'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0028'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0028'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0028'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0028'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0029'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0029'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0029'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0029'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0030'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0030'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0030'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0031'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0032'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0032'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0033'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0033'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0033'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0033'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0034'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0034'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0034'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0034'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0035'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0035'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0035'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0035'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0036'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0036'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0037'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0038'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0038'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0038'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0039'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0039'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0039'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0040'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0040'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0040'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0041'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0041'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0041'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0042'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0042'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0042'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0043'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0043'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0043'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0043'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0044'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0045'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0045'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0045'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0046'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0046'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0047'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0047'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0047'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0048'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0048'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0048'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0049'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0050'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0050'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0050'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0051'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0051'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0051'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0052'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0052'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0053'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0054'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0054'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0054'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0055'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0055'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0056'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0056'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0057'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0057'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0057'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0057'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0058'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0059'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0059'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0059'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0060'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0060'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0060'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0060'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0061'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0062'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0062'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0063'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0063'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0063'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0064'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0065'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0066'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0066'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0066'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0066'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0067'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0067'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0067'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0067'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0068'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0068'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0068'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0069'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0069'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0070'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0070'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0070'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0071'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0071'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0071'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0071'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0072'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0072'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0072'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0073'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0073'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0073'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0073'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0074'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0074'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0075'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0075'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0075'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0075'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0076'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0076'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0076'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0076'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0077'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0078'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0079'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0079'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0079'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0080'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0081'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0082'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0082'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0082'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0082'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0083'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0083'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0083'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0083'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0084'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0085'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0085'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0086'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0086'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0087'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0087'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0088'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0088'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0088'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0088'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0089'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0089'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0089'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0089'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0090'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0090'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0090'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0090'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0091'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0091'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0092'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0092'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0093'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0093'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0093'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0093'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0094'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0094'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0095'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0095'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0095'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0096'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0096'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0096'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0096'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0097'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0097'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0098'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0098'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0098'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0098'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0099'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0099'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0100'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0100'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0100'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0100'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0101'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0102'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0102'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0103'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0104'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0104'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0104'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0104'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0105'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0105'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0105'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0105'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0106'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0106'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0106'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0106'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0107'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0107'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0107'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0108'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0108'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0108'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0109'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0109'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0110'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0110'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0110'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0110'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0111'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0111'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0111'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0111'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0112'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0112'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0113'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0113'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0114'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0114'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0115'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0116'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0116'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0117'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0117'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0118'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0118'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0118'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0119'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0120'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0121'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0121'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0121'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0121'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0122'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0122'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0123'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0123'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0124'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0125'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0126'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0127'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0128'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0128'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0128'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0129'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0129'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0129'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0130'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0131'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0131'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0131'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0131'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0132'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0133'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0133'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0133'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0133'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0134'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0134'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0134'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0135'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0135'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0135'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0135'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0136'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0136'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0137'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0137'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0137'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0137'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0138'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0139'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0139'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0139'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0140'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0140'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0141'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0141'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0141'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0141'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0142'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0142'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0142'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0143'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0144'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0145'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0145'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0145'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0145'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0146'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0146'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0147'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0148'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0148'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0148'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0148'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0149'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0149'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0149'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0149'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0150'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0151'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0152'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0152'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0152'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0152'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0153'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0153'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0153'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0153'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0154'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0154'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0155'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0156'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0156'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0157'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0157'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0157'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0158'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0158'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0158'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0158'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0159'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0160'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0160'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0160'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0161'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0162'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0162'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0162'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0163'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0164'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0164'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0165'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0166'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0166'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0166'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0166'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0167'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0168'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0168'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0169'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0170'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0170'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0171'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0171'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0172'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0172'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0172'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0173'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0173'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0174'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0174'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0174'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0175'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0175'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0175'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0176'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0177'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0177'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0177'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0177'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0178'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0178'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0178'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0179'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0179'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0179'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0180'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0180'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0181'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0181'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0181'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0182'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0182'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0182'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0182'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0183'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0183'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0184'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0185'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0185'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0185'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0186'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0186'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0186'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0186'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0187'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0187'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0187'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0187'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0188'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0188'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0188'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0188'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0189'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0189'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0189'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0190'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0190'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0190'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0190'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0191'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0192'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0192'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0192'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0193'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0193'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0194'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0195'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0195'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0196'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0196'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0197'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0198'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0199'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0200'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0201'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0202'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0203'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0203'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0204'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0204'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0204'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0205'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0205'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0206'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0207'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0207'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0208'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0209'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0209'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0209'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0209'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0210'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0210'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0211'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0211'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0211'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0211'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0212'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0212'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0212'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0213'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0214'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0214'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0215'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0215'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0216'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0216'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0216'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0217'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0218'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0218'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0219'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0220'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0220'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0220'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0220'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0221'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0221'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0222'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0223'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0224'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0225'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0225'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0226'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0227'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0227'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0227'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0228'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0228'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0228'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0228'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0229'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0229'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0229'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0230'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0231'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0231'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0232'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0232'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0232'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0232'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0233'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0233'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0233'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0233'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0234'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0234'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0235'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0235'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0235'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0235'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0236'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0237'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0238'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0238'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0238'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0239'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0239'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0240'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0241'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0241'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0241'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0241'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0242'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0242'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0243'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0244'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0245'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0246'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0246'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0246'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0247'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0247'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0247'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0247'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0248'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0248'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0248'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0248'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0249'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0249'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0249'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0249'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0250'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0250'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0251'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0252'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0252'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0252'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0252'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0253'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0253'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0253'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0254'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0254'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0254'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0254'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0255'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0255'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0256'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0257'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0257'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0257'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0257'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0258'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0259'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0259'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0259'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0259'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0260'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0260'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0260'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0260'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0261'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0261'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0261'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0262'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0263'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0264'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0264'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0264'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0264'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0265'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0265'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0266'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0266'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0266'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0266'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0267'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0267'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0267'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0267'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0268'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0268'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0268'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0268'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0269'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0269'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0269'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0269'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0270'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0270'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0270'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0271'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0272'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0273'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0273'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0273'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0273'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0274'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0274'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0275'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0275'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0276'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0276'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0276'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0277'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0277'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0277'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0277'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0278'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0278'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0278'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0279'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0279'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0280'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0280'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0281'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0281'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0281'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0282'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0282'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0282'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0282'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0283'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0284'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0284'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0284'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0284'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0285'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0285'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0286'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0286'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0287'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0287'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0287'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0287'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0288'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0288'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0288'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0289'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0289'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0289'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0290'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0291'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0292'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0292'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0292'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0293'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0293'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0294'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0294'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0294'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0294'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0295'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0295'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0295'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0296'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0297'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0298'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0298'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0298'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0299'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0300'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0300'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0300'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0300'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0301'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0301'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0301'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0301'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0302'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0302'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0302'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0302'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0303'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0303'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0303'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0304'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0304'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0304'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0304'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0305'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0305'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0305'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0305'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0306'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0306'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0306'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0307'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0307'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0308'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0308'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0308'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0309'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0309'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0309'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0309'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0310'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0310'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0310'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0310'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0311'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0312'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0312'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0312'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0313'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0313'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0314'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0314'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0314'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0314'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0315'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0315'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0316'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0316'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0317'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0318'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0318'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0318'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0319'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0319'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0319'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0320'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0320'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0321'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0321'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0321'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0321'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0322'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0323'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0323'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0323'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0323'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0324'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0324'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0324'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0324'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0325'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0325'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0326'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0326'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0327'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0327'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0327'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0328'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0329'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0330'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0330'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0331'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0332'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0332'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0333'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0333'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0334'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0334'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0334'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0335'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0335'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0335'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0335'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0336'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0336'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0337'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0337'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0337'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0337'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0338'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0338'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0339'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0339'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0340'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0340'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0340'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0341'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0341'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0341'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0342'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0342'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0342'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0342'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0343'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0343'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0344'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0345'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0346'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0346'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0347'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0347'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0348'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0348'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0348'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0348'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0349'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0349'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0350'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0350'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0350'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0350'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0351'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0351'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0351'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0351'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0352'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0352'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0352'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0353'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0353'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0354'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0354'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0354'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0355'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0355'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0356'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0357'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0357'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0357'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0358'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0359'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0359'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0360'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0360'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0360'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0361'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0361'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0361'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0361'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0362'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0362'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0363'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0364'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0365'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0365'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0365'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0366'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0367'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0367'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0367'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0368'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0369'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0370'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0371'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0371'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0372'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0372'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0372'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0372'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0373'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0373'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0373'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0374'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0374'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0374'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0374'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0375'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0376'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0377'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0378'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0378'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0379'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0379'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0379'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0380'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0380'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0380'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0381'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0381'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0381'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0382'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0382'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0382'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0383'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0383'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0383'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0384'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0385'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0385'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0385'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0385'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0386'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0386'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0387'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0387'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0388'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0388'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0388'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0388'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0389'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0390'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0390'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0390'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0390'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0391'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0391'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0392'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0392'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0392'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0392'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0393'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0394'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0395'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0396'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0396'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0396'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0397'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0397'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0398'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0399'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0400'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0400'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0400'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0400'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0401'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0402'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0402'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0402'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0403'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0403'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0403'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0404'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0404'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0405'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0406'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0406'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0406'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0407'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0408'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0408'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0408'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0408'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0409'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0409'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0409'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0410'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0410'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0410'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0411'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0412'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0412'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0412'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0413'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0413'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0413'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0414'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0414'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0414'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0414'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0415'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0416'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0416'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0416'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0417'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0418'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0418'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0418'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0419'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0420'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0420'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0421'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0421'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0421'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0421'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0422'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0422'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0422'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0423'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0423'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0424'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0425'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0425'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0426'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0427'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0427'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0428'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0429'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0429'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0429'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0430'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0430'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0430'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0431'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0431'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0432'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0433'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0433'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0434'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0435'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0436'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0437'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0437'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0437'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0438'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0438'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0438'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0439'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0440'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0441'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0441'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0441'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0442'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0442'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0443'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0443'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0443'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0444'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0445'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0445'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0445'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0445'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0446'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0446'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0447'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0448'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0448'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0448'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0448'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0449'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0449'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0449'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0450'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0450'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0451'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0452'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0452'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0452'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0453'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0453'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0454'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0454'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0454'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0454'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0455'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0456'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0457'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0457'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0457'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0457'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0458'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0458'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0459'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0459'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0459'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0459'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0460'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0460'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0460'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0461'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0461'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0461'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0461'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0462'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0463'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0463'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0464'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0465'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0466'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0467'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0468'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0468'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0468'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0468'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0469'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0470'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0470'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0471'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0471'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0471'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0471'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0472'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0472'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0472'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0472'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0473'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0474'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0474'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0474'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0474'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0475'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0475'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0475'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0475'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0476'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0477'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0477'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0477'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0477'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0478'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0478'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0479'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0479'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0480'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0480'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0480'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0481'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0481'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0482'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0483'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0484'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0484'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0485'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0485'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0485'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0486'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0486'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0486'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0486'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0487'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0487'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0487'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0487'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0488'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0488'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0488'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0489'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0489'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0490'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0490'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0490'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0490'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0491'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0491'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0491'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0492'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0493'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0494'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0494'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0495'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0495'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0496'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0497'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0498'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0498'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0498'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0499'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0499'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0500'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0500'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0500'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0501'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0501'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0502'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0502'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0502'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0502'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0503'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0503'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0504'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0504'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0505'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0505'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0506'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0507'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0507'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0507'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0507'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0508'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0508'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0508'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0508'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0509'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0509'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0509'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0509'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0510'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0510'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0510'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0511'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0511'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0511'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0511'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0512'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0513'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0513'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0514'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0514'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0514'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0515'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0515'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0515'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0515'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0516'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0516'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0516'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0517'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0517'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0517'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0517'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0518'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0519'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0519'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0520'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0520'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0520'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0521'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0521'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0521'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0521'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0522'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0522'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0523'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0524'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0524'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0524'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0525'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0525'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0526'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0527'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0527'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0528'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0529'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0529'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0529'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0530'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0530'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0530'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0530'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0531'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0531'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0531'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0531'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0532'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0532'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0533'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0533'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0534'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0535'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0535'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0535'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0535'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0536'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0537'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0537'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0537'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0538'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0538'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0539'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0539'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0539'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0539'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0540'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0541'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0541'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0541'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0541'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0542'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0542'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0543'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0543'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0544'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0544'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0544'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0545'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0545'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0545'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0546'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0546'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0547'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0547'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0548'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0548'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0549'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0550'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0551'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0551'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0551'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0551'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0552'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0552'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0553'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0553'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0553'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0554'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0554'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0554'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0555'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0556'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0556'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0557'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0558'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0558'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0558'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0559'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0559'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0560'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0561'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0562'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0563'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0564'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0564'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0565'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0565'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0565'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0565'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0566'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0567'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0568'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0568'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0568'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0568'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0569'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0570'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0571'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0572'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0572'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0572'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0573'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0573'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0573'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0573'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0574'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0575'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0575'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0576'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0576'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0576'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0576'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0577'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0577'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0577'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0577'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0578'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0578'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0578'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0578'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0579'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0579'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0580'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0580'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0580'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0580'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0581'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0581'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0582'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0583'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0583'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0584'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0584'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0584'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0584'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0585'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0585'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0585'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0585'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0586'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0586'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0587'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0587'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0588'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0588'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0589'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0589'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0589'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0590'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0590'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0591'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0592'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0592'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0593'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0593'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0593'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0594'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0594'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0594'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0595'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0595'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0595'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0596'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0597'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0597'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0597'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0598'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0598'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0599'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0600'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0600'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0600'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0600'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0601'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0602'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0603'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0604'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0605'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0605'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0605'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0606'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0607'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0607'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0607'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0607'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0608'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0608'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0608'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0609'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0609'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0609'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0610'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0610'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0610'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0611'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0612'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0612'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0613'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0614'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0615'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0615'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0615'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0615'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0616'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0616'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0617'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0617'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0618'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0619'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0619'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0619'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0619'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0620'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0620'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0621'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0621'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0621'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0621'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0622'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0622'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0623'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0624'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0624'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0624'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0625'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0625'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0626'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0627'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0627'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0627'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0627'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0628'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0629'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0629'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0629'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0630'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0630'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0631'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0631'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0631'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0631'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0632'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0632'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0632'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0632'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0633'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0633'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0633'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0634'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0634'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0635'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0635'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0636'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0636'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0636'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0637'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0637'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0637'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0638'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0638'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0639'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0639'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0640'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0640'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0640'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0641'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0642'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0642'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0642'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0642'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0643'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0643'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0644'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0645'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0645'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0645'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0646'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0647'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0648'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0648'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0648'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0648'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0649'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0649'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0649'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0650'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0650'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0650'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0650'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0651'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0651'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0651'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0652'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0652'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0652'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0653'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0653'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0653'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0653'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0654'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0655'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0655'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0656'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0656'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0657'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0657'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0657'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0657'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0658'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0658'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0659'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0659'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0660'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0660'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0660'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0660'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0661'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0662'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0662'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0662'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0662'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0663'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0663'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0664'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0665'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0665'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0665'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0665'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0666'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0666'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0667'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0667'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0668'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0669'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0669'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0670'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0670'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0671'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0672'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0672'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0672'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0673'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0673'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0673'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0673'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0674'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0674'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0674'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0674'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0675'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0675'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0675'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0675'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0676'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0676'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0676'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0676'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0677'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0678'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0678'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0678'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0679'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0679'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0680'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0680'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0681'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0681'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0681'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0681'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0682'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0682'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0683'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0684'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0684'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0684'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0684'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0685'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0685'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0685'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0685'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0686'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0686'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0687'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0687'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0688'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0688'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0688'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0689'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0689'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0689'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0690'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0690'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0690'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0690'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0691'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0691'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0691'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0691'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0692'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0692'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0692'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0692'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0693'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0693'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0693'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0693'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0694'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0694'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0694'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0695'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0695'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0695'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0695'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0696'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0697'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0697'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0697'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0698'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0698'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0698'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0698'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0699'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0700'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0700'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0700'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0701'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0702'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0703'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0703'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0703'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0703'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0704'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0705'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0706'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0706'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0706'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0707'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0707'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0707'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0707'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0708'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0709'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0710'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0710'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0711'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0712'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0713'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0713'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0713'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0713'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0714'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0715'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0715'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0715'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0716'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0716'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0717'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0718'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0718'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0718'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0719'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0719'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0719'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0719'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0720'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0721'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0722'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0722'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0722'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0722'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0723'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0723'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0723'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0723'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0724'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0725'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0725'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0726'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0726'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0726'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0727'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0728'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0729'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0729'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0729'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0730'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0730'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0730'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0730'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0731'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0731'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0731'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0731'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0732'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0732'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0732'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0733'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0733'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0733'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0734'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0734'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0734'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0735'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0735'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0735'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0736'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0737'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0738'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0738'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0738'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0738'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0739'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0739'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0740'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0740'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0741'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0741'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0742'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0742'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0742'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0742'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0743'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0743'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0743'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0744'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0745'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0745'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0745'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0746'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0746'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0746'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0747'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0748'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0748'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0749'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0749'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0749'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0750'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0750'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0750'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0751'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0752'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0752'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0753'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0753'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0754'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0754'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0754'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0754'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0755'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0756'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0756'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0756'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0756'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0757'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0757'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0757'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0758'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0759'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0759'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0759'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0759'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0760'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0760'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0760'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0760'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0761'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0761'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0762'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0763'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0763'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0764'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0765'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0765'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0766'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0766'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0766'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0767'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0767'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0767'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0768'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0769'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0770'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0771'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0771'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0771'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0771'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0772'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0772'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0772'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0772'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0773'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0773'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0773'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0774'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0775'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0775'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0776'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0776'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0777'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0778'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0779'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0780'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0780'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0780'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0781'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0782'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0783'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0783'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0784'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0785'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0785'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0785'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0785'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0786'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0786'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0786'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0786'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0787'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0788'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0788'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0789'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0789'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0790'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0790'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0791'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0792'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0792'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0792'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0792'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0793'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0793'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0794'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0794'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0794'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0794'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0795'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0795'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0795'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0795'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0796'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0797'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0798'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0798'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0798'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0799'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0799'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0799'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0799'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0800'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0800'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0800'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0800'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0801'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0801'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0801'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0801'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0802'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0802'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0802'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0803'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0803'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0803'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0803'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0804'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0805'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0805'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0806'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0806'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0806'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0807'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0807'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0807'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0807'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0808'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0809'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0810'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0810'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0810'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0810'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0811'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0811'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0812'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0812'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0812'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0812'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0813'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0813'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0813'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0813'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0814'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0815'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0815'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0815'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0816'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0817'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0817'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0817'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0817'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0818'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0818'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0819'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0819'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0819'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0819'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0820'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0820'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0820'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0820'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0821'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0821'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0822'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0822'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0823'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0823'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0823'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0824'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0824'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0824'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0824'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0825'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0825'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0825'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0825'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0826'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0826'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0827'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0827'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0828'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0829'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0829'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0829'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0829'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0830'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0831'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0832'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0833'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0833'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0834'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0835'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0835'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0836'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0836'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0836'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0837'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0838'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0838'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0838'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0838'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0839'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0839'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0840'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0841'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0841'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0841'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0841'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0842'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0842'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0842'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0843'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0843'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0844'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0844'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0844'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0844'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0845'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0846'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0847'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0847'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0848'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0849'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0850'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0851'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0851'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0852'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0853'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0853'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0853'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0853'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0854'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0854'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0854'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0855'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0856'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0856'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0857'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0857'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0857'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0858'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0859'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0860'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0860'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0860'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0861'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0861'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0862'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0862'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0862'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0863'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0863'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0863'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0863'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0864'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0864'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0864'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0865'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0865'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0865'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0866'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0867'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0868'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0868'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0868'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0869'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0870'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0871'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0871'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0872'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0872'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0873'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0873'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0874'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0874'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0874'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0874'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0875'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0875'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0876'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0876'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0876'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0876'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0877'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0878'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0878'), 3, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0879'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0879'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0879'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0879'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0880'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0880'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0880'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0880'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0881'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0882'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0882'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0882'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0882'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0883'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0883'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0883'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0883'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0884'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0884'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0884'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0885'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0885'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0886'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0886'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0886'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0886'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0887'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0888'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0888'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0888'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0888'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0889'), 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0890'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0890'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0891'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0891'), 4, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0892'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0892'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0892'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0892'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0893'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0893'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0893'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0893'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0894'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0895'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0896'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0896'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0896'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0896'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0897'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0897'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0897'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0898'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0898'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0898'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0898'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0899'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0900'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0900'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0900'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0900'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0901'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0901'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0901'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0901'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0902'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0902'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0902'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0903'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0904'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0904'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0904'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0905'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0905'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0905'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0905'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0906'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0906'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0906'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0907'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0907'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0907'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0908'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0908'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0908'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0909'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0909'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0910'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0910'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0910'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0910'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0911'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0911'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0912'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0912'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0912'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0913'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0913'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0913'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0914'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0914'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0914'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0915'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0915'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0916'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0917'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0917'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0917'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0917'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0918'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0918'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0918'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0918'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0919'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0920'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0921'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0922'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0922'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0922'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0922'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0923'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0924'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0924'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0924'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0925'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0925'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0925'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0926'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0927'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0927'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0927'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0928'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0928'), 2, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0929'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0929'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0930'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0931'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0931'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0931'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0931'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0932'), 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0933'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0933'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0933'), 8, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0933'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0934'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0934'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0934'), 5, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0934'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0935'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0935'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0935'), 6, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0936'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0936'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0936'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0937'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0938'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0938'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0938'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0939'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0939'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0940'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0941'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0942'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0942'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0942'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0943'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0943'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0943'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0944'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0944'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0944'), 7, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0944'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0945'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0945'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0945'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0945'), 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0946'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0946'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0947'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0947'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0947'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0947'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0948'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0948'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0949'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0950'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0951'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0951'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0951'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0952'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0953'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0954'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0955'), 2, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0955'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0956'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0956'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0956'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0957'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0958'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0958'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0958'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0959'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0960'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0961'), 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0962'), 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0963'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0963'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0963'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0963'), 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0964'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0965'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0966'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0966'), 8, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0967'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0967'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0967'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0968'), 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0969'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0969'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0969'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0970'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0971'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0971'), 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0972'), 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0973'), 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0974'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0974'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0974'), 2, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0975'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0975'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0975'), 2, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0975'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0976'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0976'), 4, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0976'), 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0977'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0977'), 7, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0977'), 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0978'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0978'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0978'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0979'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0979'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0979'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0979'), 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0980'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0980'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0980'), 4, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0980'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0981'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0981'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0982'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0982'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0982'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0982'), 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0983'), 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0984'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0984'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0984'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0985'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0985'), 6, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0986'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0986'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0986'), 5, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0987'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0987'), 5, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0987'), 1, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0987'), 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0988'), 6, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0988'), 1, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0988'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0989'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0989'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0990'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0990'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0990'), 8, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0991'), 4, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0991'), 2, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0991'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0991'), 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0992'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0992'), 3, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0992'), 6, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0992'), 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0993'), 5, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0993'), 7, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0994'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0994'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0994'), 3, 3), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0994'), 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0995'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0996'), 7, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0996'), 5, 2) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0997'), 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0998'), 8, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0998'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0998'), 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG0999'), 3, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0999'), 6, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG0999'), 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO organization_environmental_impacts (organization_id, environmental_impact_area_id, sort_order) VALUES ((SELECT id FROM org_id_map WHERE external_code = 'ORG1000'), 1, 1), ((SELECT id FROM org_id_map WHERE external_code = 'ORG1000'), 8, 2), ((SELECT id FROM org_id_map WHERE external_code = 'ORG1000'), 6, 3) ON CONFLICT DO NOTHING;

-- cleanup
DROP TABLE IF EXISTS org_id_map;