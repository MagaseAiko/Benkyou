-- n4-grammar-131 — 〜づらい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-131',
    'grammar',
    'N4',
    $$〜づらい$$,
    $$zurai$$,
    $$Difícil de / Desconfortável de / Custoso de$$,
    $$づらい é usado para dizer que algo é difícil ou desconfortável de fazer. Equivale a "difícil de" ou "custoso de".

Ele é formado tirando ます do verbo e acrescentando づらい, que vem do adjetivo 辛い (penoso). O resultado funciona como um adjetivo い.

A diferença em relação a にくい é sutil. にくい indica uma dificuldade mais objetiva, ligada à característica da coisa. づらい destaca o desconforto ou o sofrimento de quem faz, físico ou emocional.

Por isso, づらい é muito usado em situações emocionais, como ser difícil recusar um pedido, ser difícil dizer a verdade ou pedir algo a alguém.$$,
    $$Para situações físicas, como ler letras pequenas, づらい e にくい muitas vezes podem ser trocados.

Para situações emocionais, como 言いづらい e 断りづらい, づらい soa mais natural.

づらい geralmente não é usado para coisas que acontecem sozinhas, como algo que "não quebra fácil". Nesse caso, usa-se にくい.$$,
    $$Verbo na forma ます sem ます + づらい

Negativo: づらくない
Passado: づらかった
Ligando: づらくて
Mudança: づらくなる$$,
    $$づらい$$,
    $$づらい|づらく|づらかった$$,
    ARRAY['づらい']::text[],
    ARRAY['づらい', 'づらくない', 'づらかった', 'づらくて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-131', $$この靴はきつくて歩きづらい。$$, $$このくつはきつくてあるきづらい。$$, $$Estes sapatos são apertados e desconfortáveis para andar.$$),
    ('n4-grammar-131', $$先輩のお願いは、断りづらいです。$$, $$せんぱいのおねがいは、ことわりづらいです。$$, $$É difícil recusar um pedido do veterano.$$),
    ('n4-grammar-131', $$字が小さくて読みづらい。$$, $$じがちいさくてよみづらい。$$, $$As letras são pequenas e difíceis de ler.$$),
    ('n4-grammar-131', $$本当のことは言いづらかった。$$, $$ほんとうのことはいいづらかった。$$, $$Foi difícil dizer a verdade.$$),
    ('n4-grammar-131', $$骨が多くて、この魚は食べづらい。$$, $$ほねがおおくて、このさかなはたべづらい。$$, $$Este peixe tem muita espinha e é difícil de comer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女の前では、そのことは話し____。$$, $$Na frente dela, é difícil falar sobre isso.$$),
        (2, $$部長には相談し____です。$$, $$É difícil pedir conselho ao gerente.$$),
        (3, $$この部屋は暗くて、本が読み____。$$, $$Este quarto é escuro, e é difícil ler.$$),
        (4, $$喉が痛くて、薬が飲み込み____。$$, $$Estou com dor de garganta e é difícil engolir o remédio.$$),
        (5, $$一度断ると、もう一度頼み____なる。$$, $$Depois de recusar uma vez, fica difícil pedir de novo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-131', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$づらい$$),
        (1, $$づらいです$$),
        (2, $$づらい$$),
        (3, $$づらい$$),
        (3, $$づらいです$$),
        (4, $$づらい$$),
        (4, $$づらいです$$),
        (5, $$づらく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
