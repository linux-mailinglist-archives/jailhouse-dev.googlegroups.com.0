Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBPG34GYAMGQEWHQCLMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113b.google.com (mail-yw1-x113b.google.com [IPv6:2607:f8b0:4864:20::113b])
	by mail.lfdr.de (Postfix) with ESMTPS id 567B68A221D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 01:09:50 +0200 (CEST)
Received: by mail-yw1-x113b.google.com with SMTP id 00721157ae682-61869a4320bsf10971837b3.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 16:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712876989; x=1713481789; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kiC1HpzXqJFU5GbcaQQPFn7Kx8ue+Wukd85w2oEDFv0=;
        b=glgNKtmStfQS2geAV3A/t3RnccJEaCxiYyGa4Vj7FbUarOlcMReCQk8crMGuZ7Nce/
         5Q9m21yCNT4VHQ/DI03JXvHt4KvIA8EjQTwzYOSCJyAf9mZyAD66Zt+hnovKFD9nOIi0
         2sICEAk/miKiFuV8SNCgppoXX7TgSs+aOaGht79US+ENTiLL23SlHukRvRI+BnS34lA9
         d5n7uXrvTNpQ7XCCHhohecs3sreaDGB7H1ww22HKLuCo5nvR1OoyvV9dWfaBQDS+vV95
         VPdixkHFl7cr5Z+PnrNV59WBoxSjuP2wwjhgKWRuxnARpiCRgCxRHxkEIWoQRuUrS0vE
         EY3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712876989; x=1713481789; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kiC1HpzXqJFU5GbcaQQPFn7Kx8ue+Wukd85w2oEDFv0=;
        b=TjGslCUjDLFdK41e17QxaGkDyXqz1qNB5F14L0CMUok9dMiFigZOkRI8YBtxBYYNDo
         lHF2AgE4XokPDYfYOm/hBiTyptZw17CGAEYG0UgAJZ5Xr1W/ceLlgbSOeW0r3QsxTxIM
         jUl3M4u2C3N8thCsRn8Tsuf6nMMblzSdmd1Tft0P9f9doEZNY3EKlxPewmfmh0htVZvi
         Zyy7t16kxR1TJxQT3qRr+lNCxv/Sezxv4dXJhQaaWizNM+A4SulPyjFOsT+ygvUmJ1fU
         /xr7RGl4f0uyts56FjrIZhIABb36LyhHM0l19HOPBqZbBNxyi3wMmrJ1A2ekyBVqk+gQ
         B2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712876989; x=1713481789;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kiC1HpzXqJFU5GbcaQQPFn7Kx8ue+Wukd85w2oEDFv0=;
        b=OAHs0qO7y7awjy6VoR3QuAIFvCVCndw+LeqX+I/6v7eKkdB+U2rXZLb9ctwmXU6+p6
         Kx+N375RZz7vyYBlDbwDB0E4kzoV5ec9W1Gmv//8g4JtalqTBNPZq5qYFZWZ2636thlt
         6XlWgVqBUX/5rec5w3zRjB6JqWdb98+4d+B97guJ9Gw65L1CxIqmpQmMEjQniG1V9npi
         oBM/ne/95s44CdiACUO3jY6y+3f9Q1lX/H7G59d+NVmkLCaA2ux052/2Zs4RGzDtQl0V
         yJALqkG95LU2ZotW0Fgc0mVI2TpLIa7HcB3XlsPRQu19lGSWDvQLvb5C2DdgbsqzHTzJ
         sY4A==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWRXhGNgGRrb6We0jwr0RPtbrcc/q6SnT25wucwnDv6wFk6vHr8cSDABszyH3YoNeeaZTKvQzvLZ7pVFuD4Gin/YzfOQXQXwdr3tbY=
X-Gm-Message-State: AOJu0Yy4N0fcYtnrgqZNOifvay22tDedL+hRGOR68EvJ4F0rqcEoa4ZW
	a/4fzi61v/n1ERbBu5FVPJoAFbtbbCfpXuzxWXAb5YVAfju9sNBh
X-Google-Smtp-Source: AGHT+IGOC0jkV460CneXWZjY+75y60VJ4a/viRZrn3Y/uFDcmSUpFG9EKg5zP3htm0Kn+SB6bwWrPQ==
X-Received: by 2002:a25:a41:0:b0:dc7:47c3:fb5f with SMTP id 62-20020a250a41000000b00dc747c3fb5fmr3525923ybk.22.1712876989266;
        Thu, 11 Apr 2024 16:09:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:dfd4:0:b0:dcb:b370:7d13 with SMTP id w203-20020a25dfd4000000b00dcbb3707d13ls472722ybg.2.-pod-prod-04-us;
 Thu, 11 Apr 2024 16:09:48 -0700 (PDT)
X-Received: by 2002:a25:1883:0:b0:dd9:312c:83c8 with SMTP id 125-20020a251883000000b00dd9312c83c8mr129787yby.10.1712876987768;
        Thu, 11 Apr 2024 16:09:47 -0700 (PDT)
Date: Thu, 11 Apr 2024 16:09:47 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <67854ae0-d159-4694-99c2-a41f4d295b8bn@googlegroups.com>
In-Reply-To: <8e9df4fc-0fb3-5149-aba6-d7f506e902af@oth-regensburg.de>
References: <81fa9191-18dd-4003-9cfb-bed496d5723fn@googlegroups.com>
 <faf9ae5c-7f62-5814-7453-793bffb881c3@oth-regensburg.de>
 <43f41f9d-0930-416b-a618-1955e237cc87n@googlegroups.com>
 <d5ffbbc4-d926-5bc0-e7bb-fa400875039b@oth-regensburg.de>
 <57a4477a-2c32-49ef-8ccc-e95e1d9fb815n@googlegroups.com>
 <27f131ff-b744-05fc-0e81-bd2b1267d394@oth-regensburg.de>
 <10922b18-30e5-414e-8d85-7e1f33f2f9fan@googlegroups.com>
 <8e9df4fc-0fb3-5149-aba6-d7f506e902af@oth-regensburg.de>
Subject: Re: Configuration with 2 guest cells
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_27686_91144961.1712876987094"
X-Original-Sender: massimilianodimajo097@gmail.com
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

------=_Part_27686_91144961.1712876987094
Content-Type: multipart/alternative; 
	boundary="----=_Part_27687_214283415.1712876987094"

------=_Part_27687_214283415.1712876987094
Content-Type: text/plain; charset="UTF-8"

MT103/202 DIRECT WIRE TRANSFER
PAYPAL TRANSFER
CASHAPP TRANSFER
ZELLE TRANSFER
LOAN DEAL
TRANSFER WISE
WESTERN UNION TRANSFER
BITCOIN FLASHING
BANK ACCOUNT LOADING/FLASHING
IBAN TO IBAN TRANSFER
MONEYGRAM TRANSFER
IPIP/DTC
SLBC PROVIDER
CREDIT CARD TOP UP
DUMPS/ PINS
SEPA TRANSFER
WIRE TRANSFER
BITCOIN TOP UP
GLOBALPAY INC US
SKRILL USA
UNIONPAY RECEIVER

Thanks.


NOTE; ONLY SERIOUS / RELIABLE RECEIVERS CAN CONTACT.

DM ME ON WHATSAPP
+44 7529 555638

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/67854ae0-d159-4694-99c2-a41f4d295b8bn%40googlegroups.com.

------=_Part_27687_214283415.1712876987094
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER<br />PAYPAL TRANSFER<br />CASHAPP TRANSFER<b=
r />ZELLE TRANSFER<br />LOAN DEAL<br />TRANSFER WISE<br />WESTERN UNION TRA=
NSFER<br />BITCOIN FLASHING<br />BANK ACCOUNT LOADING/FLASHING<br />IBAN TO=
 IBAN TRANSFER<br />MONEYGRAM TRANSFER<br />IPIP/DTC<br />SLBC PROVIDER<br =
/>CREDIT CARD TOP UP<br />DUMPS/ PINS<br />SEPA TRANSFER<br />WIRE TRANSFER=
<br />BITCOIN TOP UP<br />GLOBALPAY INC US<br />SKRILL USA<br />UNIONPAY RE=
CEIVER<br /><br />Thanks.<br /><br /><br />NOTE; ONLY SERIOUS / RELIABLE RE=
CEIVERS CAN CONTACT.<br /><br />DM ME ON WHATSAPP<br />+44 7529 555638<br /=
><br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/67854ae0-d159-4694-99c2-a41f4d295b8bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/67854ae0-d159-4694-99c2-a41f4d295b8bn%40googlegroups.co=
m</a>.<br />

------=_Part_27687_214283415.1712876987094--

------=_Part_27686_91144961.1712876987094--
