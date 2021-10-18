Return-Path: <jailhouse-dev+bncBC64DZNZYEERBBHEWSFQMGQEMKKNHSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3699443123B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 10:36:22 +0200 (CEST)
Received: by mail-qt1-x83d.google.com with SMTP id k1-20020ac80c01000000b002a79e319399sf8959390qti.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 01:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zy0FUMX9yl+iOYLXd+t2EOEmrj0EA46Z/pjE6IGyNEc=;
        b=GGzzngiILRGN2yHfc9dPphl/hY1sHWPm1oidTRsMJvUsyYkSz0Z1BYQIifl8OSuG07
         WWNDNuS91Q4+waq3Sj4FRMUYrpljy9g/piVHkgI8fHoMhTgZonlGiDUWWi4GG1L3GRzf
         U2Qk6lzdlPg3AHJGopeS3hDWI/u45GIp9dlCkYThd/oqQcMFQDPHlNn5wFbg0vJ3VOxE
         Xxfv1luBx9xdzDCZ5nfS2IH+G0wYR+A2GkJQ16KahSmKroZ9iD92uaXE4L1WjwhPaJAr
         Rqw6HXfKak5CHdtgxUB3wrwgRf8dCiKuETSiWMYTh+mLT3WDOeSNmCWdIuxzaNozurDz
         st1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zy0FUMX9yl+iOYLXd+t2EOEmrj0EA46Z/pjE6IGyNEc=;
        b=K++xVS12hYAskkVtSpB5fzjo3J6AcW3ABVaLus0zf6sALdCGYv93utqsmbAUviYpUe
         RfUzcckj2Qr33ZVZoOSek7bd3QyVUIVSlU9mZTQwZRlIZvoIGR1hQGSAXRsG4l6JpYxC
         pTj1sV0neACsC32XRzP5eElx2oow/VoI1f7BbC9hg6wIUHDeX2ME2U9HILRUYdh8mqcb
         WRWOr2oc/+zx5hnTXpW0+2i75LMJTm2MN866p21uNlahHnUru4w3/MuOTwG+0cdLGmPm
         6Wi5dL/IMS7VDYy36AGH45NzNEFVlPFVMSb36TjBx3yGGxX/sSUU6ZQHC2X4gvWytjof
         IQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zy0FUMX9yl+iOYLXd+t2EOEmrj0EA46Z/pjE6IGyNEc=;
        b=qKPi3OnBAUlPVLXWIiJRudMQVVetoY4Mt9DlRpUiBTju0cgK34BiSjgmVoGF08WMB/
         jn98ol9tj1igHcNEOVUicEUXqv9GOnaKRU3XvMCaCOYmFXuinj7kyRaavJ3VEQ2nm7Nm
         M9w31YawAIYH4bHAssrbZNFQkrPwdBttVnvDRIx+cKmXqiqgXNAVn2ecLga4y12VQv+F
         MjxUCUe+XezG+L9LrUk6H4F4SazfdJAy7nUa2N6s7+ztIv0fF3DegdCCfbesGdN8YzSO
         ELMP6FRdx90ROecdL5+JNaUbjDfYOgW0VuT/620skBhI5mcuX7rQiPz7dOmCUzjR06sA
         1kyg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531XiCxL92FMQBh8T0uNiEHUH42gkhP4ooC5tbiJjJiOHbSVscC0
	cVyTh4HB0ZR2RgnAyeDOfE4=
X-Google-Smtp-Source: ABdhPJy/BqZkvQpfWCp0uS2OxgJUUO64R7Tp1tqoXRq8a2MCWMVLm5DhbiZANMewZm2mclrjrOhOHw==
X-Received: by 2002:ac8:5e4e:: with SMTP id i14mr28225724qtx.129.1634546181144;
        Mon, 18 Oct 2021 01:36:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:1a8a:: with SMTP id s10ls4888623qtc.8.gmail; Mon,
 18 Oct 2021 01:36:20 -0700 (PDT)
X-Received: by 2002:ac8:5c16:: with SMTP id i22mr28641564qti.26.1634546180607;
        Mon, 18 Oct 2021 01:36:20 -0700 (PDT)
Date: Mon, 18 Oct 2021 01:36:20 -0700 (PDT)
From: Changming Huang <huangcm.huang@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <8df72a54-3bc2-4f81-8b20-9679f518988dn@googlegroups.com>
In-Reply-To: <43b81a76-02f9-204d-059e-03aa53568d2f@siemens.com>
References: <b4ba42c6-b69b-44c2-895a-944fc30237c0n@googlegroups.com>
 <e282cac2-2939-b868-afef-7b266b251e50@siemens.com>
 <5032fae9-5e5c-4526-a777-94ede22ac17an@googlegroups.com>
 <43b81a76-02f9-204d-059e-03aa53568d2f@siemens.com>
Subject: Re: how to enable real PCIe device with MSI-X on arm64 platform in
 jailhouse none-root cell?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4516_433192128.1634546180014"
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

------=_Part_4516_433192128.1634546180014
Content-Type: multipart/alternative; 
	boundary="----=_Part_4517_767858687.1634546180014"

------=_Part_4517_767858687.1634546180014
Content-Type: text/plain; charset="UTF-8"

thanks kiszka.
I checked the boot log, and find one call trace during MSI-X activate:
[    2.333986] Call trace:
[    2.333988]  valid_col+0x14/0x24
[    2.333992]  its_send_single_command+0x4c/0x150
[    2.333997]  its_irq_domain_activate+0xb8/0xf0
[    2.334002]  __irq_domain_activate_irq+0x5c/0xac
[    2.334007]  __irq_domain_activate_irq+0x38/0xac
[    2.334011]  irq_domain_activate_irq+0x3c/0x64
[    2.334014]  __msi_domain_alloc_irqs+0x198/0x350
[    2.334019]  msi_domain_alloc_irqs+0x1c/0x30
[    2.334023]  __pci_enable_msix_range+0x614/0x6a0
[    2.334027]  pci_alloc_irq_vectors_affinity+0xbc/0x13c
[    2.334030]  enetc_alloc_msix+0x40/0x270
[    2.334037]  enetc_pf_probe+0x6d0/0xf00

there is not any issue in root-cell boot log.

which can cause this issue?
On Monday, October 18, 2021 at 1:50:59 PM UTC+8 j.kiszka...@gmail.com wrote:

> On 18.10.21 04:13, Changming Huang wrote:
> > MSI-X vectors translates the interrupt through its, the GIC and my
> > network device DTS node in root cell:
> >          gic: interrupt-controller@6000000 {
> >                  compatible= "arm,gic-v3";
> >                  #address-cells = <2>;
> >                  #size-cells = <2>;
> >                  ranges;
> >                  reg= <0x0 0x06000000 0 0x10000>, /* GIC Dist */
> >                          <0x0 0x06040000 0 0x40000>; /* GIC 
> Redistributor */
> >                  #interrupt-cells= <3>;
> >                  interrupt-controller;
> >                  interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) |
> >                                            IRQ_TYPE_LEVEL_LOW)>;
> >                   its: gic-its@6020000 {
> >                           compatible = "arm,gic-v3-its";
> >                           msi-controller;
> >                          reg = <0x0 0x06020000 0 0x20000>;/* GIC
> > Translater */
> >                  };
> >          };
> > 
> >                  enetc_pcie: pcie@1f0000000 { /* Integrated Endpoint
> > Root Complex */
> >                          compatible = "pci-host-ecam-generic";
> >                          reg = <0x01 0xf0000000 0x0 0x100000>;
> >                          #address-cells = <3>;
> >                          #size-cells = <2>;
> >                          msi-parent = <&its>;
> >                          device_type = "pci";
> >                          bus-range = <0x0 0x0>;
> >                          dma-coherent;
> >                          msi-map = <0 &its 0x17 0xe>;
> >                          ...
> >                   }
> > 
> > and I copy them all related nodes into cell DTS.
> > 
> > so, I need more effort on MSI-X in cell?
>
> This is conceptually the right thing, but something must be missing.
>
> Is the ITS recognized by the non-root Linux kernel? Is that kernel
> identical to the root-cell one (just to exclude configuration issues)?
> Compare the boot logs.
>
> Jan
>
> -- 
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8df72a54-3bc2-4f81-8b20-9679f518988dn%40googlegroups.com.

------=_Part_4517_767858687.1634546180014
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thanks kiszka.<div>I checked the boot log, and find one call trace during M=
SI-X activate:</div><div><div>[&nbsp; &nbsp; 2.333986] Call trace:</div><di=
v>[&nbsp; &nbsp; 2.333988]&nbsp; valid_col+0x14/0x24</div><div>[&nbsp; &nbs=
p; 2.333992]&nbsp; its_send_single_command+0x4c/0x150</div><div>[&nbsp; &nb=
sp; 2.333997]&nbsp; its_irq_domain_activate+0xb8/0xf0</div><div>[&nbsp; &nb=
sp; 2.334002]&nbsp; __irq_domain_activate_irq+0x5c/0xac</div><div>[&nbsp; &=
nbsp; 2.334007]&nbsp; __irq_domain_activate_irq+0x38/0xac</div><div>[&nbsp;=
 &nbsp; 2.334011]&nbsp; irq_domain_activate_irq+0x3c/0x64</div><div>[&nbsp;=
 &nbsp; 2.334014]&nbsp; __msi_domain_alloc_irqs+0x198/0x350</div><div>[&nbs=
p; &nbsp; 2.334019]&nbsp; msi_domain_alloc_irqs+0x1c/0x30</div><div>[&nbsp;=
 &nbsp; 2.334023]&nbsp; __pci_enable_msix_range+0x614/0x6a0</div><div>[&nbs=
p; &nbsp; 2.334027]&nbsp; pci_alloc_irq_vectors_affinity+0xbc/0x13c</div><d=
iv>[&nbsp; &nbsp; 2.334030]&nbsp; enetc_alloc_msix+0x40/0x270</div><div>[&n=
bsp; &nbsp; 2.334037]&nbsp; enetc_pf_probe+0x6d0/0xf00</div><div><br></div>=
there is not any issue in root-cell boot log.</div><div><br></div><div>whic=
h can cause this issue?</div><div class=3D"gmail_quote"><div dir=3D"auto" c=
lass=3D"gmail_attr">On Monday, October 18, 2021 at 1:50:59 PM UTC+8 j.kiszk=
a...@gmail.com wrote:<br/></div><blockquote class=3D"gmail_quote" style=3D"=
margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-lef=
t: 1ex;">On 18.10.21 04:13, Changming Huang wrote:
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
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/8df72a54-3bc2-4f81-8b20-9679f518988dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/8df72a54-3bc2-4f81-8b20-9679f518988dn%40googlegroups.co=
m</a>.<br />

------=_Part_4517_767858687.1634546180014--

------=_Part_4516_433192128.1634546180014--
