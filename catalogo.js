/* Carrega o catálogo do Supabase. Se não estiver configurado ou der erro,
   o site segue normalmente com o data.js (nunca fica em branco). */
(function () {
  var D = window.LASUCRE, C = window.LASUCRE_CFG || {};
  var configurado = C.url && C.key && C.url.indexOf('SEU-PROJETO') < 0;
  var CACHE = 'lasucre-catalogo-v1';

  function aplicar(r) {
    if (r.produtos && r.produtos.length) {
      D.produtos = r.produtos.map(function (p) {
        return { id: p.id, cat: p.cat, nome: p.nome, curto: p.curto || p.nome, preco: +p.preco,
                 unidade: p.unidade || '', desc: p.descricao || '', sabores: p.sabores || [], img: p.img || '' };
      });
    }
    if (r.cestas && r.cestas.length) {
      D.cestas = r.cestas.map(function (c) { return { id: c.id, nome: c.nome, preco: +c.preco, itens: c.itens || [] }; });
    }
    if (r.config) {
      if (r.config.whatsapp) D.whatsapp = r.config.whatsapp;
      if (r.config.embalagem) D.embalagem = r.config.embalagem;
    }
  }

  function buscar() {
    var H = { apikey: C.key, Authorization: 'Bearer ' + C.key };
    function get(q) { return fetch(C.url + '/rest/v1/' + q, { headers: H }).then(function (r) { if (!r.ok) throw new Error(r.status); return r.json(); }); }
    return Promise.all([
      get('produtos?select=*&ativo=eq.true&order=ordem'),
      get('cestas?select=*&ativo=eq.true&order=ordem'),
      get('config?select=*&id=eq.1')
    ]).then(function (a) { return { produtos: a[0], cestas: a[1], config: a[2][0] }; });
  }

  window.__ready = !configurado ? Promise.resolve() :
    Promise.race([buscar(), new Promise(function (_, rej) { setTimeout(function () { rej(new Error('timeout')); }, 3500); })])
      .then(function (r) { aplicar(r); try { localStorage.setItem(CACHE, JSON.stringify(r)); } catch (e) {} })
      .catch(function () { try { var c = JSON.parse(localStorage.getItem(CACHE) || 'null'); if (c) aplicar(c); } catch (e) {} });
})();
