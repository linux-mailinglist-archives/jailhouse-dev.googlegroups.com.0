Return-Path: <jailhouse-dev+bncBC64DZNZYEERBT5QWOFQMGQEDEH2QKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCB2430DC9
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 04:13:36 +0200 (CEST)
Received: by mail-qv1-xf38.google.com with SMTP id o90-20020a0c85e3000000b0038310a20003sf13676307qva.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 17 Oct 2021 19:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ORq+Rz/7bqBoWpYy/9EsRq2OmLPvzrv0eRkpCMe6PVo=;
        b=bzXXq50N8uKE2qjhzdMDGe6YY9CszSmbepkQq8YsRf4zsnIQXaWmnzwW7KBZrCKuoB
         w1zbvYAP0MOhpEtBvQITWIbHkCrR3sx5Xoh08FYXhmZVm64fB1EVb1+pKqHhd/fmv8KO
         POViAP4CXz5auFP4A/F/wC1zG6rb4DgK7wfk8bAA+itPpbN0qkn9wwaiu26ak4RIrFj2
         cxujiywZCxk1Yf/Hli3Cu/ef9ovd8OmfLbjzspsvCPmb24sBXlhuAEtFXtLCvuWWvczF
         yZqGGP5DgaMgEFRQTVlMsIVKhfQQSdnDiXfbMoilD2Z5By3+N9hNTfR/JcxRIfkkbCSa
         EmaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ORq+Rz/7bqBoWpYy/9EsRq2OmLPvzrv0eRkpCMe6PVo=;
        b=djuwcO2YwITEdSVcnZJ3W3xBZVPNT6oHXTeljxcN60THPBPnjLRaZqprSSJMkVKgkp
         gfxk8rDe9DGr9BD7L9nPxAfXFYircROeipspxrWCbdhVqzVU80JGEbSp480W2aLRwyQy
         HTNSJRxgYRmenwGWm9zI8Q8M+d7a+OD+kUZZT27MyLQDsBtSXnywnljfJ+eMHjLq8CSm
         Jvp5Ch5p0X9Oae3/o1cSxM/J890Re8t8R4g2aWtPnKgI7CoQ5GbDMtyB/oPdVXNKN/W1
         VpvIfMNrfJy6Zy8u/qCfBN6nGXdOpf0hfsPhzTvibVNXpdaH1XFeNTSrB7fjt+0K/p7V
         KynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ORq+Rz/7bqBoWpYy/9EsRq2OmLPvzrv0eRkpCMe6PVo=;
        b=AwHsbsamBAXN4bXGzhaH7x86svHDiVzxmeZV3MKl3Hd8FztTN8MA4Un9fBVbB1NyyS
         5cP2JUeQttY48hLrWQdg5gKv9TgKAnFu78w4PDLaky9T54W4OoWtj4TMSlTnigVK9bu3
         Nl5icXQmveHGwsBpS5fQ4HgXOtVeLYJaEBbyYrpZDc6TklG19hTyklpICs70+iPOfEul
         E0ceMmkQ8nSZ2OBVxPbW/UUvI9puXmewRRKuK7zzZCbkPgd3QHlv1Wbzp6gGNLtZRkj1
         bQ9rGLAMVHy/ZpvQpee6R9Bh7Yf4Q+dO/E6JyE9unnjNsQ4+XOqNN4nSUkpSSaaVr9Co
         lRSA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530lErOSeU3qq6s8V4H+LkuY/bLktmzKn5dETWcReBax5mue0BUg
	4u32CAfiyHsG9nj9FjaVyOU=
X-Google-Smtp-Source: ABdhPJzx9vrDliPK/V/z9Od4prDavIS3xE2xiaCW/NHvTkznxGGM7D5vbYQA//hNNCmsr3LcIRO04w==
X-Received: by 2002:a05:6214:6ad:: with SMTP id s13mr23140047qvz.12.1634523215183;
        Sun, 17 Oct 2021 19:13:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:1a8a:: with SMTP id s10ls4482805qtc.8.gmail; Sun,
 17 Oct 2021 19:13:34 -0700 (PDT)
X-Received: by 2002:ac8:614b:: with SMTP id d11mr26818247qtm.396.1634523214549;
        Sun, 17 Oct 2021 19:13:34 -0700 (PDT)
Date: Sun, 17 Oct 2021 19:13:33 -0700 (PDT)
From: Changming Huang <huangcm.huang@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5032fae9-5e5c-4526-a777-94ede22ac17an@googlegroups.com>
In-Reply-To: <e282cac2-2939-b868-afef-7b266b251e50@siemens.com>
References: <b4ba42c6-b69b-44c2-895a-944fc30237c0n@googlegroups.com>
 <e282cac2-2939-b868-afef-7b266b251e50@siemens.com>
Subject: Re: how to enable real PCIe device with MSI-X on arm64 platform in
 jailhouse none-root cell?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2520_1674752108.1634523213837"
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

------=_Part_2520_1674752108.1634523213837
Content-Type: multipart/alternative; 
	boundary="----=_Part_2521_907861211.1634523213837"

------=_Part_2521_907861211.1634523213837
Content-Type: text/plain; charset="UTF-8"

MSI-X vectors translates the interrupt through its, the GIC and my network 
device DTS node in root cell:
         gic: interrupt-controller@6000000 {
                 compatible= "arm,gic-v3";
                 #address-cells = <2>;
                 #size-cells = <2>;
                 ranges;
                 reg= <0x0 0x06000000 0 0x10000>, /* GIC Dist */
                         <0x0 0x06040000 0 0x40000>; /* GIC Redistributor */
                 #interrupt-cells= <3>;
                 interrupt-controller;
                 interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) |
                                           IRQ_TYPE_LEVEL_LOW)>;
                  its: gic-its@6020000 {
                          compatible = "arm,gic-v3-its";
                          msi-controller;
                         reg = <0x0 0x06020000 0 0x20000>;/* GIC Translater 
*/
                 };
         };

                 enetc_pcie: pcie@1f0000000 { /* Integrated Endpoint Root 
Complex */
                         compatible = "pci-host-ecam-generic";
                         reg = <0x01 0xf0000000 0x0 0x100000>;
                         #address-cells = <3>;
                         #size-cells = <2>;
                         msi-parent = <&its>;
                         device_type = "pci";
                         bus-range = <0x0 0x0>;
                         dma-coherent;
                         msi-map = <0 &its 0x17 0xe>;
                         ...
                  }

and I copy them all related nodes into cell DTS.

so, I need more effort on MSI-X in cell?

On Friday, October 15, 2021 at 9:56:26 PM UTC+8 j.kiszka...@gmail.com wrote:

> On 15.10.21 14:25, Changming Huang wrote:
> > hi, guys,
> > I have  Arm64 platform (GIC-V3 is used) which integrates one real PCIe
> > network device.
> > This PCIe network device just supports MSI-X, and it works fine in
> > root-cell Linux.
> > I want to enable this PCIe network device in cell (cell runs Linux, too).
> > I can disable this PCIe device in root-cell by removing its node in DTS
> > file.
> > I added the PCIe network device node into cell DTS (like root-cell DTS)
> > But I got the error "MSIX alloc failed" during booting cell Linux.
> > Appreciate for the clue for this issue!
> > 
> > I checked the jailhouse source and document, and I didn't find the
> > description about the real PCIe device with MSI-X.
> > 
>
> MSI-X is tricky on ARM. The complete IRQ path, as it is also taken on
> the root cell, needs to be available in the non-root cell. By default,
> Jailhouse only manages GICD sharing. How are MSI-X vectors translated
> into interrupt numbers normally on your platform?
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5032fae9-5e5c-4526-a777-94ede22ac17an%40googlegroups.com.

------=_Part_2521_907861211.1634523213837
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MSI-X vectors translates the interrupt through its, the GIC and my network =
device DTS node in root cell:<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gic: in=
terrupt-controller@6000000 {<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;compatible=3D "arm,gic-v3";</div><div>&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;#address-cells =3D &lt;2&gt;;<=
/div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;#si=
ze-cells =3D &lt;2&gt;;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;ranges;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;reg=3D &lt;0x0 0x06000000 0 0x10000&gt;, /* GIC D=
ist */</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;0x0 0x06040000 0 0x40000&gt;; /* GIC Re=
distributor */</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;#interrupt-cells=3D &lt;3&gt;;</div><div>&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;interrupt-controller;</div><div>&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;interrupts =3D &=
lt;GIC_PPI 9 (GIC_CPU_MASK_RAW(0xf) |</div><div>&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;IRQ_TYPE_LEVEL_LOW)&gt;;=
</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i=
ts: gic-its@6020000 {</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; compatible =3D "arm,gic-v3-=
its";</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; msi-controller;</div><div>&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;re=
g =3D &lt;0x0 0x06020000 0 0x20000&gt;;/* GIC Translater */</div><div>&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;};</div><div>&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;};</div><div><br></div><div><div>&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enetc_pcie: pcie@1f0000000=
 { /* Integrated Endpoint Root Complex */</div><div>&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;compatib=
le =3D "pci-host-ecam-generic";</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reg =3D &lt;0x01 0=
xf0000000 0x0 0x100000&gt;;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;#address-cells =3D &lt=
;3&gt;;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;#size-cells =3D &lt;2&gt;;</div><div>&nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;msi-parent =3D &lt;&amp;its&gt;;</div><div>&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;device_=
type =3D "pci";</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bus-range =3D &lt;0x0 0x0&gt;;</di=
v><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;dma-coherent;</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;msi-map =3D &l=
t;0 &amp;its 0x17 0xe&gt;;</div></div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;...</div><div>&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div><div><br=
></div><div>and I copy them all related nodes into cell DTS.</div><div><br>=
</div><div>so, I need more effort on MSI-X in cell?</div><br></div><div cla=
ss=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On Friday, Octobe=
r 15, 2021 at 9:56:26 PM UTC+8 j.kiszka...@gmail.com wrote:<br/></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px=
 solid rgb(204, 204, 204); padding-left: 1ex;">On 15.10.21 14:25, Changming=
 Huang wrote:
<br>&gt; hi, guys,
<br>&gt; I have=C2=A0 Arm64 platform (GIC-V3 is used) which integrates one =
real PCIe
<br>&gt; network device.
<br>&gt; This PCIe network device just supports MSI-X, and it works fine in
<br>&gt; root-cell Linux.
<br>&gt; I want to enable this PCIe network device in cell (cell runs Linux=
, too).
<br>&gt; I can disable this PCIe device in root-cell by removing its node i=
n DTS
<br>&gt; file.
<br>&gt; I added the PCIe network device node into cell DTS (like root-cell=
 DTS)
<br>&gt; But I got the error &quot;MSIX alloc failed&quot; during booting c=
ell Linux.
<br>&gt; Appreciate for the clue for this issue!
<br>&gt;=20
<br>&gt; I checked the jailhouse source and document, and I didn&#39;t find=
 the
<br>&gt; description about the real PCIe device with MSI-X.
<br>&gt;=20
<br>
<br>MSI-X is tricky on ARM. The complete IRQ path, as it is also taken on
<br>the root cell, needs to be available in the non-root cell. By default,
<br>Jailhouse only manages GICD sharing. How are MSI-X vectors translated
<br>into interrupt numbers normally on your platform?
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
om/d/msgid/jailhouse-dev/5032fae9-5e5c-4526-a777-94ede22ac17an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/5032fae9-5e5c-4526-a777-94ede22ac17an%40googlegroups.co=
m</a>.<br />

------=_Part_2521_907861211.1634523213837--

------=_Part_2520_1674752108.1634523213837--
