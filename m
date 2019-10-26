Return-Path: <jailhouse-dev+bncBCDJXM4674ERBIM42DWQKGQESRV4CTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D626E596D
	for <lists+jailhouse-dev@lfdr.de>; Sat, 26 Oct 2019 11:13:07 +0200 (CEST)
Received: by mail-ot1-x340.google.com with SMTP id v20sf1886048ota.6
        for <lists+jailhouse-dev@lfdr.de>; Sat, 26 Oct 2019 02:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mYmPdlz7wa4OKuylO/Xma0GzrraPis2Efqcjnc/4VZM=;
        b=YsJhCMlhnip3haSPgZ3gMk4NP9N3peHx81BIa2xZ9G7efCP3x3NZFaEom48or6/iOd
         bxPCZIfiAte83hYMAf79VuVk2yBgzqZ/wLBFvtqmSq219rKSBKJy2/xC7SL4O+BudbZq
         Rsk6J8DL/0hRWg2MPouesWNQBy08Q4LSvWuW6JXXcTsMbJerAYblVfOT4W0bZ4otOiyJ
         V7RqYv+PiUGYoBewb7OZ0yKAzdgHSX6RyrvJG6b71/Ur0O+bIK5F1wy4amEHvwFc9YxR
         fTFYnzThjsZ0l7ao3IR2iC9ZHqytyXXRYTuKPvzfgkkSl9NVawyFuk5DrYg2U6JOL3iC
         LTjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mYmPdlz7wa4OKuylO/Xma0GzrraPis2Efqcjnc/4VZM=;
        b=n9FyhPQy9Kq9tlAA8iBuIwKAVcKgd5IhB7oVcq88xY7fNK+TniWug2e7wHEw1aTf1T
         rbzBfGBkThYVbG8HbCTEt4U57eFeappd9ne7UJVCY8sQUXVTyMQhJpamQdtzBgaDJs03
         N1TBlQftH5KmIy7wKMApgJmuz8ErWdc2WUjXRnP7Of5mOnSQOf/uyrFoGooCq/EEP75e
         Pb4qm2ilFiOOad7ScQf2LTgHVV6BapJD4Ap4Pc9CGzW0BUF9DXBVKlD0sWBsNjOHTOxo
         9WQCtm2Q7aGkQ+Z2lPFi25mEUWBasIVsAceD9vNuPXiLK766UgRBaNVCnSy7J66zpzK9
         Dh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mYmPdlz7wa4OKuylO/Xma0GzrraPis2Efqcjnc/4VZM=;
        b=G9nyhtJCPWHzk6B4E0ca0hNCaTc8aXnKXkjbd7xYzeApKugjlxGhxXyvPF5SnTZCD1
         QMh5LFyVg1zBZjCrbSFEVxDIiD0kb0fbhX/VsR+oMPkmb8U48J6CRBVzW71vYDo6kis1
         yYDeF1oSGmXxU5vNN81e3K55hYuORd5syc15F5FUAz17X9L6Gf7Xk9xDeM24RNeY4OE0
         3FbqNTXReZPZbiTPhPt8j4DGngh1xP1IO7UvHVuvPiWMyJAL1QgjIzLhqaOEReJkBQvn
         7OEb6qaFsJ+QameRD3evevHQWZLsLQ47F2370GQKBDxvOGo6RHh3eN14TyYIL5Qqa3r8
         hAsQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWzH2AbF1qz7Lh+o/mIL6bYAZ2pjFcrHYM+f0nZw44eHRtI+Adl
	0raBSQChCcFzbIBjkZQ77dY=
X-Google-Smtp-Source: APXvYqyyKeV792jnXKyzdasfgiXhC7Lb/KaxJhRJxCtzZZk+gNR7KOidaZe53YSQ3n0j2M4lUyOFvQ==
X-Received: by 2002:a9d:39a5:: with SMTP id y34mr6058161otb.36.1572081186098;
        Sat, 26 Oct 2019 02:13:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:32a4:: with SMTP id u33ls2443116otb.16.gmail; Sat, 26
 Oct 2019 02:13:05 -0700 (PDT)
X-Received: by 2002:a9d:503:: with SMTP id 3mr6015648otw.53.1572081185312;
        Sat, 26 Oct 2019 02:13:05 -0700 (PDT)
Date: Sat, 26 Oct 2019 02:13:04 -0700 (PDT)
From: michael.g.hinton@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f524bf21-7361-4cac-9766-789ed9c92ab2@googlegroups.com>
Subject: GCC 8 + 9 not compiling cell configs correctly in Kubuntu 19.10
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_617_60554236.1572081184643"
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

------=_Part_617_60554236.1572081184643
Content-Type: multipart/alternative; 
	boundary="----=_Part_618_1216374828.1572081184644"

------=_Part_618_1216374828.1572081184644
Content-Type: text/plain; charset="UTF-8"



Hello,

 

After updating to Kubuntu 19.10 (kernel 5.3) from 19.04, I get the 
following error when trying to enable the root cell:

 

JAILHOUSE_ENABLE: Invalid argument

 

dmesg shows:

 

[  475.080776] jailhouse: Not a system configuration

 

which comes from this code in driver/main.c#jailhouse_cmd_enable():

 

if (memcmp(config_header.signature, JAILHOUSE_SYSTEM_SIGNATURE,

  sizeof(config_header.signature)) != 0) {

pr_err("jailhouse: Not a system configuration\n");

return -EINVAL;

}

 

So the header signature is not correct. Looking at the root config file 
itself, this is what I see for the first 32 bytes (in hex):

 

0400 0000 1000 0000 0500 0000 474e 5500

0200 00c0 0400 0000 0300 0000 0000 0000

 

Kubuntu 19.10 ships with GCC 9.2.1 as the default. I get the same output 
above when I specify make with gcc-8. However, if I run with gcc-7:

 

make CC=gcc-7

 

The cell config compiles properly and I'm able to enable the root cell. 
Here is what the first 32 bytes look like:

 

4a48 5359 5354 0c00 0100 0000 0000 003a

0000 0000 0000 0000 0000 0000 0000 6000

 

You can clearly see JHSYST.

 

Clearly, GCC 8 and 9 are not compiling the cell configs correctly. Or maybe 
I have something weird in my development environment causing GCC to do 
this. At any rate, just wanted to bring this to your attention. Luckily, 
compiling with gcc-7 seems to be a good workaround.

 

Thanks,

-Michael

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f524bf21-7361-4cac-9766-789ed9c92ab2%40googlegroups.com.

------=_Part_618_1216374828.1572081184644
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"docs-internal-guid-7ebcbe8b-7fff-c123-4b54-43b=
3432bc17a"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt;"><span style=3D"font-size: 10pt; font-family: Arial; font-varian=
t-numeric: normal; font-variant-east-asian: normal; vertical-align: baselin=
e; white-space: pre-wrap;">Hello,</span></p><p dir=3D"ltr" style=3D"line-he=
ight: 1.38; margin-top: 0pt; margin-bottom: 0pt;">=C2=A0</p><p dir=3D"ltr" =
style=3D"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span sty=
le=3D"font-size: 10pt; font-family: Arial; background-color: transparent; f=
ont-variant-numeric: normal; font-variant-east-asian: normal; vertical-alig=
n: baseline; white-space: pre-wrap;">After updating to Kubuntu 19.10 (kerne=
l 5.3) from 19.04, I get the following error when trying to enable the root=
 cell:</span></p><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt=
; margin-bottom: 0pt;">=C2=A0</p><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-left: 60pt;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-siz=
e: 10pt; font-family: &quot;Courier New&quot;; color: rgb(0, 0, 0); font-va=
riant-numeric: normal; font-variant-east-asian: normal; vertical-align: bas=
eline; white-space: pre-wrap;">JAILHOUSE_ENABLE: Invalid argument</span></p=
><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; margin-bottom:=
 0pt;">=C2=A0</p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt;"><span style=3D"font-size: 10pt; font-family: &quot;Courie=
r New&quot;; font-variant-numeric: normal; font-variant-east-asian: normal;=
 vertical-align: baseline; white-space: pre-wrap;">dmesg</span><span style=
=3D"font-size: 10pt; font-family: Arial; font-variant-numeric: normal; font=
-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wra=
p;"> shows:</span></p><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top=
: 0pt; margin-bottom: 0pt;">=C2=A0</p><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-left: 60pt;margin-top:0pt;margin-bottom:0pt;"><span style=3D"fon=
t-size: 10pt; font-family: &quot;Courier New&quot;; color: rgb(24, 178, 24)=
; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-a=
lign: baseline; white-space: pre-wrap;">[=C2=A0 475.080776] </span><span st=
yle=3D"font-size: 10pt; font-family: &quot;Courier New&quot;; color: rgb(17=
8, 104, 24); font-variant-numeric: normal; font-variant-east-asian: normal;=
 vertical-align: baseline; white-space: pre-wrap;">jailhouse</span><span st=
yle=3D"font-size: 10pt; font-family: &quot;Courier New&quot;; color: rgb(17=
8, 24, 24); font-variant-numeric: normal; font-variant-east-asian: normal; =
vertical-align: baseline; white-space: pre-wrap;">: Not a system configurat=
ion</span></p><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; m=
argin-bottom: 0pt;">=C2=A0</p><p dir=3D"ltr" style=3D"line-height: 1.38; ma=
rgin-top: 0pt; margin-bottom: 0pt;"><span style=3D"font-size: 10pt; font-fa=
mily: Arial; background-color: transparent; font-variant-numeric: normal; f=
ont-variant-east-asian: normal; vertical-align: baseline; white-space: pre-=
wrap;">which comes from this code in driver/main.c#jailhouse_cmd_enable():<=
/span></p><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; margi=
n-bottom: 0pt;">=C2=A0</p><p dir=3D"ltr" style=3D"line-height: 1.38; margin=
-top: 0pt; margin-bottom: 0pt;"><span style=3D"font-size: 10pt; font-family=
: &quot;Courier New&quot;; background-color: transparent; font-variant-nume=
ric: normal; font-variant-east-asian: normal; vertical-align: baseline; whi=
te-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pr=
e;">	</span></span><span style=3D"font-size: 10pt; font-family: &quot;Couri=
er New&quot;; background-color: transparent; font-variant-numeric: normal; =
font-variant-east-asian: normal; vertical-align: baseline; white-space: pre=
-wrap;">if (memcmp(config_header.signature, JAILHOUSE_SYSTEM_SIGNATURE,</sp=
an></p><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; margin-b=
ottom: 0pt;"><span style=3D"font-size: 10pt; font-family: &quot;Courier New=
&quot;; background-color: transparent; font-variant-numeric: normal; font-v=
ariant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;=
"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span>=
<span style=3D"font-size: 10pt; font-family: &quot;Courier New&quot;; backg=
round-color: transparent; font-variant-numeric: normal; font-variant-east-a=
sian: normal; vertical-align: baseline; white-space: pre-wrap;"><span class=
=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=
=3D"font-size: 10pt; font-family: &quot;Courier New&quot;; background-color=
: transparent; font-variant-numeric: normal; font-variant-east-asian: norma=
l; vertical-align: baseline; white-space: pre-wrap;"> =C2=A0 sizeof(config_=
header.signature)) !=3D 0) {</span></p><p dir=3D"ltr" style=3D"line-height:=
 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style=3D"font-size: 10pt=
; font-family: &quot;Courier New&quot;; background-color: transparent; font=
-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: =
baseline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"w=
hite-space:pre;">	</span></span><span style=3D"font-size: 10pt; font-family=
: &quot;Courier New&quot;; background-color: transparent; font-variant-nume=
ric: normal; font-variant-east-asian: normal; vertical-align: baseline; whi=
te-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pr=
e;">	</span></span><span style=3D"font-size: 10pt; font-family: &quot;Couri=
er New&quot;; background-color: transparent; font-variant-numeric: normal; =
font-variant-east-asian: normal; vertical-align: baseline; white-space: pre=
-wrap;">pr_err(&quot;jailhouse: Not a system configuration\n&quot;);</span>=
</p><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; margin-bott=
om: 0pt;"><span style=3D"font-size: 10pt; font-family: &quot;Courier New&qu=
ot;; background-color: transparent; font-variant-numeric: normal; font-vari=
ant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><=
span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><sp=
an style=3D"font-size: 10pt; font-family: &quot;Courier New&quot;; backgrou=
nd-color: transparent; font-variant-numeric: normal; font-variant-east-asia=
n: normal; vertical-align: baseline; white-space: pre-wrap;"><span class=3D=
"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"f=
ont-size: 10pt; font-family: &quot;Courier New&quot;; background-color: tra=
nsparent; font-variant-numeric: normal; font-variant-east-asian: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">return -EINVAL;</span></p><=
p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; margin-bottom: 0=
pt;"><span style=3D"font-size: 10pt; font-family: &quot;Courier New&quot;; =
background-color: transparent; font-variant-numeric: normal; font-variant-e=
ast-asian: normal; vertical-align: baseline; white-space: pre-wrap;"><span =
class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span st=
yle=3D"font-size: 10pt; font-family: &quot;Courier New&quot;; background-co=
lor: transparent; font-variant-numeric: normal; font-variant-east-asian: no=
rmal; vertical-align: baseline; white-space: pre-wrap;">}</span></p><p dir=
=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;">=
=C2=A0</p><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; margi=
n-bottom: 0pt;"><span style=3D"font-size: 10pt; font-family: Arial; backgro=
und-color: transparent; font-variant-numeric: normal; font-variant-east-asi=
an: normal; vertical-align: baseline; white-space: pre-wrap;">So the header=
 signature is not correct. Looking at the root config file itself, this is =
what I see for the first 32 bytes (in hex):</span></p><p dir=3D"ltr" style=
=3D"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;">=C2=A0</p><p d=
ir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;=
"><span style=3D"font-size: 10pt; font-family: Arial; background-color: tra=
nsparent; font-variant-numeric: normal; font-variant-east-asian: normal; ve=
rtical-align: baseline; white-space: pre-wrap;">0400 0000 1000 0000 0500 00=
00 474e 5500</span></p><p dir=3D"ltr" style=3D"line-height: 1.38; margin-to=
p: 0pt; margin-bottom: 0pt;"><span style=3D"font-size: 10pt; font-family: A=
rial; background-color: transparent; font-variant-numeric: normal; font-var=
iant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;">=
0200 00c0 0400 0000 0300 0000 0000 0000</span></p><p dir=3D"ltr" style=3D"l=
ine-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;">=C2=A0</p><p dir=3D=
"ltr" style=3D"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><sp=
an style=3D"font-size: 10pt; font-family: Arial; background-color: transpar=
ent; font-variant-numeric: normal; font-variant-east-asian: normal; vertica=
l-align: baseline; white-space: pre-wrap;">Kubuntu 19.10 ships with GCC 9.2=
.1 as the default. I get the same output above when I specify make with gcc=
-8. However, if I run with gcc-7:</span></p><p dir=3D"ltr" style=3D"line-he=
ight: 1.38; margin-top: 0pt; margin-bottom: 0pt;">=C2=A0</p><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-left: 60pt;margin-top:0pt;margin-bottom:0p=
t;"><span style=3D"font-size: 10pt; font-family: &quot;Courier New&quot;; f=
ont-variant-numeric: normal; font-variant-east-asian: normal; vertical-alig=
n: baseline; white-space: pre-wrap;">make CC=3Dgcc-7</span></p><p dir=3D"lt=
r" style=3D"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;">=C2=A0=
</p><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; margin-bott=
om: 0pt;"><span style=3D"font-size: 10pt; font-family: Arial; background-co=
lor: transparent; font-variant-numeric: normal; font-variant-east-asian: no=
rmal; vertical-align: baseline; white-space: pre-wrap;">The cell config com=
piles properly and I&#39;m able to enable the root cell. Here is what the f=
irst 32 bytes look like:</span></p><p dir=3D"ltr" style=3D"line-height: 1.3=
8; margin-top: 0pt; margin-bottom: 0pt;">=C2=A0</p><p dir=3D"ltr" style=3D"=
line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style=3D"fon=
t-size: 10pt; font-family: Arial; background-color: transparent; font-varia=
nt-numeric: normal; font-variant-east-asian: normal; vertical-align: baseli=
ne; white-space: pre-wrap;">4a48 5359 5354 0c00 0100 0000 0000 003a</span><=
/p><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; margin-botto=
m: 0pt;"><span style=3D"font-size: 10pt; font-family: Arial; background-col=
or: transparent; font-variant-numeric: normal; font-variant-east-asian: nor=
mal; vertical-align: baseline; white-space: pre-wrap;">0000 0000 0000 0000 =
0000 0000 0000 6000</span></p><p dir=3D"ltr" style=3D"line-height: 1.38; ma=
rgin-top: 0pt; margin-bottom: 0pt;">=C2=A0</p><p dir=3D"ltr" style=3D"line-=
height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style=3D"font-siz=
e: 10pt; font-family: Arial; background-color: transparent; font-variant-nu=
meric: normal; font-variant-east-asian: normal; vertical-align: baseline; w=
hite-space: pre-wrap;">You can clearly see JHSYST.</span></p><p dir=3D"ltr"=
 style=3D"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;">=C2=A0</=
p><p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; margin-bottom=
: 0pt;"><span style=3D"font-size: 10pt; font-family: Arial; background-colo=
r: transparent; font-variant-numeric: normal; font-variant-east-asian: norm=
al; vertical-align: baseline; white-space: pre-wrap;">Clearly, GCC 8 and 9 =
are not compiling the cell configs correctly. Or maybe I have something wei=
rd in my development environment causing GCC to do this. At any rate, just =
wanted to bring this to your attention. Luckily, compiling with gcc-7 seems=
 to be a good workaround.</span></p><p dir=3D"ltr" style=3D"line-height: 1.=
38; margin-top: 0pt; margin-bottom: 0pt;">=C2=A0</p><p dir=3D"ltr" style=3D=
"line-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style=3D"fo=
nt-size: 10pt; font-family: Arial; background-color: transparent; font-vari=
ant-numeric: normal; font-variant-east-asian: normal; vertical-align: basel=
ine; white-space: pre-wrap;">Thanks,</span></p><p dir=3D"ltr" style=3D"line=
-height: 1.38; margin-top: 0pt; margin-bottom: 0pt;"><span style=3D"font-si=
ze: 10pt; font-family: Arial; background-color: transparent; font-variant-n=
umeric: normal; font-variant-east-asian: normal; vertical-align: baseline; =
white-space: pre-wrap;">-Michael</span></p></span></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f524bf21-7361-4cac-9766-789ed9c92ab2%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/f524bf21-7361-4cac-9766-789ed9c92ab2%40googlegroups.com<=
/a>.<br />

------=_Part_618_1216374828.1572081184644--

------=_Part_617_60554236.1572081184643--
