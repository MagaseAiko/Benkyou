-- n4-grammar-60 — 〜にくい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-60',
    'grammar',
    'N4',
    $$〜にくい$$,
    $$nikui$$,
    $$Difícil de / Ruim de$$,
    $$にくい é usado para dizer que algo é difícil de fazer. Equivale a "difícil de" ou "ruim de".

Ele é formado tirando ます do verbo e acrescentando にくい. O resultado funciona como um adjetivo い, então se conjuga como tal: にくくない, にくかった, にくくて.

A dificuldade costuma vir de uma característica da coisa, como letras pequenas que tornam um livro difícil de ler, ou sapatos que deixam o andar desconfortável.

Também é usado para situações em que é difícil fazer algo por motivos psicológicos, como ser difícil fazer uma pergunta a alguém.

O oposto de にくい é やすい, que significa "fácil de".$$,
    $$Para dificuldades emocionais ou situações delicadas, também se usa づらい, que destaca mais o desconforto pessoal.

Não confunda com o adjetivo 憎い, que significa "odioso". Apenas a pronúncia é igual.

Com verbos que não dependem da vontade, como acontecimentos naturais, にくい também funciona: algo que "não quebra facilmente", por exemplo.$$,
    $$Verbo na forma ます sem ます + にくい

Negativo: にくくない
Passado: にくかった
Ligando: にくくて$$,
    $$にくい$$,
    $$にくい|にくく|にくかった$$,
    ARRAY['にくい']::text[],
    ARRAY['にくい', 'にくくない', 'にくかった', 'にくくて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-60', $$この本は字が小さくて読みにくいです。$$, $$このほんはじがちいさくてよみにくいです。$$, $$Este livro tem letras pequenas e é difícil de ler.$$),
    ('n4-grammar-60', $$この靴は歩きにくい。$$, $$このくつはあるきにくい。$$, $$Estes sapatos são ruins para andar.$$),
    ('n4-grammar-60', $$彼の説明はわかりにくかった。$$, $$かれのせつめいはわかりにくかった。$$, $$A explicação dele foi difícil de entender.$$),
    ('n4-grammar-60', $$この薬は苦くて飲みにくいです。$$, $$このくすりはにがくてのみにくいです。$$, $$Este remédio é amargo e difícil de tomar.$$),
    ('n4-grammar-60', $$あの先生には質問しにくいです。$$, $$あのせんせいにはしつもんしにくいです。$$, $$É difícil fazer perguntas para aquele professor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このペンは書き____です。$$, $$Esta caneta é ruim de escrever.$$),
        (2, $$骨が多い魚は食べ____。$$, $$Peixe com muita espinha é difícil de comer.$$),
        (3, $$彼の字は小さくて読み____。$$, $$A letra dele é pequena e difícil de ler.$$),
        (4, $$このドアは開け____から、気をつけて。$$, $$Esta porta é difícil de abrir, então tome cuidado.$$),
        (5, $$説明がわかり____て、困りました。$$, $$A explicação era difícil de entender, e fiquei perdido.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-60', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にくい$$),
        (2, $$にくい$$),
        (2, $$にくいです$$),
        (3, $$にくい$$),
        (3, $$にくいです$$),
        (4, $$にくい$$),
        (5, $$にくく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
