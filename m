Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBY6N4GYAMGQEJGPKH6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F6E8A21DA
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 00:40:36 +0200 (CEST)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-dced704f17csf499764276.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 15:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712875235; x=1713480035; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KiR5WTI1cVvvq1N1Cz7MzIB5Wfpy+cnnF2kzYeCzbyo=;
        b=WdGdF6Q8PGhVTfhMhzfZKoV1h6j4JIwMySdPZ11G/qTgXznaIpkn/Z7AW3BxrWCSqN
         vT/qpUgT8oynX17tEzYnp4iIVdwpVCO3xgCXUdUZLopFJvxVPL0sW+S+Gz7CfwY+IF8V
         hm8mgbQqdS7okD8QKADENrgH8X8Jq7MFQB2V5YdnnaUxOf7zlmsmGYX4wmkEGGu5vpnm
         xoTBLFcZ6ei7QtCwsqYQYwNif0G67XGyRwmBmNBwxpGmZkOdpqXecUDy9Im290l7ZHpH
         nc96SpsX2IkL7CBmz4zIS8qqqwVGWRnLG/Fl/SaWXJV3Sswn+VmE1AKfwpammndv6wQP
         bnrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712875235; x=1713480035; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KiR5WTI1cVvvq1N1Cz7MzIB5Wfpy+cnnF2kzYeCzbyo=;
        b=e57GvCybZLz+GHx3kC8Ek5SxliGYqve1heJTWEqiebjvzQylR2kflEFMbCRPIZyvfs
         aZ6MhCvdlrtlqXBAGyazm75UNmAe+uOOKrplaRyUdDvIIqVMAVEGQixDwffR0FyGwjoF
         W5fqYxD1Is4A8Ugm2nX8W9PpxqaI/V3B0OOm1RqTvU8J0FNchCd0hY9CgXzgSsU52RTG
         jAACorhytvGJNxVMLyMySmodhSCSkzrGZyCyZrxpyu1y/BaWdg4PW4BkDaDZnqzfHnF1
         anqFqV6eAVv4pVZHeF2k55Kj1+kbtGmTAmpksvEZPEjDkdkNjDkuIChPdsx8NO7mMtFd
         +FXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712875235; x=1713480035;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KiR5WTI1cVvvq1N1Cz7MzIB5Wfpy+cnnF2kzYeCzbyo=;
        b=knDwGBNL5HpaceVPP/euLUv1S2azEk8K9Wva0gfZe5DWlN86TnW3IMqgLkU/fvVmVn
         Am0OLfvbDynIIiPYTWZ4QaAVaRwJq9YmsV6a+0GnTvQNejZg8Vo/kFSg6JnFWUS/PcEB
         Le1YW/4fPlHQPSLbve/F7L8eJanH+/be+uulNZdq1h1xJoKxh/+aTeP06k26gwIk6CAB
         zYvWRE0jTwl+gqWK76iG9TTuzb0xA8sxRxFA3Aj06lH39KvUcBBPXFgkOVc4789F4Zxw
         C3GtGj6InzWwVpJhEnvI2F3yGM+gjdeo7L0I++L97oAOtS9wey3HqQji+R6wtvdilIok
         0mjw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCWaFFn7W4GJ9BurF31YFzm6DvNKNU3VsqHvQDkmsaCfkwLU4ITVnstOsf7swZbuqyPBwWmwzwgGf2cVD736UOb7SEiNmK5zVj0Kotg=
X-Gm-Message-State: AOJu0YzF78y2JkDI9uVz6ugB454bGFVIVt2XXmLzXTGtYjsmok+aUPK+
	jjF+dzze7jYZ4XS4OKqxth9QedQnHnGl69gwjcZhlD/vZCfDDsjb
X-Google-Smtp-Source: AGHT+IGo+OPc3OW+Hm/bVVz+qfWm9czV7Ytfu4UOGgddZDXoBj1bOIt0T5esceNRe6kcTAJqMMu6Jg==
X-Received: by 2002:a05:6902:2401:b0:dd9:2a67:f470 with SMTP id dr1-20020a056902240100b00dd92a67f470mr1054627ybb.25.1712875235685;
        Thu, 11 Apr 2024 15:40:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:7e87:0:b0:dcc:279c:e5c9 with SMTP id z129-20020a257e87000000b00dcc279ce5c9ls657681ybc.1.-pod-prod-01-us;
 Thu, 11 Apr 2024 15:40:34 -0700 (PDT)
X-Received: by 2002:a05:690c:c1e:b0:618:6454:88db with SMTP id cl30-20020a05690c0c1e00b00618645488dbmr201673ywb.4.1712875234329;
        Thu, 11 Apr 2024 15:40:34 -0700 (PDT)
Date: Thu, 11 Apr 2024 15:40:33 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a1a2d856-bab0-41a7-99df-e8ab1475504en@googlegroups.com>
In-Reply-To: <4267ad1b-14cf-4eeb-97d6-27da920a8c05n@googlegroups.com>
References: <4267ad1b-14cf-4eeb-97d6-27da920a8c05n@googlegroups.com>
Subject: Re: vector_irq() function
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_165586_1646716391.1712875233704"
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

------=_Part_165586_1646716391.1712875233704
Content-Type: multipart/alternative; 
	boundary="----=_Part_165587_1391421439.1712875233704"

------=_Part_165587_1391421439.1712875233704
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

On Tuesday, October 24, 2023 at 9:54:47=E2=80=AFAM UTC+1 Sara Alonso wrote:

> Hi!
>
> I want to use the vector_irq() function from gic.c inside a handler to=20
> check which interrupt has been set. I have tried this:
>
> if (vector_irq =3D=3D 0x0000000000004a04){
> firq1_set =3D 1;
> }
>
> But I got an error... I don't know how to use the vector_irq function, if=
=20
> anyone could help me with this or give me an example, I would appreciate =
it.
>
> Thank you!
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a1a2d856-bab0-41a7-99df-e8ab1475504en%40googlegroups.com.

------=_Part_165587_1391421439.1712875233704
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
 Tuesday, October 24, 2023 at 9:54:47=E2=80=AFAM UTC+1 Sara Alonso wrote:<b=
r/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; bo=
rder-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div>Hi!</div>=
<div><br></div><div>I want to use the vector_irq() function from gic.c insi=
de a handler to check which interrupt has been set. I have tried this:</div=
><div><br></div><div>if (vector_irq =3D=3D 0x0000000000004a04){<br><span st=
yle=3D"white-space:pre">		</span>firq1_set =3D 1;<br>}</div><div><br></div>=
<div>But I got an error... I don&#39;t know how to use the vector_irq funct=
ion, if anyone could help me with this or give me an example, I would appre=
ciate it.</div><div><br></div><div>Thank you!</div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a1a2d856-bab0-41a7-99df-e8ab1475504en%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a1a2d856-bab0-41a7-99df-e8ab1475504en%40googlegroups.co=
m</a>.<br />

------=_Part_165587_1391421439.1712875233704--

------=_Part_165586_1646716391.1712875233704--
