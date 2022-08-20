
## API Reference

#### Create new route


  POST /api/v1/routes


| Header |
| `Content-Type: application/json` |
| Body |
|`{ "route": { "starting_point": "${coordinates}", "end_point": "${coordinates}" } ` |

#### Get route

```http
  GET /api/v1/routes/${id}
```

## Examples

#### Example 1: route from Lisbon to Porto
```http
  POST /api/v1/routes
```

| Header | Body |
| :-------- | | :-------- | 
| `Content-Type: application/json` | `{ "route": { "starting_point": "-9.142685,38.736946", "end_point": "-8.629932,41.150223" } ` |

After creating the route, the API redirects to the show action, returning the following json:

```http
  GET /api/v1/routes/1
```


`{"id":20,"starting_point":"-9.142685,38.736946","end_point":"-8.629932,41.150223","highlights":[{"id":738,"name":"Parque Canino do Jardim do Arco do Cego","coordinates":"-9.142794907093048,38.73615730356519"},{"id":739,"name":"2Smok Cigarros Electrónicos","coordinates":"-9.141846746206284,38.736662572604445"},{"id":740,"name":"Júlia Lopes de Almeida","coordinates":"-9.142440855503082,38.73791893002169"},{"id":741,"name":"Lexus Lisboa","coordinates":"-9.145343005657196,38.73752873978438"},{"id":742,"name":"Águas de Portugal","coordinates":"-9.147142767906189,38.74517105916718"},{"id":743,"name":"Padel do Campo Grande","coordinates":"-9.153570681810379,38.757479059472075"},{"id":744,"name":"GoTasty","coordinates":"-9.154454469680786,38.75909793488654"},{"id":745,"name":"LSB-00345/346 – Aeroporto Parque P4","coordinates":"-9.126402586698532,38.76746885907019"},{"id":746,"name":"Pavilhão Multiusos de Vila Franca de Xira","coordinates":"-8.993442803621292,38.946693448801796"},{"id":747,"name":"Minipreço Base de Torres Novas","coordinates":"-8.62521842122078,39.47652799653224"},{"id":748,"name":"Intermarché – Minde","coordinates":"-8.685830980539322,39.51306020195483"},{"id":749,"name":"O Camponês","coordinates":"-8.695269674062729,39.63567704222308"},{"id":750,"name":"Restaurante \"Chaparrico\"","coordinates":"-8.688088059425354,39.68267440576301"},{"id":751,"name":"Farmácia David","coordinates":"-8.750389069318771,39.760156356685684"},{"id":752,"name":"Pavilhão Municipal de Ventosa do Bairro","coordinates":"-8.482436388731003,40.398605777219046"},{"id":753,"name":"Casa Nossa Senhora do Sameiro","coordinates":"-8.586385399103165,40.98753557315743"},{"id":754,"name":"Madureira's Take Away","coordinates":"-8.632721900939941,41.152594259199304"},{"id":755,"name":"Pixote","coordinates":"-8.630916774272919,41.152429661988805"},{"id":756,"name":"Fonte do Caco","coordinates":"-8.629526048898697,41.1506069474616"}]}`

#### Example 1: starting_point only in Madrid

```http
  POST /api/v1/routes
```

| Header | Body |
| :-------- | | :-------- | 
| `Content-Type: application/json` | `{ "route": { "starting_point": "-3.703339,40.416729" } ` |

After creating the route, the API redirects to the show action, returning the following json:

`{"id":21,"starting_point":"-3.703339,40.416729","end_point":null,"highlights":[{"id":757,"name":"Bicimad Carretas","coordinates":"-3.703257590532303,40.41658684141882"}]}`
