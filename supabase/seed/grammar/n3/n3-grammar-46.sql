-- n3-grammar-46 — 〜込む
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-46',
    'grammar',
    'N3',
    $$〜込む$$,
    $$komu$$,
    $$Para dentro / Profundamente / Por completo$$,
    $$込む, ligado a outro verbo, acrescenta a ideia de "para dentro" ou de algo feito de forma intensa e profunda.

A estrutura junta o verbo na forma ます sem ます com 込む. O resultado funciona como um verbo do grupo 1.

Os usos principais são:
• Movimento para dentro: 入り込む (entrar em algum lugar), 飛び込む (pular para dentro), 駆け込む (entrar correndo).
• Inserir algo: 書き込む (preencher, escrever dentro de um espaço), 詰め込む (encher, abarrotar).
• Ação intensa ou prolongada: 考え込む (ficar pensativo, absorto), 話し込む (ficar conversando por muito tempo), 落ち込む (ficar deprimido, abatido).

Algumas combinações viraram palavras próprias, com sentidos que vão além da soma das partes.$$,
    $$申し込む (inscrever-se, solicitar) e 落ち込む (ficar desanimado) são combinações muito usadas no dia a dia.

Sozinho, 込む significa "ficar lotado", como em 電車が込んでいる (o trem está lotado), geralmente escrito 混む.

Na internet, 書き込み é usado para "postagem" ou "comentário".$$,
    $$Verbo na forma ます sem ます + 込む

Passado: 込んだ / 込みました
Forma て: 込んで

Combinações comuns: 飛び込む / 駆け込む / 入り込む / 書き込む / 考え込む / 話し込む / 落ち込む / 申し込む$$,
    $$込む$$,
    $$込$$,
    ARRAY['込む']::text[],
    ARRAY['込む', '込んだ', '込みました', '込んで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-46', $$ドアが閉まる直前に、電車に駆け込んだ。$$, $$ドアがしまるちょくぜんに、でんしゃにかけこんだ。$$, $$Entrei correndo no trem logo antes de as portas fecharem.$$),
    ('n3-grammar-46', $$部屋に知らない人が入り込んでいた。$$, $$へやにしらないひとがはいりこんでいた。$$, $$Uma pessoa desconhecida tinha entrado no quarto.$$),
    ('n3-grammar-46', $$彼は何か考え込んでいる。$$, $$かれはなにかかんがえこんでいる。$$, $$Ele está absorto em algum pensamento.$$),
    ('n3-grammar-46', $$この書類に名前を書き込んでください。$$, $$このしょるいになまえをかきこんでください。$$, $$Preencha seu nome neste documento, por favor.$$),
    ('n3-grammar-46', $$犬が川に飛び込んだ。$$, $$いぬがかわにとびこんだ。$$, $$O cachorro pulou no rio.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供がプールに飛び____。$$, $$A criança pulou na piscina.$$),
        (2, $$彼女は友達と電話で長い間話し____いた。$$, $$Ela ficou um tempão conversando com a amiga ao telefone.$$),
        (3, $$雨が窓から吹き____きた。$$, $$A chuva entrou pela janela com o vento.$$),
        (4, $$申込書に必要事項を書き____ください。$$, $$Preencha os dados necessários no formulário de inscrição.$$),
        (5, $$授業に遅れそうで、教室に駆け____。$$, $$Estava quase atrasado para a aula e entrei correndo na sala.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-46', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$込んだ$$),
        (1, $$込みました$$),
        (2, $$込んで$$),
        (3, $$込んで$$),
        (4, $$込んで$$),
        (5, $$込んだ$$),
        (5, $$込みました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
