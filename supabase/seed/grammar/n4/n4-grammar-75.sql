-- n4-grammar-75 — 〜させてください
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-75',
    'grammar',
    'N4',
    $$〜させてください$$,
    $$sasete kudasai$$,
    $$Deixe-me (fazer) / Permita-me$$,
    $$させてください é usado para pedir permissão para fazer algo. Equivale a "deixe-me fazer" ou "permita-me".

Ele junta a forma causativa (させる, "deixar fazer") com てください (pedido). A ideia literal é "por favor, me deixe fazer isso".

É usado quando quem fala quer fazer algo e pede a autorização de outra pessoa, como descansar, ir embora mais cedo, assumir uma tarefa ou dar uma opinião.

Também é uma forma educada e humilde de se oferecer para fazer algo, mostrando vontade e respeito.

Para soar mais suave, usa-se させてもらえませんか ou させていただけませんか.$$,
    $$ちょっと考えさせてください é uma forma educada e muito comum de dizer que você precisa pensar antes de responder.

Com superiores, させていただけませんか é a forma mais adequada para pedir permissão.

A diferença para てもいいですか é o tom: させてください soa mais como um pedido firme, mostrando que você realmente quer fazer aquilo.$$,
    $$Verbo causativo na forma て + ください

Grupo 1: 休む → 休ませてください / 帰る → 帰らせてください
Grupo 2: 考える → 考えさせてください
する → させてください

Mais suave: 〜させてもらえませんか / 〜させていただけませんか$$,
    $$させてください$$,
    $$せてください|せてくださいませんか|せてもらえませんか|せてもらえますか$$,
    ARRAY['させて', 'ください']::text[],
    ARRAY['させてください', 'させてもらえませんか', 'させていただけませんか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-75', $$すみません、少し休ませてください。$$, $$すみません、すこしやすませてください。$$, $$Com licença, me deixe descansar um pouco.$$),
    ('n4-grammar-75', $$その仕事は私にやらせてください。$$, $$そのしごとはわたしにやらせてください。$$, $$Deixe esse trabalho comigo, por favor.$$),
    ('n4-grammar-75', $$ちょっと考えさせてください。$$, $$ちょっとかんがえさせてください。$$, $$Me deixe pensar um pouco.$$),
    ('n4-grammar-75', $$今日は早く帰らせてもらえませんか。$$, $$きょうははやくかえらせてもらえませんか。$$, $$Poderia me deixar ir embora mais cedo hoje?$$),
    ('n4-grammar-75', $$私にも一言言わせてください。$$, $$わたしにもひとこといわせてください。$$, $$Me deixe dizer uma palavra também.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$頭が痛いので、早退さ____。$$, $$Estou com dor de cabeça, então me deixe sair mais cedo.$$),
        (2, $$その荷物、私に持た____。$$, $$Deixe-me carregar essa bagagem.$$),
        (3, $$一度、私に説明さ____。$$, $$Deixe-me explicar uma vez.$$),
        (4, $$この写真、コピーさ____か。$$, $$Você poderia me deixar copiar esta foto?$$),
        (5, $$ぜひ、私にも手伝わ____。$$, $$Por favor, deixe-me ajudar também.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-75', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せてください$$),
        (2, $$せてください$$),
        (3, $$せてください$$),
        (4, $$せてもらえません$$),
        (5, $$せてください$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
