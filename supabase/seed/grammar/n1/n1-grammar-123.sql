-- n1-grammar-123 — 〜にしたところで / 〜としたところで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-123',
    'grammar',
    'N1',
    $$〜にしたところで / 〜としたところで$$,
    $$ni shita tokoro de / to shita tokoro de$$,
    $$Mesmo para / Mesmo que / Até mesmo$$,
    $$にしたところで e としたところで indicam que, mesmo considerando uma pessoa ou situação específica, a conclusão é a mesma. Equivale a "mesmo para" ou "mesmo que".

Muitas vezes a pessoa diz que nem ela, nem alguém que deveria saber, consegue mudar a situação. Por exemplo, "mesmo para mim, isso é difícil" ou "mesmo que se apresse, não vai dar tempo".

A segunda parte costuma ser negativa.$$,
    $$É parecido com にしても, mas mais enfático.

Também aparece como にしたって, na forma coloquial.$$,
    $$Substantivo + にしたところで
Verbo (forma simples) + としたところで
Substantivo + としたところで$$,
    $$にしたところで$$,
    $$にしたところで|としたところで|にしたって$$,
    ARRAY['に', 'した', 'ところ', 'で']::text[],
    ARRAY['にしたところで', 'としたところで', 'にしたって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-123', $$私にしたところで、彼の気持ちはわからない。$$, $$わたしにしたところで、かれのきもちはわからない。$$, $$Mesmo para mim, é impossível entender o que ele sente.$$),
    ('n1-grammar-123', $$社長にしたところで、この問題は解決できないだろう。$$, $$しゃちょうにしたところで、このもんだいはかいけつできないだろう。$$, $$Até mesmo o presidente provavelmente não consegue resolver este problema.$$),
    ('n1-grammar-123', $$今から急いだとしたところで、間に合わない。$$, $$いまからいそいだとしたところで、まにあわない。$$, $$Mesmo que corra agora, não vai dar tempo.$$),
    ('n1-grammar-123', $$彼にしたって、悪気があったわけではない。$$, $$かれにしたって、わるぎがあったわけではない。$$, $$Até mesmo ele não fez por mal.$$),
    ('n1-grammar-123', $$専門家にしたところで、未来は予測できない。$$, $$せんもんかにしたところで、みらいはよそくできない。$$, $$Mesmo para um especialista, não dá para prever o futuro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先生____、全部の答えを知っているわけではない。$$, $$Até mesmo o professor não sabe todas as respostas.$$),
        (2, $$親____、子供の将来を決めることはできない。$$, $$Mesmo os pais não podem decidir o futuro dos filhos.$$),
        (3, $$たとえ謝った____、許してもらえないだろう。$$, $$Mesmo que peça desculpas, provavelmente não vai ser perdoado.$$),
        (4, $$彼女____、この結果には満足していないはずだ。$$, $$Até mesmo ela deve estar insatisfeita com este resultado.$$),
        (5, $$警察____、すべての事件を防ぐことはできない。$$, $$Mesmo a polícia não consegue evitar todos os crimes.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-123', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にしたところで$$),
        (1, $$にしたって$$),
        (2, $$にしたところで$$),
        (2, $$にしたって$$),
        (3, $$としたところで$$),
        (4, $$にしたところで$$),
        (4, $$にしたって$$),
        (5, $$にしたところで$$),
        (5, $$にしたって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
