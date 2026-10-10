-- n5-grammar-01 — 〜ちゃいけない・〜じゃいけない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-01',
    'grammar',
    'N5',
    $$〜ちゃいけない・〜じゃいけない$$,
    $$chaikenai / jaikenai$$,
    $$Não pode / Não deve / É proibido$$,
    $$Essa estrutura é usada para dizer que algo não é permitido. É a forma falada e mais casual de 〜てはいけない.

Na fala do dia a dia, os japoneses costumam "encurtar" ては para ちゃ. Quando a forma て do verbo termina em で (como nos verbos terminados em む, ぶ, ぬ e ぐ), では vira じゃ. Ou seja, ちゃいけない e じゃいけない têm o mesmo significado; a escolha depende só da terminação da forma て do verbo.

A ideia literal é algo como "fazer isso não está bem". Por isso ela é usada para regras, proibições, avisos e conselhos firmes, como pais falando com filhos, professores com alunos ou amigos alertando uns aos outros.

Como é uma forma contraída, ela soa informal. Em placas, documentos ou situações formais, usa-se a forma completa 〜てはいけません.$$,
    $$A contração segue sempre o mesmo padrão: ては vira ちゃ e では vira じゃ. Esse mesmo padrão aparece em outras expressões, como 〜ちゃだめ, que tem sentido parecido e é ainda mais coloquial.

Por ser uma forma falada, ela é rara em textos escritos formais. Em regulamentos e avisos oficiais, a forma completa é a mais comum.

Um erro comum é esquecer de olhar a forma て antes de contrair: o verbo 飲む vira 飲んで, então a forma correta é 飲んじゃいけない, e não 飲んちゃいけない.$$,
    $$Verbo na forma て terminada em て → troque て por ちゃ + いけない
Verbo na forma て terminada em で → troque で por じゃ + いけない

Educado: 〜ちゃいけません / 〜じゃいけません
Passado: 〜ちゃいけなかった / 〜じゃいけなかった

Forma completa equivalente: Verbo na forma て + は + いけない$$,
    $$ちゃいけない$$,
    $$ちゃいけない|じゃいけない|ちゃいけません|じゃいけません|ちゃいけなかった|じゃいけなかった$$,
    ARRAY['ちゃ', 'じゃ', 'いけない']::text[],
    ARRAY['ちゃいけない', 'じゃいけない', 'ちゃいけません', 'じゃいけません', 'ちゃいけなかった', 'じゃいけなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-01', $$ここで写真を撮っちゃいけない。$$, $$ここでしゃしんをとっちゃいけない。$$, $$Não pode tirar foto aqui.$$),
    ('n5-grammar-01', $$授業中に寝ちゃいけないよ。$$, $$じゅぎょうちゅうにねちゃいけないよ。$$, $$Não pode dormir durante a aula, viu?$$),
    ('n5-grammar-01', $$このプールで泳いじゃいけません。$$, $$このプールでおよいじゃいけません。$$, $$Não é permitido nadar nesta piscina.$$),
    ('n5-grammar-01', $$子供のころ、夜遅くまでテレビを見ちゃいけなかった。$$, $$こどものころ、よるおそくまでテレビをみちゃいけなかった。$$, $$Quando eu era criança, não podia ver TV até tarde da noite.$$),
    ('n5-grammar-01', $$薬を飲んだあとで、お酒を飲んじゃいけないよ。$$, $$くすりをのんだあとで、おさけをのんじゃいけないよ。$$, $$Depois de tomar o remédio, você não pode beber álcool.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$図書館で大きい声で話し____よ。$$, $$Não pode falar alto na biblioteca, viu?$$),
        (2, $$廊下を走っ____。$$, $$Não pode correr no corredor.$$),
        (3, $$ここにゴミを捨て____。$$, $$Não pode jogar lixo aqui.$$),
        (4, $$この川で泳い____。$$, $$Não pode nadar neste rio.$$),
        (5, $$医者に、今日はお酒を飲ん____と言われました。$$, $$O médico me disse que hoje eu não posso beber álcool.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-01', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ちゃいけない$$),
        (1, $$ちゃいけません$$),
        (2, $$ちゃいけない$$),
        (2, $$ちゃいけません$$),
        (3, $$ちゃいけない$$),
        (3, $$ちゃいけません$$),
        (4, $$じゃいけない$$),
        (4, $$じゃいけません$$),
        (5, $$じゃいけない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
