-- n3-grammar-62 — 〜向き
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-62',
    'grammar',
    'N3',
    $$〜向き$$,
    $$muki$$,
    $$Adequado para / Apropriado para / Virado para$$,
    $$向き é usado para dizer que algo é adequado ou combina com certo público, uso ou pessoa. Equivale a "adequado para" ou "apropriado para".

Ele vem diretamente depois de um substantivo. Antes de outro substantivo, usa-se 向きの, e no final da frase, 向きだ.

A diferença em relação a 向け é sutil, mas importante. 向け indica para quem algo foi feito de propósito. 向き indica que algo é adequado para alguém, pelas suas características, mesmo que não tenha sido criado pensando nisso.

Também pode descrever pessoas: dizer que alguém é "talhado para" uma profissão, por causa da personalidade.

Com direções, como 南向き, significa "virado para": um quarto virado para o sul.$$,
    $$Para dizer que uma pessoa tem aptidão para algo, também se usa o verbo 向いている: この仕事に向いている.

Em anúncios de imóveis, 南向き (virado para o sul) é um ponto muito valorizado no Japão, porque recebe mais sol.

向き também significa "direção" ou "orientação" em geral, como em 風の向き (direção do vento).$$,
    $$Substantivo + 向き + の + Substantivo
Substantivo + 向き + だ / です
Substantivo + 向き + ではない (não é adequado para)
Direção + 向き (virado para: 南向き / 東向き)$$,
    $$向き$$,
    $$向き$$,
    ARRAY['向き']::text[],
    ARRAY['向き', '向きの', '向きだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-62', $$この料理は甘くて、子供向きの味だ。$$, $$このりょうりはあまくて、こどもむきのあじだ。$$, $$Esta comida é doce, com um sabor bom para crianças.$$),
    ('n3-grammar-62', $$この部屋は狭いので、一人暮らし向きだ。$$, $$このへやはせまいので、ひとりぐらしむきだ。$$, $$Este apartamento é pequeno, então é bom para quem mora sozinho.$$),
    ('n3-grammar-62', $$彼は人と話すのが好きだから、営業向きだ。$$, $$かれはひととはなすのがすきだから、えいぎょうむきだ。$$, $$Ele gosta de conversar com as pessoas, então tem perfil para vendas.$$),
    ('n3-grammar-62', $$このコースは難しいので、初心者向きではない。$$, $$このコースはむずかしいので、しょしんしゃむきではない。$$, $$Este curso é difícil, então não é adequado para iniciantes.$$),
    ('n3-grammar-62', $$南向きの部屋は明るい。$$, $$みなみむきのへやはあかるい。$$, $$Quartos virados para o sul são claros.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この靴は山登り____ではない。$$, $$Estes sapatos não são adequados para escalar montanhas.$$),
        (2, $$この本は簡単で、初心者____です。$$, $$Este livro é fácil e adequado para iniciantes.$$),
        (3, $$静かで真面目な彼は、研究者____だ。$$, $$Ele, que é quieto e sério, tem perfil de pesquisador.$$),
        (4, $$このアパートは家族____の広さだ。$$, $$Este apartamento tem um tamanho adequado para famílias.$$),
        (5, $$東____の窓から朝日が入る。$$, $$O sol da manhã entra pela janela virada para o leste.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-62', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$向き$$),
        (2, $$向き$$),
        (3, $$向き$$),
        (4, $$向き$$),
        (5, $$向き$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
