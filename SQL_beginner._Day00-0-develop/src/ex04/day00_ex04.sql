SELECT CONCAT(pr.name, ' (age:', pr.age, ',gender:''', pr.gender,
              ''',address:''', pr.address, ''')')
           AS person_information
FROM person AS pr
ORDER BY person_information;