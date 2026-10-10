-- n5-grammar-91 — 〜から〜まで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-91',
    'grammar',
    'N5',
    $$〜から〜まで$$,
    $$kara ~ made$$,
    $$De... até... / Desde... até...$$,
    $$から〜まで é usado para indicar o começo e o fim de algo, seja no espaço ou no tempo. Equivale a "de... até...".

から marca o ponto de partida, e まで marca o ponto final. Juntos, eles mostram um intervalo completo: de um lugar a outro, de um horário a outro, de um dia a outro.

É muito usado para falar de horários de funcionamento, trajetos, períodos de férias e duração de atividades.

Também pode indicar a abrangência de um grupo, com o sentido de "desde... até...", mostrando que todos dentro daquele intervalo estão incluídos.$$,
    $$Também é possível usar só から ou só まで quando um dos pontos já está claro pelo contexto.

Para dizer quanto tempo leva um trajeto, a estrutura costuma terminar com かかります.

Lembre que まで indica algo contínuo até o fim. Para prazos, como "entregar até sexta", usa-se までに.$$,
    $$Lugar A + から + Lugar B + まで
Tempo A + から + Tempo B + まで
Substantivo A + から + Substantivo B + まで + です$$,
    $$から$$,
    $$から|まで$$,
    ARRAY['から', 'まで']::text[],
    ARRAY['から', 'まで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-91', $$授業は九時から三時までです。$$, $$じゅぎょうはくじからさんじまでです。$$, $$As aulas são das nove às três.$$),
    ('n5-grammar-91', $$家から駅まで歩いて十分です。$$, $$いえからえきまであるいてじっぷんです。$$, $$De casa até a estação são dez minutos a pé.$$),
    ('n5-grammar-91', $$月曜日から金曜日まで働きます。$$, $$げつようびからきんようびまではたらきます。$$, $$Trabalho de segunda a sexta.$$),
    ('n5-grammar-91', $$東京から大阪まで新幹線で二時間半かかります。$$, $$とうきょうからおおさかまでしんかんせんでにじかんはんかかります。$$, $$De Tóquio até Osaka leva duas horas e meia de trem-bala.$$),
    ('n5-grammar-91', $$夏休みは七月二十日から八月三十一日までです。$$, $$なつやすみはしちがつはつかからはちがつさんじゅういちにちまでです。$$, $$As férias de verão vão de 20 de julho até 31 de agosto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$銀行は九時____三時までです。$$, $$O banco funciona das nove às três.$$),
        (2, $$家から学校____自転車で行きます。$$, $$Vou de casa até a escola de bicicleta.$$),
        (3, $$東京____京都まで、新幹線で行きました。$$, $$Fui de Tóquio até Kyoto de trem-bala.$$),
        (4, $$昼休みは十二時から一時____です。$$, $$O intervalo de almoço é do meio-dia à uma.$$),
        (5, $$このお祭りには、子供____お年寄りまで、たくさんの人が来ます。$$, $$Neste festival vêm muitas pessoas, das crianças aos idosos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-91', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$から$$),
        (2, $$まで$$),
        (3, $$から$$),
        (4, $$まで$$),
        (5, $$から$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
