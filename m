Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBEPG4GYAMGQERVAV5RA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3d.google.com (mail-yb1-xb3d.google.com [IPv6:2607:f8b0:4864:20::b3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8EA8A2250
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Apr 2024 01:32:35 +0200 (CEST)
Received: by mail-yb1-xb3d.google.com with SMTP id 3f1490d57ef6-dcdc3db67f0sf1907309276.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Apr 2024 16:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1712878354; x=1713483154; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7BkHjmL81Cn88xwBoBNs4ZrCwV795C3KOX1Qvm7fpYM=;
        b=HdXX4VBNfotZI1TUtJcuGZR0FKXjuN2AXbaX3KMgU081BH92TKXaAY4btpLabsyzHT
         Ql913YMQr1e5X/srZANzvz4eIOLIxDg+4grVa6gfgFRdqDitc7gKmIO6dARjKmeiq3gD
         beFa8Pi6SE6wriO5fAi0M9RVDmZ59E47C0XzxP2B4SoA4cSVaUpeDd+fAxUXqSAr7NJy
         xKA4VirukPMVTcgbRk7L8ZTERRlnfvuUq47YZDfJyC/hnKsfHpZV0+2ykfS68jqzvCgM
         DheHuZLtZHYC2aCx0haiFdmbXIO4YDA+9XNCMb3dAkusCTeWapyz3L74uBds2iaPEFje
         OJpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712878354; x=1713483154; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BkHjmL81Cn88xwBoBNs4ZrCwV795C3KOX1Qvm7fpYM=;
        b=HFv6QYojVYBeo5qhRexnuKmWn/tvX58rCYv1ML4Fc+x9eXbf/XlAFzBMuu2vXkTFvi
         txCXyT9vqnwEEqF189clAN+7a1JpIklsHq9cwhbAcdyRdLI9p//EWJ2l7xzQhoIsuUjC
         iQX5FnOtqFNFldez69vkOvdS/ZpV2fWvVUh2AF36ngpH2r+9vJdU39uysPygUhtk59Jx
         2P/iEdjTvHv63VaGCehnDOoxfxNt0gFp4+AD1WtbnrTsBRD9kzSiyjDA2mqLoeZR4NqP
         bRVC254GFbue87apmsLHdFrP3waySmgUuWfxQQQQ4o0+APGUk+DlH6c41YJoSxdtyWia
         ZSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712878354; x=1713483154;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7BkHjmL81Cn88xwBoBNs4ZrCwV795C3KOX1Qvm7fpYM=;
        b=hAxPDdTdEYVJqjvD7f5S233a9uB7d54wPK4XSvF3rqU5f6ybS5URRkfqx/uq/X6mJh
         pOoEGdmD24mCAxjyFD7qrhNzd7BJcWSfCxAu54hWt7FRqkpflSfZlFVtwXjV6FAlmT0Y
         fOiajE7LzcPbzYKVsJiod49axLFFlmIMVfn73f10L5+6NxSmVAsuV6wj2MegAKvjlnKR
         dfmJiP5ScvR10vNAKYxD7bx7whWi8x1k6JzFl6WLSSikorW/fBvPSgtu4+9+g4vC6M78
         060vtSD+MlgoWMC63LbE/LKyuW9Slvj/DsMLmEnNGIiK0IFGUG/evbF5V6Hh/5Djo4x4
         TQLg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCUO0GmoO+NWL48lk0h9oRIBPWLjkKrOPUz9jaT2iUbCPbCOSTUtWkWRVYyHFjgkEssrnl3GZIrlVPagvGjHxxs/jU0SeHzAHKakmu0=
X-Gm-Message-State: AOJu0YyjczJBmCsNmg1jxvY5TXAMOllXU2w2TUOf6xaKaAv3+1QLSqlz
	4M5HdrTIdSgeypQwuYn7uOgBXRRGoitndpjvQLpnDor0tVMHNpxm
X-Google-Smtp-Source: AGHT+IFp5FGtYnEzqN5hbFm4ZOlgednYESaGNrNrsPd0DWbkQGMWhqD8L3weiWmJfDW0+iVckmgHVw==
X-Received: by 2002:a25:bdc9:0:b0:de0:ff05:d512 with SMTP id g9-20020a25bdc9000000b00de0ff05d512mr873359ybk.30.1712878354563;
        Thu, 11 Apr 2024 16:32:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:808f:0:b0:dcc:4b24:c0dd with SMTP id n15-20020a25808f000000b00dcc4b24c0ddls513942ybk.0.-pod-prod-08-us;
 Thu, 11 Apr 2024 16:32:33 -0700 (PDT)
X-Received: by 2002:a25:addf:0:b0:dd9:1db5:8348 with SMTP id d31-20020a25addf000000b00dd91db58348mr285182ybe.8.1712878352734;
        Thu, 11 Apr 2024 16:32:32 -0700 (PDT)
Date: Thu, 11 Apr 2024 16:32:32 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c3a09c46-8046-4b99-8076-14de91712306n@googlegroups.com>
In-Reply-To: <CAC5TEnHad5oZoP3H2TxVKPmeJ1pW=BAMQJFRGwZTrST2oQh7KQ@mail.gmail.com>
References: <CAC5TEnFx_TOr7ktks4qNSqL_bhv2P7r+fMOpbuz9B217jZNn5g@mail.gmail.com>
 <09045e94-f35b-53a6-93e4-8a1edd8e099e@siemens.com>
 <CAC5TEnHad5oZoP3H2TxVKPmeJ1pW=BAMQJFRGwZTrST2oQh7KQ@mail.gmail.com>
Subject: Re: ARM: ivshmem virtual PCI device doesn't show up
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_128760_967179928.1712878352147"
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

------=_Part_128760_967179928.1712878352147
Content-Type: multipart/alternative; 
	boundary="----=_Part_128761_586407530.1712878352147"

------=_Part_128761_586407530.1712878352147
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

On Sunday, May 14, 2023 at 1:17:53=E2=80=AFAM UTC+1 Kurt Zou wrote:

> Hi Jan
> Yes the kernel support CONFIG_PCI_HOST_GENERIC=3Dy option
>
> I added some other options in the kernel config and now it works fine. To=
=20
> be more specific:  CONFIG_USELIB=3Dy  and CONFIG_ARM_PSCI=3Dy
> not sure how they are related but anyway the pci devices show up fine.
>
> Thanks for the help
>
>
>
> On Wed, May 10, 2023 at 7:32=E2=80=AFAM Jan Kiszka <jan.k...@siemens.com>=
 wrote:
>
>> On 08.05.23 03:53, Kurt Zou wrote:
>> > Hi All,
>> > I'm trying to bring up a ivshmem net device on a cortex-A7 platform.
>> >=20
>> > After enabling jailhouse, virtual PCI devices seem to be added
>> > successfully, but with "lspci" or "/sys/bus/pci/devices", I didn't see
>> > anything there. Am I missing something? I assume that pci devices (eve=
n
>> > virtual) should be able to show up in system.
>> >=20
>> > Here's the debug information:
>> >=20
>> > root@demo:~# jailhouse enable /etc/jailhouse/demo.cell
>> >=20
>> > Initializing Jailhouse hypervisor v0.12 on CPU 0
>> > Code location: 0xf0000040
>> > Page pool usage after early setup: mem 37/1770, remap 0/131072
>> > Initializing processors:
>> >  CPU 0... OK
>> >  CPU 1... OK
>> >  CPU 2... OK
>> >  CPU 3... OK
>> > Initializing unit: irqchip
>> > Initializing unit: PCI
>> > Adding virtual PCI device 00:00.0 to cell "demo"
>> > Adding virtual PCI device 00:01.0 to cell "demo"
>> > Page pool usage after late setup: mem 57/1770, remap 5/131072
>> > Activating hypervisor
>> > root@demo:~# lspci
>> > root@demo:~# ifconfig
>> > lo: flags=3D73<UP,LOOPBACK,RUNNING>  mtu 65536
>> >         inet 127.0.0.1  netmask 255.0.0.0
>> >         loop  txqueuelen 1000  (Local Loopback)
>> >         RX packets 0  bytes 0 (0.0 B)
>> >         RX errors 0  dropped 0  overruns 0  frame 0
>> >         TX packets 0  bytes 0 (0.0 B)
>> >         TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
>> >=20
>>
>> Is the virtual PCI host controller visible in the root cell's device
>> tree (/sys/firmware/devicetree/...)? Does the root Linux kernel support
>> it (CONFIG_PCI_HOST_GENERIC=3Dy, IIRC)? Do you have any error reporting =
on
>> the kernel log of the root cell?
>>
>> Jan
>>
>> --=20
>> Siemens AG, Technology
>> Competence Center Embedded Linux
>>
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c3a09c46-8046-4b99-8076-14de91712306n%40googlegroups.com.

------=_Part_128761_586407530.1712878352147
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
 Sunday, May 14, 2023 at 1:17:53=E2=80=AFAM UTC+1 Kurt Zou wrote:<br/></div=
><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-lef=
t: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div dir=3D"ltr">Hi Ja=
n<div>Yes the kernel support CONFIG_PCI_HOST_GENERIC=3Dy option</div><div><=
br></div><div>I added some other options in the kernel config and now it wo=
rks fine. To be more specific:=C2=A0 CONFIG_USELIB=3Dy=C2=A0 and CONFIG_ARM=
_PSCI=3Dy</div><div>not sure how they are related but anyway the pci device=
s show up fine.</div><div><br></div><div>Thanks for the help</div><div><br>=
</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, May 10, 2023 at 7:32=E2=80=AFAM Jan Kiszka &lt=
;<a href data-email-masked rel=3D"nofollow">jan.k...@siemens.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 08.05.23=
 03:53, Kurt Zou wrote:<br>
&gt; Hi All,<br>
&gt; I&#39;m trying to bring up a ivshmem net device on a cortex-A7 platfor=
m.<br>
&gt; <br>
&gt; After enabling jailhouse, virtual PCI devices seem to be added<br>
&gt; successfully, but with &quot;lspci&quot; or &quot;/sys/bus/pci/devices=
&quot;, I didn&#39;t see<br>
&gt; anything there. Am I missing something? I assume that pci devices (eve=
n<br>
&gt; virtual) should be able to show up in system.<br>
&gt; <br>
&gt; Here&#39;s the debug information:<br>
&gt; <br>
&gt; root@demo:~# jailhouse enable /etc/jailhouse/demo.cell<br>
&gt; <br>
&gt; Initializing Jailhouse hypervisor v0.12 on CPU 0<br>
&gt; Code location: 0xf0000040<br>
&gt; Page pool usage after early setup: mem 37/1770, remap 0/131072<br>
&gt; Initializing processors:<br>
&gt; =C2=A0CPU 0... OK<br>
&gt; =C2=A0CPU 1... OK<br>
&gt; =C2=A0CPU 2... OK<br>
&gt; =C2=A0CPU 3... OK<br>
&gt; Initializing unit: irqchip<br>
&gt; Initializing unit: PCI<br>
&gt; Adding virtual PCI device 00:00.0 to cell &quot;demo&quot;<br>
&gt; Adding virtual PCI device 00:01.0 to cell &quot;demo&quot;<br>
&gt; Page pool usage after late setup: mem 57/1770, remap 5/131072<br>
&gt; Activating hypervisor<br>
&gt; root@demo:~# lspci<br>
&gt; root@demo:~# ifconfig<br>
&gt; lo: flags=3D73&lt;UP,LOOPBACK,RUNNING&gt; =C2=A0mtu 65536<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet 127.0.0.1 =C2=A0netmask 255.0.0.0<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 loop =C2=A0txqueuelen 1000 =C2=A0(Local Lo=
opback)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets 0 =C2=A0bytes 0 (0.0 B)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX errors 0 =C2=A0dropped 0 =C2=A0overruns=
 0 =C2=A0frame 0<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets 0 =C2=A0bytes 0 (0.0 B)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX errors 0 =C2=A0dropped 0 overruns 0 =C2=
=A0carrier 0 =C2=A0collisions 0<br>
&gt; <br>
<br>
Is the virtual PCI host controller visible in the root cell&#39;s device<br=
>
tree (/sys/firmware/devicetree/...)? Does the root Linux kernel support<br>
it (CONFIG_PCI_HOST_GENERIC=3Dy, IIRC)? Do you have any error reporting on<=
br>
the kernel log of the root cell?<br>
<br>
Jan<br>
<br>
-- <br>
Siemens AG, Technology<br>
Competence Center Embedded Linux<br>
<br>
</blockquote></div>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c3a09c46-8046-4b99-8076-14de91712306n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/c3a09c46-8046-4b99-8076-14de91712306n%40googlegroups.co=
m</a>.<br />

------=_Part_128761_586407530.1712878352147--

------=_Part_128760_967179928.1712878352147--
