Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBQPR5OZAMGQESSSJIPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 962B88D6F5B
	for <lists+jailhouse-dev@lfdr.de>; Sat,  1 Jun 2024 12:32:35 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id 3f1490d57ef6-dfa73db88dcsf2326772276.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 01 Jun 2024 03:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717237954; x=1717842754; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jG18ciarZZJfSkOWYkcCGo7O8T3ea8k0E4W8BiVOO1s=;
        b=aRwutJOGVqwQZxP75GkpK41w20ytYbUb9im8XmwfY2b7vBIL6cg93mnOGhgzxNacyO
         ObbcPG3O9pdM/R7EwZcBW9wJ2T800cOX6OrRP5GEYdopOHs1rT6LGHhuBS0TJ4RLmiXM
         dPsuflhbRIZpfeFPpgTpH+iKvNB/zTLjjjkd7k87I6IPAAOvqupkBq9c5RKQoI3/aJZO
         lgR2+3fbFk6l9EXbKUL+8pfUWaekTlEL8tZLd/eBiIz4nb+Mld/4Wh6wJVJfYcPOrzKn
         kGaIBXZFvyMn6cm0evvFFZstEOuDAIRhcjtWc6zbtqP5Avxz9bdOyaTx+O99WqSOMGhu
         M9YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717237954; x=1717842754; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jG18ciarZZJfSkOWYkcCGo7O8T3ea8k0E4W8BiVOO1s=;
        b=AuGJd7EVgddHZb5xnpDal0U8X4dDlMT9XSgfo7OksL4F7WvJylkeE0hCCaXGqXM5lM
         xXcbSHCdvntAFLvjcT80c5RAqQr5vN1HniYRdrT+6QhqNn+8XfeVtsd37knSXsC7wUBS
         Coz63f2xlD8i43AFTGKkxpnAWWu4mqCWdDs0ZSRon1vmXuX+keU/TXSRHiK4W2Twry1N
         c9ZcGHKPy81Yf113r6HqholM//xvDsQwM5la8O328pCJ9MSubZk/U9BRJZ3dX7Gr4miB
         +XtDbbXJlp1nFSF4PEALDBFerbNBNYrQvGMSPVYnKvUmbgtV0SADp8PGmhw1lmJCPn7t
         pn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717237954; x=1717842754;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jG18ciarZZJfSkOWYkcCGo7O8T3ea8k0E4W8BiVOO1s=;
        b=VYzWA22r/5yMYsvxK6VgOh9g9aqh2fK4Oeohkmqsx1mp5Dh4j6OgAmakVXPVKn+XkM
         CdEsSDIuJBnVxYmgdSh50a0UZShHBzjDq+X6dpmj37r/fmktpCpEkrJN714ZkJvSRZnt
         5JPbx4Jk3Bw+a6f5bfuGipOUAWxR+tti6L9uMDAzUO1mxXgb0Zuio9Y+gwZp83TbxWw/
         6AGg4mgMbt8KMZVVgU1kjIy6SKfzxEK7fLRjbVhD1LGwFshRM4sQOO98cDM86aTm3wIY
         7R+CYInqGwA/qzNsp1M3UJuzT0iQA6XvC97pu0xRFkM4OzYH4hvMzsuaKESdbhfLLs7T
         hSxA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCW7+NSvAZ4YWYCCPPRlcoND97QUdTYrLSvd5WKtU5ITsWxSXe3QSb3pXmSlcW8Eq5JNZ8e5ZV5rlwDrM645kj2z9HK+HpzakGf+aCE=
X-Gm-Message-State: AOJu0YyLPBtGg3CJy2BNXVu0lf4BKCIunDZwR6uhS8Jbfn1PkZdPrLqF
	rkMeCNoMJd1d5NAHUbQ5pCtEarW40hyZvPPtO/YqBHCrNMHoO8V0
X-Google-Smtp-Source: AGHT+IEKwezqgEttkEO5LrhjhtIE3iY4USRELKLel8KlRdhXqQWGJrqzxzrXIyFa56N6GiyL5dlxaQ==
X-Received: by 2002:a25:9f03:0:b0:df7:943b:3893 with SMTP id 3f1490d57ef6-dfa73c21396mr4216801276.34.1717237954441;
        Sat, 01 Jun 2024 03:32:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:28a:0:b0:df7:983f:6e74 with SMTP id 3f1490d57ef6-dfa595df6d5ls802994276.0.-pod-prod-00-us;
 Sat, 01 Jun 2024 03:32:33 -0700 (PDT)
X-Received: by 2002:a05:690c:d83:b0:618:5009:cb71 with SMTP id 00721157ae682-62c7882f723mr13178307b3.5.1717237952986;
        Sat, 01 Jun 2024 03:32:32 -0700 (PDT)
Date: Sat, 1 Jun 2024 03:32:32 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <446876dc-adb4-4fdc-ba8e-ecae817ea8f4n@googlegroups.com>
Subject: GET AT ME FOR YOUR LOW &HIGH BALANCE CLONE CARD FOR COOL PRICES
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_184873_337371581.1717237952145"
X-Original-Sender: asahrandy54@gmail.com
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

------=_Part_184873_337371581.1717237952145
Content-Type: multipart/alternative; 
	boundary="----=_Part_184874_733053165.1717237952145"

------=_Part_184874_733053165.1717237952145
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Get at me for your low & high balance clone cards going for cool prices.


https://t.me/motionking_caliweed_psychedelics


Clone cards are spammed credit cards with clean funds. My clone cards are=
=20
available for cash out in ATMs=F0=9F=8F=A7,Gas stations=E2=9B=BD=EF=B8=8F a=
nd can be used for online=20
purchases. Our clone card comes with an ATM pin for easy cash outs =E2=84=
=A2=EF=B8=8F
$300 for balance $2k
$400 for balance $5K
$500for balance $7k
$700 for balance $10k

https://t.me/motionking_caliweed_psychedelics

High balance
$1k for balance $15k
$3k for balance $30k
$5k balance $50k
$7k for balance $ 75k

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/446876dc-adb4-4fdc-ba8e-ecae817ea8f4n%40googlegroups.com.

------=_Part_184874_733053165.1717237952145
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br /><div><span style=3D"color: rgb(80, 0, 80);">Get at me for your low &a=
mp; high balance clone cards going for cool prices.</span><div style=3D"col=
or: rgb(80, 0, 80);"><br /></div><div style=3D"color: rgb(80, 0, 80);"><br =
/></div><div style=3D"color: rgb(80, 0, 80);">https://t.me/motionking_caliw=
eed_psychedelics<br /></div><div style=3D"color: rgb(80, 0, 80);"><br /></d=
iv><div style=3D"color: rgb(80, 0, 80);"><br /></div><div style=3D"color: r=
gb(80, 0, 80);">Clone cards are spammed credit cards with clean funds. My c=
lone cards are available for cash out in ATMs=F0=9F=8F=A7,Gas stations=E2=
=9B=BD=EF=B8=8F and can be used for online purchases. Our clone card comes =
with an ATM pin for easy cash outs =E2=84=A2=EF=B8=8F</div><div style=3D"co=
lor: rgb(80, 0, 80);">$300 for balance $2k</div><div style=3D"color: rgb(80=
, 0, 80);">$400 for balance $5K</div><div style=3D"color: rgb(80, 0, 80);">=
$500for balance $7k</div><div style=3D"color: rgb(80, 0, 80);">$700 for bal=
ance $10k</div><div style=3D"color: rgb(80, 0, 80);"><br /></div><div style=
=3D"color: rgb(80, 0, 80);">https://t.me/motionking_caliweed_psychedelics<b=
r /></div><div style=3D"color: rgb(80, 0, 80);"><br /></div><div style=3D"c=
olor: rgb(80, 0, 80);">High balance</div><div style=3D"color: rgb(80, 0, 80=
);">$1k for balance $15k</div><div style=3D"color: rgb(80, 0, 80);">$3k for=
 balance $30k</div><div style=3D"color: rgb(80, 0, 80);">$5k balance $50k</=
div><div style=3D"color: rgb(80, 0, 80);">$7k for balance $ 75k</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/446876dc-adb4-4fdc-ba8e-ecae817ea8f4n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/446876dc-adb4-4fdc-ba8e-ecae817ea8f4n%40googlegroups.co=
m</a>.<br />

------=_Part_184874_733053165.1717237952145--

------=_Part_184873_337371581.1717237952145--
