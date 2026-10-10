-- n3-grammar-137 — 〜といい・〜たらいい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-137',
    'grammar',
    'N3',
    $$〜といい・〜たらいい$$,
    $$to ii / tara ii$$,
    $$Tomara que / Seria bom se / É bom (fazer)$$,
    $$といい e たらいい têm dois usos principais.

O primeiro é expressar um desejo ou esperança: "tomara que..." ou "seria bom se...". Muitas vezes, aparece com ね, なあ ou のに no final. Por exemplo, "tomara que amanhã faça sol" ou "seria bom se eu passasse na prova".

O segundo é dar um conselho ou recomendação: "é bom fazer..." ou "é recomendável...". Por exemplo, "se não entender, é bom perguntar ao professor".

といい vem depois do verbo na forma de dicionário ou na forma ない. たらいい usa a forma たら. Os sentidos são muito parecidos, e ばいい também pode ser usado em muitos casos.

Com のに, といいのに expressa um desejo sobre algo que não está acontecendo, com um tom de lamento.$$,
    $$Para falar do desejo de outra pessoa, é comum dizer といいですね, mostrando que você também torce por ela.

Com o sujeito sendo você mesmo e uma ação que você controla, essas formas soam como conselho a si mesmo.

ばいい, といい e たらいい podem ser trocados em muitos contextos, mas といい soa natural em conselhos gerais.$$,
    $$Verbo (forma de dicionário / ない) + といい + ね / なあ / のに (desejo)
Verbo na forma た + らいい + なあ (desejo)
Verbo (forma de dicionário) + といい + ですよ (conselho)$$,
    $$といい$$,
    $$といい|たらいい|だらいい|ばいい$$,
    ARRAY['と', 'いい']::text[],
    ARRAY['といい', 'たらいい', 'ばいい', 'といいのに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-137', $$明日、晴れるといいですね。$$, $$あした、はれるといいですね。$$, $$Tomara que faça sol amanhã, né?$$),
    ('n3-grammar-137', $$早く元気になるといいね。$$, $$はやくげんきになるといいね。$$, $$Tomara que você melhore logo.$$),
    ('n3-grammar-137', $$わからないことは、先生に聞くといいですよ。$$, $$わからないことは、せんせいにきくといいですよ。$$, $$É bom perguntar ao professor o que você não entende.$$),
    ('n3-grammar-137', $$試験に合格できたらいいなあ。$$, $$しけんにごうかくできたらいいなあ。$$, $$Seria ótimo se eu passasse na prova.$$),
    ('n3-grammar-137', $$疲れたときは、温かいお風呂に入るといい。$$, $$つかれたときは、あたたかいおふろにはいるといい。$$, $$Quando estiver cansado, é bom tomar um banho quente de banheira.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$旅行の日、雨が降らない____ですね。$$, $$Tomara que não chova no dia da viagem, né?$$),
        (2, $$彼女がパーティーに来てくれ____なあ。$$, $$Seria bom se ela viesse à festa.$$),
        (3, $$京都に行くなら、金閣寺を見る____ですよ。$$, $$Se for a Kyoto, é bom ver o Kinkaku-ji.$$),
        (4, $$早く夏休みになる____のに。$$, $$Como seria bom se as férias de verão chegassem logo.$$),
        (5, $$宝くじが当たっ____なあ。$$, $$Seria ótimo se eu ganhasse na loteria.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-137', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$といい$$),
        (2, $$たらいい$$),
        (3, $$といい$$),
        (4, $$といい$$),
        (5, $$たらいい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
