
const express = require("express");
const http = require("http");
const app = express();
const path = require('path');
const port = 4500

// middleware
app.use(express.static('public'))

// text
app.get('/bonjour',(req,res)=>{
    res.send('bonjour')
})

app.get('/article/:var', (req, res) => {
    const text = req.params.var;
    const categorie = req.query.categorie;
    const taille = req.query.taille;
    const couleur = req.query.couleur;  
  
    res.send(`Article ${text}, catégorie : ${categorie}, taille : ${taille}, couleur : ${couleur}`);
  });
app.listen(port, ()=>{
    console.log('serveur demarré sur le port', port)
})