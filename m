Return-Path: <jailhouse-dev+bncBCDJXM4674ERBK5VSXYQKGQEB3HUAHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 97427142461
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jan 2020 08:45:49 +0100 (CET)
Received: by mail-ot1-x33c.google.com with SMTP id f25sf17601456otq.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 19 Jan 2020 23:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mycKExBletokKXSUF3pm8XuIEgJZC5s5WqZZ1jhEThI=;
        b=qFRt1BDVxE9xZabXkCKv0o9b+LyazYWGI2wPt2MeHFUdsx5bShZUu5iYATSoTus/fB
         uG/CI2T3jCvdfac1ajjn5cs31lXo2PbYQFA6jakjNMEkMFsmY0KmbcabW6dPLRLYLkgp
         RTYUP3lvi/nldqWsAnbm0n7JHh1tR4iqgnODCm85MCjHtjp93ODfTv7TdbX+43IaBFG0
         vI44VfgrUIGkweMCjgyyGyxrrj0dWqWm8T0j+BAfgTyQur1St/xzTaTNhdMfPJK+1xxt
         iat12WdEq+zHOyAn5foUwFkbn6Hb9Y7eJbGYlwH7GrHSJMpYiFarCc2OXI7EQ1S7IpzE
         oxkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mycKExBletokKXSUF3pm8XuIEgJZC5s5WqZZ1jhEThI=;
        b=OnBRrN8GxtXAYjmG2TTqNl5z/bb3fu9Qj9PGdU2V3D7yrIsm1hD6Qiydn4dyJ5R83k
         w9WNG6tAbiZ+NflqBXbtxGUtaPlJo30N0KGIWSNNjwnU4hJurSIC/AxnavEu0CH1JVkb
         ahHPeNaFZIEM/rOBfNk/icp7WvyU0Cv/iATjeoJLHkXD9OIE6wgDCSNaizU9M3wrj6Mh
         YbOTW3jO/1su/IPR0mnRZ/LerefbRDok1cQ6lhVYF2dOTx9njWQp6BhyoLt3ejz4P/r7
         BVz0N86sOfzm8GVzuduz1oWaP1a+Js5OUzpVUhEAca76ORMwR0HDnNNQ7vK/rtDNb7pk
         289Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mycKExBletokKXSUF3pm8XuIEgJZC5s5WqZZ1jhEThI=;
        b=kC9riYjR9tZiAsVH7alyLTaKnv/nUfDqIOnSiPfK+K7QwHd4TWiRSaTfnPO0skmRod
         3SUGVXT0lC1RNzShKR8dXqinHqrCG7Aq+7XeMmdtz+9zxJvIWYfJ6GbANdO4Xutjn6H1
         cDYbstpG9Q6NrAOuxQIIipQDhXvXrd8SlngAH3U8To3ChTOfF6KMOmMKPpzeEN/U/lE4
         fp67jJIGiKpSLoq9nseTYuN/L3MVv1n4uXFha/E7A1ySFyWoEhrE4Z2ui7gEhOsZ+VXw
         oELelR6nozY6wGmF9IbIsKBrRD39xurrb63SgyHwGPSnVmHqRiv0L3uqSZmWq4TByxwR
         jDhA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUAuso0eCUWp3+cixo2+zuYnztCgpuNgCQIvhXu+gF865D33sjt
	XJ4Gl3OkMeXaa8tHUVQHorY=
X-Google-Smtp-Source: APXvYqyBg5OUXvWrte26y24fWkwiDts7dwBxDEOrjTp17+WpSk8qFDfK6JzH18raMdmt2PrEb/iFEg==
X-Received: by 2002:aca:bac3:: with SMTP id k186mr12397828oif.19.1579506348197;
        Sun, 19 Jan 2020 23:45:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7999:: with SMTP id h25ls5723765otm.2.gmail; Sun, 19 Jan
 2020 23:45:47 -0800 (PST)
X-Received: by 2002:a05:6830:109a:: with SMTP id y26mr14237075oto.227.1579506347332;
        Sun, 19 Jan 2020 23:45:47 -0800 (PST)
Date: Sun, 19 Jan 2020 23:45:46 -0800 (PST)
From: Michael Hinton <michael.g.hinton@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
Subject: Difference in execution duration between root cell and inmate for
 same code
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1163_2078910094.1579506346768"
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

------=_Part_1163_2078910094.1579506346768
Content-Type: multipart/alternative; 
	boundary="----=_Part_1164_147787382.1579506346768"

------=_Part_1164_147787382.1579506346768
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



Hello,

I have found that running code in an inmate is a lot slower than running=20
that same code in the root cell on my x86 machine. I am not sure why.


Am I correct in assuming that when `jailhouse enable <root_cell>` is=20
called, everything that runs after that in the Linux root cell is running=
=20
under the hypervisor, even when the inmate hasn=E2=80=99t started yet? Both=
 the=20
inmate and the Linux root cell should both be equally subjected to the same=
=20
hypervisor performance penalty, right?

Are there any high-level differences between the root and the inmate that=
=20
could account for this large discrepancy? I know that Turbo Boost is likely=
=20
not happening in my inmate while it is happening in the root cell, but I=20
don=E2=80=99t believe that can account for the huge gap in execution durati=
on that=20
I see.


I'm not expecting anyone to debug this in depth for me, but I would=20
appreciate any ideas I could look into.

Thanks,

Michael

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4d8ab27d-7a1a-4601-8d61-429dd0cdd018%40googlegroups.com.

------=_Part_1164_147787382.1579506346768
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"docs-internal-guid-064bd674-7fff-cdf8-d8a6-11a=
f1e1c4918"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-b=
ottom:0pt;"><span style=3D"font-size: 11pt; font-family: Nunito, sans-serif=
; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric:=
 normal; font-variant-east-asian: normal; vertical-align: baseline; white-s=
pace: pre-wrap;">Hello,</span></p><br><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font=
-family: Nunito, sans-serif; color: rgb(0, 0, 0); background-color: transpa=
rent; font-variant-numeric: normal; font-variant-east-asian: normal; vertic=
al-align: baseline; white-space: pre-wrap;">I have found that running code =
in an inmate is a lot slower than running that same code in the root cell o=
n my x86 machine. I am not sure why.</span></p><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 1=
1pt; font-family: Nunito, sans-serif; color: rgb(0, 0, 0); background-color=
: transparent; font-variant-numeric: normal; font-variant-east-asian: norma=
l; vertical-align: baseline; white-space: pre-wrap;"><br></span></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 11pt; font-family: Nunito, sans-serif; color: rgb(0, 0=
, 0); background-color: transparent; font-variant-numeric: normal; font-var=
iant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;">=
Am I correct in assuming that when `</span><span style=3D"font-size: 11pt; =
color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: n=
ormal; font-variant-east-asian: normal; vertical-align: baseline; white-spa=
ce: pre-wrap;"><font face=3D"courier new, monospace">jailhouse enable &lt;r=
oot_cell&gt;</font></span><span style=3D"font-size: 11pt; font-family: Nuni=
to, sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-va=
riant-numeric: normal; font-variant-east-asian: normal; vertical-align: bas=
eline; white-space: pre-wrap;">` is called, everything that runs after that=
 in the Linux root cell is running under the hypervisor, even when the inma=
te hasn=E2=80=99t started yet? Both the inmate and the Linux root cell shou=
ld both be equally </span><span style=3D"color: rgb(0, 0, 0); font-family: =
Nunito, sans-serif; font-size: 14.6667px; white-space: pre-wrap;">subjected=
</span><span style=3D"background-color: transparent; color: rgb(0, 0, 0); f=
ont-family: Nunito, sans-serif; font-size: 11pt; white-space: pre-wrap;"> t=
o the same hypervisor performance penalty, right?</span></p><br><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span styl=
e=3D"font-size: 11pt; font-family: Nunito, sans-serif; color: rgb(0, 0, 0);=
 background-color: transparent; font-variant-numeric: normal; font-variant-=
east-asian: normal; vertical-align: baseline; white-space: pre-wrap;">Are t=
here any high-level differences between the root and the inmate that could =
account for this large discrepancy? I know that Turbo Boost is likely not h=
appening in my inmate while it is happening in the root cell, but I don=E2=
=80=99t believe that can account for the huge gap in execution duration tha=
t I see.</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Nunito, sa=
ns-serif; color: rgb(0, 0, 0); background-color: transparent; font-variant-=
numeric: normal; font-variant-east-asian: normal; vertical-align: baseline;=
 white-space: pre-wrap;"><br></span></p><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; fo=
nt-family: Nunito, sans-serif; color: rgb(0, 0, 0); background-color: trans=
parent; font-variant-numeric: normal; font-variant-east-asian: normal; vert=
ical-align: baseline; white-space: pre-wrap;">I&#39;m not expecting anyone =
to debug this in depth for me, but I would appreciate any ideas I could loo=
k into.</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt;"><span style=3D"font-size: 11pt; font-family: Nunito,=
 sans-serif; color: rgb(0, 0, 0); background-color: transparent; font-varia=
nt-numeric: normal; font-variant-east-asian: normal; vertical-align: baseli=
ne; white-space: pre-wrap;">Thanks,</span></p><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 11=
pt; font-family: Nunito, sans-serif; color: rgb(0, 0, 0); background-color:=
 transparent; font-variant-numeric: normal; font-variant-east-asian: normal=
; vertical-align: baseline; white-space: pre-wrap;">Michael</span></p><div>=
<span style=3D"font-size: 11pt; font-family: Nunito, sans-serif; color: rgb=
(0, 0, 0); background-color: transparent; font-variant-numeric: normal; fon=
t-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wr=
ap;"><br></span></div></span></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/4d8ab27d-7a1a-4601-8d61-429dd0cdd018%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/4d8ab27d-7a1a-4601-8d61-429dd0cdd018%40googlegroups.com<=
/a>.<br />

------=_Part_1164_147787382.1579506346768--

------=_Part_1163_2078910094.1579506346768--
