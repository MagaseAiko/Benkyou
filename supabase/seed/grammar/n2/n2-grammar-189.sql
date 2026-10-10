-- n2-grammar-189 — 〜よりほかない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-189',
    'grammar',
    'N2',
    $$〜よりほかない$$,
    $$yori hoka nai$$,
    $$Não há outra saída senão / Só resta / Não tem jeito a não ser$$,
    $$よりほかない indica que não existe outra opção, e a pessoa é obrigada a fazer algo. Equivale a "não há outra saída senão" ou "só resta".

Muitas vezes há resignação, porque a pessoa preferia não fazer aquilo. Por exemplo, "o trem parou, então só resta ir a pé".

É uma expressão um pouco formal, parecida com しかない.$$,
    $$É mais formal que しかない.

Também aparece como ほかない e ほかはない, com o mesmo sentido.$$,
    $$Verbo (forma dicionário) + よりほかない
Verbo (forma dicionário) + よりほかはない
Verbo (forma dicionário) + よりほかに方法はない$$,
    $$よりほかない$$,
    $$よりほかない|よりほかはない|よりほかありません|よりほかに|より他ない$$,
    ARRAY['より', 'ほか', 'ない']::text[],
    ARRAY['よりほかない', 'よりほかはない', 'よりほかありません', 'よりほかに方法はない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-189', $$電車が止まったので、歩いて帰るよりほかない。$$, $$でんしゃがとまったので、あるいてかえるよりほかない。$$, $$O trem parou, então só resta voltar a pé.$$),
    ('n2-grammar-189', $$誰も手伝ってくれないなら、自分でやるよりほかはない。$$, $$だれもてつだってくれないなら、じぶんでやるよりほかはない。$$, $$Se ninguém vai ajudar, não há outra saída senão fazer sozinho.$$),
    ('n2-grammar-189', $$ここまで来たら、前に進むよりほかない。$$, $$ここまできたら、まえにすすむよりほかない。$$, $$Chegando até aqui, só resta seguir em frente.$$),
    ('n2-grammar-189', $$お金がないので、旅行はあきらめるよりほかありません。$$, $$おかねがないので、りょこうはあきらめるよりほかありません。$$, $$Como não tenho dinheiro, não há outra saída senão desistir da viagem.$$),
    ('n2-grammar-189', $$謝るよりほかに方法はない。$$, $$あやまるよりほかにほうほうはない。$$, $$Não há outro jeito a não ser pedir desculpas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$終電がないので、タクシーで帰る____。$$, $$Como não tem mais trem, só resta voltar de táxi.$$),
        (2, $$医者に言われたら、手術を受ける____。$$, $$Se o médico mandou, não há outra saída senão fazer a cirurgia.$$),
        (3, $$決まったことは、従う____。$$, $$O que foi decidido, só resta obedecer.$$),
        (4, $$道がわからないから、人に聞く____。$$, $$Como não sei o caminho, só resta perguntar a alguém.$$),
        (5, $$これ以上は待てないので、出発する____。$$, $$Não dá para esperar mais, então só resta partir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-189', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$よりほかない$$),
        (1, $$よりほかはない$$),
        (1, $$よりほかありません$$),
        (2, $$よりほかない$$),
        (2, $$よりほかはない$$),
        (2, $$よりほかありません$$),
        (3, $$よりほかない$$),
        (3, $$よりほかはない$$),
        (3, $$よりほかありません$$),
        (4, $$よりほかない$$),
        (4, $$よりほかはない$$),
        (4, $$よりほかありません$$),
        (5, $$よりほかない$$),
        (5, $$よりほかはない$$),
        (5, $$よりほかありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
