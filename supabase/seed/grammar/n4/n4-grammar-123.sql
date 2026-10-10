-- n4-grammar-123 — 〜予定だ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-123',
    'grammar',
    'N4',
    $$〜予定だ$$,
    $$yotei da$$,
    $$Estar previsto / Ter planejado / Estar programado$$,
    $$予定だ é usado para falar de planos e programações já definidos. Equivale a "está previsto que", "tenho planejado" ou "está programado".

予定 significa "plano" ou "programação". Ele indica algo concreto e agendado, como uma viagem com data marcada, o horário de uma reunião ou a chegada de um voo.

Ele vem depois do verbo na forma de dicionário. Com substantivos, usa-se の: 出張の予定.

A diferença em relação a つもり é o grau de concretude. つもり é uma intenção pessoal; 予定 é um plano mais definido, muitas vezes compartilhado com outras pessoas ou com data marcada.

No passado, 予定でした indica algo que estava programado, mas que muitas vezes não aconteceu como previsto.$$,
    $$Como substantivo, 予定 é muito usado em perguntas como 明日の予定は? ("quais são os planos para amanhã?").

Para dizer que você está livre, usa-se 予定がない ou 予定はありません.

Em avisos e notícias, 予定 aparece muito para informar horários e datas oficiais.$$,
    $$Verbo na forma de dicionário + 予定だ / 予定です
Substantivo + の + 予定だ
Passado: 予定だった / 予定でした

Escrita: 予定 / よてい$$,
    $$予定$$,
    $$予定|よてい$$,
    ARRAY['予定', 'だ']::text[],
    ARRAY['予定だ', '予定です', '予定だった', '予定でした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-123', $$来月、京都へ行く予定です。$$, $$らいげつ、きょうとへいくよていです。$$, $$Mês que vem, vou a Kyoto, está planejado.$$),
    ('n4-grammar-123', $$会議は三時に始まる予定だ。$$, $$かいぎはさんじにはじまるよていだ。$$, $$A reunião está prevista para começar às três.$$),
    ('n4-grammar-123', $$明日の予定は何ですか。$$, $$あしたのよていはなんですか。$$, $$Quais são os planos para amanhã?$$),
    ('n4-grammar-123', $$飛行機は十時に着く予定でしたが、遅れました。$$, $$ひこうきはじゅうじにつくよていでしたが、おくれました。$$, $$O avião estava previsto para chegar às dez, mas atrasou.$$),
    ('n4-grammar-123', $$来年の春、結婚する予定です。$$, $$らいねんのはる、けっこんするよていです。$$, $$Está previsto que eu me case na primavera do ano que vem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$来週、大阪に出張する____です。$$, $$Semana que vem, está prevista uma viagem a trabalho para Osaka.$$),
        (2, $$新しい駅は来年完成する____だ。$$, $$A nova estação está prevista para ficar pronta no ano que vem.$$),
        (3, $$夏休みは北海道を旅行する____です。$$, $$Nas férias de verão, tenho planejado viajar por Hokkaido.$$),
        (4, $$電車は八時に出発する____でしたが、遅れています。$$, $$O trem estava previsto para sair às oito, mas está atrasado.$$),
        (5, $$週末は何をする____ですか。$$, $$O que você tem planejado para o fim de semana?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-123', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$予定$$),
        (1, $$よてい$$),
        (2, $$予定$$),
        (2, $$よてい$$),
        (3, $$予定$$),
        (3, $$よてい$$),
        (4, $$予定$$),
        (4, $$よてい$$),
        (5, $$予定$$),
        (5, $$よてい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
