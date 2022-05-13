Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBYHO7GJQMGQEYP3YWJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3A85265E8
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 17:21:06 +0200 (CEST)
Received: by mail-ot1-x337.google.com with SMTP id q21-20020a056830233500b00605db4a91a0sf3113257otg.17
        for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 08:21:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652455265; cv=pass;
        d=google.com; s=arc-20160816;
        b=P4E5SsTVn31/gF8S5PVM2GUFBSXe1a9jfBkbt/YttWJF/L30XlmjACM2EvCGz/6aoD
         NEvBadPjaMC6odshZzQnmQ1jA3mBy40OdgE7l4GkWDVCAzbdSnt1qPrOGhq3PseL3QOz
         OlOaLRl+iZ1VpO3VAYH72Cd6kOuP6hNduRXn/oWrvL661Lq8eoNetzJrj4eMpsxn6RCx
         fQ+Ydu5HUdlfK+fuEHbx2hB66rD8r56fTVXAE6z63qU84fT7bG++WMcKj3+6eXDbP82x
         XZz5IB0QXj/khIvkk0AIVSdX8peU0GtDJNkk1yjn30PmeuVcP33bQNu5aSVwFeavUYZ+
         xq6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=VUh1ECtqlLKMhxzAbPj+SOe2XuEk4ZcM6GfCT9Z4ipU=;
        b=aLgF6GlTw2TtBXPv3JfojWrgcoEL0QJV/1RiDAFQ4E6pd5RlNNsfQd3OuGlnLxX0eI
         +bzpt7pkTAxViQHETdQgh8tdjiKTwrV+te/YkTR4tjeZGtvFU2n19/wy7ufT1WuMl8ly
         tqfcJwOaHFuqxjekWIwHF6BypG2RCbXccW7KrtR72vamxThXByt7bc7qLuiBNs7B/cPP
         A8lKOYUw79cUyjfDFO5fnfHqinKnHNXGSCU7hgBVp0iYLufx2dKbNEbTuX/9DqSij5B/
         B9zZiDLBnMzSZNJKjnzfnM1+v8W/m7ubnSzBOqZox7ORS1pw93GpJJnhLqE7FOjds7OK
         O88g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=GraQAO9l;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::112d as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VUh1ECtqlLKMhxzAbPj+SOe2XuEk4ZcM6GfCT9Z4ipU=;
        b=KskX1uZV2MzS9M5pqIrYoCVL1Xi+2vQDsSe9PETKSVwbC2v2q0kptbLb8ZiO2tJuo7
         EjBY0u+eovzbGbfVb8joU5ac7Mn1L0EmqqJAC/4xP3H9pordXv3RbEnuFB4fF2eCsWhK
         XIC37v/PIIo9YtrOwMP97rVAFszEqKV7SeR8Mdek69SEWP7ef7H1a4nrlGUgWkHWt6ai
         /+oPUEL6CKP+v2bWvJqD4Jx++2BrqRXzlK4eRG6iL69GDyw289UKKUnhQQME0lgPzP8G
         E6IsFOe+TUZDJ/L8/Gr2l1jl0+g8m/gVKI0lPKJkxGLZ4K43x6L/Ox5vP5n1wvA0tz15
         07Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VUh1ECtqlLKMhxzAbPj+SOe2XuEk4ZcM6GfCT9Z4ipU=;
        b=Xzwj5r9YXD6bKSpo/5scH/UlSOuT/AqFEHGDE6sxNKlQWCEYDjMdLyu9IyCNHWWngA
         mk8+rs/d87sefCxfZ8YZ8Scy9KFFuzN4e81z+y1zunGtJwuJaWVSXCQ8nznBGFIxxeby
         K40P3P1gluv9AfVgXfgksrKPa+2KnPPn5HDcHrfn0MW+d+Lml0Qg35oRR5r3db/KhVmK
         jlgY7W3Aswo9LmaB1lk0yq9TsuK0TXjDKExuRSYZ0WU/vKnQsYpjcZmQ8GQJ9eM9aHSk
         04AdgXwzyEZ3UIEl1VE53TD0cdnYTQ+IhSsEAxw1JgrVXtX0QY1u2QfQ38Ux+Gg1yafl
         gVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VUh1ECtqlLKMhxzAbPj+SOe2XuEk4ZcM6GfCT9Z4ipU=;
        b=DAXmMh/I0xG3IN01FNojFqUP5s5mAhgC6T/4R4FvLWo7oYu0aSzKxHfdpauk/jtZ5E
         BCO4HCZdxWZkVmF0/fACvXigeqF0KZBNB9IiPtwQOOaHJlPBj1MH2pUxpqsQ4KQXwdC6
         IKjzFeQWN4IS34S3kgbx41lBq/9wM8T4gBwr/XUpo1CPu5U0l1jQM7GWcDm9gPZu1Ux7
         EjDJxC2OthQefdu3ureufu9Wb14DyH/o0eTeWILKZFWHMq7EiXnyhFsiCR9kFKlkQVcR
         +plHbCaPipcHnNPU3Vf8mjk0R/t/C1aoT09T22d33sk06SxTqmz+7eEckTKahKoXZlkU
         xoYg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ZlTJNklDbMwwGVu37iJ9lzqE+II3Cvzvv2DbUGdEMWBTlSDhQ
	EZEVICHVWCNrbKWT8HnMR3M=
X-Google-Smtp-Source: ABdhPJxSkyt8e/k2V31rv+ZOWWWGhbv4DFZQ9mvA5Ysdr/+wQ/Daur6VTK/Fzugi8H5GczhWca0d5A==
X-Received: by 2002:a54:4015:0:b0:328:c693:415b with SMTP id x21-20020a544015000000b00328c693415bmr2593718oie.18.1652455264999;
        Fri, 13 May 2022 08:21:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:58c5:0:b0:328:d6ff:881e with SMTP id m188-20020aca58c5000000b00328d6ff881els658919oib.4.gmail;
 Fri, 13 May 2022 08:21:04 -0700 (PDT)
X-Received: by 2002:aca:1811:0:b0:2ef:3c0f:f169 with SMTP id h17-20020aca1811000000b002ef3c0ff169mr2550097oih.61.1652455264081;
        Fri, 13 May 2022 08:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652455264; cv=none;
        d=google.com; s=arc-20160816;
        b=ppE0skRIpH+nkncI1Lbq1IDnTP0TAJEaGjxA+CQcT71dYcksZZNWrt4Wb781oK8Joa
         sg59DMPQyqTOFogTw0rgrIr/VPdv6RH/quCvQwTusr/caTSIeoWXVRLPM4ZPO2lFNIp4
         F9T8mXLYgg5yni0O44qb+L06s2yXITFI3NW3dQtZVG1kD4eg+utsCYz91IrNDAWy4YDQ
         EC8wFfGwfWQ02gV0j3rjLdfegZIZ1p4K0LGWr7RAqfaUuqauXmOpfrTunXFehxiYe1zJ
         6Ua25Klmd5zJ9B6qfGx1o+q8nxVx6WMoDWZ2nz2nodLmA32h+TIrgi+d0XCMYk0FPu1M
         Dt1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aSj7/alNcvNzjeWJ36AqtOlGp53rsTzsRbLbxIMyZW8=;
        b=nigv7IwxOsQzM2Q4UerpvwKZZkdEYn28OpeoAiZiYcjCakfUPzpPRHN/NVn7uQSHSI
         ekdHVdGX54w7/A2fDc7Gnbhmb/oyb97n4xrBRwlv4F5/Q9x9thT71VxS5NNZsKrjIkGv
         C1U727kKQmUFHiPdgmYV1yeeZoIqmU8pVvltNPnHqEvQRpsWGuwqnj4Sj4agvYqsDgcF
         hv+b6j1OVQPlLhsKla62az/9bGwmpDF5BsPX0K8UtbPlwEv9/TF9m2YAbWovqevx/U/6
         /ND+IOM2DF0fcRW91uduG+eHVkMawvbtnpl0JTyre3yH+mNa8X8zQsAsNzVx7xivsW2E
         2AoQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=GraQAO9l;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::112d as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com. [2607:f8b0:4864:20::112d])
        by gmr-mx.google.com with ESMTPS id r9-20020a056830236900b005e6c62a483dsi192554oth.0.2022.05.13.08.21.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 08:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::112d as permitted sender) client-ip=2607:f8b0:4864:20::112d;
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-2f16645872fso93650607b3.4
        for <jailhouse-dev@googlegroups.com>; Fri, 13 May 2022 08:21:04 -0700 (PDT)
X-Received: by 2002:a81:6a46:0:b0:2f4:dc3f:e8f8 with SMTP id
 f67-20020a816a46000000b002f4dc3fe8f8mr6446928ywc.292.1652455263683; Fri, 13
 May 2022 08:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com> <d22051fb-2c80-2d88-af8c-5f1ccdb69197@siemens.com>
 <CA+V-a8sQAYXHykiGqn8DD8=cL4fv4NcszvgFgza2gE3_MCyRmQ@mail.gmail.com>
 <37be2e7c-c1f4-c5b6-f200-8d1cc48e0ee5@siemens.com> <CA+V-a8t-wvud8MF0oyAsHBSUuVQrrkqSr9RWE2tQLCoOzuQikw@mail.gmail.com>
 <fe2e7e92-8530-9913-307f-85437412fd81@siemens.com> <CA+V-a8sgPXsMmsKYwE6etP=JG8Ef83Qz4RHoWAZKeHdVHhk_Pw@mail.gmail.com>
 <5ea8c025-13f2-4754-479a-21395de9306d@siemens.com> <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
 <2fe4d998-1784-53c5-a653-994882ec7fb6@siemens.com> <CA+V-a8s9Ta0fPD6V=yGYDhvKngiMrCghi07Y_4XTbDPk9HeHfw@mail.gmail.com>
 <c44b2378-e682-4b0b-8443-57f28aeea9ee@siemens.com>
In-Reply-To: <c44b2378-e682-4b0b-8443-57f28aeea9ee@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 13 May 2022 16:20:36 +0100
Message-ID: <CA+V-a8ufXHeaMTwmMmtYdVijY_OVwU_+eTtSbr=Rx=oiQa=9tg@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/mixed; boundary="00000000000000027705dee6393a"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=GraQAO9l;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::112d as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

--00000000000000027705dee6393a
Content-Type: text/plain; charset="UTF-8"

On Fri, May 13, 2022 at 1:18 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 13.05.22 13:32, Lad, Prabhakar wrote:
> >> Could it be that arm_dcaches_flush was a red herring? Maybe we are
> >> actually crashing on hvc in arch_entry, and that because of Linux not
> >> starting in HVC mode, thus no hypervisor take-over stub being installed.
> >>
> >> Could you share the boot log of the kernel?
> >>
> > Attached is the complete log.
> >
>
> "CPU: All CPU(s) started at EL1"
>
> As suspected. Must be EL2 or HYP. Reconfigure your firmware to enable that.
>
Argh my bad, I've now enabled it to start in EL2 mode (attached are
the complete logs). Now I see the below panic,

[   33.920507] jailhouse: loading out-of-tree module taints kernel.
Reading configuration set:
  Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
Overlapping memory regions inside cell: None
Overlapping memory regions with hypervisor: None
Missing resource interceptions for architecture arm64: None
[   34.741847] Bad mode in Synchronous Abort handler detected on CPU0,
code 0x5a000000 -- HVC (AArch64)
[   34.741850] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O
  5.10.112-cip6+ #13
[   34.741853] Hardware name: Renesas SMARC EVK based on r9a07g054l2 (DT)
[   34.741855] pstate: 20400089 (nzCv daIf +PAN -UAO -TCO BTYPE=--)
[   34.741857] pc : 0xffff800013004868
[   34.741859] lr : 0xffff80001300484c
[   34.741860] sp : ffff8000118cbed0
[   34.741862] x29: ffff8000118cbed0 x28: ffff800011632f80
[   34.741869] x27: ffff800011632f80 x26: ffff8000118cc000
[   34.741873] x25: ffff8000118c8000 x24: ffff80001162a344
[   34.741877] x23: 0000000000000000 x22: 0000000000000000
[   34.741881] x21: ffff800013000000 x20: ffff800013004800
[   34.741885] x19: ffff800008c17000 x18: 0000000000000001
[   34.741889] x17: ffff800008c11828 x16: 0000000000000000
[   34.741893] x15: 0000ffffc004b800 x14: 000000001004b800
[   34.741897] x13: 0000ffffc0200000 x12: 00000000b6f00000
[   34.741900] x11: ffff0000f6d00000 x10: ffff8000118cbed0
[   34.741904] x9 : ffff8000118cbed0 x8 : 3062333564203a68
[   34.741908] x7 : 0000000000000000 x6 : ffff00007fc6caa0
[   34.741912] x5 : ffff00007fc6caa0 x4 : 000000000000003f
[   34.741916] x3 : 0000000000000040 x2 : 0000000000000002
[   34.741920] x1 : 00000000b6f05000 x0 : 0000000000000000
[   34.741924] Kernel panic - not syncing: bad mode
[   34.741927] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O
  5.10.112-cip6+ #13
[   34.741929] Hardware name: Renesas SMARC EVK based on r9a07g054l2 (DT)
[   34.741930] Call trace:
[   34.741932]  dump_backtrace+0x0/0x1c0
[   34.741934]  show_stack+0x18/0x68
[   34.741935]  dump_stack+0xd8/0x134
[   34.741937]  panic+0x180/0x398
[   34.741939]  bad_mode+0x8c/0x90
[   34.741940]  el1_inv+0x3c/0x60
[   34.741942]  el1_sync_handler+0xac/0xe0
[   34.741943]  el1_sync+0x84/0x140
[   34.741945]  0xffff800013004868
[   34.741947]  flush_smp_call_function_queue+0xf8/0x268
[   34.741949]  generic_smp_call_function_single_interrupt+0x14/0x20
[   34.741950]  ipi_handler+0x8c/0x158
[   34.741952]  handle_percpu_devid_fasteoi_ipi+0x74/0x88
[   34.741953]  generic_handle_irq+0x30/0x48
[   34.741955]  __handle_domain_irq+0x60/0xb8
[   34.741957]  gic_handle_irq+0x58/0x128
[   34.741958]  el1_irq+0xc8/0x180
[   34.741960]  arch_cpu_idle+0x18/0x28
[   34.741961]  default_idle_call+0x24/0x5c
[   34.741963]  do_idle+0x1ec/0x288
[   34.741964]  cpu_startup_entry+0x24/0x68
[   34.741966]  rest_init+0xd8/0xe8
[   34.741967]  arch_call_rest_init+0x10/0x1c
[   34.741969]  start_kernel+0x4b0/0x4e8
[   34.981086] SMP: stopping secondary CPUs
[   34.981088] Kernel Offset: disabled
[   34.981090] CPU features: 0x0040026,2a00aa38
[   34.981091] Memory Limit: none
[   34.981094] Bad mode in Synchronous Abort handler detected on CPU1,
code 0x5a000000 -- HVC (AArch64)
[   34.981097] CPU: 1 PID: 232 Comm: jailhouse Tainted: G           O
    5.10.112-cip6+ #13
[   34.981099] Hardware name: Renesas SMARC EVK based on r9a07g054l2 (DT)
[   34.981101] pstate: 20400089 (nzCv daIf +PAN -UAO -TCO BTYPE=--)
[   34.981103] pc : 0xffff800013004868
[   34.981104] lr : 0xffff80001300484c
[   34.981106] sp : ffff800011f93b30
[   34.981107] x29: ffff800011f93b30 x28: 0000000000000000
[   34.981111] x27: ffff800013000000 x26: ffff800008c17000
[   34.981115] x25: ffff800008c17000 x24: 0000000000000002
[   34.981119] x23: 0000000000000870 x22: 0000000000000001
[   34.981123] x21: ffff800013000000 x20: ffff800013004800
[   34.981127] x19: ffff800008c17000 x18: 0000000000000001
[   34.981131] x17: ffff800008c11828 x16: 0000000000000001
[   34.981135] x15: 0000ffffc004b800 x14: 000000001004b800
[   34.981139] x13: 0000ffffc0200000 x12: 00000000b6f00000
[   34.981143] x11: ffff0000f6d00000 x10: ffff8000116996c8
[   34.981147] x9 : ffff800011699720 x8 : 0000000000017fe8
[   34.981151] x7 : 0000000000000000 x6 : ffff00007fc82aa0
[   34.981155] x5 : ffff00007fc82aa0 x4 : 000000000000003f
[   34.981159] x3 : 0000000000000040 x2 : 0000000000000002
[   34.981163] x1 : 00000000b6f05000 x0 : 0000000000000000

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8ufXHeaMTwmMmtYdVijY_OVwU_%2BeTtSbr%3DRx%3DoiQa%3D9tg%40mail.gmail.com.

--00000000000000027705dee6393a
Content-Type: text/plain; charset="UTF-8"; name="jailel2log.txt"
Content-Disposition: attachment; filename="jailel2log.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_l34kx9290>
X-Attachment-Id: f_l34kx9290

Tk9USUNFOiAgQkwyOiB2Mi42KHJlbGVhc2UpOjljYmZiNTJiNC1kaXJ0eQpOT1RJQ0U6ICBCTDI6
IEJ1aWx0IDogMTY6MDQ6MTEsIE1heSAxMyAyMDIyCk5PVElDRTogIEJMMjogQm9vdGluZyBCTDMx
Ck5PVElDRTogIEJMMzE6IHYyLjYocmVsZWFzZSk6OWNiZmI1MmI0LWRpcnR5Ck5PVElDRTogIEJM
MzE6IEJ1aWx0IDogMTY6MDQ6MTIsIE1heSAxMyAyMDIyCgoKVS1Cb290IDIwMjEuMTAtZzkwZWRh
ZDZlMDAgKE1heSAxMyAyMDIyIC0gMTY6MDQ6MTkgKzAxMDApCgpDUFU6ICAgUmVuZXNhcyBFbGVj
dHJvbmljcyBLIHJldiAxNi4xNQpNb2RlbDogc21hcmMtcnp2MmwKRFJBTTogIDEuOSBHaUIKTU1D
OiAgIHNkQDExYzAwMDAwOiAwLCBzZEAxMWMxMDAwMDogMQpMb2FkaW5nIEVudmlyb25tZW50IGZy
b20gTU1DLi4uIE9LCkluOiAgICBzZXJpYWxAMTAwNGI4MDAKT3V0OiAgIHNlcmlhbEAxMDA0Yjgw
MApFcnI6ICAgc2VyaWFsQDEwMDRiODAwCk5ldDogICAKRXJyb3I6IGV0aGVybmV0QDExYzIwMDAw
IGFkZHJlc3Mgbm90IHNldC4KTm8gZXRoZXJuZXQgZm91bmQuCgpIaXQgYW55IGtleSB0byBzdG9w
IGF1dG9ib290OiAgMCAKOTMyNjg2MCBieXRlcyByZWFkIGluIDU4MSBtcyAoMTUuMyBNaUIvcykK
MjM5MDcgYnl0ZXMgcmVhZCBpbiA0IG1zICg1LjcgTWlCL3MpClVuY29tcHJlc3NlZCBzaXplOiAy
NTQwODAwMCA9IDB4MTgzQjIwMApNb3ZpbmcgSW1hZ2UgZnJvbSAweDQ4MDgwMDAwIHRvIDB4NDgy
MDAwMDAsIGVuZD00OWFjMDAwMAojIyBGbGF0dGVuZWQgRGV2aWNlIFRyZWUgYmxvYiBhdCA0ODAw
MDAwMAogICBCb290aW5nIHVzaW5nIHRoZSBmZHQgYmxvYiBhdCAweDQ4MDAwMDAwCiAgIExvYWRp
bmcgRGV2aWNlIFRyZWUgdG8gMDAwMDAwMDA1N2ZmNzAwMCwgZW5kIDAwMDAwMDAwNTdmZmZkNjIg
Li4uIE9LCgpTdGFydGluZyBrZXJuZWwgLi4uCgpbICAgIDAuMDAwMDAwXSBCb290aW5nIExpbnV4
IG9uIHBoeXNpY2FsIENQVSAweDAwMDAwMDAwMDAgWzB4NDEyZmQwNTBdClsgICAgMC4wMDAwMDBd
IExpbnV4IHZlcnNpb24gNS4xMC4xMTItY2lwNisgKHByYXNtaUBwcmFzbWkpIChhYXJjaDY0LWxp
bnV4LWdudS1nY2MgKExpbmFybyBHQ0MgNy41LTIwMTkuMTIpIDcuNS4wLCBHTlUgbGQgKExpbmFy
b19CaW51dGlscy0yMDEyClsgICAgMC4wMDAwMDBdIE1hY2hpbmUgbW9kZWw6IFJlbmVzYXMgU01B
UkMgRVZLIGJhc2VkIG9uIHI5YTA3ZzA1NGwyClsgICAgMC4wMDAwMDBdIGVmaTogVUVGSSBub3Qg
Zm91bmQuClsgICAgMC4wMDAwMDBdIE5VTUE6IE5vIE5VTUEgY29uZmlndXJhdGlvbiBmb3VuZApb
ICAgIDAuMDAwMDAwXSBOVU1BOiBGYWtpbmcgYSBub2RlIGF0IFttZW0gMHgwMDAwMDAwMDQ4MDAw
MDAwLTB4MDAwMDAwMDBiZmZmZmZmZl0KWyAgICAwLjAwMDAwMF0gTlVNQTogTk9ERV9EQVRBIFtt
ZW0gMHhiZmM5ZWIwMC0weGJmY2EwZmZmXQpbICAgIDAuMDAwMDAwXSBab25lIHJhbmdlczoKWyAg
ICAwLjAwMDAwMF0gICBETUEgICAgICBbbWVtIDB4MDAwMDAwMDA0ODAwMDAwMC0weDAwMDAwMDAw
YmZmZmZmZmZdClsgICAgMC4wMDAwMDBdICAgRE1BMzIgICAgZW1wdHkKWyAgICAwLjAwMDAwMF0g
ICBOb3JtYWwgICBlbXB0eQpbICAgIDAuMDAwMDAwXSBNb3ZhYmxlIHpvbmUgc3RhcnQgZm9yIGVh
Y2ggbm9kZQpbICAgIDAuMDAwMDAwXSBFYXJseSBtZW1vcnkgbm9kZSByYW5nZXMKWyAgICAwLjAw
MDAwMF0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwNDgwMDAwMDAtMHgwMDAwMDAwMGE3ZWZm
ZmZmXQpbICAgIDAuMDAwMDAwXSAgIG5vZGUgICAwOiBbbWVtIDB4MDAwMDAwMDBhN2YwMDAwMC0w
eDAwMDAwMDAwYjdlZmZmZmZdClsgICAgMC4wMDAwMDBdICAgbm9kZSAgIDA6IFttZW0gMHgwMDAw
MDAwMGI3ZjAwMDAwLTB4MDAwMDAwMDBiZmZmZmZmZl0KWyAgICAwLjAwMDAwMF0gSW5pdG1lbSBz
ZXR1cCBub2RlIDAgW21lbSAweDAwMDAwMDAwNDgwMDAwMDAtMHgwMDAwMDAwMGJmZmZmZmZmXQpb
ICAgIDAuMDAwMDAwXSBjbWE6IFJlc2VydmVkIDE2IE1pQiBhdCAweDAwMDAwMDAwYmMwMDAwMDAK
WyAgICAwLjAwMDAwMF0gcHNjaTogcHJvYmluZyBmb3IgY29uZHVpdCBtZXRob2QgZnJvbSBEVC4K
WyAgICAwLjAwMDAwMF0gcHNjaTogUFNDSXYxLjEgZGV0ZWN0ZWQgaW4gZmlybXdhcmUuClsgICAg
MC4wMDAwMDBdIHBzY2k6IFVzaW5nIHN0YW5kYXJkIFBTQ0kgdjAuMiBmdW5jdGlvbiBJRHMKWyAg
ICAwLjAwMDAwMF0gcHNjaTogTUlHUkFURV9JTkZPX1RZUEUgbm90IHN1cHBvcnRlZC4KWyAgICAw
LjAwMDAwMF0gcHNjaTogU01DIENhbGxpbmcgQ29udmVudGlvbiB2MS4yClsgICAgMC4wMDAwMDBd
IHBlcmNwdTogRW1iZWRkZWQgMjIgcGFnZXMvY3B1IHM1MDQ1NiByODE5MiBkMzE0NjQgdTkwMTEy
ClsgICAgMC4wMDAwMDBdIERldGVjdGVkIFZJUFQgSS1jYWNoZSBvbiBDUFUwClsgICAgMC4wMDAw
MDBdIENQVSBmZWF0dXJlczogZGV0ZWN0ZWQ6IEdJQyBzeXN0ZW0gcmVnaXN0ZXIgQ1BVIGludGVy
ZmFjZQpbICAgIDAuMDAwMDAwXSBDUFUgZmVhdHVyZXM6IGRldGVjdGVkOiBWaXJ0dWFsaXphdGlv
biBIb3N0IEV4dGVuc2lvbnMKWyAgICAwLjAwMDAwMF0gQ1BVIGZlYXR1cmVzOiBkZXRlY3RlZDog
QVJNIGVycmF0YSAxMTY1NTIyLCAxMzE5MzY3LCBvciAxNTMwOTIzClsgICAgMC4wMDAwMDBdIGFs
dGVybmF0aXZlczogcGF0Y2hpbmcga2VybmVsIGNvZGUKWyAgICAwLjAwMDAwMF0gQnVpbHQgMSB6
b25lbGlzdHMsIG1vYmlsaXR5IGdyb3VwaW5nIG9uLiAgVG90YWwgcGFnZXM6IDQ4Mzg0MApbICAg
IDAuMDAwMDAwXSBQb2xpY3kgem9uZTogRE1BClsgICAgMC4wMDAwMDBdIEtlcm5lbCBjb21tYW5k
IGxpbmU6IHJvb3Q9L2Rldi9zZGExIHJ3IHJvb3R3YWl0IHJvb3Rmc3R5cGU9ZXh0NCBpcD1vZmYK
WyAgICAwLjAwMDAwMF0gRGVudHJ5IGNhY2hlIGhhc2ggdGFibGUgZW50cmllczogMjYyMTQ0IChv
cmRlcjogOSwgMjA5NzE1MiBieXRlcywgbGluZWFyKQpbICAgIDAuMDAwMDAwXSBJbm9kZS1jYWNo
ZSBoYXNoIHRhYmxlIGVudHJpZXM6IDEzMTA3MiAob3JkZXI6IDgsIDEwNDg1NzYgYnl0ZXMsIGxp
bmVhcikKWyAgICAwLjAwMDAwMF0gbWVtIGF1dG8taW5pdDogc3RhY2s6b2ZmLCBoZWFwIGFsbG9j
Om9mZiwgaGVhcCBmcmVlOm9mZgpbICAgIDAuMDAwMDAwXSBNZW1vcnk6IDE2MjI2OTZLLzE5NjYw
ODBLIGF2YWlsYWJsZSAoMTIyODhLIGtlcm5lbCBjb2RlLCAyMTU2SyByd2RhdGEsIDU3MDhLIHJv
ZGF0YSwgNDU0NEsgaW5pdCwgNDgzSyBic3MsIDMyNzAwMEsgcmVzZXJ2ZWQsIDE2KQpbICAgIDAu
MDAwMDAwXSBTTFVCOiBIV2FsaWduPTY0LCBPcmRlcj0wLTMsIE1pbk9iamVjdHM9MCwgQ1BVcz0y
LCBOb2Rlcz0xClsgICAgMC4wMDAwMDBdIHJjdTogUHJlZW1wdGlibGUgaGllcmFyY2hpY2FsIFJD
VSBpbXBsZW1lbnRhdGlvbi4KWyAgICAwLjAwMDAwMF0gcmN1OiAgICAgUkNVIGV2ZW50IHRyYWNp
bmcgaXMgZW5hYmxlZC4KWyAgICAwLjAwMDAwMF0gcmN1OiAgICAgUkNVIHJlc3RyaWN0aW5nIENQ
VXMgZnJvbSBOUl9DUFVTPTI1NiB0byBucl9jcHVfaWRzPTIuClsgICAgMC4wMDAwMDBdICBUcmFt
cG9saW5lIHZhcmlhbnQgb2YgVGFza3MgUkNVIGVuYWJsZWQuClsgICAgMC4wMDAwMDBdIHJjdTog
UkNVIGNhbGN1bGF0ZWQgdmFsdWUgb2Ygc2NoZWR1bGVyLWVubGlzdG1lbnQgZGVsYXkgaXMgMjUg
amlmZmllcy4KWyAgICAwLjAwMDAwMF0gcmN1OiBBZGp1c3RpbmcgZ2VvbWV0cnkgZm9yIHJjdV9m
YW5vdXRfbGVhZj0xNiwgbnJfY3B1X2lkcz0yClsgICAgMC4wMDAwMDBdIE5SX0lSUVM6IDY0LCBu
cl9pcnFzOiA2NCwgcHJlYWxsb2NhdGVkIGlycXM6IDAKWyAgICAwLjAwMDAwMF0gR0lDdjM6IEdJ
QzogVXNpbmcgc3BsaXQgRU9JL0RlYWN0aXZhdGUgbW9kZQpbICAgIDAuMDAwMDAwXSBHSUN2Mzog
NDgwIFNQSXMgaW1wbGVtZW50ZWQKWyAgICAwLjAwMDAwMF0gR0lDdjM6IDAgRXh0ZW5kZWQgU1BJ
cyBpbXBsZW1lbnRlZApbICAgIDAuMDAwMDAwXSBHSUN2MzogRGlzdHJpYnV0b3IgaGFzIG5vIFJh
bmdlIFNlbGVjdG9yIHN1cHBvcnQKWyAgICAwLjAwMDAwMF0gR0lDdjM6IDE2IFBQSXMgaW1wbGVt
ZW50ZWQKWyAgICAwLjAwMDAwMF0gR0lDdjM6IENQVTA6IGZvdW5kIHJlZGlzdHJpYnV0b3IgMCBy
ZWdpb24gMDoweDAwMDAwMDAwMTE5NDAwMDAKWyAgICAwLjAwMDAwMF0gcmFuZG9tOiBnZXRfcmFu
ZG9tX2J5dGVzIGNhbGxlZCBmcm9tIHN0YXJ0X2tlcm5lbCsweDMxYy8weDRlOCB3aXRoIGNybmdf
aW5pdD0wClsgICAgMC4wMDAwMDBdIGFyY2hfdGltZXI6IGNwMTUgdGltZXIocykgcnVubmluZyBh
dCAyNC4wME1IeiAocGh5cykuClsgICAgMC4wMDAwMDBdIGNsb2Nrc291cmNlOiBhcmNoX3N5c19j
b3VudGVyOiBtYXNrOiAweGZmZmZmZmZmZmZmZmZmIG1heF9jeWNsZXM6IDB4NTg4ZmU5ZGMwLCBt
YXhfaWRsZV9uczogNDQwNzk1MjAyNTkyIG5zClsgICAgMC4wMDAwMDRdIHNjaGVkX2Nsb2NrOiA1
NiBiaXRzIGF0IDI0TUh6LCByZXNvbHV0aW9uIDQxbnMsIHdyYXBzIGV2ZXJ5IDQzOTgwNDY1MTEw
OTducwpbICAgIDAuMDAwMTc1XSBDb25zb2xlOiBjb2xvdXIgZHVtbXkgZGV2aWNlIDgweDI1Clsg
ICAgMC4wMDA1ODBdIHByaW50azogY29uc29sZSBbdHR5MF0gZW5hYmxlZApbICAgIDAuMDAwNjc3
XSBDYWxpYnJhdGluZyBkZWxheSBsb29wIChza2lwcGVkKSwgdmFsdWUgY2FsY3VsYXRlZCB1c2lu
ZyB0aW1lciBmcmVxdWVuY3kuLiA0OC4wMCBCb2dvTUlQUyAobHBqPTk2MDAwKQpbICAgIDAuMDAw
NzA0XSBwaWRfbWF4OiBkZWZhdWx0OiAzMjc2OCBtaW5pbXVtOiAzMDEKWyAgICAwLjAwMDc4N10g
TFNNOiBTZWN1cml0eSBGcmFtZXdvcmsgaW5pdGlhbGl6aW5nClsgICAgMC4wMDA4NTldIE1vdW50
LWNhY2hlIGhhc2ggdGFibGUgZW50cmllczogNDA5NiAob3JkZXI6IDMsIDMyNzY4IGJ5dGVzLCBs
aW5lYXIpClsgICAgMC4wMDA4ODNdIE1vdW50cG9pbnQtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVz
OiA0MDk2IChvcmRlcjogMywgMzI3NjggYnl0ZXMsIGxpbmVhcikKWyAgICAwLjAwMjUzNV0gcmN1
OiBIaWVyYXJjaGljYWwgU1JDVSBpbXBsZW1lbnRhdGlvbi4KWyAgICAwLjAwMzMyMl0gRGV0ZWN0
ZWQgUmVuZXNhcyBSWi9WMkwgcjlhMDdnMDU0IApbICAgIDAuMDAzNzg5XSBFRkkgc2VydmljZXMg
d2lsbCBub3QgYmUgYXZhaWxhYmxlLgpbICAgIDAuMDA0MTI3XSBzbXA6IEJyaW5naW5nIHVwIHNl
Y29uZGFyeSBDUFVzIC4uLgpbICAgIDAuMDA0NjI0XSBEZXRlY3RlZCBWSVBUIEktY2FjaGUgb24g
Q1BVMQpbICAgIDAuMDA0NjY3XSBHSUN2MzogQ1BVMTogZm91bmQgcmVkaXN0cmlidXRvciAxMDAg
cmVnaW9uIDA6MHgwMDAwMDAwMDExOTYwMDAwClsgICAgMC4wMDQ3MjldIENQVTE6IEJvb3RlZCBz
ZWNvbmRhcnkgcHJvY2Vzc29yIDB4MDAwMDAwMDEwMCBbMHg0MTJmZDA1MF0KWyAgICAwLjAwNDg1
NV0gc21wOiBCcm91Z2h0IHVwIDEgbm9kZSwgMiBDUFVzClsgICAgMC4wMDQ5MDRdIFNNUDogVG90
YWwgb2YgMiBwcm9jZXNzb3JzIGFjdGl2YXRlZC4KWyAgICAwLjAwNDkxN10gQ1BVIGZlYXR1cmVz
OiBkZXRlY3RlZDogUHJpdmlsZWdlZCBBY2Nlc3MgTmV2ZXIKWyAgICAwLjAwNDkyN10gQ1BVIGZl
YXR1cmVzOiBkZXRlY3RlZDogTFNFIGF0b21pYyBpbnN0cnVjdGlvbnMKWyAgICAwLjAwNDkzOF0g
Q1BVIGZlYXR1cmVzOiBkZXRlY3RlZDogVXNlciBBY2Nlc3MgT3ZlcnJpZGUKWyAgICAwLjAwNDk0
OV0gQ1BVIGZlYXR1cmVzOiBkZXRlY3RlZDogMzItYml0IEVMMCBTdXBwb3J0ClsgICAgMC4wMDQ5
NjBdIENQVSBmZWF0dXJlczogZGV0ZWN0ZWQ6IENvbW1vbiBub3QgUHJpdmF0ZSB0cmFuc2xhdGlv
bnMKWyAgICAwLjAwNDk3MV0gQ1BVIGZlYXR1cmVzOiBkZXRlY3RlZDogUkFTIEV4dGVuc2lvbiBT
dXBwb3J0ClsgICAgMC4wMDQ5ODJdIENQVSBmZWF0dXJlczogZGV0ZWN0ZWQ6IERhdGEgY2FjaGUg
Y2xlYW4gdG8gdGhlIFBvVSBub3QgcmVxdWlyZWQgZm9yIEkvRCBjb2hlcmVuY2UKWyAgICAwLjAw
NDk5Nl0gQ1BVIGZlYXR1cmVzOiBkZXRlY3RlZDogQ1JDMzIgaW5zdHJ1Y3Rpb25zClsgICAgMC4w
MDUwMDZdIENQVSBmZWF0dXJlczogZGV0ZWN0ZWQ6IFNwZWN1bGF0aXZlIFN0b3JlIEJ5cGFzc2lu
ZyBTYWZlIChTU0JTKQpbICAgIDAuMDIwNjQxXSBDUFU6IEFsbCBDUFUocykgc3RhcnRlZCBhdCBF
TDIKWyAgICAwLjAyMzAwM10gZGV2dG1wZnM6IGluaXRpYWxpemVkClsgICAgMC4wMjc1MDJdIGNs
b2Nrc291cmNlOiBqaWZmaWVzOiBtYXNrOiAweGZmZmZmZmZmIG1heF9jeWNsZXM6IDB4ZmZmZmZm
ZmYsIG1heF9pZGxlX25zOiA3NjQ1MDQxNzg1MTAwMDAwIG5zClsgICAgMC4wMjc1NTZdIGZ1dGV4
IGhhc2ggdGFibGUgZW50cmllczogNTEyIChvcmRlcjogMywgMzI3NjggYnl0ZXMsIGxpbmVhcikK
WyAgICAwLjAyODI5NV0gcGluY3RybCBjb3JlOiBpbml0aWFsaXplZCBwaW5jdHJsIHN1YnN5c3Rl
bQpbICAgIDAuMDI5NDE2XSBETUkgbm90IHByZXNlbnQgb3IgaW52YWxpZC4KWyAgICAwLjAzMDAy
M10gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAxNgpbICAgIDAuMDMxNjQ0XSBETUE6
IHByZWFsbG9jYXRlZCAyNTYgS2lCIEdGUF9LRVJORUwgcG9vbCBmb3IgYXRvbWljIGFsbG9jYXRp
b25zClsgICAgMC4wMzE4MDJdIERNQTogcHJlYWxsb2NhdGVkIDI1NiBLaUIgR0ZQX0tFUk5FTHxH
RlBfRE1BIHBvb2wgZm9yIGF0b21pYyBhbGxvY2F0aW9ucwpbICAgIDAuMDMxOTY2XSBETUE6IHBy
ZWFsbG9jYXRlZCAyNTYgS2lCIEdGUF9LRVJORUx8R0ZQX0RNQTMyIHBvb2wgZm9yIGF0b21pYyBh
bGxvY2F0aW9ucwpbICAgIDAuMDMyMDc0XSBhdWRpdDogaW5pdGlhbGl6aW5nIG5ldGxpbmsgc3Vi
c3lzIChkaXNhYmxlZCkKWyAgICAwLjAzMjM3NF0gYXVkaXQ6IHR5cGU9MjAwMCBhdWRpdCgwLjAz
MjoxKTogc3RhdGU9aW5pdGlhbGl6ZWQgYXVkaXRfZW5hYmxlZD0wIHJlcz0xClsgICAgMC4wMzMz
NDFdIHRoZXJtYWxfc3lzOiBSZWdpc3RlcmVkIHRoZXJtYWwgZ292ZXJub3IgJ3N0ZXBfd2lzZScK
WyAgICAwLjAzMzQ4MF0gY3B1aWRsZTogdXNpbmcgZ292ZXJub3IgbWVudQpbICAgIDAuMDMzNjgz
XSBody1icmVha3BvaW50OiBmb3VuZCA2IGJyZWFrcG9pbnQgYW5kIDQgd2F0Y2hwb2ludCByZWdp
c3RlcnMuClsgICAgMC4wMzM3NzZdIEFTSUQgYWxsb2NhdG9yIGluaXRpYWxpc2VkIHdpdGggNjU1
MzYgZW50cmllcwpbICAgIDAuMDM0NjYyXSBTZXJpYWw6IEFNQkEgUEwwMTEgVUFSVCBkcml2ZXIK
WyAgICAwLjA2MDA1NV0gSHVnZVRMQiByZWdpc3RlcmVkIDEuMDAgR2lCIHBhZ2Ugc2l6ZSwgcHJl
LWFsbG9jYXRlZCAwIHBhZ2VzClsgICAgMC4wNjAwOTJdIEh1Z2VUTEIgcmVnaXN0ZXJlZCAzMi4w
IE1pQiBwYWdlIHNpemUsIHByZS1hbGxvY2F0ZWQgMCBwYWdlcwpbICAgIDAuMDYwMTA1XSBIdWdl
VExCIHJlZ2lzdGVyZWQgMi4wMCBNaUIgcGFnZSBzaXplLCBwcmUtYWxsb2NhdGVkIDAgcGFnZXMK
WyAgICAwLjA2MDExOF0gSHVnZVRMQiByZWdpc3RlcmVkIDY0LjAgS2lCIHBhZ2Ugc2l6ZSwgcHJl
LWFsbG9jYXRlZCAwIHBhZ2VzClsgICAgMC4wNjE0NDZdIGNyeXB0ZDogbWF4X2NwdV9xbGVuIHNl
dCB0byAxMDAwClsgICAgMC4wNjM3NzJdIEFDUEk6IEludGVycHJldGVyIGRpc2FibGVkLgpbICAg
IDAuMDY2MTczXSBpb21tdTogRGVmYXVsdCBkb21haW4gdHlwZTogVHJhbnNsYXRlZCAKWyAgICAw
LjA2NjQyMl0gdmdhYXJiOiBsb2FkZWQKWyAgICAwLjA2Njc1MV0gU0NTSSBzdWJzeXN0ZW0gaW5p
dGlhbGl6ZWQKWyAgICAwLjA2NzI1MV0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNl
IGRyaXZlciB1c2JmcwpbICAgIDAuMDY3MzE2XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRl
cmZhY2UgZHJpdmVyIGh1YgpbICAgIDAuMDY3MzU5XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBk
ZXZpY2UgZHJpdmVyIHVzYgpbICAgIDAuMDY3OTkwXSBwcHNfY29yZTogTGludXhQUFMgQVBJIHZl
ci4gMSByZWdpc3RlcmVkClsgICAgMC4wNjgwMDRdIHBwc19jb3JlOiBTb2Z0d2FyZSB2ZXIuIDUu
My42IC0gQ29weXJpZ2h0IDIwMDUtMjAwNyBSb2RvbGZvIEdpb21ldHRpIDxnaW9tZXR0aUBsaW51
eC5pdD4KWyAgICAwLjA2ODAyOV0gUFRQIGNsb2NrIHN1cHBvcnQgcmVnaXN0ZXJlZApbICAgIDAu
MDY5NDA2XSBjbG9ja3NvdXJjZTogU3dpdGNoZWQgdG8gY2xvY2tzb3VyY2UgYXJjaF9zeXNfY291
bnRlcgpbICAgIDAuMDY5NjgyXSBWRlM6IERpc2sgcXVvdGFzIGRxdW90XzYuNi4wClsgICAgMC4w
Njk3NTddIFZGUzogRHF1b3QtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiA1MTIgKG9yZGVyIDAs
IDQwOTYgYnl0ZXMpClsgICAgMC4wNjk5NjVdIHBucDogUG5QIEFDUEk6IGRpc2FibGVkClsgICAg
MC4wNzYxMzRdIE5FVDogUmVnaXN0ZXJlZCBwcm90b2NvbCBmYW1pbHkgMgpbICAgIDAuMDc2Mzcz
XSBJUCBpZGVudHMgaGFzaCB0YWJsZSBlbnRyaWVzOiAzMjc2OCAob3JkZXI6IDYsIDI2MjE0NCBi
eXRlcywgbGluZWFyKQpbICAgIDAuMDc3NjY1XSB0Y3BfbGlzdGVuX3BvcnRhZGRyX2hhc2ggaGFz
aCB0YWJsZSBlbnRyaWVzOiAxMDI0IChvcmRlcjogMiwgMTYzODQgYnl0ZXMsIGxpbmVhcikKWyAg
ICAwLjA3Nzc4Ml0gVENQIGVzdGFibGlzaGVkIGhhc2ggdGFibGUgZW50cmllczogMTYzODQgKG9y
ZGVyOiA1LCAxMzEwNzIgYnl0ZXMsIGxpbmVhcikKWyAgICAwLjA3NzkwOV0gVENQIGJpbmQgaGFz
aCB0YWJsZSBlbnRyaWVzOiAxNjM4NCAob3JkZXI6IDYsIDI2MjE0NCBieXRlcywgbGluZWFyKQpb
ICAgIDAuMDc4MTkzXSBUQ1A6IEhhc2ggdGFibGVzIGNvbmZpZ3VyZWQgKGVzdGFibGlzaGVkIDE2
Mzg0IGJpbmQgMTYzODQpClsgICAgMC4wNzgzNzhdIFVEUCBoYXNoIHRhYmxlIGVudHJpZXM6IDEw
MjQgKG9yZGVyOiAzLCAzMjc2OCBieXRlcywgbGluZWFyKQpbICAgIDAuMDc4NDI2XSBVRFAtTGl0
ZSBoYXNoIHRhYmxlIGVudHJpZXM6IDEwMjQgKG9yZGVyOiAzLCAzMjc2OCBieXRlcywgbGluZWFy
KQpbICAgIDAuMDc4NTk2XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDEKWyAgICAw
LjA3OTE3Ml0gUlBDOiBSZWdpc3RlcmVkIG5hbWVkIFVOSVggc29ja2V0IHRyYW5zcG9ydCBtb2R1
bGUuClsgICAgMC4wNzkyMDNdIFJQQzogUmVnaXN0ZXJlZCB1ZHAgdHJhbnNwb3J0IG1vZHVsZS4K
WyAgICAwLjA3OTIxNF0gUlBDOiBSZWdpc3RlcmVkIHRjcCB0cmFuc3BvcnQgbW9kdWxlLgpbICAg
IDAuMDc5MjI1XSBSUEM6IFJlZ2lzdGVyZWQgdGNwIE5GU3Y0LjEgYmFja2NoYW5uZWwgdHJhbnNw
b3J0IG1vZHVsZS4KWyAgICAwLjA3OTI0NF0gUENJOiBDTFMgMCBieXRlcywgZGVmYXVsdCA2NApb
ICAgIDAuMDgxNTcxXSBJbml0aWFsaXNlIHN5c3RlbSB0cnVzdGVkIGtleXJpbmdzClsgICAgMC4w
ODE4NDldIHdvcmtpbmdzZXQ6IHRpbWVzdGFtcF9iaXRzPTQyIG1heF9vcmRlcj0xOSBidWNrZXRf
b3JkZXI9MApbICAgIDAuMDg3ODkwXSBzcXVhc2hmczogdmVyc2lvbiA0LjAgKDIwMDkvMDEvMzEp
IFBoaWxsaXAgTG91Z2hlcgpbICAgIDAuMDg4NzQ0XSBORlM6IFJlZ2lzdGVyaW5nIHRoZSBpZF9y
ZXNvbHZlciBrZXkgdHlwZQpbICAgIDAuMDg4Nzk2XSBLZXkgdHlwZSBpZF9yZXNvbHZlciByZWdp
c3RlcmVkClsgICAgMC4wODg4MDddIEtleSB0eXBlIGlkX2xlZ2FjeSByZWdpc3RlcmVkClsgICAg
MC4wODg5MDRdIG5mczRmaWxlbGF5b3V0X2luaXQ6IE5GU3Y0IEZpbGUgTGF5b3V0IERyaXZlciBS
ZWdpc3RlcmluZy4uLgpbICAgIDAuMDg4OTIwXSBuZnM0ZmxleGZpbGVsYXlvdXRfaW5pdDogTkZT
djQgRmxleGZpbGUgTGF5b3V0IERyaXZlciBSZWdpc3RlcmluZy4uLgpbICAgIDAuMDg5MTU1XSA5
cDogSW5zdGFsbGluZyB2OWZzIDlwMjAwMCBmaWxlIHN5c3RlbSBzdXBwb3J0ClsgICAgMC4xMjUw
MjZdIEtleSB0eXBlIGFzeW1tZXRyaWMgcmVnaXN0ZXJlZApbICAgIDAuMTI1MDYyXSBBc3ltbWV0
cmljIGtleSBwYXJzZXIgJ3g1MDknIHJlZ2lzdGVyZWQKWyAgICAwLjEyNTEyOV0gQmxvY2sgbGF5
ZXIgU0NTSSBnZW5lcmljIChic2cpIGRyaXZlciB2ZXJzaW9uIDAuNCBsb2FkZWQgKG1ham9yIDI0
NykKWyAgICAwLjEyNTE0OF0gaW8gc2NoZWR1bGVyIG1xLWRlYWRsaW5lIHJlZ2lzdGVyZWQKWyAg
ICAwLjEyNTE1OF0gaW8gc2NoZWR1bGVyIGt5YmVyIHJlZ2lzdGVyZWQKWyAgICAwLjE0NjY2N10g
U2VyaWFsOiA4MjUwLzE2NTUwIGRyaXZlciwgNCBwb3J0cywgSVJRIHNoYXJpbmcgZW5hYmxlZApb
ICAgIDAuMTQ4OTg2XSBTdXBlckggKEgpU0NJKEYpIGRyaXZlciBpbml0aWFsaXplZApbICAgIDAu
MTQ5NjI5XSBtc21fc2VyaWFsOiBkcml2ZXIgaW5pdGlhbGl6ZWQKWyAgICAwLjE1ODM2MF0gbG9v
cDogbW9kdWxlIGxvYWRlZApbICAgIDAuMTYzNjgyXSB0dW46IFVuaXZlcnNhbCBUVU4vVEFQIGRl
dmljZSBkcml2ZXIsIDEuNgpbICAgIDAuMTY0OTczXSBlMTAwMGU6IEludGVsKFIpIFBSTy8xMDAw
IE5ldHdvcmsgRHJpdmVyClsgICAgMC4xNjUwMDJdIGUxMDAwZTogQ29weXJpZ2h0KGMpIDE5OTkg
LSAyMDE1IEludGVsIENvcnBvcmF0aW9uLgpbICAgIDAuMTY1MDc3XSBpZ2I6IEludGVsKFIpIEdp
Z2FiaXQgRXRoZXJuZXQgTmV0d29yayBEcml2ZXIKWyAgICAwLjE2NTA5M10gaWdiOiBDb3B5cmln
aHQgKGMpIDIwMDctMjAxNCBJbnRlbCBDb3Jwb3JhdGlvbi4KWyAgICAwLjE2NTE0OV0gaWdidmY6
IEludGVsKFIpIEdpZ2FiaXQgVmlydHVhbCBGdW5jdGlvbiBOZXR3b3JrIERyaXZlcgpbICAgIDAu
MTY1MTYzXSBpZ2J2ZjogQ29weXJpZ2h0IChjKSAyMDA5IC0gMjAxMiBJbnRlbCBDb3Jwb3JhdGlv
bi4KWyAgICAwLjE2NTYxN10gc2t5MjogZHJpdmVyIHZlcnNpb24gMS4zMApbICAgIDAuMTY3NDY1
XSBWRklPIC0gVXNlciBMZXZlbCBtZXRhLWRyaXZlciB2ZXJzaW9uOiAwLjMKWyAgICAwLjE2OTU4
OF0gZWhjaV9oY2Q6IFVTQiAyLjAgJ0VuaGFuY2VkJyBIb3N0IENvbnRyb2xsZXIgKEVIQ0kpIERy
aXZlcgpbICAgIDAuMTY5NjI0XSBlaGNpLXBjaTogRUhDSSBQQ0kgcGxhdGZvcm0gZHJpdmVyClsg
ICAgMC4xNjk2NjVdIGVoY2ktcGxhdGZvcm06IEVIQ0kgZ2VuZXJpYyBwbGF0Zm9ybSBkcml2ZXIK
WyAgICAwLjE3MDM0M10gZWhjaS1vcmlvbjogRUhDSSBvcmlvbiBkcml2ZXIKWyAgICAwLjE3MDU2
Ml0gZWhjaS1leHlub3M6IEVIQ0kgRXh5bm9zIGRyaXZlcgpbICAgIDAuMTcwNjk2XSBvaGNpX2hj
ZDogVVNCIDEuMSAnT3BlbicgSG9zdCBDb250cm9sbGVyIChPSENJKSBEcml2ZXIKWyAgICAwLjE3
MDc0N10gb2hjaS1wY2k6IE9IQ0kgUENJIHBsYXRmb3JtIGRyaXZlcgpbICAgIDAuMTcwODE4XSBv
aGNpLXBsYXRmb3JtOiBPSENJIGdlbmVyaWMgcGxhdGZvcm0gZHJpdmVyClsgICAgMC4xNzEzOTVd
IG9oY2ktZXh5bm9zOiBPSENJIEV4eW5vcyBkcml2ZXIKWyAgICAwLjE3MjE2NV0gdXNiY29yZTog
cmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciB1c2Itc3RvcmFnZQpbICAgIDAuMTc0Nzc3
XSBpMmMgL2RldiBlbnRyaWVzIGRyaXZlcgpbICAgIDAuMTc4ODMwXSBzZGhjaTogU2VjdXJlIERp
Z2l0YWwgSG9zdCBDb250cm9sbGVyIEludGVyZmFjZSBkcml2ZXIKWyAgICAwLjE3ODg2MF0gc2Ro
Y2k6IENvcHlyaWdodChjKSBQaWVycmUgT3NzbWFuClsgICAgMC4xNzkzNDhdIFN5bm9wc3lzIERl
c2lnbndhcmUgTXVsdGltZWRpYSBDYXJkIEludGVyZmFjZSBEcml2ZXIKWyAgICAwLjE4MDQzNV0g
c2RoY2ktcGx0Zm06IFNESENJIHBsYXRmb3JtIGFuZCBPRiBkcml2ZXIgaGVscGVyClsgICAgMC4x
ODIwNjddIFNNQ0NDOiBTT0NfSUQ6IEFSQ0hfU09DX0lEIG5vdCBpbXBsZW1lbnRlZCwgc2tpcHBp
bmcgLi4uLgpbICAgIDAuMTgyNzU0XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2Ug
ZHJpdmVyIHVzYmhpZApbICAgIDAuMTgyNzc2XSB1c2JoaWQ6IFVTQiBISUQgY29yZSBkcml2ZXIK
WyAgICAwLjE4NTI2Nl0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAxMApbICAgIDAu
MTg2MzIwXSBTZWdtZW50IFJvdXRpbmcgd2l0aCBJUHY2ClsgICAgMC4xODY0MDZdIHNpdDogSVB2
NiwgSVB2NCBhbmQgTVBMUyBvdmVyIElQdjQgdHVubmVsaW5nIGRyaXZlcgpbICAgIDAuMTg2OTQ0
XSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wgZmFtaWx5IDE3ClsgICAgMC4xODcwOTldIDlwbmV0
OiBJbnN0YWxsaW5nIDlQMjAwMCBzdXBwb3J0ClsgICAgMC4xODcxNzRdIEtleSB0eXBlIGRuc19y
ZXNvbHZlciByZWdpc3RlcmVkClsgICAgMC4xODc2MjFdIHJlZ2lzdGVyZWQgdGFza3N0YXRzIHZl
cnNpb24gMQpbICAgIDAuMTg3NjQ0XSBMb2FkaW5nIGNvbXBpbGVkLWluIFguNTA5IGNlcnRpZmlj
YXRlcwpbICAgIDAuMTk1NDAwXSBncGlvLTE1MyAoZ3Bpb19zZDBfcHdyX2VuKTogaG9nZ2VkIGFz
IG91dHB1dC9oaWdoClsgICAgMC4xOTU0NTVdIGdwaW8tNDQ5IChzZDBfZGV2X3NlbCk6IGhvZ2dl
ZCBhcyBvdXRwdXQvaGlnaApbICAgIDAuMTk1NDg1XSBncGlvLTQ1OCAoY2FuMF9zdGIpOiBob2dn
ZWQgYXMgb3V0cHV0L2xvdwpbICAgIDAuMTk1NTA5XSBncGlvLTQ1OSAoY2FuMV9zdGIpOiBob2dn
ZWQgYXMgb3V0cHV0L2xvdwpbICAgIDAuMTk1NTQzXSBncGlvLTQzNCAoc2QxX3B3cl9lbik6IGhv
Z2dlZCBhcyBvdXRwdXQvaGlnaApbICAgIDAuMTk2Mjg2XSBwaW5jdHJsLXJ6ZzJsIDExMDMwMDAw
LnBpbmN0cmw6IHBpbmN0cmwtcnpnMmwgc3VwcG9ydCByZWdpc3RlcmVkClsgICAgMC4yMDEwOTNd
IDEwMDRiODAwLnNlcmlhbDogdHR5U0MwIGF0IE1NSU8gMHgxMDA0YjgwMCAoaXJxID0gMjIsIGJh
c2VfYmF1ZCA9IDApIGlzIGEgc2NpZgpbICAgIDEuMjYwNTcxXSBwcmludGs6IGNvbnNvbGUgW3R0
eVNDMF0gZW5hYmxlZApbICAgIDEuMjY2NjE0XSAxMDA0YzAwMC5zZXJpYWw6IHR0eVNDMSBhdCBN
TUlPIDB4MTAwNGMwMDAgKGlycSA9IDI3LCBiYXNlX2JhdWQgPSAwKSBpcyBhIHNjaWYKWyAgICAx
LjI3Njc2M10gcmVuZXNhc19zcGkgMTAwNGIwMDAuc3BpOiBkbWFfcmVxdWVzdF9zbGF2ZV9jaGFu
bmVsX2NvbXBhdCBmYWlsZWQKWyAgICAxLjI4Mzk3NF0gcmVuZXNhc19zcGkgMTAwNGIwMDAuc3Bp
OiBETUEgbm90IGF2YWlsYWJsZSwgdXNpbmcgUElPClsgICAgMS4yOTA1NDNdIHJlbmVzYXNfc3Bp
IDEwMDRiMDAwLnNwaTogcHJvYmVkClsgICAgMS4yOTY0MzFdIHJhdmIgMTFjMjAwMDAuZXRoZXJu
ZXQ6IG5vIHZhbGlkIE1BQyBhZGRyZXNzIHN1cHBsaWVkLCB1c2luZyBhIHJhbmRvbSBvbmUKWyAg
ICAxLjMwNzAyOV0gcmF2YiAxMWMyMDAwMC5ldGhlcm5ldCBldGgwOiBCYXNlIGFkZHJlc3MgYXQg
MHgxMWMyMDAwMCwgZGE6ZTk6NjU6YzY6YTQ6ZmIsIElSUSA4NS4KWyAgICAxLjMxNzM3Nl0gcmF2
YiAxMWMzMDAwMC5ldGhlcm5ldDogbm8gdmFsaWQgTUFDIGFkZHJlc3Mgc3VwcGxpZWQsIHVzaW5n
IGEgcmFuZG9tIG9uZQpbICAgIDEuMzI3NzgxXSByYXZiIDExYzMwMDAwLmV0aGVybmV0IGV0aDE6
IEJhc2UgYWRkcmVzcyBhdCAweDExYzMwMDAwLCA1MjpjZjowZToxODoyODo5OSwgSVJRIDg4Lgpb
ICAgIDEuMzY1NDMzXSBlaGNpLXBsYXRmb3JtIDExYzUwMTAwLnVzYjogRUhDSSBIb3N0IENvbnRy
b2xsZXIKWyAgICAxLjM3MTE0MV0gZWhjaS1wbGF0Zm9ybSAxMWM1MDEwMC51c2I6IG5ldyBVU0Ig
YnVzIHJlZ2lzdGVyZWQsIGFzc2lnbmVkIGJ1cyBudW1iZXIgMQpbICAgIDEuMzc5MDg3XSBlaGNp
LXBsYXRmb3JtIDExYzUwMTAwLnVzYjogaXJxIDkzLCBpbyBtZW0gMHgxMWM1MDEwMApbICAgIDEu
Mzk3NDA4XSBlaGNpLXBsYXRmb3JtIDExYzUwMTAwLnVzYjogVVNCIDIuMCBzdGFydGVkLCBFSENJ
IDEuMTAKWyAgICAxLjQwNDI4OF0gaHViIDEtMDoxLjA6IFVTQiBodWIgZm91bmQKWyAgICAxLjQw
ODA3OF0gaHViIDEtMDoxLjA6IDEgcG9ydCBkZXRlY3RlZApbICAgIDEuNDEzNzU0XSBlaGNpLXBs
YXRmb3JtIDExYzcwMTAwLnVzYjogRUhDSSBIb3N0IENvbnRyb2xsZXIKWyAgICAxLjQxOTQ1M10g
ZWhjaS1wbGF0Zm9ybSAxMWM3MDEwMC51c2I6IG5ldyBVU0IgYnVzIHJlZ2lzdGVyZWQsIGFzc2ln
bmVkIGJ1cyBudW1iZXIgMgpbICAgIDEuNDI3MzY4XSBlaGNpLXBsYXRmb3JtIDExYzcwMTAwLnVz
YjogaXJxIDk0LCBpbyBtZW0gMHgxMWM3MDEwMApbICAgIDEuNDQ5NDI3XSBlaGNpLXBsYXRmb3Jt
IDExYzcwMTAwLnVzYjogVVNCIDIuMCBzdGFydGVkLCBFSENJIDEuMTAKWyAgICAxLjQ1NjIzOV0g
aHViIDItMDoxLjA6IFVTQiBodWIgZm91bmQKWyAgICAxLjQ2MDAyNF0gaHViIDItMDoxLjA6IDEg
cG9ydCBkZXRlY3RlZApbICAgIDEuNDY1NjA1XSBvaGNpLXBsYXRmb3JtIDExYzUwMDAwLnVzYjog
R2VuZXJpYyBQbGF0Zm9ybSBPSENJIGNvbnRyb2xsZXIKWyAgICAxLjQ3MjMzNl0gb2hjaS1wbGF0
Zm9ybSAxMWM1MDAwMC51c2I6IG5ldyBVU0IgYnVzIHJlZ2lzdGVyZWQsIGFzc2lnbmVkIGJ1cyBu
dW1iZXIgMwpbICAgIDEuNDgwMzE4XSBvaGNpLXBsYXRmb3JtIDExYzUwMDAwLnVzYjogaXJxIDkx
LCBpbyBtZW0gMHgxMWM1MDAwMApbICAgIDEuNTc2MDMzXSBodWIgMy0wOjEuMDogVVNCIGh1YiBm
b3VuZApbICAgIDEuNTc5ODI0XSBodWIgMy0wOjEuMDogMSBwb3J0IGRldGVjdGVkClsgICAgMS41
ODUzODVdIG9oY2ktcGxhdGZvcm0gMTFjNzAwMDAudXNiOiBHZW5lcmljIFBsYXRmb3JtIE9IQ0kg
Y29udHJvbGxlcgpbICAgIDEuNTkyMTUxXSBvaGNpLXBsYXRmb3JtIDExYzcwMDAwLnVzYjogbmV3
IFVTQiBidXMgcmVnaXN0ZXJlZCwgYXNzaWduZWQgYnVzIG51bWJlciA0ClsgICAgMS42MDAxMThd
IG9oY2ktcGxhdGZvcm0gMTFjNzAwMDAudXNiOiBpcnEgOTIsIGlvIG1lbSAweDExYzcwMDAwClsg
ICAgMS42OTYwNTddIGh1YiA0LTA6MS4wOiBVU0IgaHViIGZvdW5kClsgICAgMS42OTk4NTddIGh1
YiA0LTA6MS4wOiAxIHBvcnQgZGV0ZWN0ZWQKWyAgICAxLjcwNjI2NV0gaTJjLXJpaWMgMTAwNTgw
MDAuaTJjOiByZWdpc3RlcmVkIHdpdGggMTAwMDAwSHogYnVzIHNwZWVkClsgICAgMS43MTQ5MDBd
IGkyYy1yaWljIDEwMDU4NDAwLmkyYzogcmVnaXN0ZXJlZCB3aXRoIDEwMDAwMEh6IGJ1cyBzcGVl
ZApbICAgIDEuNzIzNjU5XSBpMmMtcmlpYyAxMDA1OGMwMC5pMmM6IHJlZ2lzdGVyZWQgd2l0aCA0
MDAwMDBIeiBidXMgc3BlZWQKWyAgICAxLjc4MzA4NV0gcmVuZXNhc19zZGhpX2ludGVybmFsX2Rt
YWMgMTFjMDAwMDAubW1jOiBtbWMwIGJhc2UgYXQgMHgwMDAwMDAwMDExYzAwMDAwLCBtYXggY2xv
Y2sgcmF0ZSAxMzMgTUh6ClsgICAgMS43ODU1MTNdIHJlbmVzYXNfc2RoaV9pbnRlcm5hbF9kbWFj
IDExYzEwMDAwLm1tYzogbW1jMSBiYXNlIGF0IDB4MDAwMDAwMDAxMWMxMDAwMCwgbWF4IGNsb2Nr
IHJhdGUgMTMzIE1IegpbICAgIDEuODAzMzk3XSBXYWl0aW5nIGZvciByb290IGRldmljZSAvZGV2
L3NkYTEuLi4KWyAgICAxLjkwMzI1MF0gbW1jMDogbmV3IEhTMjAwIE1NQyBjYXJkIGF0IGFkZHJl
c3MgMDAwMQpbICAgIDEuOTA4OTA0XSBtbWNibGswOiBtbWMwOjAwMDEgUzBKNThYIDU5LjMgR2lC
IApbICAgIDEuOTEzNjUzXSBtbWNibGswYm9vdDA6IG1tYzA6MDAwMSBTMEo1OFggcGFydGl0aW9u
IDEgMzEuNSBNaUIKWyAgICAxLjkxOTcyMl0gbW1jYmxrMGJvb3QxOiBtbWMwOjAwMDEgUzBKNThY
IHBhcnRpdGlvbiAyIDMxLjUgTWlCClsgICAgMS45MjU4NzJdIG1tY2JsazBycG1iOiBtbWMwOjAw
MDEgUzBKNThYIHBhcnRpdGlvbiAzIDQuMDAgTWlCLCBjaGFyZGV2ICgyNDE6MCkKWyAgICAxLjkz
NDM3N10gIG1tY2JsazA6IHAxClsgICAgMi4xODMwNjFdIG1tYzE6IG5ldyB1bHRyYSBoaWdoIHNw
ZWVkIFNEUjEwNCBTREhDIGNhcmQgYXQgYWRkcmVzcyBhYWFhClsgICAgMi4xOTAzNDNdIG1tY2Js
azE6IG1tYzE6YWFhYSBTQzE2RyAxNC44IEdpQiAKWyAgICAyLjIwMDIyM10gIG1tY2JsazE6IHAx
IHAyClsgICAgMi4yOTM0MjFdIHVzYiAyLTE6IG5ldyBoaWdoLXNwZWVkIFVTQiBkZXZpY2UgbnVt
YmVyIDIgdXNpbmcgZWhjaS1wbGF0Zm9ybQpbICAgIDIuNDU1MTY1XSB1c2Itc3RvcmFnZSAyLTE6
MS4wOiBVU0IgTWFzcyBTdG9yYWdlIGRldmljZSBkZXRlY3RlZApbICAgIDIuNDYxODE5XSBzY3Np
IGhvc3QwOiB1c2Itc3RvcmFnZSAyLTE6MS4wClsgICAgMy40ODY0MjldIHNjc2kgMDowOjA6MDog
RGlyZWN0LUFjY2VzcyAgICAgR2VuZXJhbCAgVVNCIEZsYXNoIERpc2sgICAxLjAwIFBROiAwIEFO
U0k6IDIKWyAgICAzLjQ5NTcxMV0gc2QgMDowOjA6MDogW3NkYV0gNzgzMTU1MiA1MTItYnl0ZSBs
b2dpY2FsIGJsb2NrczogKDQuMDEgR0IvMy43MyBHaUIpClsgICAgMy41MDM3NTRdIHNkIDA6MDow
OjA6IFtzZGFdIFdyaXRlIFByb3RlY3QgaXMgb2ZmClsgICAgMy41MDkxMTFdIHNkIDA6MDowOjA6
IFtzZGFdIE5vIENhY2hpbmcgbW9kZSBwYWdlIGZvdW5kClsgICAgMy41MTQ0MTVdIHNkIDA6MDow
OjA6IFtzZGFdIEFzc3VtaW5nIGRyaXZlIGNhY2hlOiB3cml0ZSB0aHJvdWdoClsgICAgMy41MjQx
OThdICBzZGE6IHNkYTEgc2RhMgpbICAgIDMuNTMwMzg3XSBzZCAwOjA6MDowOiBbc2RhXSBBdHRh
Y2hlZCBTQ1NJIHJlbW92YWJsZSBkaXNrClsgICAgMy41NTg5NzhdIHJhbmRvbTogZmFzdCBpbml0
IGRvbmUKWyAgICAzLjk1NjYwOV0gRVhUNC1mcyAoc2RhMSk6IHJlY292ZXJ5IGNvbXBsZXRlClsg
ICAgMy45NjMzMTNdIEVYVDQtZnMgKHNkYTEpOiBtb3VudGVkIGZpbGVzeXN0ZW0gd2l0aCBvcmRl
cmVkIGRhdGEgbW9kZS4gT3B0czogKG51bGwpClsgICAgMy45NzEwNTNdIFZGUzogTW91bnRlZCBy
b290IChleHQ0IGZpbGVzeXN0ZW0pIG9uIGRldmljZSA4OjEuClsgICAgMy45ODE1MTJdIGRldnRt
cGZzOiBtb3VudGVkClsgICAgMy45ODg4MzhdIEZyZWVpbmcgdW51c2VkIGtlcm5lbCBtZW1vcnk6
IDQ1NDRLClsgICAgMy45OTM1NjNdIFJ1biAvc2Jpbi9pbml0IGFzIGluaXQgcHJvY2VzcwpbICAg
IDQuMzYxODM5XSBzeXN0ZW1kWzFdOiBTeXN0ZW0gdGltZSBiZWZvcmUgYnVpbGQgdGltZSwgYWR2
YW5jaW5nIGNsb2NrLgpbICAgIDQuNDE1Njk3XSBzeXN0ZW1kWzFdOiBzeXN0ZW1kIDI0NC41KyBy
dW5uaW5nIGluIHN5c3RlbSBtb2RlLiAoK1BBTSAtQVVESVQgLVNFTElOVVggK0lNQSAtQVBQQVJN
T1IgLVNNQUNLICtTWVNWSU5JVCArVVRNUCAtTElCQ1JZUFRTRVRVUCAtKQpbICAgIDQuNDM3ODIx
XSBzeXN0ZW1kWzFdOiBEZXRlY3RlZCBhcmNoaXRlY3R1cmUgYXJtNjQuCgpXZWxjb21lIHRvIFBv
a3kgKFlvY3RvIFByb2plY3QgUmVmZXJlbmNlIERpc3RybykgMy4xLjUgKGR1bmZlbGwpIQoKWyAg
ICA0LjQ3ODY3Ml0gc3lzdGVtZFsxXTogU2V0IGhvc3RuYW1lIHRvIDxzbWFyYy1yemcybD4uClsg
ICAgNC45NDQzMDBdIHJhbmRvbTogc3lzdGVtZDogdW5pbml0aWFsaXplZCB1cmFuZG9tIHJlYWQg
KDE2IGJ5dGVzIHJlYWQpClsgICAgNC45NTEyNTNdIHN5c3RlbWRbMV06IHN5c3RlbS1nZXR0eS5z
bGljZTogdW5pdCBjb25maWd1cmVzIGFuIElQIGZpcmV3YWxsLCBidXQgdGhlIGxvY2FsIHN5c3Rl
bSBkb2VzIG5vdCBzdXBwb3J0IEJQRi9jZ3JvdXAgZmlyZXdhbGxpbmcuClsgICAgNC45NjM2MDdd
IHN5c3RlbWRbMV06IChUaGlzIHdhcm5pbmcgaXMgb25seSBzaG93biBmb3IgdGhlIGZpcnN0IHVu
aXQgdXNpbmcgSVAgZmlyZXdhbGxpbmcuKQpbICAgIDQuOTc1NDQ2XSBzeXN0ZW1kWzFdOiBDcmVh
dGVkIHNsaWNlIHN5c3RlbS1nZXR0eS5zbGljZS4KWyAgT0sgIF0gQ3JlYXRlZCBzbGljZSBzeXN0
ZW0tZ2V0dHkuc2xpY2UuClsgICAgNC45OTc2MjVdIHJhbmRvbTogc3lzdGVtZDogdW5pbml0aWFs
aXplZCB1cmFuZG9tIHJlYWQgKDE2IGJ5dGVzIHJlYWQpClsgICAgNS4wMDU4MTFdIHN5c3RlbWRb
MV06IENyZWF0ZWQgc2xpY2Ugc3lzdGVtLXNlcmlhbFx4MmRnZXR0eS5zbGljZS4KWyAgT0sgIF0g
Q3JlYXRlZCBzbGljZSBzeXN0ZW0tc2VyaWFsXHgyZGdldHR5LnNsaWNlLgpbICAgIDUuMDI5NjEz
XSByYW5kb206IHN5c3RlbWQ6IHVuaW5pdGlhbGl6ZWQgdXJhbmRvbSByZWFkICgxNiBieXRlcyBy
ZWFkKQpbICAgIDUuMDM3NTU4XSBzeXN0ZW1kWzFdOiBDcmVhdGVkIHNsaWNlIFVzZXIgYW5kIFNl
c3Npb24gU2xpY2UuClsgIE9LICBdIENyZWF0ZWQgc2xpY2UgVXNlciBhbmQgU2Vzc2lvbiBTbGlj
ZS4KWyAgICA1LjA1ODAxN10gc3lzdGVtZFsxXTogU3RhcnRlZCBEaXNwYXRjaCBQYXNzd29yZCBS
ZXF1ZXN0cyB0byBDb25zb2xlIERpcmVjdG9yeSBXYXRjaC4KWyAgT0sgIF0gU3RhcnRlZCBEaXNw
YXRjaCBQYXNzd29yZCDigKZ0cyB0byBDb25zb2xlIERpcmVjdG9yeSBXYXRjaC4KWyAgICA1LjA4
MTkxOV0gc3lzdGVtZFsxXTogU3RhcnRlZCBGb3J3YXJkIFBhc3N3b3JkIFJlcXVlc3RzIHRvIFdh
bGwgRGlyZWN0b3J5IFdhdGNoLgpbICBPSyAgXSBTdGFydGVkIEZvcndhcmQgUGFzc3dvcmQgUuKA
pnVlc3RzIHRvIFdhbGwgRGlyZWN0b3J5IFdhdGNoLgpbICAgIDUuMTA1NzY1XSBzeXN0ZW1kWzFd
OiBSZWFjaGVkIHRhcmdldCBQYXRocy4KWyAgT0sgIF0gUmVhY2hlZCB0YXJnZXQgUGF0aHMuClsg
ICAgNS4xMjU2ODldIHN5c3RlbWRbMV06IFJlYWNoZWQgdGFyZ2V0IFJlbW90ZSBGaWxlIFN5c3Rl
bXMuClsgIE9LICBdIFJlYWNoZWQgdGFyZ2V0IFJlbW90ZSBGaWxlIFN5c3RlbXMuClsgICAgNS4x
NDU2NjVdIHN5c3RlbWRbMV06IFJlYWNoZWQgdGFyZ2V0IFNsaWNlcy4KWyAgT0sgIF0gUmVhY2hl
ZCB0YXJnZXQgU2xpY2VzLgpbICAgIDUuMTY1NjczXSBzeXN0ZW1kWzFdOiBSZWFjaGVkIHRhcmdl
dCBTd2FwLgpbICBPSyAgXSBSZWFjaGVkIHRhcmdldCBTd2FwLgpbICAgIDUuMTk5MTI1XSBzeXN0
ZW1kWzFdOiBMaXN0ZW5pbmcgb24gUlBDYmluZCBTZXJ2ZXIgQWN0aXZhdGlvbiBTb2NrZXQuClsg
IE9LICBdIExpc3RlbmluZyBvbiBSUENiaW5kIFNlcnZlciBBY3RpdmF0aW9uIFNvY2tldC4KWyAg
ICA1LjIyMTcxNF0gc3lzdGVtZFsxXTogUmVhY2hlZCB0YXJnZXQgUlBDIFBvcnQgTWFwcGVyLgpb
ICBPSyAgXSBSZWFjaGVkIHRhcmdldCBSUEMgUG9ydCBNYXBwZXIuClsgICAgNS4yNDQwMThdIHN5
c3RlbWRbMV06IExpc3RlbmluZyBvbiBTeXNsb2cgU29ja2V0LgpbICBPSyAgXSBMaXN0ZW5pbmcg
b24gU3lzbG9nIFNvY2tldC4KWyAgICA1LjI2MjA2OF0gc3lzdGVtZFsxXTogTGlzdGVuaW5nIG9u
IGluaXRjdGwgQ29tcGF0aWJpbGl0eSBOYW1lZCBQaXBlLgpbICBPSyAgXSBMaXN0ZW5pbmcgb24g
aW5pdGN0bCBDb21wYXRpYmlsaXR5IE5hbWVkIFBpcGUuClsgICAgNS4yODY0NzNdIHN5c3RlbWRb
MV06IExpc3RlbmluZyBvbiBKb3VybmFsIEF1ZGl0IFNvY2tldC4KWyAgT0sgIF0gTGlzdGVuaW5n
IG9uIEpvdXJuYWwgQXVkaXQgU29ja2V0LgpbICAgIDUuMzA2MTg0XSBzeXN0ZW1kWzFdOiBMaXN0
ZW5pbmcgb24gSm91cm5hbCBTb2NrZXQgKC9kZXYvbG9nKS4KWyAgT0sgIF0gTGlzdGVuaW5nIG9u
IEpvdXJuYWwgU29ja2V0ICgvZGV2L2xvZykuClsgICAgNS4zMzAzMzldIHN5c3RlbWRbMV06IExp
c3RlbmluZyBvbiBKb3VybmFsIFNvY2tldC4KWyAgT0sgIF0gTGlzdGVuaW5nIG9uIEpvdXJuYWwg
U29ja2V0LgpbICAgIDUuMzUwNDk0XSBzeXN0ZW1kWzFdOiBMaXN0ZW5pbmcgb24gTmV0d29yayBT
ZXJ2aWNlIE5ldGxpbmsgU29ja2V0LgpbICBPSyAgXSBMaXN0ZW5pbmcgb24gTmV0d29yayBTZXJ2
aWNlIE5ldGxpbmsgU29ja2V0LgpbICAgIDUuMzc0MzIzXSBzeXN0ZW1kWzFdOiBMaXN0ZW5pbmcg
b24gdWRldiBDb250cm9sIFNvY2tldC4KWyAgT0sgIF0gTGlzdGVuaW5nIG9uIHVkZXYgQ29udHJv
bCBTb2NrZXQuClsgICAgNS4zOTQwNTddIHN5c3RlbWRbMV06IExpc3RlbmluZyBvbiB1ZGV2IEtl
cm5lbCBTb2NrZXQuClsgIE9LICBdIExpc3RlbmluZyBvbiB1ZGV2IEtlcm5lbCBTb2NrZXQuClsg
ICAgNS40MTg2MjJdIHN5c3RlbWRbMV06IE1vdW50aW5nIEh1Z2UgUGFnZXMgRmlsZSBTeXN0ZW0u
Li4KICAgICAgICAgTW91bnRpbmcgSHVnZSBQYWdlcyBGaWxlIFN5c3RlbS4uLgpbICAgIDUuNDQy
MjU0XSBzeXN0ZW1kWzFdOiBNb3VudGluZyBQT1NJWCBNZXNzYWdlIFF1ZXVlIEZpbGUgU3lzdGVt
Li4uCiAgICAgICAgIE1vdW50aW5nIFBPU0lYIE1lc3NhZ2UgUXVldWUgRmlsZSBTeXN0ZW0uLi4K
WyAgICA1LjQ3MDIwMF0gc3lzdGVtZFsxXTogTW91bnRpbmcgS2VybmVsIERlYnVnIEZpbGUgU3lz
dGVtLi4uCiAgICAgICAgIE1vdW50aW5nIEtlcm5lbCBEZWJ1ZyBGaWxlIFN5c3RlbS4uLgpbICAg
IDUuNDk1NDkxXSBzeXN0ZW1kWzFdOiBNb3VudGluZyBUZW1wb3JhcnkgRGlyZWN0b3J5ICgvdG1w
KS4uLgogICAgICAgICBNb3VudGluZyBUZW1wb3JhcnkgRGlyZWN0b3J5ICgvdG1wKS4uLgpbICAg
IDUuNTE4NjMyXSBzeXN0ZW1kWzFdOiBDb25kaXRpb24gY2hlY2sgcmVzdWx0ZWQgaW4gQ3JlYXRl
IGxpc3Qgb2Ygc3RhdGljIGRldmljZSBub2RlcyBmb3IgdGhlIGN1cnJlbnQga2VybmVsIGJlaW5n
IHNraXBwZWQuClsgICAgNS41MzQzOTddIHN5c3RlbWRbMV06IFN0YXJ0aW5nIFN0YXJ0IHBzcGxh
c2ggYm9vdCBzcGxhc2ggc2NyZWVuLi4uCiAgICAgICAgIFN0YXJ0aW5nIFN0YXJ0IHBzcGxhc2gg
Ym9vdCBzcGxhc2ggc2NyZWVuLi4uClsgICAgNS41Njc2NjJdIHN5c3RlbWRbMV06IFN0YXJ0ZWQg
SGFyZHdhcmUgUk5HIEVudHJvcHkgR2F0aGVyZXIgRGFlbW9uLgpbICBPSyAgXSBTdGFydGVkIEhh
cmR3YXJlIFJORyBFbnRyb3B5IEdhdGhlcmVyIERhZW1vbi4KWyAgICA1LjU5NTQzMV0gc3lzdGVt
ZFsxXTogU3RhcnRpbmcgUlBDIEJpbmQuLi4KICAgICAgICAgU3RhcnRpbmcgUlBDIEJpbmQuLi4K
WyAgICA1LjYxMzgxNl0gc3lzdGVtZFsxXTogQ29uZGl0aW9uIGNoZWNrIHJlc3VsdGVkIGluIEZp
bGUgU3lzdGVtIENoZWNrIG9uIFJvb3QgRGV2aWNlIGJlaW5nIHNraXBwZWQuClsgICAgNS42Mjk3
ODZdIHN5c3RlbWRbMV06IFN0YXJ0aW5nIEpvdXJuYWwgU2VydmljZS4uLgogICAgICAgICBTdGFy
dGluZyBKb3VybmFsIFNlcnZpY2UuLi4KWyAgICA1LjY3NDQzNV0gc3lzdGVtZFsxXTogU3RhcnRp
bmcgTG9hZCBLZXJuZWwgTW9kdWxlcy4uLgogICAgICAgICBTdGFydGluZyBMb2FkIEtlcm5lbCBN
b2R1bGVzLi4uClsgICAgNS43MTQ2MzldIHN5c3RlbWRbMV06IFN0YXJ0aW5nIFJlbW91bnQgUm9v
dCBhbmQgS2VybmVsIEZpbGUgU3lzdGVtcy4uLgogICAgICAgICBTdGFydGluZyBSZW1vdW50IFJv
b3QgYW5kIEtlcm5lbCBGaWxlIFN5c3RlbXMuLi4KWyAgICA1Ljc1NDQyNV0gc3lzdGVtZFsxXTog
U3RhcnRpbmcgdWRldiBDb2xkcGx1ZyBhbGwgRGV2aWNlcy4uLgogICAgICAgICBTdGFydGluZyB1
ZGV2IENvbGRwbHVnIGFsbCBEZXZpY2VzLi4uClsgICAgNS44MDEyMTRdIHN5c3RlbWRbMV06IFN0
YXJ0ZWQgUlBDIEJpbmQuClsgIE9LICBdIFN0YXJ0ZWQgUlBDIEJpbmQuClsgICAgNS44MjA2NDZd
IEVYVDQtZnMgKHNkYTEpOiByZS1tb3VudGVkLiBPcHRzOiAobnVsbCkKWyAgICA1LjgzMzA1MF0g
c3lzdGVtZFsxXTogTW91bnRlZCBIdWdlIFBhZ2VzIEZpbGUgU3lzdGVtLgpbICBPSyAgXSBNb3Vu
dGVkIEh1Z2UgUGFnZXMgRmlsZSBTeXN0ZW0uClsgICAgNS44NTI0MTddIHN5c3RlbWRbMV06IE1v
dW50ZWQgUE9TSVggTWVzc2FnZSBRdWV1ZSBGaWxlIFN5c3RlbS4KWyAgT0sgIF0gTW91bnRlZCBQ
T1NJWCBNZXNzYWdlIFF1ZXVlIEZpbGUgU3lzdGVtLgpbICAgIDUuODc0NjkzXSBzeXN0ZW1kWzFd
OiBTdGFydGVkIEpvdXJuYWwgU2VydmljZS4KWyAgT0sgIF0gU3RhcnRlZCBKb3VybmFsIFNlcnZp
Y2UuClsgIE9LICBdIE1vdW50ZWQgS2VybmVsIERlYnVnIEZpbGUgU3lzdGVtLgpbICBPSyAgXSBN
b3VudGVkIFRlbXBvcmFyeSBEaXJlY3RvcnkgKC90bXApLgpbRkFJTEVEXSBGYWlsZWQgdG8gc3Rh
cnQgU3RhcnQgcHNwbGFzaCBib290IHNwbGFzaCBzY3JlZW4uClNlZSAnc3lzdGVtY3RsIHN0YXR1
cyBwc3BsYXNoLXN0YXJ0LnNlcnZpY2UnIGZvciBkZXRhaWxzLgpbREVQRU5EXSBEZXBlbmRlbmN5
IGZhaWxlZCBmb3IgU3RhcuKApnByb2dyZXNzIGNvbW11bmljYXRpb24gaGVscGVyLgpbRkFJTEVE
XSBGYWlsZWQgdG8gc3RhcnQgTG9hZCBLZXJuZWwgTW9kdWxlcy4KU2VlICdzeXN0ZW1jdGwgc3Rh
dHVzIHN5c3RlbWQtbW9kdWxlcy1sb2FkLnNlcnZpY2UnIGZvciBkZXRhaWxzLgpbICBPSyAgXSBT
dGFydGVkIFJlbW91bnQgUm9vdCBhbmQgS2VybmVsIEZpbGUgU3lzdGVtcy4KICAgICAgICAgTW91
bnRpbmcgS2VybmVsIENvbmZpZ3VyYXRpb24gRmlsZSBTeXN0ZW0uLi4KICAgICAgICAgU3RhcnRp
bmcgRmx1c2ggSm91cm5hbCB0byBQZXJzaXN0ZW50IFN0b3JhZ2UuLi4KICAgICAgICAgU3RhcnRp
bmcgQXBwbHkgS2VybmVsIFZhcmlhYmxlcy4uLgpbICAgIDYuMTMyOTI4XSBzeXN0ZW1kLWpvdXJu
YWxkWzEzOV06IFJlY2VpdmVkIGNsaWVudCByZXF1ZXN0IHRvIGZsdXNoIHJ1bnRpbWUgam91cm5h
bC4KICAgICAgICAgU3RhcnRpbmcgQ3JlYXRlIFN0YXRpYyBEZXZpY2UgTm9kZXMgaW4gL2Rldi4u
LgpbICBPSyAgXSBNb3VudGVkIEtlcm5lbCBDb25maWd1cmF0aW9uIEZpbGUgU3lzdGVtLgpbICBP
SyAgXSBTdGFydGVkIEFwcGx5IEtlcm5lbCBWYXJpYWJsZXMuClsgIE9LICBdIFN0YXJ0ZWQgRmx1
c2ggSm91cm5hbCB0byBQZXJzaXN0ZW50IFN0b3JhZ2UuClsgIE9LICBdIFN0YXJ0ZWQgQ3JlYXRl
IFN0YXRpYyBEZXZpY2UgTm9kZXMgaW4gL2Rldi4KWyAgT0sgIF0gUmVhY2hlZCB0YXJnZXQgTG9j
YWwgRmlsZSBTeXN0ZW1zIChQcmUpLgogICAgICAgICBNb3VudGluZyAvdmFyL3ZvbGF0aWxlLi4u
CiAgICAgICAgIFN0YXJ0aW5nIHVkZXYgS2VybmVsIERldmljZSBNYW5hZ2VyLi4uClsgIE9LICBd
IE1vdW50ZWQgL3Zhci92b2xhdGlsZS4KICAgICAgICAgU3RhcnRpbmcgTG9hZC9TYXZlIFJhbmRv
bSBTZWVkLi4uClsgIE9LICBdIFJlYWNoZWQgdGFyZ2V0IExvY2FsIEZpbGUgU3lzdGVtcy4KICAg
ICAgICAgU3RhcnRpbmcgQ3JlYXRlIFZvbGF0aWxlIEZpbGVzIGFuZCBEaXJlY3Rvcmllcy4uLgpb
ICBPSyAgXSBTdGFydGVkIENyZWF0ZSBWb2xhdGlsZSBGaWxlcyBhbmQgRGlyZWN0b3JpZXMuCiAg
ICAgICAgIFN0YXJ0aW5nIE5ldHdvcmsgVGltZSBTeW5jaHJvbml6YXRpb24uLi4KICAgICAgICAg
U3RhcnRpbmcgVXBkYXRlIFVUTVAgYWJvdXQgU3lzdGVtIEJvb3QvU2h1dGRvd24uLi4KWyAgT0sg
IF0gU3RhcnRlZCB1ZGV2IEtlcm5lbCBEZXZpY2UgTWFuYWdlci4KWyAgT0sgIF0gU3RhcnRlZCB1
ZGV2IENvbGRwbHVnIGFsbCBEZXZpY2VzLgogICAgICAgICBTdGFydGluZyBOZXR3b3JrIFNlcnZp
Y2UuLi4KWyAgT0sgIF0gU3RhcnRlZCBVcGRhdGUgVVRNUCBhYm91dCBTeXN0ZW0gQm9vdC9TaHV0
ZG93bi4KWyAgT0sgIF0gU3RhcnRlZCBOZXR3b3JrIFRpbWUgU3luY2hyb25pemF0aW9uLgpbICBP
SyAgXSBTdGFydGVkIE5ldHdvcmsgU2VydmljZS4KWyAgT0sgIF0gUmVhY2hlZCB0YXJnZXQgU3lz
dGVtIEluaXRpYWxpemF0aW9uLgpbICBPSyAgXSBTdGFydGVkIERhaWx5IENsZWFudXAgb2YgVGVt
cG9yYXJ5IERpcmVjdG9yaWVzLgpbICBPSyAgXSBSZWFjaGVkIHRhcmdldCBTeXN0ZW0gVGltZSBT
ZXQuClsgIE9LICBdIFJlYWNoZWQgdGFyZ2V0IFN5c3RlbSBUaW1lIFN5bmNocm9uaXplZC4KWyAg
T0sgIF0gUmVhY2hlZCB0YXJnZXQgVGltZXJzLgpbICBPSyAgXSBMaXN0ZW5pbmcgb24gQXZhaGkg
bUROUy9ETlMtU0QgU3RhY2sgQWN0aXZhdGlvbiBTb2NrZXQuClsgIE9LICBdIExpc3RlbmluZyBv
biBELUJ1cyBTeXN0ZW0gTWVzc2FnZSBCdXMgU29ja2V0LgogICAgICAgICBTdGFydGluZyBzc2hk
LnNvY2tldC4KICAgICAgICAgU3RhcnRpbmcgTmV0d29yayBOYW1lIFJlc29sdXRpb24uLi4KWyAg
T0sgIF0gTGlzdGVuaW5nIG9uIHNzaGQuc29ja2V0LgpbICBPSyAgXSBSZWFjaGVkIHRhcmdldCBT
b2NrZXRzLgpbICBPSyAgXSBSZWFjaGVkIHRhcmdldCBCYXNpYyBTeXN0ZW0uClsgIE9LICBdIFN0
YXJ0ZWQgS2VybmVsIExvZ2dpbmcgU2VydmljZS4KWyAgT0sgIF0gU3RhcnRlZCBTeXN0ZW0gTG9n
Z2luZyBTZXJ2aWNlLgpbICBPSyAgXSBTdGFydGVkIEQtQnVzIFN5c3RlbSBNZXNzYWdlIEJ1cy4K
ICAgICAgICAgU3RhcnRpbmcgcm5nLXRvb2xzLnNlcnZpY2UuLi4KICAgICAgICAgU3RhcnRpbmcg
TG9naW4gU2VydmljZS4uLgpbICBPSyAgXSBTdGFydGVkIHJuZy10b29scy5zZXJ2aWNlLgogICAg
ICAgICBTdGFydGluZyB3ZXN0b24uc2VydmljZS4uLgpbICAgIDcuNTA5NjAzXSByYW5kb206IGNy
bmcgaW5pdCBkb25lClsgICAgNy41MTMwMzVdIHJhbmRvbTogNyB1cmFuZG9tIHdhcm5pbmcocykg
bWlzc2VkIGR1ZSB0byByYXRlbGltaXRpbmcKWyAgT0sgIF0gU3RhcnRlZCBMb2FkL1NhdmUgUmFu
ZG9tIFNlZWQuClsgIE9LICBdIFN0YXJ0ZWQgTmV0d29yayBOYW1lIFJlc29sdXRpb24uClsgIE9L
ICBdIFJlYWNoZWQgdGFyZ2V0IE5ldHdvcmsuClsgIE9LICBdIFJlYWNoZWQgdGFyZ2V0IEhvc3Qg
YW5kIE5ldHdvcmsgTmFtZSBMb29rdXBzLgogICAgICAgICBTdGFydGluZyBBdmFoaSBtRE5TL0RO
Uy1TRCBTdGFjay4uLgogICAgICAgICBTdGFydGluZyBQZXJtaXQgVXNlciBTZXNzaW9ucy4uLgpb
ICBPSyAgXSBTdGFydGVkIHdlc3Rvbi5zZXJ2aWNlLgpbICBPSyAgXSBTdGFydGVkIFBlcm1pdCBV
c2VyIFNlc3Npb25zLgpbICBPSyAgXSBTdGFydGVkIEF2YWhpIG1ETlMvRE5TLVNEIFN0YWNrLgpb
ICBPSyAgXSBTdGFydGVkIEdldHR5IG9uIHR0eTEuClsgIE9LICBdIFN0YXJ0ZWQgU2VyaWFsIEdl
dHR5IG9uIHR0eVNDMC4KWyAgT0sgIF0gUmVhY2hlZCB0YXJnZXQgTG9naW4gUHJvbXB0cy4KWyAg
T0sgIF0gU3RhcnRlZCBMb2dpbiBTZXJ2aWNlLgpbICBPSyAgXSBSZWFjaGVkIHRhcmdldCBNdWx0
aS1Vc2VyIFN5c3RlbS4KICAgICAgICAgU3RhcnRpbmcgVXBkYXRlIFVUTVAgYWJvdXQgU3lzdGVt
IFJ1bmxldmVsIENoYW5nZXMuLi4KWyAgT0sgIF0gU3RhcnRlZCBVcGRhdGUgVVRNUCBhYm91dCBT
eXN0ZW0gUnVubGV2ZWwgQ2hhbmdlcy4KWyAgIDEwLjQ2MTI2MF0gTWljcm9jaGlwIEtTWjkxMzEg
R2lnYWJpdCBQSFkgMTFjMjAwMDAuZXRoZXJuZXQtZmZmZmZmZmY6MDc6IGF0dGFjaGVkIFBIWSBk
cml2ZXIgW01pY3JvY2hpcCBLU1o5MTMxIEdpZ2FiaXQgUEhZXSAobWlpX2J1czpwaHlfYSkKWyAg
IDEwLjU2MTQ2NF0gTWljcm9jaGlwIEtTWjkxMzEgR2lnYWJpdCBQSFkgMTFjMzAwMDAuZXRoZXJu
ZXQtZmZmZmZmZmY6MDc6IGF0dGFjaGVkIFBIWSBkcml2ZXIgW01pY3JvY2hpcCBLU1o5MTMxIEdp
Z2FiaXQgUEhZXSAobWlpX2J1czpwaHlfYSkKClBva3kgKFlvY3RvIFByb2plY3QgUmVmZXJlbmNl
IERpc3RybykgMy4xLjUgc21hcmMtcnpnMmwgdHR5U0MwCgpCU1A6IFJaRzJML1JaRzJMLVNNQVJD
LUVWSy8xLjEKTFNJOiBSWkcyTApWZXJzaW9uOiAxLjEKc21hcmMtcnpnMmwgbG9naW46IApzbWFy
Yy1yemcybCBsb2dpbjogcm9vdApbICAgMjEuODkwMTAxXSBhdWRpdDogdHlwZT0xMDA2IGF1ZGl0
KDE2MDA1OTg2NTUuNTI4OjIpOiBwaWQ9MjAzIHVpZD0wIG9sZC1hdWlkPTQyOTQ5NjcyOTUgYXVp
ZD0wIHR0eT0obm9uZSkgb2xkLXNlcz00Mjk0OTY3Mjk1IHNlcz0xIHJlcz0xCgpeW1szNzsxNDNS
cm9vdEBzbWFyYy1yemcybDp+IyA7MTQzUgotc2g6IHN5bnRheCBlcnJvciBuZWFyIHVuZXhwZWN0
ZWQgdG9rZW4gYDsnCnJvb3RAc21hcmMtcnpnMmw6fiMgCnJvb3RAc21hcmMtcnpnMmw6fiMgCnJv
b3RAc21hcmMtcnpnMmw6fiMgbHMKY3B5LnNoICAgICAgICBoeXAuc2ggIGphaWxob3VzZS5rbyAg
cmVuZXNhcy1yOWEwN2cwNTRsMi5jZWxsCmdwaW9fa2V5cy5rbyAgaW5zdGFsICBsYXZhLXRlc3Rp
bmcKcm9vdEBzbWFyYy1yemcybDp+IyAKcm9vdEBzbWFyYy1yemcybDp+IyAKcm9vdEBzbWFyYy1y
emcybDp+IyAuL2NweS5zaCAKZnNjayBmcm9tIHV0aWwtbGludXggMi4zNS4xCmRvc2ZzY2sgMi4x
MSwgMTIgTWFyIDIwMDUsIEZBVDMyLCBMRk4KL2Rldi9tbWNibGsxcDI6IDExIGZpbGVzLCAyMDc3
NC8zODM1NyBjbHVzdGVycwpbICAgMjYuNDA4NDE2XSBGQVQtZnMgKG1tY2JsazFwMik6IFZvbHVt
ZSB3YXMgbm90IHByb3Blcmx5IHVubW91bnRlZC4gU29tZSBkYXRhIG1heSBiZSBjb3JydXB0LiBQ
bGVhc2UgcnVuIGZzY2suCnJvb3RAc21hcmMtcnpnMmw6fiMgCnJvb3RAc21hcmMtcnpnMmw6fiMg
CnJvb3RAc21hcmMtcnpnMmw6fiMgdW5hbWUgLXJhCkxpbnV4IHNtYXJjLXJ6ZzJsIDUuMTAuMTEy
LWNpcDYrICMxMyBTTVAgUFJFRU1QVCBGcmkgTWF5IDEzIDA3OjQwOjM0IEJTVCAyMDIyIGFhcmNo
NjQgR05VL0xpbnV4CnJvb3RAc21hcmMtcnpnMmw6fiMgCnJvb3RAc21hcmMtcnpnMmw6fiMgCnJv
b3RAc21hcmMtcnpnMmw6fiMgLi9jcHkuc2ggCnJvb3RAc21hcmMtcnpnMmw6fiMgLi9oeXAuc2gg
ClsgICAzMy45MjA1MDddIGphaWxob3VzZTogbG9hZGluZyBvdXQtb2YtdHJlZSBtb2R1bGUgdGFp
bnRzIGtlcm5lbC4KUmVhZGluZyBjb25maWd1cmF0aW9uIHNldDoKICBSb290IGNlbGw6ICAgICBS
ZW5lc2FzIFJaL1YyTCBTTUFSQyAocmVuZXNhcy1yOWEwN2cwNTRsMi5jZWxsKQpPdmVybGFwcGlu
ZyBtZW1vcnkgcmVnaW9ucyBpbnNpZGUgY2VsbDogTm9uZQpPdmVybGFwcGluZyBtZW1vcnkgcmVn
aW9ucyB3aXRoIGh5cGVydmlzb3I6IE5vbmUKTWlzc2luZyByZXNvdXJjZSBpbnRlcmNlcHRpb25z
IGZvciBhcmNoaXRlY3R1cmUgYXJtNjQ6IE5vbmUKWyAgIDM0Ljc0MTYzM10gb2Jjb2RlIEBhcm1f
ZGNhY2hlc19mbHVzaDogZDUzYjAwMjQKWyAgIDM0Ljc0MTYzOF0gb2Jjb2RlIEBhcm1fZGNhY2hl
c19mbHVzaDogZDUzYjAwMjQKWyAgIDM0Ljc0MTg0N10gQmFkIG1vZGUgaW4gU3luY2hyb25vdXMg
QWJvcnQgaGFuZGxlciBkZXRlY3RlZCBvbiBDUFUwLCBjb2RlIDB4NWEwMDAwMDAgLS0gSFZDIChB
QXJjaDY0KQpbICAgMzQuNzQxODUwXSBDUFU6IDAgUElEOiAwIENvbW06IHN3YXBwZXIvMCBUYWlu
dGVkOiBHICAgICAgICAgICBPICAgICAgNS4xMC4xMTItY2lwNisgIzEzClsgICAzNC43NDE4NTNd
IEhhcmR3YXJlIG5hbWU6IFJlbmVzYXMgU01BUkMgRVZLIGJhc2VkIG9uIHI5YTA3ZzA1NGwyIChE
VCkKWyAgIDM0Ljc0MTg1NV0gcHN0YXRlOiAyMDQwMDA4OSAobnpDdiBkYUlmICtQQU4gLVVBTyAt
VENPIEJUWVBFPS0tKQpbICAgMzQuNzQxODU3XSBwYyA6IDB4ZmZmZjgwMDAxMzAwNDg2OApbICAg
MzQuNzQxODU5XSBsciA6IDB4ZmZmZjgwMDAxMzAwNDg0YwpbICAgMzQuNzQxODYwXSBzcCA6IGZm
ZmY4MDAwMTE4Y2JlZDAKWyAgIDM0Ljc0MTg2Ml0geDI5OiBmZmZmODAwMDExOGNiZWQwIHgyODog
ZmZmZjgwMDAxMTYzMmY4MCAKWyAgIDM0Ljc0MTg2OV0geDI3OiBmZmZmODAwMDExNjMyZjgwIHgy
NjogZmZmZjgwMDAxMThjYzAwMCAKWyAgIDM0Ljc0MTg3M10geDI1OiBmZmZmODAwMDExOGM4MDAw
IHgyNDogZmZmZjgwMDAxMTYyYTM0NCAKWyAgIDM0Ljc0MTg3N10geDIzOiAwMDAwMDAwMDAwMDAw
MDAwIHgyMjogMDAwMDAwMDAwMDAwMDAwMCAKWyAgIDM0Ljc0MTg4MV0geDIxOiBmZmZmODAwMDEz
MDAwMDAwIHgyMDogZmZmZjgwMDAxMzAwNDgwMCAKWyAgIDM0Ljc0MTg4NV0geDE5OiBmZmZmODAw
MDA4YzE3MDAwIHgxODogMDAwMDAwMDAwMDAwMDAwMSAKWyAgIDM0Ljc0MTg4OV0geDE3OiBmZmZm
ODAwMDA4YzExODI4IHgxNjogMDAwMDAwMDAwMDAwMDAwMCAKWyAgIDM0Ljc0MTg5M10geDE1OiAw
MDAwZmZmZmMwMDRiODAwIHgxNDogMDAwMDAwMDAxMDA0YjgwMCAKWyAgIDM0Ljc0MTg5N10geDEz
OiAwMDAwZmZmZmMwMjAwMDAwIHgxMjogMDAwMDAwMDBiNmYwMDAwMCAKWyAgIDM0Ljc0MTkwMF0g
eDExOiBmZmZmMDAwMGY2ZDAwMDAwIHgxMDogZmZmZjgwMDAxMThjYmVkMCAKWyAgIDM0Ljc0MTkw
NF0geDkgOiBmZmZmODAwMDExOGNiZWQwIHg4IDogMzA2MjMzMzU2NDIwM2E2OCAKWyAgIDM0Ljc0
MTkwOF0geDcgOiAwMDAwMDAwMDAwMDAwMDAwIHg2IDogZmZmZjAwMDA3ZmM2Y2FhMCAKWyAgIDM0
Ljc0MTkxMl0geDUgOiBmZmZmMDAwMDdmYzZjYWEwIHg0IDogMDAwMDAwMDAwMDAwMDAzZiAKWyAg
IDM0Ljc0MTkxNl0geDMgOiAwMDAwMDAwMDAwMDAwMDQwIHgyIDogMDAwMDAwMDAwMDAwMDAwMiAK
WyAgIDM0Ljc0MTkyMF0geDEgOiAwMDAwMDAwMGI2ZjA1MDAwIHgwIDogMDAwMDAwMDAwMDAwMDAw
MCAKWyAgIDM0Ljc0MTkyNF0gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IGJhZCBtb2RlClsg
ICAzNC43NDE5MjddIENQVTogMCBQSUQ6IDAgQ29tbTogc3dhcHBlci8wIFRhaW50ZWQ6IEcgICAg
ICAgICAgIE8gICAgICA1LjEwLjExMi1jaXA2KyAjMTMKWyAgIDM0Ljc0MTkyOV0gSGFyZHdhcmUg
bmFtZTogUmVuZXNhcyBTTUFSQyBFVksgYmFzZWQgb24gcjlhMDdnMDU0bDIgKERUKQpbICAgMzQu
NzQxOTMwXSBDYWxsIHRyYWNlOgpbICAgMzQuNzQxOTMyXSAgZHVtcF9iYWNrdHJhY2UrMHgwLzB4
MWMwClsgICAzNC43NDE5MzRdICBzaG93X3N0YWNrKzB4MTgvMHg2OApbICAgMzQuNzQxOTM1XSAg
ZHVtcF9zdGFjaysweGQ4LzB4MTM0ClsgICAzNC43NDE5MzddICBwYW5pYysweDE4MC8weDM5OApb
ICAgMzQuNzQxOTM5XSAgYmFkX21vZGUrMHg4Yy8weDkwClsgICAzNC43NDE5NDBdICBlbDFfaW52
KzB4M2MvMHg2MApbICAgMzQuNzQxOTQyXSAgZWwxX3N5bmNfaGFuZGxlcisweGFjLzB4ZTAKWyAg
IDM0Ljc0MTk0M10gIGVsMV9zeW5jKzB4ODQvMHgxNDAKWyAgIDM0Ljc0MTk0NV0gIDB4ZmZmZjgw
MDAxMzAwNDg2OApbICAgMzQuNzQxOTQ3XSAgZmx1c2hfc21wX2NhbGxfZnVuY3Rpb25fcXVldWUr
MHhmOC8weDI2OApbICAgMzQuNzQxOTQ5XSAgZ2VuZXJpY19zbXBfY2FsbF9mdW5jdGlvbl9zaW5n
bGVfaW50ZXJydXB0KzB4MTQvMHgyMApbICAgMzQuNzQxOTUwXSAgaXBpX2hhbmRsZXIrMHg4Yy8w
eDE1OApbICAgMzQuNzQxOTUyXSAgaGFuZGxlX3BlcmNwdV9kZXZpZF9mYXN0ZW9pX2lwaSsweDc0
LzB4ODgKWyAgIDM0Ljc0MTk1M10gIGdlbmVyaWNfaGFuZGxlX2lycSsweDMwLzB4NDgKWyAgIDM0
Ljc0MTk1NV0gIF9faGFuZGxlX2RvbWFpbl9pcnErMHg2MC8weGI4ClsgICAzNC43NDE5NTddICBn
aWNfaGFuZGxlX2lycSsweDU4LzB4MTI4ClsgICAzNC43NDE5NThdICBlbDFfaXJxKzB4YzgvMHgx
ODAKWyAgIDM0Ljc0MTk2MF0gIGFyY2hfY3B1X2lkbGUrMHgxOC8weDI4ClsgICAzNC43NDE5NjFd
ICBkZWZhdWx0X2lkbGVfY2FsbCsweDI0LzB4NWMKWyAgIDM0Ljc0MTk2M10gIGRvX2lkbGUrMHgx
ZWMvMHgyODgKWyAgIDM0Ljc0MTk2NF0gIGNwdV9zdGFydHVwX2VudHJ5KzB4MjQvMHg2OApbICAg
MzQuNzQxOTY2XSAgcmVzdF9pbml0KzB4ZDgvMHhlOApbICAgMzQuNzQxOTY3XSAgYXJjaF9jYWxs
X3Jlc3RfaW5pdCsweDEwLzB4MWMKWyAgIDM0Ljc0MTk2OV0gIHN0YXJ0X2tlcm5lbCsweDRiMC8w
eDRlOApbICAgMzQuOTgxMDg2XSBTTVA6IHN0b3BwaW5nIHNlY29uZGFyeSBDUFVzClsgICAzNC45
ODEwODhdIEtlcm5lbCBPZmZzZXQ6IGRpc2FibGVkClsgICAzNC45ODEwOTBdIENQVSBmZWF0dXJl
czogMHgwMDQwMDI2LDJhMDBhYTM4ClsgICAzNC45ODEwOTFdIE1lbW9yeSBMaW1pdDogbm9uZQpb
ICAgMzQuOTgxMDk0XSBCYWQgbW9kZSBpbiBTeW5jaHJvbm91cyBBYm9ydCBoYW5kbGVyIGRldGVj
dGVkIG9uIENQVTEsIGNvZGUgMHg1YTAwMDAwMCAtLSBIVkMgKEFBcmNoNjQpClsgICAzNC45ODEw
OTddIENQVTogMSBQSUQ6IDIzMiBDb21tOiBqYWlsaG91c2UgVGFpbnRlZDogRyAgICAgICAgICAg
TyAgICAgIDUuMTAuMTEyLWNpcDYrICMxMwpbICAgMzQuOTgxMDk5XSBIYXJkd2FyZSBuYW1lOiBS
ZW5lc2FzIFNNQVJDIEVWSyBiYXNlZCBvbiByOWEwN2cwNTRsMiAoRFQpClsgICAzNC45ODExMDFd
IHBzdGF0ZTogMjA0MDAwODkgKG56Q3YgZGFJZiArUEFOIC1VQU8gLVRDTyBCVFlQRT0tLSkKWyAg
IDM0Ljk4MTEwM10gcGMgOiAweGZmZmY4MDAwMTMwMDQ4NjgKWyAgIDM0Ljk4MTEwNF0gbHIgOiAw
eGZmZmY4MDAwMTMwMDQ4NGMKWyAgIDM0Ljk4MTEwNl0gc3AgOiBmZmZmODAwMDExZjkzYjMwClsg
ICAzNC45ODExMDddIHgyOTogZmZmZjgwMDAxMWY5M2IzMCB4Mjg6IDAwMDAwMDAwMDAwMDAwMDAg
ClsgICAzNC45ODExMTFdIHgyNzogZmZmZjgwMDAxMzAwMDAwMCB4MjY6IGZmZmY4MDAwMDhjMTcw
MDAgClsgICAzNC45ODExMTVdIHgyNTogZmZmZjgwMDAwOGMxNzAwMCB4MjQ6IDAwMDAwMDAwMDAw
MDAwMDIgClsgICAzNC45ODExMTldIHgyMzogMDAwMDAwMDAwMDAwMDg3MCB4MjI6IDAwMDAwMDAw
MDAwMDAwMDEgClsgICAzNC45ODExMjNdIHgyMTogZmZmZjgwMDAxMzAwMDAwMCB4MjA6IGZmZmY4
MDAwMTMwMDQ4MDAgClsgICAzNC45ODExMjddIHgxOTogZmZmZjgwMDAwOGMxNzAwMCB4MTg6IDAw
MDAwMDAwMDAwMDAwMDEgClsgICAzNC45ODExMzFdIHgxNzogZmZmZjgwMDAwOGMxMTgyOCB4MTY6
IDAwMDAwMDAwMDAwMDAwMDEgClsgICAzNC45ODExMzVdIHgxNTogMDAwMGZmZmZjMDA0YjgwMCB4
MTQ6IDAwMDAwMDAwMTAwNGI4MDAgClsgICAzNC45ODExMzldIHgxMzogMDAwMGZmZmZjMDIwMDAw
MCB4MTI6IDAwMDAwMDAwYjZmMDAwMDAgClsgICAzNC45ODExNDNdIHgxMTogZmZmZjAwMDBmNmQw
MDAwMCB4MTA6IGZmZmY4MDAwMTE2OTk2YzggClsgICAzNC45ODExNDddIHg5IDogZmZmZjgwMDAx
MTY5OTcyMCB4OCA6IDAwMDAwMDAwMDAwMTdmZTggClsgICAzNC45ODExNTFdIHg3IDogMDAwMDAw
MDAwMDAwMDAwMCB4NiA6IGZmZmYwMDAwN2ZjODJhYTAgClsgICAzNC45ODExNTVdIHg1IDogZmZm
ZjAwMDA3ZmM4MmFhMCB4NCA6IDAwMDAwMDAwMDAwMDAwM2YgClsgICAzNC45ODExNTldIHgzIDog
MDAwMDAwMDAwMDAwMDA0MCB4MiA6IDAwMDAwMDAwMDAwMDAwMDIgClsgICAzNC45ODExNjNdIHgx
IDogMDAwMDAwMDBiNmYwNTAwMCB4MCA6IDAwMDAwMDAwMDAwMDAwMDAgCg==
--00000000000000027705dee6393a--
