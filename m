Return-Path: <jailhouse-dev+bncBCL2X6UI2MBBBM42SSVAMGQEKPTMSTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3c.google.com (mail-oo1-xc3c.google.com [IPv6:2607:f8b0:4864:20::c3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1265B7E0546
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 Nov 2023 16:09:41 +0100 (CET)
Received: by mail-oo1-xc3c.google.com with SMTP id 006d021491bc7-581d766cc15sf2757829eaf.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 Nov 2023 08:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1699024179; x=1699628979; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thesD3KLFGeWxkTWmdxIpwm6Tt+iDjq2SiZwxlQ/5EU=;
        b=wxYuwymEoS8UL1F/PVIZVX+Rm5alhlGz1jh0oriB+N1hh6TcwFBRbNwrOJcMdH+4f6
         S3DCOYSTGyqpUyZrKW5oUOc8ElFELvfNtyzkP3pIdtanUxORUxuJoFXooN1QRc74lNbI
         uGo73sLFkyGVc5sFGpgaRVD+99741GIEXN8t9Aak2nZFJGXBXKeEAFoM+NM91ls5BuVX
         E72rYqMbCQzydds99QVB8/qA2bPT1OZfNJNXkwhEhNTj1fIF7FsdbF1eRnNSO0fgfow7
         VojqqQujJTaQhdMcu2Ct/Cu7BHTFlDvcXqgHL/3mfHn1zvnHo3KOIglVfWTEWnWUyKQ5
         E15g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699024179; x=1699628979; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thesD3KLFGeWxkTWmdxIpwm6Tt+iDjq2SiZwxlQ/5EU=;
        b=hxWST8nfTryskVMVelTfICk8srbE8y7lOnzgqMtfcsqevtTVLnUl6iT948P1nXQPaG
         BA0VPTU9b85+lCkpyJmGXjOuanBP/li7uHK9k4KynZnzof6waEt5fsYAR9kwvYeRip/m
         kD5fvlfLSPK7z6LDvczg4szNCMFjKtYNmUMxG13XWCpUIvdcmhV5O9g/OmkEYwH/Yni7
         IayzZCJ8uST563CLp634hsf73wcY1GpKwg6IiaJeimBUfCzW+1PSoo+jGdOOvZNJH+c8
         ybKIZQPjtXHhL+sP/fGjGgbKTkxVq1XsqolmCgVZarCPTbwDFFR5i74PB9bw302yr72h
         4p0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699024179; x=1699628979;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thesD3KLFGeWxkTWmdxIpwm6Tt+iDjq2SiZwxlQ/5EU=;
        b=mlZENsQVT5dxyCWA6LtWMC1RsYYSZtj08Lmz8LsgvmPGqSqVKcjQHTruAyc+9P/2zA
         HkGWHXtHiRdUOLazrVqZiTbKRBluXGTWAPUYXxNanEZe749YdkBxNSiLOnwaWabYAIDk
         jX/Wd+M+RRhoU7HN9b+vsKE7NQCommcYzhLB76t6k2/QeoB+1dRqm0Vwr5PN9252zFDe
         /l2Gb+UUPYOZfS96zIcnIfR0qa3wgwvzqhVh2CWTKYOyxErgsp0xDl3xMuNva+DuLTaR
         2E8QjvFliY2lMFPhgDxAgOFw6c7EABz6Ow3/ggQpjGM2vVL/DZArAXv31zFD0TikpwWP
         NaMA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwRDuf0kDlHnoRyR/BEfUgxuuxQaHcJ7z74U9pqRIu5vWhaiMSi
	i5s1TM0gRGrx7EFBUWzbJAc=
X-Google-Smtp-Source: AGHT+IHIBuxLM6TwvHER51fGshUEp42Vbfidz6DlE9glahOJ6WXBECsRMT/mF9cM4gbSndzebdlDqg==
X-Received: by 2002:a4a:d68b:0:b0:586:8c18:ddd9 with SMTP id i11-20020a4ad68b000000b005868c18ddd9mr20642313oot.9.1699024179583;
        Fri, 03 Nov 2023 08:09:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:4109:0:b0:581:c9a8:c2f2 with SMTP id x9-20020a4a4109000000b00581c9a8c2f2ls2394253ooa.0.-pod-prod-01-us;
 Fri, 03 Nov 2023 08:09:37 -0700 (PDT)
X-Received: by 2002:a05:6808:1529:b0:3ad:f525:52bf with SMTP id u41-20020a056808152900b003adf52552bfmr8946828oiw.1.1699024177644;
        Fri, 03 Nov 2023 08:09:37 -0700 (PDT)
Date: Fri, 3 Nov 2023 08:09:36 -0700 (PDT)
From: Giorgio Farina <giorgio.fari96@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <740977cf-abe3-4b83-8f61-b238578292f8n@googlegroups.com>
In-Reply-To: <c8ea6145-8504-328d-ccfd-e57b052d9ee4@siemens.com>
References: <PA4PR03MB71848B9D591CE51C322E5F9DB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <e4361d78-779d-dcfa-da6e-fcb8ba4476c9@siemens.com>
 <PA4PR03MB718436DFE4DECCCDA1A7DEBAB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <PA4PR03MB7184E05AA2075FBE9EE0F931B6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <91a25596-5d4e-ff7e-d64b-b407648ed2b4@siemens.com>
 <PA4PR03MB71849EE161653DBBA71FA26AB6F30@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <965e7e12-274d-42fd-2303-8a4b82ae8fa8@siemens.com>
 <PA4PR03MB71840A37E0D9AB045A451369B6F30@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <PA4PR03MB71846A56477610902A29AE7DB6F20@PA4PR03MB7184.eurprd03.prod.outlook.com>
 <c8ea6145-8504-328d-ccfd-e57b052d9ee4@siemens.com>
Subject: Re: JAILHOUSE_ENABLE: Input/output error
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_12104_150103002.1699024176696"
X-Original-Sender: giorgio.fari96@gmail.com
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

------=_Part_12104_150103002.1699024176696
Content-Type: multipart/alternative; 
	boundary="----=_Part_12105_183508374.1699024176696"

------=_Part_12105_183508374.1699024176696
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Hello everyone,

Jailhouse (x86) on ESXI Hypervisor (i.e., VMware) cannot work (in nested=20
virtualization), *as the preemption timer is not emulated.*
Instead, I have a question about Jailhouse images.
I got a Jailhouse image for x86. Now, I am trying to run the image with the=
=20
command "./*start_qemu x86*". Linux starts and boots fine.
I checked the hardware features with "*jailhouse hardware check*", and I=20
*passed* also the hardware checks.
However, when I try to run "Jailhouse enable /etc/jailhouse/qemux96.cell",*=
=20
I get the error "input/output error".*
could you give me an explanation?

Best,
Giorgio
Il giorno gioved=C3=AC 3 dicembre 2020 alle 08:39:39 UTC-5 Jan Kiszka ha sc=
ritto:

> On 03.12.20 14:35, Sainz Markel wrote:
> > I've been struggling with this with no luck. Any ideas of why this coul=
d=20
> happen? I've found no info at all about this two checkitems, apparently=
=20
> with the VT-x virtualization enabled should be enough...
>
> This is a VMware issue, nothing you can fix. Their proprietary
> implementation lack feature Jailhouse require. If it were a KVM issue,
> we could patch the code (as I did a lot during Jailhouse development in
> 2013).
>
> IOW: Don't use VMware to demonstrate Jailhouse.
>
> Jan
>
> PS: And please avoid top-posting.
>
> --=20
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/740977cf-abe3-4b83-8f61-b238578292f8n%40googlegroups.com.

------=_Part_12105_183508374.1699024176696
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br />Hello everyone,<br /><br />Jailhouse (x86) on ESXI Hypervisor (i.e., =
VMware) cannot work (in nested virtualization), <b>as the preemption timer =
is not emulated.</b><br />Instead, I have a question about Jailhouse images=
.<br />I got a Jailhouse image for x86. Now, I am trying to run the image w=
ith the command "./<b>start_qemu x86</b>". Linux starts and boots fine.<br =
/>I checked the hardware features with "<b>jailhouse hardware check</b>", a=
nd I <b>passed</b> also the hardware checks.<br />However, when I try to ru=
n "Jailhouse enable /etc/jailhouse/qemux96.cell",<b> I get the error "input=
/output error".</b><br />could you give me an explanation?<br /><br /><div>=
Best,</div><div>Giorgio<br /></div><div class=3D"gmail_quote"><div dir=3D"a=
uto" class=3D"gmail_attr">Il giorno gioved=C3=AC 3 dicembre 2020 alle 08:39=
:39 UTC-5 Jan Kiszka ha scritto:<br/></div><blockquote class=3D"gmail_quote=
" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); =
padding-left: 1ex;">On 03.12.20 14:35, Sainz Markel wrote:
<br>&gt; I&#39;ve been struggling with this with no luck. Any ideas of why =
this could happen? I&#39;ve found no info at all about this two checkitems,=
 apparently with the VT-x virtualization enabled should be enough...
<br>
<br>This is a VMware issue, nothing you can fix. Their proprietary
<br>implementation lack feature Jailhouse require. If it were a KVM issue,
<br>we could patch the code (as I did a lot during Jailhouse development in
<br>2013).
<br>
<br>IOW: Don&#39;t use VMware to demonstrate Jailhouse.
<br>
<br>Jan
<br>
<br>PS: And please avoid top-posting.
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/740977cf-abe3-4b83-8f61-b238578292f8n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/740977cf-abe3-4b83-8f61-b238578292f8n%40googlegroups.co=
m</a>.<br />

------=_Part_12105_183508374.1699024176696--

------=_Part_12104_150103002.1699024176696--
