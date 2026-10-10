-- n2-grammar-150 — 直ちに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-150',
    'grammar',
    'N2',
    $$直ちに$$,
    $$tadachi ni$$,
    $$Imediatamente / Já / Sem demora$$,
    $$直ちに significa "imediatamente" ou "sem demora". Indica que algo deve ser feito logo, sem esperar.

É uma palavra formal, usada em avisos, ordens, notícias e situações de emergência. Por exemplo, "evacuem imediatamente".

Na fala do dia a dia, usa-se mais すぐに.$$,
    $$É mais formal e mais forte que すぐに.

Também pode indicar uma relação direta, como em 直ちに影響はない, "não há efeito imediato".$$,
    $$直ちに + Verbo$$,
    $$直ちに$$,
    $$直ちに|ただちに$$,
    ARRAY['直ちに']::text[],
    ARRAY['直ちに', 'ただちに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-150', $$火事です。直ちに避難してください。$$, $$かじです。ただちにひなんしてください。$$, $$É um incêndio. Evacuem imediatamente.$$),
    ('n2-grammar-150', $$問題が見つかったら、直ちに報告すること。$$, $$もんだいがみつかったら、ただちにほうこくすること。$$, $$Se encontrar um problema, informe imediatamente.$$),
    ('n2-grammar-150', $$事故の知らせを受けて、直ちに現場へ向かった。$$, $$じこのしらせをうけて、ただちにげんばへむかった。$$, $$Ao receber a notícia do acidente, fui imediatamente ao local.$$),
    ('n2-grammar-150', $$この薬を飲めば、直ちに痛みが消えるわけではない。$$, $$このくすりをのめば、ただちにいたみがきえるわけではない。$$, $$Tomar este remédio não significa que a dor vai passar imediatamente.$$),
    ('n2-grammar-150', $$会議は直ちに中止された。$$, $$かいぎはただちにちゅうしされた。$$, $$A reunião foi cancelada imediatamente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$地震が起きたら、____火を消してください。$$, $$Se houver um terremoto, apague o fogo imediatamente.$$),
        (2, $$警察は____調査を始めた。$$, $$A polícia começou a investigação imediatamente.$$),
        (3, $$異常があれば、____連絡してください。$$, $$Se houver alguma anormalidade, entre em contato sem demora.$$),
        (4, $$命令を受けて、兵士たちは____出発した。$$, $$Ao receber a ordem, os soldados partiram imediatamente.$$),
        (5, $$けが人は____病院に運ばれた。$$, $$Os feridos foram levados imediatamente ao hospital.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-150', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$直ちに$$),
        (1, $$ただちに$$),
        (2, $$直ちに$$),
        (2, $$ただちに$$),
        (3, $$直ちに$$),
        (3, $$ただちに$$),
        (4, $$直ちに$$),
        (4, $$ただちに$$),
        (5, $$直ちに$$),
        (5, $$ただちに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
