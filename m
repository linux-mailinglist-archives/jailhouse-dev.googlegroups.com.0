Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBLFDTCKAMGQEJ47NI2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BDD52CF9E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 May 2022 11:45:28 +0200 (CEST)
Received: by mail-qt1-x839.google.com with SMTP id d15-20020ac85d8f000000b002f3b3b7e0adsf3783523qtx.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 May 2022 02:45:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652953517; cv=pass;
        d=google.com; s=arc-20160816;
        b=RyMomXCSYt7x+LPcod3EFoKnq4mH+Hdr6j4vRgVsalML04q1gO8WFWclfUwh5HDSzH
         IUxXUOZTfQGYho6dSHPb32dS8Q/rB6278fkyVY3Z9vD0FHSCsRX9jJx7q7wux3xhPvza
         +GUyxrQUhJCwvC4QdkfEq53LeXzHG5Q6i9kfsHYEqG71ZAzvUqQEw9RUvdXSumozt41z
         HUEqyFEQyMyOUa/66dILnFrX58/QXDQTAysMGyzRcO5sen5y77cTmBcv2OYJSmT0so1e
         wq9xw4FW3UcXZUQnH+ELbRp08+jrbfnk8a/CipuIH+5yUKqRUF9LZXcLYYACSEmTVV5m
         F/sg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=dciCXL0mHZLSDeejWCpBU4L2bqmtOfw/2oeZUYxl4lk=;
        b=nV/RDsL7zGIExR1HMNflCxoEJOKQNF93wdNNVepL6sfEC5Q6IuePxDm6C4CIgdpmT0
         4OD6PWdutli/6DIgvZx3MfE8h7HTr87h5T62u2Ha2QfHyC3yIk7zphsUeKhdivsI85/S
         7lLRayBeuuibFmwxnnF2enwGQgQeAB4FaDetvIKnoNqVSts/HAFjM8xow5hobXGVEmFp
         pwkK4hw6KMdyLNibBZWYsDk/io74mZ8mFGCTywCM3Xduf05gQ9l4psuJYO6PBZAUUkt2
         Z5w3vLAdXYc4P6c1EQj4iGrkjDU9nnVCH/y/P9vMlhUecOMXRt1Q80Bk1ZqZg0t+jhpA
         p8wg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XXhvjHMR;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b2c as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dciCXL0mHZLSDeejWCpBU4L2bqmtOfw/2oeZUYxl4lk=;
        b=nQVn9qt0Fg0d9jI5dwl5cN2ZJvz6NxV+i7gPOlyAs0Mc4CYV4G15dAxAdDDKRo2xIq
         4nPfQdNR97TqPMdO/llleUINB86DJSih+rCGHSl13CatoDsR9LojlLa+mQWnQhb5ZutK
         nvnTFKlNHHzthviM0JC5K5Th0qIS//4MnXp2Oy+HRclXkBr9kCW4mqfVd1te42dhAnXE
         cOejbRcxrB3yDnbX8Ed49l0tYEYCLrQIXi7NiB7REcimXmrw+/BrrdeFKqmb/1hArC5J
         7xuZk2mp+PY12EMKH29bjPSSIeF5V5JM4GHkv06SUt9q/pAsjA3qvKtO7CYsGEt7oFRN
         GqTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dciCXL0mHZLSDeejWCpBU4L2bqmtOfw/2oeZUYxl4lk=;
        b=bZt1/14+BH/7dDKONjxY+Ktb+8Qq3ygL/MpTEeyjJvx7JTxhfGhjvCNMzPGkTOa1wn
         ctZodef0XToQVMzmwSd0EdAIjYs1H5LM6LfdNZOzpABg+OcXJUJAr0iCOphwwKcXqB97
         YmLkKn/bSDs33vyBvCX/QETYqcPdfsZg/lYwxTV8DSKVHjy77wKbmFd4wz/cDfItWUps
         6TbZGZdLh2ym+QbDdTvYORnbKOZx7X/w6Iv12fzPR2GJFOLBc7pt/Q2YQ5YN7Yg/gdZU
         QMZP1vtczlChJstibfJcUdFFU14mKTVhYk4n1FeTNRtC3T4IUnuXA8VD8hYwVLamiIWI
         0haA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dciCXL0mHZLSDeejWCpBU4L2bqmtOfw/2oeZUYxl4lk=;
        b=NXdHj+Zom8vv+8ST6EQ8H4yjCuLvkFKppM1F9Tio/eueT4Q0R36fScKQxHnW6+LY6Z
         nYW0olTVlCnFC1ZrL+LZPcYH7XT592MvNLuYlvZvj+vDzcCJRfu+2+amRLe3YvXs5dfU
         knzyLk9gCtaxE+nQuaYLNBSOcw4StkPlmgyOzfMr5x6+FEdNjgIeHMcrNMF2x2DuTd6o
         V7sZ6SvsNYP7lC92swfWJewBbV12vT2TqgfsInAainx6U//23B19PPo3oJ8fAQLS/XzO
         jWW11bL5gMbLG9CDhcjpycB+FAGCtXiSZOX44pPi+6SXca8gfvbxwOu/Dy/gyHA9n335
         Mobg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Ud3/GCDFQyMULYFtAQWFmQaImJOuDnhOHRf5cAzZr1H2LxDcJ
	nhgk/U1HLZbh6qec9Ri4wGw=
X-Google-Smtp-Source: ABdhPJz0wsSbeZOpF7sDdQgiwqYqMUn4TwVau4J4/DTU7UXxEuC/R+ZV8m0T/hvTDUIr0GjhvPls3A==
X-Received: by 2002:a05:620a:1292:b0:69f:b0ef:e50a with SMTP id w18-20020a05620a129200b0069fb0efe50amr2326999qki.733.1652953517207;
        Thu, 19 May 2022 02:45:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:6c5:b0:69f:ceda:34e7 with SMTP id
 5-20020a05620a06c500b0069fceda34e7ls1285234qky.3.gmail; Thu, 19 May 2022
 02:45:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1191:b0:69f:b278:4b58 with SMTP id b17-20020a05620a119100b0069fb2784b58mr2404414qkk.380.1652953516361;
        Thu, 19 May 2022 02:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652953516; cv=none;
        d=google.com; s=arc-20160816;
        b=M+QYjAftYOjrJvBH2hp/ZZoRSo7r/eFxY5lkxlnCyauwjgPZGIpPYZg3FT6tS5bnOt
         LuLjCjAKiINjpt5QKA2cdSpP0GunTwVTPI/5U+zJhf8b/p4ybvf9C59J2qO05PXb214q
         RM/WS4QN7MJpNVJIDOy9oC+pXPwFxkcJ3c+D6xUb8wdfH3+YdH1IR/XioMsRlG7GXPaj
         kO3ZSS+CNts2XhCgAC+MCCsgod/EoUZJ/zilAzPDCqbIuGQG8jyqiuXFK7ueaPgiAZ/G
         BHq1AAQnXiPi4KAlJKuDPlDHjla6YuSsowcN0Ldez/XGphNXqF5geDd2hXcx2D5RUIYt
         ukqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WK2yVnUq0tysHECBd7Dmh3dyps9jMc1jHdnPbWeAgsg=;
        b=theGha9Cn23JwTyJpRIbR2F3CfwDMyBAIyoGpyNI/7vgdLU0gIRCpwkB+ffE/hx0qF
         aNVRJecBLiGk+mn2+9YrhS1X1UTEcbPOQLSDw78aygApaI/FqEqLcOZ6Aj4mXyBSXcKu
         00BBI2vbPPme2xA61E+ro4vntpeUIF49PSDp59P7qzdfj5+mq64fofTiJVA3o7FBxYPm
         0SdKZ2YaZvDxn3eFNir+06ImyU/QtQalVQb39+rLLkmoMnpBVrur8njlG/tXdrbfyFuz
         Di190acsgZmSI7iSwwK7ZTMrcq+ZQhIRGKOZaRdR2VB9Eq4hpXOW191/IOOvZiwp7W2D
         QshQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=XXhvjHMR;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b2c as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com. [2607:f8b0:4864:20::b2c])
        by gmr-mx.google.com with ESMTPS id k12-20020ac8474c000000b002f717ac682asi91429qtp.5.2022.05.19.02.45.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 02:45:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b2c as permitted sender) client-ip=2607:f8b0:4864:20::b2c;
Received: by mail-yb1-xb2c.google.com with SMTP id i11so8059175ybq.9
        for <jailhouse-dev@googlegroups.com>; Thu, 19 May 2022 02:45:16 -0700 (PDT)
X-Received: by 2002:a25:2cd4:0:b0:64d:6f24:fe6c with SMTP id
 s203-20020a252cd4000000b0064d6f24fe6cmr3589891ybs.182.1652953516013; Thu, 19
 May 2022 02:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <CA+V-a8t-wvud8MF0oyAsHBSUuVQrrkqSr9RWE2tQLCoOzuQikw@mail.gmail.com>
 <fe2e7e92-8530-9913-307f-85437412fd81@siemens.com> <CA+V-a8sgPXsMmsKYwE6etP=JG8Ef83Qz4RHoWAZKeHdVHhk_Pw@mail.gmail.com>
 <5ea8c025-13f2-4754-479a-21395de9306d@siemens.com> <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
 <2fe4d998-1784-53c5-a653-994882ec7fb6@siemens.com> <CA+V-a8s9Ta0fPD6V=yGYDhvKngiMrCghi07Y_4XTbDPk9HeHfw@mail.gmail.com>
 <c44b2378-e682-4b0b-8443-57f28aeea9ee@siemens.com> <CA+V-a8ufXHeaMTwmMmtYdVijY_OVwU_+eTtSbr=Rx=oiQa=9tg@mail.gmail.com>
 <e1b5e28e-f6a7-b603-95f3-8a72f0405d7f@siemens.com> <CA+V-a8t9brsw1fu_x9ou7uHOYxhO8AjuKiLfW+1MJ6tw=A=f=A@mail.gmail.com>
 <8e895901-cd60-9696-935a-293245586a77@siemens.com> <CA+V-a8tLSnKSRVOGwHmNUs+y58QoiDazwBA9rrQ1yGXWcFLVRg@mail.gmail.com>
 <234b1a2d-ea25-e38c-5053-eea15f57b933@siemens.com> <CA+V-a8vUAEZUkbhhHEHKHzf-OhXqnfMkojP5o0nSEtgBdSbRQw@mail.gmail.com>
 <35cddc35-a563-ca93-8e29-b9ae06844030@siemens.com>
In-Reply-To: <35cddc35-a563-ca93-8e29-b9ae06844030@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 19 May 2022 10:44:49 +0100
Message-ID: <CA+V-a8uGOP49BWzY1bwprzLzhUXFjfqW6yD1c-LZN7i94mrzbQ@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=XXhvjHMR;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::b2c as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Thu, May 19, 2022 at 6:30 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 17.05.22 18:19, Lad, Prabhakar wrote:
> > Hi Jan,
> >
> > On Tue, May 17, 2022 at 12:44 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>
> >> On 16.05.22 20:01, Lad, Prabhakar wrote:
> >>> Hi Jan,
> >>>
> >>> On Mon, May 16, 2022 at 6:57 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>
> >>>> On 13.05.22 18:28, Lad, Prabhakar wrote:
> >>>>> Hi Jan,
> >>>>>
> >>>>> On Fri, May 13, 2022 at 4:33 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>>>
> >>>>>> On 13.05.22 17:20, Lad, Prabhakar wrote:
> >>>>>>> On Fri, May 13, 2022 at 1:18 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>>>>>
> >>>>>>>> On 13.05.22 13:32, Lad, Prabhakar wrote:
> >>>>>>>>>> Could it be that arm_dcaches_flush was a red herring? Maybe we are
> >>>>>>>>>> actually crashing on hvc in arch_entry, and that because of Linux not
> >>>>>>>>>> starting in HVC mode, thus no hypervisor take-over stub being installed.
> >>>>>>>>>>
> >>>>>>>>>> Could you share the boot log of the kernel?
> >>>>>>>>>>
> >>>>>>>>> Attached is the complete log.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> "CPU: All CPU(s) started at EL1"
> >>>>>>>>
> >>>>>>>> As suspected. Must be EL2 or HYP. Reconfigure your firmware to enable that.
> >>>>>>>>
> >>>>>>> Argh my bad, I've now enabled it to start in EL2 mode (attached are
> >>>>>>> the complete logs). Now I see the below panic,
> >>>>>>>
> >>>>>>> [   33.920507] jailhouse: loading out-of-tree module taints kernel.
> >>>>>>> Reading configuration set:
> >>>>>>>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
> >>>>>>> Overlapping memory regions inside cell: None
> >>>>>>> Overlapping memory regions with hypervisor: None
> >>>>>>> Missing resource interceptions for architecture arm64: None
> >>>>>>> [   34.741847] Bad mode in Synchronous Abort handler detected on CPU0,
> >>>>>>> code 0x5a000000 -- HVC (AArch64)
> >>>>
> >>>> "HVC instruction execution in AArch64 state, when HVC is not disabled",
> >>>> origin: EL2 (hypervisor mode).
> >>>>
> >>>> Is KVM off again when you start Jailhouse here? Does the CPU support VHE
> >>>> (Virtualization Host Extension)? Is CONFIG_ARM64_VHE enabled? Try to
> >>>> turn that off.
> >>>>
> >>> KVM was OFF, I have enabled both CONFIG_VIRTUALIZATION and CONFIG_KVM
> >>> (I have attached the complete kernel config). Yes the CPU does have
> >>> VHE support. I did it by disabling CONFIG_ARM64_VHE which did not make
> >>> any difference.
> >>>
> >>> With the VHE disable now I get the below output:
> >>> root@smarc-rzg2l:~# dmesg | grep -i kvm
> >>> [    0.095927] kvm [1]: IPA Size Limit: 40 bits
> >>> [    0.096895] kvm [1]: GICv3: no GICV resource entry
> >>> [    0.096916] kvm [1]: disabling GICv2 emulation
> >>> [    0.096949] kvm [1]: GIC system register CPU interface enabled
> >>> [    0.097045] kvm [1]: vgic interrupt IRQ9
> >>> [    0.097156] kvm [1]: Hyp mode initialized successfully
> >>> root@smarc-rzg2l:~#
> >>>
> >>> Now with the above configs I don't get any output on the console when
> >>> the root cell is enabled:
> >>>
> >>> root@smarc-rzg2l:~# sh -x ./hyp.sh
> >>> + insmod jailhouse.ko
> >>> [   35.379219] jailhouse: loading out-of-tree module taints kernel.
> >>> + jailhouse config check -a arm64 renesas-r9a07g054l2.cell
> >>> Reading configuration set:
> >>>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
> >>> Overlapping memory regions inside cell: None
> >>> Overlapping memory regions with hypervisor: None
> >>> Missing resource interceptions for architecture arm64: None
> >>> + jailhouse enable renesas-r9a07g054l2.cell
> >>> [   36.217465] obcode @arm_dcaches_flush: d53b0024
> >>> [   36.217469] obcode @arm_dcaches_flush: d53b0024
> >>>
> >>> Any pointers on debugging this further, has anyone tried jailhouse on
> >>> Cortex-A55 before?
> >>
> >> Hmm, at least not I so far. Might be the point that we are missing some
> >> subtle difference here around the way the setup works then.
> >>
> > Right.
> >
> >> In any case, the fact that at least the previous crash is gone indicates
> >> that something changed. You could check if you reach now the second hvc
> >> by adding a ret in front of it. If you, you may end up in hyp mode,
> >> maybe just not have a working UART yet (is the model you have on the
> >> board in principle already supported by Jailhouse?), run into a
> >> different issue, but just don't see Jailhouse report of it.
> >>
> > It's not going pass the arm_dcaches_flush statement.
> >
> > With the below diff, I don't see any logs on console
> > option #1
> > diff --git a/hypervisor/arch/arm64/caches.S b/hypervisor/arch/arm64/caches.S
> > index 39dad4af..ce29b8e8 100644
> > --- a/hypervisor/arch/arm64/caches.S
> > +++ b/hypervisor/arch/arm64/caches.S
> > @@ -40,6 +40,7 @@
> >   */
> >         .global arm_dcaches_flush
> >  arm_dcaches_flush:
> > +       ret
> >         dcache_line_size x3, x4
> >         add     x1, x0, x1
> >         sub     x4, x3, #1
> > diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> > index a9cabf7f..c8ebf695 100644
> > --- a/hypervisor/arch/arm64/entry.S
> > +++ b/hypervisor/arch/arm64/entry.S
> > @@ -97,6 +97,7 @@ arch_entry:
> >         ldr     x1, [x0, #HEADER_CORE_SIZE]
> >         mov     x2, DCACHE_CLEAN_AND_INVALIDATE_ASM
> >         bl      arm_dcaches_flush
> > +       ret
> >
> >         /* install bootstrap_vectors */
> >         ldr     x1, =bootstrap_vectors
> >
> >
>
> Forgot: that cannot work. The call of arm_dcaches_flush will overwrite
> lr, thus the second ret will only return to where the first ret jumped
> to - endless loop. You would have to restore lr (x30) from x17 in
> arch_entry first:
>
> mov x30, x17
> ret
>
That did the trick thanks!

diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
index a9cabf7f..7b340bd1 100644
--- a/hypervisor/arch/arm64/entry.S
+++ b/hypervisor/arch/arm64/entry.S
@@ -109,6 +109,8 @@ arch_entry:
        mov     x0, #LINUX_HVC_SET_VECTORS_LEGACY
 1:
        hvc     #0
+       mov x30, x17
+       ret

        hvc     #0      /* bootstrap vectors enter EL2 at el2_entry */
        b       .       /* we don't expect to return here */


With the above diff I do get the below:

[   42.980805] jailhouse: loading out-of-tree module taints kernel.
Reading configuration set:
  Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
Overlapping memory regions inside cell: None
Overlapping memory regions with hypervisor: None
Missing resource interceptions for architecture arm64: None
[   46.582588] obcode @arm_dcaches_flush: d53b0024
[   46.582616] obcode @arm_dcaches_flush: d53b0024
[   46.611311] The Jailhouse is opening.

So it looks like something to do with the debug console. This has to
be poked in the dark or any easy way to debug?

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8uGOP49BWzY1bwprzLzhUXFjfqW6yD1c-LZN7i94mrzbQ%40mail.gmail.com.
