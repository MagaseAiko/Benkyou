-- n3-grammar-176 — 〜ように（目的）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-176',
    'grammar',
    'N3',
    $$〜ように（目的）$$,
    $$you ni (mokuteki)$$,
    $$Para que / A fim de que / De modo que$$,
    $$Nesse uso, ように indica o objetivo de uma ação, ou seja, o resultado que se quer alcançar. Equivale a "para que", "a fim de que" ou "de modo que".

A diferença em relação a ために é muito importante. ように é usado quando o resultado desejado não depende só da vontade da pessoa: verbos potenciais (conseguir falar, poder ler), verbos sem controle (ouvir, esquecer) e verbos na forma negativa (não pegar resfriado, não se atrasar).

Por exemplo, "falei alto para que todos pudessem ouvir" ou "durma agasalhado para não pegar resfriado".

ために é usado quando a pessoa realiza uma ação intencional para alcançar o objetivo, como "estudo para entrar na faculdade".

Também é comum quando o sujeito das duas partes é diferente: "escrevi em hiragana para que as crianças pudessem ler".$$,
    $$Regra prática: se o verbo antes do objetivo for potencial, negativo ou sem controle, use ように; se for uma ação intencional, use ために.

ように também aparece em desejos e orações, como 合格できますように ("que eu passe na prova!").

Em avisos, 〜ないようにご注意ください ("tome cuidado para não...") é muito comum.$$,
    $$Verbo potencial + ように + Ação
Verbo na forma ない + ように + Ação (para não...)
Verbo sem controle (聞こえる / 見える / 忘れる) + ように + Ação$$,
    $$ように$$,
    $$ように$$,
    ARRAY['よう', 'に']::text[],
    ARRAY['ように', 'ないように']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-176', $$風邪をひかないように、暖かくして寝た。$$, $$かぜをひかないように、あたたかくしてねた。$$, $$Dormi agasalhado para não pegar resfriado.$$),
    ('n3-grammar-176', $$後ろの人にも聞こえるように、大きな声で話してください。$$, $$うしろのひとにもきこえるように、おおきなこえではなしてください。$$, $$Fale alto para que as pessoas de trás também possam ouvir.$$),
    ('n3-grammar-176', $$大事なことを忘れないように、メモしておこう。$$, $$だいじなことをわすれないように、メモしておこう。$$, $$Vou anotar para não esquecer as coisas importantes.$$),
    ('n3-grammar-176', $$早く日本語が話せるように、毎日練習している。$$, $$はやくにほんごがはなせるように、まいにちれんしゅうしている。$$, $$Pratico todo dia para conseguir falar japonês logo.$$),
    ('n3-grammar-176', $$子供でも読めるように、ひらがなで書いた。$$, $$こどもでもよめるように、ひらがなでかいた。$$, $$Escrevi em hiragana para que até crianças pudessem ler.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$遅れない____、早く家を出た。$$, $$Saí de casa cedo para não me atrasar.$$),
        (2, $$みんなに見える____、大きく書いてください。$$, $$Escreva grande para que todos possam ver.$$),
        (3, $$試験に合格できる____、頑張ります。$$, $$Vou me esforçar para conseguir passar na prova.$$),
        (4, $$忘れ物をしない____、気をつけてください。$$, $$Tome cuidado para não esquecer nada.$$),
        (5, $$赤ちゃんが起きない____、静かに話した。$$, $$Falamos baixo para que o bebê não acordasse.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-176', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ように$$),
        (2, $$ように$$),
        (3, $$ように$$),
        (4, $$ように$$),
        (5, $$ように$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
