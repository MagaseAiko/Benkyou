-- n2-grammar-98 — 〜に向かって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-98',
    'grammar',
    'N2',
    $$〜に向かって$$,
    $$ni mukatte$$,
    $$Em direção a / Para / Rumo a$$,
    $$に向かって indica uma direção ou um alvo. Equivale a "em direção a", "para" ou "rumo a".

Pode indicar uma direção física, como "andar em direção ao mar", ou a pessoa para quem se fala, como "gritar para alguém".

Também pode indicar um objetivo a ser alcançado, como "esforçar-se rumo ao sonho".$$,
    $$Com pessoas, muitas vezes indica uma atitude de confronto ou falta de respeito, como "falar desse jeito com o pai".

に向けて é parecido, mas é mais usado para objetivos e preparação.$$,
    $$Substantivo (lugar / pessoa / objetivo) + に向かって + Verbo
Substantivo + に向かう / に向けて$$,
    $$に向かって$$,
    $$に向かって|に向かい|にむかって$$,
    ARRAY['に', '向かって']::text[],
    ARRAY['に向かって', 'に向かい', 'にむかって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-98', $$船は南に向かって進んだ。$$, $$ふねはみなみにむかってすすんだ。$$, $$O navio seguiu em direção ao sul.$$),
    ('n2-grammar-98', $$夢に向かって頑張っている。$$, $$ゆめにむかってがんばっている。$$, $$Estou me esforçando rumo ao meu sonho.$$),
    ('n2-grammar-98', $$親に向かって、そんな口をきくな。$$, $$おやにむかって、そんなくちをきくな。$$, $$Não fale desse jeito com seus pais.$$),
    ('n2-grammar-98', $$彼は海に向かって大声で叫んだ。$$, $$かれはうみにむかっておおごえでさけんだ。$$, $$Ele gritou bem alto em direção ao mar.$$),
    ('n2-grammar-98', $$台風は東に向かい、勢力を強めている。$$, $$たいふうはひがしにむかい、せいりょくをつよめている。$$, $$O tufão segue para o leste e está ganhando força.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供たちは学校____走っていった。$$, $$As crianças saíram correndo em direção à escola.$$),
        (2, $$目標____、毎日練習している。$$, $$Treino todo dia rumo ao meu objetivo.$$),
        (3, $$先生____、失礼なことを言ってはいけない。$$, $$Não se deve dizer coisas rudes para o professor.$$),
        (4, $$鏡____笑ってみた。$$, $$Tentei sorrir para o espelho.$$),
        (5, $$飛行機は東京____飛び立った。$$, $$O avião decolou rumo a Tóquio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-98', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に向かって$$),
        (1, $$にむかって$$),
        (2, $$に向かって$$),
        (2, $$にむかって$$),
        (3, $$に向かって$$),
        (3, $$にむかって$$),
        (4, $$に向かって$$),
        (4, $$にむかって$$),
        (5, $$に向かって$$),
        (5, $$にむかって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
