Return-Path: <jailhouse-dev+bncBCDJXM4674ERBM4MTTZAKGQE2FXAIEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23f.google.com (mail-oi1-x23f.google.com [IPv6:2607:f8b0:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id E920215F7DA
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 21:42:28 +0100 (CET)
Received: by mail-oi1-x23f.google.com with SMTP id c22sf5291415oic.20
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 12:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=f5ZWxYptZ5C1fFeb/xJShoXnzDJnwhdfxfgaGdhwoFE=;
        b=bnz6mipohB+3LdCIs53NQjLI4cU9hm7va0gqimjJajUHQsUzaWxnYvOO0RhSnyeD8Z
         MFFahdxGcBcaCeje71hjj8CfdYLA0esucldTqvczGef21K0VpdOmb/XbzwtGaFlvAb5V
         FTpdXZZlD0/dcUvTfguGVQdO9r/9O8tquXAjUx+v16Wbs22FE2TeUpxazgJnL5p26WT0
         zg2rnQun4zgQzECgjOQkFVk5TiL8n5Vo5z3j7IYDXohGaa5NQzn/Kb3q3k+E4Wfr8vYF
         cP1ktw35Y3amjJlGph6ldhPmaAYSW1s1EiL5MO3Rh0Swd87H695kM1ZLhNf1a6/slPkm
         MjZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=f5ZWxYptZ5C1fFeb/xJShoXnzDJnwhdfxfgaGdhwoFE=;
        b=spt49V9ldH7eTLc0tM0b8g3YLTwlWIVuU5PEfGuzMGilFJ6sKRKKgrFzv+JhTA44p4
         69urjA4axWe07S4Er7zzfHevcsTG/lv7FaEiHH+yauSsk9q/wLM4v73Y4Fhy+/wDyaJz
         vsm9yBN4iiKU02i+vlIxEPLIaxt5kdoGIG6II84fLA1l454lP93q8kR4p8ygLcJiL5KM
         RUolH5rjh1oojUe7gVCtxkUmbOP4vhZTEMZwTpU8ecWXu+w6uJPUTv1jCpx+sZ2cyYHx
         Y6zpX0OYpH0gENMpgEAuY1DgKc12mqjKWpA6PQLaAGkC/gjicz8x3Gi0pD9xh1b6MIoi
         lD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=f5ZWxYptZ5C1fFeb/xJShoXnzDJnwhdfxfgaGdhwoFE=;
        b=K8JcMiVIzock+OssMCcv0Ir0LoBruYvteD8B6R0p6EnQfnl/+aNvAYuNLU0Gd5N9Jo
         yK/BnhLypVuTh6rq6IAAhNJ63+LFnO4u+DLK+pgkhqx0ylUfPHog0T0+NiXkezM1Z/kd
         yEnkP/pifUAPOUOWntnd2hZQmibaRZOWOrx8aPrIpI4Y4fiYYhldySJ32jLL6qHkVC7y
         0w7eYRpgVdIjHq1C0jL6sFLOAzz0RCn+AMKjFTKoKnMaF5ZicUz4NM95w2w5NHavYvDf
         akBWis8JN7qw73TjnCUzdqZlef401SQqBi7Pqh05uTKAkYvQ2mcmVkAI05Bhgdx2DKaq
         OEww==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWQ/2m7aBxMeLB8kjRpKd9i9jGpleGMRtl/pjkzBIVqccFy74C5
	5p7aaEHVoV8TpuoX8wo/wJE=
X-Google-Smtp-Source: APXvYqy1bpVJyq+vhMIc2yqamJcdUJu0x2lWinLn+iVA5n9+fIH2kG4hNvMRmy59cWfhAHobLurxFQ==
X-Received: by 2002:aca:b483:: with SMTP id d125mr3231900oif.167.1581712947644;
        Fri, 14 Feb 2020 12:42:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7999:: with SMTP id h25ls34345otm.2.gmail; Fri, 14 Feb
 2020 12:42:27 -0800 (PST)
X-Received: by 2002:a9d:7508:: with SMTP id r8mr3741173otk.116.1581712947097;
        Fri, 14 Feb 2020 12:42:27 -0800 (PST)
Date: Fri, 14 Feb 2020 12:42:26 -0800 (PST)
From: Michael Hinton <michael.g.hinton@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0d86ac87-9d3c-42c4-b499-af40aa76d302@googlegroups.com>
Subject: Strange newlines for console output
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3447_418952329.1581712946367"
X-Original-Sender: Michael.G.Hinton@gmail.com
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

------=_Part_3447_418952329.1581712946367
Content-Type: multipart/alternative; 
	boundary="----=_Part_3448_2120048704.1581712946367"

------=_Part_3448_2120048704.1581712946367
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



Hello,

I wanted to get some feedback on how Jailhouse is implementing newlines for=
=20
console printing.

Here's the code:

https://github.com/siemens/jailhouse/blob/92db71f257fabd3c08fa4b99498fa61a4=
1ea831d/inmates/lib/printk.c#L60-L63

https://github.com/siemens/jailhouse/blob/92db71f257fabd3c08fa4b99498fa61a4=
1ea831d/hypervisor/uart.c#L25-L28

You can see that the code is doing this:

if (c =3D=3D '\n')

c =3D '\r';

else

c =3D *msg++;

So if the last character printed was '\n' (the Line Feed character), this=
=20
code injects an '\r' (the Carriage Return character). I=E2=80=99m assuming =
the=20
reason for this is just in case the console output is on Windows. Looking=
=20
through the git history, it looks like this pattern has been in Jailhouse=
=20
since the very beginning.

This seems incorrect to me. The thing is, Windows newlines are CR + LF, in=
=20
that order, while Jailhouse is printing LF + CR, which doesn=E2=80=99t matc=
h Unix=20
_or_ Windows. See https://en.wikipedia.org/wiki/Newline#Representation.=20
However, maybe there is a good reason for this that I don=E2=80=99t see yet=
.

I=E2=80=99m consuming the Jailhouse console output in Linux, not Windows, b=
ut this=20
still causes trouble because the extra CR after the LF can mess up awk (and=
=20
possibly other line-based parsing tools). For more details, see=20
https://stackoverflow.com/questions/60203007/awk-is-only-matching-the-first=
-line-when-matching-against-first-column
.

One solution is to reverse the order: inject CR _before_ printing LF.=20
Another solution is to not inject CR at all, and leave it to the users of=
=20
printk() to manually insert CR when needed.

Let me know what you all think.

Thanks,

-Michael

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0d86ac87-9d3c-42c4-b499-af40aa76d302%40googlegroups.com.

------=_Part_3448_2120048704.1581712946367
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"docs-internal-guid-439e2a7e-7fff-78a3-2f5a-101=
b2deb36d4" style=3D"color: rgb(0, 0, 0); font-size: medium;"><p dir=3D"ltr"=
 style=3D"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span st=
yle=3D"font-size: 11pt; font-family: Nunito, sans-serif; background-color: =
transparent; font-variant-numeric: normal; font-variant-east-asian: normal;=
 vertical-align: baseline; white-space: pre-wrap;">Hello,</span></p><br><p =
dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt=
;"><span style=3D"font-size: 11pt; font-family: Nunito, sans-serif; backgro=
und-color: transparent; font-variant-numeric: normal; font-variant-east-asi=
an: normal; vertical-align: baseline; white-space: pre-wrap;">I wanted to g=
et some feedback on how Jailhouse is implementing newlines for console prin=
ting.</span></p><br><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: =
0pt; margin-bottom: 0pt;"><span style=3D"font-size: 11pt; font-family: Nuni=
to, sans-serif; background-color: transparent; font-variant-numeric: normal=
; font-variant-east-asian: normal; vertical-align: baseline; white-space: p=
re-wrap;">Here&#39;s the code:</span></p><p dir=3D"ltr" style=3D"line-heigh=
t: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><a href=3D"https://github.co=
m/siemens/jailhouse/blob/92db71f257fabd3c08fa4b99498fa61a41ea831d/inmates/l=
ib/printk.c#L60-L63"><span style=3D"font-size: 11pt; font-family: Nunito, s=
ans-serif; background-color: transparent; font-variant-numeric: normal; fon=
t-variant-east-asian: normal; text-decoration-line: underline; text-decorat=
ion-skip-ink: none; vertical-align: baseline; white-space: pre-wrap;">https=
://github.com/siemens/jailhouse/blob/92db71f257fabd3c08fa4b99498fa61a41ea83=
1d/inmates/lib/printk.c#L60-L63</span></a></p><p dir=3D"ltr" style=3D"line-=
height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><a href=3D"https://gith=
ub.com/siemens/jailhouse/blob/92db71f257fabd3c08fa4b99498fa61a41ea831d/hype=
rvisor/uart.c#L25-L28"><span style=3D"font-size: 11pt; font-family: Nunito,=
 sans-serif; background-color: transparent; font-variant-numeric: normal; f=
ont-variant-east-asian: normal; text-decoration-line: underline; text-decor=
ation-skip-ink: none; vertical-align: baseline; white-space: pre-wrap;">htt=
ps://github.com/siemens/jailhouse/blob/92db71f257fabd3c08fa4b99498fa61a41ea=
831d/hypervisor/uart.c#L25-L28</span></a></p><br><p dir=3D"ltr" style=3D"li=
ne-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style=3D"font-=
size: 11pt; font-family: Nunito, sans-serif; background-color: transparent;=
 font-variant-numeric: normal; font-variant-east-asian: normal; vertical-al=
ign: baseline; white-space: pre-wrap;">You can see that the code is doing t=
his:</span></p><br><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0=
pt; margin-bottom: 0pt;"><span style=3D"font-size: 11pt; font-family: &quot=
;Roboto Mono&quot;, monospace; background-color: transparent; font-variant-=
numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;=
 white-space: pre-wrap;">if (c =3D=3D &#39;\n&#39;)</span></p><p dir=3D"ltr=
" style=3D"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span s=
tyle=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; b=
ackground-color: transparent; font-variant-numeric: normal; font-variant-ea=
st-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span c=
lass=3D"Apple-tab-span" style=3D"white-space: pre;">	</span></span><span st=
yle=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; ba=
ckground-color: transparent; font-variant-numeric: normal; font-variant-eas=
t-asian: normal; vertical-align: baseline; white-space: pre-wrap;">c =3D &#=
39;\r&#39;;</span></p><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top=
: 0pt; margin-bottom: 0pt;"><span style=3D"font-size: 11pt; font-family: &q=
uot;Roboto Mono&quot;, monospace; background-color: transparent; font-varia=
nt-numeric: normal; font-variant-east-asian: normal; vertical-align: baseli=
ne; white-space: pre-wrap;">else</span></p><p dir=3D"ltr" style=3D"line-hei=
ght: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style=3D"font-size: =
11pt; font-family: &quot;Roboto Mono&quot;, monospace; background-color: tr=
ansparent; font-variant-numeric: normal; font-variant-east-asian: normal; v=
ertical-align: baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-s=
pan" style=3D"white-space: pre;">	</span></span><span style=3D"font-size: 1=
1pt; font-family: &quot;Roboto Mono&quot;, monospace; background-color: tra=
nsparent; font-variant-numeric: normal; font-variant-east-asian: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">c =3D *msg++;</span></p><br=
><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; margin-bottom:=
 0pt;"><span style=3D"font-size: 11pt; font-family: Nunito, sans-serif; bac=
kground-color: transparent; font-variant-numeric: normal; font-variant-east=
-asian: normal; vertical-align: baseline; white-space: pre-wrap;">So if the=
 last character printed was </span><span style=3D"font-size: 11pt; font-fam=
ily: &quot;Roboto Mono&quot;, monospace; background-color: transparent; fon=
t-variant-numeric: normal; font-variant-east-asian: normal; vertical-align:=
 baseline; white-space: pre-wrap;">&#39;\n&#39;</span><span style=3D"font-s=
ize: 11pt; font-family: Nunito, sans-serif; background-color: transparent; =
font-variant-numeric: normal; font-variant-east-asian: normal; vertical-ali=
gn: baseline; white-space: pre-wrap;"> (the Line Feed character), this code=
 injects an </span><span style=3D"font-size: 11pt; font-family: &quot;Robot=
o Mono&quot;, monospace; background-color: transparent; font-variant-numeri=
c: normal; font-variant-east-asian: normal; vertical-align: baseline; white=
-space: pre-wrap;">&#39;\r&#39;</span><span style=3D"font-size: 11pt; font-=
family: Nunito, sans-serif; background-color: transparent; font-variant-num=
eric: normal; font-variant-east-asian: normal; vertical-align: baseline; wh=
ite-space: pre-wrap;"> (the Carriage Return character). I=E2=80=99m assumin=
g the reason for this is just in case the console output is on Windows. Loo=
king through the git history, it looks like this pattern has been in Jailho=
use since the very beginning.</span></p><br><p dir=3D"ltr" style=3D"line-he=
ight: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style=3D"font-size:=
 11pt; font-family: Nunito, sans-serif; background-color: transparent; font=
-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: =
baseline; white-space: pre-wrap;">This seems incorrect to me. The thing is,=
 Windows newlines are </span><span style=3D"font-size: 11pt; font-family: &=
quot;Roboto Mono&quot;, monospace; background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;">CR</span><span style=3D"font-size: 11pt; font-=
family: Nunito, sans-serif; background-color: transparent; font-variant-num=
eric: normal; font-variant-east-asian: normal; vertical-align: baseline; wh=
ite-space: pre-wrap;"> + </span><span style=3D"font-size: 11pt; font-family=
: &quot;Roboto Mono&quot;, monospace; background-color: transparent; font-v=
ariant-numeric: normal; font-variant-east-asian: normal; vertical-align: ba=
seline; white-space: pre-wrap;">LF</span><span style=3D"font-size: 11pt; fo=
nt-family: Nunito, sans-serif; background-color: transparent; font-variant-=
numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;=
 white-space: pre-wrap;">, in that order, while Jailhouse is printing </spa=
n><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, mon=
ospace; background-color: transparent; font-variant-numeric: normal; font-v=
ariant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;=
">LF</span><span style=3D"font-size: 11pt; font-family: Nunito, sans-serif;=
 background-color: transparent; font-variant-numeric: normal; font-variant-=
east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"> + </=
span><span style=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, =
monospace; background-color: transparent; font-variant-numeric: normal; fon=
t-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wr=
ap;">CR</span><span style=3D"font-size: 11pt; font-family: Nunito, sans-ser=
if; background-color: transparent; font-variant-numeric: normal; font-varia=
nt-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;">, =
which doesn=E2=80=99t match Unix _or_ Windows. See </span><a href=3D"https:=
//en.wikipedia.org/wiki/Newline#Representation"><span style=3D"font-size: 1=
1pt; font-family: Nunito, sans-serif; background-color: transparent; font-v=
ariant-numeric: normal; font-variant-east-asian: normal; text-decoration-li=
ne: underline; text-decoration-skip-ink: none; vertical-align: baseline; wh=
ite-space: pre-wrap;">https://en.wikipedia.org/wiki/Newline#Representation<=
/span></a><span style=3D"font-size: 11pt; font-family: Nunito, sans-serif; =
background-color: transparent; font-variant-numeric: normal; font-variant-e=
ast-asian: normal; vertical-align: baseline; white-space: pre-wrap;">. Howe=
ver, maybe there is a good reason for this that I don=E2=80=99t see yet.</s=
pan></p><br><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; mar=
gin-bottom: 0pt;"><span style=3D"font-size: 11pt; font-family: Nunito, sans=
-serif; background-color: transparent; font-variant-numeric: normal; font-v=
ariant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;=
">I=E2=80=99m consuming the Jailhouse console output in Linux, not Windows,=
 but this still causes trouble because the extra </span><span style=3D"font=
-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; background-co=
lor: transparent; font-variant-numeric: normal; font-variant-east-asian: no=
rmal; vertical-align: baseline; white-space: pre-wrap;">CR</span><span styl=
e=3D"font-size: 11pt; font-family: Nunito, sans-serif; background-color: tr=
ansparent; font-variant-numeric: normal; font-variant-east-asian: normal; v=
ertical-align: baseline; white-space: pre-wrap;"> after the </span><span st=
yle=3D"font-size: 11pt; font-family: &quot;Roboto Mono&quot;, monospace; ba=
ckground-color: transparent; font-variant-numeric: normal; font-variant-eas=
t-asian: normal; vertical-align: baseline; white-space: pre-wrap;">LF</span=
><span style=3D"font-size: 11pt; font-family: Nunito, sans-serif; backgroun=
d-color: transparent; font-variant-numeric: normal; font-variant-east-asian=
: normal; vertical-align: baseline; white-space: pre-wrap;"> can mess up aw=
k (and possibly other line-based parsing tools). For more details, see </sp=
an><a href=3D"https://stackoverflow.com/questions/60203007/awk-is-only-matc=
hing-the-first-line-when-matching-against-first-column"><span style=3D"font=
-size: 11pt; font-family: Nunito, sans-serif; background-color: transparent=
; font-variant-numeric: normal; font-variant-east-asian: normal; text-decor=
ation-line: underline; text-decoration-skip-ink: none; vertical-align: base=
line; white-space: pre-wrap;">https://stackoverflow.com/questions/60203007/=
awk-is-only-matching-the-first-line-when-matching-against-first-column</spa=
n></a><span style=3D"font-size: 11pt; font-family: Nunito, sans-serif; back=
ground-color: transparent; font-variant-numeric: normal; font-variant-east-=
asian: normal; vertical-align: baseline; white-space: pre-wrap;">.</span></=
p><br><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; margin-bo=
ttom: 0pt;"><span style=3D"font-size: 11pt; font-family: Nunito, sans-serif=
; background-color: transparent; font-variant-numeric: normal; font-variant=
-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;">One =
solution is to reverse the order: inject CR _before_ printing LF. Another s=
olution is to not inject CR at all, and leave it to the users of printk() t=
o manually insert CR when needed.</span></p><br><p dir=3D"ltr" style=3D"lin=
e-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style=3D"font-s=
ize: 11pt; font-family: Nunito, sans-serif; background-color: transparent; =
font-variant-numeric: normal; font-variant-east-asian: normal; vertical-ali=
gn: baseline; white-space: pre-wrap;">Let me know what you all think.</span=
></p><br><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; margin=
-bottom: 0pt;"><span style=3D"font-size: 11pt; font-family: Nunito, sans-se=
rif; background-color: transparent; font-variant-numeric: normal; font-vari=
ant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;">T=
hanks,</span></p><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt=
; margin-bottom: 0pt;"><span style=3D"font-size: 11pt; font-family: Nunito,=
 sans-serif; background-color: transparent; font-variant-numeric: normal; f=
ont-variant-east-asian: normal; vertical-align: baseline; white-space: pre-=
wrap;">-Michael</span></p><div><span style=3D"font-size: 11pt; font-family:=
 Nunito, sans-serif; background-color: transparent; font-variant-numeric: n=
ormal; font-variant-east-asian: normal; vertical-align: baseline; white-spa=
ce: pre-wrap;"><br></span></div></span></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0d86ac87-9d3c-42c4-b499-af40aa76d302%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/0d86ac87-9d3c-42c4-b499-af40aa76d302%40googlegroups.com<=
/a>.<br />

------=_Part_3448_2120048704.1581712946367--

------=_Part_3447_418952329.1581712946367--
