Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBO5MY6YAMGQEHTKMQTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1139.google.com (mail-yw1-x1139.google.com [IPv6:2607:f8b0:4864:20::1139])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CE889AD9B
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Apr 2024 01:09:49 +0200 (CEST)
Received: by mail-yw1-x1139.google.com with SMTP id 00721157ae682-61575fc6d1csf52550037b3.1
        for <lists+jailhouse-dev@lfdr.de>; Sat, 06 Apr 2024 16:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712444988; x=1713049788; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zAxJFaHHreNb3J0SmkVGEUv8oUYHAsCMHEeaZ+PlxCo=;
        b=feohsPItajwbibRqBwqhKNIMdj3NQx65Bxqx2/UNCDf1AM9WOCLVbMyK2aVAFQzqHX
         179MAb5PgqYL4dncaWIgkTf08Jqkg4FARZOg/RLKVwmFpncfFHy8ukt5MVZdKPX+rhzx
         77A5Ale1t6Ci9nw/lS9G9wE40wRgs5q4ZmH1SxRWAxr6iZLjRPzMZGhMjDOpZP/MBEKQ
         zOT8whszONux68wVg+lfnKmX5uUNQSjDsOBXIf6Yywt7KUI06tHLbYjRWLGJ52MtTuRO
         +JemxzLhEfc7lVJbt9IB2ni27qnZxxTYYJ9hgrqrEPG6gmkxfU57IlbEZv4aHY5mVJGG
         8IHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712444988; x=1713049788; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAxJFaHHreNb3J0SmkVGEUv8oUYHAsCMHEeaZ+PlxCo=;
        b=CPT9HsimjJneE1G/FSgjOZC5UgoDj/W7OnBN0ELDcc2N+o1vZi14opLwqWB05A3Ik+
         pzqIcive4C3SQNuKigNgnWWCGjcH6QA3GE2fHBVpkxDaeXGuDKmf/0k214NKcFM4F5yE
         8PuNSB9z1jZpSS1OA9f0ScOQqZyxv/+FCTQJzd0OAqPs3NfgLcnzpC5vJ+1LVIrDEQkv
         J5R42RODtjeEOeCaOJ6clnKLLRh/UEYSC0zcGLG2kz0wbIQ85IaXeqJDnKlJ6nvZxgr6
         +7Se1qIt1zNAHZdRjGqiDRMtCzDDGC29jmXr/uJH538NpDyAmwecwGGOwxLl5bVg8CtN
         VDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712444988; x=1713049788;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zAxJFaHHreNb3J0SmkVGEUv8oUYHAsCMHEeaZ+PlxCo=;
        b=o+gcKHaHMAo/b9KKt4V+R/mzZHKlVNTIJqbnMLrPhHaBrmsq9E3UevYTGNtYLN4al6
         YA7Lx33KuIYfCDSgBb5oXNwfwnZ4I8ujbO2NvmZY8rkKRmzHvxMkU555ywQy7QTvGgYy
         FLShnfVqoNYJi8dSecBTGl7K/S7oM72qmAaNrb1urQwPVX88FAH9rxp2AzSYpf7K/DbO
         uTkHBLQPMQo3BM5kKly4mof76YUzPHXokB30yYZbI6EjjkccycixzrRljNhlPeGkumL5
         LYKb9UxVWcGGdYhoOej4YNBNe6HQrfiRRFIF2UxbdAFkaHjY7VNxWqqRu3QpqerO7dyC
         63Rg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXw9gY9OFFTmFm/JkVtl7wY6rZ3RuXTdwvzsUbL+2bBXgrmyhQRx+S4SaO780VsqkQZ39rHvh26hzjU7+ZHpGxKUS7xvvR88Yf9Zjc=
X-Gm-Message-State: AOJu0Yydqgho//4EzHH7ZeX1am9SVBNDJa5ax//9xSLjsqCsiJhoTR7V
	RbacjYRVyh+Y7JU4EcUYrdnR+XbQMhdpa2C7yqNB7wjjteMTgLy9
X-Google-Smtp-Source: AGHT+IEsDBK5THL2s/9TU8uMbvDq5/nEasLA/gnAGuOCDOzUt3mVygGqAeFBwHwyP0+CmpwQUrfuFQ==
X-Received: by 2002:a0d:d809:0:b0:615:8029:49f8 with SMTP id a9-20020a0dd809000000b00615802949f8mr4347277ywe.23.1712444987935;
        Sat, 06 Apr 2024 16:09:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:c4c5:0:b0:dcd:202d:6be8 with SMTP id u188-20020a25c4c5000000b00dcd202d6be8ls1585976ybf.2.-pod-prod-08-us;
 Sat, 06 Apr 2024 16:09:46 -0700 (PDT)
X-Received: by 2002:a05:6902:2b13:b0:dc6:f877:ea7b with SMTP id fi19-20020a0569022b1300b00dc6f877ea7bmr1640053ybb.9.1712444986311;
        Sat, 06 Apr 2024 16:09:46 -0700 (PDT)
Date: Sat, 6 Apr 2024 16:09:45 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0b698fd3-961d-4dcd-836d-6f740b44e70bn@googlegroups.com>
In-Reply-To: <CAHakC1+9=B3JmhbG8WRgcJ__saMPkPd8U5qNK16CFU4ZgCvUxg@mail.gmail.com>
References: <CAHakC1+9=B3JmhbG8WRgcJ__saMPkPd8U5qNK16CFU4ZgCvUxg@mail.gmail.com>
Subject: Re: Enable smmu-V3
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_156608_496206965.1712444985606"
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

------=_Part_156608_496206965.1712444985606
Content-Type: multipart/alternative; 
	boundary="----=_Part_156609_1367806523.1712444985606"

------=_Part_156609_1367806523.1712444985606
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

On Wednesday, January 31, 2024 at 2:44:27=E2=80=AFPM UTC+1 Laurent Corbin w=
rote:

> Hi,
>
> I'm building a Jailhouse demo on LX2160a.
> I boot a root cell and now, I'm trying to boot a Linux in a non root cell=
=20
> and I'd like to enable smmuV3.
> But I found some "ToDo" in the arm64/smmu-v3.c file.
>
> Does smmuV3 work?
> What else needs to be done to complete smmu-V3 support?
>
> Thanks in advance,
>
> Laurent
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0b698fd3-961d-4dcd-836d-6f740b44e70bn%40googlegroups.com.

------=_Part_156609_1367806523.1712444985606
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
 Wednesday, January 31, 2024 at 2:44:27=E2=80=AFPM UTC+1 Laurent Corbin wro=
te:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8e=
x; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div dir=
=3D"ltr">Hi,<br><br>I&#39;m building a Jailhouse demo on LX2160a.<br>I boot=
 a root cell and now, I&#39;m trying to boot a Linux in a non root cell and=
 I&#39;d like to enable smmuV3.<br>But I found some &quot;ToDo&quot; in the=
 arm64/smmu-v3.c file.<br><br>Does smmuV3 work?<br>What else needs to be do=
ne to complete smmu-V3 support?<br><br><div>Thanks in advance,</div><div><b=
r></div><div>Laurent<br></div></div>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0b698fd3-961d-4dcd-836d-6f740b44e70bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0b698fd3-961d-4dcd-836d-6f740b44e70bn%40googlegroups.co=
m</a>.<br />

------=_Part_156609_1367806523.1712444985606--

------=_Part_156608_496206965.1712444985606--
