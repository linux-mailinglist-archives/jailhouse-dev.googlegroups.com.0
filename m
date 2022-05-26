Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBB36CX2KAMGQE5UUX4PQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103a.google.com (mail-pj1-x103a.google.com [IPv6:2607:f8b0:4864:20::103a])
	by mail.lfdr.de (Postfix) with ESMTPS id B93AA5351A5
	for <lists+jailhouse-dev@lfdr.de>; Thu, 26 May 2022 17:49:05 +0200 (CEST)
Received: by mail-pj1-x103a.google.com with SMTP id me15-20020a17090b17cf00b001dfa3d25c37sf3438334pjb.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 26 May 2022 08:49:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653580144; cv=pass;
        d=google.com; s=arc-20160816;
        b=iVO7LaHtDF3dWJ/+NZ5rNdWIb5FVJjeV7l6odBSll8O5VzN2vaFmzMfyEU/aXzKDzQ
         Uf5F2+BVC6wkarV/3psOP5lYwtpui3KwK0d9ji1nATPuKOpZFAVFvH+aQd9Mspo0kiag
         XeurMfWb3aZh5bb6XBEAM5U6QYMAzVim7ZAU8utIg4FTdevNWM2qZZ7NNIiRPiBb+mNo
         7E6o57UJsj0DRjilQ8qV8WapPIWzPlNJRJeRd5M+J0v3WnKX3v6F6mBC8S1/4nDuaHdn
         oBfEFS0mJ7V9K8tagZwPVMLFgS48Tp6cUp88vzooyAzv1b/t2BgpLAP9fl70kuV8TK8T
         3tMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=nDTKYHtD+aCNBL7seKNb8EhpOzGU39PSDb8nwNIDCMg=;
        b=X53B4izt7ronAH6QJROnXHZro2Piu/AauXM8XAx9VOIV7nWdPRufcnsPyLGofnK8tI
         pLQEn0m1SVOqZms0m0msAz1FxcM5IGYprbvnghzi/kz2q9j6d972+Odt2vmm95BxeY7G
         IFN2Cth4bwg36E9a1Pco9YYjp+LKfurQwj9d0Aw2l/9PHe++Pd24txhLd2+3QmoZHDyH
         kClSlmAYpD9j2sjTrbp1miasMI4UqpoaV1lUMsIpr7uoJnKzuYLr1XVDphVbzjPw/+cZ
         FRPzXmSVbOrfvEvjbelENJ3BZKeLeFjmy7saOHwzRr71h4OlIZ9C8NKYnM9d0LB5ta0o
         ClXw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=D1ETqG8M;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b29 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nDTKYHtD+aCNBL7seKNb8EhpOzGU39PSDb8nwNIDCMg=;
        b=n/fwq//bdtNlg/rArNl4mRLYRfr8VYYgFayuQP2zpr4qYcvaZPJCHNEmqXQ0wjMgSd
         kxNMAZMuemPNxqncbtUYUm7/lrVwDZQYQv5NEcuTuyTopl7nCYl0HQZbG7+vd1SXU+wd
         R0hKzvms4L9aWrVKwPWHbUVSSU12VEJUENTgCexgJaQ1lyvTYYGcbwE26BpYClFQlqqE
         ZvLjqKxLi3nj1jCTeW3PZ3YAhBw8xQbkuC5eiQ+eXEnSM2nDJKJGNmR9/VbWGhUUKBde
         wD7Bs7vhZsCHnaAY8H1kNIBhLmbYtZuca/caeJv6HwjSFQogkYtNoPCy7HSmUTq1TOaF
         4VoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nDTKYHtD+aCNBL7seKNb8EhpOzGU39PSDb8nwNIDCMg=;
        b=coQgsdpJ4kEBaNCue8E4Yyr0RP9td37UFyIlUkQxFKb20r6sNxJS42ELbJcZJEbGPq
         wZ9eOpd6NbZSsGz3tg9PKcRBi8yYgG4eVcAmyhU8XOy5SLdGQsI4rKt4ff8b881HXTi7
         v4xU2m0z73jYvnXC2OQS6pjdg24Rq4uOmc73T8nia/zYQYrPP2R8H5MiIA3aBO3dRhxe
         +Wa0vCe3NtLcbPnqE6Dp8khGO5Bh6nRk/j+/XLKZv0/B2WYJb8R6HC6FYPnhjf0iHCp4
         XwN+iqfp7S+WmQmca6cvHS+YLJ+ohluVRkGjO9NYLh1EdrgGpVFsQA/TA1HJXmmP60F/
         dGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nDTKYHtD+aCNBL7seKNb8EhpOzGU39PSDb8nwNIDCMg=;
        b=Rql8fWMwbOZ07GOEDq5ldIhDdDqTCQc/ZOfhjZNlqgk/l7h4W2FMRTrX9hWK/jCeSP
         uv+6RuE+rbAqfouOmTD3E+UrEqeWlFmzzI6iR8H2WElRy7M+MdPz7MOOrpE2qDYQL63P
         MVt7cr2tNMe1adQZt/TD9XqY1lzSfbmwsPZRWcVrYHedBIJZddc2IhEVT/NWMEM/tsqW
         YWaBhH032mUMYitDCysUFfV89LgpyQMPlQfTYkk8buBpKUYFK3dProlwtyM01yAO9Xu5
         dgLPoDuXpCRA+VUZTThLHT5i3LC9S2vaxi68a2vRwjgKRLzlM4+4pZ/H9iVMEZcKBxVX
         NfmQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533dYqjYJXnVyZF4S2lECd8LmBoH65uSgiTsAAaY3xhR0QFXIQni
	C7eXzZHAkeevIBRk9uXiFwM=
X-Google-Smtp-Source: ABdhPJwez560CKVU6Xefo8e6CXVOqBnQUZlE9hAJvAzoBLogE7nq3OodfHOzxVaCsAdb0i7LV+35MA==
X-Received: by 2002:a17:902:db04:b0:161:9fb0:b85d with SMTP id m4-20020a170902db0400b001619fb0b85dmr38220247plx.143.1653580144075;
        Thu, 26 May 2022 08:49:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:903:120d:b0:163:5092:2963 with SMTP id
 l13-20020a170903120d00b0016350922963ls4619456plh.2.gmail; Thu, 26 May 2022
 08:49:02 -0700 (PDT)
X-Received: by 2002:a17:902:ef49:b0:15e:b6ed:4832 with SMTP id e9-20020a170902ef4900b0015eb6ed4832mr37753358plx.173.1653580142839;
        Thu, 26 May 2022 08:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653580142; cv=none;
        d=google.com; s=arc-20160816;
        b=dRNBrSNpKHsKXHJ/evaP93FHmg5OoLpEW3BXU15scxHMOZReYdzcSKwcFRO/jfYtq5
         Kkidv6Fy2XmiJ7XYmP0WW07zVbw0vRI02YF+t1xV8a593IN5qThehKiaOSQUPPvbF+S3
         UNAgL4M0KuW9gGMfnY3qhYLPrrDEqf5lAGf0F8ZG0iUBQe6UytyDLYrdRpapgCj9TZQ0
         gCeQw5oWYWeVkFNd/BYbIR80xdVtoLMe7/dxCynC9BjyFHB7tBwEQukhu4v9fFNxrtle
         mV3pC5uXZfx4bhM6/LFmDSqgUnGsXjDZGKH0vKp/i1doKbKa+VBf1cC+k4dO6i/TqA7f
         pG4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bbYltuLkQJWk0v3D9XU/3HDw1IQ/frrt/td5Gv1tb6w=;
        b=kSB9fXygtgvFfb/IMy9SMzx0M+PUfVNba5tE05bnoGmbPGHufQ9snqCDonIJhu723D
         2sba1XB1sj1ck7Y5U1mAhOuNJr7f/qWjk4S48ZNudg9vwh3dxjI6W3j6TgqwikmobL/W
         Dk6GlzcF9SXo6tY/lnwlq+GyPVYSsCrEM9Zhc9Pw5h9kC84LyqJ1gAzpN9Rh4fwA8BHq
         ETsOzTYSnXawCD5j+oOemDgG0G8okm2ixkgP88PO6tmPNemrI8fVhMT8Eba6j6vGyHeW
         vrKlQxtpKlDMnXKNeqvvuy45Q9GsPRQh63zZN+elKGu0YblAzU2pOkkB29NIF0pAsmFb
         65mg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=D1ETqG8M;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b29 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com. [2607:f8b0:4864:20::b29])
        by gmr-mx.google.com with ESMTPS id ix4-20020a170902f80400b00156ad216c72si77431plb.8.2022.05.26.08.49.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 08:49:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b29 as permitted sender) client-ip=2607:f8b0:4864:20::b29;
Received: by mail-yb1-xb29.google.com with SMTP id o80so3614838ybg.1
        for <jailhouse-dev@googlegroups.com>; Thu, 26 May 2022 08:49:02 -0700 (PDT)
X-Received: by 2002:a5b:48a:0:b0:652:e0a1:7a44 with SMTP id
 n10-20020a5b048a000000b00652e0a17a44mr11901063ybp.182.1653580142001; Thu, 26
 May 2022 08:49:02 -0700 (PDT)
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
 <385f8761-8d70-d0c4-f903-9adadb3c9a90@siemens.com> <CA+V-a8uGNUis=XLwewkePUTUDrJp0QBfgkaOMf=8KvPJh4pW_A@mail.gmail.com>
In-Reply-To: <CA+V-a8uGNUis=XLwewkePUTUDrJp0QBfgkaOMf=8KvPJh4pW_A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 26 May 2022 16:48:35 +0100
Message-ID: <CA+V-a8uA+y-p5GmYavLpc6s1O-TJiRGSkpRHM4-dEA=XsqU_mA@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=D1ETqG8M;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::b29 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Tue, May 24, 2022 at 12:55 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> On Mon, May 23, 2022 at 4:13 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >
> > On 23.05.22 15:55, Lad, Prabhakar wrote:
> > > Hi Jan,
> > >
> > > On Fri, May 20, 2022 at 7:08 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> > >>
> > >> On 19.05.22 15:23, Lad, Prabhakar wrote:
> > >>> Hi Jan,
> > >>>
> > >>> On Thu, May 19, 2022 at 12:39 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> > >>>>
> > >>>> On 19.05.22 11:44, Lad, Prabhakar wrote:
> > >>>>> On Thu, May 19, 2022 at 6:30 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> > >>>>>> Forgot: that cannot work. The call of arm_dcaches_flush will overwrite
> > >>>>>> lr, thus the second ret will only return to where the first ret jumped
> > >>>>>> to - endless loop. You would have to restore lr (x30) from x17 in
> > >>>>>> arch_entry first:
> > >>>>>>
> > >>>>>> mov x30, x17
> > >>>>>> ret
> > >>>>>>
> > >>>>> That did the trick thanks!
> > >>>>>
> > >>>>> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> > >>>>> index a9cabf7f..7b340bd1 100644
> > >>>>> --- a/hypervisor/arch/arm64/entry.S
> > >>>>> +++ b/hypervisor/arch/arm64/entry.S
> > >>>>> @@ -109,6 +109,8 @@ arch_entry:
> > >>>>>         mov     x0, #LINUX_HVC_SET_VECTORS_LEGACY
> > >>>>>  1:
> > >>>>>         hvc     #0
> > >>>>> +       mov x30, x17
> > >>>>> +       ret
> > >>>>>
> > >>>>>         hvc     #0      /* bootstrap vectors enter EL2 at el2_entry */
> > >>>>>         b       .       /* we don't expect to return here */
> > >>>>>
> > >>>>>
> > >>>>> With the above diff I do get the below:
> > >>>>>
> > >>>>> [   42.980805] jailhouse: loading out-of-tree module taints kernel.
> > >>>>> Reading configuration set:
> > >>>>>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
> > >>>>> Overlapping memory regions inside cell: None
> > >>>>> Overlapping memory regions with hypervisor: None
> > >>>>> Missing resource interceptions for architecture arm64: None
> > >>>>> [   46.582588] obcode @arm_dcaches_flush: d53b0024
> > >>>>> [   46.582616] obcode @arm_dcaches_flush: d53b0024
> > >>>>> [   46.611311] The Jailhouse is opening.
> > >>>>>
> > >>>>> So it looks like something to do with the debug console. This has to
> > >>>>> be poked in the dark or any easy way to debug?
> > >>>>
> > >>>> Well, we do not yet know what goes wrong. We do know that we can call
> > >>>> into the hyp take-over stub and register Jailhouse with it. We do not
> > >>>> know if we will then end up in Jailhouse in hyp mode and just lack
> > >>>> console output or if we crash on entry already.
> > >>>>
> > >>> Right agreed.
> > >>>
> > >>>> To move the uart console out of the picture: Did you already check if
> > >>>> the driver you select in the Jailhouse config is actually one that
> > >>>> should support the UART on your board? Next is to double check if poking
> > >>> The UART on this platform is almost identical to
> > >>> JAILHOUSE_CON_TYPE_SCIFA type, but with some differences which I have
> > >>> patched to work on this platform.
> > >>>
> > >>>> registers in the way the Jailhouse driver will do at the addresses you
> > >>>> configured will work: Pull the code into the kernel module or even into
> > >>>> a userspace application with /dev/mem raw register access and try out if
> > >>>> that works in a "safe" environment (without hypervisor mode).
> > >>>>
> > >>> Sure will give that a shot, any pointers on doing this from userspace?
> > >>>
> > >>
> > >> Something like this may help if you do that the first time:
> > >> https://bakhi.github.io/devmem/
> > >>
> > > Thanks for the pointer.
> > > I have tried reading/writing from the hypervisor location and that
> > > goes all OK.
> >
> > Means, you were able to generate output on the UART. Hmm, would have
> > been too easy.
> >
> No I meant I was able to read/write into the hypervisor memory which
> is reserved in DTS.
>
> > > To avoid any issue related to debug UART is there any way
> > > I could test this prior to enabling?
> >
> > Not without extra measures: Without JAILHOUSE_BORROW_ROOT_PT, which
> > applies to arm64, the driver will not map the physical UART page. That
> > only happens in init_bootstrap_pt which is run after jumping to EL2. So,
> > we the jump goes wrong, you cannot find out where you are.
> >
> I see. Just to confirm it's not the debug UART the watchdog is enabled
> in Linux and I see the platform reboots after 60 seconds, which is
> hinting we are seeing a kernel freeze.
>
> Just a fyi I tried the queues/jailhouse branch from [0] and still
> seeing the same issue.
>
> > Do you have the chance to get hold of some jtag to find out where the
> > CPUs are?
> >

X0   FFFF00063F7ECD88  X16                 0  ^S+ ^Stack_________+
X1                  0  X17                 0
X2                  0  X18  FFFFFFFFFFFFFFFF
X3   FFFF8000112870E8  X19                80
X4   FFFF00063F7ECD80  X20  FFFF800011179000
X5   FFFF800011179A48  X21  FFFF80001130BE70
X6   FFFF80001101E000  X22  FFFF800010DFDED8
X7   FFFF800011179000  X23          86000004
X8   FFFF00063F7ECD80  X24  FFFF80001101CB38
X9                  0  X25  FFFF800011308000
X10          00040000  X26  FFFF80001130C000
X11                 0  X27  FFFF800011182A40
X12                 0  X28  FFFF800011182A40
X13  FFFFFFFFFFFE0000  X29  FFFF80001130BC40
X14  FFFF800011192008  X30  FFFF800010B3B464
X15  FFFF800011192048  PC   FFFF8000100D9F78
--------------------------------------------
CPSR     80000085   N N  I I  SS  _
EL1h                Z _  F _  IL  _
nsec                C _  A _
                    V _  D _
--------------------------------------------
Current ELx:           SP   FFFF80001130BC40
                       ELR                 0
                       SPSR         20000085
--------------------------------------------
EL0:                   EL1:
SP   FFFF800011182A40  SP   FFFF80001130BC40
                       ELR                 0
                       SPSR         20000085

EL2:                   EL3:
SP   0000FF0000011000  SP           4400A500
ELR  FFFF8000104CC8A8  ELR  0000FFFFC02064AC
SPSR         20000085  SPSR         200003C9
--------------------------------------------
SPSR_ABT            0  SPSR_SVC     20000085
SPSR_IRQ            0  SPSR_HYP     20000085
SPSR_FIQ            0
SPSR_UND            0  ELR_HYP      104CC8A8


Above is the CPU state, when the kernel freezes. Any hints on what
might have happened?

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8uA%2By-p5GmYavLpc6s1O-TJiRGSkpRHM4-dEA%3DXsqU_mA%40mail.gmail.com.
