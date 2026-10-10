-- n4-grammar-59 — 〜にする（変化）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-59',
    'grammar',
    'N4',
    $$〜にする（変化）$$,
    $$ni suru (henka)$$,
    $$Tornar / Deixar / Transformar em$$,
    $$No N4, にする aparece com o sentido de mudar algo de propósito, deixando aquilo com uma nova característica ou transformando-o em outra coisa. Equivale a "tornar", "deixar" ou "transformar em".

Ela é usada com adjetivos な e substantivos. A coisa que muda é marcada com を, e o novo estado ou resultado vem antes de に.

Por exemplo, deixar o quarto limpo, ficar em silêncio, transformar um quarto vazio em quarto das crianças.

A diferença em relação a になる é quem causa a mudança. になる indica uma mudança natural ("ficou limpo"); にする indica que alguém fez a mudança ("deixei limpo").

Com adjetivos い, a estrutura equivalente é くする.$$,
    $$Não confunda com a にする do N5, que significa "escolher", como em "vou de café". Aqui, にする indica transformação.

静かにしてください e 大切にしてください são pedidos muito frequentes no dia a dia.

A expressão 〜を大切にする significa "cuidar bem de" ou "valorizar", e aparece muito em mensagens de cuidado.$$,
    $$Substantivo + を + Adjetivo な + に + する
Substantivo A + を + Substantivo B + に + する (transformar A em B)
Adjetivo な + に + する (sem objeto: 静かにする)

Pedido: 〜にしてください
Equivalente com adjetivos い: Adjetivo sem い + く + する$$,
    $$にする$$,
    $$にする|にします|にした|にしました|にして|にしよう|にしましょう$$,
    ARRAY['に', 'する']::text[],
    ARRAY['にする', 'にします', 'にした', 'にしました', 'にして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-59', $$お客さんが来るので、部屋をきれいにしました。$$, $$おきゃくさんがくるので、へやをきれいにしました。$$, $$Como vai vir visita, deixei o quarto limpo.$$),
    ('n4-grammar-59', $$図書館では静かにしてください。$$, $$としょかんではしずかにしてください。$$, $$Fiquem em silêncio na biblioteca.$$),
    ('n4-grammar-59', $$息子を医者にしたいと思っています。$$, $$むすこをいしゃにしたいとおもっています。$$, $$Quero que meu filho seja médico.$$),
    ('n4-grammar-59', $$空いている部屋を子供部屋にしました。$$, $$あいているへやをこどもべやにしました。$$, $$Transformei o quarto vazio em quarto das crianças.$$),
    ('n4-grammar-59', $$体を大切にしてくださいね。$$, $$からだをたいせつにしてくださいね。$$, $$Cuide bem da sua saúde, tá?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$授業中は静か____ください。$$, $$Durante a aula, fiquem em silêncio.$$),
        (2, $$お客さんが来るから、部屋をきれい____。$$, $$Vai vir visita, então vamos deixar o quarto limpo.$$),
        (3, $$古いシャツを雑巾____。$$, $$Transformei a camisa velha em pano de chão.$$),
        (4, $$お金は大切____ください。$$, $$Cuide bem do seu dinheiro.$$),
        (5, $$美容院で、髪の色を茶色____。$$, $$No salão, deixei o cabelo castanho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-59', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にして$$),
        (2, $$にしましょう$$),
        (2, $$にしよう$$),
        (2, $$にします$$),
        (3, $$にしました$$),
        (3, $$にした$$),
        (4, $$にして$$),
        (5, $$にしました$$),
        (5, $$にした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
