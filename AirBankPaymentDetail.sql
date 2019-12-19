SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
-- =============================================
-- Author:	Geethika Joy
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AirBankPaymentDetail]
	-- Add the parameters for the stored procedure here
	@ReceiptID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.dffdfdfs
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT AirBnkPaymnt.ReceiptID
		,AirBnkPaymntDtl.AdjAmt
		,AirBnkPaymntDtl.TDS
		,InvoiceFormat + '/' + Convert(VARCHAR, InvoiceIncrNo) VoucherNo
	FROM AirBnkPaymnt
	INNER JOIN AirBnkPaymntDtl ON AirBnkPaymnt.ReceiptID = AirBnkPaymntDtl.ReceiptID
	INNER JOIN AirExpInvoice ON AirBnkPaymntDtl.VoucherID = AirExpInvoice.ExpInvoiceID
	WHERE (AirBnkPaymnt.Active = 1)
		AND (AirBnkPaymntDtl.Active = 1)
		AND AirBnkPaymnt.ReceiptID = @ReceiptID
END

