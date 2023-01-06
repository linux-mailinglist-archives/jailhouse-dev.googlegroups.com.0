Return-Path: <jailhouse-dev+bncBDWL7NVN6MHRBDUD4GOQMGQE3LWV6RY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E40D66039D
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Jan 2023 16:43:14 +0100 (CET)
Received: by mail-ej1-x63f.google.com with SMTP id xj11-20020a170906db0b00b0077b6ecb23fcsf1379234ejb.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Jan 2023 07:43:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673019791; cv=pass;
        d=google.com; s=arc-20160816;
        b=tErjHumUapuoZweBgC15poz5jEgN4Og9xHf5I/M2BkPrXhuUgyG87GxxRFwBOFVogk
         WO7ixtPFneuB4rYO6MnKdVDzh6tKfQAjrZs6Vnr4qV5PrdTrW8elwmEknjodD81b5t26
         am+LbIiKhsayTEEFxYq8kYiUbcctD42q6NaoWyNKxn6H74dmc+V2O2pS0M+sTa5VFvsi
         /r/bdtlHV6fjOGGjqXDJPqNxqZeLhlSO2dJb25Br20qoJLS2CPuhVjbh2b3JHT0yerMI
         VZ8OllwoRAwQRlzsFnz/z6pb74fDj9mKLVBEDI1v79/kqaaIO0g45ZfK4tMd69hUVNrJ
         eC9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=qT3o2wGuJAxStA+rHWOkjZmTt0c5gsI/95zUDH285KQ=;
        b=t+dgvOf0j1hpeauGbDtxmEoykG0rGDlZ2BSuluPI3xNyvA5nCsAHDiKc+T2J/Ro2PO
         k7lZcWBWU57L5cVlOFVXuvEiXCggce0g3xMBT3LyOA4VYTKg+BI/00wZvsXrNKlE5+za
         65xUmERvo29SeXqW/Z790PTOeodVs68Y0EvrTaTCZ0+HTO1heisvhAZq/1orI4OyNw0L
         b7TRm5LnqRn3N1y9shFtxRNMN7oqCxo6EO4kOY+SS4icYy1w7rQc/6aqMHDuVY70I6bv
         5Pg5GZ+I+WMQ6bXQ/h6BX5uSAlw5QDUtFOMjdzzhgbcb08QuRTfr92iHtDex9OpGSHkx
         XYag==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=CbhBIctQ;
       spf=pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::329 as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qT3o2wGuJAxStA+rHWOkjZmTt0c5gsI/95zUDH285KQ=;
        b=o5ZwIRV+Au2uf6lxPF/h2SRCoE1E3MeLYMNEana/ZCje1NNe7f5d9T/vLXed91Gs/O
         BF64f6Lr1l7EFuVdkcjss7lKqhK+uLMxw0CG4QTc0mJTP4Ez1tEXBIoAJm5+7nd1B6k3
         i8PgMn+xnssPAiW/hGB3ka5W7hg3FdmhQwzwyNNrhna7FBTyYzVUv2K3IlFqGMk3Ohu1
         ZH0juPySN/mQIJXxiUAVvg6lffs6cm1AU6lgmOV37UTtzKQEv8pUgazVxCgyah5l73gl
         2sVe+D/Je/xOsAhWthZVXcl9yqWdz0BeCdTbaajo7kTCFEbUXbYgrk8Ko6yx2ZcX3qU5
         d5Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qT3o2wGuJAxStA+rHWOkjZmTt0c5gsI/95zUDH285KQ=;
        b=NG5z21b8pNRSuV7eLxKJzryFvcqmY7x7xhml9dCdXWI/KLmc9qktJ+TakDYUgO79VH
         WTi/MHs35AAXvdSoMtAbJgxOxJUrlpk62I6W0MWzluW+h5TcxODp/y6d3EzAh4mqKYAr
         LIW40od3KroH76Y2d7yFTV6nj7PYULkD3ksxiPjmorBhUyX/VHivLrtpJbWL9kT0AqoL
         IzL6Y/jlW5VOgKCSSWZa0zwIX+QPl1zD2eEU5F81Nbm2vAznZV+cbTPDq2ZBwPxDL6KM
         NHruH/6t1SX03ByRB2TH4eSZFA2PyDBWINW9SSUapqKsnzNd9f6ZiD7IVbmljrndIU/I
         nq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qT3o2wGuJAxStA+rHWOkjZmTt0c5gsI/95zUDH285KQ=;
        b=x+qLthI+PsWAaQCzwWRrviH9O3CTeiQAs6zH80DUXNyv5bE1WcP5DkxDI91f+c0lKc
         PgRofgXr2E+MCN36OImWkEWj/5d63X0vo1arW4yfbN+A7/V4N71THjzOu+D6kx7YVM9p
         ZCdK2YL6oc4cKhmA+gwUMTPXzjNqIcPq0ujb3Eb+nze2gSK4UETrerzP60zL5heRKMiu
         NdKWLdg5mwW4mrdAy6GCNdAB8cbsUO0DsA6oD8sBVnmXjw+DJwTR6cXOMtf1mq4QkEYH
         APk9RV+2uJ+qT4/1VxSWEJ8p7xlsX9rC+/uRu0vibIlqyNkY41Hhj0ANxrsci9UMfZFa
         YkeQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2koeolPlD2dHyCCCNGx4QSdLOIBusq5G8mXIZ+CT3EJBKGNMpiFD
	mX5MYYhTm/v44ePLb8P2cEY=
X-Google-Smtp-Source: AMrXdXvRfm56NWUd4BJas7WsMfhiWWTAN7vsKvh/F9+/Ih4yelXkeFRXex/tu6UyJS5JjFLHamym3w==
X-Received: by 2002:a05:6402:204c:b0:495:7ff9:7682 with SMTP id bc12-20020a056402204c00b004957ff97682mr380437edb.407.1673019791513;
        Fri, 06 Jan 2023 07:43:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:34c9:b0:488:1679:c417 with SMTP id
 w9-20020a05640234c900b004881679c417ls4693348edc.1.-pod-prod-gmail; Fri, 06
 Jan 2023 07:43:09 -0800 (PST)
X-Received: by 2002:aa7:cf94:0:b0:45c:834b:eb59 with SMTP id z20-20020aa7cf94000000b0045c834beb59mr59720403edx.36.1673019789582;
        Fri, 06 Jan 2023 07:43:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673019789; cv=none;
        d=google.com; s=arc-20160816;
        b=YwRBXgNf3huKxcj3EsA1zTV9pwbHzTo15h9Ls6lq/Kl52iAbCG4GQRv1rLYnFNifxl
         aN3H9DzW3XfacKKVLNj5kCiuW56nHoNaTPYaWgMo7SeKW8x/NEFhurTU9/3YZpN5+Pmp
         HDZezdMrAQBT5kYjA5VlqS1wl1R2zAEkj+0p6uepASAOnusJykpW8PJFzyGXwSTOlUWA
         kM0JvbI69WyiHQ1qq4bnZkeWOuQg2Ue0dFeqMlMNfRWwcEdj9PU+CL8VZ0OpkCyOOQbf
         7Z8Mstuh2x8fh9QfutH+BVoj5bBQMYdggQTqmwgLw1bpEUrRUwNDt+9WEaKO0jKQM7YB
         lWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=woUemlAlsbXTWvaQOd4EuiwbfRzFTjAUmOL827twrm0=;
        b=GJ8HNQtF6gIeladomwX/8DcuxErQGGRcwkToX4ewaGnNMFwnDkwmj304XnFBRkg2Qp
         Qg5iDm7PZt2uE5rf1L3h6fD4fYoWIfNFvM8lpEszaGurmPMT/CWrA9xTZUyeOw00rfQP
         PgZrqfhwrazgNHEN76UnVMYr3wX9D/FsFsmMrtakDWsbb+dM4Y2dbAOctuQ5cdUhohag
         syveBGEcC5tKkbYZsl47TvavpfeWTdGi/ySNERHnx2X1GXQhlEfn/xGy6cG+rjQh26vH
         r7g8bH8pKWC35yQvnItyvWhE5ulRkipjBTHH6a6YYbLIhhLb+uQT+az1+0k80okvQUpV
         cd0Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=CbhBIctQ;
       spf=pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::329 as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com. [2a00:1450:4864:20::329])
        by gmr-mx.google.com with ESMTPS id l25-20020aa7c319000000b0048ecd372fccsi75309edq.5.2023.01.06.07.43.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 07:43:09 -0800 (PST)
Received-SPF: pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::329 as permitted sender) client-ip=2a00:1450:4864:20::329;
Received: by mail-wm1-x329.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso1330208wmp.3
        for <jailhouse-dev@googlegroups.com>; Fri, 06 Jan 2023 07:43:09 -0800 (PST)
X-Received: by 2002:a05:600c:12d6:b0:3cf:88c3:d010 with SMTP id
 v22-20020a05600c12d600b003cf88c3d010mr2755783wmd.180.1673019788472; Fri, 06
 Jan 2023 07:43:08 -0800 (PST)
MIME-Version: 1.0
References: <bfb4732c-21e8-4a5d-8a0d-382041e7554cn@googlegroups.com>
 <3071214a-b5a8-4096-8ad4-3a79b6634de5@siemens.com> <CAP8Rr63c3LS3Z_OU201aSokZ8NCUdoeXeAMGZ=Qu4d-TMV+wVQ@mail.gmail.com>
 <990aa280-3365-429b-cd73-d1b89b0b4a83@siemens.com> <CAP8Rr619HSJUVs3GTLBzP=r_4_svq8yvbP5JAADjWK2dwoLLZg@mail.gmail.com>
 <e9acd20c-b3cb-4887-788a-266534ab5a19@siemens.com> <CAP8Rr628BM-8rQR+K4gw2GFPHZZXgVvbtdNF90fpyXU9Nxsx1A@mail.gmail.com>
 <CAP8Rr619qqqSCc0QBBzet2DfL10B0axK_2s0Pohb6p_JqrBxqg@mail.gmail.com>
 <82959f20-2de7-5d7b-ce9b-cb8aa1476c32@siemens.com> <a4c03581-e791-6448-92be-c51e896be4bd@oth-regensburg.de>
 <CAP8Rr63GpSabsH1hfq-0TqUPrzT735PyE4EUUu12-wxc6YOZsg@mail.gmail.com>
 <369cc253-8606-476b-a8d7-38ed11beaa2fn@googlegroups.com> <56643ee7-2f74-39a2-dfa7-ad2abf603bd5@oth-regensburg.de>
In-Reply-To: <56643ee7-2f74-39a2-dfa7-ad2abf603bd5@oth-regensburg.de>
From: Tommi Parkkila <tommi.parkkila@gmail.com>
Date: Fri, 6 Jan 2023 10:42:57 -0500
Message-ID: <CAP8Rr63YNKfgZ-yN2CaimBAsbFE-3VdA1+KEH40kpi4h0A3=SQ@mail.gmail.com>
Subject: Re: STM32MP1 hangs on when entering hypervisor
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="00000000000031b6e005f19a4689"
X-Original-Sender: Tommi.Parkkila@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=CbhBIctQ;       spf=pass
 (google.com: domain of tommi.parkkila@gmail.com designates
 2a00:1450:4864:20::329 as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
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

--00000000000031b6e005f19a4689
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ralf - here is the root cell configuration:

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Test configuration for Banana Pi board (A20 dual-core Cortex-A7, 1G RAM)
 * https://banana-pi.org/en/banana-pi-sbcs/4.html
 * Copyright (c) Siemens AG, 2014
 *
 * Authors:
 *  Jan Kiszka <jan.kiszka@siemens.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 *  THIS IS A JAILHOUSE ROOT CELL CONFIGURATION FILE FOR STM32MP157
 *  -   BASED ON BANANA PI EXAMPLE FROM JAILHOUSE REPO (A20 Dual Core
Cortex-A7,
 *      -   A20 UserManual:
https://github.com/allwinner-zh/documents/raw/master/A20/A20_User_Manual_v1=
.4_20150510.pdf
 *      -   A20 DataSheet:
https://github.com/allwinner-zh/documents/raw/master/A20/A20_Datasheet_v1.5=
_20150510.pdf
 *  -   WORK IN PROGRESS
 *      -   STM32MP157 REF Manual:
https://www.st.com/resource/en/reference_manual/DM00327659-.pdf
 *          -   Memory map on page 158
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
struct jailhouse_system header;
__u64 cpus[1];
// struct jailhouse_memory mem_regions[127];
struct jailhouse_memory mem_regions[131];
struct jailhouse_irqchip irqchips[1];
} __attribute__((packed)) config =3D {
.header =3D {
.signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
.revision =3D JAILHOUSE_CONFIG_REVISION,
.flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
.hypervisor_memory =3D {
             /* STM32MP157 */
.phys_start =3D 0xF7000000,
.size =3D 0x0600000,
},
.debug_console =3D {
/* UART-4 STM32MP157 */
.address =3D 0x40010000,
.size =3D 0x400,
/* .clock_reg =3D 0x01c2006c, */
/* .gate_nr =3D 16 */
/* .divider =3D 0x0d, */
.type =3D JAILHOUSE_CON_TYPE_STM32H7,
.flags =3D JAILHOUSE_CON_ACCESS_MMIO |
JAILHOUSE_CON_REGDIST_4,
},
.platform_info =3D {
.arm =3D {
                /* STM32MP157 */
.gic_version =3D 2,
.gicd_base =3D 0xA0021000, /// Distributor
.gicc_base =3D 0xA0022000, /// CPU
.gich_base =3D 0xA0024000, /// Hypervisor
.gicv_base =3D 0xA0026000, /// Virtual CPU
.maintenance_irq =3D 25,
},
},
.root_cell =3D {
.name =3D "STM32MP1-Root",

.cpu_set_size =3D sizeof(config.cpus),
.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
.num_irqchips =3D ARRAY_SIZE(config.irqchips),
},
},

/* STM32MP157 */
.cpus =3D {
0x3,
},
.mem_regions =3D {
/* IVSHMEM shared memory region - STM32MP157 */
/* - This macro creates four shared memory regions with a total size of
0x100000 (1M), see cell-config.h*/
/* - Created and reserved a continous memory region in kernel device tree
for this one as well. */
/* - Placed the memory region before hypervisor region. */
//JAILHOUSE_SHMEM_NET_REGIONS(0xfdf00000, 0),
// /* SPI */ {
// .phys_start =3D 0x01c05000,
// .virt_start =3D 0x01c05000,
// .size =3D 0x00001000,
// .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
// JAILHOUSE_MEM_IO,
// },

/**************************************************************************=
*/
/****************************** DDR
******************************/
/************************* 0xC0000000 - 0xFFFFFFFF
*************************/
/**************************************************************************=
*/
/* RAM1 - STM32MP157 */ {
.phys_start =3D 0xC0000000,
.virt_start =3D 0xC0000000,
.size =3D 0x36A00000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_EXECUTE,
},
/* JAILHOUSE INMATE LOCATED AT 0xf6a00000 - 0xf7000000*/
/* JAILHOUSE LOCATED AT 0xf7000000 - 0xF7600000*/
/* RAM2 - STM32MP157 */ {
.phys_start =3D 0xF7600000,
.virt_start =3D 0xF7600000,
.size =3D 0x9A00000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_EXECUTE,
},

/**************************************************************************=
*/
/****************************** PERIPHERALS 2
******************************/
/************************* 0x50000000 - 0x60000000
*************************/
/**************************************************************************=
*/
/* TAMP - STM32MP157 */ {
.phys_start =3D 0x5C00A000,
.virt_start =3D 0x5C00A000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* I2C6 - STM32MP157 */ {
.phys_start =3D 0x5C009000,
.virt_start =3D 0x5C009000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* STGENC - STM32MP157 */ {
.phys_start =3D 0x5C008000,
.virt_start =3D 0x5C008000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* ETZPC - STM32MP157 */ {
.phys_start =3D 0x5C007000,
.virt_start =3D 0x5C007000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* TZC - STM32MP157 */ {
.phys_start =3D 0x5C006000,
.virt_start =3D 0x5C006000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* BSEC - STM32MP157 */ {
.phys_start =3D 0x5C005000,
.virt_start =3D 0x5C005000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* RTC - STM32MP157 */ {
.phys_start =3D 0x5C004000,
.virt_start =3D 0x5C004000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* IWDG1 - STM32MP157 */ {
.phys_start =3D 0x5C003000,
.virt_start =3D 0x5C003000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* I2C4 - STM32MP157 */ {
.phys_start =3D 0x5C002000,
.virt_start =3D 0x5C002000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* SPI6 - STM32MP157 */ {
.phys_start =3D 0x5C001000,
.virt_start =3D 0x5C001000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* USART1 - STM32MP157 */ {
.phys_start =3D 0x5C000000,
.virt_start =3D 0x5C000000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* DDRPERFM - STM32MP157 */ {
.phys_start =3D 0x5A007000,
.virt_start =3D 0x5A007000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* USBPHYC - STM32MP157 */ {
.phys_start =3D 0x5A006000,
.virt_start =3D 0x5A006000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* STGENR - STM32MP157 */ {
.phys_start =3D 0x5A005000,
.virt_start =3D 0x5A005000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* DDRPHYC - STM32MP157 */ {
.phys_start =3D 0x5A004000,
.virt_start =3D 0x5A004000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* DDRCTRL - STM32MP157 */ {
.phys_start =3D 0x5A003000,
.virt_start =3D 0x5A003000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* IWDG2 - STM32MP157 */ {
.phys_start =3D 0x5A002000,
.virt_start =3D 0x5A002000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,
},
/* LTDC - STM32MP157 */ {
.phys_start =3D 0x5A001000,
.virt_start =3D 0x5A001000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* DSI - STM32MP157 */ {
.phys_start =3D 0x5A000000,
.virt_start =3D 0x5A000000,
.size =3D 0x800,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* GPU - STM32MP157 */ {
.phys_start =3D 0x59000000,
.virt_start =3D 0x59000000,
.size =3D 0x40000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* USBH_EHCI - STM32MP157 */ {
.phys_start =3D 0x5800D000,
.virt_start =3D 0x5800D000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* USBH_OHCI - STM32MP157 */ {
.phys_start =3D 0x5800C000,
.virt_start =3D 0x5800C000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* ETH1 - STM32MP157 */ {
.phys_start =3D 0x5800A000,
.virt_start =3D 0x5800A000,
.size =3D 0x2000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* CRC1 - STM32MP157 */ {
.phys_start =3D 0x58009000,
.virt_start =3D 0x58009000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* DLYBSD2 - STM32MP157 */ {
.phys_start =3D 0x58008000,
.virt_start =3D 0x58008000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* SDMMC2 - STM32MP157 */ {
.phys_start =3D 0x58007000,
.virt_start =3D 0x58007000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* DLYBSD1 - STM32MP157 */ {
.phys_start =3D 0x58006000,
.virt_start =3D 0x58006000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* SDMMC1 - STM32MP157 */ {
.phys_start =3D 0x58005000,
.virt_start =3D 0x58005000,
.size =3D 0x00001000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* DLYBQS - STM32MP157 */ {
.phys_start =3D 0x58004000,
.virt_start =3D 0x58004000,
.size =3D 0x00001000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* QUADSPI - STM32MP157 */ {
.phys_start =3D 0x58003000,
.virt_start =3D 0x58003000,
.size =3D 0x00001000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* FMC (NOR/PSRAM/NAND) - STM32MP157 */ {
.phys_start =3D 0x58002000,
.virt_start =3D 0x58002000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* MDMA - STM32MP157 */ {
.phys_start =3D 0x58000000,
.virt_start =3D 0x58000000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,
},
/* AXIMC - STM32MP157 */ {
.phys_start =3D 0x57000000,
.virt_start =3D 0x57000000,
.size =3D 0x100000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* GPIOZ - STM32MP157 */ {
.phys_start =3D 0x54004000,
.virt_start =3D 0x54004000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
},
/* RNG1 - STM32MP157 */ {
.phys_start =3D 0x54003000,
.virt_start =3D 0x54003000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* HASH1 - STM32MP157 */ {
.phys_start =3D 0x54002000,
.virt_start =3D 0x54002000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/*  CRYP1 - STM32MP157 */ {
.phys_start =3D 0x54001000,
.virt_start =3D 0x54001000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/*  BKPSRAM - STM32MP157 */ {
.phys_start =3D 0x54000000,
.virt_start =3D 0x54000000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/*  HDP - STM32MP157 */ {
.phys_start =3D 0x5002A000,
.virt_start =3D 0x5002A000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/*  DTS - STM32MP157 */ {
.phys_start =3D 0x50028000,
.virt_start =3D 0x50028000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/*  SAI4 - STM32MP157 */ {
.phys_start =3D 0x50027000,
.virt_start =3D 0x50027000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/*  VREFBUF - STM32MP157 */ {
.phys_start =3D 0x50025000,
.virt_start =3D 0x50025000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/*  LPTIM5 - STM32MP157 */ {
.phys_start =3D 0x50024000,
.virt_start =3D 0x50024000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/*  LPTIM4 - STM32MP157 */ {
.phys_start =3D 0x50023000,
.virt_start =3D 0x50023000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/*  LPTIM3 - STM32MP157 */ {
.phys_start =3D 0x50022000,
.virt_start =3D 0x50022000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/*  LPTIM2 - STM32MP157 */ {
.phys_start =3D 0x50021000,
.virt_start =3D 0x50021000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/*  SYSCFG - STM32MP157 */ {
.phys_start =3D 0x50020000,
.virt_start =3D 0x50020000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/*  EXTI - STM32MP157 */ {
.phys_start =3D 0x5000D000,
.virt_start =3D 0x5000D000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,
},
/* GPIOK - STM32MP157 */ {
.phys_start =3D 0x5000C000,
.virt_start =3D 0x5000C000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
},
/* GPIOJ - STM32MP157 */ {
.phys_start =3D 0x5000B000,
.virt_start =3D 0x5000B000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
},
/* GPIOI - STM32MP157 */ {
.phys_start =3D 0x5000A000,
.virt_start =3D 0x5000A000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
},
/* GPIOH - STM32MP157 */ {
.phys_start =3D 0x50009000,
.virt_start =3D 0x50009000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
},
/* GPIOG - STM32MP157 */ {
.phys_start =3D 0x50008000,
.virt_start =3D 0x50008000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
},
/* GPIOF - STM32MP157 */ {
.phys_start =3D 0x50007000,
.virt_start =3D 0x50007000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
},
/* GPIOE - STM32MP157 */ {
.phys_start =3D 0x50006000,
.virt_start =3D 0x50006000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
},
/* GPIOD - STM32MP157 */ {
.phys_start =3D 0x50005000,
.virt_start =3D 0x50005000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
},
/* GPIOC - STM32MP157 */ {
.phys_start =3D 0x50004000,
.virt_start =3D 0x50004000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
},
/* GPIOB - STM32MP157 */ {
.phys_start =3D 0x50003000,
.virt_start =3D 0x50003000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
},
/* GPIOA - STM32MP157 */ {
.phys_start =3D 0x50002000,
.virt_start =3D 0x50002000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
},
/* PWR - STM32MP157 */ {
.phys_start =3D 0x50001000,
.virt_start =3D 0x50001000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,
},
/* RCC - STM32MP157 */ {
.phys_start =3D 0x50000000,
.virt_start =3D 0x50000000,
.size =3D 0x1000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},

/**************************************************************************=
*/
/****************************** PERIPHERALS 1
******************************/
/************************* 0x40000000 - 0x50000000
*************************/
/**************************************************************************=
*/
/* DCMI - STM32MP157 */ {
.phys_start =3D 0x4C006000,
.virt_start =3D 0x4C006000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* CRYP2 - STM32MP157 */ {
.phys_start =3D 0x4C005000,
.virt_start =3D 0x4C005000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* CRC2 - STM32MP157 */ {
.phys_start =3D 0x4C004000,
.virt_start =3D 0x4C004000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* RNG2 - STM32MP157 */ {
.phys_start =3D 0x4C003000,
.virt_start =3D 0x4C003000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* HASH2 - STM32MP157 */ {
.phys_start =3D 0x4C002000,
.virt_start =3D 0x4C002000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* IPCC - STM32MP157 */ {
.phys_start =3D 0x4C001000,
.virt_start =3D 0x4C001000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* HSEM - STM32MP157 */ {
.phys_start =3D 0x4C000000,
.virt_start =3D 0x4C000000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* OTG - STM32MP157 */ {
.phys_start =3D 0x49000000,
.virt_start =3D 0x49000000,
.size =3D 0x40000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
},
/* DLYBSD3 - STM32MP157 */ {
.phys_start =3D 0x48005000,
.virt_start =3D 0x48005000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* SDMMC3 - STM32MP157 */ {
.phys_start =3D 0x48004000,
.virt_start =3D 0x48004000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* ADC12 - STM32MP157 */ {
.phys_start =3D 0x48003000,
.virt_start =3D 0x48003000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
},
/* DMAMUX1 - STM32MP157 */ {
.phys_start =3D 0x48002000,
.virt_start =3D 0x48002000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,
},
/* DMA2 - STM32MP157 */ {
.phys_start =3D 0x48001000,
.virt_start =3D 0x48001000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* DMA1 - STM32MP157 */ {
.phys_start =3D 0x48000000,
.virt_start =3D 0x48000000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* CANSRAM - STM32MP157 */ {
.phys_start =3D 0x44011000,
.virt_start =3D 0x44011000,
.size =3D 0x2800,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* CCU - STM32MP157 */ {
.phys_start =3D 0x44010000,
.virt_start =3D 0x44010000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* FDCAN2 - STM32MP157 */ {
.phys_start =3D 0x4400F000,
.virt_start =3D 0x4400F000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* FDCAN1 - STM32MP157 */ {
.phys_start =3D 0x4400E000,
.virt_start =3D 0x4400E000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* DFSDM1 - STM32MP157 */ {
.phys_start =3D 0x4400D000,
.virt_start =3D 0x4400D000,
.size =3D 0x800,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* SAI3 - STM32MP157 */ {
.phys_start =3D 0x4400C000,
.virt_start =3D 0x4400C000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* SAI2 - STM32MP157 */ {
.phys_start =3D 0x4400B000,
.virt_start =3D 0x4400B000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* SAI1 - STM32MP157 */ {
.phys_start =3D 0x4400A000,
.virt_start =3D 0x4400A000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* SPI5 - STM32MP157 */ {
.phys_start =3D 0x44009000,
.virt_start =3D 0x44009000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* TIM17 - STM32MP157 */ {
.phys_start =3D 0x44008000,
.virt_start =3D 0x44008000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* TIM16 - STM32MP157 */ {
.phys_start =3D 0x44007000,
.virt_start =3D 0x44007000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* TIM15 - STM32MP157 */ {
.phys_start =3D 0x44006000,
.virt_start =3D 0x44006000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* SPI4 - STM32MP157 */ {
.phys_start =3D 0x44005000,
.virt_start =3D 0x44005000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* SPI1 - STM32MP157 */ {
.phys_start =3D 0x44004000,
.virt_start =3D 0x44004000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* USART6 - STM32MP157 */ {
.phys_start =3D 0x44003000,
.virt_start =3D 0x44003000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* TIM 8 - STM32MP157 */ {
.phys_start =3D 0x44001000,
.virt_start =3D 0x44001000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* TIM 1 - STM32MP157 */ {
.phys_start =3D 0x44000000,
.virt_start =3D 0x44000000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* MDIOS - STM32MP157 */ {
.phys_start =3D 0x4001C000,
.virt_start =3D 0x4001C000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* UART8 - STM32MP157 */ {
.phys_start =3D 0x40019000,
.virt_start =3D 0x40019000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* UART7 - STM32MP157 */ {
.phys_start =3D 0x40018000,
.virt_start =3D 0x40018000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* DAC1 - STM32MP157 */ {
.phys_start =3D 0x40017000,
.virt_start =3D 0x40017000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* CEC - STM32MP157 */ {
.phys_start =3D 0x40016000,
.virt_start =3D 0x40016000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* I2C5 - STM32MP157 */ {
.phys_start =3D 0x40015000,
.virt_start =3D 0x40015000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* I2C3 - STM32MP157 */ {
.phys_start =3D 0x40014000,
.virt_start =3D 0x40014000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* I2C2 - STM32MP157 */ {
.phys_start =3D 0x40013000,
.virt_start =3D 0x40013000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* I2C1 - STM32MP157 */ {
.phys_start =3D 0x40012000,
.virt_start =3D 0x40012000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* UART5 - STM32MP157 */ {
.phys_start =3D 0x40011000,
.virt_start =3D 0x40011000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* UART4 - STM32MP157 */ {
.phys_start =3D 0x40010000,
.virt_start =3D 0x40010000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* USART3 - STM32MP157 */ {
.phys_start =3D 0x4000F000,
.virt_start =3D 0x4000F000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* USART2 - STM32MP157 */ {
.phys_start =3D 0x4000E000,
.virt_start =3D 0x4000E000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO_32,
},
/* SPDIFRX - STM32MP157 */ {
.phys_start =3D 0x4000D000,
.virt_start =3D 0x4000D000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* SPI3 - STM32MP157 */ {
.phys_start =3D 0x4000C000,
.virt_start =3D 0x4000C000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* SPI2 - STM32MP157 */ {
.phys_start =3D 0x4000B000,
.virt_start =3D 0x4000B000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* WWDG1 - STM32MP157 */ {
.phys_start =3D 0x4000A000,
.virt_start =3D 0x4000A000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* LPTIM1 - STM32MP157 */ {
.phys_start =3D 0x40009000,
.virt_start =3D 0x40009000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* TIM14 - STM32MP157 */ {
.phys_start =3D 0x40008000,
.virt_start =3D 0x40008000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* TIM13 - STM32MP157 */ {
.phys_start =3D 0x40007000,
.virt_start =3D 0x40007000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* TIM12 - STM32MP157 */ {
.phys_start =3D 0x40006000,
.virt_start =3D 0x40006000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* TIM7 - STM32MP157 */ {
.phys_start =3D 0x40005000,
.virt_start =3D 0x40005000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* TIM6 - STM32MP157 */ {
.phys_start =3D 0x40004000,
.virt_start =3D 0x40004000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* TIM5 - STM32MP157 */ {
.phys_start =3D 0x40003000,
.virt_start =3D 0x40003000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* TIM4 - STM32MP157 */ {
.phys_start =3D 0x40002000,
.virt_start =3D 0x40002000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* TIM3 - STM32MP157 */ {
.phys_start =3D 0x40001000,
.virt_start =3D 0x40001000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},
/* TIM2 - STM32MP157 */ {
.phys_start =3D 0x40000000,
.virt_start =3D 0x40000000,
.size =3D 0x400,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_IO,
},

/**************************************************************************=
*/
/****************************** RAM ALIASES
********************************/
/************************* 0x30000000 - 0x40000000
*************************/
/**************************************************************************=
*/
/* RETRAM */{
.phys_start =3D 0x38000000,
.virt_start =3D 0x38000000,
.size =3D 0x10000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
},
/* SRAM - ALIAS 4 */{
.phys_start =3D 0x30050000,
.virt_start =3D 0x30050000,
.size =3D 0x10000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
},
/* SRAM - ALIAS 3 */{
.phys_start =3D 0x30040000,
.virt_start =3D 0x30040000,
.size =3D 0x10000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
},
/* SRAM - ALIAS 2 */{
.phys_start =3D 0x30020000,
.virt_start =3D 0x30020000,
.size =3D 0x20000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_EXECUTE,
},
/* SRAM - ALIAS 1 */{
.phys_start =3D 0x30000000,
.virt_start =3D 0x30000000,
.size =3D 0x20000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_EXECUTE,
},

/****************************** SRAMs
**************************************/
/************************* 0x10000000 - 0x30000000
*************************/
/**************************************************************************=
*/
/* SYSRAM */{
.phys_start =3D 0x2FFC0000,
.virt_start =3D 0x2FFC0000,
.size =3D 0x40000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
},
/* SRAM4 */{
.phys_start =3D 0x10050000,
.virt_start =3D 0x10050000,
.size =3D 0x10000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
},
/* SRAM3 */{
.phys_start =3D 0x10040000,
.virt_start =3D 0x10040000,
.size =3D 0x10000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
},
/* SRAM2 */{
.phys_start =3D 0x10020000,
.virt_start =3D 0x10020000,
.size =3D 0x20000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_EXECUTE,
},
/* SRAM1 */{
.phys_start =3D 0x10000000,
.virt_start =3D 0x10000000,
.size =3D 0x20000,
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
JAILHOUSE_MEM_EXECUTE,
},
},

.irqchips =3D {
/* GIC STM32MP157*/ {
.address =3D 0xA0021000,
.pin_base =3D 32,
.pin_bitmap =3D {
0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
},
},
},
};

pe 6. tammik. 2023 klo 9.19 Ralf Ramsauer (ralf.ramsauer@oth-regensburg.de)
kirjoitti:

>
>
> On 06/01/2023 15:08, Tommi Parkkila wrote:
> > Jan and Ralf - It looks like I have something wrong with the IRQ/GIC.
> > When I get root cell up successfully, and if I press a button (that
> > presumably is assigned to a IRQ routine) I get the error print below an=
d
> > the whole system hangs. Is there any documentation on how I should
> > specify IRQ/GIC on root cell configuration or jailhouse configuration
> > for the target?
>
> Interesting. What's behind IRQ 74? Would you please share
> /proc/interrupts, /proc/iomem and the configuration of your root cell?
> And also maybe the full device tree using
> $ dtc -I fs -O dts /proc/device-tree -o stm32mp1.dts
>
> Thanks
>    Ralf
>
>
> >
> > Thanks,
> > -tommi
> >
> > */[   84.080587] irq 74: nobody cared (try booting with the "irqpoll"
> > option)
> > [   84.085876] CPU: 0 PID: 606 Comm: kworker/0:4 Tainted: G           O=
E
> >      5.15.24-dirty #3
> > [   84.094144] Hardware name: STM32 (Device Tree Support)
> > [   84.099236] Workqueue: events dbs_work_handler
> > [   84.103724] [<c0110d3c>] (unwind_backtrace) from [<c010c6c0>]
> > (show_stack+0x10/0x14)
> > [   84.111377] [<c010c6c0>] (show_stack) from [<c0bb3c50>]
> > (dump_stack_lvl+0x40/0x4c)
> > [   84.118918] [<c0bb3c50>] (dump_stack_lvl) from [<c0baf750>]
> > (__report_bad_irq+0x3c/0xc0)
> > [   84.126986] [<c0baf750>] (__report_bad_irq) from [<c0185b8c>]
> > (note_interrupt+0x2a8/0x2f4)
> > [   84.135265] [<c0185b8c>] (note_interrupt) from [<c0181fd8>]
> > (handle_irq_event_percpu+0x80/0x88)
> > [   84.143964] [<c0181fd8>] (handle_irq_event_percpu) from [<c0182018>]
> > (handle_irq_event+0x38/0x5c)
> > [   84.152769] [<c0182018>] (handle_irq_event) from [<c0186614>]
> > (handle_edge_irq+0xc4/0x218)
> > [   84.161046] [<c0186614>] (handle_edge_irq) from [<c073c8b4>]
> > (stm32_pwr_handle_irq+0x118/0x190)
> > [   84.169650] [<c073c8b4>] (stm32_pwr_handle_irq) from [<c018165c>]
> > (handle_domain_irq+0x7c/0xb0)
> > [   84.178348] [<c018165c>] (handle_domain_irq) from [<c063ff04>]
> > (gic_handle_irq+0x7c/0x90)
> > [   84.186522] [<c063ff04>] (gic_handle_irq) from [<c0100afc>]
> > (__irq_svc+0x5c/0x90)
> > [   84.193950] Exception stack(0xced55bb8 to 0xced55c00)
> > [   84.199040] 5ba0:
> >    00000000 00000000
> > [   84.207198] 5bc0: 1d624000 c105fe80 c105fe80 00000000 c1810800
> > 00000080 ced54000 ced55ca8
> > [   84.215356] 5be0: ced55ca8 ced55c08 ced54000 ced55c08 c0101254
> > c0101268 20010113 ffffffff
> > [   84.223509] [<c0100afc>] (__irq_svc) from [<c0101268>]
> > (__do_softirq+0xc0/0x430)
> > [   84.230833] [<c0101268>] (__do_softirq) from [<c012c8e0>]
> > (irq_exit+0xd4/0x110)
> > [   84.238157] [<c012c8e0>] (irq_exit) from [<c0181660>]
> > (handle_domain_irq+0x80/0xb0)
> > [   84.245797] [<c0181660>] (handle_domain_irq) from [<c063ff04>]
> > (gic_handle_irq+0x7c/0x90)
> > [   84.253965] [<c063ff04>] (gic_handle_irq) from [<c0100afc>]
> > (__irq_svc+0x5c/0x90)
> > [   84.261392] Exception stack(0xced55ca8 to 0xced55cf0)
> > [   84.266383] 5ca0:                   df858000 df858004 00000000
> > c1b6cb80 c1b6cb80 c1b3cec0
> > [   84.274541] 5cc0: c1bf8074 c120b400 c1b3cf40 c1b3cf48 c1986010
> > cf0ba580 c205ac44 ced55cf8
> > [   84.282695] 5ce0: c09a38d8 c09a34fc 60010013 ffffffff
> > [   84.287781] [<c0100afc>] (__irq_svc) from [<c09a34fc>]
> > (shmem_tx_prepare+0xcc/0xdc)
> > [   84.295422] [<c09a34fc>] (shmem_tx_prepare) from [<c09a38d8>]
> > (smc_send_message+0x24/0x120)
> > [   84.303696] [<c09a38d8>] (smc_send_message) from [<c099ae50>]
> > (do_xfer+0x98/0x464)
> > [   84.311234] [<c099ae50>] (do_xfer) from [<c099f40c>]
> > (scmi_clock_rate_get+0x70/0xc4)
> > [   84.318983] [<c099f40c>] (scmi_clock_rate_get) from [<c067f358>]
> > (scmi_clk_recalc_rate+0x3c/0x70)
> > [   84.327791] [<c067f358>] (scmi_clk_recalc_rate) from [<c0677004>]
> > (clk_recalc+0x34/0x74)
> > [   84.331653] sched: RT throttling activated
> > [   84.339991] [<c0677004>] (clk_recalc) from [<c0679e18>]
> > (clk_change_rate+0xf8/0x544)
> > [   84.347653] [<c0679e18>] (clk_change_rate) from [<c067a3f4>]
> > (clk_core_set_rate_nolock+0x190/0x1d8)
> > [   84.356687] [<c067a3f4>] (clk_core_set_rate_nolock) from [<c067a46c>=
]
> > (clk_set_rate+0x30/0x88)
> > [   84.365300] [<c067a46c>] (clk_set_rate) from [<c095a910>]
> > (_set_opp+0x2d0/0x5f0)
> > [   84.372647] [<c095a910>] (_set_opp) from [<c095acc0>]
> > (dev_pm_opp_set_rate+0x90/0x16c)
> > [   84.380508] [<c095acc0>] (dev_pm_opp_set_rate) from [<c095ff8c>]
> > (__cpufreq_driver_target+0x110/0x2f8)
> > [   84.389840] [<c095ff8c>] (__cpufreq_driver_target) from [<c0962f94>]
> > (od_dbs_update+0xb4/0x160)
> > [   84.398540] [<c0962f94>] (od_dbs_update) from [<c0963b18>]
> > (dbs_work_handler+0x2c/0x58)
> > [   84.406499] [<c0963b18>] (dbs_work_handler) from [<c0141dec>]
> > (process_one_work+0x1dc/0x588)
> > [   84.414881] [<c0141dec>] (process_one_work) from [<c01421e4>]
> > (worker_thread+0x4c/0x520)
> > [   84.422940] [<c01421e4>] (worker_thread) from [<c0149df8>]
> > (kthread+0x170/0x1a0)
> > [   84.430367] [<c0149df8>] (kthread) from [<c0100130>]
> > (ret_from_fork+0x14/0x24)
> > [   84.437481] Exception stack(0xced55fb0 to 0xced55ff8)
> > [   84.442571] 5fa0:                                     00000000
> > 00000000 00000000 00000000
> > [   84.450726] 5fc0: 00000000 00000000 00000000 00000000 00000000
> > 00000000 00000000 00000000
> > [   84.458880] 5fe0: 00000000 00000000 00000000 00000000 00000013
> 00000000
> > [   84.465448] handlers:
> > [   84.467682] [<716ecdd6>] irq_default_primary_handler threaded
> > [<63fec1af>] regmap_irq_thread
> > [   84.476083] Disabling IRQ #74/*
> >
> > torstai 5. tammikuuta 2023 klo 13.00.34 UTC-5 Tommi Parkkila kirjoitti:
> >
> >     Ralf - Not sure what you mean by your note.
> >
> >     Jan - root cell configuration is now fixed what comes to overlapped
> >     memory regions. However, the both issues: */1. Terminal hangs/*, an=
d
> >     */2. Issue with setting CPU clock/* still exists. I am not familiar
> >     with clock configurations on the target, but yes TF-A is in use.
> >
> >     -tommi
> >
> >     to 5. tammik. 2023 klo 12.54 Ralf Ramsauer
> >     (ralf.r...@oth-regensburg.de) kirjoitti:
> >
> >
> >
> >         On 05/01/2023 18:24, Jan Kiszka wrote:
> >          > On 05.01.23 18:21, Tommi Parkkila wrote:
> >          >> Oh, I was missing *.cell from the point 2. Now fixed and no
> >         complaints.
> >          >>
> >          >> to 5. tammik. 2023 klo 12.20 Tommi Parkkila
> >         (tommi.p...@gmail.com
> >          >> <mailto:tommi.p...@gmail.com>) kirjoitti:
> >          >>
> >          >>      Jan - Just ran the config check on the host PC and on
> >         target.
> >          >>
> >          >>      1. On host, it identified some memregion overlappings
> >         that were due
> >          >>      my own copy/paste errors. It also complained a missing
> >         resource
> >          >>      interception for architecture x86:
> >          >>      */In cell 'STM32MP1-Root', region 1
> >          >>        phys_start: 0x00000000f7600000
> >          >>        virt_start: 0x00000000f7600000
> >          >>        size:       0x0000000009a00000
> >          >>        flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE=
 |
> >          >>      JAILHOUSE_MEM_EXECUTE
> >          >>      overlaps with xAPIC
> >          >
> >          > Another detail when running cross: "-a arm" - you don't have
> >         to worry
> >          > about x86 resources on your target.
> >
> >         Side note: We should store the architecture in the
> >         configuration. Just
> >         for the same reason why we introduced the magic byte at the
> >         beginning=E2=80=A6
> >
> >             Ralf
> >
> >          >
> >          > Jan
> >          >
> >          >>        phys_start: 0x00000000fee00000
> >          >>        virt_start: 0x00000000fee00000
> >          >>        size:       0x0000000000001000
> >          >>        flags:  /*
> >          >>      I fixed the copy paste mem overlappings, do I need to
> >         worry about
> >          >>      the xAPIC overlapping?
> >          >>      */
> >          >>      /*
> >          >>      2. On target, the check complained the configuration i=
s
> >         not root
> >          >>      cell configuration???
> >          >>      */root@stm32mp1:~#
> jailhouse/tools/jailhouse-config-check
> >          >>      jailhouse/configs/stm32mp157.c
> >          >>      Reading configuration set:
> >          >>      Not a root cell configuration:
> >         jailhouse/configs/arm/stm32mp157.c/*
> >          >>      The config here is the same as ran on the host PC. Wha=
t
> >         causes it to
> >          >>      complain the above?
> >          >>
> >          >>      to 5. tammik. 2023 klo 11.55 Jan Kiszka
> >         (jan.k...@siemens.com
> >          >>      <mailto:jan.k...@siemens.com>) kirjoitti:
> >          >>
> >          >>          On 05.01.23 17:53, Tommi Parkkila wrote:
> >          >>          > Jan - Thanks again. I have not tried the config
> >         check yet.
> >          >>          Actually, it
> >          >>          > does not work on hw currently, it does not find
> >         pyjailhouse
> >          >>          module. I'll
> >          >>          > check whats going wrong with it and let you know=
.
> >          >>
> >          >>          You can also run it offline, even directly from th=
e
> >         source folder
> >          >>          (tools/jailhouse-config-check ...).
> >          >>
> >          >>          Jan
> >          >>
> >          >>          > -tommi
> >          >>          >
> >          >>          > to 5. tammik. 2023 klo 10.21 Jan Kiszka
> >          >>          (jan.k...@siemens.com <mailto:jan.k...@siemens.com=
>
> >          >>          > <mailto:jan.k...@siemens.com
> >          >>          <mailto:jan.k...@siemens.com>>) kirjoitti:
> >          >>          >
> >          >>          >     On 05.01.23 15:34, Tommi Parkkila wrote:
> >          >>          >     > Thanks for your reply, Jan. I managed to
> >         get forward
> >          >>          from the 'hang'
> >          >>          >     > condition. There were several
> >         misdefinitions on my root-cell
> >          >>          >     > configuration. Now I get the root-cell
> started
> >          >>          sometimes, but more
> >          >>          >     often
> >          >>          >     > I get two types of issues after enable
> >         command. Any help
> >          >>          or ideas
> >          >>          >     where
> >          >>          >     > to continue my debugging would be greatly
> >         appreciated.
> >          >>          Please, see the
> >          >>          >     > issues explained below.
> >          >>          >
> >          >>          >     Already tried "jailhouse config check"?
> >          >>          >
> >          >>          >     >
> >          >>          >     > Thanks,
> >          >>          >     > -tommi
> >          >>          >     >
> >          >>          >     > +++++++++++++++++++++++++++++++++
> >          >>          >     >
> >          >>          >     > 1. Terminal hangs
> >          >>          >     > -- After the enable command for the root
> >         cell, jailhouse
> >          >>          gets started
> >          >>          >     > but then the terminal goes unresponsive.
> >         Below, example
> >          >>          log, where I
> >          >>          >     > give ls cmd, which then causes terminal to
> go
> >          >>          unresponsive...:
> >          >>          >     >
> >          >>          >
> >          >>          >     Missing interrupts could be one reason. Or
> >         something is
> >          >>          completely
> >          >>          >     broken with memory mapping so that a kernel
> >         device driver
> >          >>          gets stuck on
> >          >>          >     waiting for some register bit to flip, e.g.
> >         But most
> >          >>          frequent are
> >          >>          >     interrupt issues, specifically around GIC
> >         resources being
> >          >>          improperly
> >          >>          >     passed through. The config checker may find
> that.
> >          >>          >
> >          >>          >     > /*root@stm32mp1:~# modprobe jailhouse
> >          >>          >     > [ 1315.034414] jailhouse: loading
> >         out-of-tree module
> >          >>          taints kernel.
> >          >>          >     > root@stm32mp1:~# jailhouse enable
> >          >>          >     >
> ~/jailhouse/configs/arm/itron_stm32mp157.cell
> >          >>          >     >
> >          >>          >     > Initializing Jailhouse hypervisor v0.12
> >          >>          (314-gc7a1b697-dirty) on CPU 0
> >          >>          >     > Code location: 0xf0000040
> >          >>          >     > Page pool usage after early setup: mem
> >         28/1514, remap
> >          >>          0/131072
> >          >>          >     > Initializing processors:
> >          >>          >     >  CPU 0... OK
> >          >>          >     >  CPU 1... OK
> >          >>          >     > Initializing unit: irqchip
> >          >>          >     > Initializing unit: PCI
> >          >>          >     > Page pool usage after late setup: mem
> >         50/1514, remap
> >          >>          5/131072
> >          >>          >     > [0] Activating hypervisor
> >          >>          >     > [ 1355.352714] The Jailhouse is opening.
> >          >>          >     > root@stm32mp1:~# ls*/
> >          >>          >     >
> >          >>          >     > 2. Issue with setting CPU clock
> >          >>          >     > -- The second issue I see is related to i2=
c
> >         bus and
> >          >>          system clock.
> >          >>          >     > Terminal starts printing error statements
> >         infinitely
> >          >>          after Jailhouse
> >          >>          >     > opening. Below, is a snippet of an example
> >         logs.
> >          >>          >     >
> >          >>          >     > */[   85.322027] The Jailhouse is opening.
> >          >>          >     > [   85.322648] stm32f7-i2c 5c002000.i2c:
> >         failed to
> >          >>          prepare_enable
> >          >>          >     clock
> >          >>          >     > root@stm32mp1:~# [   85.339233] cpu cpu0:
> >          >>          _set_opp_voltage: failed to
> >          >>          >     > set voltage (1350000 1350000 1350000 mV):
> -22
> >          >>          >     > [   85.350413] cpufreq: __target_index:
> >         Failed to change cpu
> >          >>          >     frequency: -22
> >          >>          >     > [   85.357706] cpu cpu0: _set_opp_voltage:
> >         failed to set
> >          >>          voltage
> >          >>          >     > (1350000 1350000 1350000 mV): -22
> >          >>          >     > [   85.365124] cpufreq: __target_index:
> >         Failed to change cpu
> >          >>          >     frequency: -22
> >          >>          >     > [   85.381985] cpu cpu0: _set_opp_voltage:
> >         failed to set
> >          >>          voltage
> >          >>          >     > (1350000 1350000 1350000 mV): -22
> >          >>          >     > /*- - -
> >          >>          >     > +++++++++++++++++++++++++++++++++
> >          >>          >
> >          >>          >     Same possible reasons as above. Or do you
> >         know how clock
> >          >>          control happens
> >          >>          >     on that platform? Is there firmware (TF-A?)
> >         involved?
> >          >>          >
> >          >>          >     Jan
> >          >>          >
> >          >>          >     --
> >          >>          >     Siemens AG, Technology
> >          >>          >     Competence Center Embedded Linux
> >          >>          >
> >          >>
> >          >>          --
> >          >>          Siemens AG, Technology
> >          >>          Competence Center Embedded Linux
> >          >>
> >          >
> >
> > --
> > You received this message because you are subscribed to the Google
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send
> > an email to jailhouse-dev+unsubscribe@googlegroups.com
> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> > To view this discussion on the web visit
> >
> https://groups.google.com/d/msgid/jailhouse-dev/369cc253-8606-476b-a8d7-3=
8ed11beaa2fn%40googlegroups.com
> <
> https://groups.google.com/d/msgid/jailhouse-dev/369cc253-8606-476b-a8d7-3=
8ed11beaa2fn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAP8Rr63YNKfgZ-yN2CaimBAsbFE-3VdA1%2BKEH40kpi4h0A3%3DSQ%40mai=
l.gmail.com.

--00000000000031b6e005f19a4689
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ralf - here is the root cell configuration:<div><br></div>=
<div>/*<br>=C2=A0* Jailhouse, a Linux-based partitioning hypervisor<br>=C2=
=A0*<br>=C2=A0* Test configuration for Banana Pi board (A20 dual-core Corte=
x-A7, 1G RAM)<br>=C2=A0* <a href=3D"https://banana-pi.org/en/banana-pi-sbcs=
/4.html">https://banana-pi.org/en/banana-pi-sbcs/4.html</a><br>=C2=A0* Copy=
right (c) Siemens AG, 2014<br>=C2=A0*<br>=C2=A0* Authors:<br>=C2=A0* =C2=A0=
Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com">jan.kiszka@siemens=
.com</a>&gt;<br>=C2=A0*<br>=C2=A0* This work is licensed under the terms of=
 the GNU GPL, version 2.=C2=A0 See<br>=C2=A0* the COPYING file in the top-l=
evel directory.<br>=C2=A0*<br>=C2=A0* =C2=A0THIS IS A JAILHOUSE ROOT CELL C=
ONFIGURATION FILE FOR STM32MP157<br>=C2=A0* =C2=A0- =C2=A0 BASED ON BANANA =
PI EXAMPLE FROM JAILHOUSE REPO (A20 Dual Core Cortex-A7, <br>=C2=A0* =C2=A0=
 =C2=A0 =C2=A0- =C2=A0 A20 UserManual: <a href=3D"https://github.com/allwin=
ner-zh/documents/raw/master/A20/A20_User_Manual_v1.4_20150510.pdf">https://=
github.com/allwinner-zh/documents/raw/master/A20/A20_User_Manual_v1.4_20150=
510.pdf</a><br>=C2=A0* =C2=A0 =C2=A0 =C2=A0- =C2=A0 A20 DataSheet: <a href=
=3D"https://github.com/allwinner-zh/documents/raw/master/A20/A20_Datasheet_=
v1.5_20150510.pdf">https://github.com/allwinner-zh/documents/raw/master/A20=
/A20_Datasheet_v1.5_20150510.pdf</a><br>=C2=A0* =C2=A0- =C2=A0 WORK IN PROG=
RESS<br>=C2=A0* =C2=A0 =C2=A0 =C2=A0- =C2=A0 STM32MP157 REF Manual: <a href=
=3D"https://www.st.com/resource/en/reference_manual/DM00327659-.pdf">https:=
//www.st.com/resource/en/reference_manual/DM00327659-.pdf</a><br>=C2=A0* =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 Memory map on page 158<br>=C2=A0=
*/<br><br>#include &lt;jailhouse/types.h&gt;<br>#include &lt;jailhouse/cell=
-config.h&gt;<br><br>struct {<br>	struct jailhouse_system header;<br>	__u64=
 cpus[1];<br>	// struct jailhouse_memory mem_regions[127];<br>	struct jailh=
ouse_memory mem_regions[131];<br>	struct jailhouse_irqchip irqchips[1];<br>=
} __attribute__((packed)) config =3D {<br>	.header =3D {<br>		.signature =
=3D JAILHOUSE_SYSTEM_SIGNATURE,<br>		.revision =3D JAILHOUSE_CONFIG_REVISIO=
N,<br>		.flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,<br>		.hypervisor_me=
mory =3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* STM32MP157=
 */<br>			.phys_start =3D 0xF7000000,<br>			.size =3D 0x0600000,<br>		},<br=
>		.debug_console =3D {<br>			/* UART-4 STM32MP157 */<br>			.address =3D 0x=
40010000,<br>			.size =3D 0x400,<br>			/* .clock_reg =3D 0x01c2006c, */<br>=
			/* .gate_nr =3D 16 */<br>			/* .divider =3D 0x0d, */<br>			.type =3D JAI=
LHOUSE_CON_TYPE_STM32H7,<br>			.flags =3D JAILHOUSE_CON_ACCESS_MMIO |<br>		=
		 JAILHOUSE_CON_REGDIST_4,<br>		},<br>		.platform_info =3D {<br>			.arm =
=3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* STM32MP=
157 */<br>				.gic_version =3D 2,<br>				.gicd_base =3D 0xA0021000,	/// Dis=
tributor<br>				.gicc_base =3D 0xA0022000,	/// CPU<br>				.gich_base =3D 0x=
A0024000,	/// Hypervisor<br>				.gicv_base =3D 0xA0026000,	/// Virtual CPU<=
br>				.maintenance_irq =3D 25,<br>			},<br>		},<br>		.root_cell =3D {<br>	=
		.name =3D &quot;STM32MP1-Root&quot;,<br><br>			.cpu_set_size =3D sizeof(c=
onfig.cpus),<br>			.num_memory_regions =3D ARRAY_SIZE(config.mem_regions),<=
br>			.num_irqchips =3D ARRAY_SIZE(config.irqchips),<br>		},<br>	},<br><br>=
	/* STM32MP157 */<br>	.cpus =3D {<br>		0x3,<br>	},<br>	.mem_regions =3D {<b=
r>		/* IVSHMEM shared memory region - STM32MP157 */<br>		/* - This macro cr=
eates four shared memory regions with a total size of 0x100000 (1M), see ce=
ll-config.h*/<br>		/* - Created and reserved a continous memory region in k=
ernel device tree for this one as well. */<br>		/* - Placed the memory regi=
on before hypervisor region. */<br>		//JAILHOUSE_SHMEM_NET_REGIONS(0xfdf000=
00, 0),<br>		// /* SPI */ {<br>		// 	.phys_start =3D 0x01c05000,<br>		// 	.=
virt_start =3D 0x01c05000,<br>		// 	.size =3D 0x00001000,<br>		// 	.flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>		// 		JAILHOUSE_MEM_IO,<=
br>		// },<br><br>		/******************************************************=
*********************/<br>		/****************************** DDR =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ******************************/<br>		/************=
************* 0xC0000000 - 0xFFFFFFFF *************************/<br>		/****=
***********************************************************************/<br=
>		/* RAM1 - STM32MP157 */ {<br>			.phys_start =3D 0xC0000000,<br>			.virt_=
start =3D 0xC0000000,<br>			.size =3D 0x36A00000,<br>			.flags =3D JAILHOUS=
E_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_EXECUTE,<br>		},<br=
>		/* JAILHOUSE INMATE LOCATED AT 0xf6a00000 - 0xf7000000*/<br>		/* JAILHOU=
SE LOCATED AT 0xf7000000 - 0xF7600000*/<br>		/* RAM2 - STM32MP157 */ {<br>	=
		.phys_start =3D 0xF7600000,<br>			.virt_start =3D 0xF7600000,<br>			.size=
 =3D 0x9A00000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=
<br>				JAILHOUSE_MEM_EXECUTE,<br>		},<br>		<br>		/************************=
***************************************************/<br>		/****************=
************** PERIPHERALS 2 ******************************/<br>		/********=
***************** 0x50000000 - 0x60000000 *************************/<br>		/=
***************************************************************************=
/<br>		/* TAMP - STM32MP157 */ {<br>			.phys_start =3D 0x5C00A000,<br>			.v=
irt_start =3D 0x5C00A000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE=
_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* =
I2C6 - STM32MP157 */ {<br>			.phys_start =3D 0x5C009000,<br>			.virt_start =
=3D 0x5C009000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_32,<br>		},<br>		/* STGENC =
- STM32MP157 */ {<br>			.phys_start =3D 0x5C008000,<br>			.virt_start =3D 0=
x5C008000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JA=
ILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* ETZPC - STM32M=
P157 */ {<br>			.phys_start =3D 0x5C007000,<br>			.virt_start =3D 0x5C00700=
0,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_M=
EM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* TZC - STM32MP157 */ {<b=
r>			.phys_start =3D 0x5C006000,<br>			.virt_start =3D 0x5C006000,<br>			.s=
ize =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=
<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* BSEC - STM32MP157 */ {<br>			.phy=
s_start =3D 0x5C005000,<br>			.virt_start =3D 0x5C005000,<br>			.size =3D 0=
x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				J=
AILHOUSE_MEM_IO,<br>		},<br>		/* RTC - STM32MP157 */ {<br>			.phys_start =
=3D 0x5C004000,<br>			.virt_start =3D 0x5C004000,<br>			.size =3D 0x400,<br=
>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_=
MEM_IO,<br>		},<br>		/* IWDG1 - STM32MP157 */ {<br>			.phys_start =3D 0x5C0=
03000,<br>			.virt_start =3D 0x5C003000,<br>			.size =3D 0x400,<br>			.flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<b=
r>		},<br>		/* I2C4 - STM32MP157 */ {<br>			.phys_start =3D 0x5C002000,<br>=
			.virt_start =3D 0x5C002000,<br>			.size =3D 0x400,<br>			.flags =3D JAIL=
HOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_32,<br>		},<=
br>		/* SPI6 - STM32MP157 */ {<br>			.phys_start =3D 0x5C001000,<br>			.vir=
t_start =3D 0x5C001000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_M=
EM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* US=
ART1 - STM32MP157 */ {<br>			.phys_start =3D 0x5C000000,<br>			.virt_start =
=3D 0x5C000000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_32,<br>		},<br>		/* DDRPERF=
M - STM32MP157 */ {<br>			.phys_start =3D 0x5A007000,<br>			.virt_start =3D=
 0x5A007000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | J=
AILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* USBPHYC - STM=
32MP157 */ {<br>			.phys_start =3D 0x5A006000,<br>			.virt_start =3D 0x5A00=
6000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOU=
SE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* STGENR - STM32MP157=
 */ {<br>			.phys_start =3D 0x5A005000,<br>			.virt_start =3D 0x5A005000,<b=
r>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_=
WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* DDRPHYC - STM32MP157 */ {<=
br>			.phys_start =3D 0x5A004000,<br>			.virt_start =3D 0x5A004000,<br>			.=
size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE =
|<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* DDRCTRL - STM32MP157 */ {<br>			=
.phys_start =3D 0x5A003000,<br>			.virt_start =3D 0x5A003000,<br>			.size =
=3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>=
				JAILHOUSE_MEM_IO,<br>		},<br>		/* IWDG2 - STM32MP157 */ {<br>			.phys_s=
tart =3D 0x5A002000,<br>			.virt_start =3D 0x5A002000,<br>			.size =3D 0x40=
0,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILH=
OUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,<br>		},<br>		/* LTDC - STM32MP157 */ =
{<br>			.phys_start =3D 0x5A001000,<br>			.virt_start =3D 0x5A001000,<br>		=
	.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE=
 |<br>				JAILHOUSE_MEM_IO_32,<br>		},<br>		/* DSI - STM32MP157 */ {<br>			=
.phys_start =3D 0x5A000000,<br>			.virt_start =3D 0x5A000000,<br>			.size =
=3D 0x800,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>	=
			JAILHOUSE_MEM_IO,<br>		},<br>		/* GPU - STM32MP157 */ {<br>			.phys_star=
t =3D 0x59000000,<br>			.virt_start =3D 0x59000000,<br>			.size =3D 0x40000=
,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHO=
USE_MEM_IO,<br>		},<br>		/* USBH_EHCI - STM32MP157 */ {<br>			.phys_start =
=3D 0x5800D000,<br>			.virt_start =3D 0x5800D000,<br>			.size =3D 0x1000,<b=
r>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE=
_MEM_IO,<br>		},<br>		/* USBH_OHCI - STM32MP157 */ {<br>			.phys_start =3D =
0x5800C000,<br>			.virt_start =3D 0x5800C000,<br>			.size =3D 0x1000,<br>		=
	.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM=
_IO,<br>		},<br>		/* ETH1 - STM32MP157 */ {<br>			.phys_start =3D 0x5800A00=
0,<br>			.virt_start =3D 0x5800A000,<br>			.size =3D 0x2000,<br>			.flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>=
		},<br>		/* CRC1 - STM32MP157 */ {<br>			.phys_start =3D 0x58009000,<br>		=
	.virt_start =3D 0x58009000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILH=
OUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>	=
	/* DLYBSD2 - STM32MP157 */ {<br>			.phys_start =3D 0x58008000,<br>			.virt=
_start =3D 0x58008000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_M=
EM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* SD=
MMC2 - STM32MP157 */ {<br>			.phys_start =3D 0x58007000,<br>			.virt_start =
=3D 0x58007000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ=
 | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* DLYBSD1 -=
 STM32MP157 */ {<br>			.phys_start =3D 0x58006000,<br>			.virt_start =3D 0x=
58006000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAI=
LHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* SDMMC1 - STM32M=
P157 */ {<br>			.phys_start =3D 0x58005000,<br>			.virt_start =3D 0x5800500=
0,<br>			.size =3D 0x00001000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHO=
USE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* DLYBQS - STM32MP15=
7 */ {<br>			.phys_start =3D 0x58004000,<br>			.virt_start =3D 0x58004000,<=
br>			.size =3D 0x00001000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE=
_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* QUADSPI - STM32MP157 =
*/ {<br>			.phys_start =3D 0x58003000,<br>			.virt_start =3D 0x58003000,<br=
>			.size =3D 0x00001000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_M=
EM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* FMC (NOR/PSRAM/NAND) - =
STM32MP157 */ {<br>			.phys_start =3D 0x58002000,<br>			.virt_start =3D 0x5=
8002000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAIL=
HOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* MDMA - STM32MP15=
7 */ {<br>			.phys_start =3D 0x58000000,<br>			.virt_start =3D 0x58000000,<=
br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM=
_WRITE |<br>				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO=
_32,<br>		},<br>		/* AXIMC - STM32MP157 */ {<br>			.phys_start =3D 0x570000=
00,<br>			.virt_start =3D 0x57000000,<br>			.size =3D 0x100000,<br>			.flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<b=
r>		},<br>		/* GPIOZ - STM32MP157 */ {<br>			.phys_start =3D 0x54004000,<br=
>			.virt_start =3D 0x54004000,<br>			.size =3D 0x400,<br>			.flags =3D JAI=
LHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO | JAILHOUSE=
_MEM_IO_32,<br>		},<br>		/* RNG1 - STM32MP157 */ {<br>			.phys_start =3D 0x=
54003000,<br>			.virt_start =3D 0x54003000,<br>			.size =3D 0x400,<br>			.f=
lags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO=
,<br>		},<br>		/* HASH1 - STM32MP157 */ {<br>			.phys_start =3D 0x54002000,=
<br>			.virt_start =3D 0x54002000,<br>			.size =3D 0x400,<br>			.flags =3D =
JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},=
<br>		/* =C2=A0CRYP1 - STM32MP157 */ {<br>			.phys_start =3D 0x54001000,<br=
>			.virt_start =3D 0x54001000,<br>			.size =3D 0x400,<br>			.flags =3D JAI=
LHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br=
>		/* =C2=A0BKPSRAM - STM32MP157 */ {<br>			.phys_start =3D 0x54000000,<br>=
			.virt_start =3D 0x54000000,<br>			.size =3D 0x1000,<br>			.flags =3D JAI=
LHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br=
>		/* =C2=A0HDP - STM32MP157 */ {<br>			.phys_start =3D 0x5002A000,<br>			.=
virt_start =3D 0x5002A000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUS=
E_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/*=
 =C2=A0DTS - STM32MP157 */ {<br>			.phys_start =3D 0x50028000,<br>			.virt_=
start =3D 0x50028000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM=
_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_32,<br>		},<br>		/* =
=C2=A0SAI4 - STM32MP157 */ {<br>			.phys_start =3D 0x50027000,<br>			.virt_=
start =3D 0x50027000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM=
_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* =C2=
=A0VREFBUF - STM32MP157 */ {<br>			.phys_start =3D 0x50025000,<br>			.virt_=
start =3D 0x50025000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM=
_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* =C2=
=A0LPTIM5 - STM32MP157 */ {<br>			.phys_start =3D 0x50024000,<br>			.virt_s=
tart =3D 0x50024000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_=
READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* =C2=
=A0LPTIM4 - STM32MP157 */ {<br>			.phys_start =3D 0x50023000,<br>			.virt_s=
tart =3D 0x50023000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_=
READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* =C2=
=A0LPTIM3 - STM32MP157 */ {<br>			.phys_start =3D 0x50022000,<br>			.virt_s=
tart =3D 0x50022000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_=
READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* =C2=
=A0LPTIM2 - STM32MP157 */ {<br>			.phys_start =3D 0x50021000,<br>			.virt_s=
tart =3D 0x50021000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_=
READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* =C2=
=A0SYSCFG - STM32MP157 */ {<br>			.phys_start =3D 0x50020000,<br>			.virt_s=
tart =3D 0x50020000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_=
READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* =C2=
=A0EXTI - STM32MP157 */ {<br>			.phys_start =3D 0x5000D000,<br>			.virt_sta=
rt =3D 0x5000D000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_RE=
AD | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 =
| JAILHOUSE_MEM_IO_32,<br>		},<br>		/* GPIOK - STM32MP157 */ {<br>			.phys_=
start =3D 0x5000C000,<br>			.virt_start =3D 0x5000C000,<br>			.size =3D 0x4=
00,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAIL=
HOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,<br>		},<br>		/* GPIOJ - STM32MP157 */ {=
<br>			.phys_start =3D 0x5000B000,<br>			.virt_start =3D 0x5000B000,<br>			=
.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE =
|<br>				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,<br>		},<br>		/* GPIOI - ST=
M32MP157 */ {<br>			.phys_start =3D 0x5000A000,<br>			.virt_start =3D 0x500=
0A000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOU=
SE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,<br>		},<br>		=
/* GPIOH - STM32MP157 */ {<br>			.phys_start =3D 0x50009000,<br>			.virt_st=
art =3D 0x50009000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_R=
EAD | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,<=
br>		},<br>		/* GPIOG - STM32MP157 */ {<br>			.phys_start =3D 0x50008000,<b=
r>			.virt_start =3D 0x50008000,<br>			.size =3D 0x400,<br>			.flags =3D JA=
ILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO | JAILHOUS=
E_MEM_IO_32,<br>		},<br>		/* GPIOF - STM32MP157 */ {<br>			.phys_start =3D =
0x50007000,<br>			.virt_start =3D 0x50007000,<br>			.size =3D 0x400,<br>			=
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_=
IO | JAILHOUSE_MEM_IO_32,<br>		},<br>		/* GPIOE - STM32MP157 */ {<br>			.ph=
ys_start =3D 0x50006000,<br>			.virt_start =3D 0x50006000,<br>			.size =3D =
0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				J=
AILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,<br>		},<br>		/* GPIOD - STM32MP157 *=
/ {<br>			.phys_start =3D 0x50005000,<br>			.virt_start =3D 0x50005000,<br>=
			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRI=
TE |<br>				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,<br>		},<br>		/* GPIOC -=
 STM32MP157 */ {<br>			.phys_start =3D 0x50004000,<br>			.virt_start =3D 0x=
50004000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAIL=
HOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,<br>		},<br=
>		/* GPIOB - STM32MP157 */ {<br>			.phys_start =3D 0x50003000,<br>			.virt=
_start =3D 0x50003000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_ME=
M_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_3=
2,<br>		},<br>		/* GPIOA - STM32MP157 */ {<br>			.phys_start =3D 0x50002000=
,<br>			.virt_start =3D 0x50002000,<br>			.size =3D 0x400,<br>			.flags =3D=
 JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO | JAILH=
OUSE_MEM_IO_32,<br>		},<br>		/* PWR - STM32MP157 */ {<br>			.phys_start =3D=
 0x50001000,<br>			.virt_start =3D 0x50001000,<br>			.size =3D 0x400,<br>		=
	.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM=
_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32, <br>		},<br>		/* RCC - S=
TM32MP157 */ {<br>			.phys_start =3D 0x50000000,<br>			.virt_start =3D 0x50=
000000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILH=
OUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br><br>		/***************=
************************************************************/<br>		/*******=
*********************** PERIPHERALS 1 ******************************/<br>		=
/************************* 0x40000000 - 0x50000000 ************************=
*/<br>		/******************************************************************=
*********/<br>		/* DCMI - STM32MP157 */ {<br>			.phys_start =3D 0x4C006000,=
<br>			.virt_start =3D 0x4C006000,<br>			.size =3D 0x400,<br>			.flags =3D =
JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},=
<br>		/* CRYP2 - STM32MP157 */ {<br>			.phys_start =3D 0x4C005000,<br>			.v=
irt_start =3D 0x4C005000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE=
_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* =
CRC2 - STM32MP157 */ {<br>			.phys_start =3D 0x4C004000,<br>			.virt_start =
=3D 0x4C004000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* RNG2 - STM=
32MP157 */ {<br>			.phys_start =3D 0x4C003000,<br>			.virt_start =3D 0x4C00=
3000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUS=
E_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* HASH2 - STM32MP157 *=
/ {<br>			.phys_start =3D 0x4C002000,<br>			.virt_start =3D 0x4C002000,<br>=
			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRI=
TE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* IPCC - STM32MP157 */ {<br>			=
.phys_start =3D 0x4C001000,<br>			.virt_start =3D 0x4C001000,<br>			.size =
=3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>	=
			JAILHOUSE_MEM_IO,<br>		},<br>		/* HSEM - STM32MP157 */ {<br>			.phys_sta=
rt =3D 0x4C000000,<br>			.virt_start =3D 0x4C000000,<br>			.size =3D 0x400,=
<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOU=
SE_MEM_IO_32,<br>		},<br>		/* OTG - STM32MP157 */ {<br>			.phys_start =3D 0=
x49000000,<br>			.virt_start =3D 0x49000000,<br>			.size =3D 0x40000,<br>		=
	.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<br>		},<br>		/* DLYBS=
D3 - STM32MP157 */ {<br>			.phys_start =3D 0x48005000,<br>			.virt_start =
=3D 0x48005000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* SDMMC3 - S=
TM32MP157 */ {<br>			.phys_start =3D 0x48004000,<br>			.virt_start =3D 0x48=
004000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHO=
USE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* ADC12 - STM32MP157=
 */ {<br>			.phys_start =3D 0x48003000,<br>			.virt_start =3D 0x48003000,<b=
r>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_W=
RITE |<br>				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,<br>		},<br>		/* DMAMU=
X1 - STM32MP157 */ {<br>			.phys_start =3D 0x48002000,<br>			.virt_start =
=3D 0x48002000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | J=
AILHOUSE_MEM_IO_32,<br>		},<br>		/* DMA2 - STM32MP157 */ {<br>			.phys_star=
t =3D 0x48001000,<br>			.virt_start =3D 0x48001000,<br>			.size =3D 0x400,<=
br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUS=
E_MEM_IO_32,<br>		},<br>		/* DMA1 - STM32MP157 */ {<br>			.phys_start =3D 0=
x48000000,<br>			.virt_start =3D 0x48000000,<br>			.size =3D 0x400,<br>			.=
flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_I=
O_32,<br>		},<br>		/* CANSRAM - STM32MP157 */ {<br>			.phys_start =3D 0x440=
11000,<br>			.virt_start =3D 0x44011000,<br>			.size =3D 0x2800,<br>			.fla=
gs =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<=
br>		},<br>		/* CCU - STM32MP157 */ {<br>			.phys_start =3D 0x44010000,<br>=
			.virt_start =3D 0x44010000,<br>			.size =3D 0x400,<br>			.flags =3D JAIL=
HOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>=
		/* FDCAN2 - STM32MP157 */ {<br>			.phys_start =3D 0x4400F000,<br>			.virt=
_start =3D 0x4400F000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_ME=
M_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* FDC=
AN1 - STM32MP157 */ {<br>			.phys_start =3D 0x4400E000,<br>			.virt_start =
=3D 0x4400E000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* DFSDM1 - S=
TM32MP157 */ {<br>			.phys_start =3D 0x4400D000,<br>			.virt_start =3D 0x44=
00D000,<br>			.size =3D 0x800,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHO=
USE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* SAI3 - STM32MP157 =
*/ {<br>			.phys_start =3D 0x4400C000,<br>			.virt_start =3D 0x4400C000,<br=
>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WR=
ITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* SAI2 - STM32MP157 */ {<br>		=
	.phys_start =3D 0x4400B000,<br>			.virt_start =3D 0x4400B000,<br>			.size =
=3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>	=
			JAILHOUSE_MEM_IO,<br>		},<br>		/* SAI1 - STM32MP157 */ {<br>			.phys_sta=
rt =3D 0x4400A000,<br>			.virt_start =3D 0x4400A000,<br>			.size =3D 0x400,=
<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOU=
SE_MEM_IO,<br>		},<br>		/* SPI5 - STM32MP157 */ {<br>			.phys_start =3D 0x4=
4009000,<br>			.virt_start =3D 0x44009000,<br>			.size =3D 0x400,<br>			.fl=
ags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,=
<br>		},<br>		/* TIM17 - STM32MP157 */ {<br>			.phys_start =3D 0x44008000,<=
br>			.virt_start =3D 0x44008000,<br>			.size =3D 0x400,<br>			.flags =3D J=
AILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<=
br>		/* TIM16 - STM32MP157 */ {<br>			.phys_start =3D 0x44007000,<br>			.vi=
rt_start =3D 0x44007000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_=
MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* T=
IM15 - STM32MP157 */ {<br>			.phys_start =3D 0x44006000,<br>			.virt_start =
=3D 0x44006000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* SPI4 - STM=
32MP157 */ {<br>			.phys_start =3D 0x44005000,<br>			.virt_start =3D 0x4400=
5000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUS=
E_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* SPI1 - STM32MP157 */=
 {<br>			.phys_start =3D 0x44004000,<br>			.virt_start =3D 0x44004000,<br>	=
		.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRIT=
E |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* USART6 - STM32MP157 */ {<br>		=
	.phys_start =3D 0x44003000,<br>			.virt_start =3D 0x44003000,<br>			.size =
=3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>	=
			JAILHOUSE_MEM_IO_32,<br>		},<br>		/* TIM 8 - STM32MP157 */ {<br>			.phys=
_start =3D 0x44001000,<br>			.virt_start =3D 0x44001000,<br>			.size =3D 0x=
400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAI=
LHOUSE_MEM_IO,<br>		},<br>		/* TIM 1 - STM32MP157 */ {<br>			.phys_start =
=3D 0x44000000,<br>			.virt_start =3D 0x44000000,<br>			.size =3D 0x400,<br=
>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_=
MEM_IO,<br>		},<br>		/* MDIOS - STM32MP157 */ {<br>			.phys_start =3D 0x400=
1C000,<br>			.virt_start =3D 0x4001C000,<br>			.size =3D 0x400,<br>			.flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<b=
r>		},<br>		/* UART8 - STM32MP157 */ {<br>			.phys_start =3D 0x40019000,<br=
>			.virt_start =3D 0x40019000,<br>			.size =3D 0x400,<br>			.flags =3D JAI=
LHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_32,<br>		},=
<br>		/* UART7 - STM32MP157 */ {<br>			.phys_start =3D 0x40018000,<br>			.v=
irt_start =3D 0x40018000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE=
_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_32,<br>		},<br>		=
/* DAC1 - STM32MP157 */ {<br>			.phys_start =3D 0x40017000,<br>			.virt_sta=
rt =3D 0x40017000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_RE=
AD | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* CEC - S=
TM32MP157 */ {<br>			.phys_start =3D 0x40016000,<br>			.virt_start =3D 0x40=
016000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHO=
USE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* I2C5 - STM32MP157 =
*/ {<br>			.phys_start =3D 0x40015000,<br>			.virt_start =3D 0x40015000,<br=
>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WR=
ITE |<br>				JAILHOUSE_MEM_IO_32,<br>		},<br>		/* I2C3 - STM32MP157 */ {<br=
>			.phys_start =3D 0x40014000,<br>			.virt_start =3D 0x40014000,<br>			.si=
ze =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<b=
r>				JAILHOUSE_MEM_IO_32,<br>		},<br>		/* I2C2 - STM32MP157 */ {<br>			.ph=
ys_start =3D 0x40013000,<br>			.virt_start =3D 0x40013000,<br>			.size =3D =
0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				J=
AILHOUSE_MEM_IO_32,<br>		},<br>		/* I2C1 - STM32MP157 */ {<br>			.phys_star=
t =3D 0x40012000,<br>			.virt_start =3D 0x40012000,<br>			.size =3D 0x400,<=
br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUS=
E_MEM_IO_32,<br>		},<br>		/* UART5 - STM32MP157 */ {<br>			.phys_start =3D =
0x40011000,<br>			.virt_start =3D 0x40011000,<br>			.size =3D 0x400,<br>			=
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_=
IO_32,<br>		},<br>		/* UART4 - STM32MP157 */ {<br>			.phys_start =3D 0x4001=
0000,<br>			.virt_start =3D 0x40010000,<br>			.size =3D 0x400,<br>			.flags=
 =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_32,=
<br>		},<br>		/* USART3 - STM32MP157 */ {<br>			.phys_start =3D 0x4000F000,=
<br>			.virt_start =3D 0x4000F000,<br>			.size =3D 0x400,<br>			.flags =3D =
JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_32,<br>	=
	},<br>		/* USART2 - STM32MP157 */ {<br>			.phys_start =3D 0x4000E000,<br>	=
		.virt_start =3D 0x4000E000,<br>			.size =3D 0x400,<br>			.flags =3D JAILH=
OUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_32,<br>		},<b=
r>		/* SPDIFRX - STM32MP157 */ {<br>			.phys_start =3D 0x4000D000,<br>			.v=
irt_start =3D 0x4000D000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE=
_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* =
SPI3 - STM32MP157 */ {<br>			.phys_start =3D 0x4000C000,<br>			.virt_start =
=3D 0x4000C000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* SPI2 - STM=
32MP157 */ {<br>			.phys_start =3D 0x4000B000,<br>			.virt_start =3D 0x4000=
B000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUS=
E_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* WWDG1 - STM32MP157 *=
/ {<br>			.phys_start =3D 0x4000A000,<br>			.virt_start =3D 0x4000A000,<br>=
			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRI=
TE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* LPTIM1 - STM32MP157 */ {<br>	=
		.phys_start =3D 0x40009000,<br>			.virt_start =3D 0x40009000,<br>			.size=
 =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>=
				JAILHOUSE_MEM_IO,<br>		},<br>		/* TIM14 - STM32MP157 */ {<br>			.phys_s=
tart =3D 0x40008000,<br>			.virt_start =3D 0x40008000,<br>			.size =3D 0x40=
0,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILH=
OUSE_MEM_IO,<br>		},<br>		/* TIM13 - STM32MP157 */ {<br>			.phys_start =3D =
0x40007000,<br>			.virt_start =3D 0x40007000,<br>			.size =3D 0x400,<br>			=
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_=
IO,<br>		},<br>		/* TIM12 - STM32MP157 */ {<br>			.phys_start =3D 0x4000600=
0,<br>			.virt_start =3D 0x40006000,<br>			.size =3D 0x400,<br>			.flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>=
		},<br>		/* TIM7 - STM32MP157 */ {<br>			.phys_start =3D 0x40005000,<br>		=
	.virt_start =3D 0x40005000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHO=
USE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		=
/* TIM6 - STM32MP157 */ {<br>			.phys_start =3D 0x40004000,<br>			.virt_sta=
rt =3D 0x40004000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_RE=
AD | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* TIM5 - =
STM32MP157 */ {<br>			.phys_start =3D 0x40003000,<br>			.virt_start =3D 0x4=
0003000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILH=
OUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* TIM4 - STM32MP157=
 */ {<br>			.phys_start =3D 0x40002000,<br>			.virt_start =3D 0x40002000,<b=
r>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_W=
RITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* TIM3 - STM32MP157 */ {<br>	=
		.phys_start =3D 0x40001000,<br>			.virt_start =3D 0x40001000,<br>			.size=
 =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>=
				JAILHOUSE_MEM_IO,<br>		},<br>		/* TIM2 - STM32MP157 */ {<br>			.phys_st=
art =3D 0x40000000,<br>			.virt_start =3D 0x40000000,<br>			.size =3D 0x400=
,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHO=
USE_MEM_IO,<br>		},<br><br>		/*********************************************=
******************************/<br>		/****************************** RAM AL=
IASES ********************************/<br>		/************************* 0x3=
0000000 - 0x40000000 *************************/<br>		/*********************=
******************************************************/<br>		/* RETRAM */{<=
br>			.phys_start =3D 0x38000000,<br>			.virt_start =3D 0x38000000,<br>			.=
size =3D 0x10000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE=
,<br>		},<br>		/* SRAM - ALIAS 4 */{<br>			.phys_start =3D 0x30050000,<br>	=
		.virt_start =3D 0x30050000,<br>			.size =3D 0x10000,<br>			.flags =3D JAI=
LHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<br>		},<br>		/* SRAM - ALIAS 3 */{<b=
r>			.phys_start =3D 0x30040000,<br>			.virt_start =3D 0x30040000,<br>			.s=
ize =3D 0x10000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,=
<br>		},<br>		/* SRAM - ALIAS 2 */{<br>			.phys_start =3D 0x30020000,<br>		=
	.virt_start =3D 0x30020000,<br>			.size =3D 0x20000,<br>			.flags =3D JAIL=
HOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				 JAILHOUSE_MEM_EXECUTE,<br>		=
},<br>		/* SRAM - ALIAS 1 */{<br>			.phys_start =3D 0x30000000,<br>			.virt=
_start =3D 0x30000000,<br>			.size =3D 0x20000,<br>			.flags =3D JAILHOUSE_=
MEM_READ | JAILHOUSE_MEM_WRITE |<br>				 JAILHOUSE_MEM_EXECUTE,<br>		},<br>=
<br>		/****************************** SRAMs *******************************=
*******/<br>		/************************* 0x10000000 - 0x30000000 **********=
***************/<br>		/****************************************************=
***********************/<br>		/* SYSRAM */{<br>			.phys_start =3D 0x2FFC000=
0,<br>			.virt_start =3D 0x2FFC0000,<br>			.size =3D 0x40000,<br>			.flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<br>		},<br>		/* SRAM4 */{<br>=
			.phys_start =3D 0x10050000,<br>			.virt_start =3D 0x10050000,<br>			.siz=
e =3D 0x10000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<b=
r>		},<br>		/* SRAM3 */{<br>			.phys_start =3D 0x10040000,<br>			.virt_star=
t =3D 0x10040000,<br>			.size =3D 0x10000,<br>			.flags =3D JAILHOUSE_MEM_R=
EAD | JAILHOUSE_MEM_WRITE,<br>		},<br>		/* SRAM2 */{<br>			.phys_start =3D =
0x10020000,<br>			.virt_start =3D 0x10020000,<br>			.size =3D 0x20000,<br>	=
		.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				 JAILHOUSE_M=
EM_EXECUTE,<br>		},<br>		/* SRAM1 */{<br>			.phys_start =3D 0x10000000,<br>=
			.virt_start =3D 0x10000000,<br>			.size =3D 0x20000,<br>			.flags =3D JA=
ILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				 JAILHOUSE_MEM_EXECUTE,<br>=
		},<br>	},<br><br>	.irqchips =3D {<br>		/* GIC STM32MP157*/ {<br>			.addre=
ss =3D 0xA0021000,<br>			.pin_base =3D 32,<br>			.pin_bitmap =3D {<br>				0=
xffffffff, 0xffffffff, 0xffffffff, 0xffffffff<br>			},<br>		},<br>	},<br>};=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">pe 6. tammik. 2023 klo 9.19 Ralf Ramsauer (<a href=3D"mailto:ralf=
.ramsauer@oth-regensburg.de">ralf.ramsauer@oth-regensburg.de</a>) kirjoitti=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 06/01/2023 15:08, Tommi Parkkila wrote:<br>
&gt; Jan and Ralf - It looks like I have something wrong with the IRQ/GIC. =
<br>
&gt; When I get root cell up successfully, and if I press a button (that <b=
r>
&gt; presumably is assigned to a IRQ routine) I get the error print below a=
nd <br>
&gt; the whole system hangs. Is there any documentation on how I should <br=
>
&gt; specify IRQ/GIC on root cell configuration or jailhouse configuration =
<br>
&gt; for the target?<br>
<br>
Interesting. What&#39;s behind IRQ 74? Would you please share <br>
/proc/interrupts, /proc/iomem and the configuration of your root cell? <br>
And also maybe the full device tree using<br>
$ dtc -I fs -O dts /proc/device-tree -o stm32mp1.dts<br>
<br>
Thanks<br>
=C2=A0 =C2=A0Ralf<br>
<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; -tommi<br>
&gt; <br>
&gt; */[ =C2=A0 84.080587] irq 74: nobody cared (try booting with the &quot=
;irqpoll&quot; <br>
&gt; option)<br>
&gt; [ =C2=A0 84.085876] CPU: 0 PID: 606 Comm: kworker/0:4 Tainted: G =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OE <br>
&gt;=C2=A0 =C2=A0 =C2=A0 5.15.24-dirty #3<br>
&gt; [ =C2=A0 84.094144] Hardware name: STM32 (Device Tree Support)<br>
&gt; [ =C2=A0 84.099236] Workqueue: events dbs_work_handler<br>
&gt; [ =C2=A0 84.103724] [&lt;c0110d3c&gt;] (unwind_backtrace) from [&lt;c0=
10c6c0&gt;] <br>
&gt; (show_stack+0x10/0x14)<br>
&gt; [ =C2=A0 84.111377] [&lt;c010c6c0&gt;] (show_stack) from [&lt;c0bb3c50=
&gt;] <br>
&gt; (dump_stack_lvl+0x40/0x4c)<br>
&gt; [ =C2=A0 84.118918] [&lt;c0bb3c50&gt;] (dump_stack_lvl) from [&lt;c0ba=
f750&gt;] <br>
&gt; (__report_bad_irq+0x3c/0xc0)<br>
&gt; [ =C2=A0 84.126986] [&lt;c0baf750&gt;] (__report_bad_irq) from [&lt;c0=
185b8c&gt;] <br>
&gt; (note_interrupt+0x2a8/0x2f4)<br>
&gt; [ =C2=A0 84.135265] [&lt;c0185b8c&gt;] (note_interrupt) from [&lt;c018=
1fd8&gt;] <br>
&gt; (handle_irq_event_percpu+0x80/0x88)<br>
&gt; [ =C2=A0 84.143964] [&lt;c0181fd8&gt;] (handle_irq_event_percpu) from =
[&lt;c0182018&gt;] <br>
&gt; (handle_irq_event+0x38/0x5c)<br>
&gt; [ =C2=A0 84.152769] [&lt;c0182018&gt;] (handle_irq_event) from [&lt;c0=
186614&gt;] <br>
&gt; (handle_edge_irq+0xc4/0x218)<br>
&gt; [ =C2=A0 84.161046] [&lt;c0186614&gt;] (handle_edge_irq) from [&lt;c07=
3c8b4&gt;] <br>
&gt; (stm32_pwr_handle_irq+0x118/0x190)<br>
&gt; [ =C2=A0 84.169650] [&lt;c073c8b4&gt;] (stm32_pwr_handle_irq) from [&l=
t;c018165c&gt;] <br>
&gt; (handle_domain_irq+0x7c/0xb0)<br>
&gt; [ =C2=A0 84.178348] [&lt;c018165c&gt;] (handle_domain_irq) from [&lt;c=
063ff04&gt;] <br>
&gt; (gic_handle_irq+0x7c/0x90)<br>
&gt; [ =C2=A0 84.186522] [&lt;c063ff04&gt;] (gic_handle_irq) from [&lt;c010=
0afc&gt;] <br>
&gt; (__irq_svc+0x5c/0x90)<br>
&gt; [ =C2=A0 84.193950] Exception stack(0xced55bb8 to 0xced55c00)<br>
&gt; [ =C2=A0 84.199040] 5ba0:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 00000000 00000000<br>
&gt; [ =C2=A0 84.207198] 5bc0: 1d624000 c105fe80 c105fe80 00000000 c1810800=
 <br>
&gt; 00000080 ced54000 ced55ca8<br>
&gt; [ =C2=A0 84.215356] 5be0: ced55ca8 ced55c08 ced54000 ced55c08 c0101254=
 <br>
&gt; c0101268 20010113 ffffffff<br>
&gt; [ =C2=A0 84.223509] [&lt;c0100afc&gt;] (__irq_svc) from [&lt;c0101268&=
gt;] <br>
&gt; (__do_softirq+0xc0/0x430)<br>
&gt; [ =C2=A0 84.230833] [&lt;c0101268&gt;] (__do_softirq) from [&lt;c012c8=
e0&gt;] <br>
&gt; (irq_exit+0xd4/0x110)<br>
&gt; [ =C2=A0 84.238157] [&lt;c012c8e0&gt;] (irq_exit) from [&lt;c0181660&g=
t;] <br>
&gt; (handle_domain_irq+0x80/0xb0)<br>
&gt; [ =C2=A0 84.245797] [&lt;c0181660&gt;] (handle_domain_irq) from [&lt;c=
063ff04&gt;] <br>
&gt; (gic_handle_irq+0x7c/0x90)<br>
&gt; [ =C2=A0 84.253965] [&lt;c063ff04&gt;] (gic_handle_irq) from [&lt;c010=
0afc&gt;] <br>
&gt; (__irq_svc+0x5c/0x90)<br>
&gt; [ =C2=A0 84.261392] Exception stack(0xced55ca8 to 0xced55cf0)<br>
&gt; [ =C2=A0 84.266383] 5ca0: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 df858000 df858004 00000000 <br>
&gt; c1b6cb80 c1b6cb80 c1b3cec0<br>
&gt; [ =C2=A0 84.274541] 5cc0: c1bf8074 c120b400 c1b3cf40 c1b3cf48 c1986010=
 <br>
&gt; cf0ba580 c205ac44 ced55cf8<br>
&gt; [ =C2=A0 84.282695] 5ce0: c09a38d8 c09a34fc 60010013 ffffffff<br>
&gt; [ =C2=A0 84.287781] [&lt;c0100afc&gt;] (__irq_svc) from [&lt;c09a34fc&=
gt;] <br>
&gt; (shmem_tx_prepare+0xcc/0xdc)<br>
&gt; [ =C2=A0 84.295422] [&lt;c09a34fc&gt;] (shmem_tx_prepare) from [&lt;c0=
9a38d8&gt;] <br>
&gt; (smc_send_message+0x24/0x120)<br>
&gt; [ =C2=A0 84.303696] [&lt;c09a38d8&gt;] (smc_send_message) from [&lt;c0=
99ae50&gt;] <br>
&gt; (do_xfer+0x98/0x464)<br>
&gt; [ =C2=A0 84.311234] [&lt;c099ae50&gt;] (do_xfer) from [&lt;c099f40c&gt=
;] <br>
&gt; (scmi_clock_rate_get+0x70/0xc4)<br>
&gt; [ =C2=A0 84.318983] [&lt;c099f40c&gt;] (scmi_clock_rate_get) from [&lt=
;c067f358&gt;] <br>
&gt; (scmi_clk_recalc_rate+0x3c/0x70)<br>
&gt; [ =C2=A0 84.327791] [&lt;c067f358&gt;] (scmi_clk_recalc_rate) from [&l=
t;c0677004&gt;] <br>
&gt; (clk_recalc+0x34/0x74)<br>
&gt; [ =C2=A0 84.331653] sched: RT throttling activated<br>
&gt; [ =C2=A0 84.339991] [&lt;c0677004&gt;] (clk_recalc) from [&lt;c0679e18=
&gt;] <br>
&gt; (clk_change_rate+0xf8/0x544)<br>
&gt; [ =C2=A0 84.347653] [&lt;c0679e18&gt;] (clk_change_rate) from [&lt;c06=
7a3f4&gt;] <br>
&gt; (clk_core_set_rate_nolock+0x190/0x1d8)<br>
&gt; [ =C2=A0 84.356687] [&lt;c067a3f4&gt;] (clk_core_set_rate_nolock) from=
 [&lt;c067a46c&gt;] <br>
&gt; (clk_set_rate+0x30/0x88)<br>
&gt; [ =C2=A0 84.365300] [&lt;c067a46c&gt;] (clk_set_rate) from [&lt;c095a9=
10&gt;] <br>
&gt; (_set_opp+0x2d0/0x5f0)<br>
&gt; [ =C2=A0 84.372647] [&lt;c095a910&gt;] (_set_opp) from [&lt;c095acc0&g=
t;] <br>
&gt; (dev_pm_opp_set_rate+0x90/0x16c)<br>
&gt; [ =C2=A0 84.380508] [&lt;c095acc0&gt;] (dev_pm_opp_set_rate) from [&lt=
;c095ff8c&gt;] <br>
&gt; (__cpufreq_driver_target+0x110/0x2f8)<br>
&gt; [ =C2=A0 84.389840] [&lt;c095ff8c&gt;] (__cpufreq_driver_target) from =
[&lt;c0962f94&gt;] <br>
&gt; (od_dbs_update+0xb4/0x160)<br>
&gt; [ =C2=A0 84.398540] [&lt;c0962f94&gt;] (od_dbs_update) from [&lt;c0963=
b18&gt;] <br>
&gt; (dbs_work_handler+0x2c/0x58)<br>
&gt; [ =C2=A0 84.406499] [&lt;c0963b18&gt;] (dbs_work_handler) from [&lt;c0=
141dec&gt;] <br>
&gt; (process_one_work+0x1dc/0x588)<br>
&gt; [ =C2=A0 84.414881] [&lt;c0141dec&gt;] (process_one_work) from [&lt;c0=
1421e4&gt;] <br>
&gt; (worker_thread+0x4c/0x520)<br>
&gt; [ =C2=A0 84.422940] [&lt;c01421e4&gt;] (worker_thread) from [&lt;c0149=
df8&gt;] <br>
&gt; (kthread+0x170/0x1a0)<br>
&gt; [ =C2=A0 84.430367] [&lt;c0149df8&gt;] (kthread) from [&lt;c0100130&gt=
;] <br>
&gt; (ret_from_fork+0x14/0x24)<br>
&gt; [ =C2=A0 84.437481] Exception stack(0xced55fb0 to 0xced55ff8)<br>
&gt; [ =C2=A0 84.442571] 5fa0: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 00000000 <br>
&gt; 00000000 00000000 00000000<br>
&gt; [ =C2=A0 84.450726] 5fc0: 00000000 00000000 00000000 00000000 00000000=
 <br>
&gt; 00000000 00000000 00000000<br>
&gt; [ =C2=A0 84.458880] 5fe0: 00000000 00000000 00000000 00000000 00000013=
 00000000<br>
&gt; [ =C2=A0 84.465448] handlers:<br>
&gt; [ =C2=A0 84.467682] [&lt;716ecdd6&gt;] irq_default_primary_handler thr=
eaded <br>
&gt; [&lt;63fec1af&gt;] regmap_irq_thread<br>
&gt; [ =C2=A0 84.476083] Disabling IRQ #74/*<br>
&gt; <br>
&gt; torstai 5. tammikuuta 2023 klo 13.00.34 UTC-5 Tommi Parkkila kirjoitti=
:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Ralf - Not sure what you mean by your note.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Jan - root cell configuration is now fixed what com=
es to overlapped<br>
&gt;=C2=A0 =C2=A0 =C2=A0memory regions. However, the=C2=A0both issues: */1.=
 Terminal hangs/*, and<br>
&gt;=C2=A0 =C2=A0 =C2=A0*/2. Issue with setting CPU clock/* still exists. I=
 am not familiar<br>
&gt;=C2=A0 =C2=A0 =C2=A0with clock configurations on the target, but yes TF=
-A is in use.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-tommi<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0to 5. tammik. 2023 klo 12.54 Ralf Ramsauer<br>
&gt;=C2=A0 =C2=A0 =C2=A0(<a href=3D"mailto:ralf.r...@oth-regensburg.de" tar=
get=3D"_blank">ralf.r...@oth-regensburg.de</a>) kirjoitti:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 05/01/2023 18:24, Jan Kiszka wrote=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; On 05.01.23 18:21, Tommi Parkki=
la wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; Oh, I was missing *.cell fr=
om the point 2. Now fixed=C2=A0and no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0complaints.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; to 5. tammik. 2023 klo 12.2=
0 Tommi Parkkila<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(<a href=3D"mailto:tommi.p...@gmail.c=
om" target=3D"_blank">tommi.p...@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; &lt;mailto:<a href=3D"mailt=
o:tommi.p...@gmail.com" target=3D"_blank">tommi.p...@gmail.com</a>&gt;) kir=
joitti:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 Jan - J=
ust ran the config check on the host PC and on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 1. On h=
ost, it identified some memregion overlappings<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that were due<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 my own =
copy/paste errors. It also complained a missing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resource<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 interce=
ption for architecture x86:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 */In ce=
ll &#39;STM32MP1-Root&#39;, region 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
phys_start: 0x00000000f7600000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
virt_start: 0x00000000f7600000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
size: =C2=A0 =C2=A0 =C2=A0 0x0000000009a00000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
flags: =C2=A0 =C2=A0 =C2=A0JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 JAILHOU=
SE_MEM_EXECUTE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 overlap=
s with xAPIC<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Another detail when running cro=
ss: &quot;-a arm&quot; - you don&#39;t have<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to worry<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; about x86 resources on your tar=
get.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Side note: We should store the archit=
ecture in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configuration. Just<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for the same reason why we introduced=
 the magic byte at the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0beginning=E2=80=A6<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ralf<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Jan<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
phys_start: 0x00000000fee00000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
virt_start: 0x00000000fee00000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
size: =C2=A0 =C2=A0 =C2=A0 0x0000000000001000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
flags:=C2=A0=C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 I fixed=
 the copy paste mem=C2=A0overlappings, do I need to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0worry about<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 the xAP=
IC overlapping?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 2. On t=
arget, the check complained the configuration is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0not root<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 cell co=
nfiguration???<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 */root@=
stm32mp1:~# jailhouse/tools/jailhouse-config-check<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 jailhou=
se/configs/stm32mp157.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 Reading=
 configuration set:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 Not a r=
oot cell configuration:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jailhouse/configs/arm/stm32mp157.c/*<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 The con=
fig here is the same as ran on the host PC. What<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0causes it to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 complai=
n the above?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 to 5. t=
ammik. 2023 klo 11.55 Jan Kiszka<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(<a href=3D"mailto:jan.k...@siemens.c=
om" target=3D"_blank">jan.k...@siemens.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 &lt;mai=
lto:<a href=3D"mailto:jan.k...@siemens.com" target=3D"_blank">jan.k...@siem=
ens.com</a>&gt;) kirjoitti:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 On 05.01.23 17:53, Tommi Parkkila wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt; Jan - Thanks again. I have not tried the config<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check yet.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Actually, it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt; does not work on hw currently, it does not find<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pyjailhouse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 module. I&#39;ll<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt; check whats=C2=A0going wrong with it and=C2=A0let you know.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 You can also run it offline, even directly from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source folder<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (tools/jailhouse-config-check ...).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Jan<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt; -tommi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt; to 5. tammik. 2023 klo 10.21 Jan Kiszka<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (<a href=3D"mailto:jan.k...@siemens.com" target=3D"_blank">jan.k...@=
siemens.com</a> &lt;mailto:<a href=3D"mailto:jan.k...@siemens.com" target=
=3D"_blank">jan.k...@siemens.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt; &lt;mailto:<a href=3D"mailto:jan.k...@siemens.com" target=3D"_b=
lank">jan.k...@siemens.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;mailto:<a href=3D"mailto:jan.k...@siemens.com" target=3D"_blank"=
>jan.k...@siemens.com</a>&gt;&gt;) kirjoitti:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0On 05.01.23 15:34, Tommi Parkkila wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks for your reply, Jan. I managed t=
o<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get forward<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 from the &#39;hang&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; condition. There were several<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0misdefinitions on my root-cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; configuration. Now I get the root-cell =
started<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sometimes, but more<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0often<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; I get two types of issues after enable<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command. Any help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 or ideas<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0where<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; to continue my debugging would be great=
ly<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0appreciated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Please, see the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; issues explained below.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Already tried &quot;jailhouse config check&q=
uot;?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; -tommi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; +++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; 1. Terminal hangs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; -- After the enable command for the roo=
t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cell, jailhouse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 gets started<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; but then the terminal goes unresponsive=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Below, example<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 log, where I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; give ls cmd, which then causes terminal=
 to go<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 unresponsive...:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Missing interrupts could be one reason. Or<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0something is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 completely<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0broken with memory mapping so that a kernel<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 gets stuck on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0waiting for some register bit to flip, e.g.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0But most<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 frequent are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0interrupt issues, specifically around GIC<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resources being<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 improperly<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0passed through. The config checker may find =
that.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; /*root@stm32mp1:~# modprobe jailhouse<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ 1315.034414] jailhouse: loading<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out-of-tree module<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 taints kernel.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; root@stm32mp1:~# jailhouse enable<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; ~/jailhouse/configs/arm/itron_stm32mp15=
7.cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Initializing Jailhouse hypervisor v0.12=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (314-gc7a1b697-dirty) on CPU 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Code location: 0xf0000040<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Page pool usage after early setup: mem<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A028/1514, remap<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0/131072<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Initializing processors:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0CPU 0... OK<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0CPU 1... OK<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Initializing unit: irqchip<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Initializing unit: PCI<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Page pool usage after late setup: mem<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A050/1514, remap<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 5/131072<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [0] Activating hypervisor<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ 1355.352714] The Jailhouse is opening=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; root@stm32mp1:~# ls*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; 2. Issue with setting CPU clock<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; -- The second issue I see is related to=
 i2c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bus and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 system clock.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; Terminal starts printing error statemen=
ts<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0infinitely<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 after Jailhouse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; opening. Below, is a snippet of an exam=
ple<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logs.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; */[ =C2=A0 85.322027] The Jailhouse is =
opening.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 85.322648] stm32f7-i2c 5c00200=
0.i2c:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failed to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 prepare_enable<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0clock<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; root@stm32mp1:~# [ =C2=A0 85.339233] cp=
u cpu0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 _set_opp_voltage: failed to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; set voltage (1350000 1350000 1350000 mV=
): -22<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 85.350413] cpufreq: __target_i=
ndex:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Failed to change cpu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0frequency: -22<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 85.357706] cpu cpu0: _set_opp_=
voltage:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failed to set<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 voltage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; (1350000 1350000 1350000 mV): -22<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 85.365124] cpufreq: __target_i=
ndex:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Failed to change cpu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0frequency: -22<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; [ =C2=A0 85.381985] cpu cpu0: _set_opp_=
voltage:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0failed to set<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 voltage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; (1350000 1350000 1350000 mV): -22<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; /*- - -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&gt; +++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Same possible reasons as above. Or do you<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0know how clock<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 control happens<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0on that platform? Is there firmware (TF-A?)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0involved?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Jan<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Siemens AG, Technology<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Competence Center Embedded Linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Siemens AG, Technology<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Competence Center Embedded Linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt; -- <br>
&gt; You received this message because you are subscribed to the Google <br=
>
&gt; Groups &quot;Jailhouse&quot; group.<br>
&gt; To unsubscribe from this group and stop receiving emails from it, send=
 <br>
&gt; an email to <a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups=
.com" target=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups.=
com" target=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>&gt;.<=
br>
&gt; To view this discussion on the web visit <br>
&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/369cc253-86=
06-476b-a8d7-38ed11beaa2fn%40googlegroups.com" rel=3D"noreferrer" target=3D=
"_blank">https://groups.google.com/d/msgid/jailhouse-dev/369cc253-8606-476b=
-a8d7-38ed11beaa2fn%40googlegroups.com</a> &lt;<a href=3D"https://groups.go=
ogle.com/d/msgid/jailhouse-dev/369cc253-8606-476b-a8d7-38ed11beaa2fn%40goog=
legroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" rel=3D"noreferrer"=
 target=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/369cc253=
-8606-476b-a8d7-38ed11beaa2fn%40googlegroups.com?utm_medium=3Demail&amp;utm=
_source=3Dfooter</a>&gt;.<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAP8Rr63YNKfgZ-yN2CaimBAsbFE-3VdA1%2BKEH40kpi4h0A3=
%3DSQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAP8Rr63YNKfgZ-yN2CaimBAsbFE-3VdA1%2BKE=
H40kpi4h0A3%3DSQ%40mail.gmail.com</a>.<br />

--00000000000031b6e005f19a4689--
