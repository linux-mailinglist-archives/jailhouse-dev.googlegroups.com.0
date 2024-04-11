Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBB2G64GYAMGQEEJNVV3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1139.google.com (mail-yw1-x1139.google.com [IPv6:2607:f8b0:4864:20::1139])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4D28A2229
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 01:16:58 +0200 (CEST)
Received: by mail-yw1-x1139.google.com with SMTP id 00721157ae682-61869a4320bsf11026797b3.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 16:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712877417; x=1713482217; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yCuIFqC6NAfV2Rin2l2OTEcLee/MeiHxL24lPubSFR8=;
        b=xQ01z4Z5CamnyKR14YUhMwVKPCj9SpEDVrJ327fBcUzTJihrvYL7e6cUreLWvA3xo/
         DWV8ql9XHN8Xi3LhDANInBKFVPwp5Ssx+tBGFJWEG9qtCQMyOBE5ne0U36q60OymJ7dJ
         QvtS/Qt0JHkO4ZA8kNxApoqFcX3azT0Byphokvl8AS1xasaIi+6fYJ0Odl3LGk9M4g13
         g+QaTtiMQRfv8IYdmp9W7QDfSazvn0qTi8SzUvnKuoyHOQgxedJohFBdiHTy66lnes+K
         KKHNv6Z+GvVOoUfd0myyGrO39lPy+hkLR5aS6RaKQklawMlw1qjNVuhvi0XQbeZ0DPLC
         rgVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712877417; x=1713482217; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCuIFqC6NAfV2Rin2l2OTEcLee/MeiHxL24lPubSFR8=;
        b=fVTXBjT4v56i/EjbY4LaSA9Gu4ypyRkHAK/K3OHKZRJGjtCAOto64Ox5SB249+SZqL
         w/WoSmJMbWZVSlTzcwYK6C1AKzUBvCD97D2ChG+j6MPy7En6yJuttAPHXGl4Q917rb+i
         KQseerGRkPfsIjpy3IZ1Sk2Md4uo3QdP/dHH0Du0elDLe02ZSiCZ51kt8BDGqMuSFuui
         zYGd6sN/BRfBZH8OJ/hbaYISwuURnN+GPrlHdVQxK0OAiqFtVnS2kkkVUpIjtmksI007
         LFbaYIGoigKHJGvJUc2DbEAu1/8j9iGi7Vv0x/T6nIdz5/uMcNnAdzsKkoNRjs4rgv7L
         N0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712877417; x=1713482217;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yCuIFqC6NAfV2Rin2l2OTEcLee/MeiHxL24lPubSFR8=;
        b=oyjpDNLpx95jj3YOQWZGtWwxlhj7W2viwNw+W2GbE/cc9OE+dlzklkW4ej+yx1ROGZ
         7EidCTfC5CIsWOooZqCFvZ0+8oOIX6qK73xJJx/yJaCI+EDawft+wtHdH6/RuMrWtrKf
         pujSywsT19Pnv5DviWVtdjGrS4xXrVqWWEh1LqKzoUXQIZ4Lvlo1NSe8Pqrw7NXC0eu8
         qIWlVHcljYFndXMlLpM1VO1ODPzjrQXSINrlWPu107NUmNmA+26+INR2MXYkmRe7UZYm
         IUokWazuhtZ1kh3ZDFNI1saGi7gM7VAZE+jQBEERoLjTCB6fOg07cohuzyN8st9ypfGx
         fO/g==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVGa+mq/9d+K8VFxfK/B1VFMFpZ295FX7m3r7Hxuwn8HFFmew+Nkv3uU7vlPK+zSCaps2kxZ0doCUEjaIhkWPGKlaj/54f+Ej5zDRo=
X-Gm-Message-State: AOJu0YyT2S/I+lsUD6QvYp8f6oaF8VeVfh26+satoHxkEs6KE3XtOib5
	c44QqQ+7tZaasy7QbC3o2C6gXexHRPskFPEcGe1wggox0rhAxBiE
X-Google-Smtp-Source: AGHT+IGwVvIdbE1jiOk6tkKGcSicnPcTBo4hWAiaJ5W3iEXqRVCUa7ogcwGqZyo71CzytqBf7iruhw==
X-Received: by 2002:a05:6902:1342:b0:dcf:a4a8:5fb3 with SMTP id g2-20020a056902134200b00dcfa4a85fb3mr1029372ybu.11.1712877417193;
        Thu, 11 Apr 2024 16:16:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:6e56:0:b0:dcc:37ed:efb1 with SMTP id j83-20020a256e56000000b00dcc37edefb1ls158536ybc.2.-pod-prod-00-us;
 Thu, 11 Apr 2024 16:16:55 -0700 (PDT)
X-Received: by 2002:a81:4e82:0:b0:611:66e0:8dd4 with SMTP id c124-20020a814e82000000b0061166e08dd4mr958044ywb.5.1712877415581;
        Thu, 11 Apr 2024 16:16:55 -0700 (PDT)
Date: Thu, 11 Apr 2024 16:16:54 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e9f27bdf-bc04-4f65-8578-d350bed75e69n@googlegroups.com>
In-Reply-To: <CAEfxd-_dzFAhL1wTkCAPyZKQVWNWaSXX6daAKCuiwARGZK8u-Q@mail.gmail.com>
References: <23a847d5-6d75-4ed0-986e-6d58405abb83n@googlegroups.com>
 <CAEfxd-_dzFAhL1wTkCAPyZKQVWNWaSXX6daAKCuiwARGZK8u-Q@mail.gmail.com>
Subject: Re: run non-root cell by SD card in RPI4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_116300_1993714540.1712877414366"
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

------=_Part_116300_1993714540.1712877414366
Content-Type: multipart/alternative; 
	boundary="----=_Part_116301_128465010.1712877414366"

------=_Part_116301_128465010.1712877414366
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e9f27bdf-bc04-4f65-8578-d350bed75e69n%40googlegroups.com.

------=_Part_116301_128465010.1712877414366
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
om/d/msgid/jailhouse-dev/e9f27bdf-bc04-4f65-8578-d350bed75e69n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/e9f27bdf-bc04-4f65-8578-d350bed75e69n%40googlegroups.co=
m</a>.<br />

------=_Part_116301_128465010.1712877414366--

------=_Part_116300_1993714540.1712877414366--
