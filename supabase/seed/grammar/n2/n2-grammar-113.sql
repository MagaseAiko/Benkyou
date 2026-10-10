-- n2-grammar-113 — 〜にも関わらず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-113',
    'grammar',
    'N2',
    $$〜にも関わらず$$,
    $$ni mo kakawarazu$$,
    $$Apesar de / Embora / Mesmo$$,
    $$にも関わらず indica que algo aconteceu de forma contrária ao que se esperava. Equivale a "apesar de" ou "embora".

A primeira parte apresenta um fato, e a segunda mostra um resultado inesperado. Muitas vezes há um tom de surpresa ou crítica. Por exemplo, "apesar da chuva, muitas pessoas vieram".

É uma expressão formal, comum em textos e notícias.$$,
    $$É parecido com のに, mas のに expressa mais frustração pessoal, enquanto にも関わらず é mais objetivo e formal.

Também é escrito にもかかわらず.

Não se confunde com に関わらず, que significa "independentemente de".$$,
    $$Verbo (forma simples) + にも関わらず
Adjetivo い + にも関わらず
Adjetivo な / Substantivo + (である) + にも関わらず$$,
    $$にも関わらず$$,
    $$にも関わらず|にもかかわらず$$,
    ARRAY['に', 'も', '関わらず']::text[],
    ARRAY['にも関わらず', 'にもかかわらず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-113', $$雨にも関わらず、たくさんの人が来た。$$, $$あめにもかかわらず、たくさんのひとがきた。$$, $$Apesar da chuva, muitas pessoas vieram.$$),
    ('n2-grammar-113', $$彼は熱があるにもかかわらず、会社に行った。$$, $$かれはねつがあるにもかかわらず、かいしゃにいった。$$, $$Apesar de estar com febre, ele foi trabalhar.$$),
    ('n2-grammar-113', $$一生懸命勉強したにも関わらず、試験に落ちた。$$, $$いっしょうけんめいべんきょうしたにもかかわらず、しけんにおちた。$$, $$Apesar de ter estudado muito, reprovei na prova.$$),
    ('n2-grammar-113', $$平日にもかかわらず、店は混んでいた。$$, $$へいじつにもかかわらず、みせはこんでいた。$$, $$Embora fosse dia útil, a loja estava cheia.$$),
    ('n2-grammar-113', $$危険だと言われたにも関わらず、彼は山に登った。$$, $$きけんだといわれたにもかかわらず、かれはやまにのぼった。$$, $$Mesmo tendo sido avisado do perigo, ele subiu a montanha.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夜遅い____、電話に出てくれてありがとう。$$, $$Obrigado por atender o telefone apesar de ser tarde da noite.$$),
        (2, $$忙しい____、手伝ってくれた。$$, $$Apesar de estar ocupado, ele me ajudou.$$),
        (3, $$注意した____、彼はまた同じミスをした。$$, $$Apesar de eu ter avisado, ele cometeu o mesmo erro.$$),
        (4, $$高い____、その商品はよく売れている。$$, $$Apesar de ser caro, esse produto vende bem.$$),
        (5, $$悪天候____、飛行機は予定通り出発した。$$, $$Apesar do mau tempo, o avião partiu no horário.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-113', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にも関わらず$$),
        (1, $$にもかかわらず$$),
        (2, $$にも関わらず$$),
        (2, $$にもかかわらず$$),
        (3, $$にも関わらず$$),
        (3, $$にもかかわらず$$),
        (4, $$にも関わらず$$),
        (4, $$にもかかわらず$$),
        (5, $$にも関わらず$$),
        (5, $$にもかかわらず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
