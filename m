Return-Path: <jailhouse-dev+bncBDU3FVHVUUNRBI4IZOXAMGQEUWQEI4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103e.google.com (mail-pj1-x103e.google.com [IPv6:2607:f8b0:4864:20::103e])
	by mail.lfdr.de (Postfix) with ESMTPS id AD762859AE1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Feb 2024 03:59:49 +0100 (CET)
Received: by mail-pj1-x103e.google.com with SMTP id 98e67ed59e1d1-2990e2d497fsf3654361a91.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 18 Feb 2024 18:59:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1708311588; cv=pass;
        d=google.com; s=arc-20160816;
        b=fNboyEt7Gk/XN0cjwjuEFc5+73dSPuhtnGjA7pT1CVwBDyaMi0e14t4s68v3FobTPM
         dA0s1dS9bvjvL3DotZYUA+Lu/stISVzt5m+Wn9Choe1vMs6cAWSYd6AlnbR1DEUFhmjm
         6kiimoqBVsz83tmfYlmDWdS+LfVkiWQ7/w3lkwaVD0UBIScPTrkYhLXe/BktgXAmhCoJ
         BvYoKxbVumPMPRNk/FBzcrGkONQ2jIl3pF6mYFGS9Wr28ixIzPW3my1KK+f1gJIijoo+
         /9NuGSxr+3eGTUTTql6ROOhbPIKrGYE3qGrWpw0Ieve2hV4Hze1qWtZNrWiMkMaZB1+B
         iGlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=ANoHzQRXDsKToZ180tMT+s0KoC0Xc14m4Kn3lSpnPRw=;
        fh=FGwwaVMXqbKSLQUO8NqmGCJVj7HynMfXtNWzssIk8as=;
        b=sVETPN5ZMZlSVppmlqeOrODfVmvd3zpKHEeVyHfIT8hg3d0GHkfYf1slusTpGmvj3q
         msr29O4xrwtTO6l/edYDYEQxQGNbJgdZbh2IH20l9//Ab29yraDiq47Z74DB29Qm57Q9
         AmO9LW1sALBgybZBE7jgsGRbuMhgGsnaiTEJi36FtGV/7M5RCzoQja1vnTcbFopUIfCk
         rYc5hZ0X8GMRHRgbkgRWWgq33YQP4SHCCzXtYIJDxprR9cstbQ+MRwFtepPzswyWdjM4
         JE/E6oSrpbCK/OJ0ep3gysMRGeImFbzPEak44P/5ScVKRsMnS/F0RRJn7Za9oth+43wO
         AURA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZuVryVfW;
       spf=pass (google.com: domain of infobanqueatlantique001@gmail.com designates 2607:f8b0:4864:20::12c as permitted sender) smtp.mailfrom=infobanqueatlantique001@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1708311588; x=1708916388; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ANoHzQRXDsKToZ180tMT+s0KoC0Xc14m4Kn3lSpnPRw=;
        b=oH5s37GnF3QpnoRekBp81w4nkI6NQVoNj7rU10veC6fWHsSkHM+dOZABXJ7okWBRMQ
         Gch6qzasE4bG9vVl/cBu6arGTz/t0LKVJQBB7Qk/vmwQalqSqOxdM4wJA3SX5McmsqKq
         ywgzeG9+NJrXIJ2qdtR0OTahU29al4hNbnfe6gqhAg9+NVqyVctw34NR4PSqq8g25pl2
         /85DhUNUWBZQNVAjrdxJlXLEcjhiKI8V6dffmXRKtBTjB+gC6HMV6X+ybVKeimjn5NgI
         Ubm2pklMo/HuyaOkZGVMOIbAK4Z/0RPtwjv1op45UGIRRei16iBftpHdHj1AiGOvHsNK
         cd2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708311588; x=1708916388; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ANoHzQRXDsKToZ180tMT+s0KoC0Xc14m4Kn3lSpnPRw=;
        b=icLTEuf0/vodi3paCv49y+eAtxcT0XqpWuIARvaMBySILyCOAMUIWhknGRIShtqgou
         Xp5ezzUw7JP1ydQaaZ9kcXpqwQGbOsaZx9mRcg6mwC8n4gFlVYFOrdOSgcix/9JreDAL
         XUyn4h4ah1iVA/LZM99MI9aIij3DNh2OUcek2+gyq7wSXA0y5E4j4E6dGt1J0zqXsUnF
         njCxErJsr0qUXV0hlXAe7jIJEigtZW3dhPGdKRe/SwQGUPxujiDm2vUyE/HEuuh5gkQG
         51zjI7mgfEbSwuCV+6ynkLofICAzQDUhE3jxaeo2GKDZlkRhRITqKMZyC3taiREClwHO
         zJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708311588; x=1708916388;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:x-beenthere:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ANoHzQRXDsKToZ180tMT+s0KoC0Xc14m4Kn3lSpnPRw=;
        b=Q0JjTdldKBeiibQcqL1Toq7CLy106ltP4sPVQv4TQq/bzM+ttA7YPioN2ym7oT+ICN
         k8GYKfLINuSpg/ynCCQLE2bDSxUsgdDINQYwu38J3nbdNgOsTUo3cBvzWrASXiV4v3VR
         xqFixKG8ySLN0TDIYs1oYFA3UmtuLiSSXGBCYzaF7ImNtPxNypxJaWgW3jOKSUPJl4Qv
         Q1mgdQwRixfZDXmVthHpoyx1uYkLBCDVgkzuy8s7J665Cz+JgnDYaYDGO3En9wVtz9Z3
         /Ma1IYzwWtfgmC01epBW2e6IkO9O8Men1f8ZkstFeFvjn+6Ar/5mwTlpjqN16sDt/yD5
         s48A==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCWapgwXCC2mya0pJkAEmi9GzzDtQ0imvXVhEdA8hPqcIXjCjzqJrrR7QyazCT//9Ba9Z+OQwlRoLpDZ8Ev6RGTbzO3ZSfXGLSWjyno=
X-Gm-Message-State: AOJu0Yyt5ydGwmds/AGhTYeujG2duTDuq4iED/2bGKY8H3cGOQGnLwjw
	uOOEQHbhQm9NiWDb/nAJgFQbW/h/vLvmnIrfOrNRoPRlxzFbM2Bb
X-Google-Smtp-Source: AGHT+IHESMTulAln812VexswAzjoXaPWBGJs+rizcDjTEYT+LkpYIlu+/Wqqau4uO7hBPAG8FCPmbg==
X-Received: by 2002:a05:6a20:87a8:b0:19e:ba40:83e9 with SMTP id g40-20020a056a2087a800b0019eba4083e9mr9486082pzf.17.1708311587853;
        Sun, 18 Feb 2024 18:59:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:348c:b0:6e4:4320:31d7 with SMTP id
 cp12-20020a056a00348c00b006e4432031d7ls994353pfb.2.-pod-prod-08-us; Sun, 18
 Feb 2024 18:59:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWCpyTXWtHLZNrGaPie+TGaD2YMS88Hh3vE4KQH65PWL2BEVIiOACZncKrDT0A+dTpXZGVlFFIKnjEBXlZpzbObTr2Et9nmFeWvDC9n9+4=
X-Received: by 2002:a05:6a20:e188:b0:19e:3006:5dc5 with SMTP id ks8-20020a056a20e18800b0019e30065dc5mr13321545pzb.3.1708311585459;
        Sun, 18 Feb 2024 18:59:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708311585; cv=none;
        d=google.com; s=arc-20160816;
        b=zl0kRZmqkl8xmakjL+4BwaqgFAML9T6C40ZRuPCnXK9q7tCmRYZ+rM5xmMtn/RiWbj
         Utruo/wt3ZyevReF2soooMaKyan/ZuJ8aulLiwg2g9rcna4mgAfheSllUxtZkwsZmbtm
         +MKPUWlRQhvzDDx/QW6ENOPo622b8BKu32u/tuPGDK1IW5WeYmP8rMVypf8mj9E/P1b3
         DqPzP99p45YT6NEStgmfagMHgoeW9qz3ZzBVG5Iyau60gLc+vke15uR7LGUjJutYzA3F
         el+rqy7IWkCZkRwtex2qX62kVaKkfTgkitaskrp83/2rIqcVDLemgpyPhzi2Dyl7AJgf
         ShBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=oLdm8h8QSGbAQx38fdnqCF6ugKh1DTiKNt8rj8x52oc=;
        fh=Txa41xlmzXr/m3lRDt3yj+yNyDgf/x1I2YWxFuPR32Q=;
        b=k8LNKuwbiG2KZw1CtwHokzv9pkl4anH6ADcDnm6w7OB1Et85zOuSLiCCVW3ERPRGFS
         hyE8eGBNb3eSvyR9sDt89NKUyzEWeR0xO4c1KeWYxeZLWaVGwrtq3+a+bNk4xKQrq99Z
         43/ke2uEja63zoJEFuZCg0peApqIxtwy6v+QPToobpLcvI+HdRwnxgYDap8zmuTeRr/k
         F+A3q0VgD+aqekOxSAGZAJRNkE8Ku0qezxxi6CXYH3r5r/I29ByU55lrgdOHnwE0ZGHJ
         Ugja+c0qCtn/5iX0jZJl5lfuqL0IBRluUYdhTTnrD2JpC0MdOOUjnb828py2n4SmEelk
         mTKw==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZuVryVfW;
       spf=pass (google.com: domain of infobanqueatlantique001@gmail.com designates 2607:f8b0:4864:20::12c as permitted sender) smtp.mailfrom=infobanqueatlantique001@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com. [2607:f8b0:4864:20::12c])
        by gmr-mx.google.com with ESMTPS id bv21-20020a17090af19500b002991190f5c0si347830pjb.0.2024.02.18.18.59.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 18:59:45 -0800 (PST)
Received-SPF: pass (google.com: domain of infobanqueatlantique001@gmail.com designates 2607:f8b0:4864:20::12c as permitted sender) client-ip=2607:f8b0:4864:20::12c;
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3650df44657so5858195ab.0
        for <jailhouse-dev@googlegroups.com>; Sun, 18 Feb 2024 18:59:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWiLGNFQ/yaZ3nJYGrNHdxGb32FPivV1Lvh33JwDEDBfvfdrWbDn2sDMUibnrr+Bc1LyYtEsWco42EL4Dy1CnYO/l9+JwPVFq8LLZsSJpA=
X-Received: by 2002:a05:6e02:1147:b0:365:2b8d:e26a with SMTP id
 o7-20020a056e02114700b003652b8de26amr2255001ill.1.1708311584924; Sun, 18 Feb
 2024 18:59:44 -0800 (PST)
MIME-Version: 1.0
From: ROSE RICHARD <r2000016@gmail.com>
Date: Mon, 19 Feb 2024 03:59:32 +0100
Message-ID: <CANNWOeL47QN14QG8gzusr=fLG67n8NgWZEcjXqpJ+MugdCp+2Q@mail.gmail.com>
Subject: Hallo Schatz
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000002f718f0611b34945"
X-Original-Sender: r2000016@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20230601 header.b=ZuVryVfW;       spf=pass
 (google.com: domain of infobanqueatlantique001@gmail.com designates
 2607:f8b0:4864:20::12c as permitted sender) smtp.mailfrom=infobanqueatlantique001@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000002f718f0611b34945
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hallo Schatz
Ich bin Miss.Rose Richard aus Abidjan, Elfenbeink=C3=BCste (C=C3=B4te d'Ivo=
ire). Ich
bin ein 17-j=C3=A4hriges M=C3=A4dchen, eine Waise. Da ich keine Eltern habe=
, drohen
meine Onkel, mich wegen des Erbes, das mein Vater mir hinterlassen hat,
umzubringen.
Bitte, ich brauche Ihre aufrichtige Hilfe. Ich habe (3.500.000,00 $
(US-Dollar) Drei Millionen f=C3=BCnfhunderttausend US-Dollar, die ich von m=
einem
verstorbenen Vater geerbt habe, aber er hat das Geld auf ein Fest-/Suspense
Konto bei einer der besten Banken hier in Abidjan eingezahlt, in Absprache
mit der Bank, an die das Geld =C3=BCberwiesen werden soll ein ausl=C3=A4ndi=
sches
Bankkonto f=C3=BCr Investitionen im Ausland, er verstarb jedoch, ohne das G=
eld
zu =C3=BCberweisen.
Mein Vater hat meinen Namen als seine einzige Tochter f=C3=BCr die n=C3=A4c=
hsten
Angeh=C3=B6rigen verwendet, als er das Geld eingezahlt hat, und das Geld ka=
nn
nur auf ein ausl=C3=A4ndisches Bankkonto =C3=BCberwiesen werden.
Alles, was ich brauche, ist Ihre Ehrlichkeit als mein ausl=C3=A4ndischer
Berater, Ihre Hilfe bei der Anlage des Fonds und Ihre Hilfe bei der
Fortf=C3=BChrung meiner Ausbildung in Ihrem Land.
Bitte bekunden Sie Ihr Interesse, indem Sie mir zur=C3=BCckschreiben, wenn =
Sie
bereit sind, mir bei diesem Zweck zu helfen. Anschlie=C3=9Fend werde ich Ih=
nen
die erforderlichen Informationen zum weiteren Vorgehen zukommen lassen und
Ihnen anschlie=C3=9Fend 20 % des Gesamtbetrags f=C3=BCr Ihre Hilfe auszahle=
n . Danke
f=C3=BCr deine Besorgnis.
Dein,
Miss.Rose Richard

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CANNWOeL47QN14QG8gzusr%3DfLG67n8NgWZEcjXqpJ%2BMugdCp%2B2Q%40m=
ail.gmail.com.

--0000000000002f718f0611b34945
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hallo Schatz<br>Ich bin Miss.Rose Richard aus Abidjan, Elf=
enbeink=C3=BCste (C=C3=B4te d&#39;Ivoire). Ich bin ein 17-j=C3=A4hriges M=
=C3=A4dchen, eine Waise. Da ich keine Eltern habe, drohen meine Onkel, mich=
 wegen des Erbes, das mein Vater mir hinterlassen hat, umzubringen.<br>Bitt=
e, ich brauche Ihre aufrichtige Hilfe. Ich habe (3.500.000,00 $<br>(US-Doll=
ar) Drei Millionen f=C3=BCnfhunderttausend US-Dollar, die ich von meinem ve=
rstorbenen Vater geerbt habe, aber er hat das Geld auf ein Fest-/Suspense K=
onto bei einer der besten Banken hier in Abidjan eingezahlt, in Absprache m=
it der Bank, an die das Geld =C3=BCberwiesen werden soll ein ausl=C3=A4ndis=
ches Bankkonto f=C3=BCr Investitionen im Ausland, er verstarb jedoch, ohne =
das Geld zu =C3=BCberweisen.<br>Mein Vater hat meinen Namen als seine einzi=
ge Tochter f=C3=BCr die n=C3=A4chsten Angeh=C3=B6rigen verwendet, als er da=
s Geld eingezahlt hat, und das Geld kann nur auf ein ausl=C3=A4ndisches Ban=
kkonto =C3=BCberwiesen werden.<br>Alles, was ich brauche, ist Ihre Ehrlichk=
eit als mein ausl=C3=A4ndischer Berater, Ihre Hilfe bei der Anlage des Fond=
s und Ihre Hilfe bei der Fortf=C3=BChrung meiner Ausbildung in Ihrem Land.<=
br>Bitte bekunden Sie Ihr Interesse, indem Sie mir zur=C3=BCckschreiben, we=
nn Sie bereit sind, mir bei diesem Zweck zu helfen. Anschlie=C3=9Fend werde=
 ich Ihnen die erforderlichen Informationen zum weiteren Vorgehen zukommen =
lassen und Ihnen anschlie=C3=9Fend 20 % des Gesamtbetrags f=C3=BCr Ihre Hil=
fe auszahlen . Danke f=C3=BCr deine Besorgnis.<br>Dein,<br>Miss.Rose Richar=
d<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CANNWOeL47QN14QG8gzusr%3DfLG67n8NgWZEcjXqpJ%2BMugd=
Cp%2B2Q%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CANNWOeL47QN14QG8gzusr%3DfLG67n8NgWZE=
cjXqpJ%2BMugdCp%2B2Q%40mail.gmail.com</a>.<br />

--0000000000002f718f0611b34945--
