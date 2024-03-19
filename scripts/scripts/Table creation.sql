-- Create Storage Device Table
IF NOT EXISTS (SELECT * FROM sys.objects
           WHERE name = N'StorageDevice'
               AND schema_id = SCHEMA_ID(N'dbo')
               AND [type]  = N'U')
BEGIN
	CREATE TABLE dbo.StorageDevice (
		storage_device_id INT IDENTITY(1, 1) PRIMARY KEY,
		capacity VARCHAR(50),
		type VARCHAR(50)
	);
END;

-- Create Graphics Card Table
IF NOT EXISTS (SELECT * FROM sys.objects
           WHERE name = N'GraphicsCard'
               AND schema_id = SCHEMA_ID(N'dbo')
               AND [type]  = N'U')
BEGIN
	CREATE TABLE dbo.GraphicsCard (
		graphics_card_id INT IDENTITY(1, 1) PRIMARY KEY,
		model VARCHAR(100)
	);
END;

-- Create Processor Table
IF NOT EXISTS (SELECT * FROM sys.objects
           WHERE name = N'Processor'
               AND schema_id = SCHEMA_ID(N'dbo')
               AND [type]  = N'U')
BEGIN
	CREATE TABLE dbo.Processor (
		processor_id INT IDENTITY(1, 1) PRIMARY KEY,
		model VARCHAR(100)
	);
END;

-- Create Memory Table
IF NOT EXISTS (SELECT * FROM sys.objects
           WHERE name = N'Memory'
               AND schema_id = SCHEMA_ID(N'dbo')
               AND [type]  = N'U')
BEGIN
	CREATE TABLE dbo.Memory (
		memory_id INT IDENTITY(1, 1) PRIMARY KEY,
		totalmemory VARCHAR(50)
	);
END;

-- Create Computer System Table, we can add Foreign Key to the above references but Updates are not allowed if we do so
IF NOT EXISTS (SELECT * FROM sys.objects
           WHERE name = N'ComputerSystem'
               AND schema_id = SCHEMA_ID(N'dbo')
               AND [type]  = N'U')
BEGIN
	CREATE TABLE dbo.ComputerSystem (
		computer_id INT IDENTITY(1, 1) PRIMARY KEY,
		storage_device_id INT,
		graphics_card_id INT,
		processor_id INT,
		memory_id INT,
		weight VARCHAR(50),
		power_supply VARCHAR(50),
		additional_notes VARCHAR(200),
		FOREIGN KEY (storage_device_id) REFERENCES StorageDevice(storage_device_id),
		FOREIGN KEY (graphics_card_id) REFERENCES GraphicsCard(graphics_card_id),
		FOREIGN KEY (processor_id) REFERENCES Processor(processor_id),
		FOREIGN KEY (memory_id) REFERENCES Memory(memory_id)
	);
END;