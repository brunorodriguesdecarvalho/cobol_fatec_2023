           IF (L1+L2)>L3 THEN
               IF (L1+L3)>L2 THEN
                   IF (L2+L3)>L1 THEN
                       MOVE 'FORMAM UM TRIANGULO' TO FLAG.
                       IF L1 = L2 THEN
                           IF L1 = L3 THEN
                               MOVE 'TRIANGULO EQUILATERO' TO FLAG
                           ELSE IF L2 = L3 THEN
                               MOVE 'TRIANGULO ISOCELES' TO FLAG
                       ELSE IF L2 = L3 THEN
                               MOVE 'TRIANGULO ISOCELES' TO FLAG
                            ELSE 
                               MOVE 'TRIANGULO ESCALENO' TO FLAG
                   ELSE
                       MOVE 'NAO FORMAM UM TRIANGULO' TO FLAG
               ELSE
                   MOVE 'NAO FORMAM UM TRIANGULO' TO FLAG
           ELSE
               MOVE 'NAO FORMAM UM TRIANGULO' TO FLAG.

           DISPLAY "RESULTADO DO TESTE: " AT 1410 FLAG.

           DISPLAY " " AT 1910. 