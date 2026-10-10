-- n1-grammar-61 — ことごとく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-61',
    'grammar',
    'N1',
    $$ことごとく$$,
    $$kotogotoku$$,
    $$Todos sem exceção / Completamente / Um por um$$,
    $$ことごとく indica que algo vale para todos os elementos de um grupo, sem nenhuma exceção. Equivale a "todos sem exceção" ou "completamente".

Muitas vezes é usado em situações negativas, como planos que falharam todos ou propostas que foram todas rejeitadas. Por exemplo, "todas as minhas ideias foram rejeitadas".

É uma palavra formal, comum na escrita.$$,
    $$É parecido com すべて e 全部, mas ことごとく é mais formal e enfático.

Também é escrito 悉く, em kanji, mas é raro.$$,
    $$ことごとく + Verbo$$,
    $$ことごとく$$,
    $$ことごとく|悉く$$,
    ARRAY['ことごとく']::text[],
    ARRAY['ことごとく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-61', $$私の提案はことごとく反対された。$$, $$わたしのていあんはことごとくはんたいされた。$$, $$Todas as minhas propostas foram rejeitadas, sem exceção.$$),
    ('n1-grammar-61', $$予想はことごとく外れた。$$, $$よそうはことごとくはずれた。$$, $$As previsões erraram todas.$$),
    ('n1-grammar-61', $$彼の作品はことごとく高く評価された。$$, $$かれのさくひんはことごとくたかくひょうかされた。$$, $$Todas as obras dele foram muito bem avaliadas.$$),
    ('n1-grammar-61', $$台風で、畑の野菜がことごとくだめになった。$$, $$たいふうで、はたけのやさいがことごとくだめになった。$$, $$Com o tufão, os legumes da horta se perderam completamente.$$),
    ('n1-grammar-61', $$挑戦した試験にことごとく失敗した。$$, $$ちょうせんしたしけんにことごとくしっぱいした。$$, $$Fracassei em todas as provas que tentei.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$計画は____失敗に終わった。$$, $$Os planos acabaram todos em fracasso.$$),
        (2, $$彼の意見は____無視された。$$, $$As opiniões dele foram todas ignoradas.$$),
        (3, $$店の商品は____売り切れた。$$, $$Os produtos da loja esgotaram completamente.$$),
        (4, $$彼女は私の質問に____答えてくれた。$$, $$Ela respondeu a todas as minhas perguntas, uma por uma.$$),
        (5, $$古い建物は地震で____倒れた。$$, $$Os prédios antigos caíram todos com o terremoto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-61', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことごとく$$),
        (2, $$ことごとく$$),
        (3, $$ことごとく$$),
        (4, $$ことごとく$$),
        (5, $$ことごとく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
