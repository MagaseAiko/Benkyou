-- n2-grammar-112 — 〜にわたって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-112',
    'grammar',
    'N2',
    $$〜にわたって$$,
    $$ni watatte$$,
    $$Durante / Ao longo de / Por toda a extensão de$$,
    $$にわたって indica que algo se estende por um período longo ou por uma área grande. Equivale a "durante" ou "ao longo de".

Costuma vir com palavras de tempo, como "três horas" ou "dez anos", ou de espaço, como "todo o país" ou "uma grande área". Por exemplo, "a reunião durou cinco horas".

Mostra que a duração ou a extensão é grande.$$,
    $$A forma にわたる vem antes de substantivos, como 長年にわたる研究.

É parecido com の間, mas にわたって destaca a grande extensão.$$,
    $$Substantivo (período / área / quantidade) + にわたって / にわたり
Substantivo + にわたる + Substantivo$$,
    $$にわたって$$,
    $$にわたって|にわたり|にわたる|にわたった$$,
    ARRAY['に', 'わたって']::text[],
    ARRAY['にわたって', 'にわたり', 'にわたる', 'にわたった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-112', $$会議は五時間にわたって続いた。$$, $$かいぎはごじかんにわたってつづいた。$$, $$A reunião durou cinco horas.$$),
    ('n2-grammar-112', $$彼は十年にわたって、この研究を続けてきた。$$, $$かれはじゅうねんにわたって、このけんきゅうをつづけてきた。$$, $$Ele continuou esta pesquisa ao longo de dez anos.$$),
    ('n2-grammar-112', $$台風で、広い範囲にわたり被害が出た。$$, $$たいふうで、ひろいはんいにわたりひがいがでた。$$, $$Com o tufão, houve danos em uma grande área.$$),
    ('n2-grammar-112', $$三日間にわたる祭りが始まった。$$, $$みっかかんにわたるまつりがはじまった。$$, $$Começou um festival que dura três dias.$$),
    ('n2-grammar-112', $$全国にわたって、大雨が降った。$$, $$ぜんこくにわたって、おおあめがふった。$$, $$Choveu forte em todo o país.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$手術は八時間____行われた。$$, $$A cirurgia durou oito horas.$$),
        (2, $$この地域では一か月____雨が降らなかった。$$, $$Nesta região, não choveu durante um mês.$$),
        (3, $$長年____研究の結果がようやく出た。$$, $$Finalmente saiu o resultado de uma pesquisa de muitos anos.$$),
        (4, $$彼女は二十年____、この店を経営してきた。$$, $$Ela administrou esta loja ao longo de vinte anos.$$),
        (5, $$試験は三日間____行われる。$$, $$A prova será realizada ao longo de três dias.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-112', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にわたって$$),
        (1, $$にわたり$$),
        (2, $$にわたって$$),
        (2, $$にわたり$$),
        (3, $$にわたる$$),
        (3, $$にわたった$$),
        (4, $$にわたって$$),
        (4, $$にわたり$$),
        (5, $$にわたって$$),
        (5, $$にわたり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
