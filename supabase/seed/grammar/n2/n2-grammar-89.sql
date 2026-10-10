-- n2-grammar-89 — 〜に限る
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-89',
    'grammar',
    'N2',
    $$〜に限る$$,
    $$ni kagiru$$,
    $$O melhor é / Nada como / Não há nada melhor que$$,
    $$に限る expressa a opinião pessoal de que algo é a melhor opção numa situação. Equivale a "o melhor é" ou "nada como".

Por exemplo, "num dia quente, nada como uma cerveja gelada" ou "quando se está cansado, o melhor é dormir".

Também pode significar "limitado a", em avisos e regras, como "limitado a membros".$$,
    $$No uso de opinião, a frase costuma começar com uma situação, como 疲れた時は ou 夏は.

No uso de limite, aparece em avisos, como 会員に限る ou 先着百名に限る.$$,
    $$Substantivo + に限る
Verbo (forma dicionário / forma ない) + に限る$$,
    $$に限る$$,
    $$に限る|にかぎる|に限ります|に限り$$,
    ARRAY['に', '限る']::text[],
    ARRAY['に限る', 'にかぎる', 'に限ります', 'に限り']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-89', $$暑い日は冷たいビールに限る。$$, $$あついひはつめたいビールにかぎる。$$, $$Num dia quente, nada como uma cerveja gelada.$$),
    ('n2-grammar-89', $$疲れた時は、早く寝るに限る。$$, $$つかれたときは、はやくねるにかぎる。$$, $$Quando se está cansado, o melhor é dormir cedo.$$),
    ('n2-grammar-89', $$風邪をひいたら、家で休むに限ります。$$, $$かぜをひいたら、いえでやすむにかぎります。$$, $$Quando se pega resfriado, o melhor é descansar em casa.$$),
    ('n2-grammar-89', $$面倒なことには関わらないに限る。$$, $$めんどうなことにはかかわらないにかぎる。$$, $$O melhor é não se envolver em coisas complicadas.$$),
    ('n2-grammar-89', $$参加は会員に限ります。$$, $$さんかはかいいんにかぎります。$$, $$A participação é limitada a membros.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$寒い日は温泉____。$$, $$Num dia frio, nada como uma fonte termal.$$),
        (2, $$ストレスがたまった時は、カラオケで歌う____。$$, $$Quando o estresse acumula, o melhor é cantar no karaokê.$$),
        (3, $$夏はやっぱりスイカ____。$$, $$No verão, nada como melancia.$$),
        (4, $$怪しいメールは開かない____。$$, $$O melhor é não abrir e-mails suspeitos.$$),
        (5, $$旅行は気の合う友達と行く____。$$, $$Para viajar, o melhor é ir com amigos com quem se tem afinidade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-89', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に限る$$),
        (1, $$にかぎる$$),
        (1, $$に限ります$$),
        (2, $$に限る$$),
        (2, $$にかぎる$$),
        (2, $$に限ります$$),
        (3, $$に限る$$),
        (3, $$にかぎる$$),
        (3, $$に限ります$$),
        (4, $$に限る$$),
        (4, $$にかぎる$$),
        (4, $$に限ります$$),
        (5, $$に限る$$),
        (5, $$にかぎる$$),
        (5, $$に限ります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
