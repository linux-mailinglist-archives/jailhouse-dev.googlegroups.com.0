Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBB5OH4GYAMGQELJZ5KBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1139.google.com (mail-yw1-x1139.google.com [IPv6:2607:f8b0:4864:20::1139])
	by mail.lfdr.de (Postfix) with ESMTPS id 473138A21B8
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 00:28:07 +0200 (CEST)
Received: by mail-yw1-x1139.google.com with SMTP id 00721157ae682-617f0cd67c4sf573337b3.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 15:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712874486; x=1713479286; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gNR0Etv24XtIrjtS7h//3KZ1JRwBiOzTd7Q2pfIo2S4=;
        b=tP8J4EZLe1aGUA1M4hq0u+PHrSs9avLk4Nu5DgV+BMu8E0gqD0TFp08GNCZewukRd6
         bjvaMbsFy+D6IZTAcyQYgNTHKQLl5XWI8MO1+bSdLT3rBAV+M0StJL12DsLaGtyBRrMr
         9+ClSuHTJ9eJIcdaBjIGSWfU4z9wz8eHfOtoUkbCf7oDUsd7anafPc3EdeGlRS41KXbt
         VhTxd45wtHfzPJOCv/GaR8/RCOv6pgxmSxzI+x2aZ25ro6nIjZQSjqkMoCgci14M5wAc
         NveFV9t1SgYJRMEfjrvcc/ACm6+pPQkDoXzHP7yGgVjBsWHSS2AdoN/qnum6xO8V1o+B
         Podw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712874486; x=1713479286; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNR0Etv24XtIrjtS7h//3KZ1JRwBiOzTd7Q2pfIo2S4=;
        b=WsrdCkfvK29IZoUao7BhWqMSVer1r7vibi4WI2MDD7VEodVx4Er/iWl9BYVprhtFsS
         7ouGfQQgIQPb2ocgBfKGWE+/0GGdyc3SFMxosUIcnbGXc21BFQYpMYA1CGDSDoBIv6Tb
         fXsUiX31prToQIdmfAaSTykl1a8kx2cOXJXiey3PmHGh25mMyvNSmQYAUcb/ujD82Wds
         BQjpzFwQm/vgLrHpioskGsezqtFOGv7VwjD+dEcyArvvx/ZsUtZpHwTq+MS5/DKywzfY
         N5tm1y0IN9y28J4cL16ff7eDvvyaHRverStFnJj1Nu+4t7CIkNndegNlow72z5xywMqJ
         h0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712874486; x=1713479286;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gNR0Etv24XtIrjtS7h//3KZ1JRwBiOzTd7Q2pfIo2S4=;
        b=PucqHiIT7p20W7jWBQf6LDRZmm6qBl5K/G4ZkY/qdnKG63bpLpIkwD0sPuFvxZ7t29
         0V3tA3WwSYtYlF6cK5G74omjMwekItqtcK3U16sKBsigKK1hzYiHBEIt5AqMuly9J5tZ
         12k564dnpNOE01gTjXypYeE3lZUeSXMhzzpvvkdPLI2b84LqFnyAv0p6wGgefi4sgjdY
         x/sNSkgql/dicp8HVqTYrWdYhoo4xcAK2wbWMSonNMMM8ezjchVHICKdA+6oHWCgo84N
         RGFZk/byQ9w1d+PNHjAeQO1vRyiUaL6KsFeTcI1KS+qj8+rmiHMrD6U8gzHFT55u7TWM
         mNMw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVKwhQSEZwIqGKhdhIbNQf+AA39BtZQ5f+x7igBYJiECo4lM2ITzcHZx+J0U/BPTDbI/22muLxDvGuNzvzS4YU6+wbGRD+4p8joq0w=
X-Gm-Message-State: AOJu0YwDH1iRiNq98m1HCpQ3U8+AE4t8biuNa8+ClsSslQr0YrB5TsMh
	/bo0z9O+YiquMkVo60+OzjMhFCgildyv8qVCp57IDpLGVKM2KZ3i
X-Google-Smtp-Source: AGHT+IF2nh4LIo+9qHINkOW+TnqllCsLj6BL8mygY5TeIIyzycQB8eCA3g9vivkEMdQvaoAf+xcoWg==
X-Received: by 2002:a25:f442:0:b0:dd1:38a0:e4e9 with SMTP id p2-20020a25f442000000b00dd138a0e4e9mr620234ybe.5.1712874485947;
        Thu, 11 Apr 2024 15:28:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:dfc2:0:b0:dcd:202d:6be7 with SMTP id w185-20020a25dfc2000000b00dcd202d6be7ls662415ybg.0.-pod-prod-05-us;
 Thu, 11 Apr 2024 15:28:04 -0700 (PDT)
X-Received: by 2002:a0d:d68b:0:b0:615:165b:8dde with SMTP id y133-20020a0dd68b000000b00615165b8ddemr203842ywd.10.1712874484502;
        Thu, 11 Apr 2024 15:28:04 -0700 (PDT)
Date: Thu, 11 Apr 2024 15:28:03 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <fe16a37b-039f-4e8c-a1a3-f2aab0fcf659n@googlegroups.com>
In-Reply-To: <1994ea5a-44dd-453b-8571-0c66e5a5e734n@googlegroups.com>
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
 <740977cf-abe3-4b83-8f61-b238578292f8n@googlegroups.com>
 <1994ea5a-44dd-453b-8571-0c66e5a5e734n@googlegroups.com>
Subject: Re: JAILHOUSE_ENABLE: Input/output error
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_105682_1943407688.1712874483817"
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

------=_Part_105682_1943407688.1712874483817
Content-Type: multipart/alternative; 
	boundary="----=_Part_105683_1078583734.1712874483817"

------=_Part_105683_1078583734.1712874483817
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

On Friday, November 3, 2023 at 5:27:53=E2=80=AFPM UTC+1 Giorgio Farina wrot=
e:

> I add more info about my error.
> Linux is the host OS, which runs a VM (i.e., QEMU/KVM VM) with a jailhous=
e=20
> image.
> Below, I represented the sequence of operations and outputs.
> *Linux: *./start-qemu.sh x86
> *QEMU/KVM VM: *Jailhouse enable /etc/jailhouse/qemux96.cell
> *QEMU/KVM VM: *JAILHOUSE ENABLE: input/output error
> *Linux:* Initializing Jailhouse hypervisor v0.12 (342-gd6e64f90) on CPU 0
> Code location: 0xfffffffff0000050
> Using x2APIC.
>
> *Note that Jailhouse hardware check returns PASSED*
>
> Best,
> Giorgio
>
>
>
> Il giorno venerd=C3=AC 3 novembre 2023 alle 11:09:36 UTC-4 Giorgio Farina=
 ha=20
> scritto:
>
>>
>> Hello everyone,
>>
>> Jailhouse (x86) on ESXI Hypervisor (i.e., VMware) cannot work (in nested=
=20
>> virtualization), *as the preemption timer is not emulated.*
>> Instead, I have a question about Jailhouse images.
>> I got a Jailhouse image for x86. Now, I am trying to run the image with=
=20
>> the command "./*start_qemu x86*". Linux starts and boots fine.
>> I checked the hardware features with "*jailhouse hardware check*", and I=
=20
>> *passed* also the hardware checks.
>> However, when I try to run "Jailhouse enable /etc/jailhouse/qemux96.cell=
",*=20
>> I get the error "input/output error".*
>> could you give me an explanation?
>>
>> Best,
>> Giorgio
>> Il giorno gioved=C3=AC 3 dicembre 2020 alle 08:39:39 UTC-5 Jan Kiszka ha=
=20
>> scritto:
>>
>>> On 03.12.20 14:35, Sainz Markel wrote:=20
>>> > I've been struggling with this with no luck. Any ideas of why this=20
>>> could happen? I've found no info at all about this two checkitems,=20
>>> apparently with the VT-x virtualization enabled should be enough...=20
>>>
>>> This is a VMware issue, nothing you can fix. Their proprietary=20
>>> implementation lack feature Jailhouse require. If it were a KVM issue,=
=20
>>> we could patch the code (as I did a lot during Jailhouse development in=
=20
>>> 2013).=20
>>>
>>> IOW: Don't use VMware to demonstrate Jailhouse.=20
>>>
>>> Jan=20
>>>
>>> PS: And please avoid top-posting.=20
>>>
>>> --=20
>>> Siemens AG, T RDA IOT=20
>>> Corporate Competence Center Embedded Linux=20
>>>
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fe16a37b-039f-4e8c-a1a3-f2aab0fcf659n%40googlegroups.com.

------=_Part_105683_1078583734.1712874483817
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
 Friday, November 3, 2023 at 5:27:53=E2=80=AFPM UTC+1 Giorgio Farina wrote:=
<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; =
border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div>I add m=
ore info about my error.</div><div>Linux is the host OS, which runs a VM (i=
.e., QEMU/KVM VM) with a jailhouse image.<br></div><div>Below, I represente=
d the sequence of operations and outputs.<br></div><div><b>Linux: </b>./sta=
rt-qemu.sh x86<br></div><b>QEMU/KVM VM: </b>Jailhouse enable /etc/jailhouse=
/qemux96.cell<br><div><b>QEMU/KVM VM: </b>JAILHOUSE ENABLE: input/output er=
ror<b><br></b></div><div><b>Linux:</b> Initializing Jailhouse hypervisor v0=
.12 (342-gd6e64f90) on CPU 0<br>Code location: 0xfffffffff0000050<br>Using =
x2APIC.<br></div><div><br></div><div><b>Note that Jailhouse hardware check =
returns PASSED</b><br></div><div><br>Best,<br>Giorgio</div><div><br></div><=
div><br></div><div><br></div><div class=3D"gmail_quote"><div dir=3D"auto" c=
lass=3D"gmail_attr">Il giorno venerd=C3=AC 3 novembre 2023 alle 11:09:36 UT=
C-4 Giorgio Farina ha scritto:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-l=
eft:1ex"><br>Hello everyone,<br><br>Jailhouse (x86) on ESXI Hypervisor (i.e=
., VMware) cannot work (in nested virtualization), <b>as the preemption tim=
er is not emulated.</b><br>Instead, I have a question about Jailhouse image=
s.<br>I got a Jailhouse image for x86. Now, I am trying to run the image wi=
th the command &quot;./<b>start_qemu x86</b>&quot;. Linux starts and boots =
fine.<br>I checked the hardware features with &quot;<b>jailhouse hardware c=
heck</b>&quot;, and I <b>passed</b> also the hardware checks.<br>However, w=
hen I try to run &quot;Jailhouse enable /etc/jailhouse/qemux96.cell&quot;,<=
b> I get the error &quot;input/output error&quot;.</b><br>could you give me=
 an explanation?<br><br><div>Best,</div><div>Giorgio<br></div><div class=3D=
"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">Il giorno gioved=C3=AC=
 3 dicembre 2020 alle 08:39:39 UTC-5 Jan Kiszka ha scritto:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On 03.12.20 14:35, Sainz Markel wrote=
:
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
<br></blockquote></div></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/fe16a37b-039f-4e8c-a1a3-f2aab0fcf659n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/fe16a37b-039f-4e8c-a1a3-f2aab0fcf659n%40googlegroups.co=
m</a>.<br />

------=_Part_105683_1078583734.1712874483817--

------=_Part_105682_1943407688.1712874483817--
