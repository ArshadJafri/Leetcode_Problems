-- Write your PostgreSQL query statement below


select
    sample_id,
    dna_sequence,
    species,

    case 
        when dna_sequence like 'ATG%' THEN 1
        else 0
    end as has_start,

    case
        when dna_sequence like '%TAA'
        or dna_sequence like '%TAG'
        or dna_sequence like '%TGA'
        then 1 
        else 0
    end as has_stop,

    case
        when dna_sequence like '%ATAT%' THEN 1
        ELSE 0
    end as has_atat,

    case 
        when dna_sequence ~ 'G{3,}' then 1
        else 0
    end as has_ggg

from samples 
order by sample_id;