-- n1-grammar-04 — あらかじめ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-04',
    'grammar',
    'N1',
    $$あらかじめ$$,
    $$arakajime$$,
    $$De antemão / Com antecedência / Previamente$$,
    $$あらかじめ indica que algo é feito antes de um acontecimento, como preparação. Equivale a "de antemão" ou "com antecedência".

É muito usado em avisos, instruções e no trabalho. Por exemplo, "por favor, faça a reserva com antecedência".

É mais formal que 前もって.$$,
    $$É parecido com 前もって e 事前に.

Também é escrito 予め, em kanji, mas a forma em hiragana é mais comum.

Expressões comuns são あらかじめご了承ください e あらかじめ準備する.$$,
    $$あらかじめ + Verbo$$,
    $$あらかじめ$$,
    $$あらかじめ|予め$$,
    ARRAY['あらかじめ']::text[],
    ARRAY['あらかじめ', '予め']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-04', $$参加する人は、あらかじめ予約してください。$$, $$さんかするひとは、あらかじめよやくしてください。$$, $$Quem for participar, faça a reserva com antecedência.$$),
    ('n1-grammar-04', $$あらかじめ資料を読んでおいてください。$$, $$あらかじめしりょうをよんでおいてください。$$, $$Leia os materiais de antemão.$$),
    ('n1-grammar-04', $$変更の可能性があることを、あらかじめご了承ください。$$, $$へんこうのかのうせいがあることを、あらかじめごりょうしょうください。$$, $$Pedimos sua compreensão prévia quanto à possibilidade de mudanças.$$),
    ('n1-grammar-04', $$旅行の前に、あらかじめ天気を調べた。$$, $$りょこうのまえに、あらかじめてんきをしらべた。$$, $$Antes da viagem, pesquisei o tempo com antecedência.$$),
    ('n1-grammar-04', $$質問はあらかじめ考えておこう。$$, $$しつもんはあらかじめかんがえておこう。$$, $$Vamos pensar nas perguntas de antemão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$遅れる場合は、____連絡してください。$$, $$Em caso de atraso, avise com antecedência.$$),
        (2, $$会議の前に、____議題を決めておく。$$, $$Antes da reunião, definimos a pauta de antemão.$$),
        (3, $$____お断りしておきますが、返品はできません。$$, $$Avisamos de antemão que não é possível devolver.$$),
        (4, $$____材料を用意しておくと、料理が楽だ。$$, $$Se preparar os ingredientes previamente, cozinhar fica mais fácil.$$),
        (5, $$面接で聞かれそうなことを____練習した。$$, $$Pratiquei com antecedência o que provavelmente perguntariam na entrevista.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-04', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あらかじめ$$),
        (1, $$予め$$),
        (2, $$あらかじめ$$),
        (2, $$予め$$),
        (3, $$あらかじめ$$),
        (3, $$予め$$),
        (4, $$あらかじめ$$),
        (4, $$予め$$),
        (5, $$あらかじめ$$),
        (5, $$予め$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
