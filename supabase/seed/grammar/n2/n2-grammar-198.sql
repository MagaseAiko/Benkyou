-- n2-grammar-198 — 〜をきっかけに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-198',
    'grammar',
    'N2',
    $$〜をきっかけに$$,
    $$wo kikkake ni$$,
    $$A partir de / Por causa de / Aproveitando$$,
    $$をきっかけに indica que um acontecimento foi o motivo ou o ponto de partida para algo começar ou mudar. Equivale a "a partir de" ou "por causa de".

O acontecimento pode ser grande ou pequeno, como um encontro, uma viagem ou um livro. Por exemplo, "a partir de uma viagem ao Japão, comecei a estudar japonês".

É uma expressão muito comum, usada tanto na fala quanto na escrita.$$,
    $$É parecido com を契機に, que é mais formal.

A palavra きっかけ sozinha significa "motivo" ou "oportunidade", como em 何がきっかけ.$$,
    $$Substantivo + をきっかけに / をきっかけとして
Verbo (forma simples) + の + をきっかけに$$,
    $$をきっかけに$$,
    $$をきっかけに|をきっかけとして|がきっかけで$$,
    ARRAY['を', 'きっかけ', 'に']::text[],
    ARRAY['をきっかけに', 'をきっかけとして', 'をきっかけにして', 'がきっかけで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-198', $$日本旅行をきっかけに、日本語の勉強を始めた。$$, $$にほんりょこうをきっかけに、にほんごのべんきょうをはじめた。$$, $$A partir de uma viagem ao Japão, comecei a estudar japonês.$$),
    ('n2-grammar-198', $$ある本との出会いをきっかけに、人生が変わった。$$, $$あるほんとのであいをきっかけに、じんせいがかわった。$$, $$A minha vida mudou a partir do encontro com um livro.$$),
    ('n2-grammar-198', $$入院したのをきっかけに、たばこをやめた。$$, $$にゅういんしたのをきっかけに、たばこをやめた。$$, $$A partir da internação, parei de fumar.$$),
    ('n2-grammar-198', $$友達の紹介をきっかけとして、二人は付き合い始めた。$$, $$ともだちのしょうかいをきっかけとして、ふたりはつきあいはじめた。$$, $$Os dois começaram a namorar a partir da apresentação de um amigo.$$),
    ('n2-grammar-198', $$小さなけんかがきっかけで、二人は別れた。$$, $$ちいさなけんかがきっかけで、ふたりはわかれた。$$, $$Por causa de uma briguinha, os dois terminaram.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$留学____、海外で働きたいと思うようになった。$$, $$A partir do intercâmbio, passei a querer trabalhar no exterior.$$),
        (2, $$結婚____、料理を習い始めた。$$, $$Aproveitando o casamento, comecei a fazer aulas de culinária.$$),
        (3, $$あの映画を見たの____、医者を目指した。$$, $$A partir de quando vi aquele filme, decidi ser médico.$$),
        (4, $$ボランティア活動____、多くの友達ができた。$$, $$A partir do trabalho voluntário, fiz muitos amigos.$$),
        (5, $$引っ越し____、新しい趣味を始めた。$$, $$Aproveitando a mudança, comecei um novo hobby.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-198', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をきっかけに$$),
        (1, $$をきっかけとして$$),
        (2, $$をきっかけに$$),
        (2, $$をきっかけとして$$),
        (3, $$をきっかけに$$),
        (3, $$をきっかけとして$$),
        (4, $$をきっかけに$$),
        (4, $$をきっかけとして$$),
        (5, $$をきっかけに$$),
        (5, $$をきっかけとして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
