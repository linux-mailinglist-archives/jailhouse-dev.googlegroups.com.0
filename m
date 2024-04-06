Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBPVKY6YAMGQEFJFDZPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B46789AD99
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Apr 2024 01:05:36 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id 3f1490d57ef6-ddaf2f115f2sf4483836276.3
        for <lists+jailhouse-dev@lfdr.de>; Sat, 06 Apr 2024 16:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712444735; x=1713049535; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FgbtCLopOvOZa/VCDsdHQVAQCeNxlgEDKZsJ8JFtgKQ=;
        b=pVIjZsDRi09WM9Z+s0RvvVuJTcGbFK0v0ROmjmDOSVcQlLmG9BZx9Xi41gw8I98ICn
         wPKeKTBVivLC5Jm5QM8NQYFUZH6bQ1oD9lsKO4ejfzywDNvGl1mS6qcskk/RSaIo0WVZ
         9QBkCcgGLJ/xAll5bMatTiYKSsqeERNsLiNaRA1H/t19kn37iFdYwCv0f2bLBL2Ekvyc
         Y7gXNHiCa1MX6nPFfVcryT4uVshyQ9njkdZglR3NbBVAxBplijJOBm8gx8CLqcd5j5vj
         Xxfb4za9kVYPErLIFgpRM4xjmN9Ft+2sh0wy4jc8FDNyCjnFzYIYPV5fFS5raRxyIDOb
         3kjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712444735; x=1713049535; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgbtCLopOvOZa/VCDsdHQVAQCeNxlgEDKZsJ8JFtgKQ=;
        b=cgwxWor/woUbLTHH4riyie8qBHMjZQ7afHMjVP64BX+sQW3LNyYAecsJmKFmjgqwSu
         xQvDkI+OuV7FnWeHMZPsFIBg2JlNsDjn6mgOYSrFzePQH1cMmQ45e2axMrI63pLq/2jG
         GvcPccNtD6xK8CSGHvb6FP9lJ/HreNRhT3ulAWm9Asp0E5lDxgw47UyARd0uO4YTCPlM
         vRQIya2G1+TPsdW/WYRtZGKekJKYn1sDcJchguIczhLtxblVswi5NlNiO5iuLQUpDBpT
         ztzm1qztiOP4z+3TAsw1fMMFUEEUYjZ4RfoR5Z4SXXB47q31LDulKg8KO3gt64kvGnqB
         kVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712444735; x=1713049535;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FgbtCLopOvOZa/VCDsdHQVAQCeNxlgEDKZsJ8JFtgKQ=;
        b=oN4WQIT86c9pvAtN51Lm3I+d92N3aet/dBrX//GOjh2aJYL9OWMalJ1rj8MzXwTCFo
         v/f1xWIjAbxnrlYlXUADubAONGqW9oOisvjbgNFCV9VCqhc9HwDmQR5fWDJE4Zk49EIZ
         oZxEuRCbhDNSwMdVYmxxmu+uxy/wphFXcp4al10XnC1VjBfPnAiJGmX1VZugtVmGyDP4
         dz3o4XQfPDd9QQTSH6TjQVNsdujpLpxC15mUY+Z1057Ir4OpxT6HtcEXRLqfHgY/jCqC
         polx1bvOJgw3pUr8LQC2r9pkkv1uqH0sZN7j3tA4V5wOA6apPdNTwjXbqLvKTMlwI91e
         1EkA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXWC9QXTmV6ICnY2jWvQptnEBana6FC/VlX1gM46dPgJEIWVyxFrBpFrQPljuen2C4/KwMEIiyr2wbsOq09mpUbLECcxRy7IUrl1mw=
X-Gm-Message-State: AOJu0YzfVNEBE5/8lG6ex09A9X5wcmQSQmDqozbpsxn0HqFjC2IrtzgO
	uEQQrceIZ4RkvR42yl7a4uH6z33/P7/vLoXMkHqCsVBJen7CkO5e
X-Google-Smtp-Source: AGHT+IHvZf6bncSNjgE2xFWn+dtMYWx6P8QcS5eMHOSJ0p2rlxbd9BAzAZ9lqAEehf3TKPnCXlPLwA==
X-Received: by 2002:a25:14c6:0:b0:dc7:48d7:9ed8 with SMTP id 189-20020a2514c6000000b00dc748d79ed8mr3537708ybu.20.1712444735183;
        Sat, 06 Apr 2024 16:05:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:7e86:0:b0:dc7:4363:dc02 with SMTP id z128-20020a257e86000000b00dc74363dc02ls269160ybc.1.-pod-prod-06-us;
 Sat, 06 Apr 2024 16:05:33 -0700 (PDT)
X-Received: by 2002:a0d:ea82:0:b0:611:5ed0:228e with SMTP id t124-20020a0dea82000000b006115ed0228emr1257242ywe.4.1712444733270;
        Sat, 06 Apr 2024 16:05:33 -0700 (PDT)
Date: Sat, 6 Apr 2024 16:05:32 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0e84aac3-153c-44ba-8d8c-4e55c42b1284n@googlegroups.com>
In-Reply-To: <0034e1a2-a439-45de-8c25-e090cdf199b5n@googlegroups.com>
References: <0034e1a2-a439-45de-8c25-e090cdf199b5n@googlegroups.com>
Subject: Re: How to allocate QEMU simulated PCI devices to non-root Linux.
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_230912_727145526.1712444732040"
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

------=_Part_230912_727145526.1712444732040
Content-Type: multipart/alternative; 
	boundary="----=_Part_230913_988717112.1712444732040"

------=_Part_230913_988717112.1712444732040
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

On Tuesday, April 2, 2024 at 8:00:11=E2=80=AFPM UTC+1 xy dallas wrote:

> Hello everyone,
>
> I'm trying to provide QEMU simulated PCI devices to a non-root Linux=20
> environment. However, I haven't found any JAILHOUSE_PCI_TYPE_DEVICE type =
of=20
> PCI devices to reference in the arm64 config. Instead, I only found virtu=
al=20
> devices of type JAILHOUSE_PCI_TYPE_IVSHMEM. These devices are mounted on =
a=20
> simple bus created by Jailhouse, unlike the devices I added using "-devic=
e=20
> xyfdev-pci,id=3Dt0,addr=3D0x18" on QEMU, which are in two separate domain=
s.=20
>
> I attempted to add the content of JAILHOUSE_PCI_TYPE_DEVICE to the cell=
=20
> config:
>
> {
>     .type =3D JAILHOUSE_PCI_TYPE_DEVICE,
>     .domain =3D 0,
>     .bdf =3D 0x18,
>     .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>     .shmem_regions_start =3D 14,
>     .shmem_dev_id =3D 1,
>     .shmem_peers =3D 2,
>     .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,
> }
>
> But I'm unsure how to modify the device tree file to expose this device t=
o=20
> non-root. If I don't modify the device tree, non-root Linux will report t=
he=20
> following error during startup:
>
> FATAL: Unhandled HYP exception: synchronous abort from EL2
> pc: 0000ffffc020b27c lr: 0000ffffc020bc84 spsr: 800003c9 EL2
> sp: 0000ff0000010e30 esr: 25 1 1800005
> x0: 0000000000000000 x1: 0000ff0000010eb8 x2: 0000000000018000
> x3: 0000ffffc020b260 x4: 0000ffffc020b27c x5: 0000000000000003
> x6: 0000000000000018 x7: 0000000000000000 x8: 0000ffffc02b32b0
> x9: 0000ff0000010e6c x10: 0000ffffc02b02fc x11: 0000000000000000
> x12: 0000000000000000 x13: 0000000000000028 x14: 0000ff0000010eb8
> x15: ffff00003482691c x16: 0000ffffc020bbd8 x17: 00000000af5879f2
> x18: ffffffffffffffff x19: 0000ff0000010eb8 x20: 0000000000000018
> x21: 0000000000000000 x22: 0000000000000002 x23: 0000000000000004
> x24: 0000000000000000 x25: 0000000000000018 x26: ffff8000112c0530
> x27: 0000000000000000 x28: 0000000000000000 x29: 0000ff0000010e30
>
> I'd like to know how I can allocate QEMU simulated PCI devices to non-roo=
t=20
> Linux. I'm working based on qemu-arm64.c and qemu-arm64-linux-demo.c.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/0e84aac3-153c-44ba-8d8c-4e55c42b1284n%40googlegroups.com.

------=_Part_230913_988717112.1712444732040
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
 Tuesday, April 2, 2024 at 8:00:11=E2=80=AFPM UTC+1 xy dallas wrote:<br/></=
div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-=
left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Hello everyone,<br>=
<br>I&#39;m trying to provide QEMU simulated PCI devices to a non-root Linu=
x environment. However, I haven&#39;t found any JAILHOUSE_PCI_TYPE_DEVICE t=
ype of PCI devices to reference in the arm64 config. Instead, I only found =
virtual devices of type JAILHOUSE_PCI_TYPE_IVSHMEM. These devices are mount=
ed on a simple bus created by Jailhouse, unlike the devices I added using &=
quot;-device xyfdev-pci,id=3Dt0,addr=3D0x18&quot; on QEMU, which are in two=
 separate domains. <br><br>I attempted to add the content of JAILHOUSE_PCI_=
TYPE_DEVICE to the cell config:<br><br>{<br>=C2=A0 =C2=A0 .type =3D JAILHOU=
SE_PCI_TYPE_DEVICE,<br>=C2=A0 =C2=A0 .domain =3D 0,<br>=C2=A0 =C2=A0 .bdf =
=3D 0x18,<br>=C2=A0 =C2=A0 .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_INTX,<b=
r>=C2=A0 =C2=A0 .shmem_regions_start =3D 14,<br>=C2=A0 =C2=A0 .shmem_dev_id=
 =3D 1,<br>=C2=A0 =C2=A0 .shmem_peers =3D 2,<br>=C2=A0 =C2=A0 .shmem_protoc=
ol =3D JAILHOUSE_SHMEM_PROTO_UNDEFINED,<br>}<br><br>But I&#39;m unsure how =
to modify the device tree file to expose this device to non-root. If I don&=
#39;t modify the device tree, non-root Linux will report the following erro=
r during startup:<br><br><div style=3D"color:rgb(204,204,204);background-co=
lor:rgb(31,31,31);font-family:Menlo,Monaco,&quot;Courier New&quot;,monospac=
e;font-size:12px;line-height:18px;white-space:pre"><div><span style=3D"colo=
r:rgb(220,220,170)">FATAL:</span> Unhandled HYP <span style=3D"color:rgb(22=
0,220,170)">exception:</span> synchronous abort from EL2</div><div> <span s=
tyle=3D"color:rgb(220,220,170)">pc:</span> 0000ffffc020b27c   <span style=
=3D"color:rgb(220,220,170)">lr:</span> 0000ffffc020bc84 <span style=3D"colo=
r:rgb(220,220,170)">spsr:</span> 800003c9     EL2</div><div> <span style=3D=
"color:rgb(86,156,214)">sp</span>: 0000ff0000010e30  <span style=3D"color:r=
gb(220,220,170)">esr:</span> <span style=3D"color:rgb(181,206,168)">25</spa=
n> <span style=3D"color:rgb(181,206,168)">1</span> <span style=3D"color:rgb=
(181,206,168)">1800005</span></div><div> <span style=3D"color:rgb(220,220,1=
70)">x0:</span> <span style=3D"color:rgb(181,206,168)">0000000000000000</sp=
an>   <span style=3D"color:rgb(220,220,170)">x1:</span> 0000ff0000010eb8   =
<span style=3D"color:rgb(220,220,170)">x2:</span> <span style=3D"color:rgb(=
181,206,168)">0000000000018000</span></div><div> <span style=3D"color:rgb(2=
20,220,170)">x3:</span> 0000ffffc020b260   <span style=3D"color:rgb(220,220=
,170)">x4:</span> 0000ffffc020b27c   <span style=3D"color:rgb(220,220,170)"=
>x5:</span> <span style=3D"color:rgb(181,206,168)">0000000000000003</span><=
/div><div> <span style=3D"color:rgb(220,220,170)">x6:</span> <span style=3D=
"color:rgb(181,206,168)">0000000000000018</span>   <span style=3D"color:rgb=
(220,220,170)">x7:</span> <span style=3D"color:rgb(181,206,168)">0000000000=
000000</span>   <span style=3D"color:rgb(220,220,170)">x8:</span> 0000ffffc=
02b32b0</div><div> <span style=3D"color:rgb(220,220,170)">x9:</span> 0000ff=
0000010e6c  <span style=3D"color:rgb(220,220,170)">x10:</span> 0000ffffc02b=
02fc  <span style=3D"color:rgb(220,220,170)">x11:</span> <span style=3D"col=
or:rgb(181,206,168)">0000000000000000</span></div><div><span style=3D"color=
:rgb(220,220,170)">x12:</span> <span style=3D"color:rgb(181,206,168)">00000=
00000000000</span>  <span style=3D"color:rgb(220,220,170)">x13:</span> <spa=
n style=3D"color:rgb(181,206,168)">0000000000000028</span>  <span style=3D"=
color:rgb(220,220,170)">x14:</span> 0000ff0000010eb8</div><div><span style=
=3D"color:rgb(220,220,170)">x15:</span> ffff00003482691c  <span style=3D"co=
lor:rgb(220,220,170)">x16:</span> 0000ffffc020bbd8  <span style=3D"color:rg=
b(220,220,170)">x17:</span> 00000000af5879f2</div><div><span style=3D"color=
:rgb(220,220,170)">x18:</span> ffffffffffffffff  <span style=3D"color:rgb(2=
20,220,170)">x19:</span> 0000ff0000010eb8  <span style=3D"color:rgb(220,220=
,170)">x20:</span> <span style=3D"color:rgb(181,206,168)">0000000000000018<=
/span></div><div><span style=3D"color:rgb(220,220,170)">x21:</span> <span s=
tyle=3D"color:rgb(181,206,168)">0000000000000000</span>  <span style=3D"col=
or:rgb(220,220,170)">x22:</span> <span style=3D"color:rgb(181,206,168)">000=
0000000000002</span>  <span style=3D"color:rgb(220,220,170)">x23:</span> <s=
pan style=3D"color:rgb(181,206,168)">0000000000000004</span></div><div><spa=
n style=3D"color:rgb(220,220,170)">x24:</span> <span style=3D"color:rgb(181=
,206,168)">0000000000000000</span>  <span style=3D"color:rgb(220,220,170)">=
x25:</span> <span style=3D"color:rgb(181,206,168)">0000000000000018</span> =
 <span style=3D"color:rgb(220,220,170)">x26:</span> ffff8000112c0530</div><=
div><span style=3D"color:rgb(220,220,170)">x27:</span> <span style=3D"color=
:rgb(181,206,168)">0000000000000000</span>  <span style=3D"color:rgb(220,22=
0,170)">x28:</span> <span style=3D"color:rgb(181,206,168)">0000000000000000=
</span>  <span style=3D"color:rgb(220,220,170)">x29:</span> 0000ff0000010e3=
0</div></div><br>I&#39;d like to know how I can allocate QEMU simulated PCI=
 devices to non-root Linux. I&#39;m working based on qemu-arm64.c and qemu-=
arm64-linux-demo.c.<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0e84aac3-153c-44ba-8d8c-4e55c42b1284n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0e84aac3-153c-44ba-8d8c-4e55c42b1284n%40googlegroups.co=
m</a>.<br />

------=_Part_230913_988717112.1712444732040--

------=_Part_230912_727145526.1712444732040--
