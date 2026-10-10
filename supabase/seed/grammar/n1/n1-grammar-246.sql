-- n1-grammar-246 — 〜ともなると / 〜ともなれば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-246',
    'grammar',
    'N1',
    $$〜ともなると / 〜ともなれば$$,
    $$tomo naru to / tomo nareba$$,
    $$Quando chega a / Ao se tornar / Em se tratando de$$,
    $$ともなると e ともなれば indicam que, quando algo chega a um nível, idade ou posição especial, a situação naturalmente muda. Equivalem a "quando chega a" ou "em se tratando de".

Por exemplo, "quando se chega aos cinquenta anos, o corpo começa a ficar cansado" ou "em se tratando de um presidente, a responsabilidade é enorme".

É uma expressão formal.$$,
    $$É parecido com となると, mas ともなると destaca mais que o nível é alto ou especial.

A segunda parte mostra uma situação natural ou esperada para aquele nível.$$,
    $$Substantivo (idade / posição / época) + ともなると / ともなれば
Verbo (forma dicionário) + ともなると / ともなれば$$,
    $$ともなると$$,
    $$ともなると|ともなれば|ともなったら$$,
    ARRAY['とも', 'なる', 'と']::text[],
    ARRAY['ともなると', 'ともなれば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-246', $$五十歳ともなると、体力が落ちてくる。$$, $$ごじゅっさいともなると、たいりょくがおちてくる。$$, $$Quando se chega aos cinquenta anos, a resistência física começa a cair.$$),
    ('n1-grammar-246', $$社長ともなれば、責任は重い。$$, $$しゃちょうともなれば、せきにんはおもい。$$, $$Em se tratando de um presidente, a responsabilidade é grande.$$),
    ('n1-grammar-246', $$年末ともなると、どこも忙しい。$$, $$ねんまつともなると、どこもいそがしい。$$, $$Quando chega o fim do ano, todo lugar fica atarefado.$$),
    ('n1-grammar-246', $$大学生ともなれば、自分のことは自分でするべきだ。$$, $$だいがくせいともなれば、じぶんのことはじぶんでするべきだ。$$, $$Ao se tornar universitário, deve-se cuidar das próprias coisas.$$),
    ('n1-grammar-246', $$週末ともなると、この公園は家族連れでいっぱいだ。$$, $$しゅうまつともなると、このこうえんはかぞくづれでいっぱいだ。$$, $$Quando chega o fim de semana, este parque fica cheio de famílias.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$プロ____、毎日の練習は欠かせない。$$, $$Em se tratando de um profissional, o treino diário é indispensável.$$),
        (2, $$冬____、この辺りは雪で真っ白になる。$$, $$Quando chega o inverno, esta região fica toda branca de neve.$$),
        (3, $$親____、子供の将来を考えるものだ。$$, $$Ao se tornar pai, a pessoa passa a pensar no futuro dos filhos.$$),
        (4, $$夏休み____、観光地は人であふれる。$$, $$Quando chegam as férias de verão, os pontos turísticos ficam lotados.$$),
        (5, $$七十歳____、無理はできない。$$, $$Quando se chega aos setenta anos, não dá para forçar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-246', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ともなると$$),
        (1, $$ともなれば$$),
        (2, $$ともなると$$),
        (2, $$ともなれば$$),
        (3, $$ともなると$$),
        (3, $$ともなれば$$),
        (4, $$ともなると$$),
        (4, $$ともなれば$$),
        (5, $$ともなると$$),
        (5, $$ともなれば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
