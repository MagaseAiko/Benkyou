-- n4-grammar-42 — 〜まま
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-42',
    'grammar',
    'N4',
    $$〜まま$$,
    $$mama$$,
    $$Do jeito que está / Sem mudar / Deixando$$,
    $$まま é usado para dizer que um estado continua igual, sem mudança, enquanto outra coisa acontece. Equivale a "do jeito que está", "sem mudar" ou "deixando...".

Com verbos na forma た, まま indica que uma ação foi feita e o resultado continuou, quando o normal seria desfazê-lo. Por exemplo, dormir com a luz acesa, sair com a janela aberta, entrar de sapatos.

Muitas vezes, essa situação é vista como estranha, inadequada ou descuidada. Por isso, まま aparece bastante em avisos e reclamações.

Com substantivos (com の) e adjetivos, まま indica que algo continua no mesmo estado de antes, como "continua do jeito antigo".$$,
    $$A expressão このまま significa "assim mesmo" ou "do jeito que está", e そのまま significa "desse jeito", "sem mexer".

Com verbos, まま quase sempre usa a forma た, porque indica o resultado de uma ação que já aconteceu.

〜たままにする significa "deixar como está", de propósito.$$,
    $$Verbo na forma た + まま
Verbo na forma ない + まま
Substantivo + の + まま
Adjetivo い + まま
Adjetivo な + な + まま

Com partículas: まま + で / に$$,
    $$まま$$,
    $$まま$$,
    ARRAY['まま']::text[],
    ARRAY['まま', 'ままで', 'ままに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-42', $$靴を履いたまま、部屋に入らないでください。$$, $$くつをはいたまま、へやにはいらないでください。$$, $$Não entre no quarto de sapatos, por favor.$$),
    ('n4-grammar-42', $$昨日は電気をつけたまま寝てしまった。$$, $$きのうはでんきをつけたままねてしまった。$$, $$Ontem acabei dormindo com a luz acesa.$$),
    ('n4-grammar-42', $$窓を開けたまま出かけました。$$, $$まどをあけたままでかけました。$$, $$Saí deixando a janela aberta.$$),
    ('n4-grammar-42', $$この町は昔のままです。$$, $$このまちはむかしのままです。$$, $$Esta cidade continua como era antigamente.$$),
    ('n4-grammar-42', $$このスープは冷たいままで食べてもおいしいです。$$, $$このスープはつめたいままでたべてもおいしいです。$$, $$Esta sopa é gostosa mesmo comida fria.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$テレビをつけた____、寝てしまいました。$$, $$Acabei dormindo com a TV ligada.$$),
        (2, $$帽子をかぶった____、話してはいけません。$$, $$Não se deve conversar de chapéu.$$),
        (3, $$ドアを開けた____にしないでください。$$, $$Não deixe a porta aberta, por favor.$$),
        (4, $$彼女は十年前と同じ____ですね。$$, $$Ela continua igualzinha a dez anos atrás, né?$$),
        (5, $$この野菜は生の____食べられます。$$, $$Esta verdura pode ser comida crua.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-42', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まま$$),
        (2, $$まま$$),
        (3, $$まま$$),
        (4, $$まま$$),
        (5, $$まま$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
