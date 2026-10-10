-- n4-grammar-95 — 〜ていただけませんか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-95',
    'grammar',
    'N4',
    $$〜ていただけませんか$$,
    $$te itadakemasen ka$$,
    $$Poderia (fazer) por favor? / O senhor poderia...?$$,
    $$ていただけませんか é uma forma muito educada de pedir algo a alguém. Equivale a "poderia, por favor...?" ou "o senhor poderia...?".

Ela vem de ていただく, a forma humilde de てもらう (receber uma ação). A ideia literal é "eu não poderia receber de você o favor de fazer isso?".

A forma negativa com pergunta deixa o pedido ainda mais suave, porque dá liberdade ao outro de recusar. Por isso, é ideal para pedir algo a superiores, clientes, desconhecidos e em situações formais.

ていただけますか também é educada, mas ていただけませんか soa um pouco mais gentil e humilde.$$,
    $$Em e-mails de trabalho, ていただけませんでしょうか é uma versão ainda mais formal.

Quem faz a ação é a outra pessoa, mas quem fala fica como "receptor" do favor. Por isso, é uma forma humilde.

Para aceitar um pedido assim, respostas comuns são はい、いいですよ ou かしこまりました, no atendimento.$$,
    $$Verbo na forma て + いただけませんか
Verbo na forma て + いただけますか (um pouco menos suave)

Do mais casual ao mais formal:
てくれる？ → てくれませんか → てもらえませんか → ていただけますか → ていただけませんか$$,
    $$ていただけませんか$$,
    $$ていただけませんか|でいただけませんか|ていただけますか|でいただけますか$$,
    ARRAY['て', 'いただけません', 'か']::text[],
    ARRAY['ていただけませんか', 'ていただけますか', 'でいただけませんか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-95', $$すみません、もう一度説明していただけませんか。$$, $$すみません、もういちどせつめいしていただけませんか。$$, $$Desculpe, poderia explicar mais uma vez?$$),
    ('n4-grammar-95', $$この書類を見ていただけませんか。$$, $$このしょるいをみていただけませんか。$$, $$O senhor poderia dar uma olhada neste documento?$$),
    ('n4-grammar-95', $$少し待っていただけますか。$$, $$すこしまっていただけますか。$$, $$Poderia esperar um pouco?$$),
    ('n4-grammar-95', $$駅までの道を教えていただけませんか。$$, $$えきまでのみちをおしえていただけませんか。$$, $$Poderia me ensinar o caminho até a estação?$$),
    ('n4-grammar-95', $$この漢字の読み方を教えていただけませんか。$$, $$このかんじのよみかたをおしえていただけませんか。$$, $$Poderia me ensinar como se lê este kanji?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$すみません、写真を撮っ____。$$, $$Com licença, poderia tirar uma foto?$$),
        (2, $$もう少しゆっくり話し____。$$, $$Poderia falar um pouco mais devagar?$$),
        (3, $$先生、その本を貸し____。$$, $$Professor, poderia me emprestar esse livro?$$),
        (4, $$明日の会議の資料を読ん____。$$, $$Poderia ler os documentos da reunião de amanhã?$$),
        (5, $$ここにお名前を書い____。$$, $$Poderia escrever seu nome aqui?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-95', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ていただけませんか$$),
        (1, $$ていただけますか$$),
        (2, $$ていただけませんか$$),
        (2, $$ていただけますか$$),
        (3, $$ていただけませんか$$),
        (3, $$ていただけますか$$),
        (4, $$でいただけませんか$$),
        (4, $$でいただけますか$$),
        (5, $$ていただけませんか$$),
        (5, $$ていただけますか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
