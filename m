Return-Path: <jailhouse-dev+bncBCW4LL4WQ4PBBREV3SFAMGQEMI24DJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33a.google.com (mail-ot1-x33a.google.com [IPv6:2607:f8b0:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 7741D41EE66
	for <lists+jailhouse-dev@lfdr.de>; Fri,  1 Oct 2021 15:19:03 +0200 (CEST)
Received: by mail-ot1-x33a.google.com with SMTP id 76-20020a9d0152000000b0053b372910bbsf6588791otu.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 01 Oct 2021 06:19:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1633094342; cv=pass;
        d=google.com; s=arc-20160816;
        b=YecQvrs5gziHMKRIbfcsdmHIwBaxMZogYG/QAfSlfnC203v6rkbcoRoh8Yc8j7UhCI
         T342MEQI23HOhh/NXTv4Ue3ecuVVlGayXY/EQWfm+EAGpwAEl5QmqnfKhn+J2dVoyLq4
         e0q/bZ5X+2c/OThicSZJUJJVoEmZ0dacBA/iWgtYUrE+cirQHS8wBCTVZg9YM8H/rjMa
         KxbbaVErm0/D6yLUIIIwpLDKyUBQX/JJD23xEIYAz96WST5u5Frj5uR3UDjMuI+OAUDI
         JjufjLNM62SDAppnItGSnsAmdyx/0QvfxIL+awRYnkwZVrYZEFB6Rauf2fo5XC9gmIHS
         DCeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=KGDYSa5R9PiBHGOA04bGz8lXbsTXYSZuDvTUS8mbBeE=;
        b=m85VH58OW/631lPtithNK0EzlFxzQnpKAY/Jmu5rFu/xsz9veHghXA/ehhBkHZWP+J
         A0KTy+PbeD8RGphfTWF02z3dfHRbejy5WTgnFXfTi1U3Chnd/fiEodJWS6YVaD1m/wj5
         XjqEI0AIHlKGcbeF88BkkKVV302liEVGEPC82Yt2f2+gLFJnn1lLfhCXtacxZXVWRxNl
         MuSMtuguC4w8Nds/FNn4hAUxue1ZQbure3B4PvObIw3QIsw+KS3lRPVRAGB9v87llcoH
         TCFCOSkurukPD4qvUNqo2hPTD4L4/QIyDD+dNhJLm3Y6I8QbTTtAwa6BinwkZ+AjMW3y
         PocQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=DzUWcR5n;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::330 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KGDYSa5R9PiBHGOA04bGz8lXbsTXYSZuDvTUS8mbBeE=;
        b=Jh0AQlXrL5nb1eR3zbnnaj5U53CvMl2zYyuAKT3ZwASGirGlGz1/yUHFKx/rMnhTvL
         mfEARGamRrgYzUUEZ5nrg6LEUYWzMUZc7lSuuJeyAR8N3hzKKQeooCDa+ZeHZ5bE0RvE
         SpxeHtjG29Bf49FotomG+3apQDuo0w+Ip56SsXB8W3FZXUqFXTKw8E21KHRpd1WhF8mI
         rRpm3/8WUcpJwz/gPOs38EoZ4GFfo4kNAyeVbdyn62RDDoIj+aa1oVyozeLAPyrbNtQC
         eM1UUF+fNYoKud0QjOk/2OLfzgCCUINhocFhnAChhVVCrkOwC20VrTu2RtZQ0kXfkF00
         03Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KGDYSa5R9PiBHGOA04bGz8lXbsTXYSZuDvTUS8mbBeE=;
        b=ePQ9f8t+SoL770HRA9X68EY5/SmfrHBhV6H2CZIq69XVCKLtdtE8l70plhhfG7FpAW
         JupgKCvi1fXYyCimA3LLeM6GCFCI8u+xpSBj3+68rTHrXJlMJiOAKcrSxFk0pdsy4jgz
         tEeg1z4c3qEUuZg/MbrYOTHu59Rsnj1UumZbHiRl3c/BTd4kgV2q7JIvK5+ZKzK5Op6N
         S73tysmSwOKyBhS1jAz93PZ022+eBpq3SqMs4AImMrn4BHjCpJH7yI37+JE3wzitYQzv
         7mAhCIIyQ834YUGMfmj/kpv6S40zUoAkfAfdtz7bQHhU0gKqG2QRd8t56s4jG3sCInOf
         UpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KGDYSa5R9PiBHGOA04bGz8lXbsTXYSZuDvTUS8mbBeE=;
        b=7SQEgd3WU+k/qls6cx6q5+tKirhSDnmu1oG0BfZle25Qa7ZH36wH+28uMsRSCb5JV+
         dAKCEDxzryTPLzZ1E8on4XNeZERH3VuVyF5Ti6e7nLkhRXrqieoFlDZM59xsB++SfgJG
         guCaAcQhYmDjOigfCOGZC4dmU64fWkRTcB2MNqZOdKy1Z6N1vw5RagB77nsuAirLXd+C
         /k9JSfpsfxvHYaoIUNFEsAzWu3Lxl11RsJjursDWeYIwQZDAoKUlrjUGJUTj7LOASsdY
         hdaYIJsqejViBCMlbyZ9rAR2YxuPgBTmt5g4L1hzLf28S4On7f8UWTnXHrG4YrPqPExz
         wQkA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531LiWBO4t+hh162PxcbORAR2T6uLdsdkO2tYji8rbcpF9a6m+rz
	aCxsjYClX/UsJg9cZWiDVao=
X-Google-Smtp-Source: ABdhPJxcSGsPCZn28vkNAV91SobURK61pY/TElf4VKc/RB/LVt5UqIaI+J5XsKlm5RScHnJtVSr7pw==
X-Received: by 2002:a9d:192c:: with SMTP id j44mr10069918ota.302.1633094340464;
        Fri, 01 Oct 2021 06:19:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:39c1:: with SMTP id g184ls3015582oia.8.gmail; Fri, 01
 Oct 2021 06:19:00 -0700 (PDT)
X-Received: by 2002:a05:6808:148d:: with SMTP id e13mr3886153oiw.20.1633094339938;
        Fri, 01 Oct 2021 06:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633094339; cv=none;
        d=google.com; s=arc-20160816;
        b=ycvfiAOLmmcgAbfCDrojQkDw+t2Ap5ll8gFWzyFypKBObUkG1Qevb9oBXGFEYcYwi5
         faIU3mJttwASiwUrxUE9SzBZafMQe4KdWtqVH/AQ+tzXMPQpC2X7RnM1sOuAmo5VBmdG
         HsEJ8v7EPMY01zmyzpwczbDAHu8V/hIQRmx4PcHYbiSpypLJI5Kq0SVMes640MYjEaVd
         1T5FuDXwgnrTBOyq8dVIK8AJh7DFLFFjdhMtdqlFCyzzkerkI1HLt3/CeYIZbnms24nN
         rWB2AuR2fwsi2Cpk2V92oMnHmY0xPKoqHU4kR9quqfEHivQubhIljLUmqfmPrtxyhl/q
         IX9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ni02w/UUs6PvREZOE3jOKW7hO4rV2ykP/PYLeqCZYTs=;
        b=S3m06GHB+RoKk0LIbGbaljJL4kQbc6s+//gFhmnZrO8BWeHjOZh5aRs6ZS2CYosZ/i
         uq5vVZC8d1ezoh6xS8QyuQSwHtaopsa/U52nGqwQiqYIhmrNJ41WMoP5VKdIHwoO6BZU
         z7rP/7ttu7mPT+a3gg+nln7Mu9P5m429s8ScjYL1R16aseiPVL5iEcPb85gD6ew1xmLW
         l/v5XFtobBl86HMx9klV4jr/+FB/plmTHuzxsEbCVstJys/HHTuXvg7F4z1mpKRINxmE
         TbEh2g8L11f9LbHmG66U+swwvNT/CvQAqSg3fCD70PLiuz+9I0iEEwMstg6DRhwAgGof
         X5zQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=DzUWcR5n;
       spf=pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::330 as permitted sender) smtp.mailfrom=van.freenix@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com. [2607:f8b0:4864:20::330])
        by gmr-mx.google.com with ESMTPS id g5si787414oos.0.2021.10.01.06.18.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 06:18:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::330 as permitted sender) client-ip=2607:f8b0:4864:20::330;
Received: by mail-ot1-x330.google.com with SMTP id r43-20020a05683044ab00b0054716b40005so11421337otv.4
        for <jailhouse-dev@googlegroups.com>; Fri, 01 Oct 2021 06:18:59 -0700 (PDT)
X-Received: by 2002:a9d:1910:: with SMTP id j16mr9830652ota.225.1633094338269;
 Fri, 01 Oct 2021 06:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210930070704.2315052-1-peng.fan@oss.nxp.com>
 <20210930070704.2315052-2-peng.fan@oss.nxp.com> <de40c4af-207c-f96a-9acf-7b2a33d38957@web.de>
 <942722a3-4e4e-c797-42d5-31488a063990@linutronix.de>
In-Reply-To: <942722a3-4e4e-c797-42d5-31488a063990@linutronix.de>
From: Peng Fan <van.freenix@gmail.com>
Date: Fri, 1 Oct 2021 21:18:45 +0800
Message-ID: <CAEfxd--sehdD0APrvF6GE0LbL3jAs2d+-nqM3Kg5h9=dWhYRnA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm: gic-v2: clear SGI GICD active flag
To: Martin Kaistra <martin.kaistra@linutronix.de>
Cc: Jan Kiszka <jan.kiszka@web.de>, Peng Fan <peng.fan@nxp.com>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000ead41f05cd4a6718"
X-Original-Sender: Van.Freenix@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=DzUWcR5n;       spf=pass
 (google.com: domain of van.freenix@gmail.com designates 2607:f8b0:4864:20::330
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

--000000000000ead41f05cd4a6718
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You could check whether IPI Call func work or not after jailhouse enabled
without my patch.

Thanks,
Peng

Martin Kaistra <martin.kaistra@linutronix.de>=E4=BA=8E2021=E5=B9=B49=E6=9C=
=8830=E6=97=A5 =E5=91=A8=E5=9B=9B=E4=B8=8B=E5=8D=885:12=E5=86=99=E9=81=93=
=EF=BC=9A

> Am 30.09.21 um 10:53 schrieb Jan Kiszka:
> > On 30.09.21 09:07, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >>
> >> With Linux Kernel 5.15
> >> commit 6abbd6988971a ("irqchip/gic, gic-v3: Make SGIs use
> handle_percpu_devid_irq()"),
> >> the on_each_cpu IPI_CALL_FUNC interrupt active flag will not be cleare=
d
> >> until interrupt handler finish.
> >>
> >> Without Jailhouse hypervisor enabled, everything is ok, but when
> >> enabling jailhouse, HCR_EL2.[FMO | IMO] is set, that means NS-EL1
> >> is actually accessing GICV_DIR when eoi_irq after enter_hypervisor
> >> return. It not able to deactive the interrupt that is actually a
> >> phyiscal irq which in active state.
> >>
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>
> >> Note:
> >>   Not tested on Hardware.
> >>
> >>   hypervisor/arch/arm-common/gic-v2.c | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/hypervisor/arch/arm-common/gic-v2.c
> b/hypervisor/arch/arm-common/gic-v2.c
> >> index 31371de9..8a9f6201 100644
> >> --- a/hypervisor/arch/arm-common/gic-v2.c
> >> +++ b/hypervisor/arch/arm-common/gic-v2.c
> >> @@ -101,6 +101,7 @@ static int gicv2_cpu_init(struct per_cpu *cpu_data=
)
> >>      unsigned int mnt_irq =3D
> system_config->platform_info.arm.maintenance_irq;
> >>      u32 vtr, vmcr;
> >>      u32 cell_gicc_ctlr, cell_gicc_pmr;
> >> +    u32 gicd_isacter;
> >>      unsigned int n;
> >>
> >>      /*
> >> @@ -168,6 +169,10 @@ static int gicv2_cpu_init(struct per_cpu *cpu_dat=
a)
> >>
> >>      cpu_data->public.gicc_initialized =3D true;
> >>
> >> +    /* Deactivate all active SGIs */
> >> +    gicd_isacter =3D mmio_read32(gicd_base + GICD_ISACTIVER);
> >> +    mmio_write32(gicd_base + GICD_ICACTIVER, gicd_isacter & 0xffff);
> >> +
> >>      /*
> >>       * Forward any pending physical SGIs to the virtual queue.
> >>       * We will convert them into self-inject SGIs, ignoring the
> original
> >>
> >
> > Martin, could this be the issue you are seeing? Are you already using
> 5.15?
> >
> > Jan
> >
>
> Hi Jan,
>
> I am currently running some tests with this patch and it looks
> promising. I have not been able to reproduce the issue so far.
>
> I am not using 5.15, but the mentioned commit 6abbd6988971a is also
> present as a cherry-pick in the xilinx-v2021.1 kernel, that I use.
>
> Thanks,
> Martin
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/942722a3-4e4e-c797-42d5-3=
1488a063990%40linutronix.de
> .
>
--

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAEfxd--sehdD0APrvF6GE0LbL3jAs2d%2B-nqM3Kg5h9%3DdWhYRnA%40mai=
l.gmail.com.

--000000000000ead41f05cd4a6718
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">You could check whether IPI Call func work or not after j=
ailhouse enabled without my patch.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Thanks,</div><div dir=3D"auto">Peng</div><div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Martin Kaistra &lt;<a hr=
ef=3D"mailto:martin.kaistra@linutronix.de">martin.kaistra@linutronix.de</a>=
&gt;=E4=BA=8E2021=E5=B9=B49=E6=9C=8830=E6=97=A5 =E5=91=A8=E5=9B=9B=E4=B8=8B=
=E5=8D=885:12=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">Am 30.09.21 um 10:53 schrieb Jan Kiszka:<br>
&gt; On 30.09.21 09:07, Peng Fan (OSS) wrote:<br>
&gt;&gt; From: Peng Fan &lt;<a href=3D"mailto:peng.fan@nxp.com" target=3D"_=
blank">peng.fan@nxp.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; With Linux Kernel 5.15<br>
&gt;&gt; commit 6abbd6988971a (&quot;irqchip/gic, gic-v3: Make SGIs use han=
dle_percpu_devid_irq()&quot;),<br>
&gt;&gt; the on_each_cpu IPI_CALL_FUNC interrupt active flag will not be cl=
eared<br>
&gt;&gt; until interrupt handler finish.<br>
&gt;&gt;<br>
&gt;&gt; Without Jailhouse hypervisor enabled, everything is ok, but when<b=
r>
&gt;&gt; enabling jailhouse, HCR_EL2.[FMO | IMO] is set, that means NS-EL1<=
br>
&gt;&gt; is actually accessing GICV_DIR when eoi_irq after enter_hypervisor=
<br>
&gt;&gt; return. It not able to deactive the interrupt that is actually a<b=
r>
&gt;&gt; phyiscal irq which in active state.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Peng Fan &lt;<a href=3D"mailto:peng.fan@nxp.com" ta=
rget=3D"_blank">peng.fan@nxp.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;<br>
&gt;&gt; Note:<br>
&gt;&gt;=C2=A0 =C2=A0Not tested on Hardware.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0hypervisor/arch/arm-common/gic-v2.c | 5 +++++<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch=
/arm-common/gic-v2.c<br>
&gt;&gt; index 31371de9..8a9f6201 100644<br>
&gt;&gt; --- a/hypervisor/arch/arm-common/gic-v2.c<br>
&gt;&gt; +++ b/hypervisor/arch/arm-common/gic-v2.c<br>
&gt;&gt; @@ -101,6 +101,7 @@ static int gicv2_cpu_init(struct per_cpu *cpu_=
data)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int mnt_irq =3D system_config-&gt;pla=
tform_info.arm.maintenance_irq;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 u32 vtr, vmcr;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 u32 cell_gicc_ctlr, cell_gicc_pmr;<br>
&gt;&gt; +=C2=A0 =C2=A0 u32 gicd_isacter;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int n;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt; @@ -168,6 +169,10 @@ static int gicv2_cpu_init(struct per_cpu *cpu=
_data)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 cpu_data-&gt;public.gicc_initialized =3D true;=
<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Deactivate all active SGIs */<br>
&gt;&gt; +=C2=A0 =C2=A0 gicd_isacter =3D mmio_read32(gicd_base + GICD_ISACT=
IVER);<br>
&gt;&gt; +=C2=A0 =C2=A0 mmio_write32(gicd_base + GICD_ICACTIVER, gicd_isact=
er &amp; 0xffff);<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Forward any pending physical SGIs to t=
he virtual queue.<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* We will convert them into self-inject =
SGIs, ignoring the original<br>
&gt;&gt;<br>
&gt; <br>
&gt; Martin, could this be the issue you are seeing? Are you already using =
5.15?<br>
&gt; <br>
&gt; Jan<br>
&gt; <br>
<br>
Hi Jan,<br>
<br>
I am currently running some tests with this patch and it looks <br>
promising. I have not been able to reproduce the issue so far.<br>
<br>
I am not using 5.15, but the mentioned commit 6abbd6988971a is also <br>
present as a cherry-pick in the xilinx-v2021.1 kernel, that I use.<br>
<br>
Thanks,<br>
Martin<br>
<br>
-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com" tar=
get=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/942722a3-4e4e-c797-42d5-31488a063990%40linutronix.=
de" rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/d/msgid/=
jailhouse-dev/942722a3-4e4e-c797-42d5-31488a063990%40linutronix.de</a>.<br>
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
om/d/msgid/jailhouse-dev/CAEfxd--sehdD0APrvF6GE0LbL3jAs2d%2B-nqM3Kg5h9%3DdW=
hYRnA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAEfxd--sehdD0APrvF6GE0LbL3jAs2d%2B-nqM=
3Kg5h9%3DdWhYRnA%40mail.gmail.com</a>.<br />

--000000000000ead41f05cd4a6718--
