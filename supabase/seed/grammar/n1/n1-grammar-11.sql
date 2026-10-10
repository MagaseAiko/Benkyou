-- n1-grammar-11 — 〜べくして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-11',
    'grammar',
    'N1',
    $$〜べくして$$,
    $$beku shite$$,
    $$Como era inevitável / Tinha que acontecer / Naturalmente$$,
    $$べくして indica que algo aconteceu porque era inevitável ou natural que acontecesse. Equivale a "como era inevitável" ou "tinha que acontecer".

A estrutura repete o mesmo verbo, como 起こるべくして起こった, "aconteceu porque tinha que acontecer". A pessoa mostra que havia motivos claros para o resultado.

É uma expressão formal e literária.$$,
    $$Expressões comuns são 起こるべくして起こった, 勝つべくして勝った e 負けるべくして負けた.

O resultado pode ser bom ou ruim, mas sempre é visto como inevitável.$$,
    $$Verbo (forma dicionário) + べくして + Mesmo verbo (forma た)$$,
    $$べくして$$,
    $$べくして$$,
    ARRAY['べく', 'して']::text[],
    ARRAY['べくして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-11', $$この事故は起こるべくして起こった。$$, $$このじこはおこるべくしておこった。$$, $$Este acidente aconteceu porque tinha que acontecer.$$),
    ('n1-grammar-11', $$あれだけ練習したチームだから、勝つべくして勝った。$$, $$あれだけれんしゅうしたチームだから、かつべくしてかった。$$, $$Era um time que treinou muito, então venceu como era inevitável.$$),
    ('n1-grammar-11', $$準備不足で、負けるべくして負けた。$$, $$じゅんびぶそくで、まけるべくしてまけた。$$, $$Por falta de preparo, perdemos como era de esperar.$$),
    ('n1-grammar-11', $$二人は出会うべくして出会ったのだ。$$, $$ふたりはであうべくしてであったのだ。$$, $$Os dois se conheceram porque estava destinado.$$),
    ('n1-grammar-11', $$彼は成功すべくして成功した。$$, $$かれはせいこうすべくしてせいこうした。$$, $$Ele teve sucesso porque naturalmente tinha que ter.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$安全対策をしていなかったので、事故は起こる____起こった。$$, $$Como não havia medidas de segurança, o acidente aconteceu porque tinha que acontecer.$$),
        (2, $$彼女の才能なら、合格す____合格した。$$, $$Com o talento dela, passou como era inevitável.$$),
        (3, $$あの会社は倒産す____倒産した。$$, $$Aquela empresa faliu porque tinha que falir.$$),
        (4, $$この発明は生まれる____生まれた。$$, $$Esta invenção surgiu porque naturalmente tinha que surgir.$$),
        (5, $$油断していたので、負ける____負けた。$$, $$Como nos descuidamos, perdemos como era de esperar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-11', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$べくして$$),
        (2, $$べくして$$),
        (3, $$べくして$$),
        (4, $$べくして$$),
        (5, $$べくして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
