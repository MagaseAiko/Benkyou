-- n1-grammar-120 — 〜に則って
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-120',
    'grammar',
    'N1',
    $$〜に則って$$,
    $$ni notte$$,
    $$De acordo com / Conforme / Seguindo$$,
    $$に則って indica que algo é feito seguindo uma regra, uma lei, uma tradição ou um padrão. Equivale a "de acordo com" ou "conforme".

É uma expressão formal, usada em contextos oficiais, jurídicos, cerimoniais ou esportivos. Por exemplo, "a cerimônia foi realizada conforme a tradição".

As formas に則り e に則った também são usadas.$$,
    $$Também é escrito にのっとって.

É parecido com に従って e に基づいて, mas に則って é mais formal e usado com regras e tradições.$$,
    $$Substantivo + に則って / に則り + Verbo
Substantivo + に則った + Substantivo$$,
    $$に則って$$,
    $$に則って|に則り|に則った|にのっとって|にのっとり$$,
    ARRAY['に', '則って']::text[],
    ARRAY['に則って', 'に則り', 'に則った']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-120', $$式は伝統に則って行われた。$$, $$しきはでんとうにのっとっておこなわれた。$$, $$A cerimônia foi realizada conforme a tradição.$$),
    ('n1-grammar-120', $$法律に則り、処分が決定された。$$, $$ほうりつにのっとり、しょぶんがけっていされた。$$, $$A punição foi decidida de acordo com a lei.$$),
    ('n1-grammar-120', $$選手たちはスポーツマンシップに則って戦った。$$, $$せんしゅたちはスポーツマンシップにのっとってたたかった。$$, $$Os atletas competiram seguindo o espírito esportivo.$$),
    ('n1-grammar-120', $$規則に則った手続きをしてください。$$, $$きそくにのっとったてつづきをしてください。$$, $$Faça os procedimentos de acordo com as regras.$$),
    ('n1-grammar-120', $$古い作法に則って、お茶を入れた。$$, $$ふるいさほうにのっとって、おちゃをいれた。$$, $$Preparei o chá seguindo a etiqueta tradicional.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$会議は規定____進められた。$$, $$A reunião foi conduzida de acordo com as normas.$$),
        (2, $$契約____、代金を支払った。$$, $$Paguei o valor conforme o contrato.$$),
        (3, $$昔からのしきたり____、結婚式を挙げた。$$, $$Fizemos o casamento seguindo os costumes antigos.$$),
        (4, $$憲法____判断すべきだ。$$, $$Deve-se julgar de acordo com a constituição.$$),
        (5, $$ルール____試合を行います。$$, $$A partida será realizada conforme as regras.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-120', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に則って$$),
        (1, $$に則り$$),
        (1, $$にのっとって$$),
        (2, $$に則って$$),
        (2, $$に則り$$),
        (2, $$にのっとって$$),
        (3, $$に則って$$),
        (3, $$に則り$$),
        (3, $$にのっとって$$),
        (4, $$に則って$$),
        (4, $$に則り$$),
        (4, $$にのっとって$$),
        (5, $$に則って$$),
        (5, $$に則り$$),
        (5, $$にのっとって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
