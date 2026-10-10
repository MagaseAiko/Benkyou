-- n2-grammar-154 — 〜て以来
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-154',
    'grammar',
    'N2',
    $$〜て以来$$,
    $$te irai$$,
    $$Desde que / Desde / A partir de quando$$,
    $$て以来 indica que um estado continua desde um momento no passado até agora. Equivale a "desde que".

A primeira parte mostra o acontecimento que marcou o início, e a segunda mostra o estado que permanece. Por exemplo, "desde que vim ao Japão, moro em Tóquio".

É uma expressão um pouco formal.$$,
    $$A segunda parte deve ser algo que continua até o presente. Não se usa para algo que aconteceu uma única vez.

É parecido com てから, mas て以来 destaca a continuidade.

Expressões comuns são それ以来 e 卒業以来.$$,
    $$Verbo (forma て) + 以来
Substantivo + 以来$$,
    $$て以来$$,
    $$て以来|で以来|以来$$,
    ARRAY['て', '以来']::text[],
    ARRAY['て以来', '以来', 'それ以来']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-154', $$日本に来て以来、ずっと東京に住んでいる。$$, $$にほんにきていらい、ずっととうきょうにすんでいる。$$, $$Desde que vim ao Japão, moro em Tóquio.$$),
    ('n2-grammar-154', $$卒業以来、彼とは会っていない。$$, $$そつぎょういらい、かれとはあっていない。$$, $$Desde a formatura, não o vejo.$$),
    ('n2-grammar-154', $$あの事故以来、車の運転が怖くなった。$$, $$あのじこいらい、くるまのうんてんがこわくなった。$$, $$Desde aquele acidente, passei a ter medo de dirigir.$$),
    ('n2-grammar-154', $$結婚して以来、料理を作るようになった。$$, $$けっこんしていらい、りょうりをつくるようになった。$$, $$Desde que me casei, passei a cozinhar.$$),
    ('n2-grammar-154', $$彼女はそれ以来、一度も連絡してこない。$$, $$かのじょはそれいらい、いちどもれんらくしてこない。$$, $$Desde então, ela não entrou em contato nenhuma vez.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$たばこをやめ____、体の調子がいい。$$, $$Desde que parei de fumar, me sinto bem.$$),
        (2, $$この町に引っ越し____、毎日散歩している。$$, $$Desde que me mudei para esta cidade, caminho todos os dias.$$),
        (3, $$入社____、一度も休んだことがない。$$, $$Desde que entrei na empresa, nunca faltei.$$),
        (4, $$大学に入っ____、一人暮らしをしている。$$, $$Desde que entrei na universidade, moro sozinho.$$),
        (5, $$先月風邪をひい____、ずっと咳が止まらない。$$, $$Desde que peguei resfriado no mês passado, a tosse não para.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-154', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$て以来$$),
        (2, $$て以来$$),
        (3, $$以来$$),
        (4, $$て以来$$),
        (5, $$て以来$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
