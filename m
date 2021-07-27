Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBM5I76DQMGQEI74A27I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103e.google.com (mail-pj1-x103e.google.com [IPv6:2607:f8b0:4864:20::103e])
	by mail.lfdr.de (Postfix) with ESMTPS id 166393D7225
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Jul 2021 11:39:01 +0200 (CEST)
Received: by mail-pj1-x103e.google.com with SMTP id k1-20020a17090a39c1b0290176898bbb9csf3722183pjf.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Jul 2021 02:39:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1627378739; cv=pass;
        d=google.com; s=arc-20160816;
        b=vJYnFDV2iPDcIev/fcBEiaEygv0xaanYs9GxWAUtFWsu2wSs2Y1bt1M9X428qSpl4L
         YTW3vyEjAUiMqrMgHYb1+le4YxVA76PZMc/KevrCUn/wqpKrRsBoZjNgw0jljL/8sPlS
         QPaM7hj6swc8fI9wX9I+kYdecz/LPEp0/chj059lvmanQG8+DqLJUSAmpPI4J/m7FyRN
         PiJHJWbYfn8ySPrfs4bgUECw9Q0bKFUFoXHK/osPjTAjzxr7uS3Z2YIEThnuLQ3WrYCl
         DTPEn7jMEI/tSOxlhaSueX7RynJdHFZ1QbrAIgagKQquTdiCI2FQLnlLzGylcvaVDxwS
         PwMw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :sender:dkim-signature:dkim-signature;
        bh=NFTz4nNj2SYRf1yIYoUzhpTfztQAafOI6GhgnLEjeBE=;
        b=weQ7PK7uYClsVCklqJ4MIOBJKgNnGkNe+GCTdCRFa32YDM6A1B5N5sscydI8tlMxZi
         smIBn1yURVqJQh2IgsPZD8M+xc/o1e6KWf/Vk2kSm1DtXk/asZ/P5GMQPnmLbAoK2xA8
         hy5N5h1x4ZbT//kibJ4HXavtRRIpobW6/i8Ywfc+Rajt+KSsiEI14SKUybpkf837PKkA
         UzhypnLRIfeogrrtcjCQ0NNX20HcIvwe445tjo/ML56HgAcpAOLTz4FBKozBFLcewM5E
         f7Hr0uGe1PTecJ4LPVir9Nh7laeOwWbWKZ4U56eBwvKjYTv6ZjXDuJ6tS4JGCPsqVpdW
         DTOQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="rQ/LDrxe";
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::742 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NFTz4nNj2SYRf1yIYoUzhpTfztQAafOI6GhgnLEjeBE=;
        b=JuaUWSnJhZ33cLAoqdUtQZtKpjjVU/phMAnCbQlOOa7E49VeZlC7oKZ1wbyrEBegQn
         coJcrAJ76laXo2A86yk/9PKTqPeHmAuPdeCupCiZDGUcN5iHWndd/O4IWaETMZpE0T5l
         qZ58FLeHZc9UnRaTa3OcXUEt2Wu9PxhXimi9MWOmtneJSr4LoNi4tuYneX2PvNpf0ld1
         C2n30NzJM8qhrnAsGjNX5jIuxNPs80r2VTNejli1g0O7mOtVgxlUnpXmnSVEfeql5HYz
         fj6ohc7e1R7gMNNA3VgQLtz4+HSMYXUNZlaqWCJ6zMWjAjA7YRdQ28e3LZ6k4ajCzJMh
         JZjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NFTz4nNj2SYRf1yIYoUzhpTfztQAafOI6GhgnLEjeBE=;
        b=kjj1Tj9MN9VCEacaAIh8udsVFtIx4h4WwDaoKDhAJIYkvSSZYgkrsMCBm8vz1hSWXK
         yRGGoyE13fY73lxzeDQu+cD1Pqe17Wrv2i01xQYCnXWOuQWOagJ3DvmEFxEQsjGdi1Tw
         xpBeVivGztH9yKO7s8gNZ6A0YCH/8SigK/xbGD0g7FDNXBvYTUmJI0skwChEzX+xqiPp
         QjVnWx+r0rM1ydBqp0x7febBvFq0PjkYxOBSjrhA1hO3dFGC1rldjeluurnULokW1YV4
         FnncXjxzRDzZ9JazjMdmASEPfA3MxWam7yzjvB8fBysdP5MMf4vOfBULyfz66FwX0AXf
         EOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=NFTz4nNj2SYRf1yIYoUzhpTfztQAafOI6GhgnLEjeBE=;
        b=pDyNLxyFr7vcvQcKDMqEmjSLWmkqA3/Y41OQ2jX4wJfz3gD3a8lbG66Qy02pqwLfEs
         eL+cXA0bmXyI/WXxGKenWMMoEZ6cMQbPhRF5ho9VMke01OddE8dgFqTF3N1PXcXt1peI
         Op/vCvVmRY/CFhux0NN1w4fnA8+dGL1fMXOEZb0w/0qD9muw+bu6WLRDkgRL66atcPcy
         cMiGnCo1wGMcayya9yzl/20KxH6zAPVJnAA31BM46woPBOTtib8Lr/WQugSWuFt+z2Wv
         DuZwaoeB/6wZVR9lzN/N2eGQDKiZD1fhv4UG7o2rDKqcmqfyvfncTpMO+K9nsQK9K0j6
         Y24A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533fBEo6TmwimeprnAUCPyyDhbKLiZ8eMlcl6fFemdmtwgSfUHwe
	kIslO4LH8qSJIOnak3m0sxE=
X-Google-Smtp-Source: ABdhPJwx7CV1sNq2yJr2A2Xiertdf9r5gkOHuukrGr/K4HTOXNzJUPHy79xQsiTqCcWoZJqwC1V4Ng==
X-Received: by 2002:a17:902:c60b:b029:12a:e53f:9f44 with SMTP id r11-20020a170902c60bb029012ae53f9f44mr18519870plr.28.1627378739751;
        Tue, 27 Jul 2021 02:38:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:e23:: with SMTP id d35ls10901744pgl.5.gmail; Tue, 27 Jul
 2021 02:38:59 -0700 (PDT)
X-Received: by 2002:a62:3045:0:b029:32b:880f:c03a with SMTP id w66-20020a6230450000b029032b880fc03amr22243867pfw.22.1627378739016;
        Tue, 27 Jul 2021 02:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627378739; cv=none;
        d=google.com; s=arc-20160816;
        b=Siq9DjmWrqoDYRaTAe6wt2Ahi8Xu/X9fuR0vT5IAF0I9dfgDDGCweQjrE9vq1XCF3N
         upYi8MR1IDeLXVAN85mo6oegB1ZaEYcC8f1aUxhAtpsWiyBQYz/D7X01/Tup3Y+KVydv
         Pq1d7xWvi/uXw+wU0aAhtZURJRir/TvIc5abnDBrjJrM2t1LqNCtnKPBQyqsfy5bINf2
         NfFdDhahJ+XIfLAoIzYaWWLNJdplVCU2lGf65rQmZnh+SUAbd0S6KBYp8nurS41HluUi
         dWr3SbYaBp90Av2FEgj1DgNNM9/2S4ydKWPv8JnO85HNeHwBJ2XHvcfj8YbtTWz1x38S
         Oofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p1cg4azFkhiVMFmXMx4S0xRy7yXWafEXdNg5iJUBf/s=;
        b=n7BaBKAa446/DF0HLhYzrTH0Mkzd62JjAvsQBIKSQveRo9zRcCrk2LamYniASoepmL
         6VTexEoqKu4sPLddDV6BuWvFJgCgn1cEpY89mXLAAnnk5Vl1RmJqJ2G4FlpC6KQd6k2N
         +uOauQfbzKU3stsDH/L472/cEw0YzP/kB3VElTL0Y8BqxabbMY1oKLkcFqaqeMb5Q+FO
         PAr33DvqdHGuCp4dw3pirTMXSlLi94S8P9Rl6m1mTPLaJzqRXIXjVHfUxz+9tTWeQJ65
         9Sqzq4AZ/qjK2YEscr3YB8q/r3autQ4TltaFaNaxYcc1Nb3+muZ/6ZdoGkfXPiG89m3Y
         tCqA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="rQ/LDrxe";
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::742 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com. [2607:f8b0:4864:20::742])
        by gmr-mx.google.com with ESMTPS id o2si193534pjj.1.2021.07.27.02.38.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 02:38:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::742 as permitted sender) client-ip=2607:f8b0:4864:20::742;
Received: by mail-qk1-x742.google.com with SMTP id az7so11687108qkb.5
        for <jailhouse-dev@googlegroups.com>; Tue, 27 Jul 2021 02:38:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1713:: with SMTP id az19mr21474229qkb.67.1627378738314;
 Tue, 27 Jul 2021 02:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210726100546.30332-1-gengdongjiu1@gmail.com>
 <07afe6db-18e4-8dce-a4f2-434bde1afe44@siemens.com> <CABSBigSq2QbUbQjNyd=t=71i3cianys_EreCVBCP2dzfqqR+eA@mail.gmail.com>
 <ea765444-4e6c-66f6-15c6-1ffc9b0bd130@siemens.com>
In-Reply-To: <ea765444-4e6c-66f6-15c6-1ffc9b0bd130@siemens.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Tue, 27 Jul 2021 17:38:47 +0800
Message-ID: <CABSBigQFP1t7Vd8bubKZhLUD_Nz1uj-Hw6fzsQwpg+Xvc3e_VA@mail.gmail.com>
Subject: Re: [PATCH] ARM64: Set the right set TCR.(I)PS value
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b="rQ/LDrxe";       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::742
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
=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=8810:29=E5=86=99=E9=81=93=EF=BC=9A
>
> On 26.07.21 14:45, Dongjiu Geng wrote:
> > Jan Kiszka <jan.kiszka@siemens.com> =E4=BA=8E2021=E5=B9=B47=E6=9C=8826=
=E6=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=886:22=E5=86=99=E9=81=93=EF=BC=
=9A
> >>
> >> On 26.07.21 12:05, Dongjiu Geng wrote:
> >>> According to spec, the {I}PS should be never larger
> >>> than the CPU hardware implemented physical address
> >>> size(ID_AA64MMFR0_EL1.PARange). Otherwise, it
> >>> may lead to some unexpected issues.
> >>>
> >>> we can refer to DDI0487G_a_armv8_arm's description below:
> >>> If {I}PS is programmed to a value larger than the
> >>> implemented PA size, then the PE behaves as if programmed
> >>> with the implemented PA size, but software must not rely
> >>> on this behavior. That is, the output address size is never
> >>> largerthan the implemented PA size.
> >>>
> >>> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> >>> ---
> >>> DDI0487G_a_armv8_arm: Physical address size implementation options
> >>> ID_AA64MMFR0_EL1.PARange Total  PA size PA address size
> >>>         0000                     4GB    32 bits, PA[31:0]
> >>>         0001                     64GB   36 bits, PA[35:0]
> >>>         0010                     1TB    40 bits, PA[39:0]
> >>>         0011                     4TB    42 bits, PA[41:0]
> >>>         0100                     16TB   44 bits, PA[43:0]
> >>>         0101                     256TB  48 bits, PA[47:0]
> >>>         0110                     4PB    52 bits, PA[51:0]
> >>> ---
> >>>  hypervisor/arch/arm64/entry.S              | 14 +++++++++++++-
> >>>  hypervisor/arch/arm64/include/asm/paging.h |  5 +++++
> >>>  2 files changed, 18 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/en=
try.S
> >>> index 3f4ee871..99738f28 100644
> >>> --- a/hypervisor/arch/arm64/entry.S
> >>> +++ b/hypervisor/arch/arm64/entry.S
> >>> @@ -388,6 +388,16 @@ el1_trap:
> >>>       isb
> >>>  .endm
> >>>
> >>> +/*
> >>> + * set TCR.(I)PS to the highest supported ID_AA64MMFR0_EL1.PARange v=
alue
> >>> + */
> >>> +.macro tcr_compute_pa_size, tcr
> >>> +     mrs     x9, id_aa64mmfr0_el1
> >>> +     // Narrow PARange to fit the PS field in TCR_ELx
> >>> +     ubfx    x9, x9, #ID_AA64MMFR0_PARANGE_SHIFT, #3
> >>> +     bfi     \tcr, x9, #TCR_PS_SHIFT, #3
> >>> +.endm
> >>> +
> >>
> >> Why a macro, why not inlined?
> >
> > Thanks very much for your point out, yes, It's best to inline rather
> > than macro definitions
> >
> >>
> >>>  /*
> >>>   * These are the default vectors. They are used on early startup and=
 if no
> >>>   * Spectre v2 mitigation is available.
> >>> @@ -460,8 +470,10 @@ enable_mmu_el2:
> >>>       ldr     x1, =3D(T0SZ(48) | (TCR_RGN_WB_WA << TCR_IRGN0_SHIFT)  =
   \
> >>>                              | (TCR_RGN_WB_WA << TCR_ORGN0_SHIFT)    =
 \
> >>>                              | (TCR_INNER_SHAREABLE << TCR_SH0_SHIFT)=
 \
> >>> -                            | (PARANGE_48B << TCR_PS_SHIFT)         =
 \
> >>>                              | TCR_EL2_RES1)
> >>> +
> >>> +     tcr_compute_pa_size x1
> >>> +
> >>
> >> So this is aiming at devices that have less than 48 bits parange, righ=
t?
> >> Did you stumble over such a hardware? Or is this rather about devices
> >> having more than 48 bits? Sorry, still trying to understand the detail=
s.
> >
> > Yes, I have a board with ARMv8 Cortex-A53 CPU, the Cortex-A53 CPU only
> > supports 40 bits[1],
> > not 48 bits=E3=80=82 And even some ARMv8 CPU support  53 bits parange, =
also not 48 bits.
> >
>
> But the problem is around parange < 48, right?
>
> >
> > [1] https://montcs.bloomu.edu/Information/RaspberryPi-ARMv8/technical-r=
eference-manual.DDI0500J_cortex_a53_trm.pdf
> > Table 4-56 ID_AA64MMFR0_EL1 bit assignments
> >
> >     [3:0] PARange Physical address range supported:
> >     0b0010 40 bits, 1 TB.
> >
>
> OK - but the raspi was apparently still working, although out of spec.
> Or did you see something breaking? Looking for a classification of this
> issue ("ugly, but we were lucky so far" vs. "never worked with X / when
> doing Y").

ugly, but we were lucky so far, it was still working, The reason is
that the CPU will ignore this configured value if this configured
value is larger than the  CPU supported, but software must not rely.
We can refer to Linux kernel code that sets the  TCR.{I}PS according
to ID_AA64MMFR0_EL1.PARange.

I found this mismatch issue when I was debugging, and think it is
better not using hard coded to set it, so change it.

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
jailhouse-dev/CABSBigQFP1t7Vd8bubKZhLUD_Nz1uj-Hw6fzsQwpg%2BXvc3e_VA%40mail.=
gmail.com.
