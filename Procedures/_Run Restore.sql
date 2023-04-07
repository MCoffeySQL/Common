USE massCommon
GO 

EXEC [dba].[tsw08_restore]
EXEC [dba].[tsw08cc_restore]
EXEC [dba].[tsw21_restore]


EXEC [dba].[tsw08_changeSchemaOwner]
--EXEC [dba].[tsw08cc_changeServiceOwner]

EXEC [dba].[tsw08cc_correctSynonyms]


EXEC [dba].[tsw08cc_removeUsers]
EXEC [dba].[tsw08_removeUsers]
EXEC [dba].[tsw21_removeUsers]

EXEC [dba].[tsw08_trim]

EXEC [dba].[tsw08_shrink]
EXEC [dba].[tsw08cc_shrink]
EXEC [dba].[tsw21_shrink]

EXEC [dba].[tsw08_checkDB]
EXEC [dba].[tsw08cc_checkDB]
EXEC [dba].[tsw21_checkDB]