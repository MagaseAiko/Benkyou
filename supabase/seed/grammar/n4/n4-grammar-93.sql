-- n4-grammar-93 — 〜ていく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-93',
    'grammar',
    'N4',
    $$〜ていく$$,
    $$te iku$$,
    $$Ir (fazendo) / Levar / Daqui em diante$$,
    $$ていく junta a forma て de um verbo com 行く (ir). A ideia central é movimento ou mudança que se afasta de quem fala, no espaço ou no tempo.

Os usos principais são:
• Fazer algo e ir: fazer uma ação antes de sair, ou ir de certo modo, como ir a pé.
• Levar algo ou alguém: 持っていく (levar uma coisa), 連れていく (levar uma pessoa).
• Movimento para longe: algo que se afasta de quem fala, como pássaros voando para longe.
• Mudança daqui para o futuro: algo que vai continuar mudando ou acontecendo a partir de agora, como esfriar cada vez mais ou continuar estudando.

O oposto é てくる, que indica movimento ou mudança em direção a quem fala, ou do passado até agora.$$,
    $$No uso de mudança, ていく olha para o futuro: "daqui para frente". てくる olha do passado até agora: "vem mudando até hoje".

Na escrita, quando ていく tem sentido abstrato (mudança no tempo), costuma ser escrito em hiragana.

Na fala casual, ていく às vezes vira てく, como em 持ってく.$$,
    $$Verbo na forma て + いく

Educado: ていきます
Passado: ていった / ていきました

Escrita: ていく / て行く$$,
    $$ていく$$,
    $$ていく|ていき|ていっ|でいく|でいき|でいっ|て行|で行$$,
    ARRAY['て', 'いく']::text[],
    ARRAY['ていく', 'ていきます', 'ていった', 'て行く']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-93', $$雨が降るから、傘を持っていってください。$$, $$あめがふるから、かさをもっていってください。$$, $$Vai chover, então leve o guarda-chuva.$$),
    ('n4-grammar-93', $$駅まで歩いていきます。$$, $$えきまであるいていきます。$$, $$Vou a pé até a estação.$$),
    ('n4-grammar-93', $$これからも日本語の勉強を続けていきたい。$$, $$これからもにほんごのべんきょうをつづけていきたい。$$, $$Daqui em diante, quero continuar estudando japonês.$$),
    ('n4-grammar-93', $$これから寒くなっていくので、体に気をつけてください。$$, $$これからさむくなっていくので、からだにきをつけてください。$$, $$Daqui para frente vai esfriar cada vez mais, então cuide da saúde.$$),
    ('n4-grammar-93', $$鳥が南へ飛んでいった。$$, $$とりがみなみへとんでいった。$$, $$Os pássaros foram voando para o sul.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨が降りそうだから、傘を持っ____ほうがいいよ。$$, $$Parece que vai chover, então é melhor levar o guarda-chuva.$$),
        (2, $$学校までバスに乗っ____。$$, $$Vou de ônibus até a escola.$$),
        (3, $$これから日本の人口は減っ____でしょう。$$, $$Daqui em diante, a população do Japão deve continuar diminuindo.$$),
        (4, $$子供たちは公園へ走っ____。$$, $$As crianças foram correndo para o parque.$$),
        (5, $$せっかくだから、ここで朝ご飯を食べ____ませんか。$$, $$Já que estamos aqui, que tal tomar café da manhã antes de ir?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-93', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ていった$$),
        (2, $$ていきます$$),
        (2, $$ていく$$),
        (3, $$ていく$$),
        (4, $$ていきました$$),
        (4, $$ていった$$),
        (5, $$ていき$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
