Return-Path: <jailhouse-dev+bncBDHJTYFKTUKRBH5VVCZAMGQEB5DMGNY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E5D8C9529
	for <lists+jailhouse-dev@lfdr.de>; Sun, 19 May 2024 17:28:33 +0200 (CEST)
Received: by mail-yb1-xb3b.google.com with SMTP id 3f1490d57ef6-de603db5d6asf20003092276.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 19 May 2024 08:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1716132511; x=1716737311; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lo8tw5H5AxwliwiMbH6hmWnhn4tsOfwHmJk9CmnJWO0=;
        b=fuHDN9YDEqc0nCOgR0y5Ygn5//wuoXMlPBwP1hKM0Z8l690JUPQNnFs4ykf5j+yGPc
         2Kb9UU1DMc333jujNRuQuYphRIG8veVAcerkGfeRuO6kwOZP2RhAZnnYDsfIwMUG8Gx2
         1t3w3uskW25SjXsIpVXbsHJaMTsREUHn4cTkLYVlfxR2qGOsyGlDta3eAwXH15kfGQBp
         D3lZTgCyIKhph2cyuGnptOzHceg3UyB1Egt1DKOCe1PNKpXedc5jhGhrKkS2gUjm7gv1
         9/vUFgD4OQhdMm1+Fy5xUJzK+8F/7eFBp4PIbWvGSnSbqp93uZ2oq6UkQTXw7bmftnrb
         AJ9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716132511; x=1716737311; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lo8tw5H5AxwliwiMbH6hmWnhn4tsOfwHmJk9CmnJWO0=;
        b=caz8bUTr7KCD1qHWfrFXBGpCPwWOjVxpDL5zR2PO3LJP5gjUXKiTG2c1Wi29cOYmdk
         36G0fiDTgLbt+OqjBWlbYflTyRhsx4ngiKyqk0+kgC/X3W+RFkQRG8YRHhAb5eQ/+dS1
         kOk60SdO4z2WKsUMsyQyNxKyqlgm/IR6AwJkSrGecR7f+uEjNQJEXIndhsfwOhzrHdXO
         73pAB3a00FHIEfjUmGEFsl9X1U35S9jmKWzRWMnlL9+DLYGPDB7/dVxEA+N2J/jyzpum
         3U9CWLnycSsn8bvV3+o8/X9aLETf7E1JsbUlGRc/KdSHmhzWVYNQ1QC7vGyDuqmoGgOu
         EIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716132511; x=1716737311;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lo8tw5H5AxwliwiMbH6hmWnhn4tsOfwHmJk9CmnJWO0=;
        b=UT4qQLUEVGTlgpcaQZGvX5rTCDsdlfMqIIKrh9+mYYWpaMWoCF0pL1MRKQUpXsTiZP
         Iv46UGUxd+spvXRbk7RhX+thEswz9U3XPLxEuRbQ39WLY5pRu6kXvbCW0y9+G2akaTMj
         asb0vXP8NDEG17xtSZx2GWZHZSInduTTd+1BLLmrnfWWWyVU+ROYkvr4l+ay2IKDN78r
         wRGdN/QbKJs7iucyTUw/rWjCBvx4GqptodyfCBV+4julisML4/A6Rlu8aNjUcK7axCAo
         O1emvpR7rQ5ZrU1LNcpjAU3h21c188h/8h+52xYUJGxbIxER2C0ylRncp2UClVxDJ/HI
         Ctog==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUaKfwE4tobZxHZAW3qJxHajwnh7oPMFXbjm4lOUci1R9zUlhLN8qShOW5REO5iF5JfLEwnPq1dKW62yroNwOpuQgpeTzeqsVmnFRk=
X-Gm-Message-State: AOJu0YzS3ayKEW0c+5XhXenmbFlavzST8trNOTdJup7xsb+M+sCUt1dp
	PT1y4uMnTCIKNOgnyYKWk7ctIXKS4vWYU5uLkinX9E7qSuQQ9AJN
X-Google-Smtp-Source: AGHT+IHcgn/XKVPdDWB9LalBHkzugPXkrn5d9acxYZ8lPJotUB2T6+Cr61maX0MBA+0kmud0O3B4FA==
X-Received: by 2002:a25:c7cc:0:b0:de6:3bc:c21c with SMTP id 3f1490d57ef6-dee4f319110mr34467477276.6.1716132511711;
        Sun, 19 May 2024 08:28:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:be81:0:b0:de5:9eb1:327d with SMTP id 3f1490d57ef6-debd088a51cls9038553276.2.-pod-prod-06-us;
 Sun, 19 May 2024 08:28:30 -0700 (PDT)
X-Received: by 2002:a05:6902:102d:b0:dee:6802:dc49 with SMTP id 3f1490d57ef6-dee6802f337mr6124303276.1.1716132510185;
        Sun, 19 May 2024 08:28:30 -0700 (PDT)
Date: Sun, 19 May 2024 08:28:29 -0700 (PDT)
From: roger mille <rogermille7@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <307d5f8e-8ead-4b1f-af2d-c0db77d02f1fn@googlegroups.com>
Subject: +17754424473 K2 Spice Sheets k2 Liquid Spice Spray for sale
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_190416_563003066.1716132509529"
X-Original-Sender: rogermille7@gmail.com
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

------=_Part_190416_563003066.1716132509529
Content-Type: multipart/alternative; 
	boundary="----=_Part_190417_352532910.1716132509529"

------=_Part_190417_352532910.1716132509529
Content-Type: text/plain; charset="UTF-8"



Each spice K2 Sheets is infuse with 300 ml of the k2 liquid Diablo Incense.

I have the k2 sheets already made, i have the k2 paper ,k2 spray ,k2 liquid.

I can infuse k2 sheets ,k2 envelopes ,k2 magazines ,k2 books.

Cannabinoids | Noids | Synthetic Cannabinoids

K2 Spice paper | K2 paper | K2 Spray | 5cladba | 5F-Mdmb2201 | JWH018 | 
SGT-78 | 5-CL-ADB-A | 4F-ADB | 5F-MDA19 | MDA-19

5F-MDMB-2201 | 7add | 5F-Mdmb 2201 Pica | MDMB-4en-PINACA

AB-PINACA | JWH-250 | 4f-mdmb-2201 | Amb-fubinaca | 4f-adb | 4FADB

6Cladba | GBH | GBL | SGT 78 | Crack C | 6-APDB

BMK-Oil | MDP2P | PMK Oil | 5F-AKB-48 | 5F-PB22 | 6-APB

we do K2 Express overnight shipping and we can also make your k2 sheets 
come in the form of legal mail.

#k2sheetsforsale

#buyk2sheets 

#k2paperforsale

#k2liquidforsale

#k2spiceforsale

#k2sprayforsale

Whatsapp +17754424473


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/307d5f8e-8ead-4b1f-af2d-c0db77d02f1fn%40googlegroups.com.

------=_Part_190417_352532910.1716132509529
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">Each spice K2 Sheets is infus=
e with 300 ml of the k2 liquid Diablo Incense.</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">I have the k2 sheets already =
made, i have the k2 paper ,k2 spray ,k2 liquid.</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">I can infuse k2 sheets ,k2 en=
velopes ,k2 magazines ,k2 books.</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">Cannabinoids | Noids | Synthe=
tic Cannabinoids</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">K2 Spice paper | K2 paper | K=
2 Spray | 5cladba | 5F-Mdmb2201 | JWH018 | SGT-78 | 5-CL-ADB-A | 4F-ADB | 5=
F-MDA19 | MDA-19</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">5F-MDMB-2201 | 7add | 5F-Mdmb=
 2201 Pica | MDMB-4en-PINACA</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">AB-PINACA | JWH-250 | 4f-mdmb=
-2201 | Amb-fubinaca | 4f-adb | 4FADB</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">6Cladba | GBH | GBL | SGT 78 =
| Crack C | 6-APDB</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">BMK-Oil | MDP2P | PMK Oil | 5=
F-AKB-48 | 5F-PB22 | 6-APB</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">we do K2 Express overnight sh=
ipping and we can also make your k2 sheets come in the form of legal mail.<=
/p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">#k2sheetsforsale</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">#buyk2sheets=C2=A0</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">#k2paperforsale</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">#k2liquidforsale</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">#k2spiceforsale</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;">#k2sprayforsale</p><p style=
=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height: normal=
; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; font-ker=
ning: auto; font-variant-alternates: normal; font-variant-ligatures: normal=
; font-variant-numeric: normal; font-variant-east-asian: normal; font-varia=
nt-position: normal; font-feature-settings: normal; font-optical-sizing: au=
to; font-variation-settings: normal;">Whatsapp +17754424473</p>
<p style=3D"margin: 0px; font-stretch: normal; font-size: 13px; line-height=
: normal; font-family: &quot;Helvetica Neue&quot;; font-size-adjust: none; =
font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal;"><br /></p>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/307d5f8e-8ead-4b1f-af2d-c0db77d02f1fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/307d5f8e-8ead-4b1f-af2d-c0db77d02f1fn%40googlegroups.co=
m</a>.<br />

------=_Part_190417_352532910.1716132509529--

------=_Part_190416_563003066.1716132509529--
