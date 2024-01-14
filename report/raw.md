# Problema 1

O problema apresentado é conhecido como "matriz espiral".
A estratégia usada para o resolver passa por transformar a matriz em várias iterações de modo a que ao fim da transformação, a primeira linha (cabeça da lista de listas que representa a matriz) seja o correspondente ao que é necessário acrescentar à lista resultado.

-- Imagens que expliquem a cena

```hs
ex1 [] = []
ex1 (h:t) = h ++ ex1(transpose (map (reverse) t))
```

`transpose (map (reverse))` é responsável por rodar a matriz 90º no sentido positivo.
Percebeu-se, eventualmente que é possivel obter o mesmo efeito sem recurso a um map (que envolve iterar toda a matriz):
`transpose.(map reverse) ==  reverse.transpose`
De grosso modo, esta equivalencia existe porque transpor uma matriz em que se afeta colunas, é o mesmo que a traspor e fazer as mesmas operações elementares às linhas.



# Problema 3

```hs
ex3_2 x 0 = (x,x) -- soma,atual
ex3_2 x i = (acc+ratio*prev,ratio*prev)
            where (acc,ratio,prev) = (acc,(x**2) / ((2*i+1)*(2 * i)),prev)  where (acc,prev) = ex3_2 x (i-1)```

