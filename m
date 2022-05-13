Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBVMO7KJQMGQEXQ2AR7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D0D526705
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 18:29:11 +0200 (CEST)
Received: by mail-yb1-xb3f.google.com with SMTP id i17-20020a259d11000000b0064cd3084085sf286472ybp.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 09:29:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652459350; cv=pass;
        d=google.com; s=arc-20160816;
        b=w/JP30KDkBQWAkOHCl0uKs+2ZfSd8nPEBL5nZ4W6nJ7nNvAqvR5K1Nmg5qphbYZJaI
         E+wiYBFeT+3TvfUvsjhbFw/6MBz/HYsxQqA1fHsWNrUzP76tjbaw5E8xgDw3wW+G3hJE
         trhF5GotyFWoKTqlfUdUUrcHkQ/mm4jsPIqZJIBB5sOMrT3/LpCvFee+FZHykmo6u8E4
         4ZsUqwVJzQx4bflNywtPs0uMAgPWqo++CPl0Pam9CB9sGcLkCPu7T8Mdjh52xn0HPS17
         UL1uT6PCLwnsrN1TCuwYvlPIezoAldduTVCsJRI2eOA6LeLQodrf1HZ0TmcXqbfx6XgA
         QFig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=N2jb1GNwJqRauTOYOZDzxNcX34NrKUtU2R4GrikEarY=;
        b=YXB2/iKGHYdUwQWOyCNXDxGX+jdP9DjhlFLYcIpesye5CAkn7EZ2ybecpuUssxEztZ
         O/JEvlBnuaRPz7nc9swzZPJSwP99YqF0UNy4z5F6kYZQh/G1l4Dv9lDnEw4IcomEnr1Y
         K7BCiFAukcq5liGBoJJnBsu+B+dB4eiFRtBEz67oGJbHDB0YHXi0VSjd0ErQ8roR7RXY
         xc6+/qMtdoqGR82+KxIxyXMHXhotInraCLAvPpmSXvC4f4FMUlaOq84z6SHIAaTIxlmo
         HPArVjSdAjYgcvX1NestbVSSyW+I+zPlNEwZeSj8+qgiJ4m9BGwUCESDVWkBxfyKqMOE
         bLOw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=FQvczPtZ;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b35 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=N2jb1GNwJqRauTOYOZDzxNcX34NrKUtU2R4GrikEarY=;
        b=L70QpfGaNonXyvb900EZc2gF1REzgGF25oP163f1APJBl/4ZT2InT5OWUeFYN6O5Vx
         WMKuyAkgGIn3laQ3uOxKBm5xCvI3v7BSrpiajBNEFYbQ14LzGnEKh34RoslB6iWVBfJn
         PvS+N1qJ3kPGldgW9EOS8eJmc4wPAAtXiFINlthpKa9QBMj0e91+/3p3Fa13psKm0wPQ
         j0piSe2itO5aLwP/7wUyzZuDrG+VpRF/pseCcKnUwGW+QUOBT79/BHiO/LVK84C6lZ8n
         BSSd9Ip4y2VEHyN6os6dr39hVwixX2ZG5kwu+Z0wqcDgIZoyV2ic4v0jLFI/WBfZ3vgi
         SgLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=N2jb1GNwJqRauTOYOZDzxNcX34NrKUtU2R4GrikEarY=;
        b=V+D+K1BNlfsA1UdFckpH3XLSfaK5rZ8+/SLr3JlJYKETfhYfEC0VX3Dtps/uH1I1YD
         vWyLaESc/s1Bz/aTRXcMiv6+Gtlp356o2/rkGiXhjWMZBOhSKgI7YBNaaKA/4Vt80/pf
         o6tVZ2rBFTdsA8GR/zUZM1RCIlBS4TxYUzZcsZfce8FG7vam3dJA8cNCnCWgMRLFQHdR
         7UM91w/Als/BINxsofpNtIa/eZNxtCMUCdHpmVnJm7FrKbVlx95Bfsf4DICiGKtIjFOI
         GykK7FwaKn0LS0lMLYWfQ/ShjFK/dbpZYzCTF2yAzmeG6ZDMcMQJ7DWIDgIFXTe/vAyq
         V8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=N2jb1GNwJqRauTOYOZDzxNcX34NrKUtU2R4GrikEarY=;
        b=miLqJbl2DLgc5hZfjcR645ba0lWGE+8tPhewuUDXGUI1z4BziV52NmgXeEBh6LzVsL
         WhILuJpZBhq1RzNZT0OziIEGwEaWaw1bnJg7B9XvzX4nnaIxjEFJu4R8aM9LUwrAswv1
         4+uAAN6rOxD9utyufyOn0+RK+T4bO3LbYWwgKktLJaHbVsrtOAsegyvBrcYqNTEeVRS3
         AL15ZaU7l56WfTGgnex+S66RRqEtJFUGld1HJvKi8RHCVu/Vd2gHV6g+/PWh2ywLDiIS
         FsVtAX/vUkSQxuNbggahVlbrq7Sa0iwg9pH8eQf8yI42nthWoG6cZJfWct2+YCnd5SC0
         c9zA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530H3FS7S/3SeuzHttCOFJqa1yjlLlGgQhgLaVqWeBxU/chdFcAO
	IcLUp1tpItsmpUE8IETlhIE=
X-Google-Smtp-Source: ABdhPJzgKVuOv+wFG0DM8H8OkHbpPP60V790kPiD7hFACpurOwaUtqHgEIk31bjTSGESeIwfoVjraw==
X-Received: by 2002:a81:b07:0:b0:2f4:da11:f0f0 with SMTP id 7-20020a810b07000000b002f4da11f0f0mr6492561ywl.336.1652459350073;
        Fri, 13 May 2022 09:29:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:7208:0:b0:2f8:17d3:d30c with SMTP id n8-20020a817208000000b002f817d3d30cls5185591ywc.0.gmail;
 Fri, 13 May 2022 09:29:09 -0700 (PDT)
X-Received: by 2002:a81:8d02:0:b0:2f8:c9f7:4041 with SMTP id d2-20020a818d02000000b002f8c9f74041mr6725067ywg.117.1652459349168;
        Fri, 13 May 2022 09:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652459349; cv=none;
        d=google.com; s=arc-20160816;
        b=NC4aZkSgTnB4jGWAKgSnU6YpRtqAb5fq68+X+HzNx4TbWDgR8UHHajTUAsaTDTxDDt
         pP/c61pevbvg+g1QtHwEA0Z19xdcUNCpbpEgwUihLoun/t6n720yJgsoh5dXj21XFIkI
         1Nbbq4VdaHOYnJEmwUBbG9XplFLFxyGrdgr8OqvbRpfChz1AJdOtuUEvEHHS33Ti9u85
         /yR3aRJeLSfbgUNSZg67qUcu5+SXWY2bvJj042kLhpt1UQkFbPlYoeMIZi+Jo6V7TxBX
         ipk2ElMt2J2QSWOkzFmPFpT7T+uRlpSfiBegUfcc1/QpY6NMERGKk+XKB/smQJNXm2gC
         5F5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lSjro6MuAtMynFslZdgwXBu1+Qx17eRxLZkJpMrZh7Y=;
        b=Wzrat/GAuVeC2QP2nLDGONs6cIVYlmIE3oqokUsIb/pMXMRglltEXhv/QGq8ALYW8w
         WGz4ad/cF8PR2dm47F4yqCjzOD09vphQJAbqZS+zszmB+ECe01z0qdD8ESR9e940bwSX
         2ZkSdYYmCLLvfRq+ht7R3G5pHw2nHT65QdaDREWp5SnhZnYZHyawFDnCo7uMWU6aZlYQ
         1ETWKF87v6t/jGq61riwvS3ZaRINjQD5hQGE9FeQvg+f4qZLO1QSR7BiTWO5JlM5lHHQ
         HVsWlY+3JT9NhEy1k4/ndlLnnhTtLcECbmqakKqcCC1urSFSKMQTrT5klazBv+kWDRkZ
         xofA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=FQvczPtZ;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b35 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com. [2607:f8b0:4864:20::b35])
        by gmr-mx.google.com with ESMTPS id y7-20020a254b07000000b006483d0ae0c2si328102yba.4.2022.05.13.09.29.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 09:29:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b35 as permitted sender) client-ip=2607:f8b0:4864:20::b35;
Received: by mail-yb1-xb35.google.com with SMTP id y76so16237673ybe.1
        for <jailhouse-dev@googlegroups.com>; Fri, 13 May 2022 09:29:09 -0700 (PDT)
X-Received: by 2002:a25:504c:0:b0:64b:979c:1bae with SMTP id
 e73-20020a25504c000000b0064b979c1baemr3494583ybb.563.1652459348927; Fri, 13
 May 2022 09:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com> <d22051fb-2c80-2d88-af8c-5f1ccdb69197@siemens.com>
 <CA+V-a8sQAYXHykiGqn8DD8=cL4fv4NcszvgFgza2gE3_MCyRmQ@mail.gmail.com>
 <37be2e7c-c1f4-c5b6-f200-8d1cc48e0ee5@siemens.com> <CA+V-a8t-wvud8MF0oyAsHBSUuVQrrkqSr9RWE2tQLCoOzuQikw@mail.gmail.com>
 <fe2e7e92-8530-9913-307f-85437412fd81@siemens.com> <CA+V-a8sgPXsMmsKYwE6etP=JG8Ef83Qz4RHoWAZKeHdVHhk_Pw@mail.gmail.com>
 <5ea8c025-13f2-4754-479a-21395de9306d@siemens.com> <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
 <2fe4d998-1784-53c5-a653-994882ec7fb6@siemens.com> <CA+V-a8s9Ta0fPD6V=yGYDhvKngiMrCghi07Y_4XTbDPk9HeHfw@mail.gmail.com>
 <c44b2378-e682-4b0b-8443-57f28aeea9ee@siemens.com> <CA+V-a8ufXHeaMTwmMmtYdVijY_OVwU_+eTtSbr=Rx=oiQa=9tg@mail.gmail.com>
 <e1b5e28e-f6a7-b603-95f3-8a72f0405d7f@siemens.com>
In-Reply-To: <e1b5e28e-f6a7-b603-95f3-8a72f0405d7f@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 13 May 2022 17:28:42 +0100
Message-ID: <CA+V-a8t9brsw1fu_x9ou7uHOYxhO8AjuKiLfW+1MJ6tw=A=f=A@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=FQvczPtZ;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::b35 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Fri, May 13, 2022 at 4:33 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 13.05.22 17:20, Lad, Prabhakar wrote:
> > On Fri, May 13, 2022 at 1:18 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>
> >> On 13.05.22 13:32, Lad, Prabhakar wrote:
> >>>> Could it be that arm_dcaches_flush was a red herring? Maybe we are
> >>>> actually crashing on hvc in arch_entry, and that because of Linux not
> >>>> starting in HVC mode, thus no hypervisor take-over stub being installed.
> >>>>
> >>>> Could you share the boot log of the kernel?
> >>>>
> >>> Attached is the complete log.
> >>>
> >>
> >> "CPU: All CPU(s) started at EL1"
> >>
> >> As suspected. Must be EL2 or HYP. Reconfigure your firmware to enable that.
> >>
> > Argh my bad, I've now enabled it to start in EL2 mode (attached are
> > the complete logs). Now I see the below panic,
> >
> > [   33.920507] jailhouse: loading out-of-tree module taints kernel.
> > Reading configuration set:
> >   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
> > Overlapping memory regions inside cell: None
> > Overlapping memory regions with hypervisor: None
> > Missing resource interceptions for architecture arm64: None
> > [   34.741847] Bad mode in Synchronous Abort handler detected on CPU0,
> > code 0x5a000000 -- HVC (AArch64)
> > [   34.741850] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O
> >   5.10.112-cip6+ #13
> > [   34.741853] Hardware name: Renesas SMARC EVK based on r9a07g054l2 (DT)
> > [   34.741855] pstate: 20400089 (nzCv daIf +PAN -UAO -TCO BTYPE=--)
> > [   34.741857] pc : 0xffff800013004868
> > [   34.741859] lr : 0xffff80001300484c
> > [   34.741860] sp : ffff8000118cbed0
> > [   34.741862] x29: ffff8000118cbed0 x28: ffff800011632f80
> > [   34.741869] x27: ffff800011632f80 x26: ffff8000118cc000
> > [   34.741873] x25: ffff8000118c8000 x24: ffff80001162a344
> > [   34.741877] x23: 0000000000000000 x22: 0000000000000000
> > [   34.741881] x21: ffff800013000000 x20: ffff800013004800
> > [   34.741885] x19: ffff800008c17000 x18: 0000000000000001
> > [   34.741889] x17: ffff800008c11828 x16: 0000000000000000
> > [   34.741893] x15: 0000ffffc004b800 x14: 000000001004b800
> > [   34.741897] x13: 0000ffffc0200000 x12: 00000000b6f00000
> > [   34.741900] x11: ffff0000f6d00000 x10: ffff8000118cbed0
> > [   34.741904] x9 : ffff8000118cbed0 x8 : 3062333564203a68
> > [   34.741908] x7 : 0000000000000000 x6 : ffff00007fc6caa0
> > [   34.741912] x5 : ffff00007fc6caa0 x4 : 000000000000003f
> > [   34.741916] x3 : 0000000000000040 x2 : 0000000000000002
> > [   34.741920] x1 : 00000000b6f05000 x0 : 0000000000000000
> > [   34.741924] Kernel panic - not syncing: bad mode
> > [   34.741927] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O
> >   5.10.112-cip6+ #13
> > [   34.741929] Hardware name: Renesas SMARC EVK based on r9a07g054l2 (DT)
> > [   34.741930] Call trace:
> > [   34.741932]  dump_backtrace+0x0/0x1c0
> > [   34.741934]  show_stack+0x18/0x68
> > [   34.741935]  dump_stack+0xd8/0x134
> > [   34.741937]  panic+0x180/0x398
> > [   34.741939]  bad_mode+0x8c/0x90
> > [   34.741940]  el1_inv+0x3c/0x60
> > [   34.741942]  el1_sync_handler+0xac/0xe0
> > [   34.741943]  el1_sync+0x84/0x140
> > [   34.741945]  0xffff800013004868
> > [   34.741947]  flush_smp_call_function_queue+0xf8/0x268
> > [   34.741949]  generic_smp_call_function_single_interrupt+0x14/0x20
> > [   34.741950]  ipi_handler+0x8c/0x158
> > [   34.741952]  handle_percpu_devid_fasteoi_ipi+0x74/0x88
> > [   34.741953]  generic_handle_irq+0x30/0x48
> > [   34.741955]  __handle_domain_irq+0x60/0xb8
> > [   34.741957]  gic_handle_irq+0x58/0x128
> > [   34.741958]  el1_irq+0xc8/0x180
> > [   34.741960]  arch_cpu_idle+0x18/0x28
> > [   34.741961]  default_idle_call+0x24/0x5c
> > [   34.741963]  do_idle+0x1ec/0x288
> > [   34.741964]  cpu_startup_entry+0x24/0x68
> > [   34.741966]  rest_init+0xd8/0xe8
> > [   34.741967]  arch_call_rest_init+0x10/0x1c
> > [   34.741969]  start_kernel+0x4b0/0x4e8
> > [   34.981086] SMP: stopping secondary CPUs
> > [   34.981088] Kernel Offset: disabled
> > [   34.981090] CPU features: 0x0040026,2a00aa38
> > [   34.981091] Memory Limit: none
> > [   34.981094] Bad mode in Synchronous Abort handler detected on CPU1,
> > code 0x5a000000 -- HVC (AArch64)
> > [   34.981097] CPU: 1 PID: 232 Comm: jailhouse Tainted: G           O
> >     5.10.112-cip6+ #13
> > [   34.981099] Hardware name: Renesas SMARC EVK based on r9a07g054l2 (DT)
> > [   34.981101] pstate: 20400089 (nzCv daIf +PAN -UAO -TCO BTYPE=--)
> > [   34.981103] pc : 0xffff800013004868
> > [   34.981104] lr : 0xffff80001300484c
> > [   34.981106] sp : ffff800011f93b30
> > [   34.981107] x29: ffff800011f93b30 x28: 0000000000000000
> > [   34.981111] x27: ffff800013000000 x26: ffff800008c17000
> > [   34.981115] x25: ffff800008c17000 x24: 0000000000000002
> > [   34.981119] x23: 0000000000000870 x22: 0000000000000001
> > [   34.981123] x21: ffff800013000000 x20: ffff800013004800
> > [   34.981127] x19: ffff800008c17000 x18: 0000000000000001
> > [   34.981131] x17: ffff800008c11828 x16: 0000000000000001
> > [   34.981135] x15: 0000ffffc004b800 x14: 000000001004b800
> > [   34.981139] x13: 0000ffffc0200000 x12: 00000000b6f00000
> > [   34.981143] x11: ffff0000f6d00000 x10: ffff8000116996c8
> > [   34.981147] x9 : ffff800011699720 x8 : 0000000000017fe8
> > [   34.981151] x7 : 0000000000000000 x6 : ffff00007fc82aa0
> > [   34.981155] x5 : ffff00007fc82aa0 x4 : 000000000000003f
> > [   34.981159] x3 : 0000000000000040 x2 : 0000000000000002
> > [   34.981163] x1 : 00000000b6f05000 x0 : 0000000000000000
> >
>
> Please validate first if KVM is working in your setup. I suspect there
> are still things wrong that are unrelated to Jailhouse.
>
Enabling KVM and virtualization, I get the below messages:

root@smarc-rzg2l:~# dmesg | grep -i kvm
[    0.514230] kvm [1]: IPA Size Limit: 40 bits
[    0.514383] kvm [1]: GICv3: no GICV resource entry
[    0.514471] kvm [1]: disabling GICv2 emulation
[    0.514627] kvm [1]: GIC system register CPU interface enabled
[    0.515036] kvm [1]: vgic interrupt IRQ9
[    0.515663] kvm [1]: VHE mode initialized successfully

Is this suffice or do you want me to run anything specific?

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8t9brsw1fu_x9ou7uHOYxhO8AjuKiLfW%2B1MJ6tw%3DA%3Df%3DA%40mail.gmail.com.
