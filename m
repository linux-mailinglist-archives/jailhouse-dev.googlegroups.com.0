Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBWGU6OJQMGQER35GRDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id A998F524AF0
	for <lists+jailhouse-dev@lfdr.de>; Thu, 12 May 2022 13:07:06 +0200 (CEST)
Received: by mail-oi1-x23a.google.com with SMTP id bd41-20020a056808222900b003268c490a15sf1807303oib.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 May 2022 04:07:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652353625; cv=pass;
        d=google.com; s=arc-20160816;
        b=L4tHbrR1SmxS7p7Ku/Jt+XKllFHA3SJ2fgaV68AHVeiIXf3KVT1vIVmOHASHGoB4wY
         ZOzf9ukAKVi/yDeRrmohAheL6zcgzuNQnBI6tRZ5j0K4IxGUx5yf+kkjPRY9UAKuj2PT
         lW+UBiRBdE6t9GMPnILwXWyV89zBkR35wznVheBpStOKUO31/2AHet2l6XDbMsS2FiZ2
         R1t4WcbXeyiMJ0umrYHUzHUxAw12oCxypS2K406y9nuv/oh8+sV2PEgn0zYFISsHilxj
         QQxnZin4xIhpR8FrPb6ctR6V0rCuyZOud2jAEknzKZouSx5FHZT31hveJB2/uTxrhvHQ
         XGBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=1ULnp1Dl5eE5sAR4qH/nnLbZUzuP8bAHS6Uv57r09fY=;
        b=jR/TprNa/4o6qzLAeG/nYSmeEHSU9JOoZRx6YhBhLOlVHm6ZYnqRAPy8qPH7m+mjWe
         L4moPkSaFFJCt5oichU6opkHy4V2mATe3nqt76swuTOYXcXY22wkCT5NOD14CFaTL9fF
         I21pOmMqOJPqVIjDAVwIDqSd87nQYLai84V4LVhDxxiVV+3qgRm5jtY4+i/9ytpuBSLn
         nR9by/NBmcg77y81VtJX8ZnTLDyYosFF81pXxkXdPgB/BHYOH4lq5ZlcjB8KXMdOWg0t
         PSCLz0oMzA/a/yy3hg1psyoNEJEPx614yIoYx9EF7zQxbOYkp6+uXBHojPyXoYnSijXg
         P0HQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=F3hO30tK;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1133 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1ULnp1Dl5eE5sAR4qH/nnLbZUzuP8bAHS6Uv57r09fY=;
        b=QOvyU5/Nv77AtX3bJ/HJdNLq6OQeX1EOaelqdSvh0cuwk+RQgvZB3wtttZFobw5PJy
         t8xNml+ZW+soVsxlvEiQ7VuJprZhg9qFfGKVRKAyFVbWGJ3lNrTLASus3gKNon+Hh47R
         e0TUzti7MQ8LP3E2u3Ux7iQhER29ZIV47Ll5Zt9MSm9nIEJIrAwWHd44LHLUKkUpCqb1
         t76bmF4IdggYJxNoZGvQy3A/NaMzuuXI4WN1zGpgouvPe62LIjllZ68SFoUNyNNx5yge
         H7wk3AuUPPAZEh6JsFQ6pb7XWXqDYNlff+NArWMBMtuknp2dA5b7xk80AID8isiJq27z
         DB9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1ULnp1Dl5eE5sAR4qH/nnLbZUzuP8bAHS6Uv57r09fY=;
        b=VtO0mw1g239UKyvvD3n8NdlIdY60OZbqa6qil/HP+o0J/pz7B6xx0AzhcNeO6GtlHl
         ES6ZAQafUgkRJgDXHIlB810AlO9TG0qCTDNdqWAr04KCP2x/9JNNqJzU5OjRVbQnAqMn
         lESC35VZ6JSxy+BVBHThQRLd5hWKP/tE4DW4Wgi8B7k/tTmTR83Dt6TWIUV4TtBKEfNn
         65O/CL3z4fEdmvOZnLroA1HK2BdmIbT6R2OQmNQk+wanAX7IPOjxZDdGbjM+SmmJJfcZ
         FxX7uJKu5OjI6POzPAvMafE4xhgJYIAhToS1osJEpGn84EfDPXv3tHpmYCVagK2iCfdD
         RqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1ULnp1Dl5eE5sAR4qH/nnLbZUzuP8bAHS6Uv57r09fY=;
        b=LAe/fbX5ebQ97HCZAXOIwOdtpdSL1RJW+7gVS/ISAsiS2IqjYZMp9jn/jlPGjqU3x4
         jvbAmA1IJgwlTCubUXzr5sSJZnQdtpdbbZLHOj80iGACETRaqMbolBACX7wmpyyIGjF4
         lBueUdbF5qaXw9LLZLPL24jzevsn5jQO4Tu0/Ksh0AP1/xcHcLUHMU1xHDUpPPMDf0Mz
         xm4kicLDvQBPiY+eI4HuPJhPMPzNGbqavNM6sIFgTzCyo6BBolMSRQZpZ7ycMKBqzhFk
         t+CrlfXXZ2y4/W9IGkSvKR3KfbAkKThBHtxmBW/Nm8KY5fLfZYH/MySpydEWWYBR2Qmo
         ZdGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532MYNn6mcOOadxODcMc4JdXYSkLgbmNfqGPBBscvcetjd6x2eK3
	wAPAikfSAD/IB/eLRvyyME4=
X-Google-Smtp-Source: ABdhPJynMgAqRlrE4PYbpUcBFF64Er92FZWoe7GsPvwotWsS291HDkwTNF7DCZJRykaNgBmf4mxBDQ==
X-Received: by 2002:a05:6870:424c:b0:ec:84d2:67e0 with SMTP id v12-20020a056870424c00b000ec84d267e0mr5375746oac.18.1652353625283;
        Thu, 12 May 2022 04:07:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:2405:b0:d7:627b:b530 with SMTP id
 n5-20020a056870240500b000d7627bb530ls1941122oap.9.gmail; Thu, 12 May 2022
 04:07:04 -0700 (PDT)
X-Received: by 2002:a05:6870:b3a2:b0:e9:f22:5819 with SMTP id w34-20020a056870b3a200b000e90f225819mr5013666oap.293.1652353624541;
        Thu, 12 May 2022 04:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652353624; cv=none;
        d=google.com; s=arc-20160816;
        b=R1QYQK0m9Y2KB8vvLUVXUHSOsJSdmFzvHEVXVIz7urYOIfjerep3ktSlkzPZu8XHZe
         umwxfkdR0bavzpmhCsO9VDXcKaNLef4MJBRZ+L2aUt/+WWEMEJY8QyMAxChhF8Py7q1c
         GyS5mkmVSOJ4kQxela2NUAjxbWj+n4MgV+wDEeAk9qYAG+eZcBWgsk98LJduP6JQtShK
         P9ehGgkRZExhuJHIEHGZvqP3h8mHN5lzKwL4ygC+FFdJ0chdu8m9PJprv+dDuRWfZ7I3
         E+hOWvNeqsXImRxk2b02QL4qiQANY/MZ72toL6iY2C15EZSb+wYsLFBir0MUdsCNt8Qt
         K6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZE2UKVPms+k5/OHZfx7uM4hDyUU9ROnQFgYU9Zdl/lI=;
        b=qGyK5s1Iagp4LFkwY/MJF3BYn/yi2oUp7ZygpMWkrLb7+jLjVxY4lUKa13l3tuo8/V
         WfI5R7N1zVYlXopB4mrOGBMzVBg+AydX6sY/NQFm66xSmxLBCevhHfofjEMyONkSCnPg
         f1SmrEQNLnaxQTVPJIQDxbvp9rpTf/bXpnVQLaZHhtfnqX90D61IeURbqtMUfhKaLTx+
         Zg5UdL5xbzlkqeVWic0FjG6nzMvwO54nFGyXIbjEzSKP+3E4fSKjMK0ull0WS3dMHeEy
         ux+KnO/tm2Re9p3qqPd0lMIMM+4r6IlU/uWaaK5nkZDp/ad37UvAZTsJYq1u7pLKBueK
         GyPQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=F3hO30tK;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1133 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com. [2607:f8b0:4864:20::1133])
        by gmr-mx.google.com with ESMTPS id e4-20020a0568301f2400b00605f6345a99si392938oth.3.2022.05.12.04.07.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 04:07:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1133 as permitted sender) client-ip=2607:f8b0:4864:20::1133;
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2f7d621d1caso51435127b3.11
        for <jailhouse-dev@googlegroups.com>; Thu, 12 May 2022 04:07:04 -0700 (PDT)
X-Received: by 2002:a81:6a46:0:b0:2f4:dc3f:e8f8 with SMTP id
 f67-20020a816a46000000b002f4dc3fe8f8mr31134579ywc.292.1652353624045; Thu, 12
 May 2022 04:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com> <d22051fb-2c80-2d88-af8c-5f1ccdb69197@siemens.com>
 <CA+V-a8sQAYXHykiGqn8DD8=cL4fv4NcszvgFgza2gE3_MCyRmQ@mail.gmail.com>
 <37be2e7c-c1f4-c5b6-f200-8d1cc48e0ee5@siemens.com> <CA+V-a8t-wvud8MF0oyAsHBSUuVQrrkqSr9RWE2tQLCoOzuQikw@mail.gmail.com>
 <fe2e7e92-8530-9913-307f-85437412fd81@siemens.com>
In-Reply-To: <fe2e7e92-8530-9913-307f-85437412fd81@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 12 May 2022 12:06:37 +0100
Message-ID: <CA+V-a8sgPXsMmsKYwE6etP=JG8Ef83Qz4RHoWAZKeHdVHhk_Pw@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=F3hO30tK;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::1133 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

Hi Jan,

On Thu, May 12, 2022 at 11:24 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 12.05.22 09:01, Lad, Prabhakar wrote:
> > Hi Jan,
> >
> > On Thu, May 12, 2022 at 6:45 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>
> >> On 11.05.22 19:09, Lad, Prabhakar wrote:
> >>> Hi Jan,
> >>>
> >>> On Wed, May 11, 2022 at 4:11 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>
> >>>> On 11.05.22 13:20, Prabhakar Lad wrote:
> >>>>> To add further more details:
> >>>>>
> >>>>> I am using jailhouse-enabling/5.10 Linux branch [0] with -next branch
> >>>>> for jailhouse [1].
> >>>>>
> >>>>> I added some debug prints and I see the panic is caused when entry()
> >>>>> function is called (in enter_hypervisor). The entry function lands into
> >>>>> assembly code (entry.S). I dont have a JTAG to see which exact
> >>>>> instruction is causing this issue.
> >>>>
> >>>> So, already the first instruction in the loaded hypervisor binary is not
> >>>> executable? That would explain why we see no hypervisor output at all.
> >>>>
> >>> To clarify when the hypervisor is loaded the output will be via
> >>> debug_console specified in the root cell config?
> >>>
> >>
> >> Correct - if you reach entry() in setup.c.
> >>
> >>>> Was that memory region properly reserved from Linux (via DTB carve-out
> >>>> e.g.)?
> >>>>
> >>> Yes I have the below memory reserved in my dts:
> >>>
> >>>     memory@48000000 {
> >>>         device_type = "memory";
> >>>         /* first 128MB is reserved for secure area. */
> >>>         reg = <0x0 0x48000000 0x0 0x78000000>;
> >>>     };
> >>>
> >>>     reserved-memory {
> >>>         #address-cells = <2>;
> >>>         #size-cells = <2>;
> >>>         ranges;
> >>>
> >>>         jh_inmate@a7f00000 {
> >>>             status = "okay";
> >>>             no-map;
> >>>             reg = <0x00 0xa7f00000 0x00 0xf000000>;
> >>>         };
> >>>
> >>>         jailhouse: jailhouse@b6f00000 {
> >>>             status = "okay";
> >>>             reg = <0x0 0xb6f00000 0x0 0x1000000>;
> >>>             no-map;
> >>>         };
> >>>     };
> >>>
> >>> Linux does report the hole in RAM:
> >>>
> >>> root@smarc-rzg2l:~# cat /proc/iomem  |  grep RAM
> >>> 48000000-a7efffff : System RAM
> >>> b7f00000-bfffffff : System RAM
> >>>
> >>> And below is my root cell config related to hypervisor memory:
> >>>
> >>>         .hypervisor_memory = {
> >>>             .phys_start = 0xb6f00000,
> >>>             .size =       0x1000000,
> >>>         },
> >>>
> >>> Is there anything obvious I have missed above?
> >>>
> >>
> >> Nothing obvious to me so far.
> >>
> >> So, is this really the first instruction in
> >> hypervisor/arch/arm64/entry.S, arch_entry, that triggers the undefinstr?
> >> Check the reported address by Linux against the disassembly of the
> >> hypervisor. You could also play with adding 'ret' as first instruction,
> >> to check if that returns without a crash.
> >>
> > I did play around with ret, below is my observation:
> >
> > Up until line 98 [0] just before calling arm_dcaches_flush adding ret
> > returned without a crash. Adding a ret at line 99 [1] ie after
> > arm_dcaches_flush it never returned.
> >
> > So I continued with adding ret in  arm_dcaches_flush, I added ret as a
> > first statement in arm_dcaches_flush and was able to see the panic!
>
> Which Jailhouse revision are you building? Already disassembled
> hypervisor.o around arch_entry and arm_dcaches_flush? This is what I
> have here for next:
>
I'm using the next branch too.

> 0000ffffc0203efc <arm_dcaches_flush>:
>     ffffc0203efc:       d53b0024        mrs     x4, ctr_el0
>     ffffc0203f00:       d3504c84        ubfx    x4, x4, #16, #4
>     ...
>
> 0000ffffc0204800 <arch_entry>:
>     ffffc0204800:       aa0003f0        mov     x16, x0
>     ffffc0204804:       aa1e03f1        mov     x17, x30
>     ...
>     ffffc0204844:       d2800042        mov     x2, #0x2                        // #2
>     ffffc0204848:       97fffdad        bl      ffffc0203efc <arm_dcaches_flush>
>
> You could check if there is such a relative call in your case as well.
yes it does exist, below is the snippet:

0000ffffc0204000 <arch_entry>:
    ffffc0204000:    aa0003f0     mov    x16, x0
    ffffc0204004:    aa1e03f1     mov    x17, x30
    ffffc0204008:    10fdffc0     adr    x0, ffffc0200000 <hypervisor_header>
    ffffc020400c:    f9402412     ldr    x18, [x0, #72]
    ffffc0204010:    5800fd0f     ldr    x15, ffffc0205fb0 <sdei_handler+0x2c>
    ffffc0204014:    900000e1     adrp    x1, ffffc0220000 <__page_pool>
    ffffc0204018:    79406002     ldrh    w2, [x0, #48]
    ffffc020401c:    d2880003     mov    x3, #0x4000
 // #16384
    ffffc0204020:    9b030441     madd    x1, x2, x3, x1
    ffffc0204024:    f842c02e     ldur    x14, [x1, #44]
    ffffc0204028:    5800fc8d     ldr    x13, ffffc0205fb8 <sdei_handler+0x34>
    ffffc020402c:    f840c02c     ldur    x12, [x1, #12]
    ffffc0204030:    cb0d018b     sub    x11, x12, x13
    ffffc0204034:    924051c1     and    x1, x14, #0x1fffff
    ffffc0204038:    8b0101ef     add    x15, x15, x1
    ffffc020403c:    f9001c0f     str    x15, [x0, #56]
    ffffc0204040:    f9400401     ldr    x1, [x0, #8]
    ffffc0204044:    d2800042     mov    x2, #0x2                       // #2
    ffffc0204048:    97ffff6c     bl    ffffc0203df8 <arm_dcaches_flush>
    ffffc020404c:    5800fba1     ldr    x1, ffffc0205fc0 <sdei_handler+0x3c>
    ffffc0204050:    8b0b0021     add    x1, x1, x11
    ffffc0204054:    d2800000     mov    x0, #0x0                       // #0
    ffffc0204058:    f100025f     cmp    x18, #0x0
    ffffc020405c:    54000041     b.ne    ffffc0204064
<arch_entry+0x64>  // b.any
    ffffc0204060:    d2800020     mov    x0, #0x1                       // #1
    ffffc0204064:    d4000002     hvc    #0x0
    ffffc0204068:    d4000002     hvc    #0x0
    ffffc020406c:    14000000     b    ffffc020406c <arch_entry+0x6c>

> Then you could check, before jumping into arch_entry from the
> hypervisor, that the opcode at the actual arm_dcaches_flush address is
> as expected. But maybe already the building injects an issue here.
>
Any pointers on how I could do that?

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8sgPXsMmsKYwE6etP%3DJG8Ef83Qz4RHoWAZKeHdVHhk_Pw%40mail.gmail.com.
