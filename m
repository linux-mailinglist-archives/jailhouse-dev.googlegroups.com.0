Return-Path: <jailhouse-dev+bncBDOKTXXSZADRB5O47KDQMGQETAQ7UNY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1040.google.com (mail-pj1-x1040.google.com [IPv6:2607:f8b0:4864:20::1040])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEB23D59B6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Jul 2021 14:45:43 +0200 (CEST)
Received: by mail-pj1-x1040.google.com with SMTP id j22-20020a17090a7e96b0290175fc969950sf8632390pjl.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Jul 2021 05:45:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1627303541; cv=pass;
        d=google.com; s=arc-20160816;
        b=LC5h7f936DPV3kSPEPvO1QavLxxmJy5ocXsdCJupJ+UhoW/fvsUamcVe1xWIcf6LZ2
         Lzw2ngoItVjahDfKSuKPBjAp/4KEoEF/mmT1dZfM3xK0f4yScKQvvDHt5Ex1wjCDUB5U
         kP/GG3ebXfONDZQHu+zIJxhcICnQCzc7q0CwDQKkG8SMArsw2nOemY0/rPxEr3Msi/1L
         4Xk2HjOPBNMsIQoOKG9Vkt8hSJ6RihJLrIe6R9xu2PegiqpFOxDSXRSZPI6SmdetP6nV
         UutlH+Un0XlKxpgMjoEfz2HqHCavhdKwUdkh0ydWF23dJY3sODX9PAJnR2q8GnLVkWIp
         5s9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=/oR6jebfYZFuuy10KmssxMNTJlqXMYVwLCMrWtykd1I=;
        b=jPn3ube9i+sihekAuLZf1Ijk89AUcfIeQimVGMsRhERszyqfFdW72ucdhUrPkm8c+0
         MeLVrfGFnZuhDstJBzBFWpcKsKLJhuS4jqJXjggxiiPR8+yRXwpwKiEV8VIy1/Cp5Cei
         d6EDqCvdiwW+UJwC5vBtmXeRmy2u1W46W3gGYgQWzJUNqXaPaWrXLEqnmnQjl6DehU+O
         7sF5n/aZcjidN1lSkhhJX0g69dpdfnqsiUde5ERTUeMgflfX9DAd0mWTSn5z8hPu/uMi
         Vy/p5BCet7HO16RBiYQJjM8lPPm5ODKl0s98lQZjrjATqDPUnIO93ltDXlL63uZPXn0h
         w1DQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ckCX41jI;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::a44 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/oR6jebfYZFuuy10KmssxMNTJlqXMYVwLCMrWtykd1I=;
        b=R2I7aGcI0Ciie5BCz19Q5QZ2qYyeHw7hGdrpyB3cokhJ34dgSqXH7FzkHXrCI9fFVm
         Cpmm8S15QcKu6um9R/8TcC5S4gM/N2yZZdyOa9Ct4ujirMQK+BWdrzp6enjT5Qq0u+05
         9ihqFLTaAMhfpm9A58lzRGxBj1BNGIorYjCoJ/wngfkrscw1n6BnT7drGKjZvh+hpljV
         w8ePhZZ5bN4+znBO2MmSQyJg3R+qETymp91O/GziJ6n+CrHbWn4IjxwlySDYDNIn/aDw
         oM2qLfX3BX+l89NTVoJUSNL6NGs5kOWi03PuN6lq8JBD8Xfx6+WjPtzjyqQtSs09VMLj
         M7bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/oR6jebfYZFuuy10KmssxMNTJlqXMYVwLCMrWtykd1I=;
        b=I8gRtizOGJ3ZtT24t6jyZ57d5h6aGX6WwwRZ1zzEIGzVttPQaxdiQPqEwx5wbhWDGp
         Zb7Sg4tg8yiz42nawE4YpIsIKIm2RIEctJiU1SY7YsTby9z2yWUN2Z0MdDq+M3Gfh+v5
         5hstZWO5NMZmLirQjkmmrYfyy59G5WrZ0pFKc7OW404w1MqFyRR/PD4fJ/WlK8zJx2PV
         LqdT+ACeJausfqQvf2jN/b1Extpj2ztm5CrQiiCbIh7/jOfNl/OhvvEHS3Az9/mhIlqC
         XoaEpVsKQ0YuLTMgwumR5pLWJPwB1TxwLyECo3g05D8DIucUQFa/VOxAA+5kl4FoFveX
         /vuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/oR6jebfYZFuuy10KmssxMNTJlqXMYVwLCMrWtykd1I=;
        b=noISZRdODj4xQp4GYF11/1Lq5N94ZzWgvJ//vHTNpB86bJ7bRsWBiYydk9V5QGbypx
         SLXbutndJ1prUJLNkR42g+W68FkGn7LwOSqqmDHvcjF6pGG1sXOEpE7p3cIW/Rb5QtvQ
         uMyM6WKJ25az2+kO0D/y3gotxw94yxjQ2jOgsh0c30IAE7GxImga+sWHBeqKjzKE3MaO
         R2k60N2xCL3RmCXHcUC4iqBquv1vrvqs538KO5MiPOmmNZ9eoDMFozQdbkwexL5HVBv6
         bC9AgWhqVhUiwBqhaefYgFXmmGsaNBzmQVaVJqft6Vfe8wIbYA8pmXFMZtuALTKPDbAZ
         qERw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533FGBi4F3Ge1iaKOfg3onvljMHzY0zV5qG+1J/WQsrKSs4kB8hM
	Cf7SuY9Hc1ywrvoWkm6b9GQ=
X-Google-Smtp-Source: ABdhPJxc9QwExo2QT4G61+JeXi5rKeeRPhPtegtJ9UMfCQ5A8fz7YAU6HxmAwlN3kfNKI4TadwTWTA==
X-Received: by 2002:a17:90a:d588:: with SMTP id v8mr25925130pju.134.1627303541588;
        Mon, 26 Jul 2021 05:45:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:cf09:: with SMTP id h9ls2253821pju.1.canary-gmail;
 Mon, 26 Jul 2021 05:45:41 -0700 (PDT)
X-Received: by 2002:a17:902:9a41:b029:12b:8e55:d2b1 with SMTP id x1-20020a1709029a41b029012b8e55d2b1mr14411242plv.78.1627303540923;
        Mon, 26 Jul 2021 05:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627303540; cv=none;
        d=google.com; s=arc-20160816;
        b=05wTNpJF+4+9F8oU7RfaTf/t9YEC68TZHtZQCagCupjp78wmWBjxHfgygc80C3H7iG
         +Ada4HVg07DVqpn1TMmeo8JhirxgCnjMZbYf5GwhRhtSEXuZ+T09B2HtNIW0cFRLuq6j
         /83ofyRFXVb6RLfmw9F6r8POcVi3FDdIf8R006Fm4QES1xtgnaLzotTJ9jhqGyoRCIb3
         fmsHXH1c8t9gnfObP2xqh/lf6luSxFgWBRCRJOru4T53WqkKSDw9wCng0ajJOiSbWTcv
         AmqehnnMtnOz6i62gwLzp5w2lu1jt8ZZzGXxDoz/WpXwphY9h6zWpOUZdWMjz4X7kVOk
         MiFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FuQTTJpkcswl8pTyXsPEqs+xG9It2qrSOh/X6MaWWxw=;
        b=ipJaPOMbFfEQWL1rYitba6CzeiHMNJLtTp4Q7AtCM07QmA59HItO6Ivi1d+2M195EU
         WoAWLFhXg/EQPjVa8re6FErr+Cj86XQWqbRMsBlpKcv+8CzFA6pv2Z9Z39TnOYe7SIeK
         XLnlR6LdNaSxXtcrU8YwuzTvFuydFbzpZNrfS8y9JNzRlPnfDCojS0CTyfjSstjoLomB
         wlHTpu1RWDeiYH3b8erpcP6u7nCyR1AV3uiGCQGYlyvY7Rp6i7gZX8mAiPWevCZklI7/
         cZaK7pz1gTx9DJOeyxKzCwbxX2yUlvIMyNcnMyctkKcqrRXOF0djtOFGpOFdrfUImBV/
         HBig==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ckCX41jI;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::a44 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com. [2607:f8b0:4864:20::a44])
        by gmr-mx.google.com with ESMTPS id cp24si563399pjb.3.2021.07.26.05.45.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jul 2021 05:45:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::a44 as permitted sender) client-ip=2607:f8b0:4864:20::a44;
Received: by mail-vk1-xa44.google.com with SMTP id c20so1981040vko.7
        for <jailhouse-dev@googlegroups.com>; Mon, 26 Jul 2021 05:45:40 -0700 (PDT)
X-Received: by 2002:ac5:cd50:: with SMTP id n16mr10227539vkm.7.1627303538736;
 Mon, 26 Jul 2021 05:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210726100546.30332-1-gengdongjiu1@gmail.com> <07afe6db-18e4-8dce-a4f2-434bde1afe44@siemens.com>
In-Reply-To: <07afe6db-18e4-8dce-a4f2-434bde1afe44@siemens.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Mon, 26 Jul 2021 20:45:27 +0800
Message-ID: <CABSBigSq2QbUbQjNyd=t=71i3cianys_EreCVBCP2dzfqqR+eA@mail.gmail.com>
Subject: Re: [PATCH] ARM64: Set the right set TCR.(I)PS value
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=ckCX41jI;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::a44
 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;       dmarc=pass
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

Jan Kiszka <jan.kiszka@siemens.com> =E4=BA=8E2021=E5=B9=B47=E6=9C=8826=E6=
=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=886:22=E5=86=99=E9=81=93=EF=BC=9A
>
> On 26.07.21 12:05, Dongjiu Geng wrote:
> > According to spec, the {I}PS should be never larger
> > than the CPU hardware implemented physical address
> > size(ID_AA64MMFR0_EL1.PARange). Otherwise, it
> > may lead to some unexpected issues.
> >
> > we can refer to DDI0487G_a_armv8_arm's description below:
> > If {I}PS is programmed to a value larger than the
> > implemented PA size, then the PE behaves as if programmed
> > with the implemented PA size, but software must not rely
> > on this behavior. That is, the output address size is never
> > largerthan the implemented PA size.
> >
> > Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> > ---
> > DDI0487G_a_armv8_arm: Physical address size implementation options
> > ID_AA64MMFR0_EL1.PARange Total  PA size PA address size
> >         0000                     4GB    32 bits, PA[31:0]
> >         0001                     64GB   36 bits, PA[35:0]
> >         0010                     1TB    40 bits, PA[39:0]
> >         0011                     4TB    42 bits, PA[41:0]
> >         0100                     16TB   44 bits, PA[43:0]
> >         0101                     256TB  48 bits, PA[47:0]
> >         0110                     4PB    52 bits, PA[51:0]
> > ---
> >  hypervisor/arch/arm64/entry.S              | 14 +++++++++++++-
> >  hypervisor/arch/arm64/include/asm/paging.h |  5 +++++
> >  2 files changed, 18 insertions(+), 1 deletion(-)
> >
> > diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entr=
y.S
> > index 3f4ee871..99738f28 100644
> > --- a/hypervisor/arch/arm64/entry.S
> > +++ b/hypervisor/arch/arm64/entry.S
> > @@ -388,6 +388,16 @@ el1_trap:
> >       isb
> >  .endm
> >
> > +/*
> > + * set TCR.(I)PS to the highest supported ID_AA64MMFR0_EL1.PARange val=
ue
> > + */
> > +.macro tcr_compute_pa_size, tcr
> > +     mrs     x9, id_aa64mmfr0_el1
> > +     // Narrow PARange to fit the PS field in TCR_ELx
> > +     ubfx    x9, x9, #ID_AA64MMFR0_PARANGE_SHIFT, #3
> > +     bfi     \tcr, x9, #TCR_PS_SHIFT, #3
> > +.endm
> > +
>
> Why a macro, why not inlined?

Thanks very much for your point out, yes, It's best to inline rather
than macro definitions

>
> >  /*
> >   * These are the default vectors. They are used on early startup and i=
f no
> >   * Spectre v2 mitigation is available.
> > @@ -460,8 +470,10 @@ enable_mmu_el2:
> >       ldr     x1, =3D(T0SZ(48) | (TCR_RGN_WB_WA << TCR_IRGN0_SHIFT)    =
 \
> >                              | (TCR_RGN_WB_WA << TCR_ORGN0_SHIFT)     \
> >                              | (TCR_INNER_SHAREABLE << TCR_SH0_SHIFT) \
> > -                            | (PARANGE_48B << TCR_PS_SHIFT)          \
> >                              | TCR_EL2_RES1)
> > +
> > +     tcr_compute_pa_size x1
> > +
>
> So this is aiming at devices that have less than 48 bits parange, right?
> Did you stumble over such a hardware? Or is this rather about devices
> having more than 48 bits? Sorry, still trying to understand the details.

Yes, I have a board with ARMv8 Cortex-A53 CPU, the Cortex-A53 CPU only
supports 40 bits[1],
not 48 bits=E3=80=82 And even some ARMv8 CPU support  53 bits parange, also=
 not 48 bits.


[1] https://montcs.bloomu.edu/Information/RaspberryPi-ARMv8/technical-refer=
ence-manual.DDI0500J_cortex_a53_trm.pdf
Table 4-56 ID_AA64MMFR0_EL1 bit assignments

    [3:0] PARange Physical address range supported:
    0b0010 40 bits, 1 TB.


>
> >       msr     tcr_el2, x1
> >
> >       msr     ttbr0_el2, x0
> > diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/ar=
ch/arm64/include/asm/paging.h
> > index 932dbb50..1b588aad 100644
> > --- a/hypervisor/arch/arm64/include/asm/paging.h
> > +++ b/hypervisor/arch/arm64/include/asm/paging.h
> > @@ -144,6 +144,11 @@
> >                               | S1_PTE_FLAG_NORMAL | PTE_INNER_SHAREABL=
E\
> >                               | S1_PTE_ACCESS_EL0)
> >
> > +/**
> > + * Memory Model Feature Register 0
> > + */
> > +#define ID_AA64MMFR0_PARANGE_SHIFT   0
> > +
> >  /* Macros used by the core, only for the EL2 stage-1 mappings */
> >  #define PAGE_FLAG_FRAMEBUFFER        S1_PTE_FLAG_DEVICE
> >  #define PAGE_FLAG_DEVICE     S1_PTE_FLAG_DEVICE
> >
>
> Jan
>
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CABSBigSq2QbUbQjNyd%3Dt%3D71i3cianys_EreCVBCP2dzfqqR%2BeA%40m=
ail.gmail.com.
