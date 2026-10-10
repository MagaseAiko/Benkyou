-- n3-grammar-102 — 〜最中に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-102',
    'grammar',
    'N3',
    $$〜最中に$$,
    $$saichuu ni$$,
    $$Bem no meio de / Justo quando / Em pleno$$,
    $$最中に é usado para dizer que algo aconteceu bem no meio de outra ação ou evento, geralmente atrapalhando ou interrompendo. Equivale a "bem no meio de", "justo quando" ou "em pleno".

最中 significa "o auge", "o ponto central" de uma ação. Assim, a estrutura destaca que o acontecimento veio exatamente na hora em que a outra coisa estava em andamento.

Ele vem depois de substantivos com の e de verbos na forma ている.

A segunda parte costuma ser algo inesperado ou indesejado, como o telefone tocar no meio da reunião ou um terremoto durante a refeição.

Na forma 最中だ ou 最中です, no fim da frase, indica que a pessoa está no meio de algo e não pode ser interrompida.$$,
    $$Comparado a 間に e 中に, 最中に destaca mais o momento crítico e a interrupção.

A leitura é さいちゅう. A leitura もなか existe, mas é o nome de um doce japonês.

A segunda parte geralmente não é uma ação planejada por quem fala, e sim um imprevisto.$$,
    $$Substantivo + の + 最中に + Acontecimento
Verbo na forma ている + 最中に + Acontecimento
… + 最中だ / 最中です (estou no meio de...)

Escrita: 最中 / さいちゅう$$,
    $$最中に$$,
    $$最中に|最中だ|最中です|さいちゅう$$,
    ARRAY['最中', 'に']::text[],
    ARRAY['最中に', '最中だ', '最中です']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-102', $$会議の最中に、電話が鳴った。$$, $$かいぎのさいちゅうに、でんわがなった。$$, $$O telefone tocou bem no meio da reunião.$$),
    ('n3-grammar-102', $$食事の最中に、地震が起きた。$$, $$しょくじのさいちゅうに、じしんがおきた。$$, $$Houve um terremoto justo durante a refeição.$$),
    ('n3-grammar-102', $$試合の最中に、雨が降り出した。$$, $$しあいのさいちゅうに、あめがふりだした。$$, $$Começou a chover em plena partida.$$),
    ('n3-grammar-102', $$今、勉強している最中だから、静かにして。$$, $$いま、べんきょうしているさいちゅうだから、しずかにして。$$, $$Estou bem no meio dos estudos, então faça silêncio.$$),
    ('n3-grammar-102', $$お風呂に入っている最中に、停電した。$$, $$おふろにはいっているさいちゅうに、ていでんした。$$, $$A luz acabou justo quando eu estava no banho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$授業の____、携帯が鳴ってしまった。$$, $$O celular tocou bem no meio da aula.$$),
        (2, $$スピーチの____、言葉を忘れた。$$, $$Esqueci as palavras em pleno discurso.$$),
        (3, $$料理をしている____、友達が来た。$$, $$Um amigo chegou justo quando eu estava cozinhando.$$),
        (4, $$今、話し合いの____から、後で来てください。$$, $$Agora estamos no meio de uma discussão, então venha mais tarde.$$),
        (5, $$映画を見ている____、寝てしまった。$$, $$Acabei dormindo bem no meio do filme.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-102', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$最中に$$),
        (2, $$最中に$$),
        (3, $$最中に$$),
        (4, $$最中だ$$),
        (4, $$最中です$$),
        (5, $$最中に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
