Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBPMPWOKAMGQEXNLJRLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3c.google.com (mail-qv1-xf3c.google.com [IPv6:2607:f8b0:4864:20::f3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 940685329C4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 May 2022 13:55:42 +0200 (CEST)
Received: by mail-qv1-xf3c.google.com with SMTP id e3-20020a056214110300b0045abb0e1760sf13124600qvs.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 May 2022 04:55:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653393341; cv=pass;
        d=google.com; s=arc-20160816;
        b=iu5P/X3GuecjPH58Pu7UAuz/5Y6rYcwAOd4Q+hlHcWglIWEaHce7tXoOq9hfvfEJaj
         pe4eM+mFoUneMGrlLbZDGRXE3HvV40BsHnq/FY/f8SHUylOAxk9n7iyQysXcSlcA1+61
         Izymp6CPJuWp0OWzf9KmNp6BAx6QJYDfEHX+tDSPr2CEnpMWFck3QQ7FXzWiZv6jpPi5
         oVBAgoXzbf9kUFpwsIpXWei0oLY4hqy1pZ1yHLbZzjboiBslE4bp7MRJc+5BDHnKvlIZ
         FklGsQdVRvtinaa4pvpQwLR2nlx/979hDoVP95zbBPvLFII50UY+h1Abh8rfY8UWXGCV
         HCvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=IX3qOITDwyPGzSKaQ7rDyMBmWqeq35pQ2j+PqB2QOak=;
        b=Bg/nHPk6Qj39gDCGWccMCzfiacear0326waSUitbMV6Y3T12DqHfGfMjUXpbrV5HxE
         aOF/liNCg4cgCW253KPN5YNkU7AZHzr7KIs5EGDc6MzSQEj2ObC4BXsCkQlRleicE+WC
         G76M4cvOx3ViQbAze2yjZI6iISfUte6mz4WGMmtLCmVh8nrYwpsOIeJZ5PxnhNHHXgd7
         BdkM1qWaWG4LdPHrgJSRJrLaxOLFCyLmcOlGHbvufmzddiOwXhYv5r8meigLOWvmnF9Y
         Le5KqpqGnCjXEEzZXdGbjswmDCe+WoVPzF0rVfE6ioW3j57bPJ+IYej1oMzbH0OWCmGH
         IdnQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=VhLrxJ+P;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b33 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IX3qOITDwyPGzSKaQ7rDyMBmWqeq35pQ2j+PqB2QOak=;
        b=kuwK762xOj0mhDWoOnagVgy7H6kwCxOUuc6d/IXgvsvhCwkEGNSfwMhI07MITxSvuK
         R1RBXVwd3hEj8shXSVBlEAyqwHkJ2bt3EZLlPC6/nSwqCL9xnSFrfMejgi4GWWnMG67Z
         5FxZVkJWzc/mBj71XP5cxID/k+iM/J+nk4TWBgqA6wS9VaLrb3Lf4jHDMn7/G9ob9De3
         ZaMDq4jJW2q3glpVP3szFwhGZ6BpxPf6OeBeobXWSQH65pXdGo3NKv+10i0g+ojvD1/N
         RrVYdzE9Q/lqSo9LUDUrj44mNcr2mq5XN9bb95k+Vvx5xvb6CThyrbolDNximXq0hMI/
         f8vA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IX3qOITDwyPGzSKaQ7rDyMBmWqeq35pQ2j+PqB2QOak=;
        b=Rk1kuGw/WXS8sjj+g1eGhVYGALFtQIrsGzMDNuhnmLB3zEqkFyxvM53zC4MREsqgQ/
         BUz00wuPENq39838IU1z3YYXN61jbmo7f7P4j/+n2uV00euWitDmxPX91qx80Xwtpz0P
         kQI1Ua/RPVEEloMzUvuYcszOxy98lGzHatZE3RrPDsXnkB17zVrwVrwOaw5T6zkqEnKI
         yODovaKX61+B6aMTDzMLuf1jx7fk/hUhw0oYhsnCUTpGY27d+0ZnX7LrH5cT5iCZZ8pH
         O+Ec+TT4NzLVCOzanuXIsGfJAY0AuiWfReX/27OuqrYUFrbMf9CeBuu4/g1RyCidn+GP
         loFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IX3qOITDwyPGzSKaQ7rDyMBmWqeq35pQ2j+PqB2QOak=;
        b=I9MLzCj6FUmxBdMP1u96YGPxAT9FI1rB7Gk63Oep12r+IGoql5lUomofKLk/Nt4Xk/
         zRi5QZGApm70MvMQP/EFGWX9IieZ9XXwWBJzLa6ZiAmz2A+5lmGk2/myj+bgcgqnEqpO
         ujXwni72xQ9GVMAFuaM12HsRW0s2vRwUmFONqznZ+3Gat4H3HX2npYmBrNbOcaqgmYsX
         A+8sscY2VbTaQabsQrsAgFebKD78TAgs2EZOsXFQMyjL6Xhm0Et0f6dvSkImOy7/zcbN
         bxpNQuWU4AZIIHeoFKU1yAqCSQIh+Hp3WnTek6ckcFDxN8ZGZmAiDI9xCHj8OsVUBvg+
         4sUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532mQwyZW5ttf9Eex9703rERda8K3xxvbz4NLOKuJk9Yf8jiKS+e
	LgBWsc2tR+yPsmMocYAnvXI=
X-Google-Smtp-Source: ABdhPJzc9FKZJZIL+qXnSElC7umAcAOLnWON1DZ/XbRC/DNxtflcPJsbLBAnWjtUbSLFXVXvG5UsdA==
X-Received: by 2002:ac8:7e86:0:b0:2f3:c7f3:90a9 with SMTP id w6-20020ac87e86000000b002f3c7f390a9mr19700856qtj.668.1653393341475;
        Tue, 24 May 2022 04:55:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:4e11:0:b0:2f9:1f84:f038 with SMTP id c17-20020ac84e11000000b002f91f84f038ls5773037qtw.3.gmail;
 Tue, 24 May 2022 04:55:40 -0700 (PDT)
X-Received: by 2002:ac8:5f50:0:b0:2f3:dc83:7435 with SMTP id y16-20020ac85f50000000b002f3dc837435mr20271736qta.283.1653393340745;
        Tue, 24 May 2022 04:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653393340; cv=none;
        d=google.com; s=arc-20160816;
        b=EPKOfvHOERES1jsQa+WpEbvWoK1EPh+Vvu6uj8xx10xsjFySn/b0LV+AGBYv+UZvqF
         5879MV6zgJHEXO/FD0NdDDbY9XTy3xdYm8CJN/6ghDy74xDfHK9BzktE4qSPTKn6Th1G
         EeCVToazrXslFipWTlCSUM8jGd0O/rcl78HUTpQZR1LQ2+VLxlzJuPSU1FLA6QaVBqtM
         9ELENdCVnHEvdt4C4Meu47nBsSzrwnWTZsE8cDJStOL9U/hmfZ00N6amprWulA9jHO/C
         nBMC86cAFxXZuey8V/38LvrUBnxjFJY/NCPz69h+fbPYhfVTapzYmez6cD0/sY6W78PA
         pxOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HSc9WXFGOkZv/qmCArI1ZaLwPN8L9hch8Ur3eOzSQjo=;
        b=kn92Ce1Pt0ODsmIRLKwaMREfIkGkCKsvmeJZF73XpfmwgVkeda3Ww29vbW/EOiE/H3
         crTvrSvOPCus1MoMC8vAzF3Uj5IPOo4fPObRn6xRizOiUxV3UxmyYDp61zD0HlxklXSD
         miPLCfBv7/UhEgS8FupEZCDI2/P74DoKdRDfihBj73SYOAiYnCWM6izHYCGJBg27CUAY
         F7Q86iPibRNeYiICwaH7U7M5K0xckpHZaUqpSmDfLJ/cbOPTdXTfnBX7aqHH9OA3Y5lt
         f6VS7+q/2WtV5a3nEJj79roUozLW0xaZaFG7QOHMA4QnnP79AmtEx9fqzTg67MojGqM2
         CnRw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=VhLrxJ+P;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b33 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com. [2607:f8b0:4864:20::b33])
        by gmr-mx.google.com with ESMTPS id cc17-20020a05622a411100b002f3f4131086si412754qtb.0.2022.05.24.04.55.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 04:55:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b33 as permitted sender) client-ip=2607:f8b0:4864:20::b33;
Received: by mail-yb1-xb33.google.com with SMTP id x137so2012657ybg.5
        for <jailhouse-dev@googlegroups.com>; Tue, 24 May 2022 04:55:40 -0700 (PDT)
X-Received: by 2002:a25:a422:0:b0:653:43f2:5ca7 with SMTP id
 f31-20020a25a422000000b0065343f25ca7mr1537386ybi.415.1653393340399; Tue, 24
 May 2022 04:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <CA+V-a8s9Ta0fPD6V=yGYDhvKngiMrCghi07Y_4XTbDPk9HeHfw@mail.gmail.com>
 <c44b2378-e682-4b0b-8443-57f28aeea9ee@siemens.com> <CA+V-a8ufXHeaMTwmMmtYdVijY_OVwU_+eTtSbr=Rx=oiQa=9tg@mail.gmail.com>
 <e1b5e28e-f6a7-b603-95f3-8a72f0405d7f@siemens.com> <CA+V-a8t9brsw1fu_x9ou7uHOYxhO8AjuKiLfW+1MJ6tw=A=f=A@mail.gmail.com>
 <8e895901-cd60-9696-935a-293245586a77@siemens.com> <CA+V-a8tLSnKSRVOGwHmNUs+y58QoiDazwBA9rrQ1yGXWcFLVRg@mail.gmail.com>
 <234b1a2d-ea25-e38c-5053-eea15f57b933@siemens.com> <CA+V-a8vUAEZUkbhhHEHKHzf-OhXqnfMkojP5o0nSEtgBdSbRQw@mail.gmail.com>
 <35cddc35-a563-ca93-8e29-b9ae06844030@siemens.com> <CA+V-a8uGOP49BWzY1bwprzLzhUXFjfqW6yD1c-LZN7i94mrzbQ@mail.gmail.com>
 <a87eb794-7dc1-f447-c13a-de600a48d59e@siemens.com> <CA+V-a8uBuBZb5z-HvuLF96jTtKLLKCt8nHmqKt4jtX9ninJAtw@mail.gmail.com>
 <eafaaed1-604f-569b-47f5-232b01cfcee5@siemens.com> <CA+V-a8vshtRo3Kot2xCVV=L+kySoP1XkOrc3U8tWXxLeCCb4Ow@mail.gmail.com>
 <385f8761-8d70-d0c4-f903-9adadb3c9a90@siemens.com>
In-Reply-To: <385f8761-8d70-d0c4-f903-9adadb3c9a90@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 May 2022 12:55:13 +0100
Message-ID: <CA+V-a8uGNUis=XLwewkePUTUDrJp0QBfgkaOMf=8KvPJh4pW_A@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=VhLrxJ+P;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::b33 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

On Mon, May 23, 2022 at 4:13 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 23.05.22 15:55, Lad, Prabhakar wrote:
> > Hi Jan,
> >
> > On Fri, May 20, 2022 at 7:08 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>
> >> On 19.05.22 15:23, Lad, Prabhakar wrote:
> >>> Hi Jan,
> >>>
> >>> On Thu, May 19, 2022 at 12:39 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>
> >>>> On 19.05.22 11:44, Lad, Prabhakar wrote:
> >>>>> On Thu, May 19, 2022 at 6:30 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>>> Forgot: that cannot work. The call of arm_dcaches_flush will overwrite
> >>>>>> lr, thus the second ret will only return to where the first ret jumped
> >>>>>> to - endless loop. You would have to restore lr (x30) from x17 in
> >>>>>> arch_entry first:
> >>>>>>
> >>>>>> mov x30, x17
> >>>>>> ret
> >>>>>>
> >>>>> That did the trick thanks!
> >>>>>
> >>>>> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> >>>>> index a9cabf7f..7b340bd1 100644
> >>>>> --- a/hypervisor/arch/arm64/entry.S
> >>>>> +++ b/hypervisor/arch/arm64/entry.S
> >>>>> @@ -109,6 +109,8 @@ arch_entry:
> >>>>>         mov     x0, #LINUX_HVC_SET_VECTORS_LEGACY
> >>>>>  1:
> >>>>>         hvc     #0
> >>>>> +       mov x30, x17
> >>>>> +       ret
> >>>>>
> >>>>>         hvc     #0      /* bootstrap vectors enter EL2 at el2_entry */
> >>>>>         b       .       /* we don't expect to return here */
> >>>>>
> >>>>>
> >>>>> With the above diff I do get the below:
> >>>>>
> >>>>> [   42.980805] jailhouse: loading out-of-tree module taints kernel.
> >>>>> Reading configuration set:
> >>>>>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
> >>>>> Overlapping memory regions inside cell: None
> >>>>> Overlapping memory regions with hypervisor: None
> >>>>> Missing resource interceptions for architecture arm64: None
> >>>>> [   46.582588] obcode @arm_dcaches_flush: d53b0024
> >>>>> [   46.582616] obcode @arm_dcaches_flush: d53b0024
> >>>>> [   46.611311] The Jailhouse is opening.
> >>>>>
> >>>>> So it looks like something to do with the debug console. This has to
> >>>>> be poked in the dark or any easy way to debug?
> >>>>
> >>>> Well, we do not yet know what goes wrong. We do know that we can call
> >>>> into the hyp take-over stub and register Jailhouse with it. We do not
> >>>> know if we will then end up in Jailhouse in hyp mode and just lack
> >>>> console output or if we crash on entry already.
> >>>>
> >>> Right agreed.
> >>>
> >>>> To move the uart console out of the picture: Did you already check if
> >>>> the driver you select in the Jailhouse config is actually one that
> >>>> should support the UART on your board? Next is to double check if poking
> >>> The UART on this platform is almost identical to
> >>> JAILHOUSE_CON_TYPE_SCIFA type, but with some differences which I have
> >>> patched to work on this platform.
> >>>
> >>>> registers in the way the Jailhouse driver will do at the addresses you
> >>>> configured will work: Pull the code into the kernel module or even into
> >>>> a userspace application with /dev/mem raw register access and try out if
> >>>> that works in a "safe" environment (without hypervisor mode).
> >>>>
> >>> Sure will give that a shot, any pointers on doing this from userspace?
> >>>
> >>
> >> Something like this may help if you do that the first time:
> >> https://bakhi.github.io/devmem/
> >>
> > Thanks for the pointer.
> > I have tried reading/writing from the hypervisor location and that
> > goes all OK.
>
> Means, you were able to generate output on the UART. Hmm, would have
> been too easy.
>
No I meant I was able to read/write into the hypervisor memory which
is reserved in DTS.

> > To avoid any issue related to debug UART is there any way
> > I could test this prior to enabling?
>
> Not without extra measures: Without JAILHOUSE_BORROW_ROOT_PT, which
> applies to arm64, the driver will not map the physical UART page. That
> only happens in init_bootstrap_pt which is run after jumping to EL2. So,
> we the jump goes wrong, you cannot find out where you are.
>
I see. Just to confirm it's not the debug UART the watchdog is enabled
in Linux and I see the platform reboots after 60 seconds, which is
hinting we are seeing a kernel freeze.

Just a fyi I tried the queues/jailhouse branch from [0] and still
seeing the same issue.

> Do you have the chance to get hold of some jtag to find out where the
> CPUs are?
>
I'll try to find one and get the state.

[0] https://git.kiszka.org/linux.git

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8uGNUis%3DXLwewkePUTUDrJp0QBfgkaOMf%3D8KvPJh4pW_A%40mail.gmail.com.
