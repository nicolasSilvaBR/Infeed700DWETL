]
/**************************************************************************************  
	-- STAGING	
    -- Description         : Retrieves the Customers from Infee700 to [Contact].stg_dimDrivers
    -- Pipeline Type       : Dimension
    -- Dimension Type      : SCD 2
    -- Schedule            : Every 5 minutes
    -- Source              : Infeed700
    -- Target              : Infeed700DWStaging > [Contact].stg_dimDrivers
    -- Author              : Nicolas Silva
    -- Created Date        : 24/02/2025 
**************************************************************************************/
CREATE PROCEDURE ETL.dimDriversToStaging(	
	@PipelineType		TINYINT  = 0 ,	--0 = Full Load 1 = incremental Load
	@DateFrom			DATETIME = NULL	-- From Which Date
)
AS
BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET NOCOUNT ON;

	DECLARE 
		@varPipelineType		TINYINT  = @PipelineType,
		@varDateFrom			DATETIME = @DateFrom;

	SELECT 
		Drivers.iDriverId AS DriverId, 
		Drivers.sDriverCode AS DriverCode, 
		Contacts.sContactName AS DriverName,
		Contacts.sContactAddress1 AS ContactAddress1,
		Contacts.sContactAddress2 AS ContactAddress2,
		Contacts.sContactAddress3 AS ContactAddress3,
		Contacts.sContactAddress4 AS ContactAddress4,
		Contacts.sContactPostCode AS ContactPostCode,
		Contacts.sContactTelephoneNumber as ContactTelephoneNumber,
		Contacts.sContactEMail AS ContactEMail,
		GETDATE() AS ValidFrom,
		CONVERT(datetime, '9999-12-31') as ValidTo
	INTO #Drivers
	FROM Contact.Drivers 
		INNER JOIN  Contact.Contacts ON Contacts.iContactId = Drivers.iContactId
	WHERE ( @PipelineType = 0 OR ( @PipelineType = 1 AND Drivers.dtTID >= @varDateFrom ) )
	AND Drivers.cRecordStatus='A'	
	
	-- Full Load
	IF @varPipelineType = 0
	BEGIN
		SELECT 
			DriverId, 
			DriverCode, 
			DriverName,
			ContactAddress1,
			ContactAddress2,
			ContactAddress3,
			ContactAddress4,
			ContactPostCode,
			ContactTelephoneNumber,
			ContactEMail,
			ValidFrom,
			ValidTo
		FROM #Drivers
		UNION
		SELECT 	
			-1 AS DriverId,
			'N/A' AS CustomerCode, 
			'N/A' AS CustomerName,
			'N/A' AS ContactAddress1,
			'N/A' AS ContactAddress2,
			'N/A' AS ContactAddress3,
			'N/A' AS ContactAddress4,
			'N/A' AS ContactPostCode,
			'N/A' AS ContactTelephoneNumber,
			'N/A' AS ContactEMail,
			'1753-01-01' AS ValidFrom,
			'9999-12-31' AS ValidTo
	END

	-- Incremental Load
	IF @varPipelineType = 1
	BEGIN
		SELECT 
			DriverId, 
			DriverCode, 
			DriverName,
			ContactAddress1,
			ContactAddress2,
			ContactAddress3,
			ContactAddress4,
			ContactPostCode,
			ContactTelephoneNumber,
			ContactEMail,
			ValidFrom,
			ValidTo
		FROM #Drivers	
	END
END;