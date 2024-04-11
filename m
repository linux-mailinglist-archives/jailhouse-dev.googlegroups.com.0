Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBWWX4GYAMGQEF5KFXSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EEB8A2207
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 01:01:48 +0200 (CEST)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-dc74ac7d015sf496721276.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 16:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712876507; x=1713481307; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s9HahYNkMtLLFRCKePV6Omk+4Icet4D9mI1hpGr6u5U=;
        b=BvUZF8nLtfIWIP8tLKWJANBuQaWBJtvd9pIdQs+uLAs+TYGuY4tt41iaYgGDGxH79F
         ngYAaU3KB5/qpzuuLLrMrpvPFgDj8o9uf/40YEwC8MVU48oza6+xJ2/LzqGBe1AMKjlD
         XE0QVvH0FBUrHnBLOGbBZXS6oPcqyjUQtYW4BlhDkSaLhjt8Xlp7TdI+TLHl1KxKsDDy
         PhGijPBKEal5Q+41Mkg8NBiq9pu1ljjxQU3kr4FeDDVLpwq9iJgxuCTo5z7hiOQUGKwG
         sMguti4V+v0qqU18wzf+ioCWnsKe0OMNaFra6QNj3RbIGoFVuzbyV15MfeeWiken8o41
         yyRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712876507; x=1713481307; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9HahYNkMtLLFRCKePV6Omk+4Icet4D9mI1hpGr6u5U=;
        b=MQieYBjuBTekFitrkgBg6N3opDA8qOBMxdbTkUxooRiKS6c6UTUK0L/I065bd4tcxy
         ywync0NNWToEV+Mw/kjXuken75QkPj/jVKS7YOGGRslcttTd6w2TsZ5ouk+Nya7Lxu4x
         KM7gnptR1kyWg8G34VoWJwWJMj+pX7I0DuV+vlPkAZZdJJoWGFW5qNY1WgiBmZ3tVy69
         0jgWYov8IiD7CtniE9drGCfQdN7HUStd4Vn6L1kcseuFiZZlVVazhC3A5llpFjVan2u3
         iPajv/eq+nbeQLTRt0WWfT9gHke422O4jbN9COuHLy/uP7ExS1HHzrGGGMcNLoZ8imVi
         fF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712876507; x=1713481307;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s9HahYNkMtLLFRCKePV6Omk+4Icet4D9mI1hpGr6u5U=;
        b=szx+FcJP93DbIFXd6D/siOsW7hYW+E1Vj3Jv4pAqzFx7ml6nGWGbjfCfEL9HmtGC6f
         COcMhvpvt/js5o4r8OQApgsK7bERxgcBCiG1sC0cMAemhvFXdl2NVOnQ5/YEbUGka3+r
         7x9BqTjU/iiDxgdLRJSeTJz0+wDDqmXtYncJgL4u5pJdQdgVLT99KmHTVXks5i5k/MEj
         iknUZ1CpjDkPbOFC3lL/WgVaSZFK0CRxM1y+Z+mKP517uPZUYLXeoWN4PVz/34yWRVlT
         xoMUytRaiD1eGwtA5vT5pDvUZAqTNv8lYj0DQRzN7X+lHrfY0pIAISL1Yrm0gf6o6D51
         ySWQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCV07Im8nv8AUoUysSLeIAgGMjlE2LTpmmTqPRtXo2uMfxvIDVhtn7yx6UhYivOyOaP9GTt1BqynDD0BvuiG4gKhQVi7Yl9uIGGC4CA=
X-Gm-Message-State: AOJu0Yw9S+cAeZFbDhT2zIweg9PJPpIkrbZED5tRGX5IXNDDAFQaerO3
	/In4EJW6u6eOKVKp8uFbwdkKuOG8z+04z6fHjfAOhtkDHne3vZoj
X-Google-Smtp-Source: AGHT+IFDsJ45YWof1b7UbOlnXb+A1MDiiEeg7sCVuGZfIlgrXGi+PSL+PzRRB0tN+OXGOGS9TRMJzQ==
X-Received: by 2002:a5b:f84:0:b0:dcc:1062:47c0 with SMTP id q4-20020a5b0f84000000b00dcc106247c0mr855289ybh.56.1712876507538;
        Thu, 11 Apr 2024 16:01:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:b7ce:0:b0:dc7:465d:fb81 with SMTP id u14-20020a25b7ce000000b00dc7465dfb81ls535639ybj.2.-pod-prod-09-us;
 Thu, 11 Apr 2024 16:01:46 -0700 (PDT)
X-Received: by 2002:a81:480d:0:b0:614:e20c:d3ef with SMTP id v13-20020a81480d000000b00614e20cd3efmr200356ywa.10.1712876504188;
        Thu, 11 Apr 2024 16:01:44 -0700 (PDT)
Date: Thu, 11 Apr 2024 16:01:43 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9096f508-516d-4246-8d87-bc4af4e6c567n@googlegroups.com>
In-Reply-To: <c62a1c53-9134-468c-8307-f4a24ed313e6n@googlegroups.com>
References: <c62a1c53-9134-468c-8307-f4a24ed313e6n@googlegroups.com>
Subject: Re: x86 interrupt latency on apic-demo application
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_94514_397773842.1712876503520"
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

------=_Part_94514_397773842.1712876503520
Content-Type: multipart/alternative; 
	boundary="----=_Part_94515_884363573.1712876503520"

------=_Part_94515_884363573.1712876503520
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

On Wednesday, August 16, 2023 at 7:43:10=E2=80=AFAM UTC+1 Romain Rollet wro=
te:

> Dear everybody,=20
> I am new on this group, starting my experiment of jailhouse on x86. So=20
> hello everybody!.=20
>  I succesfully run it on a Apollo Lake platform with kernel 5.4 (ubuntu=
=20
> 20.04). I ran the apic-demo application and measured interrupt latency=20
> using the APIC timer (TSC deadliine mode). IOMMU is correctly configured =
so=20
> we have no VM exit as reported by statistics. Most of the time, we have=
=20
> very good time (~300ns) but sometime, we experience very long latency=20
> (>10=C2=B5s). There is no SMI as reported by the SMI counter available on=
 Apollo=20
> Lake. =20
> We observed the same behavior on another x86 platform with ubuntu 18.04.=
=20
> What is the reason of this  very long latency? Is it due to the apic time=
r=20
> itsefl?
> Thanks in advance,
> Romain
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9096f508-516d-4246-8d87-bc4af4e6c567n%40googlegroups.com.

------=_Part_94515_884363573.1712876503520
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
 Wednesday, August 16, 2023 at 7:43:10=E2=80=AFAM UTC+1 Romain Rollet wrote=
:<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex;=
 border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Dear everyb=
ody,=C2=A0<div>I am new on this group, starting my experiment of jailhouse =
on x86. So hello everybody!.=C2=A0</div><div>=C2=A0I succesfully run it on =
a Apollo Lake platform with kernel 5.4 (ubuntu 20.04). I ran the apic-demo =
application and measured interrupt latency using the APIC timer (TSC deadli=
ine mode). IOMMU is correctly configured so we have no VM exit as reported =
by statistics. Most of the time, we have very good time (~300ns) but someti=
me, we experience very long latency (&gt;10=C2=B5s). There is no SMI as rep=
orted by the SMI counter available on Apollo Lake.=C2=A0=C2=A0</div><div>We=
 observed the same behavior on another x86 platform with ubuntu 18.04. What=
 is the reason of this=C2=A0 very long latency? Is it due to the apic timer=
 itsefl?</div><div>Thanks in advance,</div><div>Romain</div></blockquote></=
div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/9096f508-516d-4246-8d87-bc4af4e6c567n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/9096f508-516d-4246-8d87-bc4af4e6c567n%40googlegroups.co=
m</a>.<br />

------=_Part_94515_884363573.1712876503520--

------=_Part_94514_397773842.1712876503520--
