Return-Path: <jailhouse-dev+bncBC64DZNZYEERBBMPWWFQMGQEEUOPAAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83c.google.com (mail-qt1-x83c.google.com [IPv6:2607:f8b0:4864:20::83c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4204943141B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 12:08:06 +0200 (CEST)
Received: by mail-qt1-x83c.google.com with SMTP id c19-20020ac81e93000000b002a71180fd3dsf10340091qtm.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 03:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=S72LY0mQ7CTdamtDwNCbwm80DtZvz+mcH0geQ3Pff5A=;
        b=qv2T0+Fl2nUJSjDOj7oHGHUJDDFQF6FRRCKVS/Z6HPdWVuySpJMcDAt0oKuK9Sf6OJ
         gVQ1ooEvI13jp0KyNWREkc50CCnH7YXRa8tjBQv27QlqRfPkVgpMD8dMl/UOQ4QjM4Aq
         x5kj05Sv9HWIhHnSYwq8RBOJOX2UNtyzJV0V63hcmNWIr6Rr6TV20+whwQqtrKIldRHK
         efh+h6rP9YXcIyMuOKDQUm4FIR0ug648RYZsyekbOnqhT44c+HggaXfZ+WcRhNXUEuvE
         gubXUGpq6su33hgJb06dDic0bN4HanLEL5eNAV6ZVb+9uzt2wAO5CDg3YuoyghPrGDAK
         8qzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=S72LY0mQ7CTdamtDwNCbwm80DtZvz+mcH0geQ3Pff5A=;
        b=fOYbFkRmZCEuTbg9TCM8QN0pm2fFVdFM6Lj2DTBE8waIUSRQugDpmRF4a9+wdKEmBA
         ekAuAOPTskG403JF7Z/ZZZC2njeZAhJH1eBASTZX0zb9/UR+y99Gp0e5OXvnQZZZVSvZ
         C+WU+L0jgkZhZILLeEMq9TL6J6PETK8yyG1X344gjs5UI9b1Rm/K8BVPidmJtyXed4gn
         +16bjovTgePXaNsVgEjlEMXyDniQfL/8ZpWujBAQYbjkUE8zE9M9+33b/6powsm1lEvp
         cwpJbAMK/948Cc9t9Q1yG9yY8MJZ4ubWqoavaGx1jbktZLx7vocreWOhpGvqzT1S5L9D
         +lgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=S72LY0mQ7CTdamtDwNCbwm80DtZvz+mcH0geQ3Pff5A=;
        b=4/KL4zz/1k2s/21TmwNjSofjBF93ESKrWv7FTMrtNXwKvRYDbdL0M8xrvQsW0qyVlq
         sUmLUFeDwOsyNMpXlUNCdmQPPA6JxJTtwiCPGvq9xmgj9mDdZzout6C1XM9+wtyNG9e0
         OIutTFcwilmo/ycI3szYOBliZT3d9YQAqAmwRSxyJlcoMeaiNfYKHUk/+6GjALnpNzPl
         OfBTXNtAtWyGLa2wRdLaqwZvW9jQHo9/i3jecHmGwmzXTqKxTGSxoHY5zhb56mCXGnqy
         B82yf5O/my3yqIwSDH/iSDQXdXxmkMU9ZRWVhUvd/gAgcNCH3Vunj7NAeYy07e3dWH3p
         Qhdw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530F2Cf1RyT7ItA3bccPuruMEvVs7knhqFaeVs0yL6yV1DrEoWI6
	WSIGU2FX1hrnSh+pF6JRmBE=
X-Google-Smtp-Source: ABdhPJy93PuUGr9SXZBJcYGhkHPrDofLkDouTt5JYq9CQCe/8/cwMtqex8TZ51iTNzy6WfeFt1f2eQ==
X-Received: by 2002:a37:583:: with SMTP id 125mr19655313qkf.336.1634551685201;
        Mon, 18 Oct 2021 03:08:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:181d:: with SMTP id t29ls1582491qtc.4.gmail; Mon,
 18 Oct 2021 03:08:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1484:: with SMTP id t4mr28045207qtx.368.1634551684582;
        Mon, 18 Oct 2021 03:08:04 -0700 (PDT)
Date: Mon, 18 Oct 2021 03:08:03 -0700 (PDT)
From: Changming Huang <huangcm.huang@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f8ae1dec-47ba-43f3-babf-9de6e66709cen@googlegroups.com>
In-Reply-To: <8df72a54-3bc2-4f81-8b20-9679f518988dn@googlegroups.com>
References: <b4ba42c6-b69b-44c2-895a-944fc30237c0n@googlegroups.com>
 <e282cac2-2939-b868-afef-7b266b251e50@siemens.com>
 <5032fae9-5e5c-4526-a777-94ede22ac17an@googlegroups.com>
 <43b81a76-02f9-204d-059e-03aa53568d2f@siemens.com>
 <8df72a54-3bc2-4f81-8b20-9679f518988dn@googlegroups.com>
Subject: Re: how to enable real PCIe device with MSI-X on arm64 platform in
 jailhouse none-root cell?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2387_1269993050.1634551683881"
X-Original-Sender: huangcm.huang@gmail.com
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

------=_Part_2387_1269993050.1634551683881
Content-Type: multipart/alternative; 
	boundary="----=_Part_2388_1614385732.1634551683881"

------=_Part_2388_1614385732.1634551683881
Content-Type: text/plain; charset="UTF-8"

it seems  msi_domain_alloc_irqs is successful and get the MSI-X interrupt, 
but when to activate this interrupt, it reports the call trace warning.
And I checked the tx/rx with command: ethtool -S enp0s0f0 (the interface 
name), I can find there are package received and send out some packages, 
but there is not any interrupt generated.

# ethtool -S enp0s0f0
NIC statistics:
     SI rx octets: 94258
     SI rx frames: 510
     SI rx u-cast frames: 47
     SI rx m-cast frames: 17
     SI tx octets: 41367
     SI tx frames: 179
     SI tx u-cast frames: 0
     SI tx m-cast frames: 45


On Monday, October 18, 2021 at 4:36:20 PM UTC+8 Changming Huang wrote:

> thanks kiszka.
> I checked the boot log, and find one call trace during MSI-X activate:
> [    2.333986] Call trace:
> [    2.333988]  valid_col+0x14/0x24
> [    2.333992]  its_send_single_command+0x4c/0x150
> [    2.333997]  its_irq_domain_activate+0xb8/0xf0
> [    2.334002]  __irq_domain_activate_irq+0x5c/0xac
> [    2.334007]  __irq_domain_activate_irq+0x38/0xac
> [    2.334011]  irq_domain_activate_irq+0x3c/0x64
> [    2.334014]  __msi_domain_alloc_irqs+0x198/0x350
> [    2.334019]  msi_domain_alloc_irqs+0x1c/0x30
> [    2.334023]  __pci_enable_msix_range+0x614/0x6a0
> [    2.334027]  pci_alloc_irq_vectors_affinity+0xbc/0x13c
> [    2.334030]  enetc_alloc_msix+0x40/0x270
> [    2.334037]  enetc_pf_probe+0x6d0/0xf00
>
> there is not any issue in root-cell boot log.
>
> which can cause this issue?
> On Monday, October 18, 2021 at 1:50:59 PM UTC+8 j.kiszka...@gmail.com 
> wrote:
>
>> On 18.10.21 04:13, Changming Huang wrote: 
>> > MSI-X vectors translates the interrupt through its, the GIC and my 
>> > network device DTS node in root cell: 
>> >          gic: interrupt-controller@6000000 { 
>> >                  compatible= "arm,gic-v3"; 
>> >                  #address-cells = <2>; 
>> >                  #size-cells = <2>; 
>> >                  ranges; 
>> >                  reg= <0x0 0x06000000 0 0x10000>, /* GIC Dist */ 
>> >                          <0x0 0x06040000 0 0x40000>; /* GIC 
>> Redistributor */ 
>> >                  #interrupt-cells= <3>; 
>> >                  interrupt-controller; 
>> >                  interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) | 
>> >                                            IRQ_TYPE_LEVEL_LOW)>; 
>> >                   its: gic-its@6020000 { 
>> >                           compatible = "arm,gic-v3-its"; 
>> >                           msi-controller; 
>> >                          reg = <0x0 0x06020000 0 0x20000>;/* GIC 
>> > Translater */ 
>> >                  }; 
>> >          }; 
>> > 
>> >                  enetc_pcie: pcie@1f0000000 { /* Integrated Endpoint 
>> > Root Complex */ 
>> >                          compatible = "pci-host-ecam-generic"; 
>> >                          reg = <0x01 0xf0000000 0x0 0x100000>; 
>> >                          #address-cells = <3>; 
>> >                          #size-cells = <2>; 
>> >                          msi-parent = <&its>; 
>> >                          device_type = "pci"; 
>> >                          bus-range = <0x0 0x0>; 
>> >                          dma-coherent; 
>> >                          msi-map = <0 &its 0x17 0xe>; 
>> >                          ... 
>> >                   } 
>> > 
>> > and I copy them all related nodes into cell DTS. 
>> > 
>> > so, I need more effort on MSI-X in cell? 
>>
>> This is conceptually the right thing, but something must be missing. 
>>
>> Is the ITS recognized by the non-root Linux kernel? Is that kernel 
>> identical to the root-cell one (just to exclude configuration issues)? 
>> Compare the boot logs. 
>>
>> Jan 
>>
>> -- 
>> Siemens AG, T RDA IOT 
>> Corporate Competence Center Embedded Linux 
>>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f8ae1dec-47ba-43f3-babf-9de6e66709cen%40googlegroups.com.

------=_Part_2388_1614385732.1634551683881
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

it seems&nbsp;

msi_domain_alloc_irqs is successful and get the MSI-X interrupt,&nbsp;<div>=
but when to activate this interrupt, it reports the call trace warning.</di=
v><div>And I checked the tx/rx with command: ethtool -S&nbsp;enp0s0f0 (the =
interface name), I can find there are package received and send out some pa=
ckages, but there is not any interrupt generated.</div><div><br><div># etht=
ool -S enp0s0f0</div><div>NIC statistics:</div><div>&nbsp; &nbsp; &nbsp;SI =
rx octets: 94258</div><div>&nbsp; &nbsp; &nbsp;SI rx frames: 510</div><div>=
&nbsp; &nbsp; &nbsp;SI rx u-cast frames: 47</div><div>&nbsp; &nbsp; &nbsp;S=
I rx m-cast frames: 17</div><div>&nbsp; &nbsp; &nbsp;SI tx octets: 41367</d=
iv><div>&nbsp; &nbsp; &nbsp;SI tx frames: 179</div><div>&nbsp; &nbsp; &nbsp=
;SI tx u-cast frames: 0</div><div>&nbsp; &nbsp; &nbsp;SI tx m-cast frames: =
45</div><div><br></div><br></div><div class=3D"gmail_quote"><div dir=3D"aut=
o" class=3D"gmail_attr">On Monday, October 18, 2021 at 4:36:20 PM UTC+8 Cha=
ngming Huang wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left:=
 1ex;">thanks kiszka.<div>I checked the boot log, and find one call trace d=
uring MSI-X activate:</div><div><div>[=C2=A0 =C2=A0 2.333986] Call trace:</=
div><div>[=C2=A0 =C2=A0 2.333988]=C2=A0 valid_col+0x14/0x24</div><div>[=C2=
=A0 =C2=A0 2.333992]=C2=A0 its_send_single_command+0x4c/0x150</div><div>[=
=C2=A0 =C2=A0 2.333997]=C2=A0 its_irq_domain_activate+0xb8/0xf0</div><div>[=
=C2=A0 =C2=A0 2.334002]=C2=A0 __irq_domain_activate_irq+0x5c/0xac</div><div=
>[=C2=A0 =C2=A0 2.334007]=C2=A0 __irq_domain_activate_irq+0x38/0xac</div><d=
iv>[=C2=A0 =C2=A0 2.334011]=C2=A0 irq_domain_activate_irq+0x3c/0x64</div><d=
iv>[=C2=A0 =C2=A0 2.334014]=C2=A0 __msi_domain_alloc_irqs+0x198/0x350</div>=
<div>[=C2=A0 =C2=A0 2.334019]=C2=A0 msi_domain_alloc_irqs+0x1c/0x30</div><d=
iv>[=C2=A0 =C2=A0 2.334023]=C2=A0 __pci_enable_msix_range+0x614/0x6a0</div>=
<div>[=C2=A0 =C2=A0 2.334027]=C2=A0 pci_alloc_irq_vectors_affinity+0xbc/0x1=
3c</div><div>[=C2=A0 =C2=A0 2.334030]=C2=A0 enetc_alloc_msix+0x40/0x270</di=
v><div>[=C2=A0 =C2=A0 2.334037]=C2=A0 enetc_pf_probe+0x6d0/0xf00</div><div>=
<br></div>there is not any issue in root-cell boot log.</div><div><br></div=
><div>which can cause this issue?</div><div class=3D"gmail_quote"><div dir=
=3D"auto" class=3D"gmail_attr">On Monday, October 18, 2021 at 1:50:59 PM UT=
C+8 <a href data-email-masked rel=3D"nofollow">j.kiszka...@gmail.com</a> wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 18.10.21 04:13=
, Changming Huang wrote:
<br>&gt; MSI-X vectors translates the interrupt through its, the GIC and my
<br>&gt; network device DTS node in root cell:
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic: interrupt-controller@600000=
0 {
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0comp=
atible=3D &quot;arm,gic-v3&quot;;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#add=
ress-cells =3D &lt;2&gt;;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#siz=
e-cells =3D &lt;2&gt;;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rang=
es;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg=
=3D &lt;0x0 0x06000000 0 0x10000&gt;, /* GIC Dist */
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&lt;0x0 0x06040000 0 0x40000&gt;; /* GIC Redistribu=
tor */
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#int=
errupt-cells=3D &lt;3&gt;;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inte=
rrupt-controller;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inte=
rrupts =3D &lt;GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) |
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0IRQ_TYPE_LEVEL_LOW)&gt;;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 its=
: gic-its@6020000 {
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;arm,gic-v3-its&quot;;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 msi-controller;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0x06020000 0 0x20000&gt;;/* GIC
<br>&gt; Translater */
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};
<br>&gt;=20
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enet=
c_pcie: pcie@1f0000000 { /* Integrated Endpoint
<br>&gt; Root Complex */
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;pci-host-ecam-generic&quot;;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x01 0xf0000000 0x0 0x100000&gt;;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;3&gt;;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;2&gt;;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0msi-parent =3D &lt;&amp;its&gt;;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0device_type =3D &quot;pci&quot;;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0bus-range =3D &lt;0x0 0x0&gt;;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0dma-coherent;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0msi-map =3D &lt;0 &amp;its 0x17 0xe&gt;;
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0...
<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
<br>&gt;=20
<br>&gt; and I copy them all related nodes into cell DTS.
<br>&gt;=20
<br>&gt; so, I need more effort on MSI-X in cell?
<br>
<br>This is conceptually the right thing, but something must be missing.
<br>
<br>Is the ITS recognized by the non-root Linux kernel? Is that kernel
<br>identical to the root-cell one (just to exclude configuration issues)?
<br>Compare the boot logs.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f8ae1dec-47ba-43f3-babf-9de6e66709cen%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f8ae1dec-47ba-43f3-babf-9de6e66709cen%40googlegroups.co=
m</a>.<br />

------=_Part_2388_1614385732.1634551683881--

------=_Part_2387_1269993050.1634551683881--
