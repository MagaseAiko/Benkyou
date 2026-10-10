-- n4-grammar-134 — お〜する・お〜いたす
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-134',
    'grammar',
    'N4',
    $$お〜する・お〜いたす$$,
    $$o ~ suru / o ~ itasu$$,
    $$Fazer (humilde) / Permita-me (fazer)$$,
    $$お〜する e お〜いたす são formas humildes (謙譲語) usadas para falar das próprias ações quando elas afetam ou beneficiam uma pessoa que merece respeito, como um cliente ou um superior.

No 謙譲語, quem fala se coloca em posição modesta, rebaixando a própria ação para mostrar respeito ao outro.

A estrutura coloca お antes do verbo na forma ます sem ます, e する ou いたす depois. Com verbos de origem chinesa do tipo "substantivo + する", usa-se ご: ご案内する, ご説明する.

いたす é mais humilde que する. Por isso, お〜いたします é a forma mais formal, muito usada no atendimento ao cliente e em e-mails de trabalho.

Essas formas só são usadas para ações de quem fala ou do seu grupo, e que envolvem a outra pessoa.$$,
    $$A frase お待ちしております ("estamos esperando pelo senhor") é muito comum em convites e lojas.

Essas formas não são usadas para ações que não envolvem a outra pessoa. Por exemplo, para "eu vou dormir", não faz sentido usar お寝します.

Alguns verbos têm formas humildes especiais, como 行く → 参る / 伺う e 言う → 申す.$$,
    $$お + Verbo na forma ます sem ます + する / します
お + Verbo na forma ます sem ます + いたす / いたします (mais humilde)
ご + Substantivo de ação + する / いたす

Exemplos: 持つ → お持ちします / 送る → お送りします / 案内する → ご案内します$$,
    $$お〜する$$,
    $$お持ちし|お持ちいた|お送りし|お送りいた|お待ちし|お待ちいた|お知らせし|お知らせいた|お手伝いし|お手伝いいた|ご案内し|ご案内いた|ご説明し|ご説明いた|ご連絡し|ご連絡いた|お届けし|お届けいた|お手伝い$$,
    ARRAY['お', 'する', 'いたす']::text[],
    ARRAY['お〜する', 'お〜します', 'お〜いたします', 'ご〜します']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-134', $$重いでしょう。お荷物をお持ちします。$$, $$おもいでしょう。おにもつをおもちします。$$, $$Deve estar pesado. Eu carrego sua bagagem.$$),
    ('n4-grammar-134', $$駅までお送りしましょうか。$$, $$えきまでおおくりしましょうか。$$, $$Quer que eu o leve até a estação?$$),
    ('n4-grammar-134', $$結果は後ほどお知らせいたします。$$, $$けっかはのちほどおしらせいたします。$$, $$Informaremos o resultado mais tarde.$$),
    ('n4-grammar-134', $$会場までご案内します。$$, $$かいじょうまでごあんないします。$$, $$Vou guiá-lo até o local.$$),
    ('n4-grammar-134', $$皆様のお越しをお待ちしております。$$, $$みなさまのおこしをおまちしております。$$, $$Aguardamos a visita de todos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$重そうですね。私が____。（持つ）$$, $$Parece pesado. Eu carrego. (carregar)$$),
        (2, $$詳しいことは私から____。（説明する）$$, $$Eu explico os detalhes. (explicar)$$),
        (3, $$後でこちらから____。（連絡する）$$, $$Mais tarde, entraremos em contato. (contatar)$$),
        (4, $$明日、資料を____。（届ける）$$, $$Amanhã, entregaremos os documentos. (entregar)$$),
        (5, $$何か____ことはありますか。（手伝う）$$, $$Há algo em que eu possa ajudar? (ajudar)$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-134', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$お持ちします$$),
        (1, $$お持ちいたします$$),
        (2, $$ご説明します$$),
        (2, $$ご説明いたします$$),
        (3, $$ご連絡します$$),
        (3, $$ご連絡いたします$$),
        (4, $$お届けします$$),
        (4, $$お届けいたします$$),
        (5, $$お手伝いする$$),
        (5, $$お手伝いできる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
