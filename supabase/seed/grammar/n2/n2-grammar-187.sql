-- n2-grammar-187 — よほど / よっぽど
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-187',
    'grammar',
    'N2',
    $$よほど / よっぽど$$,
    $$yohodo / yoppodo$$,
    $$Muito / Bastante / Deve ser muito$$,
    $$よほど ou よっぽど tem alguns usos importantes.

O primeiro indica um grau muito alto, geralmente numa suposição baseada em algo observado. Equivale a "deve ser muito...". Por exemplo, "ele dormiu na hora, deve estar muito cansado". Muitas vezes vem com らしい ou のだろう.

O segundo, em comparações, significa "bem mais" ou "muito mais". Por exemplo, "é bem mais barato comprar pela internet".

よっぽど é a forma mais coloquial.$$,
    $$A forma よほどのことがない限り significa "a não ser que aconteça algo muito sério".

É parecido com かなり e ずっと, mas よほど costuma vir com suposição.$$,
    $$よほど / よっぽど + Adjetivo / Verbo + らしい / のだろう
Substantivo + より + よほど / よっぽど + Adjetivo
よほどの + Substantivo$$,
    $$よほど$$,
    $$よほど|よっぽど$$,
    ARRAY['よほど']::text[],
    ARRAY['よほど', 'よっぽど', 'よほどの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-187', $$すぐに寝てしまった。よほど疲れていたのだろう。$$, $$すぐにねてしまった。よほどつかれていたのだろう。$$, $$Dormiu na hora. Devia estar muito cansado.$$),
    ('n2-grammar-187', $$こんなに笑うなんて、よっぽど面白かったんだね。$$, $$こんなにわらうなんて、よっぽどおもしろかったんだね。$$, $$Rindo tanto assim, devia estar muito engraçado, né?$$),
    ('n2-grammar-187', $$ネットで買ったほうがよほど安い。$$, $$ネットでかったほうがよほどやすい。$$, $$É bem mais barato comprar pela internet.$$),
    ('n2-grammar-187', $$よほどのことがない限り、試合は中止にならない。$$, $$よほどのことがないかぎり、しあいはちゅうしにならない。$$, $$A não ser que aconteça algo muito sério, a partida não será cancelada.$$),
    ('n2-grammar-187', $$彼は一言も話さない。よほど緊張しているらしい。$$, $$かれはひとこともはなさない。よほどきんちょうしているらしい。$$, $$Ele não diz nenhuma palavra. Parece estar muito nervoso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女が泣くなんて、____悲しかったのだろう。$$, $$Ela chorando assim, devia estar muito triste.$$),
        (2, $$一人でするより、二人でしたほうが____早い。$$, $$É bem mais rápido fazer em dois do que sozinho.$$),
        (3, $$全部食べた。____お腹がすいていたらしい。$$, $$Comeu tudo. Parece que estava com muita fome.$$),
        (4, $$____の理由がなければ、休んではいけない。$$, $$Sem um motivo muito sério, não se pode faltar.$$),
        (5, $$こんなに早く来るなんて、____楽しみにしていたんだね。$$, $$Chegou tão cedo, devia estar muito ansioso por isso, né?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-187', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$よほど$$),
        (1, $$よっぽど$$),
        (2, $$よほど$$),
        (2, $$よっぽど$$),
        (3, $$よほど$$),
        (3, $$よっぽど$$),
        (4, $$よほど$$),
        (4, $$よっぽど$$),
        (5, $$よほど$$),
        (5, $$よっぽど$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
