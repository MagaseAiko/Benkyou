-- n1-grammar-93 — 〜なくしては
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-93',
    'grammar',
    'N1',
    $$〜なくしては$$,
    $$naku shite wa$$,
    $$Sem / Se não fosse / Na ausência de$$,
    $$なくしては indica que, sem algo, uma coisa não seria possível. Equivale a "sem" ou "se não fosse".

A segunda parte é sempre negativa ou indica impossibilidade. Por exemplo, "sem o apoio de vocês, este sucesso não teria acontecido".

É uma expressão formal, muito usada em discursos e agradecimentos.$$,
    $$É parecido com なしには e がなければ.

A forma なくして sem は também aparece, como em 努力なくして成功なし.$$,
    $$Substantivo + なくしては + Frase negativa
Substantivo + なくして(は) + Verbo (forma potencial negativa)$$,
    $$なくしては$$,
    $$なくしては|なくして$$,
    ARRAY['なく', 'して', 'は']::text[],
    ARRAY['なくしては', 'なくして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-93', $$皆さんの協力なくしては、この計画は成功しなかった。$$, $$みなさんのきょうりょくなくしては、このけいかくはせいこうしなかった。$$, $$Sem a cooperação de todos, este plano não teria dado certo.$$),
    ('n1-grammar-93', $$努力なくしては、夢は実現できない。$$, $$どりょくなくしては、ゆめはじつげんできない。$$, $$Sem esforço, não dá para realizar sonhos.$$),
    ('n1-grammar-93', $$愛なくしては、人は生きられない。$$, $$あいなくしては、ひとはいきられない。$$, $$Sem amor, as pessoas não conseguem viver.$$),
    ('n1-grammar-93', $$家族の支えなくしては、ここまで来られなかった。$$, $$かぞくのささえなくしては、ここまでこられなかった。$$, $$Se não fosse o apoio da família, eu não teria chegado até aqui.$$),
    ('n1-grammar-93', $$信頼なくして、いい関係は作れない。$$, $$しんらいなくして、いいかんけいはつくれない。$$, $$Sem confiança, não dá para construir uma boa relação.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先生の指導____、合格はできなかった。$$, $$Sem a orientação do professor, eu não teria passado.$$),
        (2, $$健康____、仕事は続けられない。$$, $$Sem saúde, não dá para continuar trabalhando.$$),
        (3, $$ファンの応援____、優勝はありえなかった。$$, $$Sem o apoio dos fãs, a vitória teria sido impossível.$$),
        (4, $$この技術____、今の生活は考えられない。$$, $$Sem esta tecnologia, é impossível imaginar a vida atual.$$),
        (5, $$苦労____、本当の喜びは得られない。$$, $$Sem dificuldades, não se alcança a verdadeira alegria.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-93', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なくしては$$),
        (1, $$なくして$$),
        (2, $$なくしては$$),
        (2, $$なくして$$),
        (3, $$なくしては$$),
        (3, $$なくして$$),
        (4, $$なくしては$$),
        (4, $$なくして$$),
        (5, $$なくしては$$),
        (5, $$なくして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
