-- n4-grammar-142 — 〜ように言う・〜ように頼む
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-142',
    'grammar',
    'N4',
    $$〜ように言う・〜ように頼む$$,
    $$you ni iu / you ni tanomu$$,
    $$Dizer para (fazer) / Pedir para (fazer)$$,
    $$ように言う e ように頼む são usados para relatar ordens, conselhos ou pedidos feitos a alguém de forma indireta. Equivalem a "dizer para fazer" e "pedir para fazer".

O conteúdo do pedido vem antes de ように, com o verbo na forma de dicionário ou na forma ない. A pessoa que recebe o pedido é marcada com に.

Além de 言う e 頼む, a mesma estrutura funciona com verbos como 注意する (avisar, chamar a atenção), 伝える (transmitir) e お願いする (pedir educadamente).

Na forma passiva, ように言われる significa "me disseram para..." e é muito usada para contar o que alguém pediu ou mandou você fazer.

Essa estrutura é uma forma de citação indireta: ela transmite o sentido do pedido, sem repetir as palavras exatas.$$,
    $$Para citar as palavras exatas, usa-se 「〜てください」と言う. Com ように, a citação fica indireta e mais natural na narração.

Com ない, a estrutura indica um aviso ou proibição: 遅れないように言われた (me disseram para não me atrasar).

伝えてください é muito útil para deixar recados, como pedir que avisem alguém.$$,
    $$Pessoa + に + Verbo (dicionário / ない) + ように + 言う / 頼む / 注意する / 伝える
Pessoa + に + Verbo + ように + 言われる (passiva: me disseram para...)$$,
    $$ように言う$$,
    $$ように言|ようにいい|ようにいう|ように頼|ようにたの|ように注意|ように伝え$$,
    ARRAY['ように', '言う', '頼む']::text[],
    ARRAY['ように言う', 'ように頼む', 'ように言われる', 'ように注意する', 'ように伝える']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-142', $$先生は学生に静かにするように言いました。$$, $$せんせいはがくせいにしずかにするようにいいました。$$, $$O professor disse aos alunos para ficarem em silêncio.$$),
    ('n4-grammar-142', $$母に早く寝るように言われた。$$, $$ははにはやくねるようにいわれた。$$, $$Minha mãe me disse para dormir cedo.$$),
    ('n4-grammar-142', $$友達に引っ越しを手伝ってくれるように頼みました。$$, $$ともだちにひっこしをてつだってくれるようにたのみました。$$, $$Pedi a um amigo para me ajudar na mudança.$$),
    ('n4-grammar-142', $$医者にお酒を飲まないように注意されました。$$, $$いしゃにおさけをのまないようにちゅういされました。$$, $$O médico me avisou para não beber álcool.$$),
    ('n4-grammar-142', $$田中さんに後で電話するように伝えてください。$$, $$たなかさんにあとででんわするようにつたえてください。$$, $$Diga ao Tanaka para me ligar mais tarde, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$部長は私に資料を準備する____。$$, $$O gerente me disse para preparar os documentos.$$),
        (2, $$母に部屋を片付ける____。$$, $$Minha mãe me disse para arrumar o quarto.$$),
        (3, $$隣の人に音楽を小さくする____。$$, $$Pedi ao vizinho para abaixar a música.$$),
        (4, $$先生に遅刻しない____。$$, $$O professor me avisou para não chegar atrasado.$$),
        (5, $$山田さんに明日来る____ください。$$, $$Diga ao Yamada para vir amanhã, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-142', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ように言いました$$),
        (1, $$ように言った$$),
        (2, $$ように言われました$$),
        (2, $$ように言われた$$),
        (3, $$ように頼みました$$),
        (3, $$ように頼んだ$$),
        (4, $$ように注意されました$$),
        (4, $$ように注意された$$),
        (4, $$ように言われました$$),
        (4, $$ように言われた$$),
        (5, $$ように伝えて$$),
        (5, $$ように言って$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
