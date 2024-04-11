Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBJNT4GYAMGQEHTP7QDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113e.google.com (mail-yw1-x113e.google.com [IPv6:2607:f8b0:4864:20::113e])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDF58A210A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 23:44:06 +0200 (CEST)
Received: by mail-yw1-x113e.google.com with SMTP id 00721157ae682-61810d4408csf4233387b3.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 14:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712871845; x=1713476645; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oc+HMpvm9Enz2oR4ZO0feStHZxK8v/FIxftuRRhVKFE=;
        b=oIhIL/44N6b7IYmgxClN8eAX64POCQjI7tVTWUyyXK7pABhNOfJl9z/Q2TUnJUdu+Q
         ZFxyCccQQ28/lJrWP4CYhAJDfbbWWvyuDargiiQD0gg/HODykTLQxz4ZCVhAyQtL3NRn
         QKxJmEYTIl+kIyKhFM/irQTyH8CKEn9rYQPmnTAFCyod2/zbeS3OC+If7FQa/LPg2UjF
         eV5ACP9ojGGj6qHY7dn55oLzgBYXdfY0VeHgf2lcKgIHatz+IRvMmlmhycQULUO+VQt3
         MVojqB6pQ1XJCbw4UUf7bjU2WtdgdxAApU2liyEUuaJNOECnLzbgSPZIGrRH7bXnxQQA
         rKpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712871845; x=1713476645; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oc+HMpvm9Enz2oR4ZO0feStHZxK8v/FIxftuRRhVKFE=;
        b=bx5DHmGXgv9j9zZX1+UHQHti16TQ02QlzBmzehEOOZobJ6wESDUMe2D92T/Q66Xoov
         W3xDbzn23uYELFXdDTEMjpQaBj8/2oYVJuwwHi44W2F8CVneGn1E71Fai0pGyiXtBaD6
         1DIwqDAe6bfXIIKvKYbgFSc4YMcdDUU+oWvQ0RvU4Ss8iR8D3wp/NMYoarUjRfmezHmE
         1/bBvZHGP5jEO3ElHDPx5mCWKgZ3qLl1rz4P1YHJT9uYHTLFy5dhil+Mos3Q1mAAljoF
         RMX61BseBHWLc/p78DEGgbXJdoIihPd7INgbxZ8hjdvczp7nyoxaKBqioUwT/XOoRd1W
         DthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712871845; x=1713476645;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oc+HMpvm9Enz2oR4ZO0feStHZxK8v/FIxftuRRhVKFE=;
        b=bH26Om0TqD8Nw03mIYO8ZnB7sq4VBRmJePK0iSVZFAH/H4yiyWxXj7f5AVuYQYYEKg
         vZ3Dnjk05L7nRvkAK0d6tZSSyFs0eI2aSmWNn4jpINY1qgGzb5tdUtwHUNDloezjcJK0
         EAuFCc2MMaRYDR91/QLmnMxHGd4XUqjgM6GvS0hlv5dIPBWAZgR3UiFW9df7OcC9rbfZ
         IZyWXrisTEgSBD6oNlit9zbu/hAD+WhhEXsXDWnaWasNnQ5L7O+M+KiXJmIhnTjRX0ad
         6TN5zhTgQHkdrpidscU4Ugn+vpTiMEnjPG8MxXKQhe3Pzpqf5/vbIg9AckWph8DMd4Ik
         OFJg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUs75QCM1eb8vDsuN1yv9p+8p9WN6TDpwj/W7CnJ6wchg2B5sdSWMt/VSBbcvvMXNO1sJZX+w9pMQMCF5M8Jhafzq7t7hmCeoYuma0=
X-Gm-Message-State: AOJu0Yw87toRrxX7+3njZBiaxy0BnjcKxpPAKvLYZM/AmrQSlpt2w3In
	faKF4d+rsAak14C6s8tItRZ+mMQhOxP2L1zo90vigiTj1AsoQZuF
X-Google-Smtp-Source: AGHT+IE4J5o+u3s4bwJ0ls6Gk4tutslVWT3aVI2EOYKJUgs+FtCWfFjm5VeDYRyOdCOvze4wPI5+TQ==
X-Received: by 2002:a05:6902:1b87:b0:dcc:79ab:e51a with SMTP id ei7-20020a0569021b8700b00dcc79abe51amr833006ybb.57.1712871845732;
        Thu, 11 Apr 2024 14:44:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d696:0:b0:dcb:b370:7d12 with SMTP id n144-20020a25d696000000b00dcbb3707d12ls450323ybg.1.-pod-prod-00-us;
 Thu, 11 Apr 2024 14:44:04 -0700 (PDT)
X-Received: by 2002:a0d:eacf:0:b0:618:6189:7384 with SMTP id t198-20020a0deacf000000b0061861897384mr274864ywe.3.1712871844276;
        Thu, 11 Apr 2024 14:44:04 -0700 (PDT)
Date: Thu, 11 Apr 2024 14:44:03 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <eae794aa-f060-4996-b74a-84e29289c0d3n@googlegroups.com>
In-Reply-To: <CAGnY=9YQ1DrzvrZbHT+MKbEd8L+4OeAuTAz8ruvPNztCZ-ALxg@mail.gmail.com>
References: <CAGnY=9YQ1DrzvrZbHT+MKbEd8L+4OeAuTAz8ruvPNztCZ-ALxg@mail.gmail.com>
Subject: Re: ORDER#15346
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_208888_1371868681.1712871843643"
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

------=_Part_208888_1371868681.1712871843643
Content-Type: multipart/alternative; 
	boundary="----=_Part_208889_1054467268.1712871843643"

------=_Part_208889_1054467268.1712871843643
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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

On Monday, November 27, 2023 at 4:46:57=E2=80=AFPM UTC+1 BILLING DETAILS wr=
ote:

> Success Your items will be delivered soon Allow post Delayed delivery=20
> promising
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/eae794aa-f060-4996-b74a-84e29289c0d3n%40googlegroups.com.

------=_Part_208889_1054467268.1712871843643
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
><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On=
 Monday, November 27, 2023 at 4:46:57=E2=80=AFPM UTC+1 BILLING DETAILS wrot=
e:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex=
; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Success Yo=
ur items will be delivered soon Allow post Delayed delivery promising
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/eae794aa-f060-4996-b74a-84e29289c0d3n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/eae794aa-f060-4996-b74a-84e29289c0d3n%40googlegroups.co=
m</a>.<br />

------=_Part_208889_1054467268.1712871843643--

------=_Part_208888_1371868681.1712871843643--
