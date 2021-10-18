Return-Path: <jailhouse-dev+bncBC64DZNZYEERB3GZWWFQMGQEVBN4GTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83e.google.com (mail-qt1-x83e.google.com [IPv6:2607:f8b0:4864:20::83e])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6734319C8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 14:47:41 +0200 (CEST)
Received: by mail-qt1-x83e.google.com with SMTP id k1-20020ac80201000000b002a7200b449esf10506205qtg.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 05:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oWrftTa7D5DOxukT9RjOo/0pWRZxWUEtG/vU/vBbKNA=;
        b=ApmAYYH+vGiKAv8gMurYeWyF421w/nTU+fu+YQKxCzQrd0n6zelwAVNQ0FdDxkVFYH
         Xml4mqwLZKptg55KH1QMrOaRtjPUsuLAgeBHoeJFlr+XTm00OF1EviAYN2OuJrf68Jiq
         VhqGMT1976/fkC5Sqe9TeBrmcNfzhpI0SYFlUE53Toe3lh/na8gCjRQLLZtumMoClcIk
         hhXU+xM9VLgJiEZ95+9+5JRmMwz5ryl8dY/1yjOmU42GCLXmPon+MHay+hv/D+96OmcI
         H468NC0RpOuS0OC+bTTrMu8H7xauF4C6MTjHvTYlJPiILu8RBUoXk6h7v/Rpq5b9w68X
         BQzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oWrftTa7D5DOxukT9RjOo/0pWRZxWUEtG/vU/vBbKNA=;
        b=oWVdISrn22xZT3F/5FSaF68SlWGlLc1BhXE2HkRan7s19j5ORJK7qPaB1y5xEtVGq0
         1F2dPwzzKhZiLBLrnMud5mrt53GwJsEgTzXJFoenYWWhRMQbFOiFg3Yi5JImwemXi8lg
         cn72a7PqntdgsT8t6HkTEbm1h2tNpDQajx6wrq9UsbSTEecegT3t1RWn0DinWlYqALdy
         eMCKEcwEkWX24s/n/hNJLvxhErd63F+87oP/0nyZN+PrFN9XupLU/XsXhzwz0IZs1OPh
         1cSsn+sNaJgotkaGEsZ4hej+xNtPUP9JGDF/BlCLk6ghe/p8TiMSJETvx4Wobz2W+8pj
         o6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=oWrftTa7D5DOxukT9RjOo/0pWRZxWUEtG/vU/vBbKNA=;
        b=a2J5g+4042XeXH0dhuAKUm5AQxXwjt1GRRR5ubmU329WatkXzGB0z90oz9OU3lcfTl
         SpgbWwZnkXB/X+vg9SJeUUuk+7zA7lm7Dl4Ofq8uKm+CSdrPbIYNjxHCEkesHdaQARfH
         nV+sMG7SQ1wrIFsbrzpml2Tv/rIm6WgkxmPAKwwRf7JA7ZQ44xU0QCcY/Gj3pKj9fl2z
         1NAvqM9dkmfeyQsB2oBRzfdw58ehd2zIu3yT2sMqTjP7/zmuN+5hA9Ns9HC47AV/7jjL
         9J9NQjnr9GRRUN9hhZdAOzXdoZO1wUu7ml38zuUPx0jkT2nuNYrb4GQtnzjxBVOLl6fr
         PJWg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5304RX2vKe8P3AUWRLsMHtlhciap4v+fdJ95cyTROPeGRtF+FCJd
	O2u/KllunDiCm3oYm8JWxss=
X-Google-Smtp-Source: ABdhPJw0sGg5JFGQsmB629v2iDONdFU+9dhcyWoYizAHQkoevKHggocgJs33DVW1tGGGp84HWk7ufw==
X-Received: by 2002:ac8:7a96:: with SMTP id x22mr28748523qtr.223.1634561260188;
        Mon, 18 Oct 2021 05:47:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:444c:: with SMTP id r73ls8347342qka.10.gmail; Mon, 18
 Oct 2021 05:47:39 -0700 (PDT)
X-Received: by 2002:a37:6c06:: with SMTP id h6mr21968618qkc.201.1634561259644;
        Mon, 18 Oct 2021 05:47:39 -0700 (PDT)
Date: Mon, 18 Oct 2021 05:47:39 -0700 (PDT)
From: Changming Huang <huangcm.huang@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a93d4399-0a8d-4448-9a94-5aded67b2e3fn@googlegroups.com>
In-Reply-To: <be28902a-8cd0-90de-e23e-37b42e59cea7@siemens.com>
References: <b4ba42c6-b69b-44c2-895a-944fc30237c0n@googlegroups.com>
 <e282cac2-2939-b868-afef-7b266b251e50@siemens.com>
 <5032fae9-5e5c-4526-a777-94ede22ac17an@googlegroups.com>
 <43b81a76-02f9-204d-059e-03aa53568d2f@siemens.com>
 <8df72a54-3bc2-4f81-8b20-9679f518988dn@googlegroups.com>
 <f8ae1dec-47ba-43f3-babf-9de6e66709cen@googlegroups.com>
 <be28902a-8cd0-90de-e23e-37b42e59cea7@siemens.com>
Subject: Re: how to enable real PCIe device with MSI-X on arm64 platform in
 jailhouse none-root cell?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6568_316264414.1634561259048"
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

------=_Part_6568_316264414.1634561259048
Content-Type: multipart/alternative; 
	boundary="----=_Part_6569_1419994700.1634561259048"

------=_Part_6569_1419994700.1634561259048
Content-Type: text/plain; charset="UTF-8"


thanks Jan.
The LPI need one reserved memory and now I assigned one to it. and no call 
trace now.
and can get the interrupt number, for example:
96:          0   ITS-MSI   1 Edge      enp0s0f0-rxtx0

but, there is not any interrupt generated.
On Monday, October 18, 2021 at 7:39:43 PM UTC+8 j.kiszka...@gmail.com wrote:

> On 18.10.21 12:08, Changming Huang wrote:
> > it seems  msi_domain_alloc_irqs is successful and get the MSI-X 
> interrupt, 
> > but when to activate this interrupt, it reports the call trace warning.
> > And I checked the tx/rx with command: ethtool -S enp0s0f0 (the interface
> > name), I can find there are package received and send out some packages,
> > but there is not any interrupt generated.
> > 
> > # ethtool -S enp0s0f0
> > NIC statistics:
> >      SI rx octets: 94258
> >      SI rx frames: 510
> >      SI rx u-cast frames: 47
> >      SI rx m-cast frames: 17
> >      SI tx octets: 41367
> >      SI tx frames: 179
> >      SI tx u-cast frames: 0
> >      SI tx m-cast frames: 45
> > 
> > 
> > On Monday, October 18, 2021 at 4:36:20 PM UTC+8 Changming Huang wrote:
> > 
> > thanks kiszka.
> > I checked the boot log, and find one call trace during MSI-X activate:
>
> What is (right) before this trace? What is the exact error message?
>
> Jan
>
> > [    2.333986] Call trace:
> > [    2.333988]  valid_col+0x14/0x24
> > [    2.333992]  its_send_single_command+0x4c/0x150
> > [    2.333997]  its_irq_domain_activate+0xb8/0xf0
> > [    2.334002]  __irq_domain_activate_irq+0x5c/0xac
> > [    2.334007]  __irq_domain_activate_irq+0x38/0xac
> > [    2.334011]  irq_domain_activate_irq+0x3c/0x64
> > [    2.334014]  __msi_domain_alloc_irqs+0x198/0x350
> > [    2.334019]  msi_domain_alloc_irqs+0x1c/0x30
> > [    2.334023]  __pci_enable_msix_range+0x614/0x6a0
> > [    2.334027]  pci_alloc_irq_vectors_affinity+0xbc/0x13c
> > [    2.334030]  enetc_alloc_msix+0x40/0x270
> > [    2.334037]  enetc_pf_probe+0x6d0/0xf00
> > 
> > there is not any issue in root-cell boot log.
> > 
> > which can cause this issue?
> > On Monday, October 18, 2021 at 1:50:59 PM UTC+8
> > j.kiszka...@gmail.com wrote:
> > 
> > On 18.10.21 04:13, Changming Huang wrote:
> > > MSI-X vectors translates the interrupt through its, the GIC
> > and my
> > > network device DTS node in root cell:
> > >          gic: interrupt-controller@6000000 {
> > >                  compatible= "arm,gic-v3";
> > >                  #address-cells = <2>;
> > >                  #size-cells = <2>;
> > >                  ranges;
> > >                  reg= <0x0 0x06000000 0 0x10000>, /* GIC Dist */
> > >                          <0x0 0x06040000 0 0x40000>; /* GIC
> > Redistributor */
> > >                  #interrupt-cells= <3>;
> > >                  interrupt-controller;
> > >                  interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) |
> > >                                            IRQ_TYPE_LEVEL_LOW)>;
> > >                   its: gic-its@6020000 {
> > >                           compatible = "arm,gic-v3-its";
> > >                           msi-controller;
> > >                          reg = <0x0 0x06020000 0 0x20000>;/* GIC
> > > Translater */
> > >                  };
> > >          };
> > >
> > >                  enetc_pcie: pcie@1f0000000 { /* Integrated
> > Endpoint
> > > Root Complex */
> > >                          compatible = "pci-host-ecam-generic";
> > >                          reg = <0x01 0xf0000000 0x0 0x100000>;
> > >                          #address-cells = <3>;
> > >                          #size-cells = <2>;
> > >                          msi-parent = <&its>;
> > >                          device_type = "pci";
> > >                          bus-range = <0x0 0x0>;
> > >                          dma-coherent;
> > >                          msi-map = <0 &its 0x17 0xe>;
> > >                          ...
> > >                   }
> > >
> > > and I copy them all related nodes into cell DTS.
> > >
> > > so, I need more effort on MSI-X in cell?
> > 
> > This is conceptually the right thing, but something must be
> > missing.
> > 
> > Is the ITS recognized by the non-root Linux kernel? Is that kernel
> > identical to the root-cell one (just to exclude configuration
> > issues)?
> > Compare the boot logs.
> > 
> > Jan
> > 
> > -- 
> > Siemens AG, T RDA IOT
> > Corporate Competence Center Embedded Linux
>
> -- 
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a93d4399-0a8d-4448-9a94-5aded67b2e3fn%40googlegroups.com.

------=_Part_6569_1419994700.1634561259048
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br>thanks Jan.<div>The LPI need one reserved memory and now I assigned one=
 to it. and no call trace now.</div><div>and can get the interrupt number, =
for example:</div><div><div>96:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0&nbsp; &=
nbsp;ITS-MSI&nbsp; &nbsp;1 Edge&nbsp; &nbsp; &nbsp; enp0s0f0-rxtx0</div></d=
iv><div><br></div><div>but, there is not any interrupt generated.</div><div=
 class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Monday, Oc=
tober 18, 2021 at 7:39:43 PM UTC+8 j.kiszka...@gmail.com wrote:<br/></div><=
blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left:=
 1px solid rgb(204, 204, 204); padding-left: 1ex;">On 18.10.21 12:08, Chang=
ming Huang wrote:
<br>&gt; it seems=C2=A0 msi_domain_alloc_irqs is successful and get the MSI=
-X interrupt,=C2=A0
<br>&gt; but when to activate this interrupt, it reports the call trace war=
ning.
<br>&gt; And I checked the tx/rx with command: ethtool -S=C2=A0enp0s0f0 (th=
e interface
<br>&gt; name), I can find there are package received and send out some pac=
kages,
<br>&gt; but there is not any interrupt generated.
<br>&gt;=20
<br>&gt; # ethtool -S enp0s0f0
<br>&gt; NIC statistics:
<br>&gt; =C2=A0 =C2=A0 =C2=A0SI rx octets: 94258
<br>&gt; =C2=A0 =C2=A0 =C2=A0SI rx frames: 510
<br>&gt; =C2=A0 =C2=A0 =C2=A0SI rx u-cast frames: 47
<br>&gt; =C2=A0 =C2=A0 =C2=A0SI rx m-cast frames: 17
<br>&gt; =C2=A0 =C2=A0 =C2=A0SI tx octets: 41367
<br>&gt; =C2=A0 =C2=A0 =C2=A0SI tx frames: 179
<br>&gt; =C2=A0 =C2=A0 =C2=A0SI tx u-cast frames: 0
<br>&gt; =C2=A0 =C2=A0 =C2=A0SI tx m-cast frames: 45
<br>&gt;=20
<br>&gt;=20
<br>&gt; On Monday, October 18, 2021 at 4:36:20 PM UTC+8 Changming Huang wr=
ote:
<br>&gt;=20
<br>&gt;     thanks kiszka.
<br>&gt;     I checked the boot log, and find one call trace during MSI-X a=
ctivate:
<br>
<br>What is (right) before this trace? What is the exact error message?
<br>
<br>Jan
<br>
<br>&gt;     [=C2=A0 =C2=A0 2.333986] Call trace:
<br>&gt;     [=C2=A0 =C2=A0 2.333988]=C2=A0 valid_col+0x14/0x24
<br>&gt;     [=C2=A0 =C2=A0 2.333992]=C2=A0 its_send_single_command+0x4c/0x=
150
<br>&gt;     [=C2=A0 =C2=A0 2.333997]=C2=A0 its_irq_domain_activate+0xb8/0x=
f0
<br>&gt;     [=C2=A0 =C2=A0 2.334002]=C2=A0 __irq_domain_activate_irq+0x5c/=
0xac
<br>&gt;     [=C2=A0 =C2=A0 2.334007]=C2=A0 __irq_domain_activate_irq+0x38/=
0xac
<br>&gt;     [=C2=A0 =C2=A0 2.334011]=C2=A0 irq_domain_activate_irq+0x3c/0x=
64
<br>&gt;     [=C2=A0 =C2=A0 2.334014]=C2=A0 __msi_domain_alloc_irqs+0x198/0=
x350
<br>&gt;     [=C2=A0 =C2=A0 2.334019]=C2=A0 msi_domain_alloc_irqs+0x1c/0x30
<br>&gt;     [=C2=A0 =C2=A0 2.334023]=C2=A0 __pci_enable_msix_range+0x614/0=
x6a0
<br>&gt;     [=C2=A0 =C2=A0 2.334027]=C2=A0 pci_alloc_irq_vectors_affinity+=
0xbc/0x13c
<br>&gt;     [=C2=A0 =C2=A0 2.334030]=C2=A0 enetc_alloc_msix+0x40/0x270
<br>&gt;     [=C2=A0 =C2=A0 2.334037]=C2=A0 enetc_pf_probe+0x6d0/0xf00
<br>&gt;=20
<br>&gt;     there is not any issue in root-cell boot log.
<br>&gt;=20
<br>&gt;     which can cause this issue?
<br>&gt;     On Monday, October 18, 2021 at 1:50:59 PM UTC+8
<br>&gt;     <a href data-email-masked rel=3D"nofollow">j.kiszka...@gmail.c=
om</a> wrote:
<br>&gt;=20
<br>&gt;         On 18.10.21 04:13, Changming Huang wrote:
<br>&gt;         &gt; MSI-X vectors translates the interrupt through its, t=
he GIC
<br>&gt;         and my
<br>&gt;         &gt; network device DTS node in root cell:
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gic: interrupt-cont=
roller@6000000 {
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0compatible=3D &quot;arm,gic-v3&quot;;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0#address-cells =3D &lt;2&gt;;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0#size-cells =3D &lt;2&gt;;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ranges;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0reg=3D &lt;0x0 0x06000000 0 0x10000&gt;, /* GIC Dist */
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;0x0 0x06040000 0 0x40000&gt;; /* =
GIC
<br>&gt;         Redistributor */
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0#interrupt-cells=3D &lt;3&gt;;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0interrupt-controller;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0interrupts =3D &lt;GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) |
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0IRQ_TYPE_LEVEL_LOW)&gt;;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 its: gic-its@6020000 {
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;arm,gic-v3-its&=
quot;;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msi-controller;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x0 0x06020000 0 0x20000&=
gt;;/* GIC
<br>&gt;         &gt; Translater */
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0};
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};
<br>&gt;         &gt;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0enetc_pcie: pcie@1f0000000 { /* Integrated
<br>&gt;         Endpoint
<br>&gt;         &gt; Root Complex */
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;pci-host-ecam-ge=
neric&quot;;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x01 0xf0000000 0x0 0x100=
000&gt;;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#address-cells =3D &lt;3&gt;;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#size-cells =3D &lt;2&gt;;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msi-parent =3D &lt;&amp;its&gt;;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_type =3D &quot;pci&quot;;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus-range =3D &lt;0x0 0x0&gt;;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma-coherent;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msi-map =3D &lt;0 &amp;its 0x17 0xe&g=
t;;
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...
<br>&gt;         &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }
<br>&gt;         &gt;
<br>&gt;         &gt; and I copy them all related nodes into cell DTS.
<br>&gt;         &gt;
<br>&gt;         &gt; so, I need more effort on MSI-X in cell?
<br>&gt;=20
<br>&gt;         This is conceptually the right thing, but something must b=
e
<br>&gt;         missing.
<br>&gt;=20
<br>&gt;         Is the ITS recognized by the non-root Linux kernel? Is tha=
t kernel
<br>&gt;         identical to the root-cell one (just to exclude configurat=
ion
<br>&gt;         issues)?
<br>&gt;         Compare the boot logs.
<br>&gt;=20
<br>&gt;         Jan
<br>&gt;=20
<br>&gt;         --=20
<br>&gt;         Siemens AG, T RDA IOT
<br>&gt;         Corporate Competence Center Embedded Linux
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
om/d/msgid/jailhouse-dev/a93d4399-0a8d-4448-9a94-5aded67b2e3fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a93d4399-0a8d-4448-9a94-5aded67b2e3fn%40googlegroups.co=
m</a>.<br />

------=_Part_6569_1419994700.1634561259048--

------=_Part_6568_316264414.1634561259048--
