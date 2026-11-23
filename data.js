/* ============================================================
   La Sucre · catálogo do site
   Tudo que aparece no cardápio, nas cestas e no Natal vem daqui.
   (É este arquivo que o painel administrador vai editar.)
   ============================================================ */
window.LASUCRE = {
  whatsapp: '554998039692',
  instagram: 'la_sucre_doces_artesanais',
  cidade: 'Xaxim-SC',

  /* Valor da embalagem das cestas. A La Sucre ajusta depois.
     0 = não cobra / não aparece no pedido. */
  embalagem: { P: 0, M: 0, G: 0, personalizada: 0 },

  produtos: [
    /* ---- Doces artesanais ---- */
    { id: 'trufa', cat: 'doces', nome: 'Trufas', curto: 'Trufa', preco: 4.5, unidade: 'a unidade',
      desc: 'Trufas artesanais com recheios de sabores variados.',
      sabores: ['Brigadeiro', 'Beijinho', 'Maracujá', 'Morango', 'Limão'], img: 'img/bombom-morango.jpg' },
    { id: 'barra', cat: 'doces', nome: 'Barra de chocolate recheada', curto: 'Barra recheada', preco: 20, unidade: 'a barra',
      desc: 'Barra de chocolate artesanal recheada, embalada para presente.',
      sabores: ['Brigadeiro', 'Beijinho', 'Maracujá', 'Morango', 'Limão'], img: 'img/barra.jpg' },
    { id: 'minitorta', cat: 'doces', nome: 'Mini tortas (250 g)', curto: 'Mini torta', preco: 16, unidade: 'a unidade',
      desc: 'Mini torta individual de 250 g.',
      sabores: ['Limão', 'Maracujá', 'Morango'], img: '' },
    { id: 'ddl', cat: 'doces', nome: 'Doce de leite gourmet', curto: 'Doce de leite gourmet', preco: 20, unidade: 'o pote',
      desc: 'Doce de leite gourmet em camadas, servido no potinho.',
      sabores: ['Brigadeiro', 'Maracujá', 'Morango', 'Bombom'], img: 'img/doce-de-leite.jpg' },

    /* ---- Cardápio de Natal ---- */
    { id: 'bombom-travessa', cat: 'natal', nome: 'Bombom de uva e morango na travessa', curto: 'Bombom na travessa', preco: 90, unidade: 'a travessa',
      desc: 'Travessa de bombons de uva ou morango.', sabores: ['Uva', 'Morango'], img: '' },
    { id: 'torta-travessa', cat: 'natal', nome: 'Tortas na travessa', curto: 'Torta na travessa', preco: 75, unidade: 'a travessa',
      desc: 'Torta na travessa para compartilhar.', sabores: ['Limão', 'Maracujá', 'Morango'], img: '' },
    { id: 'mousse', cat: 'natal', nome: 'Mousses na travessa', curto: 'Mousse na travessa', preco: 60, unidade: 'a travessa',
      desc: 'Mousse na travessa, com casca de chocolate por cima.', sabores: ['Morango', 'Limão', 'Maracujá'], img: '' },
    { id: 'merengue', cat: 'natal', nome: 'Merengue de morango na travessa', curto: 'Merengue de morango', preco: 100, unidade: 'a travessa',
      desc: 'Merengue de morango na travessa.', sabores: [], img: '' }
  ],

  /* ---- Cestas de presente ---- */
  cestas: [
    { id: 'P', nome: 'Cesta P', preco: 45,  itens: [ { prod: 'trufa', qtd: 2 }, { prod: 'minitorta', qtd: 1 }, { prod: 'ddl', qtd: 1 } ] },
    { id: 'M', nome: 'Cesta M', preco: 75,  itens: [ { prod: 'trufa', qtd: 4 }, { prod: 'barra', qtd: 1 }, { prod: 'ddl', qtd: 1 } ] },
    { id: 'G', nome: 'Cesta G', preco: 125, itens: [ { prod: 'trufa', qtd: 6 }, { prod: 'barra', qtd: 1 }, { prod: 'ddl', qtd: 1 }, { prod: 'mousse', qtd: 1 } ] }
  ]
};
