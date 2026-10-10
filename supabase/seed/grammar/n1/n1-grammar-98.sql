-- n1-grammar-98 — 〜ならいざしらず / 〜はいざしらず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-98',
    'grammar',
    'N1',
    $$〜ならいざしらず / 〜はいざしらず$$,
    $$nara iza shirazu / wa iza shirazu$$,
    $$Se fosse... até entenderia / Não sei quanto a / Seria outra história se$$,
    $$ならいざしらず indica que um caso seria compreensível, mas o caso atual não é. Equivale a "se fosse..., até entenderia, mas" ou "seria outra história se...".

A primeira parte mostra uma situação em que algo seria aceitável, e a segunda mostra que, na realidade, aquilo não é aceitável. Por exemplo, "se fosse uma criança, até entenderia, mas um adulto fazer isso...".

É uma expressão formal, com tom de crítica.$$,
    $$É parecido com ならともかく e ならまだしも.

いざしらず significa literalmente "não sei", por isso o sentido é "não sei quanto a isso, mas...".$$,
    $$Substantivo + ならいざしらず
Substantivo + はいざしらず
Verbo (forma simples) + なら + いざしらず$$,
    $$ならいざしらず$$,
    $$ならいざしらず|はいざしらず|ならいざ知らず|はいざ知らず$$,
    ARRAY['なら', 'いざ', 'しらず']::text[],
    ARRAY['ならいざしらず', 'はいざしらず', 'ならいざ知らず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-98', $$子供ならいざしらず、大人がそんなことをするなんて。$$, $$こどもならいざしらず、おとながそんなことをするなんて。$$, $$Se fosse uma criança, até entenderia, mas um adulto fazer uma coisa dessas...$$),
    ('n1-grammar-98', $$昔はいざしらず、今は誰でも海外旅行ができる。$$, $$むかしはいざしらず、いまはだれでもかいがいりょこうができる。$$, $$Não sei quanto a antigamente, mas hoje qualquer um pode viajar para o exterior.$$),
    ('n1-grammar-98', $$初心者ならいざしらず、プロがこんなミスをするとは。$$, $$しょしんしゃならいざしらず、プロがこんなミスをするとは。$$, $$Se fosse um iniciante, até entenderia, mas um profissional cometer um erro desses...$$),
    ('n1-grammar-98', $$一回ならいざしらず、何度も同じ失敗をするのは問題だ。$$, $$いっかいならいざしらず、なんどもおなじしっぱいをするのはもんだいだ。$$, $$Uma vez ainda passava, mas repetir o mesmo erro várias vezes é um problema.$$),
    ('n1-grammar-98', $$他の人はいざしらず、私は反対だ。$$, $$ほかのひとはいざしらず、わたしははんたいだ。$$, $$Não sei quanto aos outros, mas eu sou contra.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$知らなかった____、知っていて黙っていたのは許せない。$$, $$Se não soubesse, até entenderia, mas saber e ficar calado é imperdoável.$$),
        (2, $$学生____、社会人なら時間を守るべきだ。$$, $$Se fosse estudante, até entenderia, mas um profissional deve ser pontual.$$),
        (3, $$平日____、日曜日に会社に行くなんて。$$, $$Se fosse dia útil, tudo bem, mas ir à empresa num domingo...$$),
        (4, $$他の国____、日本では考えられないことだ。$$, $$Não sei quanto a outros países, mas no Japão isso é impensável.$$),
        (5, $$簡単な問題____、こんな難しい問題は解けない。$$, $$Se fosse um problema fácil, seria outra história, mas um problema tão difícil não dá para resolver.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-98', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ならいざしらず$$),
        (1, $$ならいざ知らず$$),
        (2, $$ならいざしらず$$),
        (2, $$ならいざ知らず$$),
        (3, $$ならいざしらず$$),
        (3, $$ならいざ知らず$$),
        (4, $$はいざしらず$$),
        (4, $$はいざ知らず$$),
        (5, $$ならいざしらず$$),
        (5, $$ならいざ知らず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
