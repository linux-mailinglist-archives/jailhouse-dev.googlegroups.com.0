Return-Path: <jailhouse-dev+bncBCMKTTEX5MOBB4O27CZAMGQEZ4YBD6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8308D8B13
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Jun 2024 22:54:11 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-df7a6530373sf8973520276.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Jun 2024 13:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717448050; x=1718052850; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p9IX0aC0ceOKXuecbZc4O1XD80Dh/3Vkl8IhNvttXTY=;
        b=nT6jwQVWQ5y44sz4niugzXvNo1Fh+ub9+tt1DVSeT66x9QrElwDiWl7DG4+8o0AZR+
         Lj6ZtCAgR5yLW/NH+EGXlb8qieXJDVyovDIOe3UTUv46aMXY3EUeekAmuibkDJIMQ24z
         NCIP3S4r3fWPptqwiOBB5omZOi8OXSVRIqEl7vWTYQ3PK342MAaraip15V/1Qn0l7msT
         hLFKf/0TC2cuQiVIXqUHyCwtf/IIrvwLfRasu0AjyJnFhwCV9dGaKBQPX0KFGzgOREQb
         Fd1nWtga1nWPOWcnloSCRLJeteX1l8WwHzH/hNx0+bu+i1x9VHb4mxR26qeRD919DnTJ
         85pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717448050; x=1718052850; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9IX0aC0ceOKXuecbZc4O1XD80Dh/3Vkl8IhNvttXTY=;
        b=jN80NHsrbGI72UHIZgaDjdyMfzK5vXA3ylP6eXDXbXJ5qoGCejCilUGIOFVamORVX1
         Ht6d13WtxxlhB7ZqOBQVKZVTWW93usHMwJx2M8RAGpEa0yBcsfNA5IqkcTLe3QFcE9hC
         kBoXhCUPEI2hR6D4kidmzgB/p2u0T3m5zslcJKTZIjHExE6Q16Fy3tqGjJPZUfMNDkhx
         Cj3vT1/yr68zhOPq3GZqCsB/YPQG5zdudKWmu12Lo754ylCXbGJxVaFbmBfNy8Ufa8Yn
         PJ0dnoKGSlxLNEQNBAtJH0k4VX7Nxy0rvNrTrnWdqhAEMZMlGecYFZ/n2blfYhcOAAZ1
         nAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717448050; x=1718052850;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p9IX0aC0ceOKXuecbZc4O1XD80Dh/3Vkl8IhNvttXTY=;
        b=KXTlMxYoQNtOYMT8INtelFmzwT6r3/x0E79V63bj7S9EQp97jMrHWfBMok8l76FdqX
         8TNCd8JIOzFi4XfbR8fRhlTpIMGCWNbocZDQyYK14taAAHSr5UoXiNt/OziBZ3ryir7X
         CwqtDgkv6Oo/GoGzuppGQ2j8I4/p0SHiMpOfeZ6S9wZyOoz9r9dTmMyEtEvouOCMa9Oo
         Pi7fquiGzDZhvHvGlXC5sKL6Mkw0GcpGHZac4QB1Hz7YhZoqCiFQfm2v6IR2jFNGmQCe
         Ozpeq3e19usdTIvez6V/Aam/1SOe/D9CKB1flZNJnnbAsPXyGkgaNCbhI95wfJj77eRy
         K+eQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVuEoFMX6XZ3FtBhWZqQ/BtpIPDV/U83JENI19wZacjkW82pq5KavSdWHr6y1V9Xnayr6Wj/yS9tpN6nQFvewvlxk36NOlxGjVfst0=
X-Gm-Message-State: AOJu0YyoWQMP4Gdqal24uPHvCPI6E8BDBRyEFuROQwjCnk4JV+S4oVI9
	NZB+B9AjueakBEN83FVRs0quNaZ636uXkYZD2CwgvTLTEafMt4oQ
X-Google-Smtp-Source: AGHT+IGRcuihUexF7pvSCWto55iRZAOvtpEHKUF/Nt1SLm/csKSzZLYWcfYJgFLS/fiePoAFzOU3kg==
X-Received: by 2002:a25:26ca:0:b0:df4:df5c:b041 with SMTP id 3f1490d57ef6-dfab8b0313amr640709276.20.1717448050334;
        Mon, 03 Jun 2024 13:54:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:7416:0:b0:df7:8a9f:8453 with SMTP id 3f1490d57ef6-dfab15f4288ls940224276.1.-pod-prod-04-us;
 Mon, 03 Jun 2024 13:54:08 -0700 (PDT)
X-Received: by 2002:a05:690c:a83:b0:627:a73f:b38 with SMTP id 00721157ae682-62c7968b2c6mr30337817b3.1.1717448048625;
        Mon, 03 Jun 2024 13:54:08 -0700 (PDT)
Date: Mon, 3 Jun 2024 13:54:07 -0700 (PDT)
From: JAMES BRYANT <jambel420@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ec3af236-ce47-4b68-8568-35bfafe18be2n@googlegroups.com>
In-Reply-To: <f4fb0b7c-dfe1-4238-9804-8042307e2764n@googlegroups.com>
References: <f4fb0b7c-dfe1-4238-9804-8042307e2764n@googlegroups.com>
Subject: Re: BUY MUSHROOM CHOCOLATE BARS ONLINE - BEST PSILOCYBIN MUSHROOMS
 CHOCOLATE BARS ONLINE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_17598_831280487.1717448047775"
X-Original-Sender: jambel420@gmail.com
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

------=_Part_17598_831280487.1717448047775
Content-Type: multipart/alternative; 
	boundary="----=_Part_17599_1204583269.1717448047775"

------=_Part_17599_1204583269.1717448047775
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Buy Exotic Marijuana Strains Online:

Buy 5-MEO DMT .5ml 150mg Mushrooms Canada Online: https:
t.me/Ricko_swavy8/product/buy-5-meo-dmt-5ml-150mg-mushrooms-canada-online/

Buy 5-Meo-DMT(Cartridge) 1mL Deadhead Chemist Online: https:
t.me/Ricko_swavy8/product/buy-5-meo-dmtcartridge-1ml-deadhead-chemist-onlin=
e/

Buy Microdose 4-AcO-DMT Deadhead Chemist Online:https:
t.me/Ricko_swavy8/product/buy-microdose-4-aco-dmt-deadhead-chemist-online/

Buy Deadhead Chemist DMT 3 Cartridges Deal 1mL Online: https:
t.me/Ricko_swavy8/product/buy-deadhead-chemist-dmt-3-cartridges-deal-1ml-on=
line/

Buy PolkaDot Magic Mushroom Belgian Chocolate 4G:

Buy Penis Envy Magic Mushrooms:=20
https://www.t.me/Ricko_swavy8/product/buy-new-penis-envy-mostly-stems-onlin=
e/

Buy DMT 1ml Purecybin =E2=80=93 700mg DMT Online:=20
https://www.t.me/Ricko_swavy8/product/buy-dmt-1ml-purecybin-700mg-dmt-onlin=
e/

Buy NN-DMT(Cartridge) 1mL | 800MG | MMD Cosmo Online:https:
t.me/Ricko_swavy8/product/buy-nn-dmtcartridge-1ml-800mg-mmd-cosmo-online/

Golden Teacher Magic Mushrooms:

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ec3af236-ce47-4b68-8568-35bfafe18be2n%40googlegroups.com.

------=_Part_17599_1204583269.1717448047775
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br style=3D"color: rgb(80, 0, 80);" /><span style=3D"color: rgb(80, 0, 80)=
;">Buy Exotic Marijuana Strains Online:</span><br style=3D"color: rgb(80, 0=
, 80);" /><br style=3D"color: rgb(80, 0, 80);" /><span style=3D"color: rgb(=
80, 0, 80);">Buy 5-MEO DMT .5ml 150mg Mushrooms Canada Online:=C2=A0https:<=
/span><a href=3D"http://t.me/Ricko_swavy8/product/buy-5-meo-dmt-5ml-150mg-m=
ushrooms-canada-online/" rel=3D"nofollow" target=3D"_blank" style=3D"color:=
 rgb(26, 115, 232);">t.me/Ricko_swavy8/product/buy-5-meo-dmt-5ml-150mg-mush=
rooms-canada-online/</a><br style=3D"color: rgb(80, 0, 80);" /><br style=3D=
"color: rgb(80, 0, 80);" /><span style=3D"color: rgb(80, 0, 80);">Buy 5-Meo=
-DMT(Cartridge) 1mL Deadhead Chemist Online:=C2=A0https:</span><a href=3D"h=
ttp://t.me/Ricko_swavy8/product/buy-5-meo-dmtcartridge-1ml-deadhead-chemist=
-online/" rel=3D"nofollow" target=3D"_blank" style=3D"color: rgb(26, 115, 2=
32);">t.me/Ricko_swavy8/product/buy-5-meo-dmtcartridge-1ml-deadhead-chemist=
-online/</a><br style=3D"color: rgb(80, 0, 80);" /><br style=3D"color: rgb(=
80, 0, 80);" /><span style=3D"color: rgb(80, 0, 80);">Buy Microdose 4-AcO-D=
MT Deadhead Chemist Online:https:</span><a href=3D"http://t.me/Ricko_swavy8=
/product/buy-microdose-4-aco-dmt-deadhead-chemist-online/" rel=3D"nofollow"=
 target=3D"_blank" style=3D"color: rgb(26, 115, 232);">t.me/Ricko_swavy8/pr=
oduct/buy-microdose-4-aco-dmt-deadhead-chemist-online/</a><br style=3D"colo=
r: rgb(80, 0, 80);" /><br style=3D"color: rgb(80, 0, 80);" /><span style=3D=
"color: rgb(80, 0, 80);">Buy Deadhead Chemist DMT 3 Cartridges Deal 1mL Onl=
ine:=C2=A0https:</span><a href=3D"http://t.me/Ricko_swavy8/product/buy-dead=
head-chemist-dmt-3-cartridges-deal-1ml-online/" rel=3D"nofollow" target=3D"=
_blank" style=3D"color: rgb(26, 115, 232);">t.me/Ricko_swavy8/product/buy-d=
eadhead-chemist-dmt-3-cartridges-deal-1ml-online/</a><br style=3D"color: rg=
b(80, 0, 80);" /><br style=3D"color: rgb(80, 0, 80);" /><span style=3D"colo=
r: rgb(80, 0, 80);">Buy PolkaDot Magic Mushroom Belgian Chocolate 4G:</span=
><br style=3D"color: rgb(80, 0, 80);" /><br style=3D"color: rgb(80, 0, 80);=
" /><span style=3D"color: rgb(80, 0, 80);">Buy Penis Envy Magic Mushrooms:=
=C2=A0</span><a href=3D"https://www.t.me/Ricko_swavy8/product/buy-new-penis=
-envy-mostly-stems-online/" rel=3D"nofollow" target=3D"_blank" style=3D"col=
or: rgb(26, 115, 232);">https://www.t.me/Ricko_swavy8/product/buy-new-penis=
-envy-mostly-stems-online/</a><br style=3D"color: rgb(80, 0, 80);" /><br st=
yle=3D"color: rgb(80, 0, 80);" /><span style=3D"color: rgb(80, 0, 80);">Buy=
 DMT 1ml Purecybin =E2=80=93 700mg DMT Online:=C2=A0</span><a href=3D"https=
://www.t.me/Ricko_swavy8/product/buy-dmt-1ml-purecybin-700mg-dmt-online/" r=
el=3D"nofollow" target=3D"_blank" style=3D"color: rgb(26, 115, 232);">https=
://www.t.me/Ricko_swavy8/product/buy-dmt-1ml-purecybin-700mg-dmt-online/</a=
><br style=3D"color: rgb(80, 0, 80);" /><br style=3D"color: rgb(80, 0, 80);=
" /><span style=3D"color: rgb(80, 0, 80);">Buy NN-DMT(Cartridge) 1mL | 800M=
G | MMD Cosmo Online:https:</span><a href=3D"http://t.me/Ricko_swavy8/produ=
ct/buy-nn-dmtcartridge-1ml-800mg-mmd-cosmo-online/" rel=3D"nofollow" target=
=3D"_blank" style=3D"color: rgb(26, 115, 232);">t.me/Ricko_swavy8/product/b=
uy-nn-dmtcartridge-1ml-800mg-mmd-cosmo-online/</a><br style=3D"color: rgb(8=
0, 0, 80);" /><br style=3D"color: rgb(80, 0, 80);" /><span style=3D"color: =
rgb(80, 0, 80);">Golden Teacher Magic Mushrooms:</span><br style=3D"color: =
rgb(80, 0, 80);" /><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ec3af236-ce47-4b68-8568-35bfafe18be2n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ec3af236-ce47-4b68-8568-35bfafe18be2n%40googlegroups.co=
m</a>.<br />

------=_Part_17599_1204583269.1717448047775--

------=_Part_17598_831280487.1717448047775--
