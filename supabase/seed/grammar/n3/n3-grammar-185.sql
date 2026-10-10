-- n3-grammar-185 — 〜たところ（結果）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-185',
    'grammar',
    'N3',
    $$〜たところ（結果）$$,
    $$ta tokoro (kekka)$$,
    $$Quando (fiz)... / Ao (fazer)... descobri que$$,
    $$Nesse uso, たところ indica que a pessoa fez algo e, como resultado, descobriu ou percebeu alguma coisa. Equivale a "quando fiz..." ou "ao fazer..., descobri que...".

A primeira parte é uma ação feita de propósito, geralmente uma tentativa ou verificação, como perguntar, ligar, pesquisar ou experimentar. A segunda parte mostra o resultado, muitas vezes inesperado.

Por exemplo, "quando liguei para a loja, descobri que hoje estava fechada" ou "ao consultar o professor, recebi um ótimo conselho".

A segunda parte descreve um fato que já aconteceu, e não pode ser uma vontade ou um pedido.

Esse uso é diferente da たところ do N4, que significa "acabei de fazer".$$,
    $$Esse uso é parecido com たら no sentido de descoberta, mas たところ soa mais formal e é comum em relatórios e narrativas.

A primeira ação costuma ser intencional, e a segunda, uma constatação.

Para distinguir das outras たところ, observe se a segunda parte é um resultado: se for, é este uso.$$,
    $$Verbo na forma た + ところ、 + Resultado / Descoberta

Com verbos cuja forma た termina em だ: だところ$$,
    $$たところ$$,
    $$たところ|だところ$$,
    ARRAY['た', 'ところ']::text[],
    ARRAY['たところ', 'だところ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-185', $$先生に相談したところ、いいアドバイスをもらえた。$$, $$せんせいにそうだんしたところ、いいアドバイスをもらえた。$$, $$Quando consultei o professor, recebi um ótimo conselho.$$),
    ('n3-grammar-185', $$店に電話したところ、今日は休みだった。$$, $$みせにでんわしたところ、きょうはやすみだった。$$, $$Quando liguei para a loja, descobri que hoje estava fechada.$$),
    ('n3-grammar-185', $$調べたところ、彼の話は本当だとわかった。$$, $$しらべたところ、かれのはなしはほんとうだとわかった。$$, $$Ao pesquisar, descobri que a história dele era verdadeira.$$),
    ('n3-grammar-185', $$新しい薬を飲んだところ、すぐに治った。$$, $$あたらしいくすりをのんだところ、すぐになおった。$$, $$Quando tomei o remédio novo, melhorei logo.$$),
    ('n3-grammar-185', $$頼んでみたところ、快く引き受けてくれた。$$, $$たのんでみたところ、こころよくひきうけてくれた。$$, $$Quando pedi, ele aceitou de bom grado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅員に聞い____、電車は遅れているそうだ。$$, $$Quando perguntei ao funcionário da estação, soube que o trem está atrasado.$$),
        (2, $$病院で検査し____、問題はなかった。$$, $$Quando fiz os exames no hospital, não havia nenhum problema.$$),
        (3, $$ドアを開け____、誰もいなかった。$$, $$Quando abri a porta, não havia ninguém.$$),
        (4, $$友達に勧められた本を読ん____、とてもおもしろかった。$$, $$Quando li o livro que meu amigo recomendou, achei muito interessante.$$),
        (5, $$値段を聞い____、思ったより安かった。$$, $$Quando perguntei o preço, era mais barato do que eu pensava.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-185', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たところ$$),
        (2, $$たところ$$),
        (3, $$たところ$$),
        (4, $$だところ$$),
        (5, $$たところ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
