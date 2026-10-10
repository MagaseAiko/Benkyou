-- n1-grammar-243 — 〜ようが〜まいが / 〜ようと〜まいと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-243',
    'grammar',
    'N1',
    $$〜ようが〜まいが / 〜ようと〜まいと$$,
    $$you ga ~ mai ga / you to ~ mai to$$,
    $$Quer... quer não / Fazendo ou não / Seja ou não$$,
    $$ようが〜まいが e ようと〜まいと apresentam uma ação e sua negação, mostrando que, em qualquer caso, o resultado é o mesmo. Equivalem a "quer..., quer não" ou "fazendo ou não".

Por exemplo, "quer você vá, quer não, para mim tanto faz" ou "chovendo ou não, a partida acontece".

Também aparece com dois verbos diferentes, como ようが〜ようが.$$,
    $$まい é uma forma antiga de negação de intenção.

É parecido com 〜ても〜なくても.$$,
    $$Verbo (forma volitiva) + が + Mesmo verbo + まいが
Verbo (forma volitiva) + と + Mesmo verbo + まいと
Verbo A (forma volitiva) + が + Verbo B (forma volitiva) + が$$,
    $$ようが〜まいが$$,
    $$まいが|まいと|ようが$$,
    ARRAY['よう', 'が', 'まい', 'が']::text[],
    ARRAY['ようが〜まいが', 'ようと〜まいと', 'ようが〜ようが']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-243', $$君が行こうが行くまいが、私には関係ない。$$, $$きみがいこうがいくまいが、わたしにはかんけいない。$$, $$Quer você vá, quer não, não tem nada a ver comigo.$$),
    ('n1-grammar-243', $$雨が降ろうと降るまいと、イベントは行います。$$, $$あめがふろうとふるまいと、イベントはおこないます。$$, $$Chovendo ou não, o evento será realizado.$$),
    ('n1-grammar-243', $$彼が来ようが来まいが、会議は始める。$$, $$かれがこようがこまいが、かいぎははじめる。$$, $$Quer ele venha, quer não, a reunião vai começar.$$),
    ('n1-grammar-243', $$食べようが食べまいが、あなたの自由だ。$$, $$たべようがたべまいが、あなたのじゆうだ。$$, $$Comer ou não comer é escolha sua.$$),
    ('n1-grammar-243', $$笑われようが怒られようが、自分の道を行く。$$, $$わらわれようがおこられようが、じぶんのみちをいく。$$, $$Rindo de mim ou brigando comigo, vou seguir meu caminho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$信じようが信じ____、これは本当の話だ。$$, $$Acreditando ou não, esta é uma história verdadeira.$$),
        (2, $$参加しようとし____と、連絡はしてください。$$, $$Participando ou não, entre em contato.$$),
        (3, $$勝とうが負け____、全力を尽くそう。$$, $$Ganhando ou perdendo, vamos dar o nosso melhor.$$),
        (4, $$彼が謝ろうが謝る____、もう許さない。$$, $$Ele pedindo desculpas ou não, não vou mais perdoar.$$),
        (5, $$賛成されようが反対され____、計画を進める。$$, $$Com apoio ou com oposição, vou seguir com o plano.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-243', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まいが$$),
        (2, $$まい$$),
        (3, $$ようが$$),
        (4, $$まいが$$),
        (5, $$ようが$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
