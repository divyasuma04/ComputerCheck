BEGIN TRANSACTION

	BEGIN TRY
	--Insert into StorageDevice
	INSERT INTO StorageDevice(capacity,type) VALUES ('1TB','SSD')
	INSERT INTO StorageDevice(capacity,type) VALUES ('2TB','HDD')
	INSERT INTO StorageDevice(capacity,type) VALUES ('3TB','HDD')
	INSERT INTO StorageDevice(capacity,type) VALUES ('4TB','HDD')
	INSERT INTO StorageDevice(capacity,type) VALUES ('750GB','SDD')
	INSERT INTO StorageDevice(capacity,type) VALUES ('2TB','SDD')
	INSERT INTO StorageDevice(capacity,type) VALUES ('500GB','SDD')
	INSERT INTO StorageDevice(capacity,type) VALUES ('80GB','SSD')

	--Insert into GraphicsCars
	INSERT INTO GraphicsCard(model) VALUES ('NVIDIA GeForce GTX 770')
	INSERT INTO GraphicsCard(model) VALUES ('NVIDIA GeForce GTX 960')
	INSERT INTO GraphicsCard(model) VALUES ('Radeon R7360')
	INSERT INTO GraphicsCard(model) VALUES ('NVIDIA GeForce GTX 1080')
	INSERT INTO GraphicsCard(model) VALUES ('Radeon RX 480')
	INSERT INTO GraphicsCard(model) VALUES ('Radeon R9 380')
	INSERT INTO GraphicsCard(model) VALUES ('AMD FirePro W4100')

	--Insert into Processor
	INSERT INTO Processor(model) VALUES ('Intel® Celeron™ N3050 Processor')
	INSERT INTO Processor(model) VALUES ('AMD FX 4300 Processor')
	INSERT INTO Processor(model) VALUES ('AMD Athlon Quad-Core APU Athlon 5150')
	INSERT INTO Processor(model) VALUES ('AMD FX 8-Core Black Edition FX-8350')
	INSERT INTO Processor(model) VALUES ('AMD FX 8-Core Black Edition FX-8370')
	INSERT INTO Processor(model) VALUES ('Intel Core i7-6700K 4GHz Processor')
	INSERT INTO Processor(model) VALUES ('Intel® Core™ i5-6400 Processor')
	INSERT INTO Processor(model) VALUES ('Intel Core i7 Extreme Edition 3 GHz Processor')
	INSERT INTO Processor(model) VALUES ('Intel® Core™ i5-6400 Processor')

	--Insert into Memory
	INSERT INTO Memory(totalmemory) VALUES ('8 GB')
	INSERT INTO Memory(totalmemory) VALUES ('16 GB')
	INSERT INTO Memory(totalmemory) VALUES ('32 GB')
	INSERT INTO Memory(totalmemory) VALUES ('2 GB')
	INSERT INTO Memory(totalmemory) VALUES ('512 MB')

	--Insert into ComputerSystem
	INSERT INTO ComputerSystem(storage_device_id,graphics_card_id,processor_id,memory_id,weight,power_supply,additional_notes) VALUES (1,1,1,1,'8.1 kg','500 W PSU','2 x USB 3.0, 4 x USB 2.0')
	INSERT INTO ComputerSystem(storage_device_id,graphics_card_id,processor_id,memory_id,weight,power_supply,additional_notes) VALUES (2,2,2,2,'12 kg','500 W PSU','3 x USB 3.0, 4 x USB 2.0')
	INSERT INTO ComputerSystem(storage_device_id,graphics_card_id,processor_id,memory_id,weight,power_supply,additional_notes) VALUES (3,3,3,1,'16 lb','450 W PSU','4 x USB 3.0, 4 x USB 2.0')
	INSERT INTO ComputerSystem(storage_device_id,graphics_card_id,processor_id,memory_id,weight,power_supply,additional_notes) VALUES (4,4,4,2,'13.8 lb','500 W PSU','5 x USB 2.0, 4 x USB 3.0')
	INSERT INTO ComputerSystem(storage_device_id,graphics_card_id,processor_id,memory_id,weight,power_supply,additional_notes) VALUES (5,5,5,3,'7 kg','1000 W PSU','2 x USB 3.0, 2 x USB 2.0, 1 x USB C')
	INSERT INTO ComputerSystem(storage_device_id,graphics_card_id,processor_id,memory_id,weight,power_supply,additional_notes) VALUES (6,6,6,3,'6 kg','450 W PSU','22 x USB C, 4 x USB 3.0')
	INSERT INTO ComputerSystem(storage_device_id,graphics_card_id,processor_id,memory_id,weight,power_supply,additional_notes) VALUES (2,4,7,1,'15 lb','1000 W PSU','8 x USB 3.0')
	INSERT INTO ComputerSystem(storage_device_id,graphics_card_id,processor_id,memory_id,weight,power_supply,additional_notes) VALUES (7,1,7,2,'8 lb','750 W PSU','4 x USB 2.0')
	INSERT INTO ComputerSystem(storage_device_id,graphics_card_id,processor_id,memory_id,weight,power_supply,additional_notes) VALUES (2,7,8,4,'9 kg','508 W PSU','10 x USB 3.0, 10 x USB 2.0, 10 x USB C')
	INSERT INTO ComputerSystem(storage_device_id,graphics_card_id,processor_id,memory_id,weight,power_supply,additional_notes) VALUES (8,5,7,5,'22 lb','700 W PSU','19 x USB 3.0, 4 x USB 2.0')


	 COMMIT TRANSACTION;
 END TRY
 BEGIN CATCH
    -- If an error occurs, rollback the transaction
    ROLLBACK TRANSACTION;
    -- Output the error message
    PRINT ERROR_MESSAGE();
END CATCH;

--Select Queries
select * from ComputerSystem
select * from StorageDevice
select * from GraphicsCard
select * from Processor
select * from Memory

--Re-seed identity and drop tables if needed
--truncate table ComputerSystem
--drop table ComputerSystem
--drop table StorageDevice
--drop table Processor
--drop table Memory
--drop table GraphicsCard