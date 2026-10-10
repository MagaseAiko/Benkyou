-- n3-grammar-19 — 〜だらけ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-19',
    'grammar',
    'N3',
    $$〜だらけ$$,
    $$darake$$,
    $$Cheio de / Coberto de / Repleto de$$,
    $$だらけ é usado para dizer que algo está cheio ou coberto de alguma coisa, geralmente algo indesejado. Equivale a "cheio de", "coberto de" ou "repleto de".

Ele vem diretamente depois de um substantivo. Por exemplo, 泥だらけ (coberto de lama), 間違いだらけ (cheio de erros), ゴミだらけ (cheio de lixo).

O tom é quase sempre negativo ou de reclamação. A ideia é que há uma quantidade excessiva daquilo, a ponto de ser um problema.

だらけ funciona como um substantivo ou adjetivo な: pode ser seguido de です, だ, の, で e になる.$$,
    $$だらけ não é usado para coisas positivas. Para "cheio de coisas boas", usa-se いっぱい ou 満ちた.

Comparado a ばかり, que indica "só isso", だらけ destaca que algo está coberto ou tomado por aquilo.

Palavras comuns com だらけ são 泥, 傷, 血, ほこり, ゴミ, 間違い e 借金.$$,
    $$Substantivo + だらけ + です / だ
Substantivo + だらけ + の + Substantivo
Substantivo + だらけ + になる
Substantivo + だらけ + で、 + …$$,
    $$だらけ$$,
    $$だらけ$$,
    ARRAY['だらけ']::text[],
    ARRAY['だらけ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-19', $$子供は泥だらけになって帰ってきた。$$, $$こどもはどろだらけになってかえってきた。$$, $$A criança voltou para casa coberta de lama.$$),
    ('n3-grammar-19', $$このテストは間違いだらけだ。$$, $$このテストはまちがいだらけだ。$$, $$Esta prova está cheia de erros.$$),
    ('n3-grammar-19', $$部屋がゴミだらけで、足の踏み場もない。$$, $$へやがゴミだらけで、あしのふみばもない。$$, $$O quarto está tão cheio de lixo que não dá nem para pisar.$$),
    ('n3-grammar-19', $$彼の机の上は本だらけだ。$$, $$かれのつくえのうえはほんだらけだ。$$, $$A mesa dele está cheia de livros.$$),
    ('n3-grammar-19', $$転んで、足が傷だらけになった。$$, $$ころんで、あしがきずだらけになった。$$, $$Caí e fiquei com a perna cheia de machucados.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨の中でサッカーをして、服が泥____になった。$$, $$Joguei futebol na chuva e minha roupa ficou coberta de lama.$$),
        (2, $$この作文は間違い____ですね。$$, $$Esta redação está cheia de erros, hein.$$),
        (3, $$長い間掃除していないので、部屋がほこり____だ。$$, $$Faz muito tempo que não limpo, e o quarto está cheio de poeira.$$),
        (4, $$父の手は長年の仕事で傷____だ。$$, $$As mãos do meu pai estão cheias de cicatrizes de anos de trabalho.$$),
        (5, $$借金____の生活は大変だ。$$, $$Uma vida cheia de dívidas é difícil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-19', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だらけ$$),
        (2, $$だらけ$$),
        (3, $$だらけ$$),
        (4, $$だらけ$$),
        (5, $$だらけ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
