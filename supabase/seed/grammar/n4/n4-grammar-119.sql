-- n4-grammar-119 — 〜は〜が、〜は〜
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-119',
    'grammar',
    'N4',
    $$〜は〜が、〜は〜$$,
    $$wa ~ ga, ~ wa ~$$,
    $$A é... mas B é... / Já (contraste)$$,
    $$Essa estrutura usa は duas vezes para comparar ou contrastar duas coisas. Equivale a "A é..., mas B é..." ou "quanto a A..., já B...".

Além de marcar o tema, は tem uma função importante de contraste. Quando aparece com dois elementos diferentes na mesma frase, ele destaca que um é de um jeito e o outro é de outro.

As duas partes são ligadas por が ou けど, que significam "mas".

Esse uso de は é muito comum com coisas que se gosta e não se gosta, que se sabe e não se sabe, que acontece em um momento e não em outro.

Também aparece em frases negativas, quando se quer deixar claro que a negação vale só para aquele elemento.$$,
    $$Muitas vezes, a segunda parte fica subentendida. Dizer apenas 肉は好きです pode sugerir que outras coisas a pessoa não gosta tanto.

Com partículas como に, で e と, o は contrastivo forma には, では e とは.

Esse uso explica por que は aparece tanto em frases negativas: ele marca o contraste com outras possibilidades.$$,
    $$A + は + …が / けど、 + B + は + …
A + は + Afirmativo + が、 + B + は + Negativo$$,
    $$は$$,
    $$は$$,
    ARRAY['は', 'が']::text[],
    ARRAY['は']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-119', $$肉は好きですが、魚は好きではありません。$$, $$にくはすきですが、さかなはすきではありません。$$, $$Carne eu gosto, mas peixe não.$$),
    ('n4-grammar-119', $$兄は背が高いが、弟は低い。$$, $$あにはせがたかいが、おとうとはひくい。$$, $$Meu irmão mais velho é alto, mas o mais novo é baixo.$$),
    ('n4-grammar-119', $$平日は忙しいですが、週末は暇です。$$, $$へいじつはいそがしいですが、しゅうまつはひまです。$$, $$Durante a semana estou ocupado, mas no fim de semana fico livre.$$),
    ('n4-grammar-119', $$ひらがなは読めますが、漢字はまだ読めません。$$, $$ひらがなはよめますが、かんじはまだよめません。$$, $$Consigo ler hiragana, mas kanji ainda não.$$),
    ('n4-grammar-119', $$東京は人が多いけど、私の町は少ない。$$, $$とうきょうはひとがおおいけど、わたしのまちはすくない。$$, $$Tóquio tem muita gente, mas a minha cidade tem pouca.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夏は暑いですが、冬____寒いです。$$, $$O verão é quente, mas o inverno é frio.$$),
        (2, $$英語は話せますが、日本語____話せません。$$, $$Falo inglês, mas japonês não.$$),
        (3, $$コーヒーは飲みますが、紅茶____飲みません。$$, $$Café eu bebo, mas chá não.$$),
        (4, $$姉は料理が上手だが、私____下手だ。$$, $$Minha irmã cozinha bem, mas eu cozinho mal.$$),
        (5, $$昼____暖かいけど、夜は寒い。$$, $$De dia está quente, mas à noite faz frio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-119', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$は$$),
        (2, $$は$$),
        (3, $$は$$),
        (4, $$は$$),
        (5, $$は$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
