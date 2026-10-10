-- n3-grammar-52 — 〜ことは〜が
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-52',
    'grammar',
    'N3',
    $$〜ことは〜が$$,
    $$koto wa ~ ga$$,
    $$Até que... mas / É verdade que... mas$$,
    $$ことは〜が é usado para admitir que algo é verdade, mas com uma ressalva. Equivale a "até que..., mas..." ou "é verdade que..., mas...".

A estrutura repete a mesma palavra duas vezes, com ことは no meio: "fazer ことは fazer, mas...". A ideia é "fazer, até que faço, mas não do jeito que você imagina".

Por exemplo, "falar japonês, até que falo, mas não muito bem" ou "é barato, é, mas a qualidade não é boa".

A segunda parte, depois de が ou けど, traz a limitação ou o lado negativo. É uma forma de responder com honestidade, sem negar totalmente nem afirmar com entusiasmo.$$,
    $$A repetição é obrigatória: a mesma palavra aparece antes e depois de ことは.

Essa estrutura é ótima para responder perguntas com modéstia, como quando alguém pergunta se você sabe algo.

Comparado a けど sozinho, ことは〜が deixa mais clara a ideia de "sim, mas com limitações".$$,
    $$Verbo + ことは + Verbo (mesmo) + が / けど
Adjetivo い + ことは + Adjetivo い + が / けど
Adjetivo な + な + ことは + Adjetivo な + だ + が / けど
Verbo た + ことは + Verbo た + が / けど$$,
    $$ことは$$,
    $$ことは$$,
    ARRAY['こと', 'は', 'が']::text[],
    ARRAY['ことは〜が', 'ことは〜けど']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-52', $$パーティーに行くことは行くが、少し遅れる。$$, $$パーティーにいくことはいくが、すこしおくれる。$$, $$Até que vou à festa, mas vou chegar um pouco atrasado.$$),
    ('n3-grammar-52', $$このパソコンは使えることは使えるけど、とても遅い。$$, $$このパソコンはつかえることはつかえるけど、とてもおそい。$$, $$Este computador até funciona, mas é muito lento.$$),
    ('n3-grammar-52', $$日本語は話せることは話せますが、上手ではありません。$$, $$にほんごははなせることははなせますが、じょうずではありません。$$, $$Japonês, até que falo, mas não falo bem.$$),
    ('n3-grammar-52', $$この店は安いことは安いが、品質がよくない。$$, $$このみせはやすいことはやすいが、ひんしつがよくない。$$, $$Esta loja é barata, é, mas a qualidade não é boa.$$),
    ('n3-grammar-52', $$その本は読んだことは読んだけど、内容はよく覚えていない。$$, $$そのほんはよんだことはよんだけど、ないようはよくおぼえていない。$$, $$Até que li esse livro, mas não lembro bem do conteúdo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$料理はできる____できるが、上手ではない。$$, $$Cozinhar, até que eu cozinho, mas não sou bom.$$),
        (2, $$宿題はやった____やったけど、全部は終わっていない。$$, $$A lição, até que fiz, mas não terminei tudo.$$),
        (3, $$この部屋は広い____広いが、駅から遠い。$$, $$Este quarto até é amplo, mas é longe da estação.$$),
        (4, $$駅で彼に会った____会ったけど、話はしなかった。$$, $$Até que o encontrei na estação, mas não conversamos.$$),
        (5, $$納豆は好きな____好きですが、毎日は食べません。$$, $$Até que gosto de natto, mas não como todo dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-52', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことは$$),
        (2, $$ことは$$),
        (3, $$ことは$$),
        (4, $$ことは$$),
        (5, $$ことは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
