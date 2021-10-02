Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB76A4CFAMGQE7KEGMQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB7641FA80
	for <lists+jailhouse-dev@lfdr.de>; Sat,  2 Oct 2021 11:03:59 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id 200-20020a1c00d1000000b0030b3dce20e1sf7109384wma.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 02 Oct 2021 02:03:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1633165439; cv=pass;
        d=google.com; s=arc-20160816;
        b=rT/3VUo2WCt01f7NkmO6bafmysLO5lt++yaVUdUw92IHHCG7ZLRFVohPxYE2g4mhkt
         Tq7/CGfFRlqDdEucGI47bc3hkAiEkLS4xXSSQWbN6wBx/eJ3gVpUHQrHsQIf/oskXTfv
         cEJvONIk1Pj/dLc2IqSThfO/IWUf6/BuVJ430y+SPBSzMVxiOWN/Hl4VC/vxSx4dVIF2
         4j3tMYhmCFKg2MEmGGU8UGU5JY3m+s0AECIsbEmU1S35dE/3ZQMjjL45/iEmpChhCI4E
         xn4PjkKFzXQ1lCi8MKy78I+u5gRfuSuL1Qqw/g9fvWKQGV9SjtjpE3LZ5JfDPaCMkKVT
         XNTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=4BNsPKNRynTS0PeFOrBA0il2GYDpswvj5zJ0+xggPS4=;
        b=EdU+TnYfuGFBs75k5OrUPIHYKW2Xo92JY0Jva9+5i+mc+ZOSlJgmRhrF6G4+nA/bAg
         wOxtaowRjB+Pgnt6+KXhNoCCyi/5k69LtEHEMBgmIgCRmYKpJ9Gcn/31uqaY3IOvcyhj
         kiiDvRjeNOCUUKXoaVjI0mVakc/kElW9vcDwkzRjmV08NNXa7C4Vx+OX7qsyWmH1twmr
         7XVGc7GIPlaCRqsCUGkMefkuBe9l380xL5q2PBighdkhqsG6aFu6bRf1UKBqjbaHnIMr
         esZAMJxbiBzOdfZFx+hhv/aQ2zhSPgF3d0ABCZlbfbImJjtjcWWYqXX0zgxzitgSmZTI
         MXfw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=PkQL2Xhu;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4BNsPKNRynTS0PeFOrBA0il2GYDpswvj5zJ0+xggPS4=;
        b=BCGaQ0a/vjRUPBQUbG9LBNFlHmkNq4bJo6Qtt1qQqpT7uVWj7K/JJ7PoPw9pD8WCo9
         7Re2n/ecYfjRRBE7OYWpVe/m5qvPL36CGfEZxuZRDt6VWjeAISd82ndS6cBNiMrp2rLT
         bFJ4gqJhDWPFw/xDBUMa1x0vmzBGYk9jt9uwCcDamvuJpI9KUJ5H0O2iE1Ow1bPTG5Fh
         5kwUkbSMCfProoISpdhHT0BlM+PwYBxdcGe0wxg7f2tgauwVQZMnt9iAILw+X6FQGoot
         Bj5rHvaJXFuFYaOMgWPahTiAP2X/uBbmQGdabUk44PjuyVCu52YX1C3ryswLxsQPUsI5
         uRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4BNsPKNRynTS0PeFOrBA0il2GYDpswvj5zJ0+xggPS4=;
        b=XUHDPk09yvZ+8HV8n02iEb6DJqG75uUhyHgxrgd0H9KLHsBDdgck/hmog5wmv0+cCD
         7b3dPIoa+hlOAmi3780mnYql/udd5PY8eEA8LMGOcG4+get61TAvSChSgm/Nyzm0yZ5n
         e2npVcr2P95aZL6Pf1aNu/129XB71o/ABJRcj1+J9px2NLVf3LVPmJa+sH5hmZ2ZQYxt
         bbnUh83wRVnobMAw0NGDRJClqWpNh8Is39vCje5iJjNybHadeGp7/jNv89BUKtCRcbZ6
         5v/S3Fbjw+0qz+S5vyGrH30BaIP2js1zI4V+B6D2uBp3D8qhG575k9+FYjO+wzBX6buR
         RPVw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531C8JNbTKTeHK0FUtv+EXYTOUJjP/uVp3OElj+qC0CnlwEbdsM6
	56u75zXxK5LYqE28umxe7Uk=
X-Google-Smtp-Source: ABdhPJwVblwMNnrK/QISwP1WSOFDtdmfgz7BsUVZBnofmrYcjcewMP4Y3XPFJb8muqpRYnEdd802Vw==
X-Received: by 2002:a05:600c:649:: with SMTP id p9mr3092495wmm.126.1633165439627;
        Sat, 02 Oct 2021 02:03:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c782:: with SMTP id l2ls17298240wrg.2.gmail; Sat, 02 Oct
 2021 02:03:58 -0700 (PDT)
X-Received: by 2002:adf:9796:: with SMTP id s22mr2385136wrb.224.1633165438721;
        Sat, 02 Oct 2021 02:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633165438; cv=none;
        d=google.com; s=arc-20160816;
        b=roYchxD9YhLY+hjZScErs4desYGcooaC8c24aQ5lnsujf/lLM3epTRpeCDp0ibJ752
         uUDTT5S7nUa3p8q/PgOGvjdgkNU3N5g1kVOEI3KKmpyhZYZ/fWnfAQSUuRtWxk5GYK4S
         SbAyo+nTnv/dGpOYKPLLu+rfJq9jMPFNeAqJf7EGAUpFFEiopRtK8X4BkAhErrJimlvQ
         /1BZKzgXjQVwBvkNMBXiBM4nkg2ztfs6xpQV+hjVa+KHWMEAIVrvSH2tEkAm7oWAkrIm
         Ds1DH4hysq2HoHOUL4mm3Y+8lGh8Wi0uqgSTsTZXMfOqE17tk54vn4l7tPQCoIw94Qlo
         dQ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=aVGoy30E+GlRp/YWW4tpqR4b/DnLTj9K/Qq689w0pQ0=;
        b=KndnNhoqVL5nQhar/JqkCbZt4AUabegEdSIwM3s3g9uPJea/v2Vz6/SbNzU5btS8cw
         /uqEg7zrx9sNx6RjZrwkr8RMm3dKmmzpnJvI71Sln2Qsr+zSJ7vvY1tzWcgji0J4B8Fi
         jt4SozbsGK1dlQCyadlw3rJ1ToYqSzorjc0IWQaEzFP3+BuDYDASGob2bZwmzrldDhU2
         Tzy5aGAmMLe/wIuLe0EvPJoFFCX1HZZ6Ez9JYAk+zeBKFBrv8V/gDMpYSmCyoax8pXrg
         C1ErVM35rOuhx59QeNZtCJFSONC+gOxFEvQJVr47djjC3lp9K2DmfPKF9QOi//NXLyQo
         QH4w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=PkQL2Xhu;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id p3si448756wrg.2.2021.10.02.02.03.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 02:03:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [167.87.72.126] ([88.215.84.132]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MFt3u-1mcdKd1iAY-00Eujj; Sat, 02
 Oct 2021 11:03:57 +0200
Subject: Re: [PATCH 1/2] arm: gic-v3: clear SGI GICR active flag
To: Peng Fan <van.freenix@gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 jailhouse-dev@googlegroups.com
References: <20210930070704.2315052-1-peng.fan@oss.nxp.com>
 <0251aa19-a5bf-e19b-344a-92189307f46b@web.de>
 <CAEfxd-9ieAQoDOXNETBPqp01v9ZN6uZG9PTdaerob1_X9W87BQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <017d4c43-657e-fb64-da41-9dfaceff48e7@web.de>
Date: Sat, 2 Oct 2021 11:03:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAEfxd-9ieAQoDOXNETBPqp01v9ZN6uZG9PTdaerob1_X9W87BQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WzmaMVeJwadb7NgUYnAtL3r3Ij9kw1fnmi4b6uCIENLXe7nxOBK
 VFMoCfCMF0FP6g+yEgEESV2wFuY8hv/WFN+ywB80tQGm7J/Mq4Fjdm4vr+PzCjHVTCkxcuN
 azxpl4nkg0GC66gp43JVZB4J9VEUPW1Pyf3cqJQ3pRAkf/oa4tNJCavK1Xvi8Wkx0F7WFlU
 wuxLL2zRoAyuyEi1hfGoQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7TCnSkEk48M=:r1qoi+N/W9TO/v8MwjqoMf
 l5H2W1XzEd/TwXkUZ1d/uMHJ1heaX2qm/n0Fl/H8aIfefvymi/g89+TbIL63/pN258t5tKhtG
 qTPo86b5WQSsBwhinz2aXvT0WDZlDI1E7ZQ4TChQAOAatqCriw3Wq+X3ilPDeqjXr/AnmjF5U
 DjAuQLt/U5rJlS54c+nUpDsop4IbmsNU4omQxwevdhdzrVahQPxLDH+x4IufwL/bp5X3ytWSq
 Yjfr2tw8ijHgw6pkKWDXvPzuj0rEZhglvfMPswzVdzkWUx04Z4XqVVDqe9enh60L6/yW1Zbwu
 scx8OgcApD6lEIuTaIjuLoGzWCVgMaKQR7t8ZElUWckKfpGLfuxpmDKT6/f/QpISMNWjwgWY4
 cBCerstq+M8dXg+dC/pfbURjrj7z/u1A+BaIh8ji3AY2iVAoh2IwJC7mODszwd4o8ZmHjb9Zh
 xVDyTmudrM6nqik2HwGb5IidRaZMdnEopHAUDjidVxTwJHTPb3ZVyBFszAFQmxJLXWqBnbueW
 ecCjYWF1ihsQ5OZiQPf9JuZjuUyc694f0o7tTcnr8JvO7A4o7PuxOLkFjkn9aLh27xcGGGSRl
 kPJWY30Jwsi84S9UjdULdnANHH7+EZ+tUd96cDAwAZf4D9tBpzUaLl8Aee3qzevmy/mA+xokE
 XZdDXPk5Io0cd5JD/Tg/vN4AniMP8ocfvRo0R7A0stO8zUncW6pbXCoSO4JYjAC7EVeFSp/Tf
 BcOb/JNnunqRYOmZ+i1+em3yoPtOEHKIuRgokUlUS6vpjYFgmE2N/ytGLEmDIJOqTyzUcIaCx
 rsrRYEGRSSojKyibawV1k47+rojr/kw6EWOCSmXNs7serb8go4O+v1WoBedtqFWj7ruuITiQD
 ZIxaJR/nyyBxPijTZFVLHtyiC2sv6o5XdBlGtXetxDmi04uroYKJyd5AlddljR7Q8sSkQTcRV
 Yr2eSKCL/wHT00H0+TWyTklECJ2+953PM9tvSZtCa2Yu1HoB/VPe1zytNOZ4jd/MAYzmDXxw+
 IY5MPVMU5N9Xs2an6NfdPOxyAMtgzLc7c2gMjUjAGc90AhA1AtEwwaxvegVWwUcWs37A9bmmo
 mw8NImoBwzH7FQ=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=PkQL2Xhu;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 01.10.21 15:17, Peng Fan wrote:
>
>
> Jan Kiszka <jan.kiszka@web.de <mailto:jan.kiszka@web.de>>=E4=BA=8E2021=E5=
=B9=B49=E6=9C=8830=E6=97=A5
> =E5=91=A8=E5=9B=9B=E4=B8=8B=E5=8D=884:54=E5=86=99=E9=81=93=EF=BC=9A
>
>     On 30.09.21 09:07, Peng Fan (OSS) wrote:
>     > From: Peng Fan <peng.fan@nxp.com <mailto:peng.fan@nxp.com>>
>     >
>     > With Linux Kernel 5.15
>     > commit 6abbd6988971a ("irqchip/gic, gic-v3: Make SGIs use
>     handle_percpu_devid_irq()"),
>     > the on_each_cpu IPI_CALL_FUNC interrupt active flag will not be
>     cleared
>     > until interrupt handler finish.
>     >
>     > Without Jailhouse hypervisor enabled, everything is ok, but when
>     > enabling jailhouse, HCR_EL2.[FMO | IMO] is set, that means NS-EL1
>     > is actually accessing ICV_DIR_EL1 when eoi_irq after enter_hypervis=
or
>     > return. It not able to deactive the interrupt that is actually a
>     > phyiscal irq which in active state.
>     >
>     > To ARM64, the IPI_CALL_FUNC is using SGI 1 which is same value as
>     > jailhouse SGI_EVENT.
>     >
>     > Then the following `jailhouse cell create` will hang the system,
>     because
>     > the previous 'SGI_EVENT' is in active state and not deactivated, so
>     > the current SGI_EVENT issued not able to interrupt the target cpu
>     core.
>     >
>     > To resolve this issue, let's clear the active bit of SGI_EVENT and
>     > SGI_INJECT before back to Linux.
>     >
>     > Tested on NXP i.MX8MP-EVK
>     >
>     > Signed-off-by: Peng Fan <peng.fan@nxp.com <mailto:peng.fan@nxp.com>=
>
>     > ---
>     >=C2=A0 hypervisor/arch/arm-common/gic-v3.c | 6 +++++-
>     >=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)
>     >
>     > diff --git a/hypervisor/arch/arm-common/gic-v3.c
>     b/hypervisor/arch/arm-common/gic-v3.c
>     > index 03cface0..8327a95a 100644
>     > --- a/hypervisor/arch/arm-common/gic-v3.c
>     > +++ b/hypervisor/arch/arm-common/gic-v3.c
>     > @@ -200,7 +200,7 @@ static int gicv3_cpu_init(struct per_cpu
>     *cpu_data)
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long redist_addr =3D
>     system_config->platform_info.arm.gicr_base;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long redist_size =3D GIC_V3_REDI=
ST_SIZE;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0void *redist_base =3D gicr_base;
>     > -=C2=A0 =C2=A0 =C2=A0unsigned long gicr_ispendr;
>     > +=C2=A0 =C2=A0 =C2=A0unsigned long gicr_ispendr, gicr_isacter;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int n;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0void *gicr;
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 typer, mpidr;
>     > @@ -291,6 +291,10 @@ static int gicv3_cpu_init(struct per_cpu
>     *cpu_data)
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0/* After this, the cells access the virtu=
al interface of the
>     GIC. */
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0arm_write_sysreg(ICH_HCR_EL2, ICH_HCR_EN)=
;
>     >
>     > +=C2=A0 =C2=A0 =C2=A0/* Clear SGI active flag */
>     > +=C2=A0 =C2=A0 =C2=A0gicr_isacter =3D mmio_read32(gicr + GICR_ISACT=
IVER);
>     > +=C2=A0 =C2=A0 =C2=A0mmio_write32(gicr + GICR_ICACTIVER, gicr_isact=
er & 0xffff);
>     > +
>
>     Do we also have to migrate this state into the virtual GIC?
>
>
> I think no need. And it will introduce complexity=C2=A0
>

Likely right, the general interrupt mask will prevent that the root cell
is seeing any unexpected nesting of SGIs.

Applied both patches, just transplanting the inline comment from patch 2
to patch 1.

Thanks,
Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/017d4c43-657e-fb64-da41-9dfaceff48e7%40web.de.
