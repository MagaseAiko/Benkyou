-- n1-grammar-185 — 〜て敵わない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-185',
    'grammar',
    'N1',
    $$〜て敵わない$$,
    $$te kanawanai$$,
    $$Insuportável / Não aguento / Demais$$,
    $$て敵わない indica que uma situação é tão desagradável que a pessoa não consegue suportar. Equivale a "insuportável" ou "não aguento".

Costuma vir com adjetivos que expressam incômodo, como quente, barulhento, dolorido ou chato. Por exemplo, "o barulho dos vizinhos é insuportável".

É uma expressão coloquial, com tom de reclamação.$$,
    $$Também é escrito てかなわない, em hiragana.

É parecido com てたまらない, mas て敵わない é usado só com coisas desagradáveis.$$,
    $$Adjetivo い (sem い) + くて敵わない
Adjetivo な + で敵わない
Verbo (forma て) + 敵わない$$,
    $$て敵わない$$,
    $$て敵わない|でかなわない|てかなわない|で敵わない|て敵いません$$,
    ARRAY['て', '敵わない']::text[],
    ARRAY['て敵わない', 'てかなわない', 'で敵わない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-185', $$隣の家がうるさくて敵わない。$$, $$となりのいえがうるさくてかなわない。$$, $$O barulho da casa vizinha é insuportável.$$),
    ('n1-grammar-185', $$今年の夏は暑くてかなわない。$$, $$ことしのなつはあつくてかなわない。$$, $$O calor deste verão é insuportável.$$),
    ('n1-grammar-185', $$毎日同じことを言われて敵わない。$$, $$まいにちおなじことをいわれてかなわない。$$, $$Não aguento ouvir a mesma coisa todo dia.$$),
    ('n1-grammar-185', $$この仕事は面倒で敵わない。$$, $$このしごとはめんどうでかなわない。$$, $$Este trabalho é chato demais.$$),
    ('n1-grammar-185', $$歯が痛くてかなわない。$$, $$はがいたくてかなわない。$$, $$Meu dente dói insuportavelmente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$蚊に刺されて、かゆく____。$$, $$Fui picado por mosquito e a coceira é insuportável.$$),
        (2, $$部屋が狭く____。$$, $$O quarto é apertado demais, não aguento.$$),
        (3, $$彼の自慢話が長く____。$$, $$As histórias de vangloria dele são longas demais, não aguento.$$),
        (4, $$毎朝の満員電車が不快____。$$, $$O trem lotado toda manhã é insuportável.$$),
        (5, $$母に毎日勉強しろと言われ____。$$, $$Não aguento minha mãe mandando eu estudar todo dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-185', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$て敵わない$$),
        (1, $$てかなわない$$),
        (2, $$て敵わない$$),
        (2, $$てかなわない$$),
        (3, $$て敵わない$$),
        (3, $$てかなわない$$),
        (4, $$で敵わない$$),
        (4, $$でかなわない$$),
        (5, $$て敵わない$$),
        (5, $$てかなわない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
