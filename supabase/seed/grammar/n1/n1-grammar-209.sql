-- n1-grammar-209 — 〜といわず〜といわず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-209',
    'grammar',
    'N1',
    $$〜といわず〜といわず$$,
    $$to iwazu ~ to iwazu$$,
    $$Tanto... quanto / Por todo lado / Sem distinção$$,
    $$といわず〜といわず indica que algo acontece em todos os lugares ou partes, sem exceção. Equivale a "tanto... quanto" ou "por todo lado".

A pessoa dá dois exemplos para mostrar que a situação se aplica a tudo. Por exemplo, "tanto as mãos quanto o rosto ficaram cobertos de lama".

É uma expressão um pouco literária.$$,
    $$Os dois substantivos costumam ser partes de um todo, como partes do corpo, lugares ou horários.

É parecido com も〜も, mas mais enfático.$$,
    $$Substantivo + といわず + Substantivo + といわず$$,
    $$といわず〜といわず$$,
    $$といわず|と言わず$$,
    ARRAY['と', 'いわず']::text[],
    ARRAY['といわず〜といわず', 'と言わず〜と言わず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-209', $$子供は手といわず顔といわず、泥だらけだった。$$, $$こどもはてといわずかおといわず、どろだらけだった。$$, $$A criança estava coberta de lama, tanto nas mãos quanto no rosto.$$),
    ('n1-grammar-209', $$彼は昼といわず夜といわず、働き続けた。$$, $$かれはひるといわずよるといわず、はたらきつづけた。$$, $$Ele trabalhou sem parar, tanto de dia quanto de noite.$$),
    ('n1-grammar-209', $$部屋といわず廊下といわず、本が積んである。$$, $$へやといわずろうかといわず、ほんがつんである。$$, $$Há livros empilhados por todo lado, tanto no quarto quanto no corredor.$$),
    ('n1-grammar-209', $$平日といわず週末といわず、店はいつも混んでいる。$$, $$へいじつといわずしゅうまつといわず、みせはいつもこんでいる。$$, $$A loja está sempre cheia, tanto nos dias úteis quanto no fim de semana.$$),
    ('n1-grammar-209', $$机の上といわず床の上といわず、ごみが散らかっている。$$, $$つくえのうえといわずゆかのうえといわず、ごみがちらかっている。$$, $$Há lixo espalhado por todo lado, tanto em cima da mesa quanto no chão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$蚊に刺されて、腕____足といわず、かゆい。$$, $$Fui picado por mosquitos e coça tudo, tanto os braços quanto as pernas.$$),
        (2, $$彼女は家の中といわず外____、いつも歌っている。$$, $$Ela está sempre cantando, tanto dentro de casa quanto fora.$$),
        (3, $$雨の日____晴れの日といわず、彼は毎日走っている。$$, $$Ele corre todos os dias, tanto com chuva quanto com sol.$$),
        (4, $$壁といわず天井____、落書きだらけだ。$$, $$Está tudo coberto de pichações, tanto as paredes quanto o teto.$$),
        (5, $$朝____夜といわず、電話がかかってくる。$$, $$As ligações chegam a qualquer hora, de manhã ou à noite.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-209', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$といわず$$),
        (1, $$と言わず$$),
        (2, $$といわず$$),
        (2, $$と言わず$$),
        (3, $$といわず$$),
        (3, $$と言わず$$),
        (4, $$といわず$$),
        (4, $$と言わず$$),
        (5, $$といわず$$),
        (5, $$と言わず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
