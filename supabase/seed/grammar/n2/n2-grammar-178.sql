-- n2-grammar-178 — 〜としても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-178',
    'grammar',
    'N2',
    $$〜としても$$,
    $$to shite mo$$,
    $$Mesmo que / Ainda que / Mesmo se$$,
    $$としても indica uma suposição, e mostra que, mesmo que ela seja verdade, o resultado não muda. Equivale a "mesmo que" ou "ainda que".

A situação pode ser real ou apenas imaginada. Por exemplo, "mesmo que eu ganhe na loteria, vou continuar trabalhando".

Muitas vezes vem junto com たとえ ou 仮に no começo da frase.$$,
    $$É parecido com ても, mas としても destaca mais que a situação é uma suposição.

A forma にしても tem um sentido próximo.

Não se confunde com として, que significa "como" ou "na qualidade de".$$,
    $$Verbo (forma simples) + としても
Adjetivo い + としても
Adjetivo な / Substantivo + だ + としても$$,
    $$としても$$,
    $$としても$$,
    ARRAY['と', 'しても']::text[],
    ARRAY['としても', 'たとえ〜としても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-178', $$たとえ宝くじが当たったとしても、仕事は続ける。$$, $$たとえたからくじがあたったとしても、しごとはつづける。$$, $$Mesmo que eu ganhe na loteria, vou continuar trabalhando.$$),
    ('n2-grammar-178', $$今から急いだとしても、間に合わないだろう。$$, $$いまからいそいだとしても、まにあわないだろう。$$, $$Mesmo que corra agora, provavelmente não vai dar tempo.$$),
    ('n2-grammar-178', $$冗談だとしても、言っていいことではない。$$, $$じょうだんだとしても、いっていいことではない。$$, $$Mesmo que seja brincadeira, não é algo que se possa dizer.$$),
    ('n2-grammar-178', $$高いとしても、この品質なら買う価値がある。$$, $$たかいとしても、このひんしつならかうかちがある。$$, $$Mesmo sendo caro, com esta qualidade vale a pena comprar.$$),
    ('n2-grammar-178', $$仮に彼が来なかったとしても、計画は進める。$$, $$かりにかれがこなかったとしても、けいかくはすすめる。$$, $$Mesmo que ele não venha, vamos seguir com o plano.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$たとえ反対された____、私の気持ちは変わらない。$$, $$Mesmo que sejam contra, meu sentimento não vai mudar.$$),
        (2, $$雨が降った____、試合は行われる。$$, $$Mesmo que chova, a partida será realizada.$$),
        (3, $$本当だ____、信じられない。$$, $$Mesmo que seja verdade, não consigo acreditar.$$),
        (4, $$今から勉強した____、合格は難しい。$$, $$Mesmo que estude a partir de agora, será difícil passar.$$),
        (5, $$失敗した____、後悔はしない。$$, $$Mesmo que eu falhe, não vou me arrepender.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-178', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$としても$$),
        (2, $$としても$$),
        (3, $$としても$$),
        (4, $$としても$$),
        (5, $$としても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
