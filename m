Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBB6ED7GJQMGQER2X2FBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43c.google.com (mail-pf1-x43c.google.com [IPv6:2607:f8b0:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BB452610A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 13:33:14 +0200 (CEST)
Received: by mail-pf1-x43c.google.com with SMTP id u25-20020aa78499000000b0050d328e2f6bsf3973977pfn.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 04:33:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652441593; cv=pass;
        d=google.com; s=arc-20160816;
        b=mI2320yvF5AuGLlkbeD5sFhZGc/j9VJHldp1Tr97NMHZjbM7oKYCx4/aw7gel4Lw5v
         n+MgddKzg4Af/tjDBiSWBzRu98xPYlSBMxum2f4FoMoOxz76dPSVN9i441ht1GmDGGDo
         viB5A2l7aAOerVIWL482LI0haJkZ05nDYoEhvqhF8A+q9qQza4Bckh/5NStjWWKxOx9H
         gqiy0527ntH2TkLzoBLL/j2GmEsyaWiigXPuOaWo5pnDJHXkoZ2PiOH67sS5YHzazVyY
         4QOkPfZ6x1h1gu1W6b1HeOx/TSn1z7BiSXFkVMp7+DyzwOnVSuVPwyCP1W6ZXDaPWWZA
         V/TA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=8xTnlcKjIq2SBtwvZXSoxjs28Uci6VnYA9tGpu6U4Cg=;
        b=sIsTI3vhZGtqx41KvbDYAjx7Hx1CpatS/6fUmbKRX2Ha2E5A1jhPFg8/ECQiuolvO+
         bro4oXnbK+aA1CQCam4kS+wzckRutkm6iNmhQRuc6bO3S9nRbeLd5LrPVRIiXkJYozU4
         hftJOOD1PqSPsLiLJIfQEP3/tVHEMSJ4VRV9+uRL9vsvsGF2Qbq4nOhv8F0gHMZ4RhKp
         8MHCefxns/T62ePmnYMytvXT1qTV1MkE7xSOnqxRcfLVZ5h7jPzOUq785rkxas8tj3t4
         lnV34qeqAbilrIpBXRYHOLyiU1+ggGx7Px2iQl1KEUBO81y4oQKajinO0PFaHUVDYfkv
         F46Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=lWJ3TTSk;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::112c as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8xTnlcKjIq2SBtwvZXSoxjs28Uci6VnYA9tGpu6U4Cg=;
        b=RALLJZX5hb77eIMnJl5kmmlQKCy1Z3Oc0rvfJnBa3O8ldZXisCqejCrOQZzNGlYDcg
         W6ZgG61LkpC2ghO3YRYSwnI64Q6YfLMvoevkSfjcs5Fk8GzLTehvRqFKLu6/89S2Lffh
         O/XdKxxmPfWl7adxb+aKGEna3ZXiLp+HfplZ9ruAVvTNe112vfc3gwFaz0CSrrwcswWp
         LeVnCuFbIT1TyKsyqYOrZf9+1xHlbuS6pqP+Q4Yx0tuBcY1c7ywwRBABuMZPVt8nKiu2
         H9jdH1OsJllNLXfedsyycpHCyPpNWgDSOb7VaOeI3OgKIOLydX18MDepZmsCPkphzVjO
         Om8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8xTnlcKjIq2SBtwvZXSoxjs28Uci6VnYA9tGpu6U4Cg=;
        b=mdHA17PHgGEkbyupEJwGha10I2r4cj+OIVRl1S1HOTkTI6NRvY9ejwFNOiGxt9raLp
         hXrwr3SVZ1MFO4hSDUUYjhWISomYrR99CEVcu5CSNWy+E0LmDI1eadVO8VwRljBJvznW
         M/egstgRaDn27Vs6c/Tn5BUwhKPujrwpkm5r0TyjRLf2JXG0fa5A3FN8vSbeJynzfGWt
         Mslyg941VcshadSZUhJST9O+Qh7+T0nRNpqlyuXvJS+8HMv55uO11UbC564iAc0HOaEh
         U8cCX5YbpMemDbRZ7+Y1ktbRgLJuiPQ/JLx/SyNHSS3ae7sahHSYfXOVmF3t23ysLHjU
         zMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8xTnlcKjIq2SBtwvZXSoxjs28Uci6VnYA9tGpu6U4Cg=;
        b=v1LWP41jhK5PnZnIRuwyJZyUbCs5WFHL8pkGRlpP1bY7yUv7BIfvZztt/Lv8PzhQ0E
         dTZ1lTIvkmx/iWHDd63IT0ZOd+CWXLZVhigsKdWKs8el2aJp8kmmIZ1dXFgjYtpCyVzN
         tnw68yQm7PjWJiHF3ziluBMxMfN3d2MvT6EHwmiDybJa3z83Vw+spC6LOIYN6v4npxYz
         XEK+n/cYqsavhpDH3TYPBcC4YvrK/gh8ZeCzNVsR8jvGlTRwQP2hrlgCafj1Vv9xLOg/
         he8sh4MrQO3nv/jY3NzqDXpS2xNY3mqBchzLNYE5nf70/aZLVDNcQL0Pj5ptC00MhTlo
         RNVw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531EnGMc836WJcYVZpgcLhK+VYIXRRiOZDws5SLFZscpiNtbyVpw
	gs8vYsKXo0o5uiT7o8qZArY=
X-Google-Smtp-Source: ABdhPJx2eX6PwUPgBb5ljHTBc1X+Q/KaAbQkuxkRN1o9YtKDzpspmdZAsowCNdQBx7dbZs1x0POReQ==
X-Received: by 2002:a63:90c3:0:b0:3ab:24df:fa19 with SMTP id a186-20020a6390c3000000b003ab24dffa19mr3660004pge.608.1652441593208;
        Fri, 13 May 2022 04:33:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:eb83:b0:15e:c891:d419 with SMTP id
 q3-20020a170902eb8300b0015ec891d419ls2959280plg.4.gmail; Fri, 13 May 2022
 04:33:12 -0700 (PDT)
X-Received: by 2002:a17:90a:4f0b:b0:1d9:acbd:1204 with SMTP id p11-20020a17090a4f0b00b001d9acbd1204mr15821746pjh.201.1652441592140;
        Fri, 13 May 2022 04:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652441592; cv=none;
        d=google.com; s=arc-20160816;
        b=GgmGNCpu1p1wrXCbootFIMyzf4UzyUvyra8mHIpWDPw7YbcH9R9dYvKSr2ctlKtsPi
         WI8ylE3vgeUOgMBMrUozDItC+1IvcKerQe3X/1x/41kMS6uJLSRgwQ5Y2KyFcT1rJmfN
         wQPGbelgm6zyCuZ4Egrin0e1rzKSNUvKw7KvzOXmKMYMOqLNFJAr7+7AfMc9dXjwf+La
         2cjCkPJvueElEzMWUNAO1ysj1fV1NuFsB9SQWehwpNFJJy2vqHBMN5oJ/0r2UiXOuup3
         RurZYSVqWOGKmKqwUwZYhgkImpEhaCHf+x3rL05d1Igh7xtzmfwvolLCsJvyWngXCT+c
         /MLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wsgkAZRE3LbNm5mF69g9W0W1jK0YTzfXTTC7r6pdoA4=;
        b=eL7cmJBQu4FPQRiLoX353FRqGb1wRLEYvSHCQbV6BLRu+SavEePfSsazikxRBhdxIf
         Iz2YGn8kdxmknZYCppoF5LlPYsmU13xvqQ/5wcLDlCVVr83Tu5tdXFNTAHR+Q52k13Bv
         9PCCNnx4UzRVA7ZEELnT1w30TkLY9B8Ur8M9SETqgz/hGL7oPXUoGGY9hfMx6bWYcI6/
         9CJtPiBoPdwqLOkhwgfgM1nJWvEftlA8bq+5GW7I26vde9ymJZz4o8LkhnLFHoHld4ou
         ZLi23Q/vmHhyHpXv8zXSsEEsOuQy1pRE5h24akKFkfQVT9+zhFniTJEV1NRWKY7DVkF+
         csGQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=lWJ3TTSk;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::112c as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com. [2607:f8b0:4864:20::112c])
        by gmr-mx.google.com with ESMTPS id v21-20020a17090a899500b001c69d267568si324285pjn.0.2022.05.13.04.33.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 04:33:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::112c as permitted sender) client-ip=2607:f8b0:4864:20::112c;
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-2ebf4b91212so86953587b3.8
        for <jailhouse-dev@googlegroups.com>; Fri, 13 May 2022 04:33:12 -0700 (PDT)
X-Received: by 2002:a81:b651:0:b0:2ef:6d8c:a6f4 with SMTP id
 h17-20020a81b651000000b002ef6d8ca6f4mr5221908ywk.222.1652441591216; Fri, 13
 May 2022 04:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com> <d22051fb-2c80-2d88-af8c-5f1ccdb69197@siemens.com>
 <CA+V-a8sQAYXHykiGqn8DD8=cL4fv4NcszvgFgza2gE3_MCyRmQ@mail.gmail.com>
 <37be2e7c-c1f4-c5b6-f200-8d1cc48e0ee5@siemens.com> <CA+V-a8t-wvud8MF0oyAsHBSUuVQrrkqSr9RWE2tQLCoOzuQikw@mail.gmail.com>
 <fe2e7e92-8530-9913-307f-85437412fd81@siemens.com> <CA+V-a8sgPXsMmsKYwE6etP=JG8Ef83Qz4RHoWAZKeHdVHhk_Pw@mail.gmail.com>
 <5ea8c025-13f2-4754-479a-21395de9306d@siemens.com> <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
 <2fe4d998-1784-53c5-a653-994882ec7fb6@siemens.com>
In-Reply-To: <2fe4d998-1784-53c5-a653-994882ec7fb6@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 13 May 2022 12:32:44 +0100
Message-ID: <CA+V-a8s9Ta0fPD6V=yGYDhvKngiMrCghi07Y_4XTbDPk9HeHfw@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/mixed; boundary="0000000000000eeb0205dee30ae9"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=lWJ3TTSk;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::112c as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

--0000000000000eeb0205dee30ae9
Content-Type: text/plain; charset="UTF-8"

On Fri, May 13, 2022 at 11:51 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 12.05.22 13:37, Lad, Prabhakar wrote:
> > Hi Jan,
> >
> > On Thu, May 12, 2022 at 12:16 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>
> >> On 12.05.22 13:06, Lad, Prabhakar wrote:
> >>> Hi Jan,
> >>>
> >>> On Thu, May 12, 2022 at 11:24 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>
> >>>> On 12.05.22 09:01, Lad, Prabhakar wrote:
> >>>>> Hi Jan,
> >>>>>
> >>>>> On Thu, May 12, 2022 at 6:45 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>>>
> >>>>>> On 11.05.22 19:09, Lad, Prabhakar wrote:
> >>>>>>> Hi Jan,
> >>>>>>>
> >>>>>>> On Wed, May 11, 2022 at 4:11 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>>>>>
> >>>>>>>> On 11.05.22 13:20, Prabhakar Lad wrote:
> >>>>>>>>> To add further more details:
> >>>>>>>>>
> >>>>>>>>> I am using jailhouse-enabling/5.10 Linux branch [0] with -next branch
> >>>>>>>>> for jailhouse [1].
> >>>>>>>>>
> >>>>>>>>> I added some debug prints and I see the panic is caused when entry()
> >>>>>>>>> function is called (in enter_hypervisor). The entry function lands into
> >>>>>>>>> assembly code (entry.S). I dont have a JTAG to see which exact
> >>>>>>>>> instruction is causing this issue.
> >>>>>>>>
> >>>>>>>> So, already the first instruction in the loaded hypervisor binary is not
> >>>>>>>> executable? That would explain why we see no hypervisor output at all.
> >>>>>>>>
> >>>>>>> To clarify when the hypervisor is loaded the output will be via
> >>>>>>> debug_console specified in the root cell config?
> >>>>>>>
> >>>>>>
> >>>>>> Correct - if you reach entry() in setup.c.
> >>>>>>
> >>>>>>>> Was that memory region properly reserved from Linux (via DTB carve-out
> >>>>>>>> e.g.)?
> >>>>>>>>
> >>>>>>> Yes I have the below memory reserved in my dts:
> >>>>>>>
> >>>>>>>     memory@48000000 {
> >>>>>>>         device_type = "memory";
> >>>>>>>         /* first 128MB is reserved for secure area. */
> >>>>>>>         reg = <0x0 0x48000000 0x0 0x78000000>;
> >>>>>>>     };
> >>>>>>>
> >>>>>>>     reserved-memory {
> >>>>>>>         #address-cells = <2>;
> >>>>>>>         #size-cells = <2>;
> >>>>>>>         ranges;
> >>>>>>>
> >>>>>>>         jh_inmate@a7f00000 {
> >>>>>>>             status = "okay";
> >>>>>>>             no-map;
> >>>>>>>             reg = <0x00 0xa7f00000 0x00 0xf000000>;
> >>>>>>>         };
> >>>>>>>
> >>>>>>>         jailhouse: jailhouse@b6f00000 {
> >>>>>>>             status = "okay";
> >>>>>>>             reg = <0x0 0xb6f00000 0x0 0x1000000>;
> >>>>>>>             no-map;
> >>>>>>>         };
> >>>>>>>     };
> >>>>>>>
> >>>>>>> Linux does report the hole in RAM:
> >>>>>>>
> >>>>>>> root@smarc-rzg2l:~# cat /proc/iomem  |  grep RAM
> >>>>>>> 48000000-a7efffff : System RAM
> >>>>>>> b7f00000-bfffffff : System RAM
> >>>>>>>
> >>>>>>> And below is my root cell config related to hypervisor memory:
> >>>>>>>
> >>>>>>>         .hypervisor_memory = {
> >>>>>>>             .phys_start = 0xb6f00000,
> >>>>>>>             .size =       0x1000000,
> >>>>>>>         },
> >>>>>>>
> >>>>>>> Is there anything obvious I have missed above?
> >>>>>>>
> >>>>>>
> >>>>>> Nothing obvious to me so far.
> >>>>>>
> >>>>>> So, is this really the first instruction in
> >>>>>> hypervisor/arch/arm64/entry.S, arch_entry, that triggers the undefinstr?
> >>>>>> Check the reported address by Linux against the disassembly of the
> >>>>>> hypervisor. You could also play with adding 'ret' as first instruction,
> >>>>>> to check if that returns without a crash.
> >>>>>>
> >>>>> I did play around with ret, below is my observation:
> >>>>>
> >>>>> Up until line 98 [0] just before calling arm_dcaches_flush adding ret
> >>>>> returned without a crash. Adding a ret at line 99 [1] ie after
> >>>>> arm_dcaches_flush it never returned.
> >>>>>
> >>>>> So I continued with adding ret in  arm_dcaches_flush, I added ret as a
> >>>>> first statement in arm_dcaches_flush and was able to see the panic!
> >>>>
> >>>> Which Jailhouse revision are you building? Already disassembled
> >>>> hypervisor.o around arch_entry and arm_dcaches_flush? This is what I
> >>>> have here for next:
> >>>>
> >>> I'm using the next branch too.
> >>>
> >>>> 0000ffffc0203efc <arm_dcaches_flush>:
> >>>>     ffffc0203efc:       d53b0024        mrs     x4, ctr_el0
> >>>>     ffffc0203f00:       d3504c84        ubfx    x4, x4, #16, #4
> >>>>     ...
> >>>>
> >>>> 0000ffffc0204800 <arch_entry>:
> >>>>     ffffc0204800:       aa0003f0        mov     x16, x0
> >>>>     ffffc0204804:       aa1e03f1        mov     x17, x30
> >>>>     ...
> >>>>     ffffc0204844:       d2800042        mov     x2, #0x2                        // #2
> >>>>     ffffc0204848:       97fffdad        bl      ffffc0203efc <arm_dcaches_flush>
> >>>>
> >>>> You could check if there is such a relative call in your case as well.
> >>> yes it does exist, below is the snippet:
> >>>
> >>> 0000ffffc0204000 <arch_entry>:
> >>>     ffffc0204000:    aa0003f0     mov    x16, x0
> >>>     ffffc0204004:    aa1e03f1     mov    x17, x30
> >>>     ffffc0204008:    10fdffc0     adr    x0, ffffc0200000 <hypervisor_header>
> >>>     ffffc020400c:    f9402412     ldr    x18, [x0, #72]
> >>>     ffffc0204010:    5800fd0f     ldr    x15, ffffc0205fb0 <sdei_handler+0x2c>
> >>>     ffffc0204014:    900000e1     adrp    x1, ffffc0220000 <__page_pool>
> >>>     ffffc0204018:    79406002     ldrh    w2, [x0, #48]
> >>>     ffffc020401c:    d2880003     mov    x3, #0x4000
> >>>  // #16384
> >>>     ffffc0204020:    9b030441     madd    x1, x2, x3, x1
> >>>     ffffc0204024:    f842c02e     ldur    x14, [x1, #44]
> >>>     ffffc0204028:    5800fc8d     ldr    x13, ffffc0205fb8 <sdei_handler+0x34>
> >>>     ffffc020402c:    f840c02c     ldur    x12, [x1, #12]
> >>>     ffffc0204030:    cb0d018b     sub    x11, x12, x13
> >>>     ffffc0204034:    924051c1     and    x1, x14, #0x1fffff
> >>>     ffffc0204038:    8b0101ef     add    x15, x15, x1
> >>>     ffffc020403c:    f9001c0f     str    x15, [x0, #56]
> >>>     ffffc0204040:    f9400401     ldr    x1, [x0, #8]
> >>>     ffffc0204044:    d2800042     mov    x2, #0x2                       // #2
> >>>     ffffc0204048:    97ffff6c     bl    ffffc0203df8 <arm_dcaches_flush>
> >>>     ffffc020404c:    5800fba1     ldr    x1, ffffc0205fc0 <sdei_handler+0x3c>
> >>>     ffffc0204050:    8b0b0021     add    x1, x1, x11
> >>>     ffffc0204054:    d2800000     mov    x0, #0x0                       // #0
> >>>     ffffc0204058:    f100025f     cmp    x18, #0x0
> >>>     ffffc020405c:    54000041     b.ne    ffffc0204064
> >>> <arch_entry+0x64>  // b.any
> >>>     ffffc0204060:    d2800020     mov    x0, #0x1                       // #1
> >>>     ffffc0204064:    d4000002     hvc    #0x0
> >>>     ffffc0204068:    d4000002     hvc    #0x0
> >>>     ffffc020406c:    14000000     b    ffffc020406c <arch_entry+0x6c>
> >>>
> >>>> Then you could check, before jumping into arch_entry from the
> >>>> hypervisor, that the opcode at the actual arm_dcaches_flush address is
> >>>> as expected. But maybe already the building injects an issue here.
> >>>>
> >>> Any pointers on how I could do that?
> >>>
> >>
> >> arm_dcaches_flush is loaded at arch_entry (header->entry +
> >> hypervisor_mem) - 0x208. Read the u32 at that address and check if it is
> >> what is in your hypervisor.o (likely also d53b0024).
> >>
> >> If that is the case, not the jump but that "mrs     x4, ctr_el0" may
> >> actually be the problem. Check out hypervisor/arch/arm64/caches.S and
> >> see if that code, specifically dcache_line_size, causes trouble outside
> >> of Jailhouse as well, maybe as inline assembly in the driver module.
> >>
> >
> > With the below ret added, I get "JAILHOUSE_ENABLE: Success"
> >
> > diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> > index a9cabf7f..4e98b292 100644
> > --- a/hypervisor/arch/arm64/entry.S
> > +++ b/hypervisor/arch/arm64/entry.S
> > @@ -96,6 +96,7 @@ arch_entry:
> >          */
> >         ldr     x1, [x0, #HEADER_CORE_SIZE]
> >         mov     x2, DCACHE_CLEAN_AND_INVALIDATE_ASM
> > +       ret
> >         bl      arm_dcaches_flush
> >
> >         /* install bootstrap_vectors */
> >
> > Now when I undo the above and do the below, Im seeing a panic:
> >
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
> >
> > Issue is seen even without dcache_line_size being called. Does that
> > mean we are not landing in arm_dcaches_flush?
> >
>
> Wait! This last "ret" will make you go back to arch_entry only, not to
> the caller of arch_entry. Furthermore, x30/lr is after "bl
> arm_dcaches_flush" no longer pointing to the caller of arch_entry. That
> value is saved into x17.
>
> Could it be that arm_dcaches_flush was a red herring? Maybe we are
> actually crashing on hvc in arch_entry, and that because of Linux not
> starting in HVC mode, thus no hypervisor take-over stub being installed.
>
> Could you share the boot log of the kernel?
>
Attached is the complete log.

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8s9Ta0fPD6V%3DyGYDhvKngiMrCghi07Y_4XTbDPk9HeHfw%40mail.gmail.com.

--0000000000000eeb0205dee30ae9
Content-Type: text/plain; charset="UTF-8"; name="jailhouselog.txt"
Content-Disposition: attachment; filename="jailhouselog.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_l34cxgo80>
X-Attachment-Id: f_l34cxgo80

Tk9USUNFOiAgQkwyOiB2Mi42KHJlbGVhc2UpOjljYmZiNTJiNApOT1RJQ0U6ICBCTDI6IEJ1aWx0
IDogMTE6NDQ6NTUsIE1heSAgNSAyMDIyCk5PVElDRTogIEJMMjogQm9vdGluZyBCTDMxCk5PVElD
RTogIEJMMzE6IHYyLjYocmVsZWFzZSk6OWNiZmI1MmI0Ck5PVElDRTogIEJMMzE6IEJ1aWx0IDog
MTE6NDQ6NTUsIE1heSAgNSAyMDIyCgoKVS1Cb290IDIwMjEuMTAtZzkwZWRhZDZlMDAgKE1heSAw
NSAyMDIyIC0gMTE6NDU6MDAgKzAxMDApCgpDUFU6ICAgUmVuZXNhcyBFbGVjdHJvbmljcyBLIHJl
diAxNi4xNQpNb2RlbDogc21hcmMtcnp2MmwKRFJBTTogIDEuOSBHaUIKTU1DOiAgIHNkQDExYzAw
MDAwOiAwLCBzZEAxMWMxMDAwMDogMQpMb2FkaW5nIEVudmlyb25tZW50IGZyb20gTU1DLi4uIE9L
CkluOiAgICBzZXJpYWxAMTAwNGI4MDAKT3V0OiAgIHNlcmlhbEAxMDA0YjgwMApFcnI6ICAgc2Vy
aWFsQDEwMDRiODAwCk5ldDogICAKRXJyb3I6IGV0aGVybmV0QDExYzIwMDAwIGFkZHJlc3Mgbm90
IHNldC4KTm8gZXRoZXJuZXQgZm91bmQuCgpIaXQgYW55IGtleSB0byBzdG9wIGF1dG9ib290OiAg
MCAKOTMyNjg2MCBieXRlcyByZWFkIGluIDU4MSBtcyAoMTUuMyBNaUIvcykKMjM5MDcgYnl0ZXMg
cmVhZCBpbiAzIG1zICg3LjYgTWlCL3MpClVuY29tcHJlc3NlZCBzaXplOiAyNTQwODAwMCA9IDB4
MTgzQjIwMApNb3ZpbmcgSW1hZ2UgZnJvbSAweDQ4MDgwMDAwIHRvIDB4NDgyMDAwMDAsIGVuZD00
OWFjMDAwMAojIyBGbGF0dGVuZWQgRGV2aWNlIFRyZWUgYmxvYiBhdCA0ODAwMDAwMAogICBCb290
aW5nIHVzaW5nIHRoZSBmZHQgYmxvYiBhdCAweDQ4MDAwMDAwCiAgIExvYWRpbmcgRGV2aWNlIFRy
ZWUgdG8gMDAwMDAwMDA1N2ZmNzAwMCwgZW5kIDAwMDAwMDAwNTdmZmZkNjIgLi4uIE9LCgpTdGFy
dGluZyBrZXJuZWwgLi4uCgpbICAgIDAuMDAwMDAwXSBCb290aW5nIExpbnV4IG9uIHBoeXNpY2Fs
IENQVSAweDAwMDAwMDAwMDAgWzB4NDEyZmQwNTBdClsgICAgMC4wMDAwMDBdIExpbnV4IHZlcnNp
b24gNS4xMC4xMTItY2lwNisgKHByYXNtaUBwcmFzbWkpIChhYXJjaDY0LWxpbnV4LWdudS1nY2Mg
KExpbmFybyBHQ0MgNy41LTIwMTkuMTIpIDcuNS4wLCBHTlUgbGQgKExpbmFyb19CaW51dGlscy0y
MDEyClsgICAgMC4wMDAwMDBdIE1hY2hpbmUgbW9kZWw6IFJlbmVzYXMgU01BUkMgRVZLIGJhc2Vk
IG9uIHI5YTA3ZzA1NGwyClsgICAgMC4wMDAwMDBdIGVmaTogVUVGSSBub3QgZm91bmQuClsgICAg
MC4wMDAwMDBdIE5VTUE6IE5vIE5VTUEgY29uZmlndXJhdGlvbiBmb3VuZApbICAgIDAuMDAwMDAw
XSBOVU1BOiBGYWtpbmcgYSBub2RlIGF0IFttZW0gMHgwMDAwMDAwMDQ4MDAwMDAwLTB4MDAwMDAw
MDBiZmZmZmZmZl0KWyAgICAwLjAwMDAwMF0gTlVNQTogTk9ERV9EQVRBIFttZW0gMHhiZmM5ZWIw
MC0weGJmY2EwZmZmXQpbICAgIDAuMDAwMDAwXSBab25lIHJhbmdlczoKWyAgICAwLjAwMDAwMF0g
ICBETUEgICAgICBbbWVtIDB4MDAwMDAwMDA0ODAwMDAwMC0weDAwMDAwMDAwYmZmZmZmZmZdClsg
ICAgMC4wMDAwMDBdICAgRE1BMzIgICAgZW1wdHkKWyAgICAwLjAwMDAwMF0gICBOb3JtYWwgICBl
bXB0eQpbICAgIDAuMDAwMDAwXSBNb3ZhYmxlIHpvbmUgc3RhcnQgZm9yIGVhY2ggbm9kZQpbICAg
IDAuMDAwMDAwXSBFYXJseSBtZW1vcnkgbm9kZSByYW5nZXMKWyAgICAwLjAwMDAwMF0gICBub2Rl
ICAgMDogW21lbSAweDAwMDAwMDAwNDgwMDAwMDAtMHgwMDAwMDAwMGE3ZWZmZmZmXQpbICAgIDAu
MDAwMDAwXSAgIG5vZGUgICAwOiBbbWVtIDB4MDAwMDAwMDBhN2YwMDAwMC0weDAwMDAwMDAwYjdl
ZmZmZmZdClsgICAgMC4wMDAwMDBdICAgbm9kZSAgIDA6IFttZW0gMHgwMDAwMDAwMGI3ZjAwMDAw
LTB4MDAwMDAwMDBiZmZmZmZmZl0KWyAgICAwLjAwMDAwMF0gSW5pdG1lbSBzZXR1cCBub2RlIDAg
W21lbSAweDAwMDAwMDAwNDgwMDAwMDAtMHgwMDAwMDAwMGJmZmZmZmZmXQpbICAgIDAuMDAwMDAw
XSBjbWE6IFJlc2VydmVkIDE2IE1pQiBhdCAweDAwMDAwMDAwYmMwMDAwMDAKWyAgICAwLjAwMDAw
MF0gcHNjaTogcHJvYmluZyBmb3IgY29uZHVpdCBtZXRob2QgZnJvbSBEVC4KWyAgICAwLjAwMDAw
MF0gcHNjaTogUFNDSXYxLjEgZGV0ZWN0ZWQgaW4gZmlybXdhcmUuClsgICAgMC4wMDAwMDBdIHBz
Y2k6IFVzaW5nIHN0YW5kYXJkIFBTQ0kgdjAuMiBmdW5jdGlvbiBJRHMKWyAgICAwLjAwMDAwMF0g
cHNjaTogTUlHUkFURV9JTkZPX1RZUEUgbm90IHN1cHBvcnRlZC4KWyAgICAwLjAwMDAwMF0gcHNj
aTogU01DIENhbGxpbmcgQ29udmVudGlvbiB2MS4yClsgICAgMC4wMDAwMDBdIHBlcmNwdTogRW1i
ZWRkZWQgMjIgcGFnZXMvY3B1IHM1MDQ1NiByODE5MiBkMzE0NjQgdTkwMTEyClsgICAgMC4wMDAw
MDBdIERldGVjdGVkIFZJUFQgSS1jYWNoZSBvbiBDUFUwClsgICAgMC4wMDAwMDBdIENQVSBmZWF0
dXJlczogZGV0ZWN0ZWQ6IEdJQyBzeXN0ZW0gcmVnaXN0ZXIgQ1BVIGludGVyZmFjZQpbICAgIDAu
MDAwMDAwXSBDUFUgZmVhdHVyZXM6IGRldGVjdGVkOiBBUk0gZXJyYXRhIDExNjU1MjIsIDEzMTkz
NjcsIG9yIDE1MzA5MjMKWyAgICAwLjAwMDAwMF0gQnVpbHQgMSB6b25lbGlzdHMsIG1vYmlsaXR5
IGdyb3VwaW5nIG9uLiAgVG90YWwgcGFnZXM6IDQ4Mzg0MApbICAgIDAuMDAwMDAwXSBQb2xpY3kg
em9uZTogRE1BClsgICAgMC4wMDAwMDBdIEtlcm5lbCBjb21tYW5kIGxpbmU6IHJvb3Q9L2Rldi9z
ZGExIHJ3IHJvb3R3YWl0IHJvb3Rmc3R5cGU9ZXh0NCBpcD1vZmYKWyAgICAwLjAwMDAwMF0gRGVu
dHJ5IGNhY2hlIGhhc2ggdGFibGUgZW50cmllczogMjYyMTQ0IChvcmRlcjogOSwgMjA5NzE1MiBi
eXRlcywgbGluZWFyKQpbICAgIDAuMDAwMDAwXSBJbm9kZS1jYWNoZSBoYXNoIHRhYmxlIGVudHJp
ZXM6IDEzMTA3MiAob3JkZXI6IDgsIDEwNDg1NzYgYnl0ZXMsIGxpbmVhcikKWyAgICAwLjAwMDAw
MF0gbWVtIGF1dG8taW5pdDogc3RhY2s6b2ZmLCBoZWFwIGFsbG9jOm9mZiwgaGVhcCBmcmVlOm9m
ZgpbICAgIDAuMDAwMDAwXSBNZW1vcnk6IDE2MjI2OTZLLzE5NjYwODBLIGF2YWlsYWJsZSAoMTIy
ODhLIGtlcm5lbCBjb2RlLCAyMTU2SyByd2RhdGEsIDU3MDhLIHJvZGF0YSwgNDU0NEsgaW5pdCwg
NDgzSyBic3MsIDMyNzAwMEsgcmVzZXJ2ZWQsIDE2KQpbICAgIDAuMDAwMDAwXSBTTFVCOiBIV2Fs
aWduPTY0LCBPcmRlcj0wLTMsIE1pbk9iamVjdHM9MCwgQ1BVcz0yLCBOb2Rlcz0xClsgICAgMC4w
MDAwMDBdIHJjdTogUHJlZW1wdGlibGUgaGllcmFyY2hpY2FsIFJDVSBpbXBsZW1lbnRhdGlvbi4K
WyAgICAwLjAwMDAwMF0gcmN1OiAgICAgUkNVIGV2ZW50IHRyYWNpbmcgaXMgZW5hYmxlZC4KWyAg
ICAwLjAwMDAwMF0gcmN1OiAgICAgUkNVIHJlc3RyaWN0aW5nIENQVXMgZnJvbSBOUl9DUFVTPTI1
NiB0byBucl9jcHVfaWRzPTIuClsgICAgMC4wMDAwMDBdICBUcmFtcG9saW5lIHZhcmlhbnQgb2Yg
VGFza3MgUkNVIGVuYWJsZWQuClsgICAgMC4wMDAwMDBdIHJjdTogUkNVIGNhbGN1bGF0ZWQgdmFs
dWUgb2Ygc2NoZWR1bGVyLWVubGlzdG1lbnQgZGVsYXkgaXMgMjUgamlmZmllcy4KWyAgICAwLjAw
MDAwMF0gcmN1OiBBZGp1c3RpbmcgZ2VvbWV0cnkgZm9yIHJjdV9mYW5vdXRfbGVhZj0xNiwgbnJf
Y3B1X2lkcz0yClsgICAgMC4wMDAwMDBdIE5SX0lSUVM6IDY0LCBucl9pcnFzOiA2NCwgcHJlYWxs
b2NhdGVkIGlycXM6IDAKWyAgICAwLjAwMDAwMF0gR0lDdjM6IDQ4MCBTUElzIGltcGxlbWVudGVk
ClsgICAgMC4wMDAwMDBdIEdJQ3YzOiAwIEV4dGVuZGVkIFNQSXMgaW1wbGVtZW50ZWQKWyAgICAw
LjAwMDAwMF0gR0lDdjM6IERpc3RyaWJ1dG9yIGhhcyBubyBSYW5nZSBTZWxlY3RvciBzdXBwb3J0
ClsgICAgMC4wMDAwMDBdIEdJQ3YzOiAxNiBQUElzIGltcGxlbWVudGVkClsgICAgMC4wMDAwMDBd
IEdJQ3YzOiBDUFUwOiBmb3VuZCByZWRpc3RyaWJ1dG9yIDAgcmVnaW9uIDA6MHgwMDAwMDAwMDEx
OTQwMDAwClsgICAgMC4wMDAwMDBdIHJhbmRvbTogZ2V0X3JhbmRvbV9ieXRlcyBjYWxsZWQgZnJv
bSBzdGFydF9rZXJuZWwrMHgzMWMvMHg0ZTggd2l0aCBjcm5nX2luaXQ9MApbICAgIDAuMDAwMDAw
XSBhcmNoX3RpbWVyOiBjcDE1IHRpbWVyKHMpIHJ1bm5pbmcgYXQgMjQuMDBNSHogKHZpcnQpLgpb
ICAgIDAuMDAwMDAwXSBjbG9ja3NvdXJjZTogYXJjaF9zeXNfY291bnRlcjogbWFzazogMHhmZmZm
ZmZmZmZmZmZmZiBtYXhfY3ljbGVzOiAweDU4OGZlOWRjMCwgbWF4X2lkbGVfbnM6IDQ0MDc5NTIw
MjU5MiBucwpbICAgIDAuMDAwMDA1XSBzY2hlZF9jbG9jazogNTYgYml0cyBhdCAyNE1IeiwgcmVz
b2x1dGlvbiA0MW5zLCB3cmFwcyBldmVyeSA0Mzk4MDQ2NTExMDk3bnMKWyAgICAwLjAwMDE3M10g
Q29uc29sZTogY29sb3VyIGR1bW15IGRldmljZSA4MHgyNQpbICAgIDAuMDAwNTU4XSBwcmludGs6
IGNvbnNvbGUgW3R0eTBdIGVuYWJsZWQKWyAgICAwLjAwMDY1NF0gQ2FsaWJyYXRpbmcgZGVsYXkg
bG9vcCAoc2tpcHBlZCksIHZhbHVlIGNhbGN1bGF0ZWQgdXNpbmcgdGltZXIgZnJlcXVlbmN5Li4g
NDguMDAgQm9nb01JUFMgKGxwaj05NjAwMCkKWyAgICAwLjAwMDY3OV0gcGlkX21heDogZGVmYXVs
dDogMzI3NjggbWluaW11bTogMzAxClsgICAgMC4wMDA3NjNdIExTTTogU2VjdXJpdHkgRnJhbWV3
b3JrIGluaXRpYWxpemluZwpbICAgIDAuMDAwODM2XSBNb3VudC1jYWNoZSBoYXNoIHRhYmxlIGVu
dHJpZXM6IDQwOTYgKG9yZGVyOiAzLCAzMjc2OCBieXRlcywgbGluZWFyKQpbICAgIDAuMDAwODYw
XSBNb3VudHBvaW50LWNhY2hlIGhhc2ggdGFibGUgZW50cmllczogNDA5NiAob3JkZXI6IDMsIDMy
NzY4IGJ5dGVzLCBsaW5lYXIpClsgICAgMC4wMDI1MTNdIHJjdTogSGllcmFyY2hpY2FsIFNSQ1Ug
aW1wbGVtZW50YXRpb24uClsgICAgMC4wMDMzMDVdIERldGVjdGVkIFJlbmVzYXMgUlovVjJMIHI5
YTA3ZzA1NCAKWyAgICAwLjAwMzc3N10gRUZJIHNlcnZpY2VzIHdpbGwgbm90IGJlIGF2YWlsYWJs
ZS4KWyAgICAwLjAwNDExM10gc21wOiBCcmluZ2luZyB1cCBzZWNvbmRhcnkgQ1BVcyAuLi4KWyAg
ICAwLjAwNDYxN10gRGV0ZWN0ZWQgVklQVCBJLWNhY2hlIG9uIENQVTEKWyAgICAwLjAwNDY2MF0g
R0lDdjM6IENQVTE6IGZvdW5kIHJlZGlzdHJpYnV0b3IgMTAwIHJlZ2lvbiAwOjB4MDAwMDAwMDAx
MTk2MDAwMApbICAgIDAuMDA0NzIwXSBDUFUxOiBCb290ZWQgc2Vjb25kYXJ5IHByb2Nlc3NvciAw
eDAwMDAwMDAxMDAgWzB4NDEyZmQwNTBdClsgICAgMC4wMDQ4NDldIHNtcDogQnJvdWdodCB1cCAx
IG5vZGUsIDIgQ1BVcwpbICAgIDAuMDA0ODk3XSBTTVA6IFRvdGFsIG9mIDIgcHJvY2Vzc29ycyBh
Y3RpdmF0ZWQuClsgICAgMC4wMDQ5MTBdIENQVSBmZWF0dXJlczogZGV0ZWN0ZWQ6IFByaXZpbGVn
ZWQgQWNjZXNzIE5ldmVyClsgICAgMC4wMDQ5MjFdIENQVSBmZWF0dXJlczogZGV0ZWN0ZWQ6IExT
RSBhdG9taWMgaW5zdHJ1Y3Rpb25zClsgICAgMC4wMDQ5MzFdIENQVSBmZWF0dXJlczogZGV0ZWN0
ZWQ6IFVzZXIgQWNjZXNzIE92ZXJyaWRlClsgICAgMC4wMDQ5NDNdIENQVSBmZWF0dXJlczogZGV0
ZWN0ZWQ6IDMyLWJpdCBFTDAgU3VwcG9ydApbICAgIDAuMDA0OTU0XSBDUFUgZmVhdHVyZXM6IGRl
dGVjdGVkOiBDb21tb24gbm90IFByaXZhdGUgdHJhbnNsYXRpb25zClsgICAgMC4wMDQ5NjVdIENQ
VSBmZWF0dXJlczogZGV0ZWN0ZWQ6IFJBUyBFeHRlbnNpb24gU3VwcG9ydApbICAgIDAuMDA0OTc2
XSBDUFUgZmVhdHVyZXM6IGRldGVjdGVkOiBEYXRhIGNhY2hlIGNsZWFuIHRvIHRoZSBQb1Ugbm90
IHJlcXVpcmVkIGZvciBJL0QgY29oZXJlbmNlClsgICAgMC4wMDQ5OTFdIENQVSBmZWF0dXJlczog
ZGV0ZWN0ZWQ6IENSQzMyIGluc3RydWN0aW9ucwpbICAgIDAuMDA1MDAwXSBDUFUgZmVhdHVyZXM6
IGRldGVjdGVkOiBTcGVjdWxhdGl2ZSBTdG9yZSBCeXBhc3NpbmcgU2FmZSAoU1NCUykKWyAgICAw
LjAyMDQ3OF0gQ1BVOiBBbGwgQ1BVKHMpIHN0YXJ0ZWQgYXQgRUwxClsgICAgMC4wMjA1NjNdIGFs
dGVybmF0aXZlczogcGF0Y2hpbmcga2VybmVsIGNvZGUKWyAgICAwLjAyMjg2Nl0gZGV2dG1wZnM6
IGluaXRpYWxpemVkClsgICAgMC4wMjczMzhdIGNsb2Nrc291cmNlOiBqaWZmaWVzOiBtYXNrOiAw
eGZmZmZmZmZmIG1heF9jeWNsZXM6IDB4ZmZmZmZmZmYsIG1heF9pZGxlX25zOiA3NjQ1MDQxNzg1
MTAwMDAwIG5zClsgICAgMC4wMjczOTRdIGZ1dGV4IGhhc2ggdGFibGUgZW50cmllczogNTEyIChv
cmRlcjogMywgMzI3NjggYnl0ZXMsIGxpbmVhcikKWyAgICAwLjAyODA1OF0gcGluY3RybCBjb3Jl
OiBpbml0aWFsaXplZCBwaW5jdHJsIHN1YnN5c3RlbQpbICAgIDAuMDI5MjYxXSBETUkgbm90IHBy
ZXNlbnQgb3IgaW52YWxpZC4KWyAgICAwLjAyOTg3NF0gTkVUOiBSZWdpc3RlcmVkIHByb3RvY29s
IGZhbWlseSAxNgpbICAgIDAuMDMxNDgyXSBETUE6IHByZWFsbG9jYXRlZCAyNTYgS2lCIEdGUF9L
RVJORUwgcG9vbCBmb3IgYXRvbWljIGFsbG9jYXRpb25zClsgICAgMC4wMzE2NDhdIERNQTogcHJl
YWxsb2NhdGVkIDI1NiBLaUIgR0ZQX0tFUk5FTHxHRlBfRE1BIHBvb2wgZm9yIGF0b21pYyBhbGxv
Y2F0aW9ucwpbICAgIDAuMDMxODE1XSBETUE6IHByZWFsbG9jYXRlZCAyNTYgS2lCIEdGUF9LRVJO
RUx8R0ZQX0RNQTMyIHBvb2wgZm9yIGF0b21pYyBhbGxvY2F0aW9ucwpbICAgIDAuMDMxOTI1XSBh
dWRpdDogaW5pdGlhbGl6aW5nIG5ldGxpbmsgc3Vic3lzIChkaXNhYmxlZCkKWyAgICAwLjAzMjIx
OF0gYXVkaXQ6IHR5cGU9MjAwMCBhdWRpdCgwLjAzMjoxKTogc3RhdGU9aW5pdGlhbGl6ZWQgYXVk
aXRfZW5hYmxlZD0wIHJlcz0xClsgICAgMC4wMzMxODRdIHRoZXJtYWxfc3lzOiBSZWdpc3RlcmVk
IHRoZXJtYWwgZ292ZXJub3IgJ3N0ZXBfd2lzZScKWyAgICAwLjAzMzMyNF0gY3B1aWRsZTogdXNp
bmcgZ292ZXJub3IgbWVudQpbICAgIDAuMDMzNTIzXSBody1icmVha3BvaW50OiBmb3VuZCA2IGJy
ZWFrcG9pbnQgYW5kIDQgd2F0Y2hwb2ludCByZWdpc3RlcnMuClsgICAgMC4wMzM2MTBdIEFTSUQg
YWxsb2NhdG9yIGluaXRpYWxpc2VkIHdpdGggNjU1MzYgZW50cmllcwpbICAgIDAuMDM0NTAyXSBT
ZXJpYWw6IEFNQkEgUEwwMTEgVUFSVCBkcml2ZXIKWyAgICAwLjA1OTkxMl0gSHVnZVRMQiByZWdp
c3RlcmVkIDEuMDAgR2lCIHBhZ2Ugc2l6ZSwgcHJlLWFsbG9jYXRlZCAwIHBhZ2VzClsgICAgMC4w
NTk5NDldIEh1Z2VUTEIgcmVnaXN0ZXJlZCAzMi4wIE1pQiBwYWdlIHNpemUsIHByZS1hbGxvY2F0
ZWQgMCBwYWdlcwpbICAgIDAuMDU5OTYyXSBIdWdlVExCIHJlZ2lzdGVyZWQgMi4wMCBNaUIgcGFn
ZSBzaXplLCBwcmUtYWxsb2NhdGVkIDAgcGFnZXMKWyAgICAwLjA1OTk3NV0gSHVnZVRMQiByZWdp
c3RlcmVkIDY0LjAgS2lCIHBhZ2Ugc2l6ZSwgcHJlLWFsbG9jYXRlZCAwIHBhZ2VzClsgICAgMC4w
NjEyMTBdIGNyeXB0ZDogbWF4X2NwdV9xbGVuIHNldCB0byAxMDAwClsgICAgMC4wNjM1MzVdIEFD
UEk6IEludGVycHJldGVyIGRpc2FibGVkLgpbICAgIDAuMDY1ODQ0XSBpb21tdTogRGVmYXVsdCBk
b21haW4gdHlwZTogVHJhbnNsYXRlZCAKWyAgICAwLjA2NjA2OV0gdmdhYXJiOiBsb2FkZWQKWyAg
ICAwLjA2NjQwMl0gU0NTSSBzdWJzeXN0ZW0gaW5pdGlhbGl6ZWQKWyAgICAwLjA2NjkwN10gdXNi
Y29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciB1c2JmcwpbICAgIDAuMDY2OTYz
XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIGh1YgpbICAgIDAuMDY3
MDA4XSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBkZXZpY2UgZHJpdmVyIHVzYgpbICAgIDAuMDY3
Njg0XSBwcHNfY29yZTogTGludXhQUFMgQVBJIHZlci4gMSByZWdpc3RlcmVkClsgICAgMC4wNjc2
OThdIHBwc19jb3JlOiBTb2Z0d2FyZSB2ZXIuIDUuMy42IC0gQ29weXJpZ2h0IDIwMDUtMjAwNyBS
b2RvbGZvIEdpb21ldHRpIDxnaW9tZXR0aUBsaW51eC5pdD4KWyAgICAwLjA2NzcyOV0gUFRQIGNs
b2NrIHN1cHBvcnQgcmVnaXN0ZXJlZApbICAgIDAuMDY5MjIwXSBjbG9ja3NvdXJjZTogU3dpdGNo
ZWQgdG8gY2xvY2tzb3VyY2UgYXJjaF9zeXNfY291bnRlcgpbICAgIDAuMDY5NDcxXSBWRlM6IERp
c2sgcXVvdGFzIGRxdW90XzYuNi4wClsgICAgMC4wNjk1MzhdIFZGUzogRHF1b3QtY2FjaGUgaGFz
aCB0YWJsZSBlbnRyaWVzOiA1MTIgKG9yZGVyIDAsIDQwOTYgYnl0ZXMpClsgICAgMC4wNjk3MzNd
IHBucDogUG5QIEFDUEk6IGRpc2FibGVkClsgICAgMC4wNzU4NzJdIE5FVDogUmVnaXN0ZXJlZCBw
cm90b2NvbCBmYW1pbHkgMgpbICAgIDAuMDc2MTA2XSBJUCBpZGVudHMgaGFzaCB0YWJsZSBlbnRy
aWVzOiAzMjc2OCAob3JkZXI6IDYsIDI2MjE0NCBieXRlcywgbGluZWFyKQpbICAgIDAuMDc3MzUz
XSB0Y3BfbGlzdGVuX3BvcnRhZGRyX2hhc2ggaGFzaCB0YWJsZSBlbnRyaWVzOiAxMDI0IChvcmRl
cjogMiwgMTYzODQgYnl0ZXMsIGxpbmVhcikKWyAgICAwLjA3NzQ2OV0gVENQIGVzdGFibGlzaGVk
IGhhc2ggdGFibGUgZW50cmllczogMTYzODQgKG9yZGVyOiA1LCAxMzEwNzIgYnl0ZXMsIGxpbmVh
cikKWyAgICAwLjA3NzU5N10gVENQIGJpbmQgaGFzaCB0YWJsZSBlbnRyaWVzOiAxNjM4NCAob3Jk
ZXI6IDYsIDI2MjE0NCBieXRlcywgbGluZWFyKQpbICAgIDAuMDc3ODY2XSBUQ1A6IEhhc2ggdGFi
bGVzIGNvbmZpZ3VyZWQgKGVzdGFibGlzaGVkIDE2Mzg0IGJpbmQgMTYzODQpClsgICAgMC4wNzgw
OTFdIFVEUCBoYXNoIHRhYmxlIGVudHJpZXM6IDEwMjQgKG9yZGVyOiAzLCAzMjc2OCBieXRlcywg
bGluZWFyKQpbICAgIDAuMDc4MTQ4XSBVRFAtTGl0ZSBoYXNoIHRhYmxlIGVudHJpZXM6IDEwMjQg
KG9yZGVyOiAzLCAzMjc2OCBieXRlcywgbGluZWFyKQpbICAgIDAuMDc4MzQzXSBORVQ6IFJlZ2lz
dGVyZWQgcHJvdG9jb2wgZmFtaWx5IDEKWyAgICAwLjA3ODk3M10gUlBDOiBSZWdpc3RlcmVkIG5h
bWVkIFVOSVggc29ja2V0IHRyYW5zcG9ydCBtb2R1bGUuClsgICAgMC4wNzkwMDVdIFJQQzogUmVn
aXN0ZXJlZCB1ZHAgdHJhbnNwb3J0IG1vZHVsZS4KWyAgICAwLjA3OTAxNV0gUlBDOiBSZWdpc3Rl
cmVkIHRjcCB0cmFuc3BvcnQgbW9kdWxlLgpbICAgIDAuMDc5MDI2XSBSUEM6IFJlZ2lzdGVyZWQg
dGNwIE5GU3Y0LjEgYmFja2NoYW5uZWwgdHJhbnNwb3J0IG1vZHVsZS4KWyAgICAwLjA3OTA0NV0g
UENJOiBDTFMgMCBieXRlcywgZGVmYXVsdCA2NApbICAgIDAuMDgxNDYwXSBJbml0aWFsaXNlIHN5
c3RlbSB0cnVzdGVkIGtleXJpbmdzClsgICAgMC4wODE3NDldIHdvcmtpbmdzZXQ6IHRpbWVzdGFt
cF9iaXRzPTQyIG1heF9vcmRlcj0xOSBidWNrZXRfb3JkZXI9MApbICAgIDAuMDg3NzY0XSBzcXVh
c2hmczogdmVyc2lvbiA0LjAgKDIwMDkvMDEvMzEpIFBoaWxsaXAgTG91Z2hlcgpbICAgIDAuMDg4
NTg5XSBORlM6IFJlZ2lzdGVyaW5nIHRoZSBpZF9yZXNvbHZlciBrZXkgdHlwZQpbICAgIDAuMDg4
NjQ1XSBLZXkgdHlwZSBpZF9yZXNvbHZlciByZWdpc3RlcmVkClsgICAgMC4wODg2NTZdIEtleSB0
eXBlIGlkX2xlZ2FjeSByZWdpc3RlcmVkClsgICAgMC4wODg3NTBdIG5mczRmaWxlbGF5b3V0X2lu
aXQ6IE5GU3Y0IEZpbGUgTGF5b3V0IERyaXZlciBSZWdpc3RlcmluZy4uLgpbICAgIDAuMDg4NzY2
XSBuZnM0ZmxleGZpbGVsYXlvdXRfaW5pdDogTkZTdjQgRmxleGZpbGUgTGF5b3V0IERyaXZlciBS
ZWdpc3RlcmluZy4uLgpbICAgIDAuMDg5MDA1XSA5cDogSW5zdGFsbGluZyB2OWZzIDlwMjAwMCBm
aWxlIHN5c3RlbSBzdXBwb3J0ClsgICAgMC4xMjUyNTVdIEtleSB0eXBlIGFzeW1tZXRyaWMgcmVn
aXN0ZXJlZApbICAgIDAuMTI1MjkyXSBBc3ltbWV0cmljIGtleSBwYXJzZXIgJ3g1MDknIHJlZ2lz
dGVyZWQKWyAgICAwLjEyNTM2MF0gQmxvY2sgbGF5ZXIgU0NTSSBnZW5lcmljIChic2cpIGRyaXZl
ciB2ZXJzaW9uIDAuNCBsb2FkZWQgKG1ham9yIDI0NykKWyAgICAwLjEyNTM4MF0gaW8gc2NoZWR1
bGVyIG1xLWRlYWRsaW5lIHJlZ2lzdGVyZWQKWyAgICAwLjEyNTM5MV0gaW8gc2NoZWR1bGVyIGt5
YmVyIHJlZ2lzdGVyZWQKWyAgICAwLjE0NjM5NF0gU2VyaWFsOiA4MjUwLzE2NTUwIGRyaXZlciwg
NCBwb3J0cywgSVJRIHNoYXJpbmcgZW5hYmxlZApbICAgIDAuMTQ4NTE1XSBTdXBlckggKEgpU0NJ
KEYpIGRyaXZlciBpbml0aWFsaXplZApbICAgIDAuMTQ5MDQxXSBtc21fc2VyaWFsOiBkcml2ZXIg
aW5pdGlhbGl6ZWQKWyAgICAwLjE1ODQ5OF0gbG9vcDogbW9kdWxlIGxvYWRlZApbICAgIDAuMTYz
MzE2XSB0dW46IFVuaXZlcnNhbCBUVU4vVEFQIGRldmljZSBkcml2ZXIsIDEuNgpbICAgIDAuMTY0
NTIzXSBlMTAwMGU6IEludGVsKFIpIFBSTy8xMDAwIE5ldHdvcmsgRHJpdmVyClsgICAgMC4xNjQ1
NTFdIGUxMDAwZTogQ29weXJpZ2h0KGMpIDE5OTkgLSAyMDE1IEludGVsIENvcnBvcmF0aW9uLgpb
ICAgIDAuMTY0NjI4XSBpZ2I6IEludGVsKFIpIEdpZ2FiaXQgRXRoZXJuZXQgTmV0d29yayBEcml2
ZXIKWyAgICAwLjE2NDY0NF0gaWdiOiBDb3B5cmlnaHQgKGMpIDIwMDctMjAxNCBJbnRlbCBDb3Jw
b3JhdGlvbi4KWyAgICAwLjE2NDY5MV0gaWdidmY6IEludGVsKFIpIEdpZ2FiaXQgVmlydHVhbCBG
dW5jdGlvbiBOZXR3b3JrIERyaXZlcgpbICAgIDAuMTY0NzA1XSBpZ2J2ZjogQ29weXJpZ2h0IChj
KSAyMDA5IC0gMjAxMiBJbnRlbCBDb3Jwb3JhdGlvbi4KWyAgICAwLjE2NTA1MV0gc2t5MjogZHJp
dmVyIHZlcnNpb24gMS4zMApbICAgIDAuMTY2ODM2XSBWRklPIC0gVXNlciBMZXZlbCBtZXRhLWRy
aXZlciB2ZXJzaW9uOiAwLjMKWyAgICAwLjE2OTEyN10gZWhjaV9oY2Q6IFVTQiAyLjAgJ0VuaGFu
Y2VkJyBIb3N0IENvbnRyb2xsZXIgKEVIQ0kpIERyaXZlcgpbICAgIDAuMTY5MTYxXSBlaGNpLXBj
aTogRUhDSSBQQ0kgcGxhdGZvcm0gZHJpdmVyClsgICAgMC4xNjkyOTNdIGVoY2ktcGxhdGZvcm06
IEVIQ0kgZ2VuZXJpYyBwbGF0Zm9ybSBkcml2ZXIKWyAgICAwLjE2OTk3NF0gZWhjaS1vcmlvbjog
RUhDSSBvcmlvbiBkcml2ZXIKWyAgICAwLjE3MDE3N10gZWhjaS1leHlub3M6IEVIQ0kgRXh5bm9z
IGRyaXZlcgpbICAgIDAuMTcwMzQ3XSBvaGNpX2hjZDogVVNCIDEuMSAnT3BlbicgSG9zdCBDb250
cm9sbGVyIChPSENJKSBEcml2ZXIKWyAgICAwLjE3MDM5OF0gb2hjaS1wY2k6IE9IQ0kgUENJIHBs
YXRmb3JtIGRyaXZlcgpbICAgIDAuMTcwNDY1XSBvaGNpLXBsYXRmb3JtOiBPSENJIGdlbmVyaWMg
cGxhdGZvcm0gZHJpdmVyClsgICAgMC4xNzA5NzhdIG9oY2ktZXh5bm9zOiBPSENJIEV4eW5vcyBk
cml2ZXIKWyAgICAwLjE3MTczOV0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRy
aXZlciB1c2Itc3RvcmFnZQpbICAgIDAuMTc0NzQ1XSBpMmMgL2RldiBlbnRyaWVzIGRyaXZlcgpb
ICAgIDAuMTc4NTk2XSBzZGhjaTogU2VjdXJlIERpZ2l0YWwgSG9zdCBDb250cm9sbGVyIEludGVy
ZmFjZSBkcml2ZXIKWyAgICAwLjE3ODYyNV0gc2RoY2k6IENvcHlyaWdodChjKSBQaWVycmUgT3Nz
bWFuClsgICAgMC4xNzkwOTldIFN5bm9wc3lzIERlc2lnbndhcmUgTXVsdGltZWRpYSBDYXJkIElu
dGVyZmFjZSBEcml2ZXIKWyAgICAwLjE4MDI1Ml0gc2RoY2ktcGx0Zm06IFNESENJIHBsYXRmb3Jt
IGFuZCBPRiBkcml2ZXIgaGVscGVyClsgICAgMC4xODIwMTddIFNNQ0NDOiBTT0NfSUQ6IEFSQ0hf
U09DX0lEIG5vdCBpbXBsZW1lbnRlZCwgc2tpcHBpbmcgLi4uLgpbICAgIDAuMTgyNzAyXSB1c2Jj
b3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZhY2UgZHJpdmVyIHVzYmhpZApbICAgIDAuMTgyNzIy
XSB1c2JoaWQ6IFVTQiBISUQgY29yZSBkcml2ZXIKWyAgICAwLjE4NTMzN10gTkVUOiBSZWdpc3Rl
cmVkIHByb3RvY29sIGZhbWlseSAxMApbICAgIDAuMTg2Mzg1XSBTZWdtZW50IFJvdXRpbmcgd2l0
aCBJUHY2ClsgICAgMC4xODY0NjddIHNpdDogSVB2NiwgSVB2NCBhbmQgTVBMUyBvdmVyIElQdjQg
dHVubmVsaW5nIGRyaXZlcgpbICAgIDAuMTg2OTgwXSBORVQ6IFJlZ2lzdGVyZWQgcHJvdG9jb2wg
ZmFtaWx5IDE3ClsgICAgMC4xODcxNDRdIDlwbmV0OiBJbnN0YWxsaW5nIDlQMjAwMCBzdXBwb3J0
ClsgICAgMC4xODcyMTldIEtleSB0eXBlIGRuc19yZXNvbHZlciByZWdpc3RlcmVkClsgICAgMC4x
ODc2NjFdIHJlZ2lzdGVyZWQgdGFza3N0YXRzIHZlcnNpb24gMQpbICAgIDAuMTg3NjgyXSBMb2Fk
aW5nIGNvbXBpbGVkLWluIFguNTA5IGNlcnRpZmljYXRlcwpbICAgIDAuMTk1MzQ5XSBncGlvLTE1
MyAoZ3Bpb19zZDBfcHdyX2VuKTogaG9nZ2VkIGFzIG91dHB1dC9oaWdoClsgICAgMC4xOTU0MDBd
IGdwaW8tNDQ5IChzZDBfZGV2X3NlbCk6IGhvZ2dlZCBhcyBvdXRwdXQvaGlnaApbICAgIDAuMTk1
NDMwXSBncGlvLTQ1OCAoY2FuMF9zdGIpOiBob2dnZWQgYXMgb3V0cHV0L2xvdwpbICAgIDAuMTk1
NDUzXSBncGlvLTQ1OSAoY2FuMV9zdGIpOiBob2dnZWQgYXMgb3V0cHV0L2xvdwpbICAgIDAuMTk1
NDc5XSBncGlvLTQzNCAoc2QxX3B3cl9lbik6IGhvZ2dlZCBhcyBvdXRwdXQvaGlnaApbICAgIDAu
MTk2MjQ2XSBwaW5jdHJsLXJ6ZzJsIDExMDMwMDAwLnBpbmN0cmw6IHBpbmN0cmwtcnpnMmwgc3Vw
cG9ydCByZWdpc3RlcmVkClsgICAgMC4yMDExNjVdIDEwMDRiODAwLnNlcmlhbDogdHR5U0MwIGF0
IE1NSU8gMHgxMDA0YjgwMCAoaXJxID0gMjEsIGJhc2VfYmF1ZCA9IDApIGlzIGEgc2NpZgpbICAg
IDEuMjQ5MzU4XSBwcmludGs6IGNvbnNvbGUgW3R0eVNDMF0gZW5hYmxlZApbICAgIDEuMjU1Mzk1
XSAxMDA0YzAwMC5zZXJpYWw6IHR0eVNDMSBhdCBNTUlPIDB4MTAwNGMwMDAgKGlycSA9IDI2LCBi
YXNlX2JhdWQgPSAwKSBpcyBhIHNjaWYKWyAgICAxLjI2NTcwNF0gcmVuZXNhc19zcGkgMTAwNGIw
MDAuc3BpOiBkbWFfcmVxdWVzdF9zbGF2ZV9jaGFubmVsX2NvbXBhdCBmYWlsZWQKWyAgICAxLjI3
Mjg5NF0gcmVuZXNhc19zcGkgMTAwNGIwMDAuc3BpOiBETUEgbm90IGF2YWlsYWJsZSwgdXNpbmcg
UElPClsgICAgMS4yNzk0NThdIHJlbmVzYXNfc3BpIDEwMDRiMDAwLnNwaTogcHJvYmVkClsgICAg
MS4yODU0MjRdIHJhdmIgMTFjMjAwMDAuZXRoZXJuZXQ6IG5vIHZhbGlkIE1BQyBhZGRyZXNzIHN1
cHBsaWVkLCB1c2luZyBhIHJhbmRvbSBvbmUKWyAgICAxLjI5NTgzM10gcmF2YiAxMWMyMDAwMC5l
dGhlcm5ldCBldGgwOiBCYXNlIGFkZHJlc3MgYXQgMHgxMWMyMDAwMCwgMzY6YWE6MjU6NmY6Njg6
MmIsIElSUSA4NC4KWyAgICAxLjMwNjE5OF0gcmF2YiAxMWMzMDAwMC5ldGhlcm5ldDogbm8gdmFs
aWQgTUFDIGFkZHJlc3Mgc3VwcGxpZWQsIHVzaW5nIGEgcmFuZG9tIG9uZQpbICAgIDEuMzE2Mzk4
XSByYXZiIDExYzMwMDAwLmV0aGVybmV0IGV0aDE6IEJhc2UgYWRkcmVzcyBhdCAweDExYzMwMDAw
LCBiZTpmZDoyOTpiZDphZDozNywgSVJRIDg3LgpbICAgIDEuMzUzMjU3XSBlaGNpLXBsYXRmb3Jt
IDExYzUwMTAwLnVzYjogRUhDSSBIb3N0IENvbnRyb2xsZXIKWyAgICAxLjM1ODk3Ml0gZWhjaS1w
bGF0Zm9ybSAxMWM1MDEwMC51c2I6IG5ldyBVU0IgYnVzIHJlZ2lzdGVyZWQsIGFzc2lnbmVkIGJ1
cyBudW1iZXIgMQpbICAgIDEuMzY2OTI0XSBlaGNpLXBsYXRmb3JtIDExYzUwMTAwLnVzYjogaXJx
IDkyLCBpbyBtZW0gMHgxMWM1MDEwMApbICAgIDEuMzg1MjE5XSBlaGNpLXBsYXRmb3JtIDExYzUw
MTAwLnVzYjogVVNCIDIuMCBzdGFydGVkLCBFSENJIDEuMTAKWyAgICAxLjM5MjA2Ml0gaHViIDEt
MDoxLjA6IFVTQiBodWIgZm91bmQKWyAgICAxLjM5NTg0OF0gaHViIDEtMDoxLjA6IDEgcG9ydCBk
ZXRlY3RlZApbICAgIDEuNDAxNTQ1XSBlaGNpLXBsYXRmb3JtIDExYzcwMTAwLnVzYjogRUhDSSBI
b3N0IENvbnRyb2xsZXIKWyAgICAxLjQwNzI0N10gZWhjaS1wbGF0Zm9ybSAxMWM3MDEwMC51c2I6
IG5ldyBVU0IgYnVzIHJlZ2lzdGVyZWQsIGFzc2lnbmVkIGJ1cyBudW1iZXIgMgpbICAgIDEuNDE1
MTQ3XSBlaGNpLXBsYXRmb3JtIDExYzcwMTAwLnVzYjogaXJxIDkzLCBpbyBtZW0gMHgxMWM3MDEw
MApbICAgIDEuNDM3MjMyXSBlaGNpLXBsYXRmb3JtIDExYzcwMTAwLnVzYjogVVNCIDIuMCBzdGFy
dGVkLCBFSENJIDEuMTAKWyAgICAxLjQ0NDAyOV0gaHViIDItMDoxLjA6IFVTQiBodWIgZm91bmQK
WyAgICAxLjQ0NzgyM10gaHViIDItMDoxLjA6IDEgcG9ydCBkZXRlY3RlZApbICAgIDEuNDUzNDU4
XSBvaGNpLXBsYXRmb3JtIDExYzUwMDAwLnVzYjogR2VuZXJpYyBQbGF0Zm9ybSBPSENJIGNvbnRy
b2xsZXIKWyAgICAxLjQ2MDE5MV0gb2hjaS1wbGF0Zm9ybSAxMWM1MDAwMC51c2I6IG5ldyBVU0Ig
YnVzIHJlZ2lzdGVyZWQsIGFzc2lnbmVkIGJ1cyBudW1iZXIgMwpbICAgIDEuNDY4MTY3XSBvaGNp
LXBsYXRmb3JtIDExYzUwMDAwLnVzYjogaXJxIDkwLCBpbyBtZW0gMHgxMWM1MDAwMApbICAgIDEu
NTYzODY2XSBodWIgMy0wOjEuMDogVVNCIGh1YiBmb3VuZApbICAgIDEuNTY3NjU5XSBodWIgMy0w
OjEuMDogMSBwb3J0IGRldGVjdGVkClsgICAgMS41NzMyODldIG9oY2ktcGxhdGZvcm0gMTFjNzAw
MDAudXNiOiBHZW5lcmljIFBsYXRmb3JtIE9IQ0kgY29udHJvbGxlcgpbICAgIDEuNTgwMDE4XSBv
aGNpLXBsYXRmb3JtIDExYzcwMDAwLnVzYjogbmV3IFVTQiBidXMgcmVnaXN0ZXJlZCwgYXNzaWdu
ZWQgYnVzIG51bWJlciA0ClsgICAgMS41ODc5NzddIG9oY2ktcGxhdGZvcm0gMTFjNzAwMDAudXNi
OiBpcnEgOTEsIGlvIG1lbSAweDExYzcwMDAwClsgICAgMS42ODM4NjldIGh1YiA0LTA6MS4wOiBV
U0IgaHViIGZvdW5kClsgICAgMS42ODc2NjFdIGh1YiA0LTA6MS4wOiAxIHBvcnQgZGV0ZWN0ZWQK
WyAgICAxLjY5NDA2NF0gaTJjLXJpaWMgMTAwNTgwMDAuaTJjOiByZWdpc3RlcmVkIHdpdGggMTAw
MDAwSHogYnVzIHNwZWVkClsgICAgMS43MDI3NjJdIGkyYy1yaWljIDEwMDU4NDAwLmkyYzogcmVn
aXN0ZXJlZCB3aXRoIDEwMDAwMEh6IGJ1cyBzcGVlZApbICAgIDEuNzExNDgxXSBpMmMtcmlpYyAx
MDA1OGMwMC5pMmM6IHJlZ2lzdGVyZWQgd2l0aCA0MDAwMDBIeiBidXMgc3BlZWQKWyAgICAxLjc3
MDc3Ml0gcmVuZXNhc19zZGhpX2ludGVybmFsX2RtYWMgMTFjMDAwMDAubW1jOiBtbWMwIGJhc2Ug
YXQgMHgwMDAwMDAwMDExYzAwMDAwLCBtYXggY2xvY2sgcmF0ZSAxMzMgTUh6ClsgICAgMS43NzMz
MzddIHJlbmVzYXNfc2RoaV9pbnRlcm5hbF9kbWFjIDExYzEwMDAwLm1tYzogbW1jMSBiYXNlIGF0
IDB4MDAwMDAwMDAxMWMxMDAwMCwgbWF4IGNsb2NrIHJhdGUgMTMzIE1IegpbICAgIDEuNzkwOTg3
XSBXYWl0aW5nIGZvciByb290IGRldmljZSAvZGV2L3NkYTEuLi4KWyAgICAxLjg4NDA4Ml0gbW1j
MDogbmV3IEhTMjAwIE1NQyBjYXJkIGF0IGFkZHJlc3MgMDAwMQpbICAgIDEuODg5NzU3XSBtbWNi
bGswOiBtbWMwOjAwMDEgUzBKNThYIDU5LjMgR2lCIApbICAgIDEuODk0NTAzXSBtbWNibGswYm9v
dDA6IG1tYzA6MDAwMSBTMEo1OFggcGFydGl0aW9uIDEgMzEuNSBNaUIKWyAgICAxLjkwMDU2N10g
bW1jYmxrMGJvb3QxOiBtbWMwOjAwMDEgUzBKNThYIHBhcnRpdGlvbiAyIDMxLjUgTWlCClsgICAg
MS45MDY2ODddIG1tY2JsazBycG1iOiBtbWMwOjAwMDEgUzBKNThYIHBhcnRpdGlvbiAzIDQuMDAg
TWlCLCBjaGFyZGV2ICgyNDE6MCkKWyAgICAxLjkxNTEzMV0gIG1tY2JsazA6IHAxClsgICAgMi4x
NTg5ODRdIG1tYzE6IG5ldyB1bHRyYSBoaWdoIHNwZWVkIFNEUjEwNCBTREhDIGNhcmQgYXQgYWRk
cmVzcyBhYWFhClsgICAgMi4xNjYyNzldIG1tY2JsazE6IG1tYzE6YWFhYSBTQzE2RyAxNC44IEdp
QiAKWyAgICAyLjE3NjEyOV0gIG1tY2JsazE6IHAxIHAyClsgICAgMi4yMzcyMzhdIHVzYiAyLTE6
IG5ldyBoaWdoLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDIgdXNpbmcgZWhjaS1wbGF0Zm9ybQpb
ICAgIDIuMzk5MTMyXSB1c2Itc3RvcmFnZSAyLTE6MS4wOiBVU0IgTWFzcyBTdG9yYWdlIGRldmlj
ZSBkZXRlY3RlZApbICAgIDIuNDA1NzcxXSBzY3NpIGhvc3QwOiB1c2Itc3RvcmFnZSAyLTE6MS4w
ClsgICAgMy40MjIzOTFdIHNjc2kgMDowOjA6MDogRGlyZWN0LUFjY2VzcyAgICAgR2VuZXJhbCAg
VVNCIEZsYXNoIERpc2sgICAxLjAwIFBROiAwIEFOU0k6IDIKWyAgICAzLjQzMTY1MF0gc2QgMDow
OjA6MDogW3NkYV0gNzgzMTU1MiA1MTItYnl0ZSBsb2dpY2FsIGJsb2NrczogKDQuMDEgR0IvMy43
MyBHaUIpClsgICAgMy40Mzk4NDJdIHNkIDA6MDowOjA6IFtzZGFdIFdyaXRlIFByb3RlY3QgaXMg
b2ZmClsgICAgMy40NDUyMjNdIHNkIDA6MDowOjA6IFtzZGFdIE5vIENhY2hpbmcgbW9kZSBwYWdl
IGZvdW5kClsgICAgMy40NTA1NDFdIHNkIDA6MDowOjA6IFtzZGFdIEFzc3VtaW5nIGRyaXZlIGNh
Y2hlOiB3cml0ZSB0aHJvdWdoClsgICAgMy40NjAzOTZdICBzZGE6IHNkYTEgc2RhMgpbICAgIDMu
NDY2NDcyXSBzZCAwOjA6MDowOiBbc2RhXSBBdHRhY2hlZCBTQ1NJIHJlbW92YWJsZSBkaXNrClsg
ICAgMy40OTA5MjhdIHJhbmRvbTogZmFzdCBpbml0IGRvbmUKWyAgICA0LjYwMTA0MF0gRVhUNC1m
cyAoc2RhMSk6IHJlY292ZXJ5IGNvbXBsZXRlClsgICAgNC42MDc3MjVdIEVYVDQtZnMgKHNkYTEp
OiBtb3VudGVkIGZpbGVzeXN0ZW0gd2l0aCBvcmRlcmVkIGRhdGEgbW9kZS4gT3B0czogKG51bGwp
ClsgICAgNC42MTU0NTFdIFZGUzogTW91bnRlZCByb290IChleHQ0IGZpbGVzeXN0ZW0pIG9uIGRl
dmljZSA4OjEuClsgICAgNC42MjU5NjJdIGRldnRtcGZzOiBtb3VudGVkClsgICAgNC42MzMzMDFd
IEZyZWVpbmcgdW51c2VkIGtlcm5lbCBtZW1vcnk6IDQ1NDRLClsgICAgNC42MzgwMTNdIFJ1biAv
c2Jpbi9pbml0IGFzIGluaXQgcHJvY2VzcwpbICAgIDUuMDA1ODA4XSBzeXN0ZW1kWzFdOiBTeXN0
ZW0gdGltZSBiZWZvcmUgYnVpbGQgdGltZSwgYWR2YW5jaW5nIGNsb2NrLgpbICAgIDUuMDU0MzE0
XSBzeXN0ZW1kWzFdOiBzeXN0ZW1kIDI0NC41KyBydW5uaW5nIGluIHN5c3RlbSBtb2RlLiAoK1BB
TSAtQVVESVQgLVNFTElOVVggK0lNQSAtQVBQQVJNT1IgLVNNQUNLICtTWVNWSU5JVCArVVRNUCAt
TElCQ1JZUFRTRVRVUCAtKQpbICAgIDUuMDc2NDA4XSBzeXN0ZW1kWzFdOiBEZXRlY3RlZCBhcmNo
aXRlY3R1cmUgYXJtNjQuCgpXZWxjb21lIHRvIFBva3kgKFlvY3RvIFByb2plY3QgUmVmZXJlbmNl
IERpc3RybykgMy4xLjUgKGR1bmZlbGwpIQoKWyAgICA1LjExODQ3OV0gc3lzdGVtZFsxXTogU2V0
IGhvc3RuYW1lIHRvIDxzbWFyYy1yemcybD4uClsgICAgNS41ODE0NjBdIHJhbmRvbTogc3lzdGVt
ZDogdW5pbml0aWFsaXplZCB1cmFuZG9tIHJlYWQgKDE2IGJ5dGVzIHJlYWQpClsgICAgNS41ODgz
ODRdIHN5c3RlbWRbMV06IHN5c3RlbS1nZXR0eS5zbGljZTogdW5pdCBjb25maWd1cmVzIGFuIElQ
IGZpcmV3YWxsLCBidXQgdGhlIGxvY2FsIHN5c3RlbSBkb2VzIG5vdCBzdXBwb3J0IEJQRi9jZ3Jv
dXAgZmlyZXdhbGxpbmcuClsgICAgNS42MDA3MjJdIHN5c3RlbWRbMV06IChUaGlzIHdhcm5pbmcg
aXMgb25seSBzaG93biBmb3IgdGhlIGZpcnN0IHVuaXQgdXNpbmcgSVAgZmlyZXdhbGxpbmcuKQpb
ICAgIDUuNjEyNTI4XSBzeXN0ZW1kWzFdOiBDcmVhdGVkIHNsaWNlIHN5c3RlbS1nZXR0eS5zbGlj
ZS4KWyAgT0sgIF0gQ3JlYXRlZCBzbGljZSBzeXN0ZW0tZ2V0dHkuc2xpY2UuClsgICAgNS42MzM0
MzddIHJhbmRvbTogc3lzdGVtZDogdW5pbml0aWFsaXplZCB1cmFuZG9tIHJlYWQgKDE2IGJ5dGVz
IHJlYWQpClsgICAgNS42NDE1OTNdIHN5c3RlbWRbMV06IENyZWF0ZWQgc2xpY2Ugc3lzdGVtLXNl
cmlhbFx4MmRnZXR0eS5zbGljZS4KWyAgT0sgIF0gQ3JlYXRlZCBzbGljZSBzeXN0ZW0tc2VyaWFs
XHgyZGdldHR5LnNsaWNlLgpbICAgIDUuNjY1NDI0XSByYW5kb206IHN5c3RlbWQ6IHVuaW5pdGlh
bGl6ZWQgdXJhbmRvbSByZWFkICgxNiBieXRlcyByZWFkKQpbICAgIDUuNjczNDAyXSBzeXN0ZW1k
WzFdOiBDcmVhdGVkIHNsaWNlIFVzZXIgYW5kIFNlc3Npb24gU2xpY2UuClsgIE9LICBdIENyZWF0
ZWQgc2xpY2UgVXNlciBhbmQgU2Vzc2lvbiBTbGljZS4KWyAgICA1LjY5MzgzMV0gc3lzdGVtZFsx
XTogU3RhcnRlZCBEaXNwYXRjaCBQYXNzd29yZCBSZXF1ZXN0cyB0byBDb25zb2xlIERpcmVjdG9y
eSBXYXRjaC4KWyAgT0sgIF0gU3RhcnRlZCBEaXNwYXRjaCBQYXNzd29yZCDigKZ0cyB0byBDb25z
b2xlIERpcmVjdG9yeSBXYXRjaC4KWyAgICA1LjcxNzcyOV0gc3lzdGVtZFsxXTogU3RhcnRlZCBG
b3J3YXJkIFBhc3N3b3JkIFJlcXVlc3RzIHRvIFdhbGwgRGlyZWN0b3J5IFdhdGNoLgpbICBPSyAg
XSBTdGFydGVkIEZvcndhcmQgUGFzc3dvcmQgUuKApnVlc3RzIHRvIFdhbGwgRGlyZWN0b3J5IFdh
dGNoLgpbICAgIDUuNzQxNTg0XSBzeXN0ZW1kWzFdOiBSZWFjaGVkIHRhcmdldCBQYXRocy4KWyAg
T0sgIF0gUmVhY2hlZCB0YXJnZXQgUGF0aHMuClsgICAgNS43NjE0OTZdIHN5c3RlbWRbMV06IFJl
YWNoZWQgdGFyZ2V0IFJlbW90ZSBGaWxlIFN5c3RlbXMuClsgIE9LICBdIFJlYWNoZWQgdGFyZ2V0
IFJlbW90ZSBGaWxlIFN5c3RlbXMuClsgICAgNS43ODE0NjddIHN5c3RlbWRbMV06IFJlYWNoZWQg
dGFyZ2V0IFNsaWNlcy4KWyAgT0sgIF0gUmVhY2hlZCB0YXJnZXQgU2xpY2VzLgpbICAgIDUuODAx
NDcxXSBzeXN0ZW1kWzFdOiBSZWFjaGVkIHRhcmdldCBTd2FwLgpbICBPSyAgXSBSZWFjaGVkIHRh
cmdldCBTd2FwLgpbICAgIDUuODM1MDY1XSBzeXN0ZW1kWzFdOiBMaXN0ZW5pbmcgb24gUlBDYmlu
ZCBTZXJ2ZXIgQWN0aXZhdGlvbiBTb2NrZXQuClsgIE9LICBdIExpc3RlbmluZyBvbiBSUENiaW5k
IFNlcnZlciBBY3RpdmF0aW9uIFNvY2tldC4KWyAgICA1Ljg1NzUzMF0gc3lzdGVtZFsxXTogUmVh
Y2hlZCB0YXJnZXQgUlBDIFBvcnQgTWFwcGVyLgpbICBPSyAgXSBSZWFjaGVkIHRhcmdldCBSUEMg
UG9ydCBNYXBwZXIuClsgICAgNS44Nzk5NzZdIHN5c3RlbWRbMV06IExpc3RlbmluZyBvbiBTeXNs
b2cgU29ja2V0LgpbICBPSyAgXSBMaXN0ZW5pbmcgb24gU3lzbG9nIFNvY2tldC4KWyAgICA1Ljkw
MTg2N10gc3lzdGVtZFsxXTogTGlzdGVuaW5nIG9uIGluaXRjdGwgQ29tcGF0aWJpbGl0eSBOYW1l
ZCBQaXBlLgpbICBPSyAgXSBMaXN0ZW5pbmcgb24gaW5pdGN0bCBDb21wYXRpYmlsaXR5IE5hbWVk
IFBpcGUuClsgICAgNS45MjYzMjNdIHN5c3RlbWRbMV06IExpc3RlbmluZyBvbiBKb3VybmFsIEF1
ZGl0IFNvY2tldC4KWyAgT0sgIF0gTGlzdGVuaW5nIG9uIEpvdXJuYWwgQXVkaXQgU29ja2V0Lgpb
ICAgIDUuOTQ2MDE3XSBzeXN0ZW1kWzFdOiBMaXN0ZW5pbmcgb24gSm91cm5hbCBTb2NrZXQgKC9k
ZXYvbG9nKS4KWyAgT0sgIF0gTGlzdGVuaW5nIG9uIEpvdXJuYWwgU29ja2V0ICgvZGV2L2xvZyku
ClsgICAgNS45NzAxMDZdIHN5c3RlbWRbMV06IExpc3RlbmluZyBvbiBKb3VybmFsIFNvY2tldC4K
WyAgT0sgIF0gTGlzdGVuaW5nIG9uIEpvdXJuYWwgU29ja2V0LgpbICAgIDUuOTkwMjY0XSBzeXN0
ZW1kWzFdOiBMaXN0ZW5pbmcgb24gTmV0d29yayBTZXJ2aWNlIE5ldGxpbmsgU29ja2V0LgpbICBP
SyAgXSBMaXN0ZW5pbmcgb24gTmV0d29yayBTZXJ2aWNlIE5ldGxpbmsgU29ja2V0LgpbICAgIDYu
MDE0MTM1XSBzeXN0ZW1kWzFdOiBMaXN0ZW5pbmcgb24gdWRldiBDb250cm9sIFNvY2tldC4KWyAg
T0sgIF0gTGlzdGVuaW5nIG9uIHVkZXYgQ29udHJvbCBTb2NrZXQuClsgICAgNi4wMzM4ODVdIHN5
c3RlbWRbMV06IExpc3RlbmluZyBvbiB1ZGV2IEtlcm5lbCBTb2NrZXQuClsgIE9LICBdIExpc3Rl
bmluZyBvbiB1ZGV2IEtlcm5lbCBTb2NrZXQuClsgICAgNi4wNTg0MzRdIHN5c3RlbWRbMV06IE1v
dW50aW5nIEh1Z2UgUGFnZXMgRmlsZSBTeXN0ZW0uLi4KICAgICAgICAgTW91bnRpbmcgSHVnZSBQ
YWdlcyBGaWxlIFN5c3RlbS4uLgpbICAgIDYuMDgyMDYyXSBzeXN0ZW1kWzFdOiBNb3VudGluZyBQ
T1NJWCBNZXNzYWdlIFF1ZXVlIEZpbGUgU3lzdGVtLi4uCiAgICAgICAgIE1vdW50aW5nIFBPU0lY
IE1lc3NhZ2UgUXVldWUgRmlsZSBTeXN0ZW0uLi4KWyAgICA2LjExMDExMF0gc3lzdGVtZFsxXTog
TW91bnRpbmcgS2VybmVsIERlYnVnIEZpbGUgU3lzdGVtLi4uCiAgICAgICAgIE1vdW50aW5nIEtl
cm5lbCBEZWJ1ZyBGaWxlIFN5c3RlbS4uLgpbICAgIDYuMTM1NDk0XSBzeXN0ZW1kWzFdOiBNb3Vu
dGluZyBUZW1wb3JhcnkgRGlyZWN0b3J5ICgvdG1wKS4uLgogICAgICAgICBNb3VudGluZyBUZW1w
b3JhcnkgRGlyZWN0b3J5ICgvdG1wKS4uLgpbICAgIDYuMTU4NDkzXSBzeXN0ZW1kWzFdOiBDb25k
aXRpb24gY2hlY2sgcmVzdWx0ZWQgaW4gQ3JlYXRlIGxpc3Qgb2Ygc3RhdGljIGRldmljZSBub2Rl
cyBmb3IgdGhlIGN1cnJlbnQga2VybmVsIGJlaW5nIHNraXBwZWQuClsgICAgNi4xNzQ0MjRdIHN5
c3RlbWRbMV06IFN0YXJ0aW5nIFN0YXJ0IHBzcGxhc2ggYm9vdCBzcGxhc2ggc2NyZWVuLi4uCiAg
ICAgICAgIFN0YXJ0aW5nIFN0YXJ0IHBzcGxhc2ggYm9vdCBzcGxhc2ggc2NyZWVuLi4uClsgICAg
Ni4yMTQ4MDNdIHN5c3RlbWRbMV06IFN0YXJ0ZWQgSGFyZHdhcmUgUk5HIEVudHJvcHkgR2F0aGVy
ZXIgRGFlbW9uLgpbICBPSyAgXSBTdGFydGVkIEhhcmR3YXJlIFJORyBFbnRyb3B5IEdhdGhlcmVy
IERhZW1vbi4KWyAgICA2LjI0NDE3NV0gc3lzdGVtZFsxXTogU3RhcnRpbmcgUlBDIEJpbmQuLi4K
ICAgICAgICAgU3RhcnRpbmcgUlBDIEJpbmQuLi4KWyAgICA2LjI2MTY2NF0gc3lzdGVtZFsxXTog
Q29uZGl0aW9uIGNoZWNrIHJlc3VsdGVkIGluIEZpbGUgU3lzdGVtIENoZWNrIG9uIFJvb3QgRGV2
aWNlIGJlaW5nIHNraXBwZWQuClsgICAgNi4yNzcxNjhdIHN5c3RlbWRbMV06IFN0YXJ0aW5nIEpv
dXJuYWwgU2VydmljZS4uLgogICAgICAgICBTdGFydGluZyBKb3VybmFsIFNlcnZpY2UuLi4KWyAg
ICA2LjMyNjQ2N10gc3lzdGVtZFsxXTogU3RhcnRpbmcgTG9hZCBLZXJuZWwgTW9kdWxlcy4uLgog
ICAgICAgICBTdGFydGluZyBMb2FkIEtlcm5lbCBNb2R1bGVzLi4uClsgICAgNi4zNTg0NTVdIHN5
c3RlbWRbMV06IFN0YXJ0aW5nIFJlbW91bnQgUm9vdCBhbmQgS2VybmVsIEZpbGUgU3lzdGVtcy4u
LgogICAgICAgICBTdGFydGluZyBSZW1vdW50IFJvb3QgYW5kIEtlcm5lbCBGaWxlIFN5c3RlbXMu
Li4KWyAgICA2LjQwNjQ5MF0gc3lzdGVtZFsxXTogU3RhcnRpbmcgdWRldiBDb2xkcGx1ZyBhbGwg
RGV2aWNlcy4uLgogICAgICAgICBTdGFydGluZyB1ZGV2IENvbGRwbHVnIGFsbCBEZXZpY2VzLi4u
ClsgICAgNi40NDcxODNdIEVYVDQtZnMgKHNkYTEpOiByZS1tb3VudGVkLiBPcHRzOiAobnVsbCkK
WyAgICA2LjQ3MzA0MV0gc3lzdGVtZFsxXTogU3RhcnRlZCBSUEMgQmluZC4KWyAgT0sgIF0gU3Rh
cnRlZCBSUEMgQmluZC4KWyAgICA2LjUxNjQ2OV0gc3lzdGVtZFsxXTogU3RhcnRlZCBKb3VybmFs
IFNlcnZpY2UuClsgIE9LICBdIFN0YXJ0ZWQgSm91cm5hbCBTZXJ2aWNlLgpbICBPSyAgXSBNb3Vu
dGVkIEh1Z2UgUGFnZXMgRmlsZSBTeXN0ZW0uClsgIE9LICBdIE1vdW50ZWQgUE9TSVggTWVzc2Fn
ZSBRdWV1ZSBGaWxlIFN5c3RlbS4KWyAgT0sgIF0gTW91bnRlZCBLZXJuZWwgRGVidWcgRmlsZSBT
eXN0ZW0uClsgIE9LICBdIE1vdW50ZWQgVGVtcG9yYXJ5IERpcmVjdG9yeSAoL3RtcCkuCltGQUlM
RURdIEZhaWxlZCB0byBzdGFydCBTdGFydCBwc3BsYXNoIGJvb3Qgc3BsYXNoIHNjcmVlbi4KU2Vl
ICdzeXN0ZW1jdGwgc3RhdHVzIHBzcGxhc2gtc3RhcnQuc2VydmljZScgZm9yIGRldGFpbHMuCltE
RVBFTkRdIERlcGVuZGVuY3kgZmFpbGVkIGZvciBTdGFy4oCmcHJvZ3Jlc3MgY29tbXVuaWNhdGlv
biBoZWxwZXIuCltGQUlMRURdIEZhaWxlZCB0byBzdGFydCBMb2FkIEtlcm5lbCBNb2R1bGVzLgpT
ZWUgJ3N5c3RlbWN0bCBzdGF0dXMgc3lzdGVtZC1tb2R1bGVzLWxvYWQuc2VydmljZScgZm9yIGRl
dGFpbHMuClsgIE9LICBdIFN0YXJ0ZWQgUmVtb3VudCBSb290IGFuZCBLZXJuZWwgRmlsZSBTeXN0
ZW1zLgogICAgICAgICBNb3VudGluZyBLZXJuZWwgQ29uZmlndXJhdGlvbiBGaWxlIFN5c3RlbS4u
LgogICAgICAgICBTdGFydGluZyBGbHVzaCBKb3VybmFsIHRvIFBlcnNpc3RlbnQgU3RvcmFnZS4u
LgogICAgICAgICBTdGFydGluZyBBcHBseSBLZXJuZWwgVmFyaWFibGVzLi4uClsgICAgNi43OTY4
MjldIHN5c3RlbWQtam91cm5hbGRbMTM5XTogUmVjZWl2ZWQgY2xpZW50IHJlcXVlc3QgdG8gZmx1
c2ggcnVudGltZSBqb3VybmFsLgogICAgICAgICBTdGFydGluZyBDcmVhdGUgU3RhdGljIERldmlj
ZSBOb2RlcyBpbiAvZGV2Li4uClsgIE9LICBdIE1vdW50ZWQgS2VybmVsIENvbmZpZ3VyYXRpb24g
RmlsZSBTeXN0ZW0uClsgIE9LICBdIFN0YXJ0ZWQgRmx1c2ggSm91cm5hbCB0byBQZXJzaXN0ZW50
IFN0b3JhZ2UuClsgIE9LICBdIFN0YXJ0ZWQgQXBwbHkgS2VybmVsIFZhcmlhYmxlcy4KWyAgT0sg
IF0gU3RhcnRlZCBDcmVhdGUgU3RhdGljIERldmljZSBOb2RlcyBpbiAvZGV2LgpbICBPSyAgXSBS
ZWFjaGVkIHRhcmdldCBMb2NhbCBGaWxlIFN5c3RlbXMgKFByZSkuCiAgICAgICAgIE1vdW50aW5n
IC92YXIvdm9sYXRpbGUuLi4KICAgICAgICAgU3RhcnRpbmcgdWRldiBLZXJuZWwgRGV2aWNlIE1h
bmFnZXIuLi4KWyAgT0sgIF0gTW91bnRlZCAvdmFyL3ZvbGF0aWxlLgogICAgICAgICBTdGFydGlu
ZyBMb2FkL1NhdmUgUmFuZG9tIFNlZWQuLi4KWyAgT0sgIF0gUmVhY2hlZCB0YXJnZXQgTG9jYWwg
RmlsZSBTeXN0ZW1zLgogICAgICAgICBTdGFydGluZyBDcmVhdGUgVm9sYXRpbGUgRmlsZXMgYW5k
IERpcmVjdG9yaWVzLi4uClsgIE9LICBdIFN0YXJ0ZWQgdWRldiBLZXJuZWwgRGV2aWNlIE1hbmFn
ZXIuClsgIE9LICBdIFN0YXJ0ZWQgQ3JlYXRlIFZvbGF0aWxlIEZpbGVzIGFuZCBEaXJlY3Rvcmll
cy4KICAgICAgICAgU3RhcnRpbmcgTmV0d29yayBTZXJ2aWNlLi4uCiAgICAgICAgIFN0YXJ0aW5n
IE5ldHdvcmsgVGltZSBTeW5jaHJvbml6YXRpb24uLi4KICAgICAgICAgU3RhcnRpbmcgVXBkYXRl
IFVUTVAgYWJvdXQgU3lzdGVtIEJvb3QvU2h1dGRvd24uLi4KWyAgT0sgIF0gU3RhcnRlZCB1ZGV2
IENvbGRwbHVnIGFsbCBEZXZpY2VzLgpbICBPSyAgXSBTdGFydGVkIFVwZGF0ZSBVVE1QIGFib3V0
IFN5c3RlbSBCb290L1NodXRkb3duLgpbICBPSyAgXSBTdGFydGVkIE5ldHdvcmsgU2VydmljZS4K
ICAgICAgICAgU3RhcnRpbmcgTmV0d29yayBOYW1lIFJlc29sdXRpb24uLi4KWyAgT0sgIF0gU3Rh
cnRlZCBOZXR3b3JrIFRpbWUgU3luY2hyb25pemF0aW9uLgpbICBPSyAgXSBSZWFjaGVkIHRhcmdl
dCBTeXN0ZW0gSW5pdGlhbGl6YXRpb24uClsgIE9LICBdIFN0YXJ0ZWQgRGFpbHkgQ2xlYW51cCBv
ZiBUZW1wb3JhcnkgRGlyZWN0b3JpZXMuClsgIE9LICBdIFJlYWNoZWQgdGFyZ2V0IFN5c3RlbSBU
aW1lIFNldC4KWyAgT0sgIF0gUmVhY2hlZCB0YXJnZXQgU3lzdGVtIFRpbWUgU3luY2hyb25pemVk
LgpbICBPSyAgXSBSZWFjaGVkIHRhcmdldCBUaW1lcnMuClsgIE9LICBdIExpc3RlbmluZyBvbiBB
dmFoaSBtRE5TL0ROUy1TRCBTdGFjayBBY3RpdmF0aW9uIFNvY2tldC4KWyAgT0sgIF0gTGlzdGVu
aW5nIG9uIEQtQnVzIFN5c3RlbSBNZXNzYWdlIEJ1cyBTb2NrZXQuCiAgICAgICAgIFN0YXJ0aW5n
IHNzaGQuc29ja2V0LgpbICBPSyAgXSBMaXN0ZW5pbmcgb24gc3NoZC5zb2NrZXQuClsgIE9LICBd
IFJlYWNoZWQgdGFyZ2V0IFNvY2tldHMuClsgIE9LICBdIFJlYWNoZWQgdGFyZ2V0IEJhc2ljIFN5
c3RlbS4KWyAgT0sgIF0gU3RhcnRlZCBLZXJuZWwgTG9nZ2luZyBTZXJ2aWNlLgpbICBPSyAgXSBT
dGFydGVkIFN5c3RlbSBMb2dnaW5nIFNlcnZpY2UuClsgIE9LICBdIFN0YXJ0ZWQgRC1CdXMgU3lz
dGVtIE1lc3NhZ2UgQnVzLgogICAgICAgICBTdGFydGluZyBybmctdG9vbHMuc2VydmljZS4uLgog
ICAgICAgICBTdGFydGluZyBMb2dpbiBTZXJ2aWNlLi4uClsgIE9LICBdIFN0YXJ0ZWQgTmV0d29y
ayBOYW1lIFJlc29sdXRpb24uClsgIE9LICBdIFJlYWNoZWQgdGFyZ2V0IE5ldHdvcmsuClsgICAg
OC4wMjkzMTldIHJhbmRvbTogY3JuZyBpbml0IGRvbmUKWyAgICA4LjAzMjc0N10gcmFuZG9tOiA3
IHVyYW5kb20gd2FybmluZyhzKSBtaXNzZWQgZHVlIHRvIHJhdGVsaW1pdGluZwpbICBPSyAgXSBS
ZWFjaGVkIHRhcmdldCBIb3N0IGFuZCBOZXR3b3JrIE5hbWUgTG9va3Vwcy4KICAgICAgICAgU3Rh
cnRpbmcgQXZhaGkgbUROUy9ETlMtU0QgU3RhY2suLi4KICAgICAgICAgU3RhcnRpbmcgUGVybWl0
IFVzZXIgU2Vzc2lvbnMuLi4KWyAgT0sgIF0gU3RhcnRlZCBMb2FkL1NhdmUgUmFuZG9tIFNlZWQu
ClsgIE9LICBdIFN0YXJ0ZWQgcm5nLXRvb2xzLnNlcnZpY2UuClsgIE9LICBdIFN0YXJ0ZWQgUGVy
bWl0IFVzZXIgU2Vzc2lvbnMuClsgIE9LICBdIFN0YXJ0ZWQgQXZhaGkgbUROUy9ETlMtU0QgU3Rh
Y2suClsgIE9LICBdIFN0YXJ0ZWQgR2V0dHkgb24gdHR5MS4KWyAgT0sgIF0gU3RhcnRlZCBTZXJp
YWwgR2V0dHkgb24gdHR5U0MwLgpbICBPSyAgXSBSZWFjaGVkIHRhcmdldCBMb2dpbiBQcm9tcHRz
LgogICAgICAgICBTdGFydGluZyB3ZXN0b24uc2VydmljZS4uLgpbICBPSyAgXSBTdGFydGVkIExv
Z2luIFNlcnZpY2UuClsgIE9LICBdIFN0YXJ0ZWQgd2VzdG9uLnNlcnZpY2UuClsgIE9LICBdIFJl
YWNoZWQgdGFyZ2V0IE11bHRpLVVzZXIgU3lzdGVtLgogICAgICAgICBTdGFydGluZyBVcGRhdGUg
VVRNUCBhYm91dCBTeXN0ZW0gUnVubGV2ZWwgQ2hhbmdlcy4uLgpbICBPSyAgXSBTdGFydGVkIFVw
ZGF0ZSBVVE1QIGFib3V0IFN5c3RlbSBSdW5sZXZlbCBDaGFuZ2VzLgpbICAgMTAuODUwNjE5XSBN
aWNyb2NoaXAgS1NaOTEzMSBHaWdhYml0IFBIWSAxMWMzMDAwMC5ldGhlcm5ldC1mZmZmZmZmZjow
NzogYXR0YWNoZWQgUEhZIGRyaXZlciBbTWljcm9jaGlwIEtTWjkxMzEgR2lnYWJpdCBQSFldICht
aWlfYnVzOnBoeV9hKQpbICAgMTAuOTM2NTA1XSBNaWNyb2NoaXAgS1NaOTEzMSBHaWdhYml0IFBI
WSAxMWMyMDAwMC5ldGhlcm5ldC1mZmZmZmZmZjowNzogYXR0YWNoZWQgUEhZIGRyaXZlciBbTWlj
cm9jaGlwIEtTWjkxMzEgR2lnYWJpdCBQSFldIChtaWlfYnVzOnBoeV9hKQoKUG9reSAoWW9jdG8g
UHJvamVjdCBSZWZlcmVuY2UgRGlzdHJvKSAzLjEuNSBzbWFyYy1yemcybCB0dHlTQzAKCkJTUDog
UlpHMkwvUlpHMkwtU01BUkMtRVZLLzEuMQpMU0k6IFJaRzJMClZlcnNpb246IDEuMQpzbWFyYy1y
emcybCBsb2dpbjogcm9vdApbICAgMjMuMTI0NzQ2XSBhdWRpdDogdHlwZT0xMDA2IGF1ZGl0KDE2
MDA1OTg2NTYuMTE2OjIpOiBwaWQ9MjAzIHVpZD0wIG9sZC1hdWlkPTQyOTQ5NjcyOTUgYXVpZD0w
IHR0eT0obm9uZSkgb2xkLXNlcz00Mjk0OTY3Mjk1IHNlcz0xIHJlcz0xCgpyb290QHNtYXJjLXJ6
ZzJsOn4jIDsxNDNSCi1zaDogc3ludGF4IGVycm9yIG5lYXIgdW5leHBlY3RlZCB0b2tlbiBgOycK
cm9vdEBzbWFyYy1yemcybDp+IyAKcm9vdEBzbWFyYy1yemcybDp+IyAuL2NweS5zaCAKZnNjayBm
cm9tIHV0aWwtbGludXggMi4zNS4xCmRvc2ZzY2sgMi4xMSwgMTIgTWFyIDIwMDUsIEZBVDMyLCBM
Rk4KL2Rldi9tbWNibGsxcDI6IDExIGZpbGVzLCAyMDc3NC8zODM1NyBjbHVzdGVycwpbICAgMjgu
ODE0NjY1XSBGQVQtZnMgKG1tY2JsazFwMik6IFZvbHVtZSB3YXMgbm90IHByb3Blcmx5IHVubW91
bnRlZC4gU29tZSBkYXRhIG1heSBiZSBjb3JydXB0LiBQbGVhc2UgcnVuIGZzY2suCnJvb3RAc21h
cmMtcnpnMmw6fiMgCnJvb3RAc21hcmMtcnpnMmw6fiMgCnJvb3RAc21hcmMtcnpnMmw6fiMgLi9o
eXAuc2ggClsgICAzMi4wMjQ1NDhdIGphaWxob3VzZTogbG9hZGluZyBvdXQtb2YtdHJlZSBtb2R1
bGUgdGFpbnRzIGtlcm5lbC4KUmVhZGluZyBjb25maWd1cmF0aW9uIHNldDoKICBSb290IGNlbGw6
ICAgICBSZW5lc2FzIFJaL1YyTCBTTUFSQyAocmVuZXNhcy1yOWEwN2cwNTRsMi5jZWxsKQpPdmVy
bGFwcGluZyBtZW1vcnkgcmVnaW9ucyBpbnNpZGUgY2VsbDogTm9uZQpPdmVybGFwcGluZyBtZW1v
cnkgcmVnaW9ucyB3aXRoIGh5cGVydmlzb3I6IE5vbmUKTWlzc2luZyByZXNvdXJjZSBpbnRlcmNl
cHRpb25zIGZvciBhcmNoaXRlY3R1cmUgYXJtNjQ6IE5vbmUKWyAgIDMyLjg0NDk4N10gb2Jjb2Rl
IEBhcm1fZGNhY2hlc19mbHVzaDogZDUzYjAwMjQKWyAgIDMyLjg0NDk5M10gb2Jjb2RlIEBhcm1f
ZGNhY2hlc19mbHVzaDogZDUzYjAwMjQKWyAgIDMyLjg0NTAyMl0gLS0tLS0tLS0tLS0tWyBjdXQg
aGVyZSBdLS0tLS0tLS0tLS0tClsgICAzMi44NDk1MzddIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUg
XS0tLS0tLS0tLS0tLQpbICAgMzIuODU0MDM1XSBrZXJuZWwgQlVHIGF0IGFyY2gvYXJtNjQva2Vy
bmVsL3RyYXBzLmM6NDA3IQpbICAgMzIuODU4NjI3XSBrZXJuZWwgQlVHIGF0IGFyY2gvYXJtNjQv
a2VybmVsL3RyYXBzLmM6NDA3IQpbICAgMzIuODYzMjE4XSBJbnRlcm5hbCBlcnJvcjogT29wcyAt
IEJVRzogMCBbIzFdIFBSRUVNUFQgU01QClsgICAzMi44NzkyNDBdIE1vZHVsZXMgbGlua2VkIGlu
OiBqYWlsaG91c2UoTykKWyAgIDMyLjg4MzQxN10gQ1BVOiAwIFBJRDogMCBDb21tOiBzd2FwcGVy
LzAgVGFpbnRlZDogRyAgICAgICAgICAgTyAgICAgIDUuMTAuMTEyLWNpcDYrICMxMwpbICAgMzIu
ODkxNDcwXSBIYXJkd2FyZSBuYW1lOiBSZW5lc2FzIFNNQVJDIEVWSyBiYXNlZCBvbiByOWEwN2cw
NTRsMiAoRFQpClsgICAzMi44OTc5NjhdIHBzdGF0ZTogMDA0MDAwODUgKG56Y3YgZGFJZiArUEFO
IC1VQU8gLVRDTyBCVFlQRT0tLSkKWyAgIDMyLjkwMzk1OF0gcGMgOiBkb191bmRlZmluc3RyKzB4
MjZjLzB4MzIwClsgICAzMi45MDgwMzZdIGxyIDogZG9fdW5kZWZpbnN0cisweDFjYy8weDMyMApb
ICAgMzIuOTEyMTE1XSBzcCA6IGZmZmY4MDAwMTE4Y2JjZjAKWyAgIDMyLjkxNTQxM10geDI5OiBm
ZmZmODAwMDExOGNiY2YwIHgyODogZmZmZjgwMDAxMTYzMmY4MCAKWyAgIDMyLjkyMDcwNV0geDI3
OiBmZmZmODAwMDExNjMyZjgwIHgyNjogZmZmZjgwMDAxMThjYzAwMCAKWyAgIDMyLjkyNTk5NV0g
eDI1OiBmZmZmODAwMDExOGM4MDAwIHgyNDogZmZmZjgwMDAxMTYyYTM0NCAKWyAgIDMyLjkzMTI4
Nl0geDIzOiAwMDAwMDAwMDIwNDAwMDg1IHgyMjogZmZmZjgwMDAxMzAwNDg2NCAKWyAgIDMyLjkz
NjU3N10geDIxOiBmZmZmODAwMDExOGNiZWQwIHgyMDogZmZmZjgwMDAxMThjYmQ4MCAKWyAgIDMy
Ljk0MTg2N10geDE5OiBmZmZmODAwMDExMTA3MDAwIHgxODogMDAwMDAwMDAwMDAwMDAwMSAKWyAg
IDMyLjk0NzE1OF0geDE3OiBmZmZmODAwMDA4YzExODI4IHgxNjogMDAwMDAwMDAwMDAwMDAwMCAK
WyAgIDMyLjk1MjQ0OV0geDE1OiBmZmZmODAwMDEzMDA0ODY0IHgxNDogMDAwMDAwMDAxMDA0Yjgw
MCAKWyAgIDMyLjk1NzczOV0geDEzOiAwMDAwZmZmZmMwMjAwMDAwIHgxMjogMDAwMDAwMDBiNmYw
MDAwMCAKWyAgIDMyLjk2MzAzMF0geDExOiBmZmZmMDAwMGY2ZDAwMDAwIHgxMDogZmZmZjgwMDAx
MThjYmVkMCAKWyAgIDMyLjk2ODMyMV0geDkgOiBmZmZmODAwMDExOGNiZWQwIHg4IDogMzA2MjMz
MzU2NDIwM2E2OCAKWyAgIDMyLjk3MzYxMl0geDcgOiAwMDAwMDAwMDAwMDAwMDAwIHg2IDogZmZm
ZjgwMDAxMThjYmQ0OCAKWyAgIDMyLjk3ODkwMl0geDUgOiAwMDAwMDAwMGQ1MzAwMDAwIHg0IDog
ZmZmZjgwMDAxMTYzNTQxMCAKWyAgIDMyLjk4NDE5M10geDMgOiAwMDAwMDAwMGQ0MDAwMDAwIHgy
IDogMDAwMDAwMDAwMDAwMDAwMCAKWyAgIDMyLjk4OTQ4M10geDEgOiBmZmZmODAwMDExNjMyZjgw
IHgwIDogMDAwMDAwMDAyMDQwMDA4NSAKWyAgIDMyLjk5NDc3NV0gQ2FsbCB0cmFjZToKWyAgIDMy
Ljk5NzIxMl0gIGRvX3VuZGVmaW5zdHIrMHgyNmMvMHgzMjAKWyAgIDMzLjAwMDk0OV0gIGVsMV91
bmRlZisweDMwLzB4NTAKWyAgIDMzLjAwNDE2NF0gIGVsMV9zeW5jX2hhbmRsZXIrMHhjNC8weGUw
ClsgICAzMy4wMDc5ODNdICBlbDFfc3luYysweDg0LzB4MTQwClsgICAzMy4wMTExOTddICAweGZm
ZmY4MDAwMTMwMDQ4NjQKWyAgIDMzLjAxNDMyOF0gIGZsdXNoX3NtcF9jYWxsX2Z1bmN0aW9uX3F1
ZXVlKzB4ZjgvMHgyNjgKWyAgIDMzLjAxOTM1OV0gIGdlbmVyaWNfc21wX2NhbGxfZnVuY3Rpb25f
c2luZ2xlX2ludGVycnVwdCsweDE0LzB4MjAKWyAgIDMzLjAyNTQyNl0gIGlwaV9oYW5kbGVyKzB4
OGMvMHgxNTgKWyAgIDMzLjAyODkwMV0gIGhhbmRsZV9wZXJjcHVfZGV2aWRfZmFzdGVvaV9pcGkr
MHg3NC8weDg4ClsgICAzMy4wMzQwMjBdICBnZW5lcmljX2hhbmRsZV9pcnErMHgzMC8weDQ4Clsg
ICAzMy4wMzgwMTNdICBfX2hhbmRsZV9kb21haW5faXJxKzB4NjAvMHhiOApbICAgMzMuMDQyMDk0
XSAgZ2ljX2hhbmRsZV9pcnErMHg1OC8weDEyOApbICAgMzMuMDQ1ODI2XSAgZWwxX2lycSsweGM4
LzB4MTgwClsgICAzMy4wNDg5NTNdICBhcmNoX2NwdV9pZGxlKzB4MTgvMHgyOApbICAgMzMuMDUy
NTEyXSAgZGVmYXVsdF9pZGxlX2NhbGwrMHgyNC8weDVjClsgICAzMy4wNTY0MTldICBkb19pZGxl
KzB4MWVjLzB4Mjg4ClsgICAzMy4wNTk2MzFdICBjcHVfc3RhcnR1cF9lbnRyeSsweDI4LzB4NjgK
WyAgIDMzLjA2MzUzNl0gIHJlc3RfaW5pdCsweGQ4LzB4ZTgKWyAgIDMzLjA2Njc1M10gIGFyY2hf
Y2FsbF9yZXN0X2luaXQrMHgxMC8weDFjClsgICAzMy4wNzA4MzFdICBzdGFydF9rZXJuZWwrMHg0
YjAvMHg0ZTgKWyAgIDMzLjA3NDQ4MV0gQ29kZTogZjk0MDEzYjUgMTdmZmZmZjEgYTkwMjViYjUg
ZjkwMDFiYjcgKGQ0MjEwMDAwKSAKWyAgIDMzLjA4MDU1Nl0gLS0tWyBlbmQgdHJhY2UgNzM5MmI5
ODFhYTA2MmQwNiBdLS0tClsgICAzMy4wODUxNTNdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5n
OiBPb3BzIC0gQlVHOiBGYXRhbCBleGNlcHRpb24gaW4gaW50ZXJydXB0ClsgICAzMy4wOTI1MTld
IFNNUDogc3RvcHBpbmcgc2Vjb25kYXJ5IENQVXMKWyAgIDM0LjE4MDIwNV0gU01QOiBmYWlsZWQg
dG8gc3RvcCBzZWNvbmRhcnkgQ1BVcyAwLTEKWyAgIDM0LjE4NDk3M10gS2VybmVsIE9mZnNldDog
ZGlzYWJsZWQKWyAgIDM0LjE4ODQ0NV0gQ1BVIGZlYXR1cmVzOiAweDAwNDAwMjYsMmEwMGEyMzgK
WyAgIDM0LjE5MjY5NV0gTWVtb3J5IExpbWl0OiBub25lClsgICAzNC4xOTU3MzddIC0tLVsgZW5k
IEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBPb3BzIC0gQlVHOiBGYXRhbCBleGNlcHRpb24g
aW4gaW50ZXJydXB0IF0tLS0K
--0000000000000eeb0205dee30ae9--
