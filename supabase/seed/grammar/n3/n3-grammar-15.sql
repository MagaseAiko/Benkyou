-- n3-grammar-15 — 〜中（ちゅう・じゅう）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-15',
    'grammar',
    'N3',
    $$〜中（ちゅう・じゅう）$$,
    $$chuu / juu$$,
    $$Durante / Em andamento / O... inteiro / Por todo$$,
    $$中 é um sufixo com dois sentidos principais, e a leitura muda conforme o uso.

Lido ちゅう, ele indica que algo está em andamento ou que algo acontece durante um período. Por exemplo, 会議中 (em reunião), 電話中 (ao telefone), 工事中 (em obras). Também indica um prazo: 今週中に significa "dentro desta semana".

Lido じゅう, ele indica "inteiro" ou "por todo". Com tempo, significa "o tempo todo": 一日中 (o dia inteiro). Com lugares, significa "por todo o lugar": 世界中 (no mundo inteiro).

A leitura depende da palavra que vem antes, e muitas combinações já são fixas no vocabulário.$$,
    $$Algumas palavras admitem as duas leituras com sentidos diferentes: 今日中 lido きょうじゅう significa "ainda hoje", com a ideia de prazo, e é a leitura mais comum.

Em placas, 営業中 (aberto) e 準備中 (em preparação) são muito comuns em lojas e restaurantes.

Para "dentro de" um espaço físico, usa-se の中 (なか), e não esse sufixo.$$,
    $$Substantivo de ação + 中 (ちゅう): em andamento (会議中 / 電話中 / 授業中)
Período + 中 (ちゅう) + に: dentro do prazo (今週中に / 今日中に)
Período + 中 (じゅう): o tempo todo (一日中 / 一年中 / 一晩中)
Lugar + 中 (じゅう): por todo o lugar (世界中 / 日本中 / 町中)$$,
    $$中$$,
    $$中$$,
    ARRAY['中']::text[],
    ARRAY['中', 'ちゅう', 'じゅう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-15', $$会議中は携帯電話を切ってください。$$, $$かいぎちゅうはけいたいでんわをきってください。$$, $$Durante a reunião, desliguem o celular.$$),
    ('n3-grammar-15', $$すみません、父は今、電話中です。$$, $$すみません、ちちはいま、でんわちゅうです。$$, $$Desculpe, meu pai está ao telefone agora.$$),
    ('n3-grammar-15', $$昨日は一日中雨が降っていた。$$, $$きのうはいちにちじゅうあめがふっていた。$$, $$Ontem choveu o dia inteiro.$$),
    ('n3-grammar-15', $$この歌は世界中で人気がある。$$, $$このうたはせかいじゅうでにんきがある。$$, $$Esta música é popular no mundo inteiro.$$),
    ('n3-grammar-15', $$今週中にレポートを出してください。$$, $$こんしゅうちゅうにレポートをだしてください。$$, $$Entregue o relatório até o fim desta semana.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$授業____は静かにしてください。$$, $$Durante a aula, fiquem em silêncio.$$),
        (2, $$夏休み____、ずっとアルバイトをしていた。$$, $$Durante as férias de verão, trabalhei meio período o tempo todo.$$),
        (3, $$このエレベーターは今、点検____です。$$, $$Este elevador está em inspeção agora.$$),
        (4, $$一晩____、赤ちゃんが泣いていた。$$, $$O bebê chorou a noite inteira.$$),
        (5, $$今月____に引っ越しを終わらせたい。$$, $$Quero terminar a mudança ainda este mês.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-15', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$中$$),
        (2, $$中$$),
        (3, $$中$$),
        (4, $$中$$),
        (5, $$中$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
