WITH cte AS (
    SELECT 
        student_id, 
        subject, 
        score, 
        exam_date,
        -- Get the first score in the sequence
        FIRST_VALUE(score) OVER (
            PARTITION BY student_id, subject 
            ORDER BY exam_date
        ) AS first_score,
        -- Get the last score in the sequence
        FIRST_VALUE(score) OVER (
            PARTITION BY student_id, subject 
            ORDER BY exam_date DESC
        ) AS latest_score,
        -- Count how many exams each student took per subject
        COUNT(score) OVER (
            PARTITION BY student_id, subject
        ) AS exam_count
    FROM Scores
)

SELECT DISTINCT
    student_id, 
    subject, 
    first_score, 
    latest_score
FROM cte
WHERE exam_count >= 2 
  AND latest_score > first_score
ORDER BY student_id, subject;