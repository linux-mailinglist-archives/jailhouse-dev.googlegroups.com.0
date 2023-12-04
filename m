Return-Path: <jailhouse-dev+bncBDDYHZXV2EIRBCOGXGVQMGQE7MYWQOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D8980429B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  5 Dec 2023 00:38:50 +0100 (CET)
Received: by mail-ot1-x340.google.com with SMTP id 46e09a7af769-6d9afd47fbcsf705714a34.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Dec 2023 15:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1701733129; x=1702337929; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyJmpEjjQQXbmy0avToQhUy1atR1p6EQEun39aYkVKo=;
        b=UpTVLYb/XI7fbLOu8z7Zzt8aHr4FcfcEYpxVMKJ4GbtzkhHh9+Mtykv+4A6nY6l/0a
         Km2e25iIh1LgjEtBvkU34m0VWatQ3JidGn0Yge/U3LG2ri+lOdUxIHdXr+Qsg5aq8Ggt
         WyX2Yo1FUMzCphIBU/zahhCV+sTT5hOOGQkYnLko0BpDksjZd1Vpm7aFLC8MQlPd+/WO
         0Rt28l4srPBvwVD/9VXItQNZ8bgImNrBYjFb1QvBTtBF9G1VMgvBUy52Cw6rkZAkxwLd
         lFCjg+DRqnhbMYOfhMqnOgvuI03g2dNgp1RzQ52wK1yE4aijYF5Hqqu+4mnKw8137Ove
         78cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701733129; x=1702337929; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nyJmpEjjQQXbmy0avToQhUy1atR1p6EQEun39aYkVKo=;
        b=m/7jpYynmaFXqrjaF2zBSB3gCVB/ed+rkcdMkJCuF/xYs7ahaYXb84ID9F87KelfLZ
         Bew20Ubk6R3UU0++3UVFcUoEzf//O5yFuR03S7EWBszWwciFtoaz96qsth3VFuutVQbH
         o/ioNI46faQ1ew6Rd1mjx0/G1RA+4wfRhjcTP9r5d776JD1f9QpM/d7YUikZesLaBphK
         n4BADEEf1ymvila5W81LfP4nU+L5GWpi6B6rjIWlIzYy8CREVjOJsNsQOLZVx9dvzdBO
         hBm1jZbhFyqV7CWH9Mi4gMmu+6MniOa0zT9bH9zGzLasqUMyzFHON7dlmAIfuJtbsqWV
         eCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701733129; x=1702337929;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyJmpEjjQQXbmy0avToQhUy1atR1p6EQEun39aYkVKo=;
        b=PEsq43PjfMaBTXUrXihgYxhWX4K0PZYJrC0atOaI+5joyi7L+s2AXi4im2GDacc1jL
         EtTyGPOlamljOb3KWcp/kustLhszVSn9/dToWL/eKjSm6IquDOcFzLHOjMYgV2mJU9Uv
         Ko5yg+4Zm80RDScN/5PZw06nz6B79/NhaMEFAS+mW20ScjHC3VfCHWzaN98Q+SKTUZd/
         iHgTUgp8Huf2YWV77dGvjg2VlEFuxlM8c89dB1thnmc3yNmetfhOQOYSU9MClaZ3nsXK
         kf7Wrd1C352mbSv+Rk4jcs58/genpycDdgCLzSjMveJR/2mFKcRtoIbzctVn2lXjBkpa
         jIew==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzTxCeVsid+RvgS88GonuwbmF8q5hEB9DZRciMv5ymqQc/sOlHk
	F0/ziSi5YFYvGMM8sI1KCvE=
X-Google-Smtp-Source: AGHT+IEykf4DkPShR5sZ2tv9y2Il8+jmzSXEYn/Jzf/QQZatPj1mV8suJ6jnxUDfz1pwgDX0fMR0Mw==
X-Received: by 2002:a05:6871:b24:b0:1fb:75b:12fd with SMTP id fq36-20020a0568710b2400b001fb075b12fdmr5395943oab.79.1701733129369;
        Mon, 04 Dec 2023 15:38:49 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:3c8f:b0:1fa:eb4d:a6f5 with SMTP id
 gl15-20020a0568703c8f00b001faeb4da6f5ls6699791oab.2.-pod-prod-09-us; Mon, 04
 Dec 2023 15:38:48 -0800 (PST)
X-Received: by 2002:a05:6871:b2b:b0:1fb:1858:5b5a with SMTP id fq43-20020a0568710b2b00b001fb18585b5amr3292660oab.1.1701733128162;
        Mon, 04 Dec 2023 15:38:48 -0800 (PST)
Date: Mon, 4 Dec 2023 15:38:47 -0800 (PST)
From: Kay Deleppo <kaydeleppo@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0aad98b0-2120-49fc-bcfe-b37254cf8a00n@googlegroups.com>
Subject: Veritas 8014 29 Bedienungsanleitung Pdf 14
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_172_804281773.1701733127152"
X-Original-Sender: kaydeleppo@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_172_804281773.1701733127152
Content-Type: multipart/alternative; 
	boundary="----=_Part_173_804874033.1701733127152"

------=_Part_173_804874033.1701733127152
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Meine Schwiegermama hat mir eine Veritas Textima 8014/29 / 39 N=C3=A4hmasch=
ine=20
geschenkt, damit das Kost=C3=BCme n=C3=A4hen und der gleichen keine ewigen=
=20
Nachtsitzungen mehr braucht. Nun ist das Problem (wie solles auch anders=20
sein), dass keine Bedienungsanleitung dabei ist und sie auch nach=20
ausgedehntem Suchen nicht auftauchte. Kann mir eventuell jemand helfen? Im=
=20
Netzt werde ich nicht so recht f=C3=BCndig. Es gibt die Anleitung zwar als =
eBook=20
sozusagen, aber ich h=C3=A4tte es schon gern in Papierform zur Hand :) Gest=
ern=20
wollte ich etwas n=C3=A4hen und dachte mir "es wird schon so schwer nicht s=
ein"=20
- nun hat sich die Spule vom Unterfaden verh=C3=A4ddert und ich krieg es ni=
cht=20
richtig reingefummelt. :( Vielen Dank f=C3=BCrs lesen und vllt m=C3=B6chte =
mir jemand=20
die Anleitung via mail schicken? Liebe Gr=C3=BC=C3=9Fe!\n\nCaaarsten, Du=20
Bedienungsanleitungs-Verschickungs-Held!Wir haben eine Textima 8014/29=20
geerbt und kommen mit dem Teil leider nicht richtig klar.K=C3=B6nntest Du B=
IDDE=20
nochmal Deine Bedienungsanleitungs-PDF zum gl=C3=BChen bringen?DAAAAANKE!!!=
=20
;)Rita.\n\nveritas 8014 29 bedienungsanleitung pdf 14\nDOWNLOAD=20
https://8gutrosimpbu.blogspot.com/?pj=3D2wI9WH\n\n\n\nLieber Carsten, ich=
=20
w=C3=BCrde mich super freuen, wenn du mir die Anleitung ebenfalls zusenden=
=20
k=C3=B6nntest. Habe von meiner Omi die Veritas 8014/29 geschenkt bekommen, =
aber=20
die Anleitung der 8014/40 ist wohl deckungsgleich. Ich w=C3=BCrd so gern mi=
t dem=20
n=C3=A4hen starten und w=C3=A4r dir dankbar bis in alle Ewigkeit!\n\nHallo =
, ich habe=20
von meiner mutti eine veritas und auch leider keine anleitung. Ich komme=20
mit dem Unterfaden nicht klar , wie ich den Spulenhalter f=C3=BCr den unter=
faden=20
richtig einsetzen soll. Meine mutti ist durch eine OP verwirrt und hatte=20
den unteren teil auseinander genommen. W=C3=BCrde mich freuen wenn ich eine=
=20
zeichnung oder beschreibung finden k=C3=B6nte.\n\nLieber Lieber Carsten. Au=
ch=20
ich bin auf der suche nach einer Bedienungsanleitung f=C3=BCr die Veritas=
=20
8014/41 weshalb mir wohl die 8014/40 als pdf wohl schon sehr viel weiter=20
helfen w=C3=BCrde, gehe ich von aus... bitte bitte sei mein Retter und lass=
 mir=20
die Anleitung zukommen, ich w=C3=A4re dir auf ewig dankbar\n\nIch reihe mic=
h ein=20
in die Reihe derer, die eine alte Veritas ohne Bedienungsanleitung bekommen=
=20
haben und nun schier verzweifeln. Hast du die Anleitung f=C3=BCr die 8014/4=
0=20
noch? Und w=C3=BCrdest du sie mir auch zuschicken? Ich hab die 8014/29 und =
mir=20
wachsen schon gaue Haare. Vielleicht komme ich ja mit der Anleitung=20
weiter....\n\nda ich nun bei meiner Oma ausger=C3=A4umt habe bin ich auch i=
m=20
Besitz einer 8014/40 und br=C3=A4uchte dazu ebenfalls eine Anleitung, aus d=
em=20
Schrank bekomme ich sie noch aber Dann wird es auch schon schwierig. Ich=20
w=C3=BCrde mich freuen wenn es noch klappt.\n\nIch habe eine Veritas Textim=
a=20
8014/29 und seit 2 Tagen kann ich das Handrad nicht mehr drehen... Eine=20
bekannte meinte, vielleicht stecken F=C3=A4den, was auch der Fall war, aber=
=20
jetzt hab ich alle entfernt... Wei=C3=9F wer weiter?\n\nHallo ihr, meine Fr=
au=20
hat eine N=C3=A4hmaschine "Textima 8014" von Veritas geschenkt bekommen, ab=
er=20
ohne Bedienungsanleitung :-(. Woher bekomme ich nun wenigstens die Seite=20
kostenlos, auf der die =C3=96lstellen dargestellt sind?\n\nIch habe eine=20
N=C3=A4hmaschine (Veritas 8014/43) geschenkt bekommen. Jetzt wollte ich dam=
it=20
n=C3=A4hen, kann aber die Stiche nicht einstellen. Vllt stelle ich mich auc=
h zu=20
dum an aber das Rad, an den der R=C3=BCckw=C3=A4rtshebel dran ist, l=C3=A4s=
st sich nicht=20
drehen. Ersteht auf 0. Auch der Hebel an sich l=C3=A4sst sich nicht komplet=
t=20
runterdr=C3=BCcken. Gibts da einen Trick oder ist das Sch=C3=A4tzchen=20
kaputt?\n\n\n\nHabe vor ca. 2 wochen eine gebrauchte n=C3=A4hmaschine gesch=
enkt=20
bekommen,leider ohne bedienungsanleitung, habe schon beim kundendienst=20
angefragt, leider ohne erfolg, hat jemand einen tip wie ich an die=20
anleitung komme, des typs privileg 5021 el,vielen dank,lg.=20
maritasetto\n\nich habe am wochenende von meinem papa eine n=C3=A4hmaschine=
=20
bekommen. damit wollte ich heute mal ein bisschen rumprobieren. ich bin=20
blutige anf=C3=A4ngerin und zu allen =C3=BCberfluss ist die bedienungsanlei=
tung zu=20
meiner n=C3=A4hmaschine auch nicht auffindbar. jedenfalls hat mein papa mir=
 eine=20
kleine einweisung gegeben und zumindest dachte ich, dass ich damit erstmal=
=20
=C3=BCber die runden komme - bis mir vorhin nach meinen ersten 10 cm die na=
del=20
gebrochen ist. ich habe sie dann gewechselt und wollte weitern=C3=A4hen, ab=
er=20
die maschine war da anderer meinung.\n\nPassendes Zubeh=C3=B6r und Ersatzte=
ile=20
f=C3=BCr Ihre Veritas 8014/39. Sollten Sie einen gew=C3=BCnschten Artikel n=
icht=20
finden, verwenden Sie bitte unser Anfrageformular.\nHinweis: Artikel mit=20
der Kennzeichnung "ARCHIV" sind vom Hersteller leider nicht mehr=20
lieferbar!\n\nMeine Schwiegermutter besitzt eine Veritas N=C3=A4hmaschine=
=20
8014/39 Textima, leider n=C3=A4ht sie nicht mehr ordnungsgem=C3=A4=C3=9F, b=
eim 2 Stich=20
scheint sie stehen zu bleiben als ob sie es nicht Schaft den faden von=20
unten hoch zu holen..... auf der Unterseite des Stoffes sind wie lauter=20
Schlaufen ...siehe Bild.... Ich gehe davon aus das eventuell die spule=20
defekt ist.... da ich keine Ahnung davon habe frage ich mal hier in der=20
Runde ...ob jemand ne Idee hat was es sein k=C3=B6nnte. ?.\n\nist die=20
Bedienungsanleitung vorhanden, wenn nicht m=C3=BCsste die unter Textima,=20
veritas, victoria zu finden sein, dann erst mal alle F=C3=A4den raus, reini=
gen,=20
neue Nadel, nach Anweisung =C3=B6len, ordentlich aufspulen und einf=C3=A4de=
ln,=20
langsam ann=C3=A4hen und die Anfangsf=C3=A4den festhalten\n eebf2c3492\n

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0aad98b0-2120-49fc-bcfe-b37254cf8a00n%40googlegroups.com.

------=_Part_173_804874033.1701733127152
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Meine Schwiegermama hat mir eine Veritas Textima 8014/29 / 39 N=C3=A4h=
maschine geschenkt, damit das Kost=C3=BCme n=C3=A4hen und der gleichen kein=
e ewigen Nachtsitzungen mehr braucht. Nun ist das Problem (wie solles auch =
anders sein), dass keine Bedienungsanleitung dabei ist und sie auch nach au=
sgedehntem Suchen nicht auftauchte. Kann mir eventuell jemand helfen? Im Ne=
tzt werde ich nicht so recht f=C3=BCndig. Es gibt die Anleitung zwar als eB=
ook sozusagen, aber ich h=C3=A4tte es schon gern in Papierform zur Hand :) =
Gestern wollte ich etwas n=C3=A4hen und dachte mir "es wird schon so schwer=
 nicht sein" - nun hat sich die Spule vom Unterfaden verh=C3=A4ddert und ic=
h krieg es nicht richtig reingefummelt. :( Vielen Dank f=C3=BCrs lesen und =
vllt m=C3=B6chte mir jemand die Anleitung via mail schicken? Liebe Gr=C3=BC=
=C3=9Fe!\n\nCaaarsten, Du Bedienungsanleitungs-Verschickungs-Held!Wir haben=
 eine Textima 8014/29 geerbt und kommen mit dem Teil leider nicht richtig k=
lar.K=C3=B6nntest Du BIDDE nochmal Deine Bedienungsanleitungs-PDF zum gl=C3=
=BChen bringen?DAAAAANKE!!! ;)Rita.\n\nveritas 8014 29 bedienungsanleitung =
pdf 14\nDOWNLOAD https://8gutrosimpbu.blogspot.com/?pj=3D2wI9WH\n\n\n\nLieb=
er Carsten, ich w=C3=BCrde mich super freuen, wenn du mir die Anleitung ebe=
nfalls zusenden k=C3=B6nntest. Habe von meiner Omi die Veritas 8014/29 gesc=
henkt bekommen, aber die Anleitung der 8014/40 ist wohl deckungsgleich. Ich=
 w=C3=BCrd so gern mit dem n=C3=A4hen starten und w=C3=A4r dir dankbar bis =
in alle Ewigkeit!\n\nHallo , ich habe von meiner mutti eine veritas und auc=
h leider keine anleitung. Ich komme mit dem Unterfaden nicht klar , wie ich=
 den Spulenhalter f=C3=BCr den unterfaden richtig einsetzen soll. Meine mut=
ti ist durch eine OP verwirrt und hatte den unteren teil auseinander genomm=
en. W=C3=BCrde mich freuen wenn ich eine zeichnung oder beschreibung finden=
 k=C3=B6nte.\n\nLieber Lieber Carsten. Auch ich bin auf der suche nach eine=
r Bedienungsanleitung f=C3=BCr die Veritas 8014/41 weshalb mir wohl die 801=
4/40 als pdf wohl schon sehr viel weiter helfen w=C3=BCrde, gehe ich von au=
s... bitte bitte sei mein Retter und lass mir die Anleitung zukommen, ich w=
=C3=A4re dir auf ewig dankbar\n\nIch reihe mich ein in die Reihe derer, die=
 eine alte Veritas ohne Bedienungsanleitung bekommen haben und nun schier v=
erzweifeln. Hast du die Anleitung f=C3=BCr die 8014/40 noch? Und w=C3=BCrde=
st du sie mir auch zuschicken? Ich hab die 8014/29 und mir wachsen schon ga=
ue Haare. Vielleicht komme ich ja mit der Anleitung weiter....\n\nda ich nu=
n bei meiner Oma ausger=C3=A4umt habe bin ich auch im Besitz einer 8014/40 =
und br=C3=A4uchte dazu ebenfalls eine Anleitung, aus dem Schrank bekomme ic=
h sie noch aber Dann wird es auch schon schwierig. Ich w=C3=BCrde mich freu=
en wenn es noch klappt.\n\nIch habe eine Veritas Textima 8014/29 und seit 2=
 Tagen kann ich das Handrad nicht mehr drehen... Eine bekannte meinte, viel=
leicht stecken F=C3=A4den, was auch der Fall war, aber jetzt hab ich alle e=
ntfernt... Wei=C3=9F wer weiter?\n\nHallo ihr, meine Frau hat eine N=C3=A4h=
maschine "Textima 8014" von Veritas geschenkt bekommen, aber ohne Bedienung=
sanleitung :-(. Woher bekomme ich nun wenigstens die Seite kostenlos, auf d=
er die =C3=96lstellen dargestellt sind?\n\nIch habe eine N=C3=A4hmaschine (=
Veritas 8014/43) geschenkt bekommen. Jetzt wollte ich damit n=C3=A4hen, kan=
n aber die Stiche nicht einstellen. Vllt stelle ich mich auch zu dum an abe=
r das Rad, an den der R=C3=BCckw=C3=A4rtshebel dran ist, l=C3=A4sst sich ni=
cht drehen. Ersteht auf 0. Auch der Hebel an sich l=C3=A4sst sich nicht kom=
plett runterdr=C3=BCcken. Gibts da einen Trick oder ist das Sch=C3=A4tzchen=
 kaputt?\n\n\n\nHabe vor ca. 2 wochen eine gebrauchte n=C3=A4hmaschine gesc=
henkt bekommen,leider ohne bedienungsanleitung, habe schon beim kundendiens=
t angefragt, leider ohne erfolg, hat jemand einen tip wie ich an die anleit=
ung komme, des typs privileg 5021 el,vielen dank,lg. maritasetto\n\nich hab=
e am wochenende von meinem papa eine n=C3=A4hmaschine bekommen. damit wollt=
e ich heute mal ein bisschen rumprobieren. ich bin blutige anf=C3=A4ngerin =
und zu allen =C3=BCberfluss ist die bedienungsanleitung zu meiner n=C3=A4hm=
aschine auch nicht auffindbar. jedenfalls hat mein papa mir eine kleine ein=
weisung gegeben und zumindest dachte ich, dass ich damit erstmal =C3=BCber =
die runden komme - bis mir vorhin nach meinen ersten 10 cm die nadel gebroc=
hen ist. ich habe sie dann gewechselt und wollte weitern=C3=A4hen, aber die=
 maschine war da anderer meinung.\n\nPassendes Zubeh=C3=B6r und Ersatzteile=
 f=C3=BCr Ihre Veritas 8014/39. Sollten Sie einen gew=C3=BCnschten Artikel =
nicht finden, verwenden Sie bitte unser Anfrageformular.\nHinweis: Artikel =
mit der Kennzeichnung "ARCHIV" sind vom Hersteller leider nicht mehr liefer=
bar!\n\nMeine Schwiegermutter besitzt eine Veritas N=C3=A4hmaschine 8014/39=
 Textima, leider n=C3=A4ht sie nicht mehr ordnungsgem=C3=A4=C3=9F, beim 2 S=
tich scheint sie stehen zu bleiben als ob sie es nicht Schaft den faden von=
 unten hoch zu holen..... auf der Unterseite des Stoffes sind wie lauter Sc=
hlaufen ...siehe Bild.... Ich gehe davon aus das eventuell die spule defekt=
 ist.... da ich keine Ahnung davon habe frage ich mal hier in der Runde ...=
ob jemand ne Idee hat was es sein k=C3=B6nnte. ?.\n\nist die Bedienungsanle=
itung vorhanden, wenn nicht m=C3=BCsste die unter Textima, veritas, victori=
a zu finden sein, dann erst mal alle F=C3=A4den raus, reinigen, neue Nadel,=
 nach Anweisung =C3=B6len, ordentlich aufspulen und einf=C3=A4deln, langsam=
 ann=C3=A4hen und die Anfangsf=C3=A4den festhalten\n eebf2c3492\n</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0aad98b0-2120-49fc-bcfe-b37254cf8a00n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0aad98b0-2120-49fc-bcfe-b37254cf8a00n%40googlegroups.co=
m</a>.<br />

------=_Part_173_804874033.1701733127152--

------=_Part_172_804281773.1701733127152--
