-- n1-grammar-77 — 〜もさることながら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-77',
    'grammar',
    'N1',
    $$〜もさることながら$$,
    $$mo saru koto nagara$$,
    $$Não só... mas também / Além de / Tanto quanto$$,
    $$もさることながら indica que algo é importante, mas outra coisa é ainda mais importante ou também merece atenção. Equivale a "não só..., mas também" ou "além de".

A primeira parte é algo reconhecido, e a segunda é o ponto principal. Por exemplo, "o sabor, é claro, mas o atendimento também é excelente".

É uma expressão formal, comum em textos e elogios.$$,
    $$É parecido com はもちろん e はもとより, mas もさることながら dá mais destaque à segunda parte.

Costuma ser usado para elogiar.$$,
    $$Substantivo + もさることながら + Substantivo + も$$,
    $$もさることながら$$,
    $$もさることながら$$,
    ARRAY['も', 'さる', 'こと', 'ながら']::text[],
    ARRAY['もさることながら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-77', $$この店は味もさることながら、サービスも素晴らしい。$$, $$このみせはあじもさることながら、サービスもすばらしい。$$, $$Esta loja tem não só um bom sabor, mas também um atendimento excelente.$$),
    ('n1-grammar-77', $$彼女は外見もさることながら、性格もいい。$$, $$かのじょはがいけんもさることながら、せいかくもいい。$$, $$Ela é bonita e, além disso, tem um ótimo caráter.$$),
    ('n1-grammar-77', $$この映画はストーリーもさることながら、音楽も印象的だ。$$, $$このえいがはストーリーもさることながら、おんがくもいんしょうてきだ。$$, $$Este filme tem não só uma boa história, mas também uma música marcante.$$),
    ('n1-grammar-77', $$結果もさることながら、努力の過程が大切だ。$$, $$けっかもさることながら、どりょくのかていがたいせつだ。$$, $$O resultado importa, mas o processo de esforço também é importante.$$),
    ('n1-grammar-77', $$この車は性能もさることながら、デザインも美しい。$$, $$このくるまはせいのうもさることながら、デザインもうつくしい。$$, $$Este carro tem não só bom desempenho, mas também um design bonito.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼の作品は技術____、アイデアも面白い。$$, $$As obras dele têm não só técnica, mas também ideias interessantes.$$),
        (2, $$このホテルは景色____、料理もおいしい。$$, $$Este hotel tem não só uma bela vista, mas também comida gostosa.$$),
        (3, $$能力____、やる気も重要だ。$$, $$Além da capacidade, a motivação também é importante.$$),
        (4, $$値段の安さ____、品質の良さも人気の理由だ。$$, $$Não só o preço baixo, mas também a boa qualidade é motivo do sucesso.$$),
        (5, $$彼女は歌____、ダンスも一流だ。$$, $$Ela é de primeira não só no canto, mas também na dança.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-77', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もさることながら$$),
        (2, $$もさることながら$$),
        (3, $$もさることながら$$),
        (4, $$もさることながら$$),
        (5, $$もさることながら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
