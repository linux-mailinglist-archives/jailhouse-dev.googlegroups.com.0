Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBPVBZWKAMGQE24JDR7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x40.google.com (mail-oa1-x40.google.com [IPv6:2001:4860:4864:20::40])
	by mail.lfdr.de (Postfix) with ESMTPS id E62065370A5
	for <lists+jailhouse-dev@lfdr.de>; Sun, 29 May 2022 12:54:02 +0200 (CEST)
Received: by mail-oa1-x40.google.com with SMTP id 586e51a60fabf-f1e78da1a9sf5426527fac.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 May 2022 03:54:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653821641; cv=pass;
        d=google.com; s=arc-20160816;
        b=NRcSL+Zy876G99yYYZRyQJ+mMohjC8vi20z0BD5E2mDZMl0TnCLcB6iA1asyiyS/2l
         M8fqlCKmyGmDp26DOe9QCBnd3J0Lw+RPkxpxZV2oB0OGfHpvKEhZyHd6j1NFx5bxFi5J
         Amd8FtkTD0eU6YmJmNuKYYRNznS6NrTNlDp9W6xRvY6rrcXZpkRFCJQ0t7ZfBbnONOgT
         TwM3nQNr/zV5V1kAExinyHoUUXb05evHDWSSZDahnuQ0tlbD4SpdzifBz/dQBuhqsPkp
         Li7sJiaf2AW8Qsn8CCaywXZWqk880h9c/WshZGzPzXn8iZpxRoNBOeC71EpCMvXiz47U
         na7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=CQE0KOf6qjaCsfvsevmmHZSmpWTu0bzLrL1i/HpY8dc=;
        b=EPGmRQtaYSm5z4Q0kW7z1CohEusgCiRzoWQpxDUuffOvgHCORnIbwatVBS5gPwSv8c
         oUo7RUu7GKKgjaQAWx6juCWe9PfTsI9QQFI8p5ygov6RHlWh64H9K9qjpuVFvsBPXqr5
         Gcg0YUmjpuAPawW+yULArjQXEQHoUSqCfEGPNdXId623jNNL4u/IcZGTo1sxUk/f/iXY
         WZKXZlmIXv3QVYB3ZHVK2aRkVShog3BSn/jICNEs6iB6y/NHdBFAroK9Ue6uvWgrc9bf
         vAf2AOtk11eZq1ovRxZ6DqU1UGIgXRW92RbVmiFxhIUbRams21nqaxV3qwjGcgzoQqbD
         Ty2Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=HfpJq72O;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1132 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CQE0KOf6qjaCsfvsevmmHZSmpWTu0bzLrL1i/HpY8dc=;
        b=djdIENBPGPcPxfp3ShcBFfQEqFOOKJw4VRIYHh5+P4akdINC2zk+MriFS+Kek4UqVM
         QKNTZUcQHiCLeKfqWjNSyE2znxg1Phctw6lg6wARW7Rq+l6H8v938sSKUp5BrxP+Uzci
         oKtuvQ61fghIbx2rFs0TDzvohw1qC0j82Jm3NDpe7UmgnPxEc1VwNtJWRMi9sG5Enk8D
         +6OxLwVVsIouPQfoa6/9GXdfAG7P0FXHbG1D7bHQy1j8/aRqhYmHVKTAR8waenTRCcTB
         oB6xhVhq3HXe8RRruNB3Pma8T+6hduW6aThrtYgiYtJka+M4qsabtxq9Jh1uA3DjjIET
         Hf7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CQE0KOf6qjaCsfvsevmmHZSmpWTu0bzLrL1i/HpY8dc=;
        b=D7qxad6HV5G5QZu7bzfdrYBbY6Oy6RAc8HiUIWPEc85UlAKMhay6VrsZnQlFgzleA1
         2iYTxiMLINtBObk5/Y5e7mlaz8mHPSOBRxTJync/nxWxh6HnfTx0ZFCsqgX+jXbhe4ao
         NeRQudFo+b7Eisyq2e1EITibKy5WoIQRkBCsGJ3o2lv4odt3GiHC02kGzzo5U4Csdt7i
         J2TbP+Iv1qIcM3I55qNuNNhjyF7YLE3iMehqjAEqtptddXo3BB8XJyQXNOcTGkZwO13A
         f7tqZlGtwus3m6DXSrgS5Adlc0FFRsOKo5Wz/FHAPKtg/d8sNYpjyF30vIOuzJ9oec6p
         adWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CQE0KOf6qjaCsfvsevmmHZSmpWTu0bzLrL1i/HpY8dc=;
        b=qDqRMcEbP64sYgaTEyCwVBT9fcQftl5/IotRLqVDinokQXjJmKJqbF2V4FzUZElqv0
         yzcXTGfZ+TzGHrWOgyEII0NCw9OSc1UXOs3K6Cjv9dpJaXkMRBCuNsCv0MoyGysw8mcG
         Uj1R3LBZA3gmA79cnTQo8kz9k5V31uEK9iKUuFey2pPTXqb0/d9p1SsxhA8hiPgHZnS7
         3kOrXRnCrvLRepPy0SFug4XW6qeC38/B/Ue4mGGA3OumCAP3EreANw7ugMGnOX40m1nj
         Nq/vj6KywVMgysi3u5h1N3ysKMA1dY2GF7VLlat1ioXJYyOlJtyPnFc0H5aCHqHj75Ag
         r9LQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532mTTfR66Iz0CWdV0NUU0VpEzm4iTeOgIC0dbsvP/t3yk4igogo
	quRSxKjhZB20BQe52y9Gu/E=
X-Google-Smtp-Source: ABdhPJzFZiqcB/3YXytkh9OjoEHc3NNK/DoBu/rHxtjPKdnicSxG4zAINsHP+aM6qp6gYTnnVcAs9A==
X-Received: by 2002:a05:6870:6191:b0:f2:dbca:cba with SMTP id a17-20020a056870619100b000f2dbca0cbamr7512958oah.267.1653821630957;
        Sun, 29 May 2022 03:53:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:1703:b0:322:76c2:8923 with SMTP id
 bc3-20020a056808170300b0032276c28923ls11637552oib.9.gmail; Sun, 29 May 2022
 03:53:50 -0700 (PDT)
X-Received: by 2002:aca:3945:0:b0:32b:3a61:35d6 with SMTP id g66-20020aca3945000000b0032b3a6135d6mr7358679oia.293.1653821630265;
        Sun, 29 May 2022 03:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653821630; cv=none;
        d=google.com; s=arc-20160816;
        b=JtGmUHxX/QaV/gjQpMnc0F0K0wmD5AsP/202klWyBvkzFxeiHkpAIDS1JYy6LDprEd
         j6VLeSVmLOaXw1x2pve6GdufNyh9T+SzVJNKerKLk/BQpa77JxtrGZq+HnYZ3YtPe9EF
         rDdiEF+7cm4jYVIKovcvdslklWWrsma78gkBLqBizkhAnb3p6C+UQKSw1vh8uDiZ9ig4
         cuFVRWxOQ1eE/OkXZPR0KQxReNOJfCYUQz6c6kf2tpKfecuRRQBhCxnGeFeuL9KNr+UT
         VvHlY1StqJUQyFkRHpdWILbmnUY8NlkECO5o1DMooL7V8TCQ8EiJXhNrWFoMJV1/60sB
         aNdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=r0R2d68/V4pM/EuAOjx3YTdu6vbp/oHZlIhkxMD1U+w=;
        b=uahm/eEpt5u/bTZk2lndyPwaHitIplmR6tX3dbtyq2I9QbPmO8tot8agoMdR522jM9
         JozJuGmoKkJ+F0efJ/fOFNmmy3Z1U4NvGlQMfVeG4c0jvRfEhQnUk+EV+NaFJSIqGRm9
         Znl87yDZ8EULP6YReKfCh0is7D6OqiRiLbc0OjOhtOpoEgsPfySXUmgp/WahdL+cZHmE
         /cMX3Vuh0UWNjxbZksGx7OJRy1M6GQAjUaJnPkiRqHLSgimew55D77wn/A4IwMa/H1hK
         WxAm67GYxW6jEIRTsicjl9cv54029GsV9sYLD/3Pb4w0fZ/U79w57FpSsZHH9tnbTJrJ
         h7yQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=HfpJq72O;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1132 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com. [2607:f8b0:4864:20::1132])
        by gmr-mx.google.com with ESMTPS id r17-20020a05687002d100b000ddbc266799si919343oaf.2.2022.05.29.03.53.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 May 2022 03:53:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1132 as permitted sender) client-ip=2607:f8b0:4864:20::1132;
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-300312ba5e2so85493277b3.0
        for <jailhouse-dev@googlegroups.com>; Sun, 29 May 2022 03:53:50 -0700 (PDT)
X-Received: by 2002:a0d:c101:0:b0:2ff:5824:e8a8 with SMTP id
 c1-20020a0dc101000000b002ff5824e8a8mr52689606ywd.413.1653821629802; Sun, 29
 May 2022 03:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <234b1a2d-ea25-e38c-5053-eea15f57b933@siemens.com> <CA+V-a8vUAEZUkbhhHEHKHzf-OhXqnfMkojP5o0nSEtgBdSbRQw@mail.gmail.com>
 <35cddc35-a563-ca93-8e29-b9ae06844030@siemens.com> <CA+V-a8uGOP49BWzY1bwprzLzhUXFjfqW6yD1c-LZN7i94mrzbQ@mail.gmail.com>
 <a87eb794-7dc1-f447-c13a-de600a48d59e@siemens.com> <CA+V-a8uBuBZb5z-HvuLF96jTtKLLKCt8nHmqKt4jtX9ninJAtw@mail.gmail.com>
 <eafaaed1-604f-569b-47f5-232b01cfcee5@siemens.com> <CA+V-a8vshtRo3Kot2xCVV=L+kySoP1XkOrc3U8tWXxLeCCb4Ow@mail.gmail.com>
 <385f8761-8d70-d0c4-f903-9adadb3c9a90@siemens.com> <CA+V-a8uGNUis=XLwewkePUTUDrJp0QBfgkaOMf=8KvPJh4pW_A@mail.gmail.com>
 <CA+V-a8uA+y-p5GmYavLpc6s1O-TJiRGSkpRHM4-dEA=XsqU_mA@mail.gmail.com>
 <5172e723-49ce-a870-2066-d22f44115da3@siemens.com> <CA+V-a8vxVLxV8iog0-JUH-Bd4nnCj5ELYkd_SkDDmPuKOAiJKg@mail.gmail.com>
 <dd337a1c-d678-7c7b-d371-f8bd2b019c28@web.de> <CA+V-a8uMOW2PopUbMhaOmCs-RZWqzOJcC3zXOToF2pWSs_=O5w@mail.gmail.com>
 <1a407933-180e-48fa-760c-1c90e159eb2f@web.de>
In-Reply-To: <1a407933-180e-48fa-760c-1c90e159eb2f@web.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 29 May 2022 11:53:23 +0100
Message-ID: <CA+V-a8sFJc+uFp+n6G+fUFNX1u6oDwbG4Ge=+2yrhoh8FQ-UfQ@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@web.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=HfpJq72O;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::1132 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Sun, May 29, 2022 at 9:35 AM Jan Kiszka <jan.kiszka@web.de> wrote:
>
> On 28.05.22 21:13, Lad, Prabhakar wrote:
> > Hi Jan,
> >
> > On Sat, May 28, 2022 at 3:41 PM Jan Kiszka <jan.kiszka@web.de> wrote:
> >>
> >> On 28.05.22 15:22, Lad, Prabhakar wrote:
> >>> On Fri, May 27, 2022 at 6:07 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>
> >>>> If that should be the case, you could use the JTAG to "trace" how far
> >>>> you get: Add an infinite loop at some point the setup should get along,
> >>>> and then check with the debugger if PC points to that address and if EL2
> >>>> is active. With that, you could also check if the UART print-out is
> >>>> executed.
> >>>>
> >>> After tracing back I see it's looping infinitely somewhere in the
> >>> hypervisor.o file, below is the code where it repeatedly loops.
> >>>
> >>>     ffffc0209550:    b9400680     ldr    w0, [x20, #4]
> >>>     ffffc0209554:    b9403481     ldr    w1, [x4, #52]
> >>>     ffffc0209558:    6b00003f     cmp    w1, w0
> >>>     ffffc020955c:    540013a8     b.hi    ffffc02097d0 <entry+0x2d8>
> >>>     .....
> >>>     ffffc02097d0:    17ffff60     b    ffffc0209550 <entry+0x58>
> >>>
> >>> I haven't managed to find where exactly in the C file this is
> >>> happening yet. Any thoughts on what could be happening?
> >>>
> >>
> >> That's very likely
> >>
> >> while (entered_cpus < hypervisor_header.online_cpus)
> >>         cpu_relax();
> >>
> > Thanks for the pointer really appreciated.
> >
> >> Did you configure more CPUs than there are in the system?
> >>
> > No I haven't, I've set it up as cpus = 0x3f for 6 CPUs (2xa57 +
> > 4xa53). I don't know what was happening there when I removed the
> > infinite loop (which I used for break point) from entry.S that went
> > OK. There was also an issue with the debug uart driver which I've
> > fixed and able to get the prints now.
> >
> > So now moving forward I am seeing "Unhandled data read"!
> >
> > Looking at the address for Unhandled data read one belongs to GIC
> > (0xf102f00c) and the other one belongs to the debug uart (0xe6e88008).
>
> Regarding GICC access: Try setting gicc_base to 0xf102f000 in the root
> cell config.
>
Setting gicc_base to 0xf102f000 has solved the issue, I no longer get
unhandled data reads now.

> Regarding the UART: Do you pass that address through to the root cell as
> well? It's generally fine to allow both hypervisor and one cell to
> access the UART in parallel. Otherwise, disable UART usage by the root
> cell prior to enabling Jailhouse.
>
No, I don't pass the UART address to the root cell as part of
mem_regions. I just have it as part of the header config as below:

        .debug_console = {
            .address = 0xe6e88000,
            .size = 0x40,
            .type = JAILHOUSE_CON_TYPE_SCIFA,
            .flags = JAILHOUSE_CON_ACCESS_MMIO |
                 JAILHOUSE_CON_REGDIST_4,
        },

By disabling the UART usage by the root cell did you mean to use
JAILHOUSE_CON_TYPE_NONE? I tried adding JAILHOUSE_CON_TYPE_NONE but I
don't get anything on the console after enabling the root cell. I even
tried removing the entire debug_console{} from the root cell config
but still I don't see any output on console.

If I update the size to 0x1000 as below and also include it as part of
mem_regions, I get to a state where I see the message "The Jailhouse
is opening" but the console seems to be frozen.

        .debug_console = {
            .address = 0xe6e88000,
            .size = 0x1000,
            .type = JAILHOUSE_CON_TYPE_SCIFA,
            .flags = JAILHOUSE_CON_ACCESS_MMIO |
                 JAILHOUSE_CON_REGDIST_4,
        },
mem_region
        /* SCIF2 */ {
            .phys_start = 0xe6e88000,
            .virt_start = 0xe6e88000,
            .size = 0x1000,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_IO,
        },

root@hihope-rzg2m:~# insmod jailhouse.ko
[   44.675861] jailhouse: loading out-of-tree module taints kernel.
root@hihope-rzg2m:~#
root@hihope-rzg2m:~#
root@hihope-rzg2m:~# jailhouse enable renesas-r8a774a1.cell
[   47.850761] entering.

Initializing Jailhouse hypervisor v0.12 (318-gcc2122a6-dirty) on CPU 2
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 53/4063, remap 0/131072
Initializing processors:
 CPU 2... OK
 CPU 1... OK
 CPU 0... OK
 CPU 5... OK
 CPU 3... OK
 CPU 4... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU v3
Initializing unit: ARM SMMU
Initializing unit: PVU IOMMU
Initializing unit: PCI
Page pool usage after late setup: mem 83/4063, remap 5/131072
Activating hypervisor
[   47.900641] exitt.
[   47.903468] The Jailhouse is opening.

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8sFJc%2BuFp%2Bn6G%2BfUFNX1u6oDwbG4Ge%3D%2B2yrhoh8FQ-UfQ%40mail.gmail.com.
