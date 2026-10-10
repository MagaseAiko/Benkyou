-- n5-grammar-06 — でも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-06',
    'grammar',
    'N5',
    $$でも$$,
    $$demo$$,
    $$Mas / Porém / Mesmo assim$$,
    $$No nível N5, でも é aprendido principalmente como uma conjunção que fica no começo da frase e significa "mas" ou "porém".

Ele liga duas ideias que se contrastam. Primeiro você diz uma frase, termina com ponto, e começa a próxima com でも para mostrar que vem uma informação contrária ou inesperada.

É uma palavra muito usada na conversa e serve tanto em situações informais quanto em situações educadas. Em textos mais formais e escritos, palavras como しかし são mais comuns.

A diferença para けど é a posição: けど normalmente fica no final da primeira parte, juntando tudo em uma frase só, enquanto でも começa uma nova frase.$$,
    $$でも também tem outros usos que aparecem em níveis seguintes. Depois de substantivos, ele pode significar "até mesmo" ou "ou algo assim", como em uma sugestão leve. São usos diferentes da conjunção do começo da frase.

Na conversa, でも também é usado para responder a algo que o outro disse, introduzindo uma objeção ou uma ressalva.

Começar frases com でも o tempo todo pode soar como se a pessoa estivesse sempre discordando ou dando desculpas, então vale usar com equilíbrio.$$,
    $$Frase 1 (terminada com ponto final) + でも、 + Frase 2
でも sempre no começo da segunda frase$$,
    $$でも$$,
    $$でも$$,
    ARRAY['でも']::text[],
    ARRAY['でも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-06', $$日本語は難しいです。でも、楽しいです。$$, $$にほんごはむずかしいです。でも、たのしいです。$$, $$Japonês é difícil. Mas é divertido.$$),
    ('n5-grammar-06', $$雨が降っていました。でも、出かけました。$$, $$あめがふっていました。でも、でかけました。$$, $$Estava chovendo. Mas eu saí mesmo assim.$$),
    ('n5-grammar-06', $$このレストランは安いです。でも、あまりおいしくないです。$$, $$このレストランはやすいです。でも、あまりおいしくないです。$$, $$Este restaurante é barato. Mas não é muito gostoso.$$),
    ('n5-grammar-06', $$行きたいです。でも、時間がありません。$$, $$いきたいです。でも、じかんがありません。$$, $$Eu quero ir. Mas não tenho tempo.$$),
    ('n5-grammar-06', $$「明日、映画を見に行かない？」「いいね。でも、何時から？」$$, $$「あした、えいがをみにいかない？」「いいね。でも、なんじから？」$$, $$"Vamos ver um filme amanhã?" "Legal. Mas a partir de que horas?"$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$肉は好きです。____、魚はあまり好きじゃありません。$$, $$Gosto de carne. Mas não gosto muito de peixe.$$),
        (2, $$一生懸命勉強しました。____、試験は難しかったです。$$, $$Estudei muito. Mas a prova foi difícil.$$),
        (3, $$この服はかわいいです。____、ちょっと高いです。$$, $$Esta roupa é bonitinha. Mas é um pouco cara.$$),
        (4, $$昨日はとても疲れていました。____、パーティーに行きました。$$, $$Ontem eu estava muito cansado. Mas fui à festa.$$),
        (5, $$「一緒に行こうよ。」「うん。____、ちょっと待って。」$$, $$"Vamos juntos!" "Tá. Mas espera um pouco."$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-06', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でも$$),
        (2, $$でも$$),
        (3, $$でも$$),
        (4, $$でも$$),
        (5, $$でも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
