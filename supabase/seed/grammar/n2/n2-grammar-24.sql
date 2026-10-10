-- n2-grammar-24 — 〜がきっかけで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-24',
    'grammar',
    'N2',
    $$〜がきっかけで$$,
    $$ga kikkake de$$,
    $$Por causa de / A partir de / Motivado por$$,
    $$がきっかけで é usado para indicar o ponto de partida, o motivo ou a ocasião que deu início a algo. Equivale a "por causa de", "a partir de" ou "motivado por".

きっかけ significa "estímulo", "pontapé inicial" ou "oportunidade". A ideia é que um acontecimento específico levou a uma mudança, a um começo ou a uma decisão.

Por exemplo, "comecei a estudar japonês por causa de uma viagem" ou "uma pequena confusão deu início a uma briga".

A forma をきっかけに tem o mesmo sentido e aparece muito na escrita (veja também o item をきっかけに).

O resultado pode ser positivo ou negativo, mas costuma marcar uma mudança importante.$$,
    $$きっかけ é diferente de 原因 (causa). 原因 é a causa direta de um problema; きっかけ é o estímulo que deu início a algo.

Em entrevistas, perguntas como 日本語を勉強したきっかけは何ですか ("o que te levou a estudar japonês?") são muito comuns.

A segunda parte costuma indicar um começo ou uma mudança de hábito.$$,
    $$Substantivo + がきっかけで + Mudança / Início
Substantivo + がきっかけになって + …
Frase + のがきっかけで + …

Variação: Substantivo + をきっかけに$$,
    $$がきっかけで$$,
    $$がきっかけで|をきっかけに|きっかけで|きっかけに$$,
    ARRAY['が', 'きっかけ', 'で']::text[],
    ARRAY['がきっかけで', 'をきっかけに', 'がきっかけになって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-24', $$日本への旅行がきっかけで、日本語を勉強し始めた。$$, $$にほんへのりょこうがきっかけで、にほんごをべんきょうしはじめた。$$, $$Comecei a estudar japonês por causa de uma viagem ao Japão.$$),
    ('n2-grammar-24', $$一冊の本がきっかけで、作家になった。$$, $$いっさつのほんがきっかけで、さっかになった。$$, $$Um único livro foi o que me levou a ser escritor.$$),
    ('n2-grammar-24', $$友達の紹介がきっかけで、彼と知り合った。$$, $$ともだちのしょうかいがきっかけで、かれとしりあった。$$, $$Conheci-o a partir de uma apresentação de um amigo.$$),
    ('n2-grammar-24', $$病気がきっかけで、健康に気をつけるようになった。$$, $$びょうきがきっかけで、けんこうにきをつけるようになった。$$, $$Motivado por uma doença, passei a cuidar da saúde.$$),
    ('n2-grammar-24', $$小さな誤解がきっかけで、けんかになった。$$, $$ちいさなごかいがきっかけで、けんかになった。$$, $$Um pequeno mal-entendido deu início a uma briga.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$アニメ____、日本に興味を持った。$$, $$Por causa dos animes, passei a me interessar pelo Japão.$$),
        (2, $$留学____、国際関係の仕事をしたいと思った。$$, $$O intercâmbio me fez querer trabalhar com relações internacionais.$$),
        (3, $$一つの出会い____、人生が変わった。$$, $$Um único encontro mudou a minha vida.$$),
        (4, $$一人暮らし____、料理を始めた。$$, $$Comecei a cozinhar por causa de morar sozinho.$$),
        (5, $$先生の一言____、医者を目指した。$$, $$Uma frase do professor me motivou a querer ser médico.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-24', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がきっかけで$$),
        (2, $$がきっかけで$$),
        (3, $$がきっかけで$$),
        (4, $$がきっかけで$$),
        (5, $$がきっかけで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
