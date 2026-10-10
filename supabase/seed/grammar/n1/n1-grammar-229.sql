-- n1-grammar-229 — 〜つ〜つ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-229',
    'grammar',
    'N1',
    $$〜つ〜つ$$,
    $$tsu ~ tsu$$,
    $$Ora... ora / Um ao outro / Mutuamente$$,
    $$つ〜つ indica que duas ações opostas se alternam repetidamente. Equivale a "ora... ora" ou "um ao outro".

A estrutura usa pares de verbos opostos ou um verbo na forma ativa e passiva. Por exemplo, 抜きつ抜かれつ significa "ora ultrapassando, ora sendo ultrapassado".

Aparece principalmente em expressões fixas.$$,
    $$Expressões comuns são 行きつ戻りつ, 持ちつ持たれつ, 抜きつ抜かれつ e 差しつ差されつ.

持ちつ持たれつ significa "ajuda mútua".$$,
    $$Verbo A (forma ます sem ます) + つ + Verbo B (forma ます sem ます) + つ$$,
    $$〜つ〜つ$$,
    $$つ戻りつ|つ持たれつ|つ抜かれつ|つ差されつ|つ追われつ|つ浮きつ|つ沈みつ$$,
    ARRAY['つ']::text[],
    ARRAY['行きつ戻りつ', '持ちつ持たれつ', '抜きつ抜かれつ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-229', $$彼は部屋の前を行きつ戻りつしていた。$$, $$かれはへやのまえをいきつもどりつしていた。$$, $$Ele ficava indo e voltando em frente ao quarto.$$),
    ('n1-grammar-229', $$人間は持ちつ持たれつの関係で生きている。$$, $$にんげんはもちつもたれつのかんけいでいきている。$$, $$Os seres humanos vivem numa relação de ajuda mútua.$$),
    ('n1-grammar-229', $$二人のランナーは抜きつ抜かれつのレースをした。$$, $$ふたりのランナーはぬきつぬかれつのレースをした。$$, $$Os dois corredores fizeram uma corrida em que ora um passava, ora o outro.$$),
    ('n1-grammar-229', $$父と息子は、差しつ差されつお酒を飲んだ。$$, $$ちちとむすこは、さしつさされつおさけをのんだ。$$, $$Pai e filho beberam servindo um ao outro.$$),
    ('n1-grammar-229', $$二台のパトカーは追いつ追われつで走った。$$, $$にだいのパトカーはおいつおわれつではしった。$$, $$As duas viaturas corriam ora perseguindo, ora sendo perseguidas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は駅の前を行き____戻りつしていた。$$, $$Ela ficava indo e voltando em frente à estação.$$),
        (2, $$近所の人とは、持ち____持たれつの関係だ。$$, $$Com os vizinhos, temos uma relação de ajuda mútua.$$),
        (3, $$試合は抜き____抜かれつの接戦だった。$$, $$A partida foi disputada, ora um na frente, ora o outro.$$),
        (4, $$二人は差し____差されつ、夜遅くまで飲んだ。$$, $$Os dois beberam até tarde, servindo um ao outro.$$),
        (5, $$木の葉が川を浮き____沈みつ流れていった。$$, $$As folhas desciam o rio ora boiando, ora afundando.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-229', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$つ$$),
        (2, $$つ$$),
        (3, $$つ$$),
        (4, $$つ$$),
        (5, $$つ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
