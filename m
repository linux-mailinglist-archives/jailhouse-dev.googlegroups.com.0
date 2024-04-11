Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBT7F4GYAMGQEVIRYOZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113c.google.com (mail-yw1-x113c.google.com [IPv6:2607:f8b0:4864:20::113c])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CDD8A224D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 01:31:29 +0200 (CEST)
Received: by mail-yw1-x113c.google.com with SMTP id 00721157ae682-61807bac417sf5635437b3.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 16:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712878288; x=1713483088; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oj7I7r28kdIr1OWfVl48cAmX0WqZ2iItVkr9Ilz4RkY=;
        b=RTrpdO2ZC+S0PhjkB4OpE3h74bCObSUxzw5m5bCH38TOxSe/p0RdW6qLyaP5jWxOUi
         YECYuH+iXGLkDpi9gW99QC4SUIROoaQl2XY/YO93qmPxKx1PbWFsaAekulDWfsg/3oOQ
         966XN13U1CmD37jSzZxrbTTlyDN6nmklGWGqpI2t1BiI2yCdTiMjBCVAQOY4Ht8pygG5
         fUSVVie+EEaQPDtqPjDrxa/0UAhCbXWToMLaRMIcL0F8NdZNHCEPUd8pDmHqN/K3p4gA
         riEma61VK4Qxz/Qb+S9Y+tgQb/zY69f2fsbceEUG/jAp8B9diIwuDrh4zqpidxIBep+D
         huTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712878288; x=1713483088; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oj7I7r28kdIr1OWfVl48cAmX0WqZ2iItVkr9Ilz4RkY=;
        b=N1mrA+34+VPFEYrYCET3IkpiVOsslDcjB+mtlEoRksg5fqF80JCAXPJoQ0ePZF1HQH
         VU7QrQQIqO5wJKy1qS8znIGF18Hp3XUeCIVFFDTafQIBcE4PVVAZagn3OZKG15GMucyd
         q1PHcN25bubTQ03fqLCH/2SUxMC77yLzYPjubI/Gk9cR8ygsVfh/IiCkQQGnsKdXZA/h
         n9LQoyArvlCje+zz5TOTwIaDeyj/YhhHKsbIJAbcjr+7HPmsyAuomUvYZeqdUPzd8LCL
         gvHWoEvZeexWrrmnPlan2xVhFPCUErByoMLqScQsa5naRC0cyk4F7v3sMDOvyBJd1sGo
         rQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712878288; x=1713483088;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oj7I7r28kdIr1OWfVl48cAmX0WqZ2iItVkr9Ilz4RkY=;
        b=Pe9/EC8pwBOeNkTShfW2vca6/mHq3a0yiOrFGrgWN2Wc24jwkqkXMXHds9rFgTpRlf
         NdNc3DnPcvdcickACnMIuRBKn4DJvZyw83Y65jwNfnVKV9Q4dKEdXoAoD80CIQtFPIsa
         b1JDoQStxndUCdB59X1O8MhOQ+By/v9Q6MlvJVaJUoZwl5JU3GwqeSnueMYKRvIs4R0t
         U+G60J/G5lhEIoqLPetcYRUyzJZc0YeG5WsmlxEVpSXiCkJoVhV9agl0xztCKeSRmlv4
         zKtpMW4/sDLGnQZbC+C3Qr1s917djwTCR2mIIl5ReDTJDrfvrsIso/6q2QD97jPMrPld
         2kwg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVR3huE5Dkpl6xDrri6/gG/NhyqfaJOPvOm/Uu28OqngG5MJEMo+PRd7cOnFM0yKeBYOyc+SSz2oaN3pHLC6fQSuP0hFJZSQo9rFsg=
X-Gm-Message-State: AOJu0YwBY2CiViEWfFHwfb9A/FSsO1sipvW7cDfi9RhaFEYSBd7ChoLe
	WkTLsqsndyxyzrlq9WAdRyLetV4FlRA6SoNddLLrNoq1uqfSl5dW
X-Google-Smtp-Source: AGHT+IGEUXLXY/PeUbSaZZGunnanJdM6m5BDLL0Etkeqs9oNj7xEXpWwANchgmoRAoF2tPpGWNnGhg==
X-Received: by 2002:a05:6902:260d:b0:de1:1b73:6f05 with SMTP id dw13-20020a056902260d00b00de11b736f05mr1194176ybb.61.1712878288530;
        Thu, 11 Apr 2024 16:31:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:e0c2:0:b0:dcc:4b24:c0e3 with SMTP id x185-20020a25e0c2000000b00dcc4b24c0e3ls773636ybg.1.-pod-prod-07-us;
 Thu, 11 Apr 2024 16:31:27 -0700 (PDT)
X-Received: by 2002:a05:6902:18d2:b0:dc6:fec4:1c26 with SMTP id ck18-20020a05690218d200b00dc6fec41c26mr289689ybb.1.1712878287152;
        Thu, 11 Apr 2024 16:31:27 -0700 (PDT)
Date: Thu, 11 Apr 2024 16:31:26 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3b233d96-6ddd-4fe0-9b81-f469d435bdb9n@googlegroups.com>
In-Reply-To: <716a8a07-3a7f-f20f-d08a-a9cb4ee607c2@siemens.com>
References: <CAKM86uE4n7wWu2UZYr+hGOBrZ4d5eHsJhOND7pmd4apNZzhLBA@mail.gmail.com>
 <716a8a07-3a7f-f20f-d08a-a9cb4ee607c2@siemens.com>
Subject: Re: Jailhouse and optee interaction
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_95648_146892022.1712878286568"
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

------=_Part_95648_146892022.1712878286568
Content-Type: multipart/alternative; 
	boundary="----=_Part_95649_235638391.1712878286568"

------=_Part_95649_235638391.1712878286568
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

On Wednesday, May 10, 2023 at 4:37:11=E2=80=AFPM UTC+1 Jan Kiszka wrote:

> On 10.05.23 16:21, 'Vladimir Neyelov' via Jailhouse wrote:
> > HI all,
> > We use jailhouse hypervisor on our platforms. Standard configuration is=
=20
> > root cell - linux, secondary cell - ThreadX. But now we want to add
> > optee os support. How jailhouse can interact with optee os. What is the
> > common way to run optee os in jailhouse.  =20
>
> OP-TEE OS runs in secure word, Jailhouse runs in non-secure EL2. All
> what Jailhouse has to deal with are service calls from EL1 and above to
> EL3 and, eventually, to the secure world. Jailhouse traps all SMC calls
> and only handles or forwards a view of them, see
>
> https://github.com/siemens/jailhouse/blob/e57d1eff6d55aeed5f977fe4e2acfb6=
ccbdd7560/hypervisor/arch/arm-common/smccc.c#L117
> .
>
> Now, simply allowing all calls to OP-TEE is likely no option as those
> may either have side effects on the platform. If they follow a standard
> calling convention, maybe a permission list could be created and then
> enforced by Jailhouse according to a cell configuration. I vaguely
> recall similar thoughts about other EL3-targeting calls. Key issue, also
> there, is that you can police access just based on service call IDs or so=
.
>
> But the situation may be even more complicated when a TEE service or the
> OS itself are not aware of partitioning and not keeping requests from
> different instances (which could be different cells in Jailhouse) separat=
e.
>
> Obviously: Anything that is harmless by design and across all boards and
> TEE implementations could be allowed by default in Jailhouse, but I'm
> not expecting to find much of that.
>
> Jan
>
> --=20
> Siemens AG, Technology
> Competence Center Embedded Linux
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3b233d96-6ddd-4fe0-9b81-f469d435bdb9n%40googlegroups.com.

------=_Part_95649_235638391.1712878286568
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
 Wednesday, May 10, 2023 at 4:37:11=E2=80=AFPM UTC+1 Jan Kiszka wrote:<br/>=
</div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On 10.05.23 16:21=
, &#39;Vladimir Neyelov&#39; via Jailhouse wrote:
<br>&gt; HI all,
<br>&gt; We use jailhouse=C2=A0hypervisor on our platforms. Standard config=
uration is=C2=A0
<br>&gt; root cell - linux, secondary=C2=A0cell - ThreadX. But now we want =
to add
<br>&gt; optee os support. How jailhouse can interact with optee os. What i=
s the
<br>&gt; common way to run optee os in jailhouse.=C2=A0 =C2=A0
<br>
<br>OP-TEE OS runs in secure word, Jailhouse runs in non-secure EL2. All
<br>what Jailhouse has to deal with are service calls from EL1 and above to
<br>EL3 and, eventually, to the secure world. Jailhouse traps all SMC calls
<br>and only handles or forwards a view of them, see
<br><a href=3D"https://github.com/siemens/jailhouse/blob/e57d1eff6d55aeed5f=
977fe4e2acfb6ccbdd7560/hypervisor/arch/arm-common/smccc.c#L117" target=3D"_=
blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?=
hl=3Den&amp;q=3Dhttps://github.com/siemens/jailhouse/blob/e57d1eff6d55aeed5=
f977fe4e2acfb6ccbdd7560/hypervisor/arch/arm-common/smccc.c%23L117&amp;sourc=
e=3Dgmail&amp;ust=3D1712964605083000&amp;usg=3DAOvVaw08VhDNUGRfMMG50Dn10mAa=
">https://github.com/siemens/jailhouse/blob/e57d1eff6d55aeed5f977fe4e2acfb6=
ccbdd7560/hypervisor/arch/arm-common/smccc.c#L117</a>.
<br>
<br>Now, simply allowing all calls to OP-TEE is likely no option as those
<br>may either have side effects on the platform. If they follow a standard
<br>calling convention, maybe a permission list could be created and then
<br>enforced by Jailhouse according to a cell configuration. I vaguely
<br>recall similar thoughts about other EL3-targeting calls. Key issue, als=
o
<br>there, is that you can police access just based on service call IDs or =
so.
<br>
<br>But the situation may be even more complicated when a TEE service or th=
e
<br>OS itself are not aware of partitioning and not keeping requests from
<br>different instances (which could be different cells in Jailhouse) separ=
ate.
<br>
<br>Obviously: Anything that is harmless by design and across all boards an=
d
<br>TEE implementations could be allowed by default in Jailhouse, but I&#39=
;m
<br>not expecting to find much of that.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Technology
<br>Competence Center Embedded Linux
<br>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/3b233d96-6ddd-4fe0-9b81-f469d435bdb9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/3b233d96-6ddd-4fe0-9b81-f469d435bdb9n%40googlegroups.co=
m</a>.<br />

------=_Part_95649_235638391.1712878286568--

------=_Part_95648_146892022.1712878286568--
