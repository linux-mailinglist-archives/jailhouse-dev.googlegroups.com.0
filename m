Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBB54JTGKAMGQEPUJIZFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93e.google.com (mail-ua1-x93e.google.com [IPv6:2607:f8b0:4864:20::93e])
	by mail.lfdr.de (Postfix) with ESMTPS id 5807652D3DC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 May 2022 15:24:09 +0200 (CEST)
Received: by mail-ua1-x93e.google.com with SMTP id x5-20020ab06405000000b003687fa76136sf2493915uao.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 May 2022 06:24:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652966648; cv=pass;
        d=google.com; s=arc-20160816;
        b=SkR9bWp7v9bT9wVmB46kvEkCpd3SfFITP5FmYtjCja4ziTBxn2d/yMxhztHl3Ih27p
         L6xV9TgU6VZ7wi6weVPiU/LYQJnoZYk1fjtod31pZcKi+8SQNGPSwqxWRv0mHpb4yj0P
         wA9xLML3/xnoyT9w2bXnu4YoKA+pwBlgIMvZnaTwdZi0kjPf5Eq5q2GawQzi2P+xIDg3
         mrzBnvgrTxoF51dKaa6RKaBYy6JpX3v2eVsQb9eDSxMJ1TJ+cZrFyV6TWvm9b3mwsXJa
         bg8UgI8qqtJp1FvWXMrkL2TufcTc8p1kugcynKcivrxUrtsIpkf5ITy6mjPN2sZ40dtZ
         IqlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=rN9unNgxkbPiB/pmA/MCeR5IX2nlAOlTQ/7qi0uVtxc=;
        b=viHbNJg4hCDVRdXhivme2QePKZ5mm3vUChYRAlOnIQt0wsPrbC8BJdX+VieLmGb9Ih
         nOBHq8dKk2JCpDjeD0aMLG3vxuh/qv2WQ/SPe8F11biIk7hFVdhrWIeqxeKyUjZupe6O
         mek8sKrFRqU24FsJKOBpk8JZWsxPJM3L9403w1eBgBkZ4nDGKqKl2K3ruKFch2SDhlDI
         ddms42j7BHR9CEYDaAEIjuwee5WGQbQ/jnV8R0W6aq0wcXE/+faLfk9EKDyvp31xuuhl
         lHBjNJ7FdgLqU6371j9zTCGxVeuXX1QfEJevTOJ8WXAHyMYjJ8wkSYuvCNnic1gZ0twU
         mgrA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qg4kw9x+;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::112a as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rN9unNgxkbPiB/pmA/MCeR5IX2nlAOlTQ/7qi0uVtxc=;
        b=lKs61Ie7o2+oG2vI+IwZt29BIrj7MNJvLrQeFP//5mS3U1g7L+UOcrSdiCPKNrlN1A
         HGtcORoVGPiBHbynFPDaoA5a73+f8Qc1i3CeCIV91gHpdorKfbPv4R3CtYNWe+IbPfon
         m1Ery5Sr5UONJBr+aEFMBNoNKixkKl3QFKbFtz2GXk/Wid3TSqrs5WmQAIP35aa7ycvp
         ssbgDoLGs7fthN3S653cLU/yh2hvX/MKPlIg5Jw4HOsTIqM26lW1RbNDnYqqrO37JaCp
         6bgaZvMaN/drnm2ifkd2mJ4PwNxZhf4wkETKN3L9/bAJYpq47PY8Tb1Yyw+pQiPbzNY5
         Gxew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rN9unNgxkbPiB/pmA/MCeR5IX2nlAOlTQ/7qi0uVtxc=;
        b=KPlxvy/1lPAbiNZHvCiQZ0eYoy/earwb1OPaZ+2K03nLOM8sRYsBEbCn8KQGLPLYMh
         699dWyEKor7NTBSZ7j40SfzBVL0GAq2nC4FliKPa/OXZYrLjCpZujJ+F+W1nkO9jMyyH
         nJvZLV+LWS9wQeqJ9fwmGaxprj7k+HUWu0tCng5KFgzuVkGQXgoXvtBI3o5at0PEokJ7
         4ZsIPOFptDQIUXBxJHytvqEcVbVR0DzdsXzGbOEH/GgTVsla5n73A2Z7LW5hCIGs3eXN
         nNjETWW7Hm7NrkpocDHtjSCPWJCaATOYCOkw3C2VstgbzRaHqC3BUoIsliCSOgT2Hx4a
         9k6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rN9unNgxkbPiB/pmA/MCeR5IX2nlAOlTQ/7qi0uVtxc=;
        b=5ej7tDyTeyN3Ukvhx9N7ocz1f1C0yphr71QBLQ51zyCOW8wdrViud1/2eOjLJ/frBv
         WXWTYEXd7HjBvoBfBTMaxL8juauM1uxCXvWFqepB4iEdegzwhqrlnwZ0ob6/HKzgSJso
         hr/Y4bMF7bPu7o9U6yD9G+14RYE/v9VwuyEIOEo303marZ3IpqxPtaqjbEEAnJ39heUI
         WpGQKHnvijCuxvqRonuio8FOTwuWJR5wrjwJmrxvKrqWXvvHBaZjLDpMzxoN7qmb3kfy
         0Z5pM03PnTT07AjJl7IuXJAc7eGLpPmj7ZppMAXJ1sDfATbzj8HqG5TPe9soXN5/N2eG
         mt/A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530GhXHdqna6WB2dQr0ELI3b/ICwKkOkS7ZGEHFidFtYje5K71U/
	59CTcw6sWhdhfGw9HgzdfUA=
X-Google-Smtp-Source: ABdhPJyOLxjp3afOHvJmMvM7WRRZbeuI9I7nOFRDxRhnUJz6MSbkTOgqVPQDAGfLijAfuT6Y2Vc9oA==
X-Received: by 2002:a1f:78c2:0:b0:357:332b:e712 with SMTP id t185-20020a1f78c2000000b00357332be712mr1093684vkc.8.1652966647927;
        Thu, 19 May 2022 06:24:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:549d:0:b0:368:b708:a6ce with SMTP id p29-20020ab0549d000000b00368b708a6cels205909uaa.9.gmail;
 Thu, 19 May 2022 06:24:06 -0700 (PDT)
X-Received: by 2002:a05:6130:92:b0:368:bebc:e1d0 with SMTP id x18-20020a056130009200b00368bebce1d0mr1992880uaf.75.1652966646944;
        Thu, 19 May 2022 06:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652966646; cv=none;
        d=google.com; s=arc-20160816;
        b=SA9B7HexC07RjTZvEGgve/DiJrkaZgEknwiT0WUbWCZ7vhXgyG7aljlFlwr/9+fnoI
         TGOyW6hnhcnE62kYtVyvCSbHh/f4j/3Vmt68bjSmgCRfOzZVkcpkesC0IOuc0QbELdTm
         VTzwJAwj4V84o3Fe4842PbHW+ayL+mCRcEJhXuvQuSFFcxr2IfY+hwKzgBb2TtPc0jQg
         Uez7SILD45yYLxehbL5rtLElJLDuZf9lc/9xqONlLdTsVIHJHoivEVe53S5EHpfbUW6a
         p4A0jtKzD5JCajjhCbeiPojJdqB/nvIJMF+2s/5J9ANIxCbMKtv5UKT/vddW9Jg3Feyz
         xxwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/KB0gzQh1t8YjQjiGNI+Am55lT5HLmK3UNqKgMl13u8=;
        b=Cf295kDVUoxNtGJLbldPZVGIHR40XH5HqCLvODFiDWs7HdTi0GeN+WkON7p71NWprs
         qgpPidM83fEEZSdXc9g9U5aGBXhnXn2LMM7Gz4Rd0liI6nP8bN4b3Jv2hIbLu7fS3+sB
         njaGeiZGVskAKm2JyJgJuxKK+rbnUgF0YYshNMxjSp4Ws8FcArtdMOYGzNf2PNKdSr0y
         YxLZTNZ0rFFCkk1CXR1t/6dK+axlyrgnJXk3ptuzcXweBW2PhEeCg2c6AtJh+UDqX3JU
         i6SIq6Hrkm6mlLeui+QOfnV7dlMwh2VtsREs2HfCPaXyx5bznziV/+VVRkiNtPnS6LFU
         l39Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qg4kw9x+;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::112a as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com. [2607:f8b0:4864:20::112a])
        by gmr-mx.google.com with ESMTPS id a9-20020ab03c89000000b0035fc4b18c67si149005uax.2.2022.05.19.06.24.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 06:24:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::112a as permitted sender) client-ip=2607:f8b0:4864:20::112a;
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-2fefb051547so56605147b3.5
        for <jailhouse-dev@googlegroups.com>; Thu, 19 May 2022 06:24:06 -0700 (PDT)
X-Received: by 2002:a81:6f57:0:b0:2ff:23fb:b50 with SMTP id
 k84-20020a816f57000000b002ff23fb0b50mr4857067ywc.78.1652966646534; Thu, 19
 May 2022 06:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <CA+V-a8sgPXsMmsKYwE6etP=JG8Ef83Qz4RHoWAZKeHdVHhk_Pw@mail.gmail.com>
 <5ea8c025-13f2-4754-479a-21395de9306d@siemens.com> <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
 <2fe4d998-1784-53c5-a653-994882ec7fb6@siemens.com> <CA+V-a8s9Ta0fPD6V=yGYDhvKngiMrCghi07Y_4XTbDPk9HeHfw@mail.gmail.com>
 <c44b2378-e682-4b0b-8443-57f28aeea9ee@siemens.com> <CA+V-a8ufXHeaMTwmMmtYdVijY_OVwU_+eTtSbr=Rx=oiQa=9tg@mail.gmail.com>
 <e1b5e28e-f6a7-b603-95f3-8a72f0405d7f@siemens.com> <CA+V-a8t9brsw1fu_x9ou7uHOYxhO8AjuKiLfW+1MJ6tw=A=f=A@mail.gmail.com>
 <8e895901-cd60-9696-935a-293245586a77@siemens.com> <CA+V-a8tLSnKSRVOGwHmNUs+y58QoiDazwBA9rrQ1yGXWcFLVRg@mail.gmail.com>
 <234b1a2d-ea25-e38c-5053-eea15f57b933@siemens.com> <CA+V-a8vUAEZUkbhhHEHKHzf-OhXqnfMkojP5o0nSEtgBdSbRQw@mail.gmail.com>
 <35cddc35-a563-ca93-8e29-b9ae06844030@siemens.com> <CA+V-a8uGOP49BWzY1bwprzLzhUXFjfqW6yD1c-LZN7i94mrzbQ@mail.gmail.com>
 <a87eb794-7dc1-f447-c13a-de600a48d59e@siemens.com>
In-Reply-To: <a87eb794-7dc1-f447-c13a-de600a48d59e@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 19 May 2022 14:23:39 +0100
Message-ID: <CA+V-a8uBuBZb5z-HvuLF96jTtKLLKCt8nHmqKt4jtX9ninJAtw@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=Qg4kw9x+;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::112a as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Thu, May 19, 2022 at 12:39 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 19.05.22 11:44, Lad, Prabhakar wrote:
> > On Thu, May 19, 2022 at 6:30 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >> Forgot: that cannot work. The call of arm_dcaches_flush will overwrite
> >> lr, thus the second ret will only return to where the first ret jumped
> >> to - endless loop. You would have to restore lr (x30) from x17 in
> >> arch_entry first:
> >>
> >> mov x30, x17
> >> ret
> >>
> > That did the trick thanks!
> >
> > diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> > index a9cabf7f..7b340bd1 100644
> > --- a/hypervisor/arch/arm64/entry.S
> > +++ b/hypervisor/arch/arm64/entry.S
> > @@ -109,6 +109,8 @@ arch_entry:
> >         mov     x0, #LINUX_HVC_SET_VECTORS_LEGACY
> >  1:
> >         hvc     #0
> > +       mov x30, x17
> > +       ret
> >
> >         hvc     #0      /* bootstrap vectors enter EL2 at el2_entry */
> >         b       .       /* we don't expect to return here */
> >
> >
> > With the above diff I do get the below:
> >
> > [   42.980805] jailhouse: loading out-of-tree module taints kernel.
> > Reading configuration set:
> >   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
> > Overlapping memory regions inside cell: None
> > Overlapping memory regions with hypervisor: None
> > Missing resource interceptions for architecture arm64: None
> > [   46.582588] obcode @arm_dcaches_flush: d53b0024
> > [   46.582616] obcode @arm_dcaches_flush: d53b0024
> > [   46.611311] The Jailhouse is opening.
> >
> > So it looks like something to do with the debug console. This has to
> > be poked in the dark or any easy way to debug?
>
> Well, we do not yet know what goes wrong. We do know that we can call
> into the hyp take-over stub and register Jailhouse with it. We do not
> know if we will then end up in Jailhouse in hyp mode and just lack
> console output or if we crash on entry already.
>
Right agreed.

> To move the uart console out of the picture: Did you already check if
> the driver you select in the Jailhouse config is actually one that
> should support the UART on your board? Next is to double check if poking
The UART on this platform is almost identical to
JAILHOUSE_CON_TYPE_SCIFA type, but with some differences which I have
patched to work on this platform.

> registers in the way the Jailhouse driver will do at the addresses you
> configured will work: Pull the code into the kernel module or even into
> a userspace application with /dev/mem raw register access and try out if
> that works in a "safe" environment (without hypervisor mode).
>
Sure will give that a shot, any pointers on doing this from userspace?

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8uBuBZb5z-HvuLF96jTtKLLKCt8nHmqKt4jtX9ninJAtw%40mail.gmail.com.
