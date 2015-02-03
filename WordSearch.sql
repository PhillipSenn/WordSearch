IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Guess.SaveWordSearch') AND type in (N'P', N'PC'))
DROP PROC Guess.SaveWordSearch
GO
CREATE PROC Guess.SaveWordSearch
(@GuessID Int
) AS

UPDATE Guess SET
 Guess.Earned=Points
,Guess.GuessDateTime = getdate()
,Guess.GradeDateTime = getdate()
FROM Guess
JOIN Answer
ON Guess_AnswerID = AnswerID
JOIN Question
ON Answer_QuestionID = QuestionID
WHERE GuessID = @GuessID
exec Guess.[get] @GuessID
GO
