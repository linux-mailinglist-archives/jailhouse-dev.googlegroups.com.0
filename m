Return-Path: <jailhouse-dev+bncBCW4LL4WQ4PBBA4V3SFAMGQEXXCPIZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103c.google.com (mail-pj1-x103c.google.com [IPv6:2607:f8b0:4864:20::103c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBB041EE59
	for <lists+jailhouse-dev@lfdr.de>; Fri,  1 Oct 2021 15:17:57 +0200 (CEST)
Received: by mail-pj1-x103c.google.com with SMTP id o4-20020a17090a5b0400b0019f76ac2577sf1241889pji.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 01 Oct 2021 06:17:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1633094275; cv=pass;
        d=google.com; s=arc-20160816;
        b=nrZGCHTu44IulgOu0uaavGtb50XWTPzlwG5ACzXHQx/tWLLZcjM6jGd1nVffRm7Xxr
         n3IHhDMuF35bz5z5bOHovFz2qoAsWswcnnJREqpFSlf7BQj0qkPYW67HBl2O7looa1qo
         jBVtn9Hxfq0t54m5qlUtGaiDVbtU5iyha76/PwRCW7cXzU7FkzU/sjx1JqPWFQAFijFn
         AR/9vB9o+KHcTGPJ4lsM0OkxzjX1pJ7B9b9gbTMX2/l4IqV2nNpimOM4o0wZd1Hqr+n+
         bWGEY8P2g5vktyQSnMhlQwP+6kEcPnDGUIVbDfMb/UXsmRsV6+lbQ3ikKaIk2IGXhMQm
         n/7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=SA2snGE6JqABXoE6FzQ4nnV3Hv8/7+5CXks5q8WOKZs=;
        b=AuLxyS34BSfRHmTyb+X95Qh5mNi54MgQTKFgwqnKRlNriSAonO+U6yBgAOOjeYL9c6
         gKX5OKQrAoYTipqtd/zlaM1E7gpGjjH848RZqWLlb7loeaZMJwFy+lHSYHOxVrq3RRuR
         GitOq9437lmXjKVbMgB3J/p/Tj3drWZhvrdU+7ap/RMf/q1j1Flva7E607n9bxU40URv
         qpRqeMe7B5/3AeUcYX/+h39kCvH4Tr/pko72HoNYz4c4q8UwF3wVfoyDsypIlqj7yaIH
         81W5ir/CbmAWuMNgSRgFnUgI0qslWYI9K7tRHDRLnOaXlCYVqGnnW5mi8n3Ii6XGMfzr
         xwtw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=hUqxgvyo;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::235 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SA2snGE6JqABXoE6FzQ4nnV3Hv8/7+5CXks5q8WOKZs=;
        b=kws0TEDO49Ie0Yl+zFl/eZu8AHpbeQHeyNpVguxfKpyFIQ6iDb4Cljxt+ojfo7IF3O
         Op6o1o8yx9SdkIEKzZdcxCSlZofOVzKkxc4ymJ/syKoLsnhHpYYhrkrSNf/cFa8nU/Xs
         EKKXFdQgSu5paVu69jtOEyIV4cwv2lbKC+7zVmVeheJCu0QhXTnFq6OkjO80lfV8JHen
         fX3z3/W+pmkqBFHm+MpJo2M46xxhiH+FarM3FzwztEtnXZ2M7q5245tq7gkX7eiGa5eL
         5aF7y0SjiwmncHJKMdr//BRIyYq8f+iWVU+DlFtaW//CRtWDiX6EkKJO2NBwfJBELRU4
         TDDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SA2snGE6JqABXoE6FzQ4nnV3Hv8/7+5CXks5q8WOKZs=;
        b=Cm65gU/5L16Ipu/KuRe3gDSm3S2zOArrlNA7fBRXQyGUrE4m7S7K6L375Tfzm2eJXF
         QRcdJITMKCqmYesAVvSzVBgNcXbi014+y+WIbFxiW8YirVJ+lXDNUWt8OKAdV2lFepHi
         PCzPjikPCcuw+Dml6NrNdhVukAVuluvaxSU9H3NUc3Whbo36EV11SfJ5zTDKzIPc5Tc/
         onzBVILMoOjsAB40+6Xbi43cZUyzAVnLB/QDB0ztanO51Hh5Jso13Kgj4k9sKmsIBn3/
         r/cXw0/fcjiMGJUJoxrCfw8++fikt+zmPPGhmvFFrwL3PbuBpqbQpUfWmap508CcW+k3
         pAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SA2snGE6JqABXoE6FzQ4nnV3Hv8/7+5CXks5q8WOKZs=;
        b=z4F09TCAMzP/HM6ojYZ56Xrqg+4h7bEvI/m6TK8XE18PnTFfdsoW8Fwt7do0sc6Yb8
         0KCkAloZfC8Dth7b4tVdZSj/QB0JtDi7jj5VshyX30L3AnPCRsJot+CQQ99+zPmDiycg
         cGszEZqDYRi3115nKwBcWHlrNPYuJcxdo4Lkz1Mi8zQZGNSvnjcTl5rk2tW7gx+v8OMb
         Z7EFlb31nj5UP1lLjlPlDDGJIjmkzXmmN0u/vIqr9JpuiVtJbzix1FdOupu04zTkUmLw
         uJUcvQpaDZhC7VQ925TkdcYLLp+9xI7ExyOYd28m5gpbmmIujPetN6sWviLTBdQhb0SK
         VMJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530pOnmTTNnbjqIjr10FsbiD0KxrLPrAFx/XYj53Ms1YdRvgysiI
	5Kl00ZYKs925OEzdRQwR7nY=
X-Google-Smtp-Source: ABdhPJxf53nDqsEiiOHHwwsYvG7BWtv6uUs3smh8wIzHfxqs4yMb4GJyvRkk+dk4mX/VV7n6mS/UUQ==
X-Received: by 2002:a65:5c85:: with SMTP id a5mr9757488pgt.126.1633094275157;
        Fri, 01 Oct 2021 06:17:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:a409:: with SMTP id p9ls5477484plq.3.gmail; Fri, 01
 Oct 2021 06:17:54 -0700 (PDT)
X-Received: by 2002:a17:90b:224b:: with SMTP id hk11mr19549014pjb.231.1633094274378;
        Fri, 01 Oct 2021 06:17:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633094274; cv=none;
        d=google.com; s=arc-20160816;
        b=hmmkalq1ed2na4z8elNlp9tqJjuJnuR4OVchhwrujGLk09lmQexEMBSk5rPC26P0eU
         oed4PDprnO0xmk8fvjxN6epBhczmDO4fKm3bhnHZ17Ev2+IMC/0lvzt2EXAXetaxMRix
         OAkYcco0ZNQuiB+NiWMEb9Ro3YRZeC79SHs4mUBGG/R5q2CuDNw++/uHBNcTNN0/YSIg
         UBtNHZJUpxw82LSRSXOHGKlYDgHSWAIKRalnv5Y9loSXzMpDI5K2DJ+1dUvRrMSICm5K
         9Qw5CsQT+idMio12HM/cNVEEi9yBmK8s3nW7YLxej25EFVgQGj0+VFKGGLvlP/er7+nh
         0SUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yaPDEv8clUObjRUPiSbgS5xYnyQAZKjl30dDl3oSKos=;
        b=hARxAa9RYk5R7V7t0cqDCiLWmTL9J/Z/K88w9IlTf3i0sZR8tX8/9uAF44tn1/K79/
         9D33bAjrEWGxM2SV15q3a/ir1UYqgTDxtJbCLGY5uh+CMxDOCN+sCcR3+8kH6N5Yt6+W
         XzsS54OIsiStW6b0HDoIY0xCM8zUy9y/RDPEvEGz/hXyWkqj3XpUgFYVtxcVWeMQ0I2Q
         onmtgbPlubQUVO74lZ/YiPbs+eaKpltzceHBHId/udHHhiVUmQiKaPEXqpexncKhXuE7
         yjJXTs12Dbhxpt4BZqny5f+xEHLcKHjkEDt85FEgAnmTOyYtJcwdahovlAvgbVS3LThe
         CobA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=hUqxgvyo;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::235 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com. [2607:f8b0:4864:20::235])
        by gmr-mx.google.com with ESMTPS id m1si183613pjv.1.2021.10.01.06.17.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 06:17:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::235 as permitted sender) client-ip=2607:f8b0:4864:20::235;
Received: by mail-oi1-x235.google.com with SMTP id w206so11406085oiw.4
        for <jailhouse-dev@googlegroups.com>; Fri, 01 Oct 2021 06:17:54 -0700 (PDT)
X-Received: by 2002:a05:6808:1494:: with SMTP id e20mr3744474oiw.28.1633094273724;
 Fri, 01 Oct 2021 06:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210930070704.2315052-1-peng.fan@oss.nxp.com> <0251aa19-a5bf-e19b-344a-92189307f46b@web.de>
In-Reply-To: <0251aa19-a5bf-e19b-344a-92189307f46b@web.de>
From: Peng Fan <van.freenix@gmail.com>
Date: Fri, 1 Oct 2021 21:17:34 +0800
Message-ID: <CAEfxd-9ieAQoDOXNETBPqp01v9ZN6uZG9PTdaerob1_X9W87BQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm: gic-v3: clear SGI GICR active flag
To: Jan Kiszka <jan.kiszka@web.de>
Cc: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, 
	jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000011f26905cd4a648d"
X-Original-Sender: Van.Freenix@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=hUqxgvyo;       spf=pass
 (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::235
 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--00000000000011f26905cd4a648d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jan Kiszka <jan.kiszka@web.de>=E4=BA=8E2021=E5=B9=B49=E6=9C=8830=E6=97=A5 =
=E5=91=A8=E5=9B=9B=E4=B8=8B=E5=8D=884:54=E5=86=99=E9=81=93=EF=BC=9A

> On 30.09.21 09:07, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > With Linux Kernel 5.15
> > commit 6abbd6988971a ("irqchip/gic, gic-v3: Make SGIs use
> handle_percpu_devid_irq()"),
> > the on_each_cpu IPI_CALL_FUNC interrupt active flag will not be cleared
> > until interrupt handler finish.
> >
> > Without Jailhouse hypervisor enabled, everything is ok, but when
> > enabling jailhouse, HCR_EL2.[FMO | IMO] is set, that means NS-EL1
> > is actually accessing ICV_DIR_EL1 when eoi_irq after enter_hypervisor
> > return. It not able to deactive the interrupt that is actually a
> > phyiscal irq which in active state.
> >
> > To ARM64, the IPI_CALL_FUNC is using SGI 1 which is same value as
> > jailhouse SGI_EVENT.
> >
> > Then the following `jailhouse cell create` will hang the system, becaus=
e
> > the previous 'SGI_EVENT' is in active state and not deactivated, so
> > the current SGI_EVENT issued not able to interrupt the target cpu core.
> >
> > To resolve this issue, let's clear the active bit of SGI_EVENT and
> > SGI_INJECT before back to Linux.
> >
> > Tested on NXP i.MX8MP-EVK
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  hypervisor/arch/arm-common/gic-v3.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/hypervisor/arch/arm-common/gic-v3.c
> b/hypervisor/arch/arm-common/gic-v3.c
> > index 03cface0..8327a95a 100644
> > --- a/hypervisor/arch/arm-common/gic-v3.c
> > +++ b/hypervisor/arch/arm-common/gic-v3.c
> > @@ -200,7 +200,7 @@ static int gicv3_cpu_init(struct per_cpu *cpu_data)
> >       unsigned long redist_addr =3D
> system_config->platform_info.arm.gicr_base;
> >       unsigned long redist_size =3D GIC_V3_REDIST_SIZE;
> >       void *redist_base =3D gicr_base;
> > -     unsigned long gicr_ispendr;
> > +     unsigned long gicr_ispendr, gicr_isacter;
> >       unsigned int n;
> >       void *gicr;
> >       u64 typer, mpidr;
> > @@ -291,6 +291,10 @@ static int gicv3_cpu_init(struct per_cpu *cpu_data=
)
> >       /* After this, the cells access the virtual interface of the GIC.
> */
> >       arm_write_sysreg(ICH_HCR_EL2, ICH_HCR_EN);
> >
> > +     /* Clear SGI active flag */
> > +     gicr_isacter =3D mmio_read32(gicr + GICR_ISACTIVER);
> > +     mmio_write32(gicr + GICR_ICACTIVER, gicr_isacter & 0xffff);
> > +
>
> Do we also have to migrate this state into the virtual GIC?


I think no need. And it will introduce complexity

Thanks,
Peng


>
> Jan
>
> >       /* Forward any pending physical SGIs to the virtual queue. */
> >       gicr_ispendr =3D mmio_read32(gicr + GICR_ISPENDR);
> >       for (n =3D 0; n < 16; n++) {
> >
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/0251aa19-a5bf-e19b-344a-9=
2189307f46b%40web.de
> .
>
--

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAEfxd-9ieAQoDOXNETBPqp01v9ZN6uZG9PTdaerob1_X9W87BQ%40mail.gm=
ail.com.

--00000000000011f26905cd4a648d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@web.de">jan.kis=
zka@web.de</a>&gt;=E4=BA=8E2021=E5=B9=B49=E6=9C=8830=E6=97=A5 =E5=91=A8=E5=
=9B=9B=E4=B8=8B=E5=8D=884:54=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">On 30.09.21 09:07, Peng Fan (OSS) wrote:<br>
&gt; From: Peng Fan &lt;<a href=3D"mailto:peng.fan@nxp.com" target=3D"_blan=
k">peng.fan@nxp.com</a>&gt;<br>
&gt;<br>
&gt; With Linux Kernel 5.15<br>
&gt; commit 6abbd6988971a (&quot;irqchip/gic, gic-v3: Make SGIs use handle_=
percpu_devid_irq()&quot;),<br>
&gt; the on_each_cpu IPI_CALL_FUNC interrupt active flag will not be cleare=
d<br>
&gt; until interrupt handler finish.<br>
&gt;<br>
&gt; Without Jailhouse hypervisor enabled, everything is ok, but when<br>
&gt; enabling jailhouse, HCR_EL2.[FMO | IMO] is set, that means NS-EL1<br>
&gt; is actually accessing ICV_DIR_EL1 when eoi_irq after enter_hypervisor<=
br>
&gt; return. It not able to deactive the interrupt that is actually a<br>
&gt; phyiscal irq which in active state.<br>
&gt;<br>
&gt; To ARM64, the IPI_CALL_FUNC is using SGI 1 which is same value as<br>
&gt; jailhouse SGI_EVENT.<br>
&gt;<br>
&gt; Then the following `jailhouse cell create` will hang the system, becau=
se<br>
&gt; the previous &#39;SGI_EVENT&#39; is in active state and not deactivate=
d, so<br>
&gt; the current SGI_EVENT issued not able to interrupt the target cpu core=
.<br>
&gt;<br>
&gt; To resolve this issue, let&#39;s clear the active bit of SGI_EVENT and=
<br>
&gt; SGI_INJECT before back to Linux.<br>
&gt;<br>
&gt; Tested on NXP i.MX8MP-EVK<br>
&gt;<br>
&gt; Signed-off-by: Peng Fan &lt;<a href=3D"mailto:peng.fan@nxp.com" target=
=3D"_blank">peng.fan@nxp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hypervisor/arch/arm-common/gic-v3.c | 6 +++++-<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm=
-common/gic-v3.c<br>
&gt; index 03cface0..8327a95a 100644<br>
&gt; --- a/hypervisor/arch/arm-common/gic-v3.c<br>
&gt; +++ b/hypervisor/arch/arm-common/gic-v3.c<br>
&gt; @@ -200,7 +200,7 @@ static int gicv3_cpu_init(struct per_cpu *cpu_data=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long redist_addr =3D system_config-=
&gt;platform_info.arm.gicr_base;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long redist_size =3D GIC_V3_REDIST_=
SIZE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void *redist_base =3D gicr_base;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0unsigned long gicr_ispendr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long gicr_ispendr, gicr_isacter;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int n;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void *gicr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 typer, mpidr;<br>
&gt; @@ -291,6 +291,10 @@ static int gicv3_cpu_init(struct per_cpu *cpu_dat=
a)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* After this, the cells access the virtual =
interface of the GIC. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0arm_write_sysreg(ICH_HCR_EL2, ICH_HCR_EN);<b=
r>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Clear SGI active flag */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gicr_isacter =3D mmio_read32(gicr + GICR_ISACTIVE=
R);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mmio_write32(gicr + GICR_ICACTIVER, gicr_isacter =
&amp; 0xffff);<br>
&gt; +<br>
<br>
Do we also have to migrate this state into the virtual GIC?</blockquote><di=
v dir=3D"auto"><br></div><div dir=3D"auto">I think no need. And it will int=
roduce complexity=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Thanks,</div><div dir=3D"auto">Peng</div><div dir=3D"auto"><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Jan<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Forward any pending physical SGIs to the =
virtual queue. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gicr_ispendr =3D mmio_read32(gicr + GICR_ISP=
ENDR);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for (n =3D 0; n &lt; 16; n++) {<br>
&gt;<br>
<br>
-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com" tar=
get=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0251aa19-a5bf-e19b-344a-92189307f46b%40web.de" rel=
=3D"noreferrer" target=3D"_blank">https://groups.google.com/d/msgid/jailhou=
se-dev/0251aa19-a5bf-e19b-344a-92189307f46b%40web.de</a>.<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAEfxd-9ieAQoDOXNETBPqp01v9ZN6uZG9PTdaerob1_X9W87B=
Q%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAEfxd-9ieAQoDOXNETBPqp01v9ZN6uZG9PTdaerob1=
_X9W87BQ%40mail.gmail.com</a>.<br />

--00000000000011f26905cd4a648d--
