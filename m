Return-Path: <jailhouse-dev+bncBDYO7FNATYOBBV6NSCZQMGQE32V35QI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb37.google.com (mail-yb1-xb37.google.com [IPv6:2607:f8b0:4864:20::b37])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C6190112A
	for <lists+jailhouse-dev@lfdr.de>; Sat,  8 Jun 2024 11:39:37 +0200 (CEST)
Received: by mail-yb1-xb37.google.com with SMTP id 3f1490d57ef6-dfa744fe2f9sf5027489276.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 08 Jun 2024 02:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717839576; x=1718444376; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YadC0ss7DTsQSE0TO+207AQkB8m6p4LHO/oNCPtQXoo=;
        b=LB08CR4gwn1nsU/uIMTVUrwbr2Ok+8Ol1zhY9c5eX2/4DZJBbiQyPSdR0oc/HrHalr
         oUl6GCy2ev/NwjaKLULw9DvWxjQ/gRBYU9MF2KJ1DCrOtvyQrsfeLGMIsHe+ZWC4FcQ7
         ZhNe2tlNxxflLhDFmMvEBGCLKou57FxURXIG3KFuqJWasTJ74Fh5hHIN99pFsU1je4oz
         1hsIPEmpcnfLAgFw5iUJid3Dq/Aay7eKi1UByscMZT8BJou16XVUrjyKgcTarFFo750a
         5QOhyXNkY7XXQsHulbLfakTFHf4tzE6PpcrO81ppdg/nwfZQXAJ4b6+WzCI834m/Qma1
         7kmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717839576; x=1718444376; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YadC0ss7DTsQSE0TO+207AQkB8m6p4LHO/oNCPtQXoo=;
        b=eQjjXMsnJZ7idps5yx53VwZWHUYSM98MTJ139+SRKhsSnKBg8c3s8rk8AoDIKguM8M
         Rek7M85TToWNSp6kCg2GrqlqbRszySFbO8QJol0xlDJjjRFnYazoSeTEa3yAwsmUt6dI
         LIVFfpi3q0O9S3nyP8qSiI8xezZexZGCb1cWt/ZTYzxuBeb8LjghUHkUMMVpUaVRSBO5
         TEKh2aZVMXKI8t8p3xrHBrqwwdGA/i4hfJrKkBbCjnKxwMajpwOt6wXKBFG3DMiZDpfq
         vfXPq+PiKi7078rZE3pytlb5bvHSOx0/qWcuR0Z5WTJwKcTerVUu6HJR+ZoznJ6cHrAw
         KlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717839576; x=1718444376;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YadC0ss7DTsQSE0TO+207AQkB8m6p4LHO/oNCPtQXoo=;
        b=HTppXeqNWDPi7t9biQ4iX3ViTnd3Y5+PXSRMMyxqTVX6VxilgiltOTX2WDDI4dYc2k
         rx1K9AYhl1D5hNYS2OVUBklgxseZ8fb0+XR4ZQOn1f5rdGbTxalgtTIrxErLz7RssUUI
         +i+1Vgia+H59EAsGtrtcK2ATl+vWWNB1Q0OyLyDypxVbfiJhklkfNuOeNTxFlR2QaAkd
         KUDi1EPCrLzUWL/8XPtYZVLHplKxPe8N0xSBn5jaIKpVMje3LFI3JYfMdS4CQ/BLM9nU
         ezwkf5bKogga+vkCFlgFZG3HbONgs9Ber2qa03pC9UGHdRWdcA2dUjmkrKCy+xXe6/hD
         KlUQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVSUH0xrGFOD+SFngjPcIVnAuvZbhl5tpAdYlvecMe62wwcnsgK1yg6/S76/6bDYZTgoL/qNqslVRc3k5wgeZnNbErfRhIdO7NsdUE=
X-Gm-Message-State: AOJu0YyklDG9KMO4RGe7ROCOMbciuw10aulVQP8UJfQXWuHEPJWeppgq
	FaHSgfdTXbskBeKdVkF6oirHQ/MC2AnU5gvSWjM0GDM1ZXaHTxSG
X-Google-Smtp-Source: AGHT+IE9o3ERjUldH8DcouMuc3FVQ3jAYZNVPW81JXVFkblnWnUb5m8LS/j/DqO12eIKgaAtRhQ2mA==
X-Received: by 2002:a05:6902:2002:b0:dfa:c544:52dc with SMTP id 3f1490d57ef6-dfaf666ac47mr5359437276.28.1717839576167;
        Sat, 08 Jun 2024 02:39:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:9745:0:b0:dfa:8028:8bc9 with SMTP id 3f1490d57ef6-dfaf15f6c00ls2717256276.1.-pod-prod-06-us;
 Sat, 08 Jun 2024 02:39:34 -0700 (PDT)
X-Received: by 2002:a05:6902:1208:b0:df4:a381:5cc9 with SMTP id 3f1490d57ef6-dfaf66267bdmr1356842276.8.1717839574487;
        Sat, 08 Jun 2024 02:39:34 -0700 (PDT)
Date: Sat, 8 Jun 2024 02:39:33 -0700 (PDT)
From: Hansel Zimmerof mason <masonhanselzimmerof@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a30dad99-60c4-4cb2-acf2-a1927511e7dan@googlegroups.com>
Subject: =?UTF-8?Q?+13348395202_K2_Papers,_K2_Sheets,_K2_Spice_Papers,=C2=A0_K2_?=
 =?UTF-8?Q?Infused_Papers,_K2_Infused_Sheets,K2_e-Liquid,K2_Liquid.?=
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_264902_1902579821.1717839573670"
X-Original-Sender: masonhanselzimmerof@gmail.com
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

------=_Part_264902_1902579821.1717839573670
Content-Type: multipart/alternative; 
	boundary="----=_Part_264903_336829481.1717839573670"

------=_Part_264903_336829481.1717839573670
Content-Type: text/plain; charset="UTF-8"

Text/call/whatsapp  +1(334)839-5202. Buy K2 Spice Sheets and Spray Online.
The quality is super gas (Diablo )
Each k2 sheets Is infused with 300 ml of the k2 liquid diablo incense.
I have the k2 sheets, k2 liquid and k2 chemicals or powder 
(jwh-018/5cla-adb-a)

I can infuse anything sheets, envelopes ,greeting cards, magazines etc .

You can buy the infused A4 Plain paper and write a letter to send to your 
buddy in prison. 

This paper is odorless and colorless. 

K2 paper for sale Australia, K2 spice paper for sale USA, K2 spray paper 
for sale Quebec, K2 liquid for sale Canada, K2 for sale United States, Buy 
K2 paper Nevada, Buy K2 liquid California, Buy K2 spray England, K2 sheets 
for sale London Buy K2 sheets Germany, K2 prison papers USA, K2 spice 
papers for sale in UK, Order K2 Spray Online, K2 Liquid Spray, K2 Spaice 
Spray, Liquid K2 On Paper.

Text/call/whatsapp +1(334)839-5202.

Email _manalon(@)protonmail.com

Telegram_Supremebill.


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a30dad99-60c4-4cb2-acf2-a1927511e7dan%40googlegroups.com.

------=_Part_264903_336829481.1717839573670
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Text/call/whatsapp =C2=A0+1(334)839-5202. Buy K2 Spice Sheets and Spray Onl=
ine.<div>The quality is super gas (Diablo )</div><div>Each k2 sheets Is inf=
used with 300 ml of the k2 liquid diablo incense.</div><div>I have the k2 s=
heets, k2 liquid and k2 chemicals or powder (jwh-018/5cla-adb-a)</div><div>=
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">I can infuse anything sheets,=
 envelopes ,greeting cards, magazines etc .</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">You can buy the infused A4 Pl=
ain paper and write a letter to send to your buddy in prison.=C2=A0</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">This paper is odorless and co=
lorless.=C2=A0</p><p style=3D"margin: 0px; font-stretch: normal; font-size:=
 13px; line-height: normal; font-family: &quot;Helvetica Neue&quot;; font-s=
ize-adjust: none; font-kerning: auto; font-variant-alternates: normal; font=
-variant-ligatures: normal; font-variant-numeric: normal; font-variant-east=
-asian: normal; font-variant-position: normal; font-feature-settings: norma=
l; font-optical-sizing: auto; font-variation-settings: normal;">K2 paper fo=
r sale Australia, K2 spice paper for sale USA, K2 spray paper for sale Queb=
ec, K2 liquid for sale Canada, K2 for sale United States, Buy K2 paper Neva=
da, Buy K2 liquid California, Buy K2 spray England, K2 sheets for sale Lond=
on Buy K2 sheets Germany, K2 prison papers USA, K2 spice papers for sale in=
 UK,=C2=A0Order K2 Spray Online, K2 Liquid Spray, K2 Spaice Spray, Liquid K=
2 On Paper.</p><p style=3D"margin: 0px; font-stretch: normal; font-size: 13=
px; line-height: normal; font-family: &quot;Helvetica Neue&quot;; font-size=
-adjust: none; font-kerning: auto; font-variant-alternates: normal; font-va=
riant-ligatures: normal; font-variant-numeric: normal; font-variant-east-as=
ian: normal; font-variant-position: normal; font-feature-settings: normal; =
font-optical-sizing: auto; font-variation-settings: normal;">Text/call/what=
sapp +1(334)839-5202.</p><p style=3D"margin: 0px; font-stretch: normal; fon=
t-size: 13px; line-height: normal; font-family: &quot;Helvetica Neue&quot;;=
 font-size-adjust: none; font-kerning: auto; font-variant-alternates: norma=
l; font-variant-ligatures: normal; font-variant-numeric: normal; font-varia=
nt-east-asian: normal; font-variant-position: normal; font-feature-settings=
: normal; font-optical-sizing: auto; font-variation-settings: normal;">Emai=
l _manalon(@)protonmail.com</p><p style=3D"margin: 0px; font-stretch: norma=
l; font-size: 13px; line-height: normal; font-family: &quot;Helvetica Neue&=
quot;; font-size-adjust: none; font-kerning: auto; font-variant-alternates:=
 normal; font-variant-ligatures: normal; font-variant-numeric: normal; font=
-variant-east-asian: normal; font-variant-position: normal; font-feature-se=
ttings: normal; font-optical-sizing: auto; font-variation-settings: normal;=
">Telegram_Supremebill.</p><p style=3D"margin: 0px; font-stretch: normal; f=
ont-size: 13px; line-height: normal; font-family: &quot;Helvetica Neue&quot=
;; font-size-adjust: none; font-kerning: auto; font-variant-alternates: nor=
mal; font-variant-ligatures: normal; font-variant-numeric: normal; font-var=
iant-east-asian: normal; font-variant-position: normal; font-feature-settin=
gs: normal; font-optical-sizing: auto; font-variation-settings: normal;">



<br /></p></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a30dad99-60c4-4cb2-acf2-a1927511e7dan%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a30dad99-60c4-4cb2-acf2-a1927511e7dan%40googlegroups.co=
m</a>.<br />

------=_Part_264903_336829481.1717839573670--

------=_Part_264902_1902579821.1717839573670--
