-- n4-grammar-30 — 〜かな
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-30',
    'grammar',
    'N4',
    $$〜かな$$,
    $$kana$$,
    $$Será que...? / Fico pensando se...$$,
    $$かな é uma partícula de final de frase que expressa dúvida, curiosidade ou reflexão. Equivale a "será que...?" ou "fico pensando se...".

Muitas vezes, a pessoa fala consigo mesma, pensando em voz alta. Mas かな também pode ser usado numa conversa, para fazer uma pergunta de forma leve, sem pressionar o outro.

Com a forma volitiva, como 食べようかな, expressa uma decisão que ainda está sendo pensada: "acho que vou comer...".

Com ないかな, pode expressar um desejo ("tomara que...") ou um pedido indireto ("será que você não poderia...?").

かな é informal e usado por homens e mulheres. A versão かなあ é mais reflexiva.$$,
    $$かな tem o mesmo sentido de かしら, mas かな é neutro quanto ao gênero e muito mais comum hoje.

Em situações formais, o equivalente é でしょうか.

Usar かな numa pergunta direta a alguém deixa a frase mais suave e menos insistente.$$,
    $$Verbo / Adjetivo い (forma simples) + かな
Substantivo / Adjetivo な + かな
Forma volitiva + かな (acho que vou...)
Verbo ない / てくれない + かな (desejo / pedido indireto)

Variação: かなあ$$,
    $$かな$$,
    $$かな|かなあ$$,
    ARRAY['かな']::text[],
    ARRAY['かな', 'かなあ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-30', $$明日は晴れるかな。$$, $$あしたははれるかな。$$, $$Será que amanhã vai fazer sol?$$),
    ('n4-grammar-30', $$田中さんは来るかな。$$, $$たなかさんはくるかな。$$, $$Será que o Tanaka vem?$$),
    ('n4-grammar-30', $$このケーキ、おいしいかな。$$, $$このケーキ、おいしいかな。$$, $$Será que este bolo está gostoso?$$),
    ('n4-grammar-30', $$今日の昼ご飯は何を食べようかな。$$, $$きょうのひるごはんはなにをたべようかな。$$, $$O que será que eu como no almoço hoje?$$),
    ('n4-grammar-30', $$ちょっと手伝ってくれないかな。$$, $$ちょっとてつだってくれないかな。$$, $$Será que você poderia me ajudar um pouco?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$誕生日に何をもらえる____。$$, $$O que será que vou ganhar de aniversário?$$),
        (2, $$この答えで合っている____。$$, $$Será que esta resposta está certa?$$),
        (3, $$次の電車は何時に来る____。$$, $$A que horas será que vem o próximo trem?$$),
        (4, $$週末、どこへ行こう____。$$, $$Aonde será que eu vou no fim de semana?$$),
        (5, $$暑いね。窓を開けてくれない____。$$, $$Está quente. Será que você poderia abrir a janela?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-30', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かな$$),
        (1, $$かなあ$$),
        (2, $$かな$$),
        (2, $$かなあ$$),
        (3, $$かな$$),
        (3, $$かなあ$$),
        (4, $$かな$$),
        (4, $$かなあ$$),
        (5, $$かな$$),
        (5, $$かなあ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
