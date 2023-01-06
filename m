Return-Path: <jailhouse-dev+bncBDWL7NVN6MHRBA4T4GOQMGQEHXE5VAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id F11FD66041A
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Jan 2023 17:17:09 +0100 (CET)
Received: by mail-lj1-x237.google.com with SMTP id c18-20020a2ebf12000000b00279a72705fesf521464ljr.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Jan 2023 08:17:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673021829; cv=pass;
        d=google.com; s=arc-20160816;
        b=AAoxePpq4kT8NxwnYtXuziXOWxHzXUbd9Cv5aGbUX1B907cdSwS+cqu7IuIAOpWT70
         Ti8pp63A5fE73v4TezkKUzejnaQn0QPzjSa5YlLXNi6Mtf8pLDB/27NywNRtzcGXWSN5
         zvf0Vg1CoJsiX4Gnw2FGC+HR3kwibEy93pafy/01kBxW53IduQSRCv7na2sufVxI3pUj
         nUaLrxHnDECRsg1N8p4jbxjsUyoz7071qkivBgHhQNLxtCOxBVozkLqOtVch4OcQ2pdd
         uSMNqROFMGtSWQvzTF9z7ItGshF0/PnLFw1OWZNKHtKgE7V0S3yR63unu6l6dA94DhTK
         BdRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=+fyh9Y72TBVpltIy/qThgZZyhhspenhZjdb3U3XW09E=;
        b=RiXd3iYAl8JJxAvMx31KlKNevFOBvgtonZfDaao9yL2BNiBvjutmh2jtEsgTqNfkir
         QIjLRir6Wt8GRrBj0lC//N3F4mRfx9ayiiMvv8TkAL4NyoYw2qdjOS3ytMPCznNgpAmE
         qjojtEbkJxnQCDu+pBfZ5SlusPAd+G6ii7DOgq/uTZHvLICMbc3rwxE1PljLJyvcoiyt
         /6812cZhwBnMN2asp0oIs2OJk4d56nEuEF3e7meBBqhs21A6kaMwYnz0zv32h4zjIoSz
         iEUE5RrP1uwN+7DhllXMJMj+HadhDRGOD+44AJmTzp0MlFFaUW1mMo/rvtohv13OrjRD
         XLFA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=WNVQFdWU;
       spf=pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::431 as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fyh9Y72TBVpltIy/qThgZZyhhspenhZjdb3U3XW09E=;
        b=pWLUwlwVgJx5yu2kD6ac35d5iffW7rNguKdbEeYEfZcXTIrhOD4R9kOLF7eCIkyqiz
         7o/G7+D0iGcSYTdkeDqteOANdfEY2g/UomQFUdPuO3Kdy2KvpIW97hzOozegbVWEBENQ
         KwnkSVBiReoD0xxzARQKFNgqLBnz9CHNLL+5DnWhAgJq1Zir5ZByjdnZLwjNi1JIwbzg
         zwzYaECgfj8aWeE1bunyu6rGZcFh8OPQw/qXW0w0Im5T+4U10zuUbqaIwKX2RUQ1QZzM
         zSfl6U+dRz73Z0RxOVj0ru1IjvZz4dc9M7V8/tt56gugOZQxdPj4evjEDwITUXcULEQ8
         m3ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+fyh9Y72TBVpltIy/qThgZZyhhspenhZjdb3U3XW09E=;
        b=gByltdX4tUucqYUOcDRtqhwBdNFkrxiK5JT8d18TeIZE+7ncbmCOOlxM8avRJtugv+
         DvXIV2evk3A8yVn3/PkCpJfFMSGLknGrwKAyyR1eglG2ebnw43rEOLXPe5efaMsvWHWr
         oJqBqAXvkagMWyMKw1xRZzpxBMe303f1eaUxMCufwtdogm7XknFEesXBuhhWZ4f0VRQP
         3lBfXp1oSi049xrybudSi1EobhADaVf5rj+nIHafQHHhLLvo8HmtRT3t4SSVC2ASE9KN
         Ugdaosm6g8erjWCzXJkqBHjtNTNsn17bBRjWyFfsZgz571uhg5rh0JhMpoSrTeuohWAU
         kcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fyh9Y72TBVpltIy/qThgZZyhhspenhZjdb3U3XW09E=;
        b=r9zly3Qc6XBqJqiwcn0vKMnHkbRRtxbT5/cTZOa6KW7QRdcJQxSmwZZThK3A9uHEmv
         jR8TEeErnuqkGZpfgTSfYOu+vpujAGvDrwPjMXxffzrrh3d8FJYq4WKXWfe1x4lcB6Tp
         PK8KAxFWyHg40M8ElGKAUlzoY+e/fU+3UaNX0+mMJ14Pw6220L/6zh7xUWFU9dK4EEYY
         T51yera6N8tp++zkACHD7CE/S+m7CCDSZhVPRBiBnWFtOHCr/Iupi1FOfsioA4g/tQgj
         fRvX8do1PKJqL3MpVwX7cqOg6n7qYy/9r9P44THEaQD3PF3uRC+WemWwXygp4axDsodR
         1gcA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kq6m07ai1SbNH2xDQJ9mLXjS89UZfnkykwKaMsqkajS5R4r4j4N
	IW4R/wR3gA/Ff66ODXZN4UQ=
X-Google-Smtp-Source: AMrXdXsvFN130I0O3Xe6MrVr+wI9b+zKH05CQi5tGm2NLdrMWiKhkSjqP1sn1WeHhUWz9plb6Qnybw==
X-Received: by 2002:ac2:50ce:0:b0:4cb:2873:a180 with SMTP id h14-20020ac250ce000000b004cb2873a180mr2717648lfm.477.1673021828682;
        Fri, 06 Jan 2023 08:17:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3f0:b0:4a2:3951:eac8 with SMTP id
 n16-20020a05651203f000b004a23951eac8ls486090lfq.0.-pod-prod-gmail; Fri, 06
 Jan 2023 08:17:06 -0800 (PST)
X-Received: by 2002:a05:6512:169e:b0:4ca:f58f:1960 with SMTP id bu30-20020a056512169e00b004caf58f1960mr17102193lfb.33.1673021826343;
        Fri, 06 Jan 2023 08:17:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673021826; cv=none;
        d=google.com; s=arc-20160816;
        b=jhExJYi+vauYl8i5ffzSyzPajqvowioObfyydJ4a8Cpb+0ir5O7erBwHtXzQZl7rTo
         KnNmAdjmPEsbCSrRh6zG+X1xf1+hjmcH7SZvKoxPu0m6sUNDXi6FPJ3w5NUWBQ5KlfU1
         V8fit0CEDkdgYwtUxfJk8cY1Mz5fuWGqcYp8G1jaIVUMH9lMGtucj8Ge0mwPcblUZbfb
         i47qDOoWaXHKtgCpjzHZTnnrLJKqslV7QTmUyAY6MwGDycoXFOTLQ1i/ziD1f5Jkzps9
         X0OEcDas+Z8d5G7ihQ5GE+H4E8waOBCoiSlyjtdYgZ+5Fjc7pJCs/LNtxcg2wOnMpYg8
         LlVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W+ELL4/pHpGn91Q9OusWbXLXVTSsroRt63zS8D9rmw4=;
        b=e3yYkH8iVovaJfox4TKQlXzAyl+S5+4jV7prpn4ElKFXqCgWURpvYV8DHNnFs+V9P2
         t2/hM1/svv0vPA6kq443fnSZnKw6fPzKr3XJtlOvWC81+XbUFtutJkyR3BdXl4f0UiZ3
         OtAi7hmfP5Rgb05qrgc0Fqacdmp4S4o+XsB178hxg7UmgeT/8hurPaUNgQOMr4Z9wiX0
         N8lf859naO88Ne7KgD/+RqYbK/rOcts5OFy/pJZ4r4kc1N4iBOXQWBkNiqdG/uCyOIDf
         kcToY32Fo3RDJhwlBm75DPK1c5I3lXI9KEPMvJQ5/IRMf7yD7+03Vwk0WUYVTLYivlo0
         c/Jw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=WNVQFdWU;
       spf=pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::431 as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com. [2a00:1450:4864:20::431])
        by gmr-mx.google.com with ESMTPS id bj36-20020a2eaaa4000000b002810d5101ffsi52056ljb.2.2023.01.06.08.17.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 08:17:06 -0800 (PST)
Received-SPF: pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::431 as permitted sender) client-ip=2a00:1450:4864:20::431;
Received: by mail-wr1-x431.google.com with SMTP id w1so1698849wrt.8
        for <jailhouse-dev@googlegroups.com>; Fri, 06 Jan 2023 08:17:05 -0800 (PST)
X-Received: by 2002:adf:f791:0:b0:27c:b077:d7fd with SMTP id
 q17-20020adff791000000b0027cb077d7fdmr1455939wrp.379.1673021825129; Fri, 06
 Jan 2023 08:17:05 -0800 (PST)
MIME-Version: 1.0
References: <bfb4732c-21e8-4a5d-8a0d-382041e7554cn@googlegroups.com>
 <3071214a-b5a8-4096-8ad4-3a79b6634de5@siemens.com> <CAP8Rr63c3LS3Z_OU201aSokZ8NCUdoeXeAMGZ=Qu4d-TMV+wVQ@mail.gmail.com>
 <990aa280-3365-429b-cd73-d1b89b0b4a83@siemens.com> <CAP8Rr619HSJUVs3GTLBzP=r_4_svq8yvbP5JAADjWK2dwoLLZg@mail.gmail.com>
 <e9acd20c-b3cb-4887-788a-266534ab5a19@siemens.com> <CAP8Rr628BM-8rQR+K4gw2GFPHZZXgVvbtdNF90fpyXU9Nxsx1A@mail.gmail.com>
 <CAP8Rr619qqqSCc0QBBzet2DfL10B0axK_2s0Pohb6p_JqrBxqg@mail.gmail.com>
 <82959f20-2de7-5d7b-ce9b-cb8aa1476c32@siemens.com> <a4c03581-e791-6448-92be-c51e896be4bd@oth-regensburg.de>
 <CAP8Rr63GpSabsH1hfq-0TqUPrzT735PyE4EUUu12-wxc6YOZsg@mail.gmail.com>
 <369cc253-8606-476b-a8d7-38ed11beaa2fn@googlegroups.com> <56643ee7-2f74-39a2-dfa7-ad2abf603bd5@oth-regensburg.de>
 <CAP8Rr63YNKfgZ-yN2CaimBAsbFE-3VdA1+KEH40kpi4h0A3=SQ@mail.gmail.com>
In-Reply-To: <CAP8Rr63YNKfgZ-yN2CaimBAsbFE-3VdA1+KEH40kpi4h0A3=SQ@mail.gmail.com>
From: Tommi Parkkila <tommi.parkkila@gmail.com>
Date: Fri, 6 Jan 2023 11:16:53 -0500
Message-ID: <CAP8Rr60GYLysxvzeovfJ8CZ02DBzVjurmZ5s0bf6W0D6BaJwAA@mail.gmail.com>
Subject: Re: STM32MP1 hangs on when entering hypervisor
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/mixed; boundary="00000000000096bd3105f19abfe1"
X-Original-Sender: Tommi.Parkkila@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=WNVQFdWU;       spf=pass
 (google.com: domain of tommi.parkkila@gmail.com designates
 2a00:1450:4864:20::431 as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
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

--00000000000096bd3105f19abfe1
Content-Type: multipart/alternative; boundary="00000000000096bd2f05f19abfdf"

--00000000000096bd2f05f19abfdf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ralf - Please, find the full device tree attached. I used "*root@stm32mp1:~=
#
find /proc/device-tree/ -type f -exec head {} + | less > devicetree.txt*"
on target to generate the tree. Maybe this works for you?
Thanks

pe 6. tammik. 2023 klo 10.42 Tommi Parkkila (tommi.parkkila@gmail.com)
kirjoitti:

> Ralf - here is the root cell configuration:
>
> /*
>  * Jailhouse, a Linux-based partitioning hypervisor
>  *
>  * Test configuration for Banana Pi board (A20 dual-core Cortex-A7, 1G RA=
M)
>  * https://banana-pi.org/en/banana-pi-sbcs/4.html
>  * Copyright (c) Siemens AG, 2014
>  *
>  * Authors:
>  *  Jan Kiszka <jan.kiszka@siemens.com>
>  *
>  * This work is licensed under the terms of the GNU GPL, version 2.  See
>  * the COPYING file in the top-level directory.
>  *
>  *  THIS IS A JAILHOUSE ROOT CELL CONFIGURATION FILE FOR STM32MP157
>  *  -   BASED ON BANANA PI EXAMPLE FROM JAILHOUSE REPO (A20 Dual Core
> Cortex-A7,
>  *      -   A20 UserManual:
> https://github.com/allwinner-zh/documents/raw/master/A20/A20_User_Manual_=
v1.4_20150510.pdf
>  *      -   A20 DataSheet:
> https://github.com/allwinner-zh/documents/raw/master/A20/A20_Datasheet_v1=
.5_20150510.pdf
>  *  -   WORK IN PROGRESS
>  *      -   STM32MP157 REF Manual:
> https://www.st.com/resource/en/reference_manual/DM00327659-.pdf
>  *          -   Memory map on page 158
>  */
>
> #include <jailhouse/types.h>
> #include <jailhouse/cell-config.h>
>
> struct {
> struct jailhouse_system header;
> __u64 cpus[1];
> // struct jailhouse_memory mem_regions[127];
> struct jailhouse_memory mem_regions[131];
> struct jailhouse_irqchip irqchips[1];
> } __attribute__((packed)) config =3D {
> .header =3D {
> .signature =3D JAILHOUSE_SYSTEM_SIGNATURE,
> .revision =3D JAILHOUSE_CONFIG_REVISION,
> .flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> .hypervisor_memory =3D {
>              /* STM32MP157 */
> .phys_start =3D 0xF7000000,
> .size =3D 0x0600000,
> },
> .debug_console =3D {
> /* UART-4 STM32MP157 */
> .address =3D 0x40010000,
> .size =3D 0x400,
> /* .clock_reg =3D 0x01c2006c, */
> /* .gate_nr =3D 16 */
> /* .divider =3D 0x0d, */
> .type =3D JAILHOUSE_CON_TYPE_STM32H7,
> .flags =3D JAILHOUSE_CON_ACCESS_MMIO |
> JAILHOUSE_CON_REGDIST_4,
> },
> .platform_info =3D {
> .arm =3D {
>                 /* STM32MP157 */
> .gic_version =3D 2,
> .gicd_base =3D 0xA0021000, /// Distributor
> .gicc_base =3D 0xA0022000, /// CPU
> .gich_base =3D 0xA0024000, /// Hypervisor
> .gicv_base =3D 0xA0026000, /// Virtual CPU
> .maintenance_irq =3D 25,
> },
> },
> .root_cell =3D {
> .name =3D "STM32MP1-Root",
>
> .cpu_set_size =3D sizeof(config.cpus),
> .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
> .num_irqchips =3D ARRAY_SIZE(config.irqchips),
> },
> },
>
> /* STM32MP157 */
> .cpus =3D {
> 0x3,
> },
> .mem_regions =3D {
> /* IVSHMEM shared memory region - STM32MP157 */
> /* - This macro creates four shared memory regions with a total size of
> 0x100000 (1M), see cell-config.h*/
> /* - Created and reserved a continous memory region in kernel device tree
> for this one as well. */
> /* - Placed the memory region before hypervisor region. */
> //JAILHOUSE_SHMEM_NET_REGIONS(0xfdf00000, 0),
> // /* SPI */ {
> // .phys_start =3D 0x01c05000,
> // .virt_start =3D 0x01c05000,
> // .size =3D 0x00001000,
> // .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> // JAILHOUSE_MEM_IO,
> // },
>
>
> /************************************************************************=
***/
> /****************************** DDR
> ******************************/
> /************************* 0xC0000000 - 0xFFFFFFFF
> *************************/
>
> /************************************************************************=
***/
> /* RAM1 - STM32MP157 */ {
> .phys_start =3D 0xC0000000,
> .virt_start =3D 0xC0000000,
> .size =3D 0x36A00000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE,
> },
> /* JAILHOUSE INMATE LOCATED AT 0xf6a00000 - 0xf7000000*/
> /* JAILHOUSE LOCATED AT 0xf7000000 - 0xF7600000*/
> /* RAM2 - STM32MP157 */ {
> .phys_start =3D 0xF7600000,
> .virt_start =3D 0xF7600000,
> .size =3D 0x9A00000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE,
> },
>
>
> /************************************************************************=
***/
> /****************************** PERIPHERALS 2
> ******************************/
> /************************* 0x50000000 - 0x60000000
> *************************/
>
> /************************************************************************=
***/
> /* TAMP - STM32MP157 */ {
> .phys_start =3D 0x5C00A000,
> .virt_start =3D 0x5C00A000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* I2C6 - STM32MP157 */ {
> .phys_start =3D 0x5C009000,
> .virt_start =3D 0x5C009000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* STGENC - STM32MP157 */ {
> .phys_start =3D 0x5C008000,
> .virt_start =3D 0x5C008000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* ETZPC - STM32MP157 */ {
> .phys_start =3D 0x5C007000,
> .virt_start =3D 0x5C007000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* TZC - STM32MP157 */ {
> .phys_start =3D 0x5C006000,
> .virt_start =3D 0x5C006000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* BSEC - STM32MP157 */ {
> .phys_start =3D 0x5C005000,
> .virt_start =3D 0x5C005000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* RTC - STM32MP157 */ {
> .phys_start =3D 0x5C004000,
> .virt_start =3D 0x5C004000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* IWDG1 - STM32MP157 */ {
> .phys_start =3D 0x5C003000,
> .virt_start =3D 0x5C003000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* I2C4 - STM32MP157 */ {
> .phys_start =3D 0x5C002000,
> .virt_start =3D 0x5C002000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* SPI6 - STM32MP157 */ {
> .phys_start =3D 0x5C001000,
> .virt_start =3D 0x5C001000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* USART1 - STM32MP157 */ {
> .phys_start =3D 0x5C000000,
> .virt_start =3D 0x5C000000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* DDRPERFM - STM32MP157 */ {
> .phys_start =3D 0x5A007000,
> .virt_start =3D 0x5A007000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* USBPHYC - STM32MP157 */ {
> .phys_start =3D 0x5A006000,
> .virt_start =3D 0x5A006000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* STGENR - STM32MP157 */ {
> .phys_start =3D 0x5A005000,
> .virt_start =3D 0x5A005000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* DDRPHYC - STM32MP157 */ {
> .phys_start =3D 0x5A004000,
> .virt_start =3D 0x5A004000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* DDRCTRL - STM32MP157 */ {
> .phys_start =3D 0x5A003000,
> .virt_start =3D 0x5A003000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* IWDG2 - STM32MP157 */ {
> .phys_start =3D 0x5A002000,
> .virt_start =3D 0x5A002000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,
> },
> /* LTDC - STM32MP157 */ {
> .phys_start =3D 0x5A001000,
> .virt_start =3D 0x5A001000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* DSI - STM32MP157 */ {
> .phys_start =3D 0x5A000000,
> .virt_start =3D 0x5A000000,
> .size =3D 0x800,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* GPU - STM32MP157 */ {
> .phys_start =3D 0x59000000,
> .virt_start =3D 0x59000000,
> .size =3D 0x40000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* USBH_EHCI - STM32MP157 */ {
> .phys_start =3D 0x5800D000,
> .virt_start =3D 0x5800D000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* USBH_OHCI - STM32MP157 */ {
> .phys_start =3D 0x5800C000,
> .virt_start =3D 0x5800C000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* ETH1 - STM32MP157 */ {
> .phys_start =3D 0x5800A000,
> .virt_start =3D 0x5800A000,
> .size =3D 0x2000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* CRC1 - STM32MP157 */ {
> .phys_start =3D 0x58009000,
> .virt_start =3D 0x58009000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* DLYBSD2 - STM32MP157 */ {
> .phys_start =3D 0x58008000,
> .virt_start =3D 0x58008000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* SDMMC2 - STM32MP157 */ {
> .phys_start =3D 0x58007000,
> .virt_start =3D 0x58007000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* DLYBSD1 - STM32MP157 */ {
> .phys_start =3D 0x58006000,
> .virt_start =3D 0x58006000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* SDMMC1 - STM32MP157 */ {
> .phys_start =3D 0x58005000,
> .virt_start =3D 0x58005000,
> .size =3D 0x00001000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* DLYBQS - STM32MP157 */ {
> .phys_start =3D 0x58004000,
> .virt_start =3D 0x58004000,
> .size =3D 0x00001000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* QUADSPI - STM32MP157 */ {
> .phys_start =3D 0x58003000,
> .virt_start =3D 0x58003000,
> .size =3D 0x00001000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* FMC (NOR/PSRAM/NAND) - STM32MP157 */ {
> .phys_start =3D 0x58002000,
> .virt_start =3D 0x58002000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* MDMA - STM32MP157 */ {
> .phys_start =3D 0x58000000,
> .virt_start =3D 0x58000000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,
> },
> /* AXIMC - STM32MP157 */ {
> .phys_start =3D 0x57000000,
> .virt_start =3D 0x57000000,
> .size =3D 0x100000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* GPIOZ - STM32MP157 */ {
> .phys_start =3D 0x54004000,
> .virt_start =3D 0x54004000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> },
> /* RNG1 - STM32MP157 */ {
> .phys_start =3D 0x54003000,
> .virt_start =3D 0x54003000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* HASH1 - STM32MP157 */ {
> .phys_start =3D 0x54002000,
> .virt_start =3D 0x54002000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /*  CRYP1 - STM32MP157 */ {
> .phys_start =3D 0x54001000,
> .virt_start =3D 0x54001000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /*  BKPSRAM - STM32MP157 */ {
> .phys_start =3D 0x54000000,
> .virt_start =3D 0x54000000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /*  HDP - STM32MP157 */ {
> .phys_start =3D 0x5002A000,
> .virt_start =3D 0x5002A000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /*  DTS - STM32MP157 */ {
> .phys_start =3D 0x50028000,
> .virt_start =3D 0x50028000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /*  SAI4 - STM32MP157 */ {
> .phys_start =3D 0x50027000,
> .virt_start =3D 0x50027000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /*  VREFBUF - STM32MP157 */ {
> .phys_start =3D 0x50025000,
> .virt_start =3D 0x50025000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /*  LPTIM5 - STM32MP157 */ {
> .phys_start =3D 0x50024000,
> .virt_start =3D 0x50024000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /*  LPTIM4 - STM32MP157 */ {
> .phys_start =3D 0x50023000,
> .virt_start =3D 0x50023000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /*  LPTIM3 - STM32MP157 */ {
> .phys_start =3D 0x50022000,
> .virt_start =3D 0x50022000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /*  LPTIM2 - STM32MP157 */ {
> .phys_start =3D 0x50021000,
> .virt_start =3D 0x50021000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /*  SYSCFG - STM32MP157 */ {
> .phys_start =3D 0x50020000,
> .virt_start =3D 0x50020000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /*  EXTI - STM32MP157 */ {
> .phys_start =3D 0x5000D000,
> .virt_start =3D 0x5000D000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,
> },
> /* GPIOK - STM32MP157 */ {
> .phys_start =3D 0x5000C000,
> .virt_start =3D 0x5000C000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> },
> /* GPIOJ - STM32MP157 */ {
> .phys_start =3D 0x5000B000,
> .virt_start =3D 0x5000B000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> },
> /* GPIOI - STM32MP157 */ {
> .phys_start =3D 0x5000A000,
> .virt_start =3D 0x5000A000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> },
> /* GPIOH - STM32MP157 */ {
> .phys_start =3D 0x50009000,
> .virt_start =3D 0x50009000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> },
> /* GPIOG - STM32MP157 */ {
> .phys_start =3D 0x50008000,
> .virt_start =3D 0x50008000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> },
> /* GPIOF - STM32MP157 */ {
> .phys_start =3D 0x50007000,
> .virt_start =3D 0x50007000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> },
> /* GPIOE - STM32MP157 */ {
> .phys_start =3D 0x50006000,
> .virt_start =3D 0x50006000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> },
> /* GPIOD - STM32MP157 */ {
> .phys_start =3D 0x50005000,
> .virt_start =3D 0x50005000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> },
> /* GPIOC - STM32MP157 */ {
> .phys_start =3D 0x50004000,
> .virt_start =3D 0x50004000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> },
> /* GPIOB - STM32MP157 */ {
> .phys_start =3D 0x50003000,
> .virt_start =3D 0x50003000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> },
> /* GPIOA - STM32MP157 */ {
> .phys_start =3D 0x50002000,
> .virt_start =3D 0x50002000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> },
> /* PWR - STM32MP157 */ {
> .phys_start =3D 0x50001000,
> .virt_start =3D 0x50001000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,
> },
> /* RCC - STM32MP157 */ {
> .phys_start =3D 0x50000000,
> .virt_start =3D 0x50000000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
>
>
> /************************************************************************=
***/
> /****************************** PERIPHERALS 1
> ******************************/
> /************************* 0x40000000 - 0x50000000
> *************************/
>
> /************************************************************************=
***/
> /* DCMI - STM32MP157 */ {
> .phys_start =3D 0x4C006000,
> .virt_start =3D 0x4C006000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* CRYP2 - STM32MP157 */ {
> .phys_start =3D 0x4C005000,
> .virt_start =3D 0x4C005000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* CRC2 - STM32MP157 */ {
> .phys_start =3D 0x4C004000,
> .virt_start =3D 0x4C004000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* RNG2 - STM32MP157 */ {
> .phys_start =3D 0x4C003000,
> .virt_start =3D 0x4C003000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* HASH2 - STM32MP157 */ {
> .phys_start =3D 0x4C002000,
> .virt_start =3D 0x4C002000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* IPCC - STM32MP157 */ {
> .phys_start =3D 0x4C001000,
> .virt_start =3D 0x4C001000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* HSEM - STM32MP157 */ {
> .phys_start =3D 0x4C000000,
> .virt_start =3D 0x4C000000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* OTG - STM32MP157 */ {
> .phys_start =3D 0x49000000,
> .virt_start =3D 0x49000000,
> .size =3D 0x40000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> },
> /* DLYBSD3 - STM32MP157 */ {
> .phys_start =3D 0x48005000,
> .virt_start =3D 0x48005000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* SDMMC3 - STM32MP157 */ {
> .phys_start =3D 0x48004000,
> .virt_start =3D 0x48004000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* ADC12 - STM32MP157 */ {
> .phys_start =3D 0x48003000,
> .virt_start =3D 0x48003000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,
> },
> /* DMAMUX1 - STM32MP157 */ {
> .phys_start =3D 0x48002000,
> .virt_start =3D 0x48002000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,
> },
> /* DMA2 - STM32MP157 */ {
> .phys_start =3D 0x48001000,
> .virt_start =3D 0x48001000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* DMA1 - STM32MP157 */ {
> .phys_start =3D 0x48000000,
> .virt_start =3D 0x48000000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* CANSRAM - STM32MP157 */ {
> .phys_start =3D 0x44011000,
> .virt_start =3D 0x44011000,
> .size =3D 0x2800,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* CCU - STM32MP157 */ {
> .phys_start =3D 0x44010000,
> .virt_start =3D 0x44010000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* FDCAN2 - STM32MP157 */ {
> .phys_start =3D 0x4400F000,
> .virt_start =3D 0x4400F000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* FDCAN1 - STM32MP157 */ {
> .phys_start =3D 0x4400E000,
> .virt_start =3D 0x4400E000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* DFSDM1 - STM32MP157 */ {
> .phys_start =3D 0x4400D000,
> .virt_start =3D 0x4400D000,
> .size =3D 0x800,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* SAI3 - STM32MP157 */ {
> .phys_start =3D 0x4400C000,
> .virt_start =3D 0x4400C000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* SAI2 - STM32MP157 */ {
> .phys_start =3D 0x4400B000,
> .virt_start =3D 0x4400B000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* SAI1 - STM32MP157 */ {
> .phys_start =3D 0x4400A000,
> .virt_start =3D 0x4400A000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* SPI5 - STM32MP157 */ {
> .phys_start =3D 0x44009000,
> .virt_start =3D 0x44009000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* TIM17 - STM32MP157 */ {
> .phys_start =3D 0x44008000,
> .virt_start =3D 0x44008000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* TIM16 - STM32MP157 */ {
> .phys_start =3D 0x44007000,
> .virt_start =3D 0x44007000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* TIM15 - STM32MP157 */ {
> .phys_start =3D 0x44006000,
> .virt_start =3D 0x44006000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* SPI4 - STM32MP157 */ {
> .phys_start =3D 0x44005000,
> .virt_start =3D 0x44005000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* SPI1 - STM32MP157 */ {
> .phys_start =3D 0x44004000,
> .virt_start =3D 0x44004000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* USART6 - STM32MP157 */ {
> .phys_start =3D 0x44003000,
> .virt_start =3D 0x44003000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* TIM 8 - STM32MP157 */ {
> .phys_start =3D 0x44001000,
> .virt_start =3D 0x44001000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* TIM 1 - STM32MP157 */ {
> .phys_start =3D 0x44000000,
> .virt_start =3D 0x44000000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* MDIOS - STM32MP157 */ {
> .phys_start =3D 0x4001C000,
> .virt_start =3D 0x4001C000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* UART8 - STM32MP157 */ {
> .phys_start =3D 0x40019000,
> .virt_start =3D 0x40019000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* UART7 - STM32MP157 */ {
> .phys_start =3D 0x40018000,
> .virt_start =3D 0x40018000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* DAC1 - STM32MP157 */ {
> .phys_start =3D 0x40017000,
> .virt_start =3D 0x40017000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* CEC - STM32MP157 */ {
> .phys_start =3D 0x40016000,
> .virt_start =3D 0x40016000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* I2C5 - STM32MP157 */ {
> .phys_start =3D 0x40015000,
> .virt_start =3D 0x40015000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* I2C3 - STM32MP157 */ {
> .phys_start =3D 0x40014000,
> .virt_start =3D 0x40014000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* I2C2 - STM32MP157 */ {
> .phys_start =3D 0x40013000,
> .virt_start =3D 0x40013000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* I2C1 - STM32MP157 */ {
> .phys_start =3D 0x40012000,
> .virt_start =3D 0x40012000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* UART5 - STM32MP157 */ {
> .phys_start =3D 0x40011000,
> .virt_start =3D 0x40011000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* UART4 - STM32MP157 */ {
> .phys_start =3D 0x40010000,
> .virt_start =3D 0x40010000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* USART3 - STM32MP157 */ {
> .phys_start =3D 0x4000F000,
> .virt_start =3D 0x4000F000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* USART2 - STM32MP157 */ {
> .phys_start =3D 0x4000E000,
> .virt_start =3D 0x4000E000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO_32,
> },
> /* SPDIFRX - STM32MP157 */ {
> .phys_start =3D 0x4000D000,
> .virt_start =3D 0x4000D000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* SPI3 - STM32MP157 */ {
> .phys_start =3D 0x4000C000,
> .virt_start =3D 0x4000C000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* SPI2 - STM32MP157 */ {
> .phys_start =3D 0x4000B000,
> .virt_start =3D 0x4000B000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* WWDG1 - STM32MP157 */ {
> .phys_start =3D 0x4000A000,
> .virt_start =3D 0x4000A000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* LPTIM1 - STM32MP157 */ {
> .phys_start =3D 0x40009000,
> .virt_start =3D 0x40009000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* TIM14 - STM32MP157 */ {
> .phys_start =3D 0x40008000,
> .virt_start =3D 0x40008000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* TIM13 - STM32MP157 */ {
> .phys_start =3D 0x40007000,
> .virt_start =3D 0x40007000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* TIM12 - STM32MP157 */ {
> .phys_start =3D 0x40006000,
> .virt_start =3D 0x40006000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* TIM7 - STM32MP157 */ {
> .phys_start =3D 0x40005000,
> .virt_start =3D 0x40005000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* TIM6 - STM32MP157 */ {
> .phys_start =3D 0x40004000,
> .virt_start =3D 0x40004000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* TIM5 - STM32MP157 */ {
> .phys_start =3D 0x40003000,
> .virt_start =3D 0x40003000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* TIM4 - STM32MP157 */ {
> .phys_start =3D 0x40002000,
> .virt_start =3D 0x40002000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* TIM3 - STM32MP157 */ {
> .phys_start =3D 0x40001000,
> .virt_start =3D 0x40001000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
> /* TIM2 - STM32MP157 */ {
> .phys_start =3D 0x40000000,
> .virt_start =3D 0x40000000,
> .size =3D 0x400,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_IO,
> },
>
>
> /************************************************************************=
***/
> /****************************** RAM ALIASES
> ********************************/
> /************************* 0x30000000 - 0x40000000
> *************************/
>
> /************************************************************************=
***/
> /* RETRAM */{
> .phys_start =3D 0x38000000,
> .virt_start =3D 0x38000000,
> .size =3D 0x10000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> },
> /* SRAM - ALIAS 4 */{
> .phys_start =3D 0x30050000,
> .virt_start =3D 0x30050000,
> .size =3D 0x10000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> },
> /* SRAM - ALIAS 3 */{
> .phys_start =3D 0x30040000,
> .virt_start =3D 0x30040000,
> .size =3D 0x10000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> },
> /* SRAM - ALIAS 2 */{
> .phys_start =3D 0x30020000,
> .virt_start =3D 0x30020000,
> .size =3D 0x20000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE,
> },
> /* SRAM - ALIAS 1 */{
> .phys_start =3D 0x30000000,
> .virt_start =3D 0x30000000,
> .size =3D 0x20000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE,
> },
>
> /****************************** SRAMs
> **************************************/
> /************************* 0x10000000 - 0x30000000
> *************************/
>
> /************************************************************************=
***/
> /* SYSRAM */{
> .phys_start =3D 0x2FFC0000,
> .virt_start =3D 0x2FFC0000,
> .size =3D 0x40000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> },
> /* SRAM4 */{
> .phys_start =3D 0x10050000,
> .virt_start =3D 0x10050000,
> .size =3D 0x10000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> },
> /* SRAM3 */{
> .phys_start =3D 0x10040000,
> .virt_start =3D 0x10040000,
> .size =3D 0x10000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> },
> /* SRAM2 */{
> .phys_start =3D 0x10020000,
> .virt_start =3D 0x10020000,
> .size =3D 0x20000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE,
> },
> /* SRAM1 */{
> .phys_start =3D 0x10000000,
> .virt_start =3D 0x10000000,
> .size =3D 0x20000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE,
> },
> },
>
> .irqchips =3D {
> /* GIC STM32MP157*/ {
> .address =3D 0xA0021000,
> .pin_base =3D 32,
> .pin_bitmap =3D {
> 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
> },
> },
> },
> };
>
> pe 6. tammik. 2023 klo 9.19 Ralf Ramsauer (ralf.ramsauer@oth-regensburg.d=
e)
> kirjoitti:
>
>>
>>
>> On 06/01/2023 15:08, Tommi Parkkila wrote:
>> > Jan and Ralf - It looks like I have something wrong with the IRQ/GIC.
>> > When I get root cell up successfully, and if I press a button (that
>> > presumably is assigned to a IRQ routine) I get the error print below
>> and
>> > the whole system hangs. Is there any documentation on how I should
>> > specify IRQ/GIC on root cell configuration or jailhouse configuration
>> > for the target?
>>
>> Interesting. What's behind IRQ 74? Would you please share
>> /proc/interrupts, /proc/iomem and the configuration of your root cell?
>> And also maybe the full device tree using
>> $ dtc -I fs -O dts /proc/device-tree -o stm32mp1.dts
>>
>> Thanks
>>    Ralf
>>
>>
>> >
>> > Thanks,
>> > -tommi
>> >
>> > */[   84.080587] irq 74: nobody cared (try booting with the "irqpoll"
>> > option)
>> > [   84.085876] CPU: 0 PID: 606 Comm: kworker/0:4 Tainted: G
>> OE
>> >      5.15.24-dirty #3
>> > [   84.094144] Hardware name: STM32 (Device Tree Support)
>> > [   84.099236] Workqueue: events dbs_work_handler
>> > [   84.103724] [<c0110d3c>] (unwind_backtrace) from [<c010c6c0>]
>> > (show_stack+0x10/0x14)
>> > [   84.111377] [<c010c6c0>] (show_stack) from [<c0bb3c50>]
>> > (dump_stack_lvl+0x40/0x4c)
>> > [   84.118918] [<c0bb3c50>] (dump_stack_lvl) from [<c0baf750>]
>> > (__report_bad_irq+0x3c/0xc0)
>> > [   84.126986] [<c0baf750>] (__report_bad_irq) from [<c0185b8c>]
>> > (note_interrupt+0x2a8/0x2f4)
>> > [   84.135265] [<c0185b8c>] (note_interrupt) from [<c0181fd8>]
>> > (handle_irq_event_percpu+0x80/0x88)
>> > [   84.143964] [<c0181fd8>] (handle_irq_event_percpu) from [<c0182018>=
]
>> > (handle_irq_event+0x38/0x5c)
>> > [   84.152769] [<c0182018>] (handle_irq_event) from [<c0186614>]
>> > (handle_edge_irq+0xc4/0x218)
>> > [   84.161046] [<c0186614>] (handle_edge_irq) from [<c073c8b4>]
>> > (stm32_pwr_handle_irq+0x118/0x190)
>> > [   84.169650] [<c073c8b4>] (stm32_pwr_handle_irq) from [<c018165c>]
>> > (handle_domain_irq+0x7c/0xb0)
>> > [   84.178348] [<c018165c>] (handle_domain_irq) from [<c063ff04>]
>> > (gic_handle_irq+0x7c/0x90)
>> > [   84.186522] [<c063ff04>] (gic_handle_irq) from [<c0100afc>]
>> > (__irq_svc+0x5c/0x90)
>> > [   84.193950] Exception stack(0xced55bb8 to 0xced55c00)
>> > [   84.199040] 5ba0:
>>
>> >    00000000 00000000
>> > [   84.207198] 5bc0: 1d624000 c105fe80 c105fe80 00000000 c1810800
>> > 00000080 ced54000 ced55ca8
>> > [   84.215356] 5be0: ced55ca8 ced55c08 ced54000 ced55c08 c0101254
>> > c0101268 20010113 ffffffff
>> > [   84.223509] [<c0100afc>] (__irq_svc) from [<c0101268>]
>> > (__do_softirq+0xc0/0x430)
>> > [   84.230833] [<c0101268>] (__do_softirq) from [<c012c8e0>]
>> > (irq_exit+0xd4/0x110)
>> > [   84.238157] [<c012c8e0>] (irq_exit) from [<c0181660>]
>> > (handle_domain_irq+0x80/0xb0)
>> > [   84.245797] [<c0181660>] (handle_domain_irq) from [<c063ff04>]
>> > (gic_handle_irq+0x7c/0x90)
>> > [   84.253965] [<c063ff04>] (gic_handle_irq) from [<c0100afc>]
>> > (__irq_svc+0x5c/0x90)
>> > [   84.261392] Exception stack(0xced55ca8 to 0xced55cf0)
>> > [   84.266383] 5ca0:                   df858000 df858004 00000000
>> > c1b6cb80 c1b6cb80 c1b3cec0
>> > [   84.274541] 5cc0: c1bf8074 c120b400 c1b3cf40 c1b3cf48 c1986010
>> > cf0ba580 c205ac44 ced55cf8
>> > [   84.282695] 5ce0: c09a38d8 c09a34fc 60010013 ffffffff
>> > [   84.287781] [<c0100afc>] (__irq_svc) from [<c09a34fc>]
>> > (shmem_tx_prepare+0xcc/0xdc)
>> > [   84.295422] [<c09a34fc>] (shmem_tx_prepare) from [<c09a38d8>]
>> > (smc_send_message+0x24/0x120)
>> > [   84.303696] [<c09a38d8>] (smc_send_message) from [<c099ae50>]
>> > (do_xfer+0x98/0x464)
>> > [   84.311234] [<c099ae50>] (do_xfer) from [<c099f40c>]
>> > (scmi_clock_rate_get+0x70/0xc4)
>> > [   84.318983] [<c099f40c>] (scmi_clock_rate_get) from [<c067f358>]
>> > (scmi_clk_recalc_rate+0x3c/0x70)
>> > [   84.327791] [<c067f358>] (scmi_clk_recalc_rate) from [<c0677004>]
>> > (clk_recalc+0x34/0x74)
>> > [   84.331653] sched: RT throttling activated
>> > [   84.339991] [<c0677004>] (clk_recalc) from [<c0679e18>]
>> > (clk_change_rate+0xf8/0x544)
>> > [   84.347653] [<c0679e18>] (clk_change_rate) from [<c067a3f4>]
>> > (clk_core_set_rate_nolock+0x190/0x1d8)
>> > [   84.356687] [<c067a3f4>] (clk_core_set_rate_nolock) from
>> [<c067a46c>]
>> > (clk_set_rate+0x30/0x88)
>> > [   84.365300] [<c067a46c>] (clk_set_rate) from [<c095a910>]
>> > (_set_opp+0x2d0/0x5f0)
>> > [   84.372647] [<c095a910>] (_set_opp) from [<c095acc0>]
>> > (dev_pm_opp_set_rate+0x90/0x16c)
>> > [   84.380508] [<c095acc0>] (dev_pm_opp_set_rate) from [<c095ff8c>]
>> > (__cpufreq_driver_target+0x110/0x2f8)
>> > [   84.389840] [<c095ff8c>] (__cpufreq_driver_target) from [<c0962f94>=
]
>> > (od_dbs_update+0xb4/0x160)
>> > [   84.398540] [<c0962f94>] (od_dbs_update) from [<c0963b18>]
>> > (dbs_work_handler+0x2c/0x58)
>> > [   84.406499] [<c0963b18>] (dbs_work_handler) from [<c0141dec>]
>> > (process_one_work+0x1dc/0x588)
>> > [   84.414881] [<c0141dec>] (process_one_work) from [<c01421e4>]
>> > (worker_thread+0x4c/0x520)
>> > [   84.422940] [<c01421e4>] (worker_thread) from [<c0149df8>]
>> > (kthread+0x170/0x1a0)
>> > [   84.430367] [<c0149df8>] (kthread) from [<c0100130>]
>> > (ret_from_fork+0x14/0x24)
>> > [   84.437481] Exception stack(0xced55fb0 to 0xced55ff8)
>> > [   84.442571] 5fa0:                                     00000000
>> > 00000000 00000000 00000000
>> > [   84.450726] 5fc0: 00000000 00000000 00000000 00000000 00000000
>> > 00000000 00000000 00000000
>> > [   84.458880] 5fe0: 00000000 00000000 00000000 00000000 00000013
>> 00000000
>> > [   84.465448] handlers:
>> > [   84.467682] [<716ecdd6>] irq_default_primary_handler threaded
>> > [<63fec1af>] regmap_irq_thread
>> > [   84.476083] Disabling IRQ #74/*
>> >
>> > torstai 5. tammikuuta 2023 klo 13.00.34 UTC-5 Tommi Parkkila kirjoitti=
:
>> >
>> >     Ralf - Not sure what you mean by your note.
>> >
>> >     Jan - root cell configuration is now fixed what comes to overlappe=
d
>> >     memory regions. However, the both issues: */1. Terminal hangs/*, a=
nd
>> >     */2. Issue with setting CPU clock/* still exists. I am not familia=
r
>> >     with clock configurations on the target, but yes TF-A is in use.
>> >
>> >     -tommi
>> >
>> >     to 5. tammik. 2023 klo 12.54 Ralf Ramsauer
>> >     (ralf.r...@oth-regensburg.de) kirjoitti:
>> >
>> >
>> >
>> >         On 05/01/2023 18:24, Jan Kiszka wrote:
>> >          > On 05.01.23 18:21, Tommi Parkkila wrote:
>> >          >> Oh, I was missing *.cell from the point 2. Now fixed and n=
o
>> >         complaints.
>> >          >>
>> >          >> to 5. tammik. 2023 klo 12.20 Tommi Parkkila
>> >         (tommi.p...@gmail.com
>> >          >> <mailto:tommi.p...@gmail.com>) kirjoitti:
>> >          >>
>> >          >>      Jan - Just ran the config check on the host PC and on
>> >         target.
>> >          >>
>> >          >>      1. On host, it identified some memregion overlappings
>> >         that were due
>> >          >>      my own copy/paste errors. It also complained a missin=
g
>> >         resource
>> >          >>      interception for architecture x86:
>> >          >>      */In cell 'STM32MP1-Root', region 1
>> >          >>        phys_start: 0x00000000f7600000
>> >          >>        virt_start: 0x00000000f7600000
>> >          >>        size:       0x0000000009a00000
>> >          >>        flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRIT=
E
>> |
>> >          >>      JAILHOUSE_MEM_EXECUTE
>> >          >>      overlaps with xAPIC
>> >          >
>> >          > Another detail when running cross: "-a arm" - you don't hav=
e
>> >         to worry
>> >          > about x86 resources on your target.
>> >
>> >         Side note: We should store the architecture in the
>> >         configuration. Just
>> >         for the same reason why we introduced the magic byte at the
>> >         beginning=E2=80=A6
>> >
>> >             Ralf
>> >
>> >          >
>> >          > Jan
>> >          >
>> >          >>        phys_start: 0x00000000fee00000
>> >          >>        virt_start: 0x00000000fee00000
>> >          >>        size:       0x0000000000001000
>> >          >>        flags:  /*
>> >          >>      I fixed the copy paste mem overlappings, do I need to
>> >         worry about
>> >          >>      the xAPIC overlapping?
>> >          >>      */
>> >          >>      /*
>> >          >>      2. On target, the check complained the configuration =
is
>> >         not root
>> >          >>      cell configuration???
>> >          >>      */root@stm32mp1:~#
>> jailhouse/tools/jailhouse-config-check
>> >          >>      jailhouse/configs/stm32mp157.c
>> >          >>      Reading configuration set:
>> >          >>      Not a root cell configuration:
>> >         jailhouse/configs/arm/stm32mp157.c/*
>> >          >>      The config here is the same as ran on the host PC. Wh=
at
>> >         causes it to
>> >          >>      complain the above?
>> >          >>
>> >          >>      to 5. tammik. 2023 klo 11.55 Jan Kiszka
>> >         (jan.k...@siemens.com
>> >          >>      <mailto:jan.k...@siemens.com>) kirjoitti:
>> >          >>
>> >          >>          On 05.01.23 17:53, Tommi Parkkila wrote:
>> >          >>          > Jan - Thanks again. I have not tried the config
>> >         check yet.
>> >          >>          Actually, it
>> >          >>          > does not work on hw currently, it does not find
>> >         pyjailhouse
>> >          >>          module. I'll
>> >          >>          > check whats going wrong with it and let you kno=
w.
>> >          >>
>> >          >>          You can also run it offline, even directly from t=
he
>> >         source folder
>> >          >>          (tools/jailhouse-config-check ...).
>> >          >>
>> >          >>          Jan
>> >          >>
>> >          >>          > -tommi
>> >          >>          >
>> >          >>          > to 5. tammik. 2023 klo 10.21 Jan Kiszka
>> >          >>          (jan.k...@siemens.com <mailto:jan.k...@siemens.co=
m
>> >
>> >          >>          > <mailto:jan.k...@siemens.com
>> >          >>          <mailto:jan.k...@siemens.com>>) kirjoitti:
>> >          >>          >
>> >          >>          >     On 05.01.23 15:34, Tommi Parkkila wrote:
>> >          >>          >     > Thanks for your reply, Jan. I managed to
>> >         get forward
>> >          >>          from the 'hang'
>> >          >>          >     > condition. There were several
>> >         misdefinitions on my root-cell
>> >          >>          >     > configuration. Now I get the root-cell
>> started
>> >          >>          sometimes, but more
>> >          >>          >     often
>> >          >>          >     > I get two types of issues after enable
>> >         command. Any help
>> >          >>          or ideas
>> >          >>          >     where
>> >          >>          >     > to continue my debugging would be greatly
>> >         appreciated.
>> >          >>          Please, see the
>> >          >>          >     > issues explained below.
>> >          >>          >
>> >          >>          >     Already tried "jailhouse config check"?
>> >          >>          >
>> >          >>          >     >
>> >          >>          >     > Thanks,
>> >          >>          >     > -tommi
>> >          >>          >     >
>> >          >>          >     > +++++++++++++++++++++++++++++++++
>> >          >>          >     >
>> >          >>          >     > 1. Terminal hangs
>> >          >>          >     > -- After the enable command for the root
>> >         cell, jailhouse
>> >          >>          gets started
>> >          >>          >     > but then the terminal goes unresponsive.
>> >         Below, example
>> >          >>          log, where I
>> >          >>          >     > give ls cmd, which then causes terminal t=
o
>> go
>> >          >>          unresponsive...:
>> >          >>          >     >
>> >          >>          >
>> >          >>          >     Missing interrupts could be one reason. Or
>> >         something is
>> >          >>          completely
>> >          >>          >     broken with memory mapping so that a kernel
>> >         device driver
>> >          >>          gets stuck on
>> >          >>          >     waiting for some register bit to flip, e.g.
>> >         But most
>> >          >>          frequent are
>> >          >>          >     interrupt issues, specifically around GIC
>> >         resources being
>> >          >>          improperly
>> >          >>          >     passed through. The config checker may find
>> that.
>> >          >>          >
>> >          >>          >     > /*root@stm32mp1:~# modprobe jailhouse
>> >          >>          >     > [ 1315.034414] jailhouse: loading
>> >         out-of-tree module
>> >          >>          taints kernel.
>> >          >>          >     > root@stm32mp1:~# jailhouse enable
>> >          >>          >     >
>> ~/jailhouse/configs/arm/itron_stm32mp157.cell
>> >          >>          >     >
>> >          >>          >     > Initializing Jailhouse hypervisor v0.12
>> >          >>          (314-gc7a1b697-dirty) on CPU 0
>> >          >>          >     > Code location: 0xf0000040
>> >          >>          >     > Page pool usage after early setup: mem
>> >         28/1514, remap
>> >          >>          0/131072
>> >          >>          >     > Initializing processors:
>> >          >>          >     >  CPU 0... OK
>> >          >>          >     >  CPU 1... OK
>> >          >>          >     > Initializing unit: irqchip
>> >          >>          >     > Initializing unit: PCI
>> >          >>          >     > Page pool usage after late setup: mem
>> >         50/1514, remap
>> >          >>          5/131072
>> >          >>          >     > [0] Activating hypervisor
>> >          >>          >     > [ 1355.352714] The Jailhouse is opening.
>> >          >>          >     > root@stm32mp1:~# ls*/
>> >          >>          >     >
>> >          >>          >     > 2. Issue with setting CPU clock
>> >          >>          >     > -- The second issue I see is related to i=
2c
>> >         bus and
>> >          >>          system clock.
>> >          >>          >     > Terminal starts printing error statements
>> >         infinitely
>> >          >>          after Jailhouse
>> >          >>          >     > opening. Below, is a snippet of an exampl=
e
>> >         logs.
>> >          >>          >     >
>> >          >>          >     > */[   85.322027] The Jailhouse is opening=
.
>> >          >>          >     > [   85.322648] stm32f7-i2c 5c002000.i2c:
>> >         failed to
>> >          >>          prepare_enable
>> >          >>          >     clock
>> >          >>          >     > root@stm32mp1:~# [   85.339233] cpu cpu0:
>> >          >>          _set_opp_voltage: failed to
>> >          >>          >     > set voltage (1350000 1350000 1350000 mV):
>> -22
>> >          >>          >     > [   85.350413] cpufreq: __target_index:
>> >         Failed to change cpu
>> >          >>          >     frequency: -22
>> >          >>          >     > [   85.357706] cpu cpu0: _set_opp_voltage=
:
>> >         failed to set
>> >          >>          voltage
>> >          >>          >     > (1350000 1350000 1350000 mV): -22
>> >          >>          >     > [   85.365124] cpufreq: __target_index:
>> >         Failed to change cpu
>> >          >>          >     frequency: -22
>> >          >>          >     > [   85.381985] cpu cpu0: _set_opp_voltage=
:
>> >         failed to set
>> >          >>          voltage
>> >          >>          >     > (1350000 1350000 1350000 mV): -22
>> >          >>          >     > /*- - -
>> >          >>          >     > +++++++++++++++++++++++++++++++++
>> >          >>          >
>> >          >>          >     Same possible reasons as above. Or do you
>> >         know how clock
>> >          >>          control happens
>> >          >>          >     on that platform? Is there firmware (TF-A?)
>> >         involved?
>> >          >>          >
>> >          >>          >     Jan
>> >          >>          >
>> >          >>          >     --
>> >          >>          >     Siemens AG, Technology
>> >          >>          >     Competence Center Embedded Linux
>> >          >>          >
>> >          >>
>> >          >>          --
>> >          >>          Siemens AG, Technology
>> >          >>          Competence Center Embedded Linux
>> >          >>
>> >          >
>> >
>> > --
>> > You received this message because you are subscribed to the Google
>> > Groups "Jailhouse" group.
>> > To unsubscribe from this group and stop receiving emails from it, send
>> > an email to jailhouse-dev+unsubscribe@googlegroups.com
>> > <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
>> > To view this discussion on the web visit
>> >
>> https://groups.google.com/d/msgid/jailhouse-dev/369cc253-8606-476b-a8d7-=
38ed11beaa2fn%40googlegroups.com
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/369cc253-8606-476b-a8d7-=
38ed11beaa2fn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
>> >.
>>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAP8Rr60GYLysxvzeovfJ8CZ02DBzVjurmZ5s0bf6W0D6BaJwAA%40mail.gm=
ail.com.

--00000000000096bd2f05f19abfdf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ralf - Please, find the full device tree attached. I used =
&quot;<b><i>root@stm32mp1:~# find /proc/device-tree/ -type f -exec head {} =
+ | less &gt; devicetree.txt</i></b>&quot; on target to generate the tree. =
Maybe this works for you?<div>Thanks</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">pe 6. tammik. 2023 klo 10.42 Tomm=
i Parkkila (<a href=3D"mailto:tommi.parkkila@gmail.com">tommi.parkkila@gmai=
l.com</a>) kirjoitti:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr">Ralf - here is the root cell configuration:<div><br>=
</div><div>/*<br>=C2=A0* Jailhouse, a Linux-based partitioning hypervisor<b=
r>=C2=A0*<br>=C2=A0* Test configuration for Banana Pi board (A20 dual-core =
Cortex-A7, 1G RAM)<br>=C2=A0* <a href=3D"https://banana-pi.org/en/banana-pi=
-sbcs/4.html" target=3D"_blank">https://banana-pi.org/en/banana-pi-sbcs/4.h=
tml</a><br>=C2=A0* Copyright (c) Siemens AG, 2014<br>=C2=A0*<br>=C2=A0* Aut=
hors:<br>=C2=A0* =C2=A0Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.=
com" target=3D"_blank">jan.kiszka@siemens.com</a>&gt;<br>=C2=A0*<br>=C2=A0*=
 This work is licensed under the terms of the GNU GPL, version 2.=C2=A0 See=
<br>=C2=A0* the COPYING file in the top-level directory.<br>=C2=A0*<br>=C2=
=A0* =C2=A0THIS IS A JAILHOUSE ROOT CELL CONFIGURATION FILE FOR STM32MP157<=
br>=C2=A0* =C2=A0- =C2=A0 BASED ON BANANA PI EXAMPLE FROM JAILHOUSE REPO (A=
20 Dual Core Cortex-A7, <br>=C2=A0* =C2=A0 =C2=A0 =C2=A0- =C2=A0 A20 UserMa=
nual: <a href=3D"https://github.com/allwinner-zh/documents/raw/master/A20/A=
20_User_Manual_v1.4_20150510.pdf" target=3D"_blank">https://github.com/allw=
inner-zh/documents/raw/master/A20/A20_User_Manual_v1.4_20150510.pdf</a><br>=
=C2=A0* =C2=A0 =C2=A0 =C2=A0- =C2=A0 A20 DataSheet: <a href=3D"https://gith=
ub.com/allwinner-zh/documents/raw/master/A20/A20_Datasheet_v1.5_20150510.pd=
f" target=3D"_blank">https://github.com/allwinner-zh/documents/raw/master/A=
20/A20_Datasheet_v1.5_20150510.pdf</a><br>=C2=A0* =C2=A0- =C2=A0 WORK IN PR=
OGRESS<br>=C2=A0* =C2=A0 =C2=A0 =C2=A0- =C2=A0 STM32MP157 REF Manual: <a hr=
ef=3D"https://www.st.com/resource/en/reference_manual/DM00327659-.pdf" targ=
et=3D"_blank">https://www.st.com/resource/en/reference_manual/DM00327659-.p=
df</a><br>=C2=A0* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0 Memory map on =
page 158<br>=C2=A0*/<br><br>#include &lt;jailhouse/types.h&gt;<br>#include =
&lt;jailhouse/cell-config.h&gt;<br><br>struct {<br>	struct jailhouse_system=
 header;<br>	__u64 cpus[1];<br>	// struct jailhouse_memory mem_regions[127]=
;<br>	struct jailhouse_memory mem_regions[131];<br>	struct jailhouse_irqchi=
p irqchips[1];<br>} __attribute__((packed)) config =3D {<br>	.header =3D {<=
br>		.signature =3D JAILHOUSE_SYSTEM_SIGNATURE,<br>		.revision =3D JAILHOUS=
E_CONFIG_REVISION,<br>		.flags =3D JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,<br>=
		.hypervisor_memory =3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* STM32MP157 */<br>			.phys_start =3D 0xF7000000,<br>			.size =3D 0x060=
0000,<br>		},<br>		.debug_console =3D {<br>			/* UART-4 STM32MP157 */<br>		=
	.address =3D 0x40010000,<br>			.size =3D 0x400,<br>			/* .clock_reg =3D 0x=
01c2006c, */<br>			/* .gate_nr =3D 16 */<br>			/* .divider =3D 0x0d, */<br>=
			.type =3D JAILHOUSE_CON_TYPE_STM32H7,<br>			.flags =3D JAILHOUSE_CON_ACC=
ESS_MMIO |<br>				 JAILHOUSE_CON_REGDIST_4,<br>		},<br>		.platform_info =3D=
 {<br>			.arm =3D {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* STM32MP157 */<br>				.gic_version =3D 2,<br>				.gicd_base =3D 0xA00=
21000,	/// Distributor<br>				.gicc_base =3D 0xA0022000,	/// CPU<br>				.gi=
ch_base =3D 0xA0024000,	/// Hypervisor<br>				.gicv_base =3D 0xA0026000,	//=
/ Virtual CPU<br>				.maintenance_irq =3D 25,<br>			},<br>		},<br>		.root_c=
ell =3D {<br>			.name =3D &quot;STM32MP1-Root&quot;,<br><br>			.cpu_set_siz=
e =3D sizeof(config.cpus),<br>			.num_memory_regions =3D ARRAY_SIZE(config.=
mem_regions),<br>			.num_irqchips =3D ARRAY_SIZE(config.irqchips),<br>		},<=
br>	},<br><br>	/* STM32MP157 */<br>	.cpus =3D {<br>		0x3,<br>	},<br>	.mem_r=
egions =3D {<br>		/* IVSHMEM shared memory region - STM32MP157 */<br>		/* -=
 This macro creates four shared memory regions with a total size of 0x10000=
0 (1M), see cell-config.h*/<br>		/* - Created and reserved a continous memo=
ry region in kernel device tree for this one as well. */<br>		/* - Placed t=
he memory region before hypervisor region. */<br>		//JAILHOUSE_SHMEM_NET_RE=
GIONS(0xfdf00000, 0),<br>		// /* SPI */ {<br>		// 	.phys_start =3D 0x01c050=
00,<br>		// 	.virt_start =3D 0x01c05000,<br>		// 	.size =3D 0x00001000,<br>=
		// 	.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>		// 		JAILH=
OUSE_MEM_IO,<br>		// },<br><br>		/*****************************************=
**********************************/<br>		/****************************** DD=
R =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ******************************/<br>		/=
************************* 0xC0000000 - 0xFFFFFFFF *************************=
/<br>		/*******************************************************************=
********/<br>		/* RAM1 - STM32MP157 */ {<br>			.phys_start =3D 0xC0000000,<=
br>			.virt_start =3D 0xC0000000,<br>			.size =3D 0x36A00000,<br>			.flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_EXECUTE=
,<br>		},<br>		/* JAILHOUSE INMATE LOCATED AT 0xf6a00000 - 0xf7000000*/<br>=
		/* JAILHOUSE LOCATED AT 0xf7000000 - 0xF7600000*/<br>		/* RAM2 - STM32MP1=
57 */ {<br>			.phys_start =3D 0xF7600000,<br>			.virt_start =3D 0xF7600000,=
<br>			.size =3D 0x9A00000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE=
_MEM_WRITE |<br>				JAILHOUSE_MEM_EXECUTE,<br>		},<br>		<br>		/************=
***************************************************************/<br>		/****=
************************** PERIPHERALS 2 ******************************/<br=
>		/************************* 0x50000000 - 0x60000000 *********************=
****/<br>		/***************************************************************=
************/<br>		/* TAMP - STM32MP157 */ {<br>			.phys_start =3D 0x5C00A0=
00,<br>			.virt_start =3D 0x5C00A000,<br>			.size =3D 0x400,<br>			.flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>=
		},<br>		/* I2C6 - STM32MP157 */ {<br>			.phys_start =3D 0x5C009000,<br>		=
	.virt_start =3D 0x5C009000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHO=
USE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_32,<br>		},<br=
>		/* STGENC - STM32MP157 */ {<br>			.phys_start =3D 0x5C008000,<br>			.vir=
t_start =3D 0x5C008000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_=
MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* E=
TZPC - STM32MP157 */ {<br>			.phys_start =3D 0x5C007000,<br>			.virt_start =
=3D 0x5C007000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* TZC - STM3=
2MP157 */ {<br>			.phys_start =3D 0x5C006000,<br>			.virt_start =3D 0x5C006=
000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUS=
E_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* BSEC - STM32MP157 */=
 {<br>			.phys_start =3D 0x5C005000,<br>			.virt_start =3D 0x5C005000,<br>	=
		.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRI=
TE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* RTC - STM32MP157 */ {<br>			.=
phys_start =3D 0x5C004000,<br>			.virt_start =3D 0x5C004000,<br>			.size =
=3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>	=
			JAILHOUSE_MEM_IO,<br>		},<br>		/* IWDG1 - STM32MP157 */ {<br>			.phys_st=
art =3D 0x5C003000,<br>			.virt_start =3D 0x5C003000,<br>			.size =3D 0x400=
,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHO=
USE_MEM_IO,<br>		},<br>		/* I2C4 - STM32MP157 */ {<br>			.phys_start =3D 0x=
5C002000,<br>			.virt_start =3D 0x5C002000,<br>			.size =3D 0x400,<br>			.f=
lags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO=
_32,<br>		},<br>		/* SPI6 - STM32MP157 */ {<br>			.phys_start =3D 0x5C00100=
0,<br>			.virt_start =3D 0x5C001000,<br>			.size =3D 0x400,<br>			.flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>=
		},<br>		/* USART1 - STM32MP157 */ {<br>			.phys_start =3D 0x5C000000,<br>=
			.virt_start =3D 0x5C000000,<br>			.size =3D 0x400,<br>			.flags =3D JAIL=
HOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_32,<br>		},<=
br>		/* DDRPERFM - STM32MP157 */ {<br>			.phys_start =3D 0x5A007000,<br>			=
.virt_start =3D 0x5A007000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOU=
SE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/=
* USBPHYC - STM32MP157 */ {<br>			.phys_start =3D 0x5A006000,<br>			.virt_s=
tart =3D 0x5A006000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM=
_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* STGE=
NR - STM32MP157 */ {<br>			.phys_start =3D 0x5A005000,<br>			.virt_start =
=3D 0x5A005000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ=
 | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* DDRPHYC -=
 STM32MP157 */ {<br>			.phys_start =3D 0x5A004000,<br>			.virt_start =3D 0x=
5A004000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAI=
LHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* DDRCTRL - STM32=
MP157 */ {<br>			.phys_start =3D 0x5A003000,<br>			.virt_start =3D 0x5A0030=
00,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE=
_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* IWDG2 - STM32MP157 */=
 {<br>			.phys_start =3D 0x5A002000,<br>			.virt_start =3D 0x5A002000,<br>	=
		.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRIT=
E |<br>				JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,<br>		},<br>		/* LTDC =
- STM32MP157 */ {<br>			.phys_start =3D 0x5A001000,<br>			.virt_start =3D 0=
x5A001000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAI=
LHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_32,<br>		},<br>		/* DSI - STM32M=
P157 */ {<br>			.phys_start =3D 0x5A000000,<br>			.virt_start =3D 0x5A00000=
0,<br>			.size =3D 0x800,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_M=
EM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* GPU - STM32MP157 */ {<b=
r>			.phys_start =3D 0x59000000,<br>			.virt_start =3D 0x59000000,<br>			.s=
ize =3D 0x40000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE =
|<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* USBH_EHCI - STM32MP157 */ {<br>	=
		.phys_start =3D 0x5800D000,<br>			.virt_start =3D 0x5800D000,<br>			.size=
 =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br=
>				JAILHOUSE_MEM_IO,<br>		},<br>		/* USBH_OHCI - STM32MP157 */ {<br>			.p=
hys_start =3D 0x5800C000,<br>			.virt_start =3D 0x5800C000,<br>			.size =3D=
 0x1000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>			=
	JAILHOUSE_MEM_IO,<br>		},<br>		/* ETH1 - STM32MP157 */ {<br>			.phys_start=
 =3D 0x5800A000,<br>			.virt_start =3D 0x5800A000,<br>			.size =3D 0x2000,<=
br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUS=
E_MEM_IO,<br>		},<br>		/* CRC1 - STM32MP157 */ {<br>			.phys_start =3D 0x58=
009000,<br>			.virt_start =3D 0x58009000,<br>			.size =3D 0x1000,<br>			.fl=
ags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,=
<br>		},<br>		/* DLYBSD2 - STM32MP157 */ {<br>			.phys_start =3D 0x58008000=
,<br>			.virt_start =3D 0x58008000,<br>			.size =3D 0x1000,<br>			.flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>=
		},<br>		/* SDMMC2 - STM32MP157 */ {<br>			.phys_start =3D 0x58007000,<br>=
			.virt_start =3D 0x58007000,<br>			.size =3D 0x1000,<br>			.flags =3D JAI=
LHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br=
>		/* DLYBSD1 - STM32MP157 */ {<br>			.phys_start =3D 0x58006000,<br>			.vi=
rt_start =3D 0x58006000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE=
_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* =
SDMMC1 - STM32MP157 */ {<br>			.phys_start =3D 0x58005000,<br>			.virt_star=
t =3D 0x58005000,<br>			.size =3D 0x00001000,<br>			.flags =3D JAILHOUSE_ME=
M_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* DLY=
BQS - STM32MP157 */ {<br>			.phys_start =3D 0x58004000,<br>			.virt_start =
=3D 0x58004000,<br>			.size =3D 0x00001000,<br>			.flags =3D JAILHOUSE_MEM_=
READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* QUADS=
PI - STM32MP157 */ {<br>			.phys_start =3D 0x58003000,<br>			.virt_start =
=3D 0x58003000,<br>			.size =3D 0x00001000,<br>			.flags =3D JAILHOUSE_MEM_=
READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* FMC (=
NOR/PSRAM/NAND) - STM32MP157 */ {<br>			.phys_start =3D 0x58002000,<br>			.=
virt_start =3D 0x58002000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOU=
SE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/=
* MDMA - STM32MP157 */ {<br>			.phys_start =3D 0x58000000,<br>			.virt_star=
t =3D 0x58000000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOUSE_MEM_RE=
AD | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 =
| JAILHOUSE_MEM_IO_32,<br>		},<br>		/* AXIMC - STM32MP157 */ {<br>			.phys_=
start =3D 0x57000000,<br>			.virt_start =3D 0x57000000,<br>			.size =3D 0x1=
00000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				J=
AILHOUSE_MEM_IO,<br>		},<br>		/* GPIOZ - STM32MP157 */ {<br>			.phys_start =
=3D 0x54004000,<br>			.virt_start =3D 0x54004000,<br>			.size =3D 0x400,<br=
>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_=
MEM_IO | JAILHOUSE_MEM_IO_32,<br>		},<br>		/* RNG1 - STM32MP157 */ {<br>			=
.phys_start =3D 0x54003000,<br>			.virt_start =3D 0x54003000,<br>			.size =
=3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>	=
			JAILHOUSE_MEM_IO,<br>		},<br>		/* HASH1 - STM32MP157 */ {<br>			.phys_st=
art =3D 0x54002000,<br>			.virt_start =3D 0x54002000,<br>			.size =3D 0x400=
,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHO=
USE_MEM_IO,<br>		},<br>		/* =C2=A0CRYP1 - STM32MP157 */ {<br>			.phys_start=
 =3D 0x54001000,<br>			.virt_start =3D 0x54001000,<br>			.size =3D 0x400,<b=
r>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE=
_MEM_IO,<br>		},<br>		/* =C2=A0BKPSRAM - STM32MP157 */ {<br>			.phys_start =
=3D 0x54000000,<br>			.virt_start =3D 0x54000000,<br>			.size =3D 0x1000,<b=
r>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE=
_MEM_IO,<br>		},<br>		/* =C2=A0HDP - STM32MP157 */ {<br>			.phys_start =3D =
0x5002A000,<br>			.virt_start =3D 0x5002A000,<br>			.size =3D 0x400,<br>			=
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_=
IO,<br>		},<br>		/* =C2=A0DTS - STM32MP157 */ {<br>			.phys_start =3D 0x500=
28000,<br>			.virt_start =3D 0x50028000,<br>			.size =3D 0x400,<br>			.flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_32=
,<br>		},<br>		/* =C2=A0SAI4 - STM32MP157 */ {<br>			.phys_start =3D 0x5002=
7000,<br>			.virt_start =3D 0x50027000,<br>			.size =3D 0x400,<br>			.flags=
 =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br=
>		},<br>		/* =C2=A0VREFBUF - STM32MP157 */ {<br>			.phys_start =3D 0x50025=
000,<br>			.virt_start =3D 0x50025000,<br>			.size =3D 0x400,<br>			.flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>=
		},<br>		/* =C2=A0LPTIM5 - STM32MP157 */ {<br>			.phys_start =3D 0x5002400=
0,<br>			.virt_start =3D 0x50024000,<br>			.size =3D 0x400,<br>			.flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>=
		},<br>		/* =C2=A0LPTIM4 - STM32MP157 */ {<br>			.phys_start =3D 0x5002300=
0,<br>			.virt_start =3D 0x50023000,<br>			.size =3D 0x400,<br>			.flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>=
		},<br>		/* =C2=A0LPTIM3 - STM32MP157 */ {<br>			.phys_start =3D 0x5002200=
0,<br>			.virt_start =3D 0x50022000,<br>			.size =3D 0x400,<br>			.flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>=
		},<br>		/* =C2=A0LPTIM2 - STM32MP157 */ {<br>			.phys_start =3D 0x5002100=
0,<br>			.virt_start =3D 0x50021000,<br>			.size =3D 0x400,<br>			.flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>=
		},<br>		/* =C2=A0SYSCFG - STM32MP157 */ {<br>			.phys_start =3D 0x5002000=
0,<br>			.virt_start =3D 0x50020000,<br>			.size =3D 0x400,<br>			.flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>=
		},<br>		/* =C2=A0EXTI - STM32MP157 */ {<br>			.phys_start =3D 0x5000D000,=
<br>			.virt_start =3D 0x5000D000,<br>			.size =3D 0x400,<br>			.flags =3D =
JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_8 | JAIL=
HOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32,<br>		},<br>		/* GPIOK - STM32MP157 *=
/ {<br>			.phys_start =3D 0x5000C000,<br>			.virt_start =3D 0x5000C000,<br>=
			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRI=
TE |<br>				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,<br>		},<br>		/* GPIOJ -=
 STM32MP157 */ {<br>			.phys_start =3D 0x5000B000,<br>			.virt_start =3D 0x=
5000B000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAIL=
HOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,<br>		},<br=
>		/* GPIOI - STM32MP157 */ {<br>			.phys_start =3D 0x5000A000,<br>			.virt=
_start =3D 0x5000A000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_ME=
M_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_3=
2,<br>		},<br>		/* GPIOH - STM32MP157 */ {<br>			.phys_start =3D 0x50009000=
,<br>			.virt_start =3D 0x50009000,<br>			.size =3D 0x400,<br>			.flags =3D=
 JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO | JAILH=
OUSE_MEM_IO_32,<br>		},<br>		/* GPIOG - STM32MP157 */ {<br>			.phys_start =
=3D 0x50008000,<br>			.virt_start =3D 0x50008000,<br>			.size =3D 0x400,<br=
>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_=
MEM_IO | JAILHOUSE_MEM_IO_32,<br>		},<br>		/* GPIOF - STM32MP157 */ {<br>		=
	.phys_start =3D 0x50007000,<br>			.virt_start =3D 0x50007000,<br>			.size =
=3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>	=
			JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,<br>		},<br>		/* GPIOE - STM32MP1=
57 */ {<br>			.phys_start =3D 0x50006000,<br>			.virt_start =3D 0x50006000,=
<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM=
_WRITE |<br>				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,<br>		},<br>		/* GPI=
OD - STM32MP157 */ {<br>			.phys_start =3D 0x50005000,<br>			.virt_start =
=3D 0x50005000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,<br>	=
	},<br>		/* GPIOC - STM32MP157 */ {<br>			.phys_start =3D 0x50004000,<br>		=
	.virt_start =3D 0x50004000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHO=
USE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO | JAILHOUSE_ME=
M_IO_32,<br>		},<br>		/* GPIOB - STM32MP157 */ {<br>			.phys_start =3D 0x50=
003000,<br>			.virt_start =3D 0x50003000,<br>			.size =3D 0x400,<br>			.fla=
gs =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO |=
 JAILHOUSE_MEM_IO_32,<br>		},<br>		/* GPIOA - STM32MP157 */ {<br>			.phys_s=
tart =3D 0x50002000,<br>			.virt_start =3D 0x50002000,<br>			.size =3D 0x40=
0,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILH=
OUSE_MEM_IO | JAILHOUSE_MEM_IO_32,<br>		},<br>		/* PWR - STM32MP157 */ {<br=
>			.phys_start =3D 0x50001000,<br>			.virt_start =3D 0x50001000,<br>			.si=
ze =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<b=
r>				JAILHOUSE_MEM_IO_8 | JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32, <br>	=
	},<br>		/* RCC - STM32MP157 */ {<br>			.phys_start =3D 0x50000000,<br>			.=
virt_start =3D 0x50000000,<br>			.size =3D 0x1000,<br>			.flags =3D JAILHOU=
SE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br><br=
>		/***********************************************************************=
****/<br>		/****************************** PERIPHERALS 1 ******************=
************/<br>		/************************* 0x40000000 - 0x50000000 *****=
********************/<br>		/***********************************************=
****************************/<br>		/* DCMI - STM32MP157 */ {<br>			.phys_st=
art =3D 0x4C006000,<br>			.virt_start =3D 0x4C006000,<br>			.size =3D 0x400=
,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHO=
USE_MEM_IO,<br>		},<br>		/* CRYP2 - STM32MP157 */ {<br>			.phys_start =3D 0=
x4C005000,<br>			.virt_start =3D 0x4C005000,<br>			.size =3D 0x400,<br>			.=
flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_I=
O,<br>		},<br>		/* CRC2 - STM32MP157 */ {<br>			.phys_start =3D 0x4C004000,=
<br>			.virt_start =3D 0x4C004000,<br>			.size =3D 0x400,<br>			.flags =3D =
JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},=
<br>		/* RNG2 - STM32MP157 */ {<br>			.phys_start =3D 0x4C003000,<br>			.vi=
rt_start =3D 0x4C003000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_=
MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* H=
ASH2 - STM32MP157 */ {<br>			.phys_start =3D 0x4C002000,<br>			.virt_start =
=3D 0x4C002000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* IPCC - STM=
32MP157 */ {<br>			.phys_start =3D 0x4C001000,<br>			.virt_start =3D 0x4C00=
1000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUS=
E_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* HSEM - STM32MP157 */=
 {<br>			.phys_start =3D 0x4C000000,<br>			.virt_start =3D 0x4C000000,<br>	=
		.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRIT=
E |<br>				JAILHOUSE_MEM_IO_32,<br>		},<br>		/* OTG - STM32MP157 */ {<br>		=
	.phys_start =3D 0x49000000,<br>			.virt_start =3D 0x49000000,<br>			.size =
=3D 0x40000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<br>=
		},<br>		/* DLYBSD3 - STM32MP157 */ {<br>			.phys_start =3D 0x48005000,<br=
>			.virt_start =3D 0x48005000,<br>			.size =3D 0x400,<br>			.flags =3D JAI=
LHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br=
>		/* SDMMC3 - STM32MP157 */ {<br>			.phys_start =3D 0x48004000,<br>			.vir=
t_start =3D 0x48004000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_M=
EM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* AD=
C12 - STM32MP157 */ {<br>			.phys_start =3D 0x48003000,<br>			.virt_start =
=3D 0x48003000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_32,<br>	=
	},<br>		/* DMAMUX1 - STM32MP157 */ {<br>			.phys_start =3D 0x48002000,<br>=
			.virt_start =3D 0x48002000,<br>			.size =3D 0x400,<br>			.flags =3D JAIL=
HOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_8 | JAILHOUS=
E_MEM_IO_16 | JAILHOUSE_MEM_IO_32,<br>		},<br>		/* DMA2 - STM32MP157 */ {<b=
r>			.phys_start =3D 0x48001000,<br>			.virt_start =3D 0x48001000,<br>			.s=
ize =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<=
br>				JAILHOUSE_MEM_IO_32,<br>		},<br>		/* DMA1 - STM32MP157 */ {<br>			.p=
hys_start =3D 0x48000000,<br>			.virt_start =3D 0x48000000,<br>			.size =3D=
 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				=
JAILHOUSE_MEM_IO_32,<br>		},<br>		/* CANSRAM - STM32MP157 */ {<br>			.phys_=
start =3D 0x44011000,<br>			.virt_start =3D 0x44011000,<br>			.size =3D 0x2=
800,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAI=
LHOUSE_MEM_IO,<br>		},<br>		/* CCU - STM32MP157 */ {<br>			.phys_start =3D =
0x44010000,<br>			.virt_start =3D 0x44010000,<br>			.size =3D 0x400,<br>			=
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_=
IO,<br>		},<br>		/* FDCAN2 - STM32MP157 */ {<br>			.phys_start =3D 0x4400F0=
00,<br>			.virt_start =3D 0x4400F000,<br>			.size =3D 0x400,<br>			.flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>=
		},<br>		/* FDCAN1 - STM32MP157 */ {<br>			.phys_start =3D 0x4400E000,<br>=
			.virt_start =3D 0x4400E000,<br>			.size =3D 0x400,<br>			.flags =3D JAIL=
HOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>=
		/* DFSDM1 - STM32MP157 */ {<br>			.phys_start =3D 0x4400D000,<br>			.virt=
_start =3D 0x4400D000,<br>			.size =3D 0x800,<br>			.flags =3D JAILHOUSE_ME=
M_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* SAI=
3 - STM32MP157 */ {<br>			.phys_start =3D 0x4400C000,<br>			.virt_start =3D=
 0x4400C000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | J=
AILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* SAI2 - STM32M=
P157 */ {<br>			.phys_start =3D 0x4400B000,<br>			.virt_start =3D 0x4400B00=
0,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_M=
EM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* SAI1 - STM32MP157 */ {<=
br>			.phys_start =3D 0x4400A000,<br>			.virt_start =3D 0x4400A000,<br>			.=
size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |=
<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* SPI5 - STM32MP157 */ {<br>			.phy=
s_start =3D 0x44009000,<br>			.virt_start =3D 0x44009000,<br>			.size =3D 0=
x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JA=
ILHOUSE_MEM_IO,<br>		},<br>		/* TIM17 - STM32MP157 */ {<br>			.phys_start =
=3D 0x44008000,<br>			.virt_start =3D 0x44008000,<br>			.size =3D 0x400,<br=
>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_=
MEM_IO,<br>		},<br>		/* TIM16 - STM32MP157 */ {<br>			.phys_start =3D 0x440=
07000,<br>			.virt_start =3D 0x44007000,<br>			.size =3D 0x400,<br>			.flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<b=
r>		},<br>		/* TIM15 - STM32MP157 */ {<br>			.phys_start =3D 0x44006000,<br=
>			.virt_start =3D 0x44006000,<br>			.size =3D 0x400,<br>			.flags =3D JAI=
LHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br=
>		/* SPI4 - STM32MP157 */ {<br>			.phys_start =3D 0x44005000,<br>			.virt_=
start =3D 0x44005000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM=
_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* SPI1=
 - STM32MP157 */ {<br>			.phys_start =3D 0x44004000,<br>			.virt_start =3D =
0x44004000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JA=
ILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* USART6 - STM32=
MP157 */ {<br>			.phys_start =3D 0x44003000,<br>			.virt_start =3D 0x440030=
00,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_=
MEM_WRITE |<br>				JAILHOUSE_MEM_IO_32,<br>		},<br>		/* TIM 8 - STM32MP157 =
*/ {<br>			.phys_start =3D 0x44001000,<br>			.virt_start =3D 0x44001000,<br=
>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WR=
ITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* TIM 1 - STM32MP157 */ {<br>	=
		.phys_start =3D 0x44000000,<br>			.virt_start =3D 0x44000000,<br>			.size=
 =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>=
				JAILHOUSE_MEM_IO,<br>		},<br>		/* MDIOS - STM32MP157 */ {<br>			.phys_s=
tart =3D 0x4001C000,<br>			.virt_start =3D 0x4001C000,<br>			.size =3D 0x40=
0,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILH=
OUSE_MEM_IO,<br>		},<br>		/* UART8 - STM32MP157 */ {<br>			.phys_start =3D =
0x40019000,<br>			.virt_start =3D 0x40019000,<br>			.size =3D 0x400,<br>			=
.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_=
IO_32,<br>		},<br>		/* UART7 - STM32MP157 */ {<br>			.phys_start =3D 0x4001=
8000,<br>			.virt_start =3D 0x40018000,<br>			.size =3D 0x400,<br>			.flags=
 =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_32,=
<br>		},<br>		/* DAC1 - STM32MP157 */ {<br>			.phys_start =3D 0x40017000,<b=
r>			.virt_start =3D 0x40017000,<br>			.size =3D 0x400,<br>			.flags =3D JA=
ILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<b=
r>		/* CEC - STM32MP157 */ {<br>			.phys_start =3D 0x40016000,<br>			.virt_=
start =3D 0x40016000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM=
_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* I2C5=
 - STM32MP157 */ {<br>			.phys_start =3D 0x40015000,<br>			.virt_start =3D =
0x40015000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JA=
ILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_32,<br>		},<br>		/* I2C3 - STM3=
2MP157 */ {<br>			.phys_start =3D 0x40014000,<br>			.virt_start =3D 0x40014=
000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE=
_MEM_WRITE |<br>				JAILHOUSE_MEM_IO_32,<br>		},<br>		/* I2C2 - STM32MP157 =
*/ {<br>			.phys_start =3D 0x40013000,<br>			.virt_start =3D 0x40013000,<br=
>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WR=
ITE |<br>				JAILHOUSE_MEM_IO_32,<br>		},<br>		/* I2C1 - STM32MP157 */ {<br=
>			.phys_start =3D 0x40012000,<br>			.virt_start =3D 0x40012000,<br>			.si=
ze =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<b=
r>				JAILHOUSE_MEM_IO_32,<br>		},<br>		/* UART5 - STM32MP157 */ {<br>			.p=
hys_start =3D 0x40011000,<br>			.virt_start =3D 0x40011000,<br>			.size =3D=
 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				=
JAILHOUSE_MEM_IO_32,<br>		},<br>		/* UART4 - STM32MP157 */ {<br>			.phys_st=
art =3D 0x40010000,<br>			.virt_start =3D 0x40010000,<br>			.size =3D 0x400=
,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHO=
USE_MEM_IO_32,<br>		},<br>		/* USART3 - STM32MP157 */ {<br>			.phys_start =
=3D 0x4000F000,<br>			.virt_start =3D 0x4000F000,<br>			.size =3D 0x400,<br=
>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_=
MEM_IO_32,<br>		},<br>		/* USART2 - STM32MP157 */ {<br>			.phys_start =3D 0=
x4000E000,<br>			.virt_start =3D 0x4000E000,<br>			.size =3D 0x400,<br>			.=
flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_I=
O_32,<br>		},<br>		/* SPDIFRX - STM32MP157 */ {<br>			.phys_start =3D 0x400=
0D000,<br>			.virt_start =3D 0x4000D000,<br>			.size =3D 0x400,<br>			.flag=
s =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<b=
r>		},<br>		/* SPI3 - STM32MP157 */ {<br>			.phys_start =3D 0x4000C000,<br>=
			.virt_start =3D 0x4000C000,<br>			.size =3D 0x400,<br>			.flags =3D JAIL=
HOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>=
		/* SPI2 - STM32MP157 */ {<br>			.phys_start =3D 0x4000B000,<br>			.virt_s=
tart =3D 0x4000B000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_=
READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* WWDG1=
 - STM32MP157 */ {<br>			.phys_start =3D 0x4000A000,<br>			.virt_start =3D =
0x4000A000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JA=
ILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* LPTIM1 - STM32=
MP157 */ {<br>			.phys_start =3D 0x40009000,<br>			.virt_start =3D 0x400090=
00,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_=
MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* TIM14 - STM32MP157 */ =
{<br>			.phys_start =3D 0x40008000,<br>			.virt_start =3D 0x40008000,<br>		=
	.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE=
 |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* TIM13 - STM32MP157 */ {<br>			.=
phys_start =3D 0x40007000,<br>			.virt_start =3D 0x40007000,<br>			.size =
=3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>	=
			JAILHOUSE_MEM_IO,<br>		},<br>		/* TIM12 - STM32MP157 */ {<br>			.phys_st=
art =3D 0x40006000,<br>			.virt_start =3D 0x40006000,<br>			.size =3D 0x400=
,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHO=
USE_MEM_IO,<br>		},<br>		/* TIM7 - STM32MP157 */ {<br>			.phys_start =3D 0x=
40005000,<br>			.virt_start =3D 0x40005000,<br>			.size =3D 0x400,<br>			.f=
lags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO=
,<br>		},<br>		/* TIM6 - STM32MP157 */ {<br>			.phys_start =3D 0x40004000,<=
br>			.virt_start =3D 0x40004000,<br>			.size =3D 0x400,<br>			.flags =3D J=
AILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<=
br>		/* TIM5 - STM32MP157 */ {<br>			.phys_start =3D 0x40003000,<br>			.vir=
t_start =3D 0x40003000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_M=
EM_READ | JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* TI=
M4 - STM32MP157 */ {<br>			.phys_start =3D 0x40002000,<br>			.virt_start =
=3D 0x40002000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ =
| JAILHOUSE_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* TIM3 - STM=
32MP157 */ {<br>			.phys_start =3D 0x40001000,<br>			.virt_start =3D 0x4000=
1000,<br>			.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUS=
E_MEM_WRITE |<br>				JAILHOUSE_MEM_IO,<br>		},<br>		/* TIM2 - STM32MP157 */=
 {<br>			.phys_start =3D 0x40000000,<br>			.virt_start =3D 0x40000000,<br>	=
		.size =3D 0x400,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRIT=
E |<br>				JAILHOUSE_MEM_IO,<br>		},<br><br>		/****************************=
***********************************************/<br>		/********************=
********** RAM ALIASES ********************************/<br>		/************=
************* 0x30000000 - 0x40000000 *************************/<br>		/****=
***********************************************************************/<br=
>		/* RETRAM */{<br>			.phys_start =3D 0x38000000,<br>			.virt_start =3D 0x=
38000000,<br>			.size =3D 0x10000,<br>			.flags =3D JAILHOUSE_MEM_READ | JA=
ILHOUSE_MEM_WRITE,<br>		},<br>		/* SRAM - ALIAS 4 */{<br>			.phys_start =3D=
 0x30050000,<br>			.virt_start =3D 0x30050000,<br>			.size =3D 0x10000,<br>=
			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<br>		},<br>		/* SRA=
M - ALIAS 3 */{<br>			.phys_start =3D 0x30040000,<br>			.virt_start =3D 0x3=
0040000,<br>			.size =3D 0x10000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAI=
LHOUSE_MEM_WRITE,<br>		},<br>		/* SRAM - ALIAS 2 */{<br>			.phys_start =3D =
0x30020000,<br>			.virt_start =3D 0x30020000,<br>			.size =3D 0x20000,<br>	=
		.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				 JAILHOUSE_M=
EM_EXECUTE,<br>		},<br>		/* SRAM - ALIAS 1 */{<br>			.phys_start =3D 0x3000=
0000,<br>			.virt_start =3D 0x30000000,<br>			.size =3D 0x20000,<br>			.fla=
gs =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				 JAILHOUSE_MEM_EXE=
CUTE,<br>		},<br><br>		/****************************** SRAMs **************=
************************/<br>		/************************* 0x10000000 - 0x30=
000000 *************************/<br>		/***********************************=
****************************************/<br>		/* SYSRAM */{<br>			.phys_st=
art =3D 0x2FFC0000,<br>			.virt_start =3D 0x2FFC0000,<br>			.size =3D 0x400=
00,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<br>		},<br>	=
	/* SRAM4 */{<br>			.phys_start =3D 0x10050000,<br>			.virt_start =3D 0x100=
50000,<br>			.size =3D 0x10000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILH=
OUSE_MEM_WRITE,<br>		},<br>		/* SRAM3 */{<br>			.phys_start =3D 0x10040000,=
<br>			.virt_start =3D 0x10040000,<br>			.size =3D 0x10000,<br>			.flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<br>		},<br>		/* SRAM2 */{<br>=
			.phys_start =3D 0x10020000,<br>			.virt_start =3D 0x10020000,<br>			.siz=
e =3D 0x20000,<br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<=
br>				 JAILHOUSE_MEM_EXECUTE,<br>		},<br>		/* SRAM1 */{<br>			.phys_start =
=3D 0x10000000,<br>			.virt_start =3D 0x10000000,<br>			.size =3D 0x20000,<=
br>			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>				 JAILHOU=
SE_MEM_EXECUTE,<br>		},<br>	},<br><br>	.irqchips =3D {<br>		/* GIC STM32MP1=
57*/ {<br>			.address =3D 0xA0021000,<br>			.pin_base =3D 32,<br>			.pin_bi=
tmap =3D {<br>				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff<br>			},<b=
r>		},<br>	},<br>};<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">pe 6. tammik. 2023 klo 9.19 Ralf Ramsauer (<a=
 href=3D"mailto:ralf.ramsauer@oth-regensburg.de" target=3D"_blank">ralf.ram=
sauer@oth-regensburg.de</a>) kirjoitti:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><br>
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
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAP8Rr60GYLysxvzeovfJ8CZ02DBzVjurmZ5s0bf6W0D6BaJwA=
A%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAP8Rr60GYLysxvzeovfJ8CZ02DBzVjurmZ5s0bf6W0=
D6BaJwAA%40mail.gmail.com</a>.<br />

--00000000000096bd2f05f19abfdf--
--00000000000096bd3105f19abfe1
Content-Type: text/plain; charset="windows-1252"; name="devicetree.txt"
Content-Disposition: attachment; filename="devicetree.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_lckpy0d80>
X-Attachment-Id: f_lckpy0d80

PT0+IC9wcm9jL2RldmljZS10cmVlL2ludGVycnVwdC1jb250cm9sbGVyQGEwMDIxMDAwL2NvbXBh
dGlibGUgPD09CmFybSxjb3J0ZXgtYTctZ2ljAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvaW50ZXJy
dXB0LWNvbnRyb2xsZXJAYTAwMjEwMDAvI2ludGVycnVwdC1jZWxscyA8PT0KAAAAAwo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvaW50ZXJydXB0LWNvbnRyb2xsZXJAYTAwMjEwMDAvcGhhbmRsZSA8PT0K
AAAABwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvaW50ZXJydXB0LWNvbnRyb2xsZXJAYTAwMjEwMDAv
cmVnIDw9PQqgAhAAAAAQAKACIAAAACAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9pbnRlcnJ1cHQt
Y29udHJvbGxlckBhMDAyMTAwMC9uYW1lIDw9PQppbnRlcnJ1cHQtY29udHJvbGxlcgAKPT0+IC9w
cm9jL2RldmljZS10cmVlL2ludGVycnVwdC1jb250cm9sbGVyQGEwMDIxMDAwL2ludGVycnVwdC1j
b250cm9sbGVyIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL2NvbXBhdGlibGUgPD09CnN0LHN0
bTMybXAxNTdmLWV2MQBzdCxzdG0zMm1wMTU3Zi1lZDEAc3Qsc3RtMzJtcDE1NwAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3Jlc2VydmVkLW1lbW9yeS92ZGV2MGJ1ZmZlckAxMDA0MjAwMC9jb21wYXRp
YmxlIDw9PQpzaGFyZWQtZG1hLXBvb2wACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9yZXNlcnZlZC1t
ZW1vcnkvdmRldjBidWZmZXJAMTAwNDIwMDAvbm8tbWFwIDw9PQoKPT0+IC9wcm9jL2RldmljZS10
cmVlL3Jlc2VydmVkLW1lbW9yeS92ZGV2MGJ1ZmZlckAxMDA0MjAwMC9waGFuZGxlIDw9PQoAAACf
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9yZXNlcnZlZC1tZW1vcnkvdmRldjBidWZmZXJAMTAwNDIw
MDAvcmVnIDw9PQoQBCAAAABAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcmVzZXJ2ZWQtbWVtb3J5
L3ZkZXYwYnVmZmVyQDEwMDQyMDAwL25hbWUgPD09CnZkZXYwYnVmZmVyAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvcmVzZXJ2ZWQtbWVtb3J5L21jdV9yc2NfdGFibGVAMTAwNDgwMDAvY29tcGF0aWJs
ZSA8PT0Kc2hhcmVkLWRtYS1wb29sAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcmVzZXJ2ZWQtbWVt
b3J5L21jdV9yc2NfdGFibGVAMTAwNDgwMDAvbm8tbWFwIDw9PQoKPT0+IC9wcm9jL2RldmljZS10
cmVlL3Jlc2VydmVkLW1lbW9yeS9tY3VfcnNjX3RhYmxlQDEwMDQ4MDAwL3BoYW5kbGUgPD09CgAA
AKAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Jlc2VydmVkLW1lbW9yeS9tY3VfcnNjX3RhYmxlQDEw
MDQ4MDAwL3JlZyA8PT0KEASAAAAAgAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Jlc2VydmVkLW1l
bW9yeS9tY3VfcnNjX3RhYmxlQDEwMDQ4MDAwL25hbWUgPD09Cm1jdV9yc2NfdGFibGUACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9yZXNlcnZlZC1tZW1vcnkvdmRldjB2cmluZzFAMTAwNDEwMDAvY29t
cGF0aWJsZSA8PT0Kc2hhcmVkLWRtYS1wb29sAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcmVzZXJ2
ZWQtbWVtb3J5L3ZkZXYwdnJpbmcxQDEwMDQxMDAwL25vLW1hcCA8PT0KCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9yZXNlcnZlZC1tZW1vcnkvdmRldjB2cmluZzFAMTAwNDEwMDAvcGhhbmRsZSA8PT0K
AAAAngo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcmVzZXJ2ZWQtbWVtb3J5L3ZkZXYwdnJpbmcxQDEw
MDQxMDAwL3JlZyA8PT0KEAQQAAAAEAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Jlc2VydmVkLW1l
bW9yeS92ZGV2MHZyaW5nMUAxMDA0MTAwMC9uYW1lIDw9PQp2ZGV2MHZyaW5nMQAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3Jlc2VydmVkLW1lbW9yeS92ZGV2MHZyaW5nMEAxMDA0MDAwMC9jb21wYXRp
YmxlIDw9PQpzaGFyZWQtZG1hLXBvb2wACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9yZXNlcnZlZC1t
ZW1vcnkvdmRldjB2cmluZzBAMTAwNDAwMDAvbm8tbWFwIDw9PQoKPT0+IC9wcm9jL2RldmljZS10
cmVlL3Jlc2VydmVkLW1lbW9yeS92ZGV2MHZyaW5nMEAxMDA0MDAwMC9waGFuZGxlIDw9PQoAAACd
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9yZXNlcnZlZC1tZW1vcnkvdmRldjB2cmluZzBAMTAwNDAw
MDAvcmVnIDw9PQoQBAAAAAAQAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcmVzZXJ2ZWQtbWVtb3J5
L3ZkZXYwdnJpbmcwQDEwMDQwMDAwL25hbWUgPD09CnZkZXYwdnJpbmcwAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvcmVzZXJ2ZWQtbWVtb3J5L3JldHJhbUAzODAwMDAwMC9jb21wYXRpYmxlIDw9PQpz
aGFyZWQtZG1hLXBvb2wACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9yZXNlcnZlZC1tZW1vcnkvcmV0
cmFtQDM4MDAwMDAwL25vLW1hcCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9yZXNlcnZlZC1t
ZW1vcnkvcmV0cmFtQDM4MDAwMDAwL3BoYW5kbGUgPD09CgAAAJoKPT0+IC9wcm9jL2RldmljZS10
cmVlL3Jlc2VydmVkLW1lbW9yeS9yZXRyYW1AMzgwMDAwMDAvcmVnIDw9PQo4AAAAAAEAAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvcmVzZXJ2ZWQtbWVtb3J5L3JldHJhbUAzODAwMDAwMC9uYW1lIDw9
PQpyZXRyYW0ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9yZXNlcnZlZC1tZW1vcnkvamhfaW5tYXRl
QGY2YTAwMDAwL2NvbnRpZ3VvdXMtYXJlYSA8PT0KAAAAowo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
cmVzZXJ2ZWQtbWVtb3J5L2poX2lubWF0ZUBmNmEwMDAwMC9zdGF0dXMgPD09Cm9rYXkACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9yZXNlcnZlZC1tZW1vcnkvamhfaW5tYXRlQGY2YTAwMDAwL25vLW1h
cCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9yZXNlcnZlZC1tZW1vcnkvamhfaW5tYXRlQGY2
YTAwMDAwL3BoYW5kbGUgPD09CgAAAKMKPT0+IC9wcm9jL2RldmljZS10cmVlL3Jlc2VydmVkLW1l
bW9yeS9qaF9pbm1hdGVAZjZhMDAwMDAvcmVnIDw9PQr2oAAAAGAAAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvcmVzZXJ2ZWQtbWVtb3J5L2poX2lubWF0ZUBmNmEwMDAwMC9uYW1lIDw9PQpqaF9pbm1h
dGUACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9yZXNlcnZlZC1tZW1vcnkvcmFuZ2VzIDw9PQoKPT0+
IC9wcm9jL2RldmljZS10cmVlL3Jlc2VydmVkLW1lbW9yeS8jYWRkcmVzcy1jZWxscyA8PT0KAAAA
AQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcmVzZXJ2ZWQtbWVtb3J5LyNzaXplLWNlbGxzIDw9PQoA
AAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9yZXNlcnZlZC1tZW1vcnkvZnJhbWVidWZmZXJAZjVj
MDAwMDAvbm8tbWFwIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3Jlc2VydmVkLW1lbW9yeS9m
cmFtZWJ1ZmZlckBmNWMwMDAwMC9yZWcgPD09CvXAAAAAPwAACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9yZXNlcnZlZC1tZW1vcnkvZnJhbWVidWZmZXJAZjVjMDAwMDAvbmFtZSA8PT0KZnJhbWVidWZm
ZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9yZXNlcnZlZC1tZW1vcnkvamFpbGhvdXNlQGY3MDAw
MDAwL2NvbnRpZ3VvdXMtYXJlYSA8PT0KAAAAogo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcmVzZXJ2
ZWQtbWVtb3J5L2phaWxob3VzZUBmNzAwMDAwMC9zdGF0dXMgPD09Cm9rYXkACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9yZXNlcnZlZC1tZW1vcnkvamFpbGhvdXNlQGY3MDAwMDAwL25vLW1hcCA8PT0K
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9yZXNlcnZlZC1tZW1vcnkvamFpbGhvdXNlQGY3MDAwMDAw
L3BoYW5kbGUgPD09CgAAAKIKPT0+IC9wcm9jL2RldmljZS10cmVlL3Jlc2VydmVkLW1lbW9yeS9q
YWlsaG91c2VAZjcwMDAwMDAvcmVnIDw9PQr3AAAAAGAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
cmVzZXJ2ZWQtbWVtb3J5L2phaWxob3VzZUBmNzAwMDAwMC9uYW1lIDw9PQpqYWlsaG91c2UACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9yZXNlcnZlZC1tZW1vcnkvbWN1cmFtMkAxMDAwMDAwMC9jb21w
YXRpYmxlIDw9PQpzaGFyZWQtZG1hLXBvb2wACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9yZXNlcnZl
ZC1tZW1vcnkvbWN1cmFtMkAxMDAwMDAwMC9uby1tYXAgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvcmVzZXJ2ZWQtbWVtb3J5L21jdXJhbTJAMTAwMDAwMDAvcGhhbmRsZSA8PT0KAAAAnAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvcmVzZXJ2ZWQtbWVtb3J5L21jdXJhbTJAMTAwMDAwMDAvcmVnIDw9
PQoQAAAAAAQAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcmVzZXJ2ZWQtbWVtb3J5L21jdXJhbTJA
MTAwMDAwMDAvbmFtZSA8PT0KbWN1cmFtMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Jlc2VydmVk
LW1lbW9yeS9tY3VyYW1AMzAwMDAwMDAvY29tcGF0aWJsZSA8PT0Kc2hhcmVkLWRtYS1wb29sAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvcmVzZXJ2ZWQtbWVtb3J5L21jdXJhbUAzMDAwMDAwMC9uby1t
YXAgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcmVzZXJ2ZWQtbWVtb3J5L21jdXJhbUAzMDAw
MDAwMC9waGFuZGxlIDw9PQoAAACbCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9yZXNlcnZlZC1tZW1v
cnkvbWN1cmFtQDMwMDAwMDAwL3JlZyA8PT0KMAAAAAAEAAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3Jlc2VydmVkLW1lbW9yeS9tY3VyYW1AMzAwMDAwMDAvbmFtZSA8PT0KbWN1cmFtAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvcmVzZXJ2ZWQtbWVtb3J5L25hbWUgPD09CnJlc2VydmVkLW1lbW9yeQAK
PT0+IC9wcm9jL2RldmljZS10cmVlL2Nsb2Nrcy9jbGstZXh0LWNhbWVyYS9jb21wYXRpYmxlIDw9
PQpmaXhlZC1jbG9jawAKPT0+IC9wcm9jL2RldmljZS10cmVlL2Nsb2Nrcy9jbGstZXh0LWNhbWVy
YS8jY2xvY2stY2VsbHMgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2Nsb2Nrcy9jbGst
ZXh0LWNhbWVyYS9waGFuZGxlIDw9PQoAAAAkCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9jbG9ja3Mv
Y2xrLWV4dC1jYW1lcmEvY2xvY2stZnJlcXVlbmN5IDw9PQoBbjYACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9jbG9ja3MvY2xrLWV4dC1jYW1lcmEvbmFtZSA8PT0KY2xrLWV4dC1jYW1lcmEACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9jbG9ja3MvbmFtZSA8PT0KY2xvY2tzAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvcG1fZG9tYWluL2NvbXBhdGlibGUgPD09CnN0LHN0bTMybXAxNTdjLXBkAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvcG1fZG9tYWluL2NvcmUtcmV0LXBvd2VyLWRvbWFpbkAxL2NvcmUtcG93
ZXItZG9tYWluQDIvbGFiZWwgPD09CkNPUkUACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9wbV9kb21h
aW4vY29yZS1yZXQtcG93ZXItZG9tYWluQDEvY29yZS1wb3dlci1kb21haW5AMi9waGFuZGxlIDw9
PQoAAAATCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9wbV9kb21haW4vY29yZS1yZXQtcG93ZXItZG9t
YWluQDEvY29yZS1wb3dlci1kb21haW5AMi9yZWcgPD09CgAAAAIKPT0+IC9wcm9jL2RldmljZS10
cmVlL3BtX2RvbWFpbi9jb3JlLXJldC1wb3dlci1kb21haW5AMS9jb3JlLXBvd2VyLWRvbWFpbkAy
L25hbWUgPD09CmNvcmUtcG93ZXItZG9tYWluAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcG1fZG9t
YWluL2NvcmUtcmV0LXBvd2VyLWRvbWFpbkAxL2NvcmUtcG93ZXItZG9tYWluQDIvI3Bvd2VyLWRv
bWFpbi1jZWxscyA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcG1fZG9tYWluL2NvcmUt
cmV0LXBvd2VyLWRvbWFpbkAxLyNhZGRyZXNzLWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9wbV9kb21haW4vY29yZS1yZXQtcG93ZXItZG9tYWluQDEvbGFiZWwgPD09CkNPUkUt
UkVURU5USU9OAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcG1fZG9tYWluL2NvcmUtcmV0LXBvd2Vy
LWRvbWFpbkAxLyNzaXplLWNlbGxzIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9wbV9k
b21haW4vY29yZS1yZXQtcG93ZXItZG9tYWluQDEvcGhhbmRsZSA8PT0KAAAAuAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvcG1fZG9tYWluL2NvcmUtcmV0LXBvd2VyLWRvbWFpbkAxL3JlZyA8PT0KAAAA
AQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcG1fZG9tYWluL2NvcmUtcmV0LXBvd2VyLWRvbWFpbkAx
L25hbWUgPD09CmNvcmUtcmV0LXBvd2VyLWRvbWFpbgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Bt
X2RvbWFpbi9jb3JlLXJldC1wb3dlci1kb21haW5AMS8jcG93ZXItZG9tYWluLWNlbGxzIDw9PQoA
AAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9wbV9kb21haW4vI2FkZHJlc3MtY2VsbHMgPD09CgAA
AAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3BtX2RvbWFpbi8jc2l6ZS1jZWxscyA8PT0KAAAAAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvcG1fZG9tYWluL25hbWUgPD09CnBtX2RvbWFpbgAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NyYW1AMmZmZmYwMDAvY29tcGF0aWJsZSA8PT0KbW1pby1zcmFtAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc3JhbUAyZmZmZjAwMC9yYW5nZXMgPD09CgAAAAAv//AAAAAQ
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc3JhbUAyZmZmZjAwMC8jYWRkcmVzcy1jZWxscyA8PT0K
AAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc3JhbUAyZmZmZjAwMC8jc2l6ZS1jZWxscyA8PT0K
AAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc3JhbUAyZmZmZjAwMC9waGFuZGxlIDw9PQoAAAC0
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zcmFtQDJmZmZmMDAwL3JlZyA8PT0KL//wAAAAEAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NyYW1AMmZmZmYwMDAvc2NtaV9zaG1AMC9jb21wYXRpYmxlIDw9
PQphcm0sc2NtaS1zaG1lbQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NyYW1AMmZmZmYwMDAvc2Nt
aV9zaG1AMC9waGFuZGxlIDw9PQoAAAAICj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zcmFtQDJmZmZm
MDAwL3NjbWlfc2htQDAvcmVnIDw9PQoAAAAAAAAAgAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc3Jh
bUAyZmZmZjAwMC9zY21pX3NobUAwL25hbWUgPD09CnNjbWlfc2htAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc3JhbUAyZmZmZjAwMC9uYW1lIDw9PQpzcmFtAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
YXJtLXBtdS9jb21wYXRpYmxlIDw9PQphcm0sY29ydGV4LWE3LXBtdQAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL2FybS1wbXUvaW50ZXJydXB0LXBhcmVudCA8PT0KAAAABwo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvYXJtLXBtdS9pbnRlcnJ1cHRzIDw9PQoAAAAAAAAAyAAAAAQAAAAAAAAAyQAAAAQKPT0+
IC9wcm9jL2RldmljZS10cmVlL2FybS1wbXUvaW50ZXJydXB0LWFmZmluaXR5IDw9PQoAAAAFAAAA
Bgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYXJtLXBtdS9uYW1lIDw9PQphcm0tcG11AAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvZG1pYy0yL2NvbXBhdGlibGUgPD09CmRtaWMtY29kZWMACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9kbWljLTIvI3NvdW5kLWRhaS1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvZG1pYy0yL3BvcnQvZW5kcG9pbnQvcmVtb3RlLWVuZHBvaW50IDw9PQoAAACy
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9kbWljLTIvcG9ydC9lbmRwb2ludC9waGFuZGxlIDw9PQoA
AABHCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9kbWljLTIvcG9ydC9lbmRwb2ludC9uYW1lIDw9PQpl
bmRwb2ludAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2RtaWMtMi9wb3J0L25hbWUgPD09CnBvcnQA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9kbWljLTIvc291bmQtbmFtZS1wcmVmaXggPD09CmRtaWMy
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvZG1pYy0yL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9j
L2RldmljZS10cmVlL2RtaWMtMi9waGFuZGxlIDw9PQoAAAIZCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9kbWljLTIvbmFtZSA8PT0KZG1pYy0yAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc2VyaWFsLW51
bWJlciA8PT0KMDAzQTAwMzAzMjMxNTExMzMwMzQzMzMwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
ZG1pYy0wL2NvbXBhdGlibGUgPD09CmRtaWMtY29kZWMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9k
bWljLTAvI3NvdW5kLWRhaS1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvZG1p
Yy0wL3BvcnQvZW5kcG9pbnQvcmVtb3RlLWVuZHBvaW50IDw9PQoAAACwCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9kbWljLTAvcG9ydC9lbmRwb2ludC9waGFuZGxlIDw9PQoAAABDCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9kbWljLTAvcG9ydC9lbmRwb2ludC9uYW1lIDw9PQplbmRwb2ludAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL2RtaWMtMC9wb3J0L25hbWUgPD09CnBvcnQACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9kbWljLTAvc291bmQtbmFtZS1wcmVmaXggPD09CmRtaWMwAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvZG1pYy0wL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2RldmljZS10cmVlL2Rt
aWMtMC9waGFuZGxlIDw9PQoAAAIXCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9kbWljLTAvbmFtZSA8
PT0KZG1pYy0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcGFuZWwtYmFja2xpZ2h0L2dwaW9zIDw9
PQoAAACkAAAADQAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3BhbmVsLWJhY2tsaWdodC9jb21w
YXRpYmxlIDw9PQpncGlvLWJhY2tsaWdodAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3BhbmVsLWJh
Y2tsaWdodC9kZWZhdWx0LW9uIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3BhbmVsLWJhY2ts
aWdodC9zdGF0dXMgPD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9wYW5lbC1iYWNrbGln
aHQvcGhhbmRsZSA8PT0KAAAAlgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcGFuZWwtYmFja2xpZ2h0
L25hbWUgPD09CnBhbmVsLWJhY2tsaWdodAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9s
c19fL2x0ZGMgPD09Ci9zb2MvZGlzcGxheS1jb250cm9sbGVyQDVhMDAxMDAwAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vaTJzMyA8PT0KL3NvYy9hdWRpby1jb250cm9sbGVyQDQw
MDBjMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdXNhcnQzX3BpbnNfYSA8
PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMtMAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL19fc3ltYm9sc19fL3NkbW1jMl9kNDdfcGluc19kIDw9PQovc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3NkbW1jMi1kNDctMwAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9s
c19fL3NwZGlmX2luIDw9PQovc3BkaWYtaW4ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJv
bHNfXy9tNF9zZG1tYzMgPD09Ci9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9z
ZG1tY0A0ODAwNDAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2kyYzMgPD09
Ci9zb2MvaTJjQDQwMDE0MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vZ3Bp
b2sgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwYzAwMAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NwZGlmcnhfcGluc19hIDw9PQovc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL3NwZGlmcngtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3lt
Ym9sc19fL3NhaTJiX3BvcnQgPD09Ci9zb2Mvc2FpQDQ0MDBiMDAwL2F1ZGlvLWNvbnRyb2xsZXJA
NDQwMGIwMjQvcG9ydAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3RhbXAgPD09
Ci9zb2MvdGFtcEA1YzAwYTAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3Vz
YXJ0M19pZGxlX3BpbnNfYiA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMt
aWRsZS0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfc2FpNCA8PT0KL2Fo
Yi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NhaUA1MDAyNzAwMAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL19fc3ltYm9sc19fL2FkYzEgPD09Ci9zb2MvYWRjQDQ4MDAzMDAwL2FkY0Aw
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdGltZXJzMyA8PT0KL3NvYy90aW1l
ckA0MDAwMTAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL292NTY0MCA8PT0K
L3NvYy9pMmNANDAwMTMwMDAvY2FtZXJhQDNjAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1i
b2xzX18vZ3Q5MTQ3IDw9PQovc29jL2kyY0A0MDAxMzAwMC9nb29kaXhfdHNANWQACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy90aW1lcnMxNCA8PT0KL3NvYy90aW1lckA0MDAwODAw
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X2xwdGltZXIyIDw9PQovYWhi
L200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANTAwMjEwMDAACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy91c2FydDMgPD09Ci9zb2Mvc2VyaWFsQDQwMDBmMDAw
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vc3BkaWZyeF9zbGVlcF9waW5zX2Eg
PD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc3BkaWZyeC1zbGVlcC0wAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfZGZzZG0gPD09Ci9haGIvbTRAMTAwMDAwMDAv
bTRfc3lzdGVtX3Jlc291cmNlcy9kZnNkbUA0NDAwZDAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L19fc3ltYm9sc19fL2ludGMgPD09Ci9pbnRlcnJ1cHQtY29udHJvbGxlckBhMDAyMTAwMAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NhaTJhX3NsZWVwX3BpbnNfYyA8PT0KL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWkyYS0yAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
X19zeW1ib2xzX18vZGZzZG1fY2xrb3V0X3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9kZnNkbS1jbGtvdXQtcGlucy0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1i
b2xzX18vbTRfcnRjX291dDJfcm1wX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9tNC1ydGMtb3V0Mi1ybXAtcGlucy0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1i
b2xzX18vbTRfdXNib3RnX2hzX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9tNC11c2JvdGdfaHMtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3VzYXJ0
M19zbGVlcF9waW5zX2MgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQzLXNs
ZWVwLTIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9wZF9jb3JlX3JldCA8PT0K
L3BtX2RvbWFpbi9jb3JlLXJldC1wb3dlci1kb21haW5AMQAKPT0+IC9wcm9jL2RldmljZS10cmVl
L19fc3ltYm9sc19fL3B3bTJfc2xlZXBfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3B3bTItc2xlZXAtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2R0
cyA8PT0KL3NvYy90aGVybWFsQDUwMDI4MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1i
b2xzX18vYXNvY19wZG0yIDw9PQovc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAyL2Rmc2RtLWRh
aQAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X3VzYXJ0Ml9waW5zX2EgPD09
Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtdXNhcnQyLTAACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9fX3N5bWJvbHNfXy9wd20xMl9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvcHdtMTItMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2Rmc2Rt
MF9wb3J0IDw9PQovc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAwL2Rmc2RtLWRhaS9wb3J0AAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdXNhcnQyX3BpbnNfYyA8PT0KL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDItMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL19f
c3ltYm9sc19fL3N0bW1hY19heGlfY29uZmlnXzAgPD09Ci9zb2MvZXRoZXJuZXRANTgwMGEwMDAv
c3RtbWFjLWF4aS1jb25maWcACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF9k
ZnNkbV9kYXRhM19waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtZGZz
ZG0tZGF0YTMtcGlucy0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vaTJjNV9w
aW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaTJjNS0wAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vamhfaW5tYXRlIDw9PQovcmVzZXJ2ZWQtbWVtb3J5L2po
X2lubWF0ZUBmNmEwMDAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X2Rt
YTIgPD09Ci9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9kbWFANDgwMDEwMDAA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9zcGkyIDw9PQovc29jL3NwaUA0MDAw
YjAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X3B3bTNfcGluc19hIDw9
PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXB3bTMtMAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL19fc3ltYm9sc19fL3ZkZXYwdnJpbmcwIDw9PQovcmVzZXJ2ZWQtbWVtb3J5L3ZkZXYw
dnJpbmcwQDEwMDQwMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfaTJj
MV9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtaTJjMS0wAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vcHdtMTJfc2xlZXBfcGluc19hIDw9PQovc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTEyLXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9fX3N5bWJvbHNfXy9tNF9kYWMgPD09Ci9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jl
c291cmNlcy9kYWNANDAwMTcwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9k
bWljMl9lbmRwb2ludCA8PT0KL2RtaWMtMi9wb3J0L2VuZHBvaW50AAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvX19zeW1ib2xzX18vZG1hbXV4MSA8PT0KL3NvYy9kbWEtcm91dGVyQDQ4MDAyMDAwAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vc3RtZnggPD09Ci9zb2MvaTJjQDQwMDEz
MDAwL3N0bWZ4QDQyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vZXRoZXJuZXQw
X3JnbWlpX3NsZWVwX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9yZ21p
aS1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vaTJzMSA8PT0KL3Nv
Yy9hdWRpby1jb250cm9sbGVyQDQ0MDA0MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1i
b2xzX18vc3RtZnhfcGluY3RybCA8PT0KL3NvYy9pMmNANDAwMTMwMDAvc3RtZnhANDIvcGluY3Ry
bAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NkbW1jMl9kNDdfcGluc19iIDw9
PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1kNDctMQAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL19fc3ltYm9sc19fL2hkcDZfcGluc19zbGVlcF9hIDw9PQovc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL2hkcDYtc2xlZXAtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3lt
Ym9sc19fL2kyYzEgPD09Ci9zb2MvaTJjQDQwMDEyMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
X19zeW1ib2xzX18vbTRfZGZzZG1fY2xrb3V0X3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9tNC1kZnNkbS1jbGtvdXQtcGlucy0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
X19zeW1ib2xzX18vZ3Bpb2kgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1
MDAwYTAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NkbW1jMyA8PT0KL3Nv
Yy9tbWNANDgwMDQwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9wd201X3Ns
ZWVwX3BpbnNfYiA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd201LXNsZWVwLTEA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9scHRpbWVyNSA8PT0KL3NvYy90aW1l
ckA1MDAyNDAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X3NhaTIgPD09
Ci9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zYWlANDQwMGIwMDAACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy90aW1lcnMxIDw9PQovc29jL3RpbWVyQDQ0MDAw
MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfc2RtbWMyX2Q0N19waW5z
X2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc2RtbWMyLWQ0Ny0wAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vaTJjNV9zbGVlcF9waW5zX2EgPD09Ci9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaTJjNS1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvX19zeW1ib2xzX18vdWFydDggPD09Ci9zb2Mvc2VyaWFsQDQwMDE5MDAwAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdGltZXJzMTIgPD09Ci9zb2MvdGltZXJANDAwMDYwMDAA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9zZG1tYzNfYjRfb2RfcGluc19hIDw9
PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC1vZC0wAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfdGltZXJzOCA8PT0KL2FoYi9tNEAxMDAwMDAwMC9t
NF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQ0MDAxMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
X19zeW1ib2xzX18vcHdtM19waW5zX2IgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
cHdtMy0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdXNhcnQxIDw9PQovc29j
L3NlcmlhbEA1YzAwMDAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2V0aGVy
bmV0MF9yZ21paV9waW5zX2MgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWkt
MgAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2kyYzFfcGluc19iIDw9PQovc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzEtMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL19f
c3ltYm9sc19fL2kyYzJfcGluc19iMSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9p
MmMyLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF9mbWMgPD09Ci9haGIv
bTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9tZW1vcnktY29udHJvbGxlckA1ODAwMjAw
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NhaTJhX3NsZWVwX3BpbnNfYSA8
PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWkyYS1zbGVlcC0wAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vc2FpMmJfZW5kcG9pbnQgPD09Ci9zb2Mvc2FpQDQ0MDBi
MDAwL2F1ZGlvLWNvbnRyb2xsZXJANDQwMGIwMjQvcG9ydC9lbmRwb2ludAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL19fc3ltYm9sc19fL2RjbWlfc2xlZXBfcGluc19iIDw9PQovc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL2RjbWktc2xlZXAtMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3lt
Ym9sc19fL3FzcGkgPD09Ci9zb2Mvc3BpQDU4MDAzMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
X19zeW1ib2xzX18vYXNvY19wZG0wIDw9PQovc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAwL2Rm
c2RtLWRhaQAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2Rmc2RtX2VuZHBvaW50
MyA8PT0KL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMy9kZnNkbS1kYWkvcG9ydC9lbmRwb2lu
dAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X3NhaTJhX3BpbnNfYSA8PT0K
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1zYWkyYS0wAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvX19zeW1ib2xzX18vZ3B1IDw9PQovc29jL2dwdUA1OTAwMDAwMAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL19fc3ltYm9sc19fL2RzaSA8PT0KL3NvYy9kc2lANWEwMDAwMDAACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF9kYWNfY2gyX3BpbnNfYSA8PT0KL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9tNC1kYWMtY2gyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19z
eW1ib2xzX18vaHNlbSA8PT0KL3NvYy9od3NwaW5sb2NrQDRjMDAwMDAwAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvX19zeW1ib2xzX18vdXNhcnQyX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC91c2FydDItMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3Nw
aTVfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NwaTUtMAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NhaTJhX3BvcnQgPD09Ci9zb2Mvc2FpQDQ0MDBi
MDAwL2F1ZGlvLWNvbnRyb2xsZXJANDQwMGIwMDQvcG9ydAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L19fc3ltYm9sc19fL2hhc2gxIDw9PQovc29jL2hhc2hANTQwMDIwMDAACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9fX3N5bWJvbHNfXy9tNF9zcGkxX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxl
ci16QDU0MDA0MDAwL200LXNwaTEtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19f
L3NwZGlmX2luX2VuZHBvaW50IDw9PQovc3BkaWYtaW4vcG9ydC9lbmRwb2ludAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL19fc3ltYm9sc19fL3VzYnBoeWMgPD09Ci9zb2MvdXNicGh5Y0A1YTAwNjAw
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NkbW1jMV9kaXJfcGluc19iIDw9
PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1kaXItMQAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL19fc3ltYm9sc19fL3NjbWkgPD09Ci9maXJtd2FyZS9zY21pAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vZm1jX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9mbWMtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2Rmc2Rt
X2RhdGExX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9kZnNkbS1kYXRh
MS1waW5zLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9zcGRpZl9vdXRfcG9y
dCA8PT0KL3NwZGlmLW91dC9wb3J0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18v
c2FpMmJfcGluc19iIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NhaTJiLTEACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9ncGlveiA8PT0KL3NvYy9waW4tY29udHJv
bGxlci16QDU0MDA0MDAwL2dwaW9ANTQwMDQwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5
bWJvbHNfXy9tNF9zZG1tYzFfZGlyX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9tNC1zZG1tYzEtZGlyLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9z
cGRpZl9vdXRfZW5kcG9pbnQgPD09Ci9zcGRpZi1vdXQvcG9ydC9lbmRwb2ludAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL19fc3ltYm9sc19fL200X2kyYzUgPD09Ci9haGIvbTRAMTAwMDAwMDAvbTRf
c3lzdGVtX3Jlc291cmNlcy9pMmNANDAwMTUwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5
bWJvbHNfXy92ZGQgPD09Ci9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2J1
Y2szAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vZ3Bpb2cgPD09Ci9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwODAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L19fc3ltYm9sc19fL200X2V0aGVybmV0MF9yZ21paV9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvbTQtcmdtaWktMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9s
c19fL2NwdV9hbGVydCA8PT0KL3RoZXJtYWwtem9uZXMvY3B1LXRoZXJtYWwvdHJpcHMvY3B1LWFs
ZXJ0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbV9jYW4xX3NsZWVwX3BpbnNf
YSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tX2NhbjEtc2xlZXAtMAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NkbW1jMSA8PT0KL3NvYy9tbWNANTgwMDUwMDAA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9jZWNfc2xlZXBfcGluc19iIDw9PQov
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2NlYy1zbGVlcC0xAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvX19zeW1ib2xzX18vdXNicGh5Y19wb3J0MSA8PT0KL3NvYy91c2JwaHljQDVhMDA2MDAw
L3VzYi1waHlAMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2xwdGltZXIzIDw9
PQovc29jL3RpbWVyQDUwMDIyMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18v
Y3J5cDEgPD09Ci9zb2MvY3J5cEA1NDAwMTAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3lt
Ym9sc19fL200X3RpbWVyczE2IDw9PQovYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJj
ZXMvdGltZXJANDQwMDcwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF91
YXJ0N19waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtdWFydDctMAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3FzcGlfY2xrX3BpbnNfYSA8PT0KL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9xc3BpLWNsay0wAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvX19zeW1ib2xzX18vaTJjNF9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAw
NDAwMC9pMmM0LTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF9wd20yX3Bp
bnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1wd20yLTAACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF9hZGMxMl9haW5fcGluc19hIDw9PQovc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL200LWFkYzEyLWFpbi0wAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvX19zeW1ib2xzX18vbTRfdGltZXJzNiA8PT0KL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1f
cmVzb3VyY2VzL3RpbWVyQDQwMDA0MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xz
X18vdWFydDdfc2xlZXBfcGluc19jIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3Vh
cnQ3LXNsZWVwLTIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9ldGhlcm5ldDBf
cmdtaWlfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3JnbWlpLTAACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy93bTg5OTRfdHhfZW5kcG9pbnQgPD09Ci9z
b2MvaTJjQDQwMDEzMDAwL3dtODk5NEAxYi9wb3J0cy9wb3J0QDAvZW5kcG9pbnQACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9nb29kaXhfcGlucyA8PT0KL3NvYy9pMmNANDAwMTMw
MDAvc3RtZnhANDIvcGluY3RybC9nb29kaXgACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJv
bHNfXy9tNF9xc3BpX2JrMl9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
bTQtcXNwaS1iazItMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2Rmc2RtX2Vu
ZHBvaW50MSA8PT0KL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMS9kZnNkbS1kYWkvcG9ydC9l
bmRwb2ludAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NhaTJiX3NsZWVwX3Bp
bnNfYyA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWkyYi1zbGVlcC0yAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfbV9jYW4xIDw9PQovYWhiL200QDEwMDAw
MDAwL200X3N5c3RlbV9yZXNvdXJjZXMvY2FuQDQ0MDBlMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvX19zeW1ib2xzX18vcHdtM19zbGVlcF9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvcHdtMy1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18v
c2RtbWMzX2I0X3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzMt
YjQtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X3NwaTQgPD09Ci9haGIv
bTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zcGlANDQwMDUwMDAACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9jbGtfZXh0X2NhbWVyYSA8PT0KL2Nsb2Nrcy9jbGstZXh0
LWNhbWVyYQAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NkbW1jMl9kNDdfc2xl
ZXBfcGluc19kIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1kNDctc2xl
ZXAtMwAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2lwY2MgPD09Ci9zb2MvbWFp
bGJveEA0YzAwMTAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2FkYzEyX2Fp
bl9waW5zX2IgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvYWRjMTItYWluLTEACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy91c2FydDJfaWRsZV9waW5zX2MgPD09Ci9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQyLWlkbGUtMgAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL19fc3ltYm9sc19fL3NkX3N3aXRjaCA8PT0KL3JlZ3VsYXRvci1zZF9zd2l0Y2gACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF9jZWMgPD09Ci9haGIvbTRAMTAwMDAw
MDAvbTRfc3lzdGVtX3Jlc291cmNlcy9jZWNANDAwMTYwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9fX3N5bWJvbHNfXy9wd204X3NsZWVwX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9wd204LXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9k
c2lfcGFuZWxfaW4gPD09Ci9zb2MvZHNpQDVhMDAwMDAwL3BhbmVsLWRzaUAwL3BvcnQvZW5kcG9p
bnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9wYW5lbF9kc2kgPD09Ci9zb2Mv
ZHNpQDVhMDAwMDAwL3BhbmVsLWRzaUAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xz
X18vc2FpMyA8PT0KL3NvYy9zYWlANDQwMGMwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5
bWJvbHNfXy9tNF9zZG1tYzJfYjRfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL200LXNkbW1jMi1iNC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vc3Bk
aWZfaW5fcG9ydCA8PT0KL3NwZGlmLWluL3BvcnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5
bWJvbHNfXy90aW1lcnM4IDw9PQovc29jL3RpbWVyQDQ0MDAxMDAwAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvX19zeW1ib2xzX18vbHRkY19waW5zX2QgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvbHRkYy0zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfdXNhcnQ2
IDw9PQovYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2VyaWFsQDQ0MDAzMDAw
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfaTJzMyA8PT0KL2FoYi9tNEAx
MDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2F1ZGlvLWNvbnRyb2xsZXJANDAwMGMwMDAACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF9wd204X3BpbnNfYSA8PT0KL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1wd204LTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9f
X3N5bWJvbHNfXy9kYWNfY2gyX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9kYWMtY2gyLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF91YXJ0OCA8
PT0KL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0MDAxOTAwMAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X2kyYzMgPD09Ci9haGIvbTRAMTAw
MDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9pMmNANDAwMTQwMDAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9fX3N5bWJvbHNfXy9ldGhlcm5ldDAgPD09Ci9zb2MvZXRoZXJuZXRANTgwMGEwMDAACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9zZG1tYzFfZGlyX3NsZWVwX3BpbnNfYSA8
PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzEtZGlyLXNsZWVwLTAACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9kZnNkbTQgPD09Ci9zb2MvZGZzZG1ANDQwMGQw
MDAvZmlsdGVyQDQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9ncGlvZSA8PT0K
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDA2MDAwAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvX19zeW1ib2xzX18vbHB0aW1lcjEgPD09Ci9zb2MvdGltZXJANDAwMDkwMDAACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9oZHA3X3BpbnNfc2xlZXBfYSA8PT0KL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9oZHA3LXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9fX3N5bWJvbHNfXy9tNF90aW1lcnMxNCA8PT0KL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0
ZW1fcmVzb3VyY2VzL3RpbWVyQDQwMDA4MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1i
b2xzX18vY2VjX3BpbnNfYiA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9jZWMtMQAK
PT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2kyYzFfc2xlZXBfcGluc19hIDw9PQov
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzEtc2xlZXAtMAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL19fc3ltYm9sc19fL3NhaTRhIDw9PQovc29jL3NhaUA1MDAyNzAwMC9hdWRpby1jb250
cm9sbGVyQDUwMDI3MDA0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vZGRycGVy
Zm0gPD09Ci9zb2MvcGVyZkA1YTAwNzAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9s
c19fL200X2RhY19jaDFfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200
LWRhYy1jaDEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy91YXJ0NCA8PT0KL3Nv
Yy9zZXJpYWxANDAwMTAwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9zcGk0
X3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zcGk0LTAACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy91YXJ0NF9waW5zX2MgPD09Ci9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvdWFydDQtMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19f
L200X2x0ZGNfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LWx0ZGMt
YS0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vc2RtbWMzX2I0X3NsZWVwX3Bp
bnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzMtYjQtc2xlZXAtMAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL21fY2FuMV9waW5zX2IgPD09Ci9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbS1jYW4xLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9f
X3N5bWJvbHNfXy9tNF90aW1lcnM0IDw9PQovYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNv
dXJjZXMvdGltZXJANDAwMDIwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9t
NF9wd20xMl9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtcHdtMTIt
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3dtODk5NF90eF9wb3J0IDw9PQov
c29jL2kyY0A0MDAxMzAwMC93bTg5OTRAMWIvcG9ydHMvcG9ydEAwAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvX19zeW1ib2xzX18vbTRfdXNib3RnX2ZzX2RwX2RtX3BpbnNfYSA8PT0KL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9tNC11c2JvdGctZnMtZHAtZG0tMAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL19fc3ltYm9sc19fL2kyYzZfc2xlZXBfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9s
bGVyLXpANTQwMDQwMDAvaTJjNi1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1i
b2xzX18vZG1hMSA8PT0KL3NvYy9kbWEtY29udHJvbGxlckA0ODAwMDAwMAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL19fc3ltYm9sc19fL2x0ZGNfc2xlZXBfcGluc19jIDw9PQovc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL2x0ZGMtc2xlZXAtMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3lt
Ym9sc19fL3NkbW1jMl9iNF9waW5zX2IgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
c2RtbWMyLWI0LTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9hZGMgPD09Ci9z
b2MvYWRjQDQ4MDAzMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vZG1pYzMg
PD09Ci9kbWljLTMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9hZGMxX2luNl9w
aW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvYWRjMS1pbjYtMAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NhaTNhIDw9PQovc29jL3NhaUA0NDAwYzAwMC9h
dWRpby1jb250cm9sbGVyQDQ0MDBjMDA0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xz
X18vbTRfZXRoZXJuZXQwIDw9PQovYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMv
ZXRoZXJuZXRANTgwMGEwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9zYWky
YV9waW5zX2IgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpMmEtMQAKPT0+IC9w
cm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL21jdXJhbSA8PT0KL3Jlc2VydmVkLW1lbW9yeS9t
Y3VyYW1AMzAwMDAwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9zYWkyYl9z
bGVlcF9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpMmItc2xlZXAt
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X2NlY19waW5zX2EgPD09Ci9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtY2VjLTAACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9fX3N5bWJvbHNfXy91c2JvdGdfZnNfZHBfZG1fcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3VzYm90Zy1mcy1kcC1kbS0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19z
eW1ib2xzX18vbTRfdXNhcnQzX3BpbnNfYiA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9tNC11c2FydDMtMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X3NwaTIg
PD09Ci9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zcGlANDAwMGIwMDAACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9zZG1tYzJfZDQ3X3NsZWVwX3BpbnNfYiA8
PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItZDQ3LXNsZWVwLTEACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tX2NhbjEgPD09Ci9zb2MvY2FuQDQ0MDBlMDAw
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdmJ1c19zdyA8PT0KL3NvYy9pMmNA
NWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRvcnMvcHdyX3N3MgAKPT0+IC9wcm9jL2RldmljZS10
cmVlL19fc3ltYm9sc19fL2kyYzYgPD09Ci9zb2MvaTJjQDVjMDA5MDAwAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfcHdtNF9waW5zX2IgPD09Ci9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvbTQtcHdtNC0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18v
ZGFjMiA8PT0KL3NvYy9kYWNANDAwMTcwMDAvZGFjQDIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9f
X3N5bWJvbHNfXy9zYWkyYSA8PT0KL3NvYy9zYWlANDQwMGIwMDAvYXVkaW8tY29udHJvbGxlckA0
NDAwYjAwNAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3BhbmVsX2JhY2tsaWdo
dCA8PT0KL3BhbmVsLWJhY2tsaWdodAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19f
L3BkX2NvcmUgPD09Ci9wbV9kb21haW4vY29yZS1yZXQtcG93ZXItZG9tYWluQDEvY29yZS1wb3dl
ci1kb21haW5AMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3B3bTVfcGluc19h
IDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTUtMAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL19fc3ltYm9sc19fL200X2Rmc2RtX2RhdGExX3BpbnNfYSA8PT0KL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9tNC1kZnNkbS1kYXRhMS1waW5zLTAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9fX3N5bWJvbHNfXy9zYWkxIDw9PQovc29jL3NhaUA0NDAwYTAwMAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL19fc3ltYm9sc19fL3NkbW1jMl9iNF9vZF9waW5zX2IgPD09Ci9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWI0LW9kLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9f
X3N5bWJvbHNfXy9tNF9wd20xX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9tNC1wd20xLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy90aW1lcnM2IDw9
PQovc29jL3RpbWVyQDQwMDA0MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18v
bHRkY19waW5zX2IgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbHRkYy0xAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfaTJzMSA8PT0KL2FoYi9tNEAxMDAwMDAw
MC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2F1ZGlvLWNvbnRyb2xsZXJANDQwMDQwMDAACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy90aW1lcnMxNyA8PT0KL3NvYy90aW1lckA0NDAwODAw
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2RtaWMzX2VuZHBvaW50IDw9PQov
ZG1pYy0zL3BvcnQvZW5kcG9pbnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9l
dGhlcm5ldDBfcm1paV9zbGVlcF9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvcm1paS1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfbHB0
aW1lcjUgPD09Ci9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA1MDAy
NDAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X2kyYzEgPD09Ci9haGIv
bTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9pMmNANDAwMTIwMDAACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy91c2FydDYgPD09Ci9zb2Mvc2VyaWFsQDQ0MDAzMDAwAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vc2FpMWEgPD09Ci9zb2Mvc2FpQDQ0MDBh
MDAwL2F1ZGlvLWNvbnRyb2xsZXJANDQwMGEwMDQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5
bWJvbHNfXy91c2FydDJfc2xlZXBfcGluc19iIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL3VzYXJ0Mi1zbGVlcC0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vd204
OTk0IDw9PQovc29jL2kyY0A0MDAxMzAwMC93bTg5OTRAMWIACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9fX3N5bWJvbHNfXy91YXJ0N19pZGxlX3BpbnNfYyA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC91YXJ0Ny1pZGxlLTIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9k
ZnNkbTIgPD09Ci9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDIACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9fX3N5bWJvbHNfXy9ncGlvYyA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9n
cGlvQDUwMDA0MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfYWRjMTJf
dXNiX3B3cl9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtYWRjMTIt
dXNiLXB3ci1waW5zLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF9xc3Bp
X2JrMV9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtcXNwaS1iazEt
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2pveXN0aWNrX3BpbnMgPD09Ci9z
b2MvaTJjQDQwMDEzMDAwL3N0bWZ4QDQyL3BpbmN0cmwvam95c3RpY2stcGlucwAKPT0+IC9wcm9j
L2RldmljZS10cmVlL19fc3ltYm9sc19fL3VhcnQ3X3BpbnNfYiA8PT0KL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC91YXJ0Ny0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18v
bTRfdGltZXJzMTIgPD09Ci9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1l
ckA0MDAwNjAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2kyYzJfc2xlZXBf
cGluc19iMiA8PT0KL3NvYy9waW4tY29udHJvbGxlci16QDU0MDA0MDAwL2kyYzItc2xlZXAtMAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL21fY2FuMl9zbGVlcF9waW5zX2EgPD09
Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbV9jYW4yLXNsZWVwLTAACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy92cmVmYnVmIDw9PQovc29jL3ZyZWZidWZANTAwMjUwMDAA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy90c19jYWwyIDw9PQovc29jL2VmdXNl
QDVjMDA1MDAwL2NhbGliQDVlAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdWFy
dDRfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VhcnQ0LTAACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF90aW1lcnMyIDw9PQovYWhiL200QDEwMDAw
MDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDAwMDAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9fX3N5bWJvbHNfXy9oZHA3X3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9oZHA3LTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9pMnMyX3BpbnNf
YSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMnMyLTAACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9fX3N5bWJvbHNfXy9sdGRjX3NsZWVwX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9sdGRjLXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJv
bHNfXy9zcGk1IDw9PQovc29jL3NwaUA0NDAwOTAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19f
c3ltYm9sc19fL2RtaWMxIDw9PQovZG1pYy0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1i
b2xzX18vY3B1MSA8PT0KL2NwdXMvY3B1QDEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJv
bHNfXy9pMmMyX3BpbnNfYyA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmMyLTIA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF9xc3BpIDw9PQovYWhiL200QDEw
MDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvcXNwaUA1ODAwMzAwMAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL19fc3ltYm9sc19fL2RhY19jaDFfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL2RhYy1jaDEtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200
X3NhaTJiX3BpbnNfYiA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1zYWkyYi0y
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfaTJjNV9waW5zX2EgPD09Ci9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtaTJjNS0wAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvX19zeW1ib2xzX18vdXNhcnQzX3BpbnNfYiA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC91c2FydDMtMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2RjbWlfMCA8
PT0KL3NvYy9kY21pQDRjMDA2MDAwL3BvcnQvZW5kcG9pbnQACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9fX3N5bWJvbHNfXy9wd200X3NsZWVwX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9wd200LXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9t
Y3VfcnNjX3RhYmxlIDw9PQovcmVzZXJ2ZWQtbWVtb3J5L21jdV9yc2NfdGFibGVAMTAwNDgwMDAA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9pMmM0IDw9PQovc29jL2kyY0A1YzAw
MjAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3N0dXNiMTYwMF9waW5zX2Eg
PD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc3R1c2IxNjAwLTAACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9kbWljMF9lbmRwb2ludCA8PT0KL2RtaWMtMC9wb3J0L2Vu
ZHBvaW50AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdXNib3RnX2hzIDw9PQov
c29jL3VzYi1vdGdANDkwMDAwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy91
c2FydDNfaWRsZV9waW5zX2MgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQz
LWlkbGUtMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3JlZzExIDw9PQovc29j
L3B3ckA1MDAwMTAwMC9yZWcxMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2Fk
YzIgPD09Ci9zb2MvYWRjQDQ4MDAzMDAwL2FkY0AxMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9f
X3N5bWJvbHNfXy90aW1lcnM0IDw9PQovc29jL3RpbWVyQDQwMDAyMDAwAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvX19zeW1ib2xzX18vZm1jX3NsZWVwX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9mbWMtc2xlZXAtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9s
c19fL3ZidXNfb3RnIDw9PQovc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9w
d3Jfc3cxAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vd204OTk0X3J4X2VuZHBv
aW50IDw9PQovc29jL2kyY0A0MDAxMzAwMC93bTg5OTRAMWIvcG9ydHMvcG9ydEAxL2VuZHBvaW50
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfdXNhcnQyIDw9PQovYWhiL200
QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2VyaWFsQDQwMDBlMDAwAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vZHNpX291dCA8PT0KL3NvYy9kc2lANWEwMDAwMDAvcG9y
dHMvcG9ydEAxL2VuZHBvaW50AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdGlt
ZXJzMTUgPD09Ci9zb2MvdGltZXJANDQwMDYwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5
bWJvbHNfXy9zcGRpZnJ4X3BvcnQgPD09Ci9zb2MvYXVkaW8tY29udHJvbGxlckA0MDAwZDAwMC9w
b3J0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfdWFydDQgPD09Ci9haGIv
bTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zZXJpYWxANDAwMTAwMDAACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy92MnY4IDw9PQovc29jL2kyY0A1YzAwMjAwMC9zdHBt
aWNAMzMvcmVndWxhdG9ycy9sZG8yAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18v
bTRfbHB0aW1lcjMgPD09Ci9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1l
ckA1MDAyMjAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2hkcCA8PT0KL3Nv
Yy9oZHBANTAwMmEwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy92ZGRhIDw9
PQovc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9sZG8xAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vc2FpNGFfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3NhaTRhLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9k
ZnNkbTAgPD09Ci9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9fX3N5bWJvbHNfXy9ncGlvYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9n
cGlvQDUwMDAyMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vc2RtbWMxX2I0
X3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzEtYjQtMAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X3Jwcm9jIDw9PQovYWhiL200QDEwMDAw
MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vaGRwMF9waW5zX2EgPD09Ci9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaGRwMC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
X19zeW1ib2xzX18vcHdyX21jdSA8PT0KL3NvYy9wd3JfbWN1QDUwMDAxMDE0AAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vZGFjIDw9PQovc29jL2RhY0A0MDAxNzAwMAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2Fzb2NfcGRtMyA8PT0KL3NvYy9kZnNkbUA0NDAw
ZDAwMC9maWx0ZXJAMy9kZnNkbS1kYWkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNf
Xy9pMnMyX3NsZWVwX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMnMy
LXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9pMmMyX3NsZWVwX3Bp
bnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmMyLXNsZWVwLTAACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF91c2JvdGdfaHMgPD09Ci9haGIvbTRAMTAw
MDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy91c2Itb3RnQDQ5MDAwMDAwAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvX19zeW1ib2xzX18vZmxhc2gwIDw9PQovc29jL3NwaUA1ODAwMzAwMC9teDY2bDUx
MjM1bEAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vaTJjMl9waW5zX3NsZWVw
X2MgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaTJjMi1zbGVlcC0yAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vaTJjNV9waW5zX2IgPD09Ci9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvaTJjNS0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18v
dWFydDhfcnRzY3RzX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0
OHJ0c2N0cy0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vY3B1X3RoZXJtYWwg
PD09Ci90aGVybWFsLXpvbmVzL2NwdS10aGVybWFsAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19z
eW1ib2xzX18vc3BpMyA8PT0KL3NvYy9zcGlANDAwMGMwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9fX3N5bWJvbHNfXy92ZGV2MHZyaW5nMSA8PT0KL3Jlc2VydmVkLW1lbW9yeS92ZGV2MHZyaW5n
MUAxMDA0MTAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NwaTVfc2xlZXBf
cGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NwaTUtc2xlZXAtMAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3B3bTRfcGluc19hIDw9PQovc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL3B3bTQtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9s
c19fL2V4dGlfcHdyIDw9PQovc29jL2ludGVycnVwdC1jb250cm9sbGVyQDUwMDBkMDAwL2V4dGkt
cHdyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vaTJjMl9waW5zX2EgPD09Ci9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaTJjMi0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
X19zeW1ib2xzX18vZGZzZG1fZGF0YTFfc2xlZXBfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL2Rmc2RtLWRhdGExLXNsZWVwLXBpbnMtMAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL19fc3ltYm9sc19fL3FzcGlfYmsxX3NsZWVwX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9xc3BpLWJrMS1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19z
eW1ib2xzX18vb3Y1NjQwXzAgPD09Ci9zb2MvaTJjQDQwMDEzMDAwL2NhbWVyYUAzYy9wb3J0L2Vu
ZHBvaW50AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdmRkX3NkIDw9PQovc29j
L2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9sZG81AAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvX19zeW1ib2xzX18vZGNtaV9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvZGNtaS0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vZXRoZXJuZXQw
X3JtaWlfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3JtaWktMAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2V0aGVybmV0MF9yZ21paV9zbGVlcF9waW5z
X2IgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktc2xlZXAtMQAKPT0+IC9w
cm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X3NwaTVfcGluc19hIDw9PQovc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL200LXNwaTUtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3lt
Ym9sc19fL2Rmc2RtX2Nsa291dF9zbGVlcF9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvZGZzZG0tY2xrb3V0LXNsZWVwLXBpbnMtMAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L19fc3ltYm9sc19fL2kyczIgPD09Ci9zb2MvYXVkaW8tY29udHJvbGxlckA0MDAwYjAwMAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NkbW1jMl9kNDdfcGluc19jIDw9PQovc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1kNDctMgAKPT0+IC9wcm9jL2RldmljZS10
cmVlL19fc3ltYm9sc19fL2RjbWkgPD09Ci9zb2MvZGNtaUA0YzAwNjAwMAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL19fc3ltYm9sc19fL2kyYzIgPD09Ci9zb2MvaTJjQDQwMDEzMDAwAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vc3JhbSA8PT0KL3NvYy9zcmFtQDEwMDAwMDAwAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vZ3Bpb2ogPD09Ci9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwYjAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3lt
Ym9sc19fL21jdXJhbTIgPD09Ci9yZXNlcnZlZC1tZW1vcnkvbWN1cmFtMkAxMDAwMDAwMAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3BtaWMgPD09Ci9zb2MvaTJjQDVjMDAyMDAw
L3N0cG1pY0AzMwAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X3JuZzIgPD09
Ci9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9ybmdANGMwMDMwMDAACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9mbWMgPD09Ci9zb2MvbWVtb3J5LWNvbnRyb2xs
ZXJANTgwMDIwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF9zYWkzIDw9
PQovYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2FpQDQ0MDBjMDAwAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vYWRjMTJfdXNiX2NjX3BpbnNfYSA8PT0KL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9hZGMxMi11c2ItY2MtcGlucy0wAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdGltZXJzMiA8PT0KL3NvYy90aW1lckA0MDAwMDAwMAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2hkcDZfcGluc19hIDw9PQovc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL2hkcDYtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3lt
Ym9sc19fL2kyYzVfc2xlZXBfcGluc19iIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L2kyYzUtc2xlZXAtMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3RpbWVyczEz
IDw9PQovc29jL3RpbWVyQDQwMDA3MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xz
X18vc2RtbWMzX2I0X29kX3BpbnNfYiA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9z
ZG1tYzMtYjQtb2QtMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X2xwdGlt
ZXIxIDw9PQovYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDkw
MDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy92aW4gPD09Ci92aW4ACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy91c2FydDIgPD09Ci9zb2Mvc2VyaWFsQDQwMDBl
MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdXNiMzMgPD09Ci9zb2MvcHdy
QDUwMDAxMDAwL3VzYjMzAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vaTJjMl9w
aW5zX2IyIDw9PQovc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQwMDAvaTJjMi0wAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdnJlZl9kZHIgPD09Ci9zb2MvaTJjQDVjMDAyMDAw
L3N0cG1pY0AzMy9yZWd1bGF0b3JzL3ZyZWZfZGRyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19z
eW1ib2xzX18vc2FpMmFfc2xlZXBfcGluc19iIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL3NhaTJhLXNsZWVwLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy91c2Fy
dDNfc2xlZXBfcGluc19iIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0My1z
bGVlcC0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdXNiaF9vaGNpIDw9PQov
c29jL3VzYkA1ODAwYzAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NjbWlf
c3JhbSA8PT0KL3NyYW1AMmZmZmYwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNf
Xy9hc29jX3BkbTEgPD09Ci9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDEvZGZzZG0tZGFpAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vc2FpNGFfZW5kcG9pbnQgPD09Ci9zb2Mv
c2FpQDUwMDI3MDAwL2F1ZGlvLWNvbnRyb2xsZXJANTAwMjcwMDQvcG9ydC9lbmRwb2ludAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X2kyYzRfcGluc19hIDw9PQovc29jL3Bp
bi1jb250cm9sbGVyLXpANTQwMDQwMDAvbTQtaTJjNC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
X19zeW1ib2xzX18vZGZzZG0zX3BvcnQgPD09Ci9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDMv
ZGZzZG0tZGFpL3BvcnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy91c2FydDJf
cGluc19iIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0Mi0xAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfZG1hMSA8PT0KL2FoYi9tNEAxMDAwMDAwMC9t
NF9zeXN0ZW1fcmVzb3VyY2VzL2RtYUA0ODAwMDAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19f
c3ltYm9sc19fL3NwaTEgPD09Ci9zb2Mvc3BpQDQ0MDA0MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvX19zeW1ib2xzX18vc2FpNGFfc2xlZXBfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3NhaTRhLXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNf
Xy9kc2lfaW4gPD09Ci9zb2MvZHNpQDVhMDAwMDAwL3BvcnRzL3BvcnRAMC9lbmRwb2ludAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3ZkZXYwYnVmZmVyIDw9PQovcmVzZXJ2ZWQt
bWVtb3J5L3ZkZXYwYnVmZmVyQDEwMDQyMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1i
b2xzX18vd204OTk0X3J4X3BvcnQgPD09Ci9zb2MvaTJjQDQwMDEzMDAwL3dtODk5NEAxYi9wb3J0
cy9wb3J0QDEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9zcGkyX3BpbnNfYSA8
PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zcGkyLTAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9fX3N5bWJvbHNfXy9tNF9jcmMyIDw9PQovYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9y
ZXNvdXJjZXMvY3JjQDRjMDA0MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18v
cmV0cmFtIDw9PQovcmVzZXJ2ZWQtbWVtb3J5L3JldHJhbUAzODAwMDAwMAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL19fc3ltYm9sc19fL3NkbW1jMl9iNF9zbGVlcF9waW5zX2EgPD09Ci9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWI0LXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9fX3N5bWJvbHNfXy9tNF9zcGRpZnJ4IDw9PQovYWhiL200QDEwMDAwMDAwL200X3N5c3Rl
bV9yZXNvdXJjZXMvYXVkaW8tY29udHJvbGxlckA0MDAwZDAwMAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL19fc3ltYm9sc19fL2ZtY19waW5zX2IgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvZm1jLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9yZWcxOCA8PT0KL3Nv
Yy9wd3JANTAwMDEwMDAvcmVnMTgACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9z
YWkyYl9waW5zX2MgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpMmItMgAKPT0+
IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3VzYm90Z19oc19waW5zX2EgPD09Ci9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNib3RnLWhzLTAACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9fX3N5bWJvbHNfXy9zZG1tYzJfZDQ3X3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9zZG1tYzItZDQ3LTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9i
c3Rfb3V0IDw9PQovc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9ib29zdAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2dwaW9oIDw9PQovc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDkwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5
bWJvbHNfXy9tX2NhbjFfc2xlZXBfcGluc19iIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL21fY2FuMS1zbGVlcC0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vc2Rt
bWMyIDw9PQovc29jL21tY0A1ODAwNzAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9s
c19fL3B3bTVfc2xlZXBfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3
bTUtc2xlZXAtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2xwdGltZXI0IDw9
PQovc29jL3RpbWVyQDUwMDIzMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18v
bWRtYTEgPD09Ci9zb2MvZG1hLWNvbnRyb2xsZXJANTgwMDAwMDAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9fX3N5bWJvbHNfXy9tNF9zZG1tYzNfYjRfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL200LXNkbW1jMy1iNC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1i
b2xzX18vbTRfdGltZXJzMTcgPD09Ci9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNl
cy90aW1lckA0NDAwODAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X3Nh
aTEgPD09Ci9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zYWlANDQwMGEwMDAA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9qYWlsaG91c2UgPD09Ci9yZXNlcnZl
ZC1tZW1vcnkvamFpbGhvdXNlQGY3MDAwMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1i
b2xzX18vdWFydDcgPD09Ci9zb2Mvc2VyaWFsQDQwMDE4MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvX19zeW1ib2xzX18vbTRfZm1jX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9tNC1mbWMtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X3RpbWVy
czcgPD09Ci9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0MDAwNTAw
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X3VhcnQ0X3BpbnNfYSA8PT0K
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC11YXJ0NC0wAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvX19zeW1ib2xzX18vYnNlYyA8PT0KL3NvYy9lZnVzZUA1YzAwNTAwMAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL19fc3ltYm9sc19fL3B3bTNfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3B3bTMtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2V0
aGVybmV0MF9yZ21paV9waW5zX2IgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdt
aWktMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2kyYzFfcGluc19hIDw9PQov
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzEtMAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L19fc3ltYm9sc19fL2NwdTBfb3BwX3RhYmxlIDw9PQovY3B1MC1vcHAtdGFibGUACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9kY21pX3NsZWVwX3BpbnNfYSA8PT0KL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9kY21pLXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9f
X3N5bWJvbHNfXy9jZWMgPD09Ci9zb2MvY2VjQDQwMDE2MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvX19zeW1ib2xzX18vZGZzZG1fZW5kcG9pbnQyIDw9PQovc29jL2Rmc2RtQDQ0MDBkMDAwL2Zp
bHRlckAyL2Rmc2RtLWRhaS9wb3J0L2VuZHBvaW50AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19z
eW1ib2xzX18vbTRfc3BpNF9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
bTQtc3BpNC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfbV9jYW4yIDw9
PQovYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvY2FuQDQ0MDBmMDAwAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfcXNwaV9jbGtfcGluc19hIDw9PQovc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXFzcGktY2xrLTAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9fX3N5bWJvbHNfXy9wd20zX3NsZWVwX3BpbnNfYiA8PT0KL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9wd20zLXNsZWVwLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNf
Xy9zZG1tYzNfYjRfcGluc19iIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1j
My1iNC0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfc3BpNSA8PT0KL2Fo
Yi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NwaUA0NDAwOTAwMAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL19fc3ltYm9sc19fL3NwaTFfc2xlZXBfcGluc19hIDw9PQovc29jL3Bpbi1j
b250cm9sbGVyLXpANTQwMDQwMDAvc3BpMS1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
X19zeW1ib2xzX18vbV9jYW4yX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9tLWNhbjItMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3VhcnQ0X3NsZWVw
X3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0NC1zbGVlcC0wAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vZXRoZXJuZXRfbWFjX2FkZHJlc3MgPD09
Ci9zb2MvZWZ1c2VANWMwMDUwMDAvbWFjQGU0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1i
b2xzX18vc2RtbWMxX2I0X29kX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9zZG1tYzEtYjQtb2QtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NkbW1j
MV9kaXJfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1kaXIt
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NhaTQgPD09Ci9zb2Mvc2FpQDUw
MDI3MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vcXNwaV9iazJfc2xlZXBf
cGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3FzcGktYmsyLXNsZWVwLTAA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF9zZG1tYzJfYjRfcGluc19iIDw9
PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXNkbW1jMi1iNC0xAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vc2FpMmJfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3NhaTJiLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9z
cGRpZl9vdXQgPD09Ci9zcGRpZi1vdXQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNf
Xy9zZG1tYzFfZGlyX3NsZWVwX3BpbnNfYiA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9zZG1tYzEtZGlyLXNsZWVwLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9k
ZnNkbTUgPD09Ci9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDUACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9fX3N5bWJvbHNfXy9ncGlvZiA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9n
cGlvQDUwMDA3MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbWxhaGIgPD09
Ci9haGIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF9zYWk0YV9waW5zX2Eg
PD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc2FpNGEtMAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL19fc3ltYm9sc19fL3FzcGlfYmsyX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9xc3BpLWJrMi0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xz
X18vY2VjX3NsZWVwX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9jZWMt
c2xlZXAtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3VzYnBoeWNfcG9ydDAg
PD09Ci9zb2MvdXNicGh5Y0A1YTAwNjAwMC91c2ItcGh5QDAACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9fX3N5bWJvbHNfXy9tNF9wd201X3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9tNC1wd201LTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9scHRpbWVy
MiA8PT0KL3NvYy90aW1lckA1MDAyMTAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9s
c19fL2Rmc2RtMl9wb3J0IDw9PQovc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAyL2Rmc2RtLWRh
aS9wb3J0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfdGltZXJzMTUgPD09
Ci9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0NDAwNjAwMAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2kyYzFfc2xlZXBfcGluc19iIDw9PQovc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzEtc2xlZXAtMQAKPT0+IC9wcm9jL2RldmljZS10
cmVlL19fc3ltYm9sc19fL3NvdW5kIDw9PQovc291bmQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9f
X3N5bWJvbHNfXy9waW5jdHJsX3ogPD09Ci9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NhaTRiIDw9PQovc29jL3NhaUA1MDAy
NzAwMC9hdWRpby1jb250cm9sbGVyQDUwMDI3MDI0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19z
eW1ib2xzX18vbTRfbV9jYW4xX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9tNC1tLWNhbjEtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3VhcnQ1IDw9
PQovc29jL3NlcmlhbEA0MDAxMTAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19f
L3NwaTRfcGluc19iIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NwaTQtMQAKPT0+
IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X2x0ZGNfcGluc19iIDw9PQovc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL200LWx0ZGMtYi0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
X19zeW1ib2xzX18vcXNwaV9jbGtfc2xlZXBfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3FzcGktY2xrLXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJv
bHNfXy9zZG1tYzNfYjRfc2xlZXBfcGluc19iIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL3NkbW1jMy1iNC1zbGVlcC0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18v
bTRfdGltZXJzNSA8PT0KL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVy
QDQwMDAzMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vZG1pYzFfZW5kcG9p
bnQgPD09Ci9kbWljLTEvcG9ydC9lbmRwb2ludAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3lt
Ym9sc19fL3B3cl9yZWd1bGF0b3JzIDw9PQovc29jL3B3ckA1MDAwMTAwMAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL19fc3ltYm9sc19fL3NwaTRfc2xlZXBfcGluc19iIDw9PQovc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL3NwaTQtc2xlZXAtMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3lt
Ym9sc19fL3ZyZWZpbnQgPD09Ci9zb2MvZWZ1c2VANWMwMDUwMDAvY2FsaWJANTIACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9kbWEyIDw9PQovc29jL2RtYS1jb250cm9sbGVyQDQ4
MDAxMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbHRkY19zbGVlcF9waW5z
X2QgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbHRkYy1zbGVlcC0zAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdmRkY29yZSA8PT0KL3NvYy9pMmNANWMwMDIwMDAv
c3RwbWljQDMzL3JlZ3VsYXRvcnMvYnVjazEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJv
bHNfXy9zcGkxX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlci16QDU0MDA0MDAwL3NwaTEt
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NhaTNiIDw9PQovc29jL3NhaUA0
NDAwYzAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBjMDI0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
X19zeW1ib2xzX18vbTRfaGFzaDIgPD09Ci9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291
cmNlcy9oYXNoQDRjMDAyMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdjF2
OCA8PT0KL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRvcnMvbGRvNgAKPT0+IC9w
cm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NwZGlmcnggPD09Ci9zb2MvYXVkaW8tY29udHJv
bGxlckA0MDAwZDAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2Jvb3N0ZXIg
PD09Ci9yZWd1bGF0b3ItYm9vc3RlcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19f
L3NhaTJhX3BpbnNfYyA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWkyYS0yAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdWFydDhfcGluc19hIDw9PQovc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3VhcnQ4LTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5
bWJvbHNfXy9kZnNkbV9lbmRwb2ludDAgPD09Ci9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDAv
ZGZzZG0tZGFpL3BvcnQvZW5kcG9pbnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNf
Xy9zYWkyYl9zbGVlcF9waW5zX2IgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2Fp
MmItc2xlZXAtMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X2NlY19waW5z
X2IgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtY2VjLTEACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9kbWFfcG9vbCA8PT0KL3NvYy9zcmFtQDEwMDAwMDAwL2Rt
YV9wb29sQDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9zZG1tYzFfZGlyX2lu
aXRfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1kaXItaW5p
dC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfaGRwN19waW5zX2EgPD09
Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtaGRwNy0wAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvX19zeW1ib2xzX18vbTRfc3BpMyA8PT0KL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1f
cmVzb3VyY2VzL3NwaUA0MDAwYzAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19f
L200X2kyczJfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LWkyczIt
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NkbW1jMl9kNDdfc2xlZXBfcGlu
c19jIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1kNDctc2xlZXAtMgAK
PT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL21fY2FuMiA8PT0KL3NvYy9jYW5ANDQw
MGYwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9waHkwIDw9PQovc29jL2V0
aGVybmV0QDU4MDBhMDAwL21kaW8wL2V0aGVybmV0LXBoeUAwAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvX19zeW1ib2xzX18vYWRjMTJfYWluX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9hZGMxMi1haW4tMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3Nh
aTJiIDw9PQovc29jL3NhaUA0NDAwYjAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBiMDI0AAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vcHdtNV9waW5zX2IgPD09Ci9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvcHdtNS0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xz
X18vcm5nMSA8PT0KL3NvYy9ybmdANTQwMDMwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5
bWJvbHNfXy9zcGRpZnJ4X2VuZHBvaW50IDw9PQovc29jL2F1ZGlvLWNvbnRyb2xsZXJANDAwMGQw
MDAvcG9ydC9lbmRwb2ludAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NhaTIg
PD09Ci9zb2Mvc2FpQDQ0MDBiMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18v
bTRfYWRjMV9pbjZfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LWFk
YzEtaW42AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdGltZXJzNyA8PT0KL3Nv
Yy90aW1lckA0MDAwNTAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3B3bTJf
cGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTItMAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL19fc3ltYm9sc19fL2x0ZGNfcGluc19jIDw9PQovc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL2x0ZGMtMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200
X2NyeXAyIDw9PQovYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvY3J5cEA0YzAw
NTAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X2kyczIgPD09Ci9haGIv
bTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9hdWRpby1jb250cm9sbGVyQDQwMDBiMDAw
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vc2FpMmFfZW5kcG9pbnQgPD09Ci9z
b2Mvc2FpQDQ0MDBiMDAwL2F1ZGlvLWNvbnRyb2xsZXJANDQwMGIwMDQvcG9ydC9lbmRwb2ludAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X2RjbWkgPD09Ci9haGIvbTRAMTAw
MDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9kY21pQDRjMDA2MDAwAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvX19zeW1ib2xzX18vbTRfdWFydDcgPD09Ci9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVt
X3Jlc291cmNlcy9zZXJpYWxANDAwMTgwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJv
bHNfXy9zY21pX3Jlc2V0IDw9PQovZmlybXdhcmUvc2NtaS9wcm90b2NvbEAxNgAKPT0+IC9wcm9j
L2RldmljZS10cmVlL19fc3ltYm9sc19fL200X2kyYzIgPD09Ci9haGIvbTRAMTAwMDAwMDAvbTRf
c3lzdGVtX3Jlc291cmNlcy9pMmNANDAwMTMwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5
bWJvbHNfXy9zYWkxYiA8PT0KL3NvYy9zYWlANDQwMGEwMDAvYXVkaW8tY29udHJvbGxlckA0NDAw
YTAyNAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3VzYXJ0Ml9zbGVlcF9waW5z
X2MgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQyLXNsZWVwLTIACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9kZnNkbTMgPD09Ci9zb2MvZGZzZG1ANDQwMGQw
MDAvZmlsdGVyQDMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9ncGlvZCA8PT0K
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDA1MDAwAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvX19zeW1ib2xzX18vcHdtMV9zbGVlcF9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvcHdtMS1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1i
b2xzX18vdWFydDdfcGluc19jIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VhcnQ3
LTIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF90aW1lcnMxMyA8PT0KL2Fo
Yi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQwMDA3MDAwAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vY2VjX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9jZWMtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3Nh
aTRhX3BvcnQgPD09Ci9zb2Mvc2FpQDUwMDI3MDAwL2F1ZGlvLWNvbnRyb2xsZXJANTAwMjcwMDQv
cG9ydAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3VhcnQ0X3BpbnNfYiA8PT0K
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0NC0xAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvX19zeW1ib2xzX18vbHRkY19lcDBfb3V0IDw9PQovc29jL2Rpc3BsYXktY29udHJvbGxlckA1
YTAwMTAwMC9wb3J0L2VuZHBvaW50QDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNf
Xy9tX2NhbjFfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL20tY2FuMS0w
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfdGltZXJzMyA8PT0KL2FoYi9t
NEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQwMDAxMDAwAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfc3R1c2IxNjAwX3BpbnNfYSA8PT0KL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9tNC1zdHVzYjE2MDAtMAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L19fc3ltYm9sc19fL2Rmc2RtIDw9PQovc29jL2Rmc2RtQDQ0MDBkMDAwAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvX19zeW1ib2xzX18vbHRkY19zbGVlcF9waW5zX2IgPD09Ci9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvbHRkYy1zbGVlcC0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1i
b2xzX18vZXh0aSA8PT0KL3NvYy9pbnRlcnJ1cHQtY29udHJvbGxlckA1MDAwZDAwMAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3NwaTYgPD09Ci9zb2Mvc3BpQDVjMDAxMDAwAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vc2RtbWMyX2I0X3BpbnNfYSA8PT0KL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItYjQtMAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL19fc3ltYm9sc19fL200X3NwZGlmcnhfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL200LXNwZGlmcngtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19f
L3BhcnRfbnVtYmVyX290cCA8PT0KL3NvYy9lZnVzZUA1YzAwNTAwMC9wYXJ0X251bWJlcl9vdHBA
NAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2Rmc2RtX2RhdGEzX3BpbnNfYSA8
PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9kZnNkbS1kYXRhMy1waW5zLTAACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9kbWljMiA8PT0KL2RtaWMtMgAKPT0+IC9wcm9j
L2RldmljZS10cmVlL19fc3ltYm9sc19fL2hkcDBfcGluc19zbGVlcF9hIDw9PQovc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL2hkcDAtc2xlZXAtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19f
c3ltYm9sc19fL2NyYzEgPD09Ci9zb2MvY3JjQDU4MDA5MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvX19zeW1ib2xzX18vbTRfaGRwMF9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvbTQtaGRwMC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vc2FpMmFf
cGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NhaTJhLTAACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy91YXJ0NF9pZGxlX3BpbnNfYSA8PT0KL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC91YXJ0NC1pZGxlLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9f
X3N5bWJvbHNfXy9zY21pX3NobSA8PT0KL3NyYW1AMmZmZmYwMDAvc2NtaV9zaG1AMAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X3NkbW1jMV9iNF9waW5zX2EgPD09Ci9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc2RtbWMxLWI0LTAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9fX3N5bWJvbHNfXy9tNF91c2FydDNfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL200LXVzYXJ0My0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18v
bTRfc3BpMSA8PT0KL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NwaUA0NDAw
NDAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X2FkYyA8PT0KL2FoYi9t
NEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2FkY0A0ODAwMzAwMAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL19fc3ltYm9sc19fL3NkbW1jMl9kNDdfc2xlZXBfcGluc19hIDw9PQovc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1kNDctc2xlZXAtMAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL19fc3ltYm9sc19fL3B3bThfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3B3bTgtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3VzYXJ0M19w
aW5zX2MgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQzLTIACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9xc3BpX2JrMV9waW5zX2EgPD09Ci9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvcXNwaS1iazEtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3lt
Ym9sc19fL2Rmc2RtMV9wb3J0IDw9PQovc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAxL2Rmc2Rt
LWRhaS9wb3J0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vaTJjNl9waW5zX2Eg
PD09Ci9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9pMmM2LTAACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9fX3N5bWJvbHNfXy9wd200X3NsZWVwX3BpbnNfYiA8PT0KL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9wd200LXNsZWVwLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJv
bHNfXy9pMmM1IDw9PQovc29jL2kyY0A0MDAxNTAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19f
c3ltYm9sc19fL200X3B3bTRfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L200LXB3bTQtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2l3ZGcyIDw9PQov
c29jL3dhdGNoZG9nQDVhMDAyMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18v
ZGFjMSA8PT0KL3NvYy9kYWNANDAwMTcwMDAvZGFjQDEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9f
X3N5bWJvbHNfXy9tNF9pMmMyX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9tNC1pMmMyLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9pMmM0X3NsZWVw
X3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlci16QDU0MDA0MDAwL2kyYzQtc2xlZXAtMAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3Z0dF9kZHIgPD09Ci9zb2MvaTJjQDVj
MDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2xkbzMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9f
X3N5bWJvbHNfXy9tNF9kY21pX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9tNC1kY21pLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy92M3YzIDw9PQov
c29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9idWNrNAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL19fc3ltYm9sc19fL3NkbW1jMl9iNF9vZF9waW5zX2EgPD09Ci9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWI0LW9kLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9f
X3N5bWJvbHNfXy9zeXNjZmcgPD09Ci9zb2Mvc3lzY29uQDUwMDIwMDAwAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvX19zeW1ib2xzX18vdGltZXJzNSA8PT0KL3NvYy90aW1lckA0MDAwMzAwMAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2ZtY19zbGVlcF9waW5zX2IgPD09Ci9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZm1jLXNsZWVwLTEACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9fX3N5bWJvbHNfXy9sdGRjX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9sdGRjLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF9kbWFtdXgxIDw9
PQovYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvZG1hLXJvdXRlckA0ODAwMjAw
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X3VzYXJ0MyA8PT0KL2FoYi9t
NEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0MDAwZjAwMAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL19fc3ltYm9sc19fL3B3cl9pcnEgPD09Ci9zb2MvcHdyQDUwMDAxMDIwAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vdGltZXJzMTYgPD09Ci9zb2MvdGltZXJA
NDQwMDcwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9kZnNkbV9kYXRhM19z
bGVlcF9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZGZzZG0tZGF0YTMt
c2xlZXAtcGlucy0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfdWFydDUg
PD09Ci9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zZXJpYWxANDAwMTEwMDAA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF9scHRpbWVyNCA8PT0KL2FoYi9t
NEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDUwMDIzMDAwAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vc2RtbWMxX2I0X3NsZWVwX3BpbnNfYSA8PT0KL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzEtYjQtc2xlZXAtMAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL19fc3ltYm9sc19fL3VzYXJ0Ml9zbGVlcF9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvdXNhcnQyLXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5
bWJvbHNfXy9kZnNkbTEgPD09Ci9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDEACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9zY21pX2NsayA8PT0KL2Zpcm13YXJlL3NjbWkvcHJv
dG9jb2xAMTQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9ncGlvYiA8PT0KL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDAzMDAwAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvX19zeW1ib2xzX18vdWFydDdfcGluc19hIDw9PQovc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3VhcnQ3LTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9uYW1lIDw9
PQpfX3N5bWJvbHNfXwAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2kyYzJfc2xl
ZXBfcGluc19iMSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmMyLXNsZWVwLTEA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9zZG1tYzFfYjRfaW5pdF9waW5zX2Eg
PD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMxLWI0LWluaXQtMAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3J0YyA8PT0KL3NvYy9ydGNANWMwMDQwMDAACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy90c19jYWwxIDw9PQovc29jL2VmdXNlQDVj
MDA1MDAwL2NhbGliQDVjAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vbTRfaGRw
Nl9waW5zX2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtaGRwNi0wAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vcGluY3RybCA8PT0KL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL200X3RpbWVy
czEgPD09Ci9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0NDAwMDAw
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL2ZsYXNoMSA8PT0KL3NvYy9zcGlA
NTgwMDMwMDAvbXg2Nmw1MTIzNWxAMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19f
L3NwaTQgPD09Ci9zb2Mvc3BpQDQ0MDA1MDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1i
b2xzX18vcHdtNF9waW5zX2IgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdtNC0x
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vZG1pYzAgPD09Ci9kbWljLTAACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9jcHUwIDw9PQovY3B1cy9jcHVAMAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL19fc3ltYm9sc19fL3ZkZF9kZHIgPD09Ci9zb2MvaTJjQDVjMDAy
MDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2J1Y2syAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19z
eW1ib2xzX18vZGNtaV9waW5zX2IgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZGNt
aS0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1ib2xzX18vcHdtMV9waW5zX2EgPD09Ci9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdtMS0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
X19zeW1ib2xzX18vcnRjX291dDJfcm1wX3BpbnNfYSA8PT0KL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9ydGMtb3V0Mi1ybXAtcGlucy0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvX19zeW1i
b2xzX18vcmNjIDw9PQovc29jL3JjY0A1MDAwMDAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL19f
c3ltYm9sc19fL3ZkZF91c2IgPD09Ci9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0
b3JzL2xkbzQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9fX3N5bWJvbHNfXy9tNF9zYWkyYl9waW5z
X2EgPD09Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc2FpMmItMAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL19fc3ltYm9sc19fL2V0aGVybmV0MF9yZ21paV9zbGVlcF9waW5zX2MgPD09
Ci9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktc2xlZXAtMgAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL19fc3ltYm9sc19fL3VzYmhfZWhjaSA8PT0KL3NvYy91c2JANTgwMGQwMDAACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDEwMDAvcHdtL2NvbXBhdGlibGUgPD09
CnN0LHN0bTMyLXB3bQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwMTAwMC9w
d20vc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0
MDAwMTAwMC9wd20vI3B3bS1jZWxscyA8PT0KAAAAAwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3RpbWVyQDQwMDAxMDAwL3B3bS9uYW1lIDw9PQpwd20ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvdGltZXJANDAwMDEwMDAvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzItdGltZXJzAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAxMDAwL2Nsb2NrcyA8PT0KAAAADAAAAMYKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwMTAwMC9jbG9jay1uYW1lcyA8PT0KaW50
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAxMDAwL3N0YXR1cyA8PT0KZGlz
YWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDEwMDAvI2FkZHJlc3Mt
Y2VsbHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwMTAwMC8j
c2l6ZS1jZWxscyA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAx
MDAwL2RtYS1uYW1lcyA8PT0KY2gxAGNoMgBjaDMAY2g0AHVwAHRyaWcACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvdGltZXJANDAwMDEwMDAvcGhhbmRsZSA8PT0KAAAAuwo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAxMDAwL3RpbWVyQDIvY29tcGF0aWJsZSA8PT0Kc3Qsc3Rt
MzJoNy10aW1lci10cmlnZ2VyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAx
MDAwL3RpbWVyQDIvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy90aW1lckA0MDAwMTAwMC90aW1lckAyL3JlZyA8PT0KAAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3RpbWVyQDQwMDAxMDAwL3RpbWVyQDIvbmFtZSA8PT0KdGltZXIACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDEwMDAvY291bnRlci9jb21wYXRpYmxlIDw9PQpzdCxz
dG0zMi10aW1lci1jb3VudGVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAx
MDAwL2NvdW50ZXIvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy90aW1lckA0MDAwMTAwMC9jb3VudGVyL25hbWUgPD09CmNvdW50ZXIACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvdGltZXJANDAwMDEwMDAvcmVnIDw9PQpAABAAAAAEAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAxMDAwL2RtYXMgPD09CgAAAA8AAAAXAAAEAIAAAAEAAAAP
AAAAGAAABACAAAABAAAADwAAABkAAAQAgAAAAQAAAA8AAAAaAAAEAIAAAAEAAAAPAAAAGwAABACA
AAABAAAADwAAABwAAAQAgAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAx
MDAwL25hbWUgPD09CnRpbWVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2hkcEA1MDAyYTAw
MC9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMm1wMS1oZHAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvaGRwQDUwMDJhMDAwL2Nsb2NrcyA8PT0KAAAADAAAADcKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9oZHBANTAwMmEwMDAvcGluY3RybC0xIDw9PQoAAABmAAAAZwAAAGgKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9oZHBANTAwMmEwMDAvY2xvY2stbmFtZXMgPD09CmhkcAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9oZHBANTAwMmEwMDAvbXV4aW5nLWhkcCA8PT0K/wAADwo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL2hkcEA1MDAyYTAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL2hkcEA1MDAyYTAwMC9waGFuZGxlIDw9PQoAAAEECj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvaGRwQDUwMDJhMDAwL3JlZyA8PT0KUAKgAAAABAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9oZHBANTAwMmEwMDAvcGluY3RybC0wIDw9PQoAAABjAAAAZAAA
AGUKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9oZHBANTAwMmEwMDAvbmFtZSA8PT0KaGRwAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2hkcEA1MDAyYTAwMC9waW5jdHJsLW5hbWVzIDw9PQpk
ZWZhdWx0AHNsZWVwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDA4MDAwL3B3
bS9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMi1wd20ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
dGltZXJANDQwMDgwMDAvcHdtL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvdGltZXJANDQwMDgwMDAvcHdtLyNwd20tY2VsbHMgPD09CgAAAAMKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwODAwMC9wd20vbmFtZSA8PT0KcHdtAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDA4MDAwL3RpbWVyQDE2L2NvbXBhdGlibGUgPD09
CnN0LHN0bTMyaDctdGltZXItdHJpZ2dlcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1l
ckA0NDAwODAwMC90aW1lckAxNi9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3RpbWVyQDQ0MDA4MDAwL3RpbWVyQDE2L3JlZyA8PT0KAAAAEAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDA4MDAwL3RpbWVyQDE2L25hbWUgPD09CnRpbWVyAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDA4MDAwL2NvbXBhdGlibGUgPD09CnN0
LHN0bTMyLXRpbWVycwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwODAwMC9j
bG9ja3MgPD09CgAAAAwAAADSCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDgw
MDAvY2xvY2stbmFtZXMgPD09CmludAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0
NDAwODAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Rp
bWVyQDQ0MDA4MDAwLyNhZGRyZXNzLWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvdGltZXJANDQwMDgwMDAvI3NpemUtY2VsbHMgPD09CgAAAAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy90aW1lckA0NDAwODAwMC9kbWEtbmFtZXMgPD09CmNoMQB1cAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwODAwMC9waGFuZGxlIDw9PQoAAADlCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDgwMDAvcmVnIDw9PQpEAIAAAAAEAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDA4MDAwL2RtYXMgPD09CgAAAA8AAABvAAAEAIAA
AAEAAAAPAAAAcAAABACAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDgw
MDAvbmFtZSA8PT0KdGltZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjIw
MDAvcHdtL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLXB3bS1scAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy90aW1lckA1MDAyMjAwMC9wd20vc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy90aW1lckA1MDAyMjAwMC9wd20vI3B3bS1jZWxscyA8PT0KAAAAAwo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDUwMDIyMDAwL3B3bS9uYW1lIDw9PQpwd20A
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjIwMDAvcG93ZXItZG9tYWlucyA8
PT0KAAAAEwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDUwMDIyMDAwL2ludGVycnVw
dHMtZXh0ZW5kZWQgPD09CgAAABIAAAAyAAAABAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Rp
bWVyQDUwMDIyMDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLWxwdGltZXIACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjIwMDAvY2xvY2tzIDw9PQoAAAAMAAAAkQo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDUwMDIyMDAwL3dha2V1cC1zb3VyY2UgPD09Cgo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDUwMDIyMDAwL2Nsb2NrLW5hbWVzIDw9PQptdXgA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjIwMDAvdHJpZ2dlckAyL2NvbXBh
dGlibGUgPD09CnN0LHN0bTMyLWxwdGltZXItdHJpZ2dlcgAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy90aW1lckA1MDAyMjAwMC90cmlnZ2VyQDIvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy90aW1lckA1MDAyMjAwMC90cmlnZ2VyQDIvcmVnIDw9PQoAAAAC
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjIwMDAvdHJpZ2dlckAyL25hbWUg
PD09CnRyaWdnZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjIwMDAvc3Rh
dHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA1MDAyMjAw
MC8jYWRkcmVzcy1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVy
QDUwMDIyMDAwLyNzaXplLWNlbGxzIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
dGltZXJANTAwMjIwMDAvcGhhbmRsZSA8PT0KAAAA/Qo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3RpbWVyQDUwMDIyMDAwL3RpbWVyL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLWxwdGltZXItdGlt
ZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjIwMDAvdGltZXIvc3RhdHVz
IDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA1MDAyMjAwMC90
aW1lci9uYW1lIDw9PQp0aW1lcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA1MDAy
MjAwMC9yZWcgPD09ClACIAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAw
MjIwMDAvbmFtZSA8PT0KdGltZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvY2FuQDQ0MDBl
MDAwL2Jvc2NoLG1yYW0tY2ZnIDw9PQoAAAAAAAAAAAAAAAAAAAAgAAAAAAAAAAAAAAACAAAAAgo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2NhbkA0NDAwZTAwMC9jb21wYXRpYmxlIDw9PQpib3Nj
aCxtX2NhbgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9jYW5ANDQwMGUwMDAvY2xvY2tzIDw9
PQoAAAABAAAAAAAAAAwAAACdCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvY2FuQDQ0MDBlMDAw
L3JlZy1uYW1lcyA8PT0KbV9jYW4AbWVzc2FnZV9yYW0ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvY2FuQDQ0MDBlMDAwL3BpbmN0cmwtMSA8PT0KAAAAkgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL2NhbkA0NDAwZTAwMC9jbG9jay1uYW1lcyA8PT0KaGNsawBjY2xrAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL2NhbkA0NDAwZTAwMC9zdGF0dXMgPD09Cm9rYXkACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvY2FuQDQ0MDBlMDAwL2ludGVycnVwdHMgPD09CgAAAAAAAAATAAAABAAAAAAA
AAAVAAAABAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2NhbkA0NDAwZTAwMC9waGFuZGxlIDw9
PQoAAAHNCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvY2FuQDQ0MDBlMDAwL3JlZyA8PT0KRADg
AAAABABEARAAAAAUAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2NhbkA0NDAwZTAwMC9waW5j
dHJsLTAgPD09CgAAAJEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9jYW5ANDQwMGUwMDAvaW50
ZXJydXB0LW5hbWVzIDw9PQppbnQwAGludDEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvY2Fu
QDQ0MDBlMDAwL25hbWUgPD09CmNhbgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9jYW5ANDQw
MGUwMDAvcGluY3RybC1uYW1lcyA8PT0KZGVmYXVsdABzbGVlcAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9wZXJmQDVhMDA3MDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLWRkci1wbXUACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGVyZkA1YTAwNzAwMC9jbG9ja3MgPD09CgAAAAwAAADn
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGVyZkA1YTAwNzAwMC9yZXNldHMgPD09CgAAAAwA
AAwICj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGVyZkA1YTAwNzAwMC9zdGF0dXMgPD09CmRp
c2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3BlcmZANWEwMDcwMDAvcGhhbmRsZSA8
PT0KAAABEgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3BlcmZANWEwMDcwMDAvcmVnIDw9PQpa
AHAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3BlcmZANWEwMDcwMDAvbmFtZSA8PT0K
cGVyZgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy93YXRjaGRvZ0A1YTAwMjAwMC9jb21wYXRp
YmxlIDw9PQpzdCxzdG0zMm1wMS1pd2RnAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3dhdGNo
ZG9nQDVhMDAyMDAwL2Nsb2NrcyA8PT0KAAAADAAAADoAAAABAAAABAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3dhdGNoZG9nQDVhMDAyMDAwL2Nsb2NrLW5hbWVzIDw9PQpwY2xrAGxzaQAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy93YXRjaGRvZ0A1YTAwMjAwMC9zdGF0dXMgPD09Cm9rYXkA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvd2F0Y2hkb2dANWEwMDIwMDAvcGhhbmRsZSA8PT0K
AAABEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3dhdGNoZG9nQDVhMDAyMDAwL3JlZyA8PT0K
WgAgAAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy93YXRjaGRvZ0A1YTAwMjAwMC9uYW1l
IDw9PQp3YXRjaGRvZwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy93YXRjaGRvZ0A1YTAwMjAw
MC90aW1lb3V0LXNlYyA8PT0KAAAAIAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAx
MzAwMC9nb29kaXhfdHNANWQvY29tcGF0aWJsZSA8PT0KZ29vZGl4LGd0OTE0NwAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvZ29vZGl4X3RzQDVkL3N0YXR1cyA8PT0Kb2th
eQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvZ29vZGl4X3RzQDVkL2lu
dGVycnVwdC1wYXJlbnQgPD09CgAAACYKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAw
MTMwMDAvZ29vZGl4X3RzQDVkL2ludGVycnVwdHMgPD09CgAAAA4AAAABCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL2dvb2RpeF90c0A1ZC9waGFuZGxlIDw9PQoAAADUCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL2dvb2RpeF90c0A1ZC9yZWcgPD09
CgAAAF0KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvZ29vZGl4X3RzQDVk
L3BpbmN0cmwtMCA8PT0KAAAAKwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMzAw
MC9nb29kaXhfdHNANWQvcGFuZWwgPD09CgAAACoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9p
MmNANDAwMTMwMDAvZ29vZGl4X3RzQDVkL25hbWUgPD09Cmdvb2RpeF90cwAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvZ29vZGl4X3RzQDVkL3BpbmN0cmwtbmFtZXMgPD09
CmRlZmF1bHQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL3Bvd2VyLWRv
bWFpbnMgPD09CgAAABMKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvaW50
ZXJydXB0cy1leHRlbmRlZCA8PT0KAAAAEgAAABYAAAAEAAAABwAAAAAAAAAiAAAABAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMzAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMm1w
MTUtaTJjAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMzAwMC9jbG9ja3MgPD09
CgAAAAwAAACKCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL3N0LHN5c2Nm
Zy1mbXAgPD09CgAAAAsAAAAEAAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAx
MzAwMC9yZXNldHMgPD09CgAAAAwAAEwWCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQw
MDEzMDAwL3dha2V1cC1zb3VyY2UgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0
MDAxMzAwMC9pMmMtYW5hbG9nLWZpbHRlciA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
aTJjQDQwMDEzMDAwL2NhbWVyYUAzYy9jb21wYXRpYmxlIDw9PQpvdnRpLG92NTY0MAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvY2FtZXJhQDNjL3Bvd2VyZG93bi1ncGlv
cyA8PT0KAAAAJgAAABIAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAw
L2NhbWVyYUAzYy9ET1ZERC1zdXBwbHkgPD09CgAAACUKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9pMmNANDAwMTMwMDAvY2FtZXJhQDNjL2Nsb2NrcyA8PT0KAAAAJAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2kyY0A0MDAxMzAwMC9jYW1lcmFAM2Mvcm90YXRpb24gPD09CgAAALQKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvY2FtZXJhQDNjL3BvcnQvZW5kcG9pbnQv
aHN5bmMtYWN0aXZlIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEz
MDAwL2NhbWVyYUAzYy9wb3J0L2VuZHBvaW50L3ZzeW5jLWFjdGl2ZSA8PT0KAAAAAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMzAwMC9jYW1lcmFAM2MvcG9ydC9lbmRwb2ludC9y
ZW1vdGUtZW5kcG9pbnQgPD09CgAAACcKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAw
MTMwMDAvY2FtZXJhQDNjL3BvcnQvZW5kcG9pbnQvcGNsay1tYXgtZnJlcXVlbmN5IDw9PQoElu1A
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL2NhbWVyYUAzYy9wb3J0L2Vu
ZHBvaW50L2J1cy13aWR0aCA8PT0KAAAACAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0
MDAxMzAwMC9jYW1lcmFAM2MvcG9ydC9lbmRwb2ludC9wY2xrLXNhbXBsZSA8PT0KAAAAAQo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMzAwMC9jYW1lcmFAM2MvcG9ydC9lbmRwb2lu
dC9waGFuZGxlIDw9PQoAAABaCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAw
L2NhbWVyYUAzYy9wb3J0L2VuZHBvaW50L2RhdGEtc2hpZnQgPD09CgAAAAIKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvY2FtZXJhQDNjL3BvcnQvZW5kcG9pbnQvbmFtZSA8
PT0KZW5kcG9pbnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL2NhbWVy
YUAzYy9wb3J0L25hbWUgPD09CnBvcnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQw
MDEzMDAwL2NhbWVyYUAzYy9jbG9jay1uYW1lcyA8PT0KeGNsawAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9pMmNANDAwMTMwMDAvY2FtZXJhQDNjL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvY2FtZXJhQDNjL3Jlc2V0LWdwaW9zIDw9PQoA
AAAmAAAAEwAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvY2FtZXJh
QDNjL3BoYW5kbGUgPD09CgAAANIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMw
MDAvY2FtZXJhQDNjL3JlZyA8PT0KAAAAPAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0
MDAxMzAwMC9jYW1lcmFAM2MvbmFtZSA8PT0KY2FtZXJhAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL2kyY0A0MDAxMzAwMC9waW5jdHJsLTEgPD09CgAAAB4KPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9pMmNANDAwMTMwMDAvc3RtZnhANDIvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtZngtMDMwMAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvc3RtZnhANDIvaW50ZXJydXB0
LXBhcmVudCA8PT0KAAAAKAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMzAwMC9z
dG1meEA0Mi9pbnRlcnJ1cHRzIDw9PQoAAAAIAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2kyY0A0MDAxMzAwMC9zdG1meEA0Mi9waGFuZGxlIDw9PQoAAADTCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvaTJjQDQwMDEzMDAwL3N0bWZ4QDQyL3ZkZC1zdXBwbHkgPD09CgAAACkKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvc3RtZnhANDIvcmVnIDw9PQoAAABCCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL3N0bWZ4QDQyL25hbWUgPD09CnN0
bWZ4AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMzAwMC9zdG1meEA0Mi9waW5j
dHJsL2NvbXBhdGlibGUgPD09CnN0LHN0bWZ4LTAzMDAtcGluY3RybAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvc3RtZnhANDIvcGluY3RybC9nb29kaXgvcGlucyA8PT0K
Z3BpbzE0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMzAwMC9zdG1meEA0Mi9w
aW5jdHJsL2dvb2RpeC9waGFuZGxlIDw9PQoAAAArCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
aTJjQDQwMDEzMDAwL3N0bWZ4QDQyL3BpbmN0cmwvZ29vZGl4L2JpYXMtcHVsbC1kb3duIDw9PQoK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvc3RtZnhANDIvcGluY3RybC9n
b29kaXgvbmFtZSA8PT0KZ29vZGl4AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAx
MzAwMC9zdG1meEA0Mi9waW5jdHJsL2dwaW8tY29udHJvbGxlciA8PT0KCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL3N0bWZ4QDQyL3BpbmN0cmwvZ3Bpby1yYW5nZXMgPD09
CgAAACYAAAAAAAAAAAAAABgKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAv
c3RtZnhANDIvcGluY3RybC9qb3lzdGljay1waW5zL3BpbnMgPD09CmdwaW8wAGdwaW8xAGdwaW8y
AGdwaW8zAGdwaW80AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMzAwMC9zdG1m
eEA0Mi9waW5jdHJsL2pveXN0aWNrLXBpbnMvcGhhbmRsZSA8PT0KAAAApQo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL2kyY0A0MDAxMzAwMC9zdG1meEA0Mi9waW5jdHJsL2pveXN0aWNrLXBpbnMv
Ymlhcy1wdWxsLWRvd24gPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMzAw
MC9zdG1meEA0Mi9waW5jdHJsL2pveXN0aWNrLXBpbnMvbmFtZSA8PT0Kam95c3RpY2stcGlucwAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvc3RtZnhANDIvcGluY3RybC8j
aW50ZXJydXB0LWNlbGxzIDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQw
MDEzMDAwL3N0bWZ4QDQyL3BpbmN0cmwvcGhhbmRsZSA8PT0KAAAAJgo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2kyY0A0MDAxMzAwMC9zdG1meEA0Mi9waW5jdHJsLyNncGlvLWNlbGxzIDw9PQoA
AAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL3N0bWZ4QDQyL3BpbmN0
cmwvbmFtZSA8PT0KcGluY3RybAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMw
MDAvc3RtZnhANDIvcGluY3RybC9pbnRlcnJ1cHQtY29udHJvbGxlciA8PT0KCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL2kyYy1zY2wtZmFsbGluZy10aW1lLW5zIDw9PQoA
AAAUCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL3N0YXR1cyA8PT0Kb2th
eQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvI2FkZHJlc3MtY2VsbHMg
PD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvI3NpemUtY2Vs
bHMgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvcGhhbmRs
ZSA8PT0KAAAAzgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMzAwMC9yZWcgPD09
CkABMAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL3BpbmN0cmwt
MCA8PT0KAAAAHQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMzAwMC9pMmMtc2Ns
LXJpc2luZy10aW1lLW5zIDw9PQoAAAC5Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQw
MDEzMDAwL2ludGVycnVwdC1uYW1lcyA8PT0KZXZlbnQAZXJyb3IACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvaTJjQDQwMDEzMDAwL25hbWUgPD09CmkyYwAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9pMmNANDAwMTMwMDAvcGluY3RybC1uYW1lcyA8PT0KZGVmYXVsdABzbGVlcAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvd204OTk0QDFiL2NvbXBhdGlibGUgPD09
CndsZix3bTg5OTQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL3dtODk5
NEAxYi9jbG9ja3MgPD09CgAAACEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMw
MDAvd204OTk0QDFiL0NQVkRELXN1cHBseSA8PT0KAAAAIAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL2kyY0A0MDAxMzAwMC93bTg5OTRAMWIvREJWREQtc3VwcGx5IDw9PQoAAAAfCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL3dtODk5NEAxYi8jc291bmQtZGFpLWNlbGxz
IDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL3dtODk5NEAx
Yi93bGYsbGRvZW5hLWFsd2F5cy1kcml2ZW4gPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2kyY0A0MDAxMzAwMC93bTg5OTRAMWIvY2xvY2stbmFtZXMgPD09Ck1DTEsxAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMzAwMC93bTg5OTRAMWIvcG9ydHMvcG9ydEAxL2VuZHBv
aW50L3JlbW90ZS1lbmRwb2ludCA8PT0KAAAAIwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2ky
Y0A0MDAxMzAwMC93bTg5OTRAMWIvcG9ydHMvcG9ydEAxL2VuZHBvaW50L3BoYW5kbGUgPD09CgAA
ADsKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvd204OTk0QDFiL3BvcnRz
L3BvcnRAMS9lbmRwb2ludC9uYW1lIDw9PQplbmRwb2ludAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9pMmNANDAwMTMwMDAvd204OTk0QDFiL3BvcnRzL3BvcnRAMS9waGFuZGxlIDw9PQoAAADR
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL3dtODk5NEAxYi9wb3J0cy9w
b3J0QDEvcmVnIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAw
L3dtODk5NEAxYi9wb3J0cy9wb3J0QDEvbmFtZSA8PT0KcG9ydAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9pMmNANDAwMTMwMDAvd204OTk0QDFiL3BvcnRzLyNhZGRyZXNzLWNlbGxzIDw9PQoA
AAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL3dtODk5NEAxYi9wb3J0
cy8jc2l6ZS1jZWxscyA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAx
MzAwMC93bTg5OTRAMWIvcG9ydHMvcG9ydEAwL2VuZHBvaW50L3JlbW90ZS1lbmRwb2ludCA8PT0K
AAAAIgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMzAwMC93bTg5OTRAMWIvcG9y
dHMvcG9ydEAwL2VuZHBvaW50L3BoYW5kbGUgPD09CgAAADoKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9pMmNANDAwMTMwMDAvd204OTk0QDFiL3BvcnRzL3BvcnRAMC9lbmRwb2ludC9uYW1lIDw9
PQplbmRwb2ludAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvd204OTk0
QDFiL3BvcnRzL3BvcnRAMC9waGFuZGxlIDw9PQoAAADQCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvaTJjQDQwMDEzMDAwL3dtODk5NEAxYi9wb3J0cy9wb3J0QDAvcmVnIDw9PQoAAAAACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL3dtODk5NEAxYi9wb3J0cy9wb3J0QDAv
bmFtZSA8PT0KcG9ydAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvd204
OTk0QDFiL3BvcnRzL25hbWUgPD09CnBvcnRzAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2ky
Y0A0MDAxMzAwMC93bTg5OTRAMWIvZ3Bpby1jb250cm9sbGVyIDw9PQoKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvd204OTk0QDFiL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvd204OTk0QDFiL3BoYW5kbGUgPD09CgAA
AM8KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvd204OTk0QDFiL3dsZixn
cGlvLWNmZyA8PT0KAACBAQAAoQAAAKEAAAChAAAAoQEAAKEBAAChAAAAoQEAAKEBAAChAQAAoQEK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvd204OTk0QDFiL1NQS1ZERDIt
c3VwcGx5IDw9PQoAAAAfCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL3dt
ODk5NEAxYi9yZWcgPD09CgAAABsKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMw
MDAvd204OTk0QDFiLyNncGlvLWNlbGxzIDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvaTJjQDQwMDEzMDAwL3dtODk5NEAxYi9BVkREMi1zdXBwbHkgPD09CgAAACAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9pMmNANDAwMTMwMDAvd204OTk0QDFiL1NQS1ZERDEtc3VwcGx5IDw9
PQoAAAAfCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEzMDAwL3dtODk5NEAxYi9u
YW1lIDw9PQp3bTg5OTQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvY29tcGF0aWJsZSA8PT0K
c2ltcGxlLWJ1cwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlANDAwMGIwMDAvY29tcGF0
aWJsZSA8PT0Kc3Qsc3RtMzJoNy1zcGkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDQw
MDBiMDAwL2Nsb2NrcyA8PT0KAAAADAAAAIMKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlA
NDAwMGIwMDAvcmVzZXRzIDw9PQoAAAAMAABMCwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Nw
aUA0MDAwYjAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3NwaUA0MDAwYjAwMC8jYWRkcmVzcy1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3NwaUA0MDAwYjAwMC9pbnRlcnJ1cHRzIDw9PQoAAAAAAAAAJAAAAAQKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9zcGlANDAwMGIwMDAvI3NpemUtY2VsbHMgPD09CgAAAAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9zcGlANDAwMGIwMDAvZG1hLW5hbWVzIDw9PQpyeAB0eAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlANDAwMGIwMDAvcGhhbmRsZSA8PT0KAAAAxAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA0MDAwYjAwMC9yZWcgPD09CkAAsAAAAAQACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDQwMDBiMDAwL2RtYXMgPD09CgAAAA8AAAAnAAAEAAAA
AAEAAAAPAAAAKAAABAAAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDQwMDBiMDAw
L25hbWUgPD09CnNwaQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9wd3JANTAwMDEwMjAvY29t
cGF0aWJsZSA8PT0Kc3Qsc3RtMzJtcDEtcHdyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3B3
ckA1MDAwMTAyMC9zdCx3YWtldXAtcGlucyA8PT0KAAAAXAAAAAAAAAAAAAAAXAAAAAIAAAAAAAAA
XQAAAA0AAAAAAAAAKAAAAAgAAAAAAAAAKAAAAAsAAAAAAAAAXQAAAAEAAAAACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcHdyQDUwMDAxMDIwLyNpbnRlcnJ1cHQtY2VsbHMgPD09CgAAAAMKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9wd3JANTAwMDEwMjAvaW50ZXJydXB0cyA8PT0KAAAAAAAA
AJUAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcHdyQDUwMDAxMDIwL3BoYW5kbGUgPD09
CgAAAF8KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9wd3JANTAwMDEwMjAvcmVnIDw9PQpQABAg
AAABAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3B3ckA1MDAwMTAyMC9uYW1lIDw9PQpwd3IA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcHdyQDUwMDAxMDIwL2ludGVycnVwdC1jb250cm9s
bGVyIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9hdWRpby1jb250cm9sbGVyQDQwMDBk
MDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyaDctc3BkaWZyeAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9hdWRpby1jb250cm9sbGVyQDQwMDBkMDAwL2Nsb2NrcyA8PT0KAAAADAAAAIEKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9hdWRpby1jb250cm9sbGVyQDQwMDBkMDAwLyNzb3VuZC1k
YWktY2VsbHMgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9hdWRpby1jb250cm9s
bGVyQDQwMDBkMDAwL3BpbmN0cmwtMSA8PT0KAAAAFQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2F1ZGlvLWNvbnRyb2xsZXJANDAwMGQwMDAvcG9ydC9lbmRwb2ludC9yZW1vdGUtZW5kcG9pbnQg
PD09CgAAABYKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9hdWRpby1jb250cm9sbGVyQDQwMDBk
MDAwL3BvcnQvZW5kcG9pbnQvcGhhbmRsZSA8PT0KAAAApwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL2F1ZGlvLWNvbnRyb2xsZXJANDAwMGQwMDAvcG9ydC9lbmRwb2ludC9uYW1lIDw9PQplbmRw
b2ludAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9hdWRpby1jb250cm9sbGVyQDQwMDBkMDAw
L3BvcnQvcGhhbmRsZSA8PT0KAAAAqwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2F1ZGlvLWNv
bnRyb2xsZXJANDAwMGQwMDAvcG9ydC9uYW1lIDw9PQpwb3J0AAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL2F1ZGlvLWNvbnRyb2xsZXJANDAwMGQwMDAvY2xvY2stbmFtZXMgPD09CmtjbGsACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYXVkaW8tY29udHJvbGxlckA0MDAwZDAwMC9zdGF0dXMg
PD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYXVkaW8tY29udHJvbGxlckA0MDAw
ZDAwMC9pbnRlcnJ1cHRzIDw9PQoAAAAAAAAAYQAAAAQKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9hdWRpby1jb250cm9sbGVyQDQwMDBkMDAwL2RtYS1uYW1lcyA8PT0KcngAcngtY3RybAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9hdWRpby1jb250cm9sbGVyQDQwMDBkMDAwL3BoYW5kbGUg
PD09CgAAAMgKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9hdWRpby1jb250cm9sbGVyQDQwMDBk
MDAwL3JlZyA8PT0KQADQAAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9hdWRpby1jb250
cm9sbGVyQDQwMDBkMDAwL3BpbmN0cmwtMCA8PT0KAAAAFAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL2F1ZGlvLWNvbnRyb2xsZXJANDAwMGQwMDAvZG1hcyA8PT0KAAAADwAAAF0AAAQAAAAAAQAA
AA8AAABeAAAEAAAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9hdWRpby1jb250cm9sbGVy
QDQwMDBkMDAwL25hbWUgPD09CmF1ZGlvLWNvbnRyb2xsZXIACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvYXVkaW8tY29udHJvbGxlckA0MDAwZDAwMC9waW5jdHJsLW5hbWVzIDw9PQpkZWZhdWx0
AHNsZWVwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0NDAwMzAwMC9wb3dlci1k
b21haW5zIDw9PQoAAAATCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFsQDQ0MDAzMDAw
L2ludGVycnVwdHMtZXh0ZW5kZWQgPD09CgAAABIAAAAdAAAABAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3NlcmlhbEA0NDAwMzAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMmg3LXVhcnQACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFsQDQ0MDAzMDAwL2Nsb2NrcyA8PT0KAAAADAAA
AJkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDQwMDMwMDAvd2FrZXVwLXNvdXJj
ZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFsQDQ0MDAzMDAwL3N0YXR1cyA8
PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFsQDQ0MDAzMDAwL2Rt
YS1uYW1lcyA8PT0KcngAdHgACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFsQDQ0MDAz
MDAwL3BoYW5kbGUgPD09CgAAAN8KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDQw
MDMwMDAvcmVnIDw9PQpEADAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0
NDAwMzAwMC9kbWFzIDw9PQoAAAAPAAAARwAABAAAAAAVAAAADwAAAEgAAAQAAAAAEQo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0NDAwMzAwMC9uYW1lIDw9PQpzZXJpYWwACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvdnJlZmJ1ZkA1MDAyNTAwMC9jb21wYXRpYmxlIDw9PQpzdCxz
dG0zMi12cmVmYnVmAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3ZyZWZidWZANTAwMjUwMDAv
Y2xvY2tzIDw9PQoAAAAMAAAANAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3ZyZWZidWZANTAw
MjUwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy92cmVm
YnVmQDUwMDI1MDAwL3BoYW5kbGUgPD09CgAAAQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy92
cmVmYnVmQDUwMDI1MDAwL3JlZ3VsYXRvci1taW4tbWljcm92b2x0IDw9PQoAFuNgCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvdnJlZmJ1ZkA1MDAyNTAwMC9yZWcgPD09ClACUAAAAAAICj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvdnJlZmJ1ZkA1MDAyNTAwMC9yZWd1bGF0b3ItbWF4LW1pY3Jv
dm9sdCA8PT0KACYloAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3ZyZWZidWZANTAwMjUwMDAv
bmFtZSA8PT0KdnJlZmJ1ZgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tbWNANDgwMDQwMDAv
Y2FwLW1tYy1oaWdoc3BlZWQgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21tY0A0ODAw
NDAwMC9zdCxuZWctZWRnZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbW1jQDQ4MDA0
MDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLXNkbW1jMgBhcm0scGwxOHgAYXJtLHByaW1lY2Vs
bAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tbWNANDgwMDQwMDAvY2xvY2tzIDw9PQoAAAAM
AAAAeAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21tY0A0ODAwNDAwMC9jYXAtc2QtaGlnaHNw
ZWVkIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tbWNANDgwMDQwMDAvcmVzZXRzIDw9
PQoAAAAMAABM0Ao9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21tY0A0ODAwNDAwMC9waW5jdHJs
LTEgPD09CgAAAFIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tbWNANDgwMDQwMDAvY2xvY2st
bmFtZXMgPD09CmFwYl9wY2xrAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21tY0A0ODAwNDAw
MC9icm9rZW4tY2QgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21tY0A0ODAwNDAwMC9z
dGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21tY0A0ODAwNDAw
MC9pbnRlcnJ1cHRzIDw9PQoAAAAAAAAAiQAAAAQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9t
bWNANDgwMDQwMDAvYnVzLXdpZHRoIDw9PQoAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
bW1jQDQ4MDA0MDAwL3BoYW5kbGUgPD09CgAAAPgKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9t
bWNANDgwMDQwMDAvYXJtLHByaW1lY2VsbC1wZXJpcGhpZCA8PT0KACUxgAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL21tY0A0ODAwNDAwMC9waW5jdHJsLTIgPD09CgAAAFMKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9tbWNANDgwMDQwMDAvcmVnIDw9PQpIAEAAAAAEAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL21tY0A0ODAwNDAwMC9waW5jdHJsLTAgPD09CgAAAFEKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9tbWNANDgwMDQwMDAvdm1tYy1zdXBwbHkgPD09CgAAACkKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9tbWNANDgwMDQwMDAvaW50ZXJydXB0LW5hbWVzIDw9PQpjbWRfaXJx
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21tY0A0ODAwNDAwMC9tYXgtZnJlcXVlbmN5IDw9
PQoHJw4ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbW1jQDQ4MDA0MDAwL25hbWUgPD09Cm1t
YwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tbWNANDgwMDQwMDAvcGluY3RybC1uYW1lcyA8
PT0KZGVmYXVsdABvcGVuZHJhaW4Ac2xlZXAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3Bp
QDVjMDAxMDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyaDctc3BpAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3NwaUA1YzAwMTAwMC9jbG9ja3MgPD09CgAAAAEAAAATCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2Mvc3BpQDVjMDAxMDAwL3Jlc2V0cyA8PT0KAAAAaQAAAAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9zcGlANWMwMDEwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9zcGlANWMwMDEwMDAvI2FkZHJlc3MtY2VsbHMgPD09CgAAAAEKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlANWMwMDEwMDAvaW50ZXJydXB0cyA8PT0KAAAAAAAA
AFYAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDVjMDAxMDAwLyNzaXplLWNlbGxz
IDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDVjMDAxMDAwL2RtYS1uYW1l
cyA8PT0KcngAdHgACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDVjMDAxMDAwL3BoYW5k
bGUgPD09CgAAARQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlANWMwMDEwMDAvcmVnIDw9
PQpcABAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA1YzAwMTAwMC9kbWFzIDw9
PQoAAABKAAAAIgAAAAAABAAIAAAAAAAAAAAAAAAAAAAASgAAACMAAAAAAAQAAgAAAAAAAAAAAAAA
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA1YzAwMTAwMC9uYW1lIDw9PQpzcGkACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvY3J5cEA1NDAwMTAwMC9jb21wYXRpYmxlIDw9PQpzdCxz
dG0zMm1wMS1jcnlwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2NyeXBANTQwMDEwMDAvY2xv
Y2tzIDw9PQoAAAABAAAACgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2NyeXBANTQwMDEwMDAv
cmVzZXRzIDw9PQoAAABpAAAABgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2NyeXBANTQwMDEw
MDAvc3RhdHVzIDw9PQpva2F5AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2NyeXBANTQwMDEw
MDAvaW50ZXJydXB0cyA8PT0KAAAAAAAAAE8AAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
Y3J5cEA1NDAwMTAwMC9waGFuZGxlIDw9PQoAAAHRCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
Y3J5cEA1NDAwMTAwMC9yZWcgPD09ClQAEAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
Y3J5cEA1NDAwMTAwMC9uYW1lIDw9PQpjcnlwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3B3
ckA1MDAwMTAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMm1wMSxwd3ItcmVnAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3B3ckA1MDAwMTAwMC92ZGRfM3YzX3VzYmZzLXN1cHBseSA8PT0KAAAA
Wwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3B3ckA1MDAwMTAwMC9yZWcxMS9waGFuZGxlIDw9
PQoAAACHCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcHdyQDUwMDAxMDAwL3JlZzExL3JlZ3Vs
YXRvci1taW4tbWljcm92b2x0IDw9PQoAEMjgCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcHdy
QDUwMDAxMDAwL3JlZzExL3JlZ3VsYXRvci1tYXgtbWljcm92b2x0IDw9PQoAEMjgCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcHdyQDUwMDAxMDAwL3JlZzExL3JlZ3VsYXRvci1uYW1lIDw9PQpy
ZWcxMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9wd3JANTAwMDEwMDAvcmVnMTEvbmFtZSA8
PT0KcmVnMTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcHdyQDUwMDAxMDAwL3VzYjMzL3Bo
YW5kbGUgPD09CgAAAFQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9wd3JANTAwMDEwMDAvdXNi
MzMvcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPD09CgAyWqAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9wd3JANTAwMDEwMDAvdXNiMzMvcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPD09CgAyWqAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9wd3JANTAwMDEwMDAvdXNiMzMvcmVndWxhdG9yLW5h
bWUgPD09CnVzYjMzAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3B3ckA1MDAwMTAwMC91c2Iz
My9uYW1lIDw9PQp1c2IzMwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9wd3JANTAwMDEwMDAv
c3QsdHpjciA8PT0KAAAADAAAAAAAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcHdyQDUw
MDAxMDAwL3BoYW5kbGUgPD09CgAAAPsKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9wd3JANTAw
MDEwMDAvcmVnMTgvcGhhbmRsZSA8PT0KAAAAiAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3B3
ckA1MDAwMTAwMC9yZWcxOC9yZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA8PT0KABt3QAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3B3ckA1MDAwMTAwMC9yZWcxOC9yZWd1bGF0b3ItbWF4LW1pY3Jv
dm9sdCA8PT0KABt3QAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3B3ckA1MDAwMTAwMC9yZWcx
OC9yZWd1bGF0b3ItbmFtZSA8PT0KcmVnMTgACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcHdy
QDUwMDAxMDAwL3JlZzE4L25hbWUgPD09CnJlZzE4AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3B3ckA1MDAwMTAwMC92ZGQtc3VwcGx5IDw9PQoAAAAfCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcHdyQDUwMDAxMDAwL3JlZyA8PT0KUAAQAAAAABAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9wd3JANTAwMDEwMDAvbmFtZSA8PT0KcHdyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rt
YS1jb250cm9sbGVyQDU4MDAwMDAwLyNkbWEtY2VsbHMgPD09CgAAAAYKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9kbWEtY29udHJvbGxlckA1ODAwMDAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0z
Mmg3LW1kbWEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZG1hLWNvbnRyb2xsZXJANTgwMDAw
MDAvZG1hLXJlcXVlc3RzIDw9PQoAAAAwCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZG1hLWNv
bnRyb2xsZXJANTgwMDAwMDAvY2xvY2tzIDw9PQoAAAAMAAAAZAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL2RtYS1jb250cm9sbGVyQDU4MDAwMDAwL3Jlc2V0cyA8PT0KAAAAaQAAAAkKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9kbWEtY29udHJvbGxlckA1ODAwMDAwMC9kbWEtY2hhbm5lbHMg
PD09CgAAACAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kbWEtY29udHJvbGxlckA1ODAwMDAw
MC9pbnRlcnJ1cHRzIDw9PQoAAAAAAAAAegAAAAQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9k
bWEtY29udHJvbGxlckA1ODAwMDAwMC9waGFuZGxlIDw9PQoAAABKCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvZG1hLWNvbnRyb2xsZXJANTgwMDAwMDAvcmVnIDw9PQpYAAAAAAAQAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL2RtYS1jb250cm9sbGVyQDU4MDAwMDAwL25hbWUgPD09CmRtYS1j
b250cm9sbGVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2RhY0A0MDAxNzAwMC9jb21wYXRp
YmxlIDw9PQpzdCxzdG0zMmg3LWRhYy1jb3JlAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rh
Y0A0MDAxNzAwMC9jbG9ja3MgPD09CgAAAAwAAAAeCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
ZGFjQDQwMDE3MDAwL2Nsb2NrLW5hbWVzIDw9PQpwY2xrAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL2RhY0A0MDAxNzAwMC92cmVmLXN1cHBseSA8PT0KAAAAMQo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL2RhY0A0MDAxNzAwMC9kYWNAMS9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMi1kYWMACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGFjQDQwMDE3MDAwL2RhY0AxLyNpby1jaGFubmVsLWNl
bGxzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGFjQDQwMDE3MDAwL2RhY0Ax
L3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kYWNANDAwMTcwMDAv
ZGFjQDEvcGhhbmRsZSA8PT0KAAAA2Qo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2RhY0A0MDAx
NzAwMC9kYWNAMS9yZWcgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kYWNANDAw
MTcwMDAvZGFjQDEvbmFtZSA8PT0KZGFjAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2RhY0A0
MDAxNzAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rh
Y0A0MDAxNzAwMC8jYWRkcmVzcy1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL2RhY0A0MDAxNzAwMC8jc2l6ZS1jZWxscyA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL2RhY0A0MDAxNzAwMC9waGFuZGxlIDw9PQoAAADYCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvZGFjQDQwMDE3MDAwL3JlZyA8PT0KQAFwAAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9kYWNANDAwMTcwMDAvcGluY3RybC0wIDw9PQoAAAAvAAAAMAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2RhY0A0MDAxNzAwMC9kYWNAMi9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMi1kYWMA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGFjQDQwMDE3MDAwL2RhY0AyLyNpby1jaGFubmVs
LWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGFjQDQwMDE3MDAwL2Rh
Y0AyL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kYWNANDAwMTcw
MDAvZGFjQDIvcGhhbmRsZSA8PT0KAAAA2go9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2RhY0A0
MDAxNzAwMC9kYWNAMi9yZWcgPD09CgAAAAIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kYWNA
NDAwMTcwMDAvZGFjQDIvbmFtZSA8PT0KZGFjAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rh
Y0A0MDAxNzAwMC9uYW1lIDw9PQpkYWMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGFjQDQw
MDE3MDAwL3BpbmN0cmwtbmFtZXMgPD09CmRlZmF1bHQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMm1wMTU3
LXotcGluY3RybAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlci16QDU0
MDA0MDAwL2kyYzQtMC9waW5zL2RyaXZlLW9wZW4tZHJhaW4gPD09Cgo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQwMDAvaTJjNC0wL3BpbnMvcGlubXV4IDw9
PQoAAZQHAAGVBwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQw
MDQwMDAvaTJjNC0wL3BpbnMvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlci16QDU0MDA0MDAwL2kyYzQtMC9waW5zL3NsZXctcmF0ZSA8PT0K
AAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQwMDAv
aTJjNC0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlci16QDU0MDA0MDAwL2kyYzQtMC9waGFuZGxlIDw9PQoAAACJCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9pMmM0LTAvbmFtZSA8PT0K
aTJjNC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQw
MDAvaTJjMi1zbGVlcC0wL3BpbnMvcGlubXV4IDw9PQoAAZARCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9pMmMyLXNsZWVwLTAvcGlucy9uYW1lIDw9
PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQw
MDAvaTJjMi1zbGVlcC0wL3BoYW5kbGUgPD09CgAAAcgKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlci16QDU0MDA0MDAwL2kyYzItc2xlZXAtMC9uYW1lIDw9PQppMmMyLXNs
ZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAw
MC9zdCxzeXNjZmcgPD09CgAAABIAAABgAAAA/wo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyLXpANTQwMDQwMDAvZ3Bpb0A1NDAwNDAwMC9zdCxiYW5rLW5hbWUgPD09CkdQ
SU9aAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQwMDAv
Z3Bpb0A1NDAwNDAwMC9jbG9ja3MgPD09CgAAAAEAAAALCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9ncGlvQDU0MDA0MDAwL2dwaW8tY29udHJvbGxl
ciA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAw
MC9ncGlvQDU0MDA0MDAwL2dwaW8tcmFuZ2VzIDw9PQoAAACQAAAAAAAAAZAAAAAICj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9ncGlvQDU0MDA0MDAw
L3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ci16QDU0MDA0MDAwL2dwaW9ANTQwMDQwMDAvI2ludGVycnVwdC1jZWxscyA8PT0KAAAAAgo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQwMDAvZ3Bpb0A1NDAw
NDAwMC9uZ3Bpb3MgPD09CgAAAAgKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlci16QDU0MDA0MDAwL2dwaW9ANTQwMDQwMDAvcGhhbmRsZSA8PT0KAAABxgo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQwMDAvZ3Bpb0A1NDAwNDAwMC9z
dCxiYW5rLWlvcG9ydCA8PT0KAAAACwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyLXpANTQwMDQwMDAvZ3Bpb0A1NDAwNDAwMC9yZWcgPD09CgAAAAAAAAQACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9ncGlvQDU0MDA0MDAw
LyNncGlvLWNlbGxzIDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXItekA1NDAwNDAwMC9ncGlvQDU0MDA0MDAwL25hbWUgPD09CmdwaW8ACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9ncGlvQDU0MDA0MDAwL2lu
dGVycnVwdC1jb250cm9sbGVyIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlci16QDU0MDA0MDAwL200LXNwaTEtMC9waW5zL3Bpbm11eCA8PT0KAAGQEgABkhIAAZES
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9tNC1z
cGkxLTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyLXpANTQwMDQwMDAvbTQtc3BpMS0wL3BoYW5kbGUgPD09CgAAAcwKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlci16QDU0MDA0MDAwL200LXNwaTEtMC9uYW1l
IDw9PQptNC1zcGkxLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXIt
ekA1NDAwNDAwMC9od2xvY2tzIDw9PQoAAABeAAAAAAAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlci16QDU0MDA0MDAwL2kyYzYtc2xlZXAtMC9waW5zL3Bpbm11eCA8
PT0KAAGWEQABlxEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlci16QDU0
MDA0MDAwL2kyYzYtc2xlZXAtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9pMmM2LXNsZWVwLTAvcGhhbmRsZSA8
PT0KAAABygo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQw
MDAvaTJjNi1zbGVlcC0wL25hbWUgPD09CmkyYzYtc2xlZXAtMAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlci16QDU0MDA0MDAwL3JhbmdlcyA8PT0KAAAAAFQAQAAAAAQA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9pbnRl
cnJ1cHQtcGFyZW50IDw9PQoAAAASCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXItekA1NDAwNDAwMC8jYWRkcmVzcy1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQwMDAvaTJjNi0wL3BpbnMvZHJpdmUtb3Bl
bi1kcmFpbiA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXItekA1
NDAwNDAwMC9pMmM2LTAvcGlucy9waW5tdXggPD09CgABlgMAAZcDCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9pMmM2LTAvcGlucy9iaWFzLWRpc2Fi
bGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQw
MDAvaTJjNi0wL3BpbnMvc2xldy1yYXRlIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9pMmM2LTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQwMDAvaTJjNi0w
L3BoYW5kbGUgPD09CgAAAckKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ci16QDU0MDA0MDAwL2kyYzYtMC9uYW1lIDw9PQppMmM2LTAACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC8jc2l6ZS1jZWxscyA8PT0KAAAAAQo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQwMDAvcGhhbmRsZSA8
PT0KAAAAkAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQw
MDAvc3QscGFja2FnZSA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyLXpANTQwMDQwMDAvbTQtaTJjNC0wL3BpbnMvcGlubXV4IDw9PQoAAZQSAAGVEgo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQwMDAvbTQtaTJjNC0w
L3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlci16QDU0MDA0MDAwL200LWkyYzQtMC9waGFuZGxlIDw9PQoAAAHLCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9tNC1pMmM0LTAvbmFtZSA8PT0K
bTQtaTJjNC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQw
MDQwMDAvaTJjMi0wL3BpbnMvZHJpdmUtb3Blbi1kcmFpbiA8PT0KCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9pMmMyLTAvcGlucy9waW5tdXggPD09
CgABkAQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlci16QDU0MDA0MDAw
L2kyYzItMC9waW5zL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9pMmMyLTAvcGlucy9zbGV3LXJhdGUgPD09CgAAAAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlci16QDU0MDA0MDAwL2kyYzIt
MC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXItekA1NDAwNDAwMC9pMmMyLTAvcGhhbmRsZSA8PT0KAAABxwo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQwMDAvaTJjMi0wL25hbWUgPD09CmkyYzIt
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlci16QDU0MDA0MDAwL2ky
YzQtc2xlZXAtMC9waW5zL3Bpbm11eCA8PT0KAAGUEQABlREKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlci16QDU0MDA0MDAwL2kyYzQtc2xlZXAtMC9waW5zL25hbWUgPD09
CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAw
MC9pMmM0LXNsZWVwLTAvcGhhbmRsZSA8PT0KAAAAigo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyLXpANTQwMDQwMDAvaTJjNC1zbGVlcC0wL25hbWUgPD09CmkyYzQtc2xl
ZXAtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlci16QDU0MDA0MDAw
L3NwaTEtMC9waW5zMS9waW5tdXggPD09CgABkAYAAZIGCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9zcGkxLTAvcGluczEvYmlhcy1kaXNhYmxlIDw9
PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlci16QDU0MDA0MDAwL3Nw
aTEtMC9waW5zMS9zbGV3LXJhdGUgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlci16QDU0MDA0MDAwL3NwaTEtMC9waW5zMS9uYW1lIDw9PQpwaW5zMQAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlci16QDU0MDA0MDAwL3NwaTEtMC9w
aW5zMS9kcml2ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyLXpANTQwMDQwMDAvc3BpMS0wL3BoYW5kbGUgPD09CgAAADQKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlci16QDU0MDA0MDAwL3NwaTEtMC9waW5zMi9waW5t
dXggPD09CgABkQYKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlci16QDU0
MDA0MDAwL3NwaTEtMC9waW5zMi9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQwMDAvc3BpMS0wL3BpbnMyL25hbWUgPD09CnBp
bnMyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQwMDAv
c3BpMS0wL25hbWUgPD09CnNwaTEtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlci16QDU0MDA0MDAwL3BpbnMtYXJlLW51bWJlcmVkIDw9PQoKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlci16QDU0MDA0MDAwL25hbWUgPD09CnBpbi1jb250cm9s
bGVyLXoACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAw
MC9zcGkxLXNsZWVwLTAvcGlucy9waW5tdXggPD09CgABkBEAAZERAAGSEQo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyLXpANTQwMDQwMDAvc3BpMS1zbGVlcC0wL3BpbnMv
bmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlci16
QDU0MDA0MDAwL3NwaTEtc2xlZXAtMC9waGFuZGxlIDw9PQoAAAA1Cj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXItekA1NDAwNDAwMC9zcGkxLXNsZWVwLTAvbmFtZSA8PT0K
c3BpMS1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21haWxib3hANGMwMDEwMDAv
cG93ZXItZG9tYWlucyA8PT0KAAAAEwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21haWxib3hA
NGMwMDEwMDAvaW50ZXJydXB0cy1leHRlbmRlZCA8PT0KAAAAEgAAAD0AAAABAAAABwAAAAAAAABl
AAAABAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21haWxib3hANGMwMDEwMDAvY29tcGF0aWJs
ZSA8PT0Kc3Qsc3RtMzJtcDEtaXBjYwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tYWlsYm94
QDRjMDAxMDAwL2Nsb2NrcyA8PT0KAAAADAAAAFMKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9t
YWlsYm94QDRjMDAxMDAwL3dha2V1cC1zb3VyY2UgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL21haWxib3hANGMwMDEwMDAvc3QscHJvYy1pZCA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL21haWxib3hANGMwMDEwMDAvI21ib3gtY2VsbHMgPD09CgAAAAEKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9tYWlsYm94QDRjMDAxMDAwL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9tYWlsYm94QDRjMDAxMDAwL3BoYW5kbGUgPD09CgAAAKEKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9tYWlsYm94QDRjMDAxMDAwL3JlZyA8PT0KTAAQAAAABAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tYWlsYm94QDRjMDAxMDAwL2ludGVycnVwdC1uYW1l
cyA8PT0KcngAdHgACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbWFpbGJveEA0YzAwMTAwMC9u
YW1lIDw9PQptYWlsYm94AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA0NDAwOTAwMC9j
b21wYXRpYmxlIDw9PQpzdCxzdG0zMmg3LXNwaQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9z
cGlANDQwMDkwMDAvY2xvY2tzIDw9PQoAAAAMAAAAhgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3NwaUA0NDAwOTAwMC9yZXNldHMgPD09CgAAAAwAAExKCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2Mvc3BpQDQ0MDA5MDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2Mvc3BpQDQ0MDA5MDAwLyNhZGRyZXNzLWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2Mvc3BpQDQ0MDA5MDAwL2ludGVycnVwdHMgPD09CgAAAAAAAABVAAAABAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA0NDAwOTAwMC8jc2l6ZS1jZWxscyA8PT0KAAAAAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA0NDAwOTAwMC9kbWEtbmFtZXMgPD09CnJ4AHR4
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA0NDAwOTAwMC9waGFuZGxlIDw9PQoAAADm
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDQ0MDA5MDAwL3JlZyA8PT0KRACQAAAABAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlANDQwMDkwMDAvZG1hcyA8PT0KAAAADwAAAFUA
AAQAAAAAAQAAAA8AAABWAAAEAAAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlANDQw
MDkwMDAvbmFtZSA8PT0Kc3BpAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0MDAx
ODAwMC9wb3dlci1kb21haW5zIDw9PQoAAAATCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2Vy
aWFsQDQwMDE4MDAwL2ludGVycnVwdHMtZXh0ZW5kZWQgPD09CgAAABIAAAAgAAAABAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0MDAxODAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0z
Mmg3LXVhcnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFsQDQwMDE4MDAwL2Nsb2Nr
cyA8PT0KAAAADAAAAJoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAwMTgwMDAv
d2FrZXVwLXNvdXJjZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFsQDQwMDE4
MDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFs
QDQwMDE4MDAwL2RtYS1uYW1lcyA8PT0KcngAdHgACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
c2VyaWFsQDQwMDE4MDAwL3BoYW5kbGUgPD09CgAAANsKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9zZXJpYWxANDAwMTgwMDAvcmVnIDw9PQpAAYAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3NlcmlhbEA0MDAxODAwMC9kbWFzIDw9PQoAAAAPAAAATwAABAAAAAAVAAAADwAAAFAAAAQA
AAAAEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0MDAxODAwMC9uYW1lIDw9PQpz
ZXJpYWwACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBhMDAwL2NvbXBhdGlibGUg
PD09CnN0LHN0bTMyaDctc2FpAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYTAw
MC9yZXNldHMgPD09CgAAAAwAAExQCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBh
MDAwL2F1ZGlvLWNvbnRyb2xsZXJANDQwMGEwMjQvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzItc2Fp
LXN1Yi1iAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYTAwMC9hdWRpby1jb250
cm9sbGVyQDQ0MDBhMDI0L2Nsb2NrcyA8PT0KAAAADAAAAJ4KPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9zYWlANDQwMGEwMDAvYXVkaW8tY29udHJvbGxlckA0NDAwYTAyNC8jc291bmQtZGFpLWNl
bGxzIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBhMDAwL2F1ZGlv
LWNvbnRyb2xsZXJANDQwMGEwMjQvY2xvY2stbmFtZXMgPD09CnNhaV9jawAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9zYWlANDQwMGEwMDAvYXVkaW8tY29udHJvbGxlckA0NDAwYTAyNC9zdGF0
dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYTAwMC9h
dWRpby1jb250cm9sbGVyQDQ0MDBhMDI0L3BoYW5kbGUgPD09CgAAAOkKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9zYWlANDQwMGEwMDAvYXVkaW8tY29udHJvbGxlckA0NDAwYTAyNC9yZWcgPD09
CgAAACQAAAAgCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBhMDAwL2F1ZGlvLWNv
bnRyb2xsZXJANDQwMGEwMjQvZG1hcyA8PT0KAAAADwAAAFgAAAQAAAAAAQo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3NhaUA0NDAwYTAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBhMDI0L25hbWUg
PD09CmF1ZGlvLWNvbnRyb2xsZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBh
MDAwL2F1ZGlvLWNvbnRyb2xsZXJANDQwMGEwMDQvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzItc2Fp
LXN1Yi1hAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYTAwMC9hdWRpby1jb250
cm9sbGVyQDQ0MDBhMDA0L2Nsb2NrcyA8PT0KAAAADAAAAJ4KPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9zYWlANDQwMGEwMDAvYXVkaW8tY29udHJvbGxlckA0NDAwYTAwNC8jc291bmQtZGFpLWNl
bGxzIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBhMDAwL2F1ZGlv
LWNvbnRyb2xsZXJANDQwMGEwMDQvY2xvY2stbmFtZXMgPD09CnNhaV9jawAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9zYWlANDQwMGEwMDAvYXVkaW8tY29udHJvbGxlckA0NDAwYTAwNC9zdGF0
dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYTAwMC9h
dWRpby1jb250cm9sbGVyQDQ0MDBhMDA0L3BoYW5kbGUgPD09CgAAAOgKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9zYWlANDQwMGEwMDAvYXVkaW8tY29udHJvbGxlckA0NDAwYTAwNC9yZWcgPD09
CgAAAAQAAAAgCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBhMDAwL2F1ZGlvLWNv
bnRyb2xsZXJANDQwMGEwMDQvZG1hcyA8PT0KAAAADwAAAFcAAAQAAAAAAQo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3NhaUA0NDAwYTAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBhMDA0L25hbWUg
PD09CmF1ZGlvLWNvbnRyb2xsZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBh
MDAwL3JhbmdlcyA8PT0KAAAAAEQAoAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2Fp
QDQ0MDBhMDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
c2FpQDQ0MDBhMDAwLyNhZGRyZXNzLWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2Mvc2FpQDQ0MDBhMDAwL2ludGVycnVwdHMgPD09CgAAAAAAAABXAAAABAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYTAwMC8jc2l6ZS1jZWxscyA8PT0KAAAAAQo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYTAwMC9waGFuZGxlIDw9PQoAAADnCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBhMDAwL3JlZyA8PT0KRACgAAAAAAREAKPwAAAAEAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYTAwMC9uYW1lIDw9PQpzYWkACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3JhbUAxMDAwMDAwMC9jb21wYXRpYmxlIDw9PQptbWlvLXNy
YW0ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3JhbUAxMDAwMDAwMC9yYW5nZXMgPD09CgAA
AAAQAAAAAAYAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NyYW1AMTAwMDAwMDAvZG1hX3Bv
b2xAMC9waGFuZGxlIDw9PQoAAABLCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3JhbUAxMDAw
MDAwMC9kbWFfcG9vbEAwL3JlZyA8PT0KAAUAAAABAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9zcmFtQDEwMDAwMDAwL2RtYV9wb29sQDAvcG9vbCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2Mvc3JhbUAxMDAwMDAwMC9kbWFfcG9vbEAwL25hbWUgPD09CmRtYV9wb29sAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3NyYW1AMTAwMDAwMDAvI2FkZHJlc3MtY2VsbHMgPD09CgAAAAEK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcmFtQDEwMDAwMDAwLyNzaXplLWNlbGxzIDw9PQoA
AAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3JhbUAxMDAwMDAwMC9waGFuZGxlIDw9PQoA
AAC5Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3JhbUAxMDAwMDAwMC9yZWcgPD09ChAAAAAA
BgAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3JhbUAxMDAwMDAwMC9uYW1lIDw9PQpzcmFt
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA1YzAwMDAwMC9wb3dlci1kb21haW5z
IDw9PQoAAAATCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFsQDVjMDAwMDAwL2ludGVy
cnVwdHMtZXh0ZW5kZWQgPD09CgAAABIAAAAaAAAABAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3NlcmlhbEA1YzAwMDAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMmg3LXVhcnQACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFsQDVjMDAwMDAwL2Nsb2NrcyA8PT0KAAAAAQAAABQKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANWMwMDAwMDAvcmVzZXRzIDw9PQoAAABpAAAA
Awo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA1YzAwMDAwMC93YWtldXAtc291cmNl
IDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANWMwMDAwMDAvc3RhdHVzIDw9
PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANWMwMDAwMDAvcGhh
bmRsZSA8PT0KAAABEwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA1YzAwMDAwMC9y
ZWcgPD09ClwAAAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFsQDVjMDAwMDAw
L25hbWUgPD09CnNlcmlhbAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2JwaHljQDVhMDA2
MDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMybXAxLXVzYnBoeWMACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvdXNicGh5Y0A1YTAwNjAwMC9jbG9ja3MgPD09CgAAAAwAAAB/Cj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvdXNicGh5Y0A1YTAwNjAwMC9yZXNldHMgPD09CgAAAAwAAAwQCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvdXNicGh5Y0A1YTAwNjAwMC91c2ItcGh5QDAvc3QsZW5hYmxl
LWhzLXJmdGltZS1yZWR1Y3Rpb24gPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3VzYnBo
eWNANWEwMDYwMDAvdXNiLXBoeUAwL3N0LHR1bmUtaHMtcngtb2Zmc2V0IDw9PQoAAAACCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvdXNicGh5Y0A1YTAwNjAwMC91c2ItcGh5QDAvc3QsZW5hYmxl
LWZzLXJmdGltZS10dW5pbmcgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3VzYnBoeWNA
NWEwMDYwMDAvdXNiLXBoeUAwL3N0LHR1bmUtaHMtZGMtbGV2ZWwgPD09CgAAAAIKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy91c2JwaHljQDVhMDA2MDAwL3VzYi1waHlAMC9jb25uZWN0b3IvdmJ1
cy1zdXBwbHkgPD09CgAAACkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2JwaHljQDVhMDA2
MDAwL3VzYi1waHlAMC9jb25uZWN0b3IvY29tcGF0aWJsZSA8PT0KdXNiLWEtY29ubmVjdG9yAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3VzYnBoeWNANWEwMDYwMDAvdXNiLXBoeUAwL2Nvbm5l
Y3Rvci9uYW1lIDw9PQpjb25uZWN0b3IACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdXNicGh5
Y0A1YTAwNjAwMC91c2ItcGh5QDAvcGh5LXN1cHBseSA8PT0KAAAAWwo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3VzYnBoeWNANWEwMDYwMDAvdXNiLXBoeUAwL3BoYW5kbGUgPD09CgAAAIUKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2JwaHljQDVhMDA2MDAwL3VzYi1waHlAMC9zdCxuby1s
c2ZzLXNjIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2JwaHljQDVhMDA2MDAwL3Vz
Yi1waHlAMC9yZWcgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2JwaHljQDVh
MDA2MDAwL3VzYi1waHlAMC9zdCx0dW5lLXNxdWVsY2gtbGV2ZWwgPD09CgAAAAMKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy91c2JwaHljQDVhMDA2MDAwL3VzYi1waHlAMC9zdCx0cmltLWhzLWN1
cnJlbnQgPD09CgAAAA8KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2JwaHljQDVhMDA2MDAw
L3VzYi1waHlAMC9zdCx0cmltLWhzLWltcGVkYW5jZSA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3VzYnBoeWNANWEwMDYwMDAvdXNiLXBoeUAwLyNwaHktY2VsbHMgPD09CgAAAAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2JwaHljQDVhMDA2MDAwL3VzYi1waHlAMC9uYW1l
IDw9PQp1c2ItcGh5AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3VzYnBoeWNANWEwMDYwMDAv
dmRkYTF2OC1zdXBwbHkgPD09CgAAAIgKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2JwaHlj
QDVhMDA2MDAwL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2Jw
aHljQDVhMDA2MDAwLyNhZGRyZXNzLWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvdXNicGh5Y0A1YTAwNjAwMC92ZGRhMXYxLXN1cHBseSA8PT0KAAAAhwo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3VzYnBoeWNANWEwMDYwMDAvI3NpemUtY2VsbHMgPD09CgAAAAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2JwaHljQDVhMDA2MDAwLyNjbG9jay1jZWxscyA8PT0K
AAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3VzYnBoeWNANWEwMDYwMDAvcGhhbmRsZSA8
PT0KAAAAgwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3VzYnBoeWNANWEwMDYwMDAvcmVnIDw9
PQpaAGAAAAAQAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3VzYnBoeWNANWEwMDYwMDAvdXNi
LXBoeUAxL3N0LGVuYWJsZS1ocy1yZnRpbWUtcmVkdWN0aW9uIDw9PQoKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy91c2JwaHljQDVhMDA2MDAwL3VzYi1waHlAMS9zdCx0dW5lLWhzLXJ4LW9mZnNl
dCA8PT0KAAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3VzYnBoeWNANWEwMDYwMDAvdXNi
LXBoeUAxL3N0LGVuYWJsZS1mcy1yZnRpbWUtdHVuaW5nIDw9PQoKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy91c2JwaHljQDVhMDA2MDAwL3VzYi1waHlAMS9zdCx0dW5lLWhzLWRjLWxldmVsIDw9
PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdXNicGh5Y0A1YTAwNjAwMC91c2ItcGh5
QDEvcGh5LXN1cHBseSA8PT0KAAAAWwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3VzYnBoeWNA
NWEwMDYwMDAvdXNiLXBoeUAxL3BoYW5kbGUgPD09CgAAAFcKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy91c2JwaHljQDVhMDA2MDAwL3VzYi1waHlAMS9zdCxuby1sc2ZzLXNjIDw9PQoKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy91c2JwaHljQDVhMDA2MDAwL3VzYi1waHlAMS9yZWcgPD09CgAA
AAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2JwaHljQDVhMDA2MDAwL3VzYi1waHlAMS9z
dCx0dW5lLXNxdWVsY2gtbGV2ZWwgPD09CgAAAAMKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91
c2JwaHljQDVhMDA2MDAwL3VzYi1waHlAMS9zdCx0cmltLWhzLWN1cnJlbnQgPD09CgAAAA8KPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2JwaHljQDVhMDA2MDAwL3VzYi1waHlAMS9zdCx0cmlt
LWhzLWltcGVkYW5jZSA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3VzYnBoeWNA
NWEwMDYwMDAvdXNiLXBoeUAxLyNwaHktY2VsbHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy91c2JwaHljQDVhMDA2MDAwL3VzYi1waHlAMS9uYW1lIDw9PQp1c2ItcGh5AAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3VzYnBoeWNANWEwMDYwMDAvbmFtZSA8PT0KdXNicGh5YwAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwOTAwMC9wd20vY29tcGF0aWJsZSA8
PT0Kc3Qsc3RtMzItcHdtLWxwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA5
MDAwL3B3bS9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Rp
bWVyQDQwMDA5MDAwL3B3bS8jcHdtLWNlbGxzIDw9PQoAAAADCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvdGltZXJANDAwMDkwMDAvcHdtL25hbWUgPD09CnB3bQAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy90aW1lckA0MDAwOTAwMC9wb3dlci1kb21haW5zIDw9PQoAAAATCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDkwMDAvaW50ZXJydXB0cy1leHRlbmRlZCA8PT0KAAAA
EgAAAC8AAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDkwMDAvY29tcGF0
aWJsZSA8PT0Kc3Qsc3RtMzItbHB0aW1lcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1l
ckA0MDAwOTAwMC9jbG9ja3MgPD09CgAAAAwAAACPCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
dGltZXJANDAwMDkwMDAvd2FrZXVwLXNvdXJjZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvdGltZXJANDAwMDkwMDAvY2xvY2stbmFtZXMgPD09Cm11eAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy90aW1lckA0MDAwOTAwMC90cmlnZ2VyQDAvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzIt
bHB0aW1lci10cmlnZ2VyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA5MDAw
L3RyaWdnZXJAMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3RpbWVyQDQwMDA5MDAwL3RyaWdnZXJAMC9yZWcgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy90aW1lckA0MDAwOTAwMC90cmlnZ2VyQDAvbmFtZSA8PT0KdHJpZ2dlcgAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwOTAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA5MDAwLyNhZGRyZXNzLWNlbGxzIDw9
PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDkwMDAvI3NpemUtY2Vs
bHMgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwOTAwMC9waGFu
ZGxlIDw9PQoAAADDCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDkwMDAvdGlt
ZXIvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzItbHB0aW1lci10aW1lcgAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy90aW1lckA0MDAwOTAwMC90aW1lci9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA5MDAwL3RpbWVyL25hbWUgPD09CnRpbWVy
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA5MDAwL2NvdW50ZXIvY29tcGF0
aWJsZSA8PT0Kc3Qsc3RtMzItbHB0aW1lci1jb3VudGVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3RpbWVyQDQwMDA5MDAwL2NvdW50ZXIvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwOTAwMC9jb3VudGVyL25hbWUgPD09CmNvdW50ZXIA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDkwMDAvcmVnIDw9PQpAAJAAAAAE
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA5MDAwL25hbWUgPD09CnRpbWVy
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA2MDAwL3B3bS9jb21wYXRpYmxl
IDw9PQpzdCxzdG0zMi1wd20ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDYw
MDAvcHdtL3BpbmN0cmwtMSA8PT0KAAAAEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVy
QDQwMDA2MDAwL3B3bS9zdGF0dXMgPD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
dGltZXJANDAwMDYwMDAvcHdtL3BpbmN0cmwtMCA8PT0KAAAAEAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3RpbWVyQDQwMDA2MDAwL3B3bS8jcHdtLWNlbGxzIDw9PQoAAAADCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDYwMDAvcHdtL25hbWUgPD09CnB3bQAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwNjAwMC9wd20vcGluY3RybC1uYW1lcyA8PT0KZGVm
YXVsdABzbGVlcAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwNjAwMC9jb21w
YXRpYmxlIDw9PQpzdCxzdG0zMi10aW1lcnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGlt
ZXJANDAwMDYwMDAvY2xvY2tzIDw9PQoAAAAMAAAAywo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3RpbWVyQDQwMDA2MDAwL2Nsb2NrLW5hbWVzIDw9PQppbnQACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvdGltZXJANDAwMDYwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy90aW1lckA0MDAwNjAwMC8jYWRkcmVzcy1jZWxscyA8PT0KAAAAAQo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA2MDAwLyNzaXplLWNlbGxzIDw9PQoAAAAACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDYwMDAvcGhhbmRsZSA8PT0KAAAAwAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA2MDAwL3JlZyA8PT0KQABgAAAABAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwNjAwMC90aW1lckAxMS9jb21wYXRp
YmxlIDw9PQpzdCxzdG0zMmg3LXRpbWVyLXRyaWdnZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvdGltZXJANDAwMDYwMDAvdGltZXJAMTEvc3RhdHVzIDw9PQpva2F5AAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA2MDAwL3RpbWVyQDExL3JlZyA8PT0KAAAACwo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA2MDAwL3RpbWVyQDExL25hbWUgPD09CnRpbWVy
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA2MDAwL25hbWUgPD09CnRpbWVy
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3N5c2NvbkA1MDAyMDAwMC9jb21wYXRpYmxlIDw9
PQpzdCxzdG0zMm1wMTU3LXN5c2NmZwBzeXNjb24ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
c3lzY29uQDUwMDIwMDAwL2Nsb2NrcyA8PT0KAAAADAAAADMKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9zeXNjb25ANTAwMjAwMDAvcGhhbmRsZSA8PT0KAAAACwo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3N5c2NvbkA1MDAyMDAwMC9yZWcgPD09ClACAAAAAAQACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2Mvc3lzY29uQDUwMDIwMDAwL25hbWUgPD09CnN5c2NvbgAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9kbWEtY29udHJvbGxlckA0ODAwMDAwMC8jZG1hLWNlbGxzIDw9PQoAAAAECj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZG1hLWNvbnRyb2xsZXJANDgwMDAwMDAvY29tcGF0aWJs
ZSA8PT0Kc3Qsc3RtMzItZG1hAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2RtYS1jb250cm9s
bGVyQDQ4MDAwMDAwL2RtYS1yZXF1ZXN0cyA8PT0KAAAACAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL2RtYS1jb250cm9sbGVyQDQ4MDAwMDAwL2Nsb2NrcyA8PT0KAAAADAAAAEcKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9kbWEtY29udHJvbGxlckA0ODAwMDAwMC9yZXNldHMgPD09CgAAAAwA
AEzACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZG1hLWNvbnRyb2xsZXJANDgwMDAwMDAvaW50
ZXJydXB0cyA8PT0KAAAAAAAAAAsAAAAEAAAAAAAAAAwAAAAEAAAAAAAAAA0AAAAEAAAAAAAAAA4A
AAAEAAAAAAAAAA8AAAAEAAAAAAAAABAAAAAEAAAAAAAAABEAAAAEAAAAAAAAAC8AAAAECj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvZG1hLWNvbnRyb2xsZXJANDgwMDAwMDAvc3JhbSA8PT0KAAAA
Swo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2RtYS1jb250cm9sbGVyQDQ4MDAwMDAwL2RtYS1u
YW1lcyA8PT0KY2gwAGNoMQBjaDIAY2gzAGNoNABjaDUAY2g2AGNoNwAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9kbWEtY29udHJvbGxlckA0ODAwMDAwMC9waGFuZGxlIDw9PQoAAABMCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvZG1hLWNvbnRyb2xsZXJANDgwMDAwMDAvcmVnIDw9PQpIAAAA
AAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2RtYS1jb250cm9sbGVyQDQ4MDAwMDAwL2Rt
YXMgPD09CgAAAEoAAAAAAAAAAxIAAApIAAAIAAAAIAAAAAEAAABKAAAAAQAAAAMSAAAKSAAACAAA
CAAAAAABAAAASgAAAAIAAAADEgAACkgAAAgAIAAAAAAAAQAAAEoAAAADAAAAAxIAAApIAAAICAAA
AAAAAAEAAABKAAAABAAAAAMSAAAKSAAADAAAACAAAAABAAAASgAAAAUAAAADEgAACkgAAAwAAAgA
AAAAAQAAAEoAAAAGAAAAAxIAAApIAAAMACAAAAAAAAEAAABKAAAABwAAAAMSAAAKSAAADAgAAAAA
AAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZG1hLWNvbnRyb2xsZXJANDgwMDAwMDAvc3Qs
bWVtMm1lbSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZG1hLWNvbnRyb2xsZXJANDgw
MDAwMDAvbmFtZSA8PT0KZG1hLWNvbnRyb2xsZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
c2FpQDUwMDI3MDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyaDctc2FpAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3NhaUA1MDAyNzAwMC9jbG9ja3MgPD09CgAAAAwAAAAyAAAADAAAALsAAAAM
AAAAvAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA1MDAyNzAwMC9yZXNldHMgPD09CgAA
AAwAAEyICj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDUwMDI3MDAwL2Nsb2NrLW5hbWVz
IDw9PQpwY2xrAHg4awB4MTFrAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA1MDAyNzAw
MC9hdWRpby1jb250cm9sbGVyQDUwMDI3MDI0L2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLXNhaS1z
dWItYgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANTAwMjcwMDAvYXVkaW8tY29udHJv
bGxlckA1MDAyNzAyNC9jbG9ja3MgPD09CgAAAAwAAAChCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2Mvc2FpQDUwMDI3MDAwL2F1ZGlvLWNvbnRyb2xsZXJANTAwMjcwMjQvI3NvdW5kLWRhaS1jZWxs
cyA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA1MDAyNzAwMC9hdWRpby1j
b250cm9sbGVyQDUwMDI3MDI0L2Nsb2NrLW5hbWVzIDw9PQpzYWlfY2sACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2Mvc2FpQDUwMDI3MDAwL2F1ZGlvLWNvbnRyb2xsZXJANTAwMjcwMjQvc3RhdHVz
IDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANTAwMjcwMDAvYXVk
aW8tY29udHJvbGxlckA1MDAyNzAyNC9waGFuZGxlIDw9PQoAAAEDCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2Mvc2FpQDUwMDI3MDAwL2F1ZGlvLWNvbnRyb2xsZXJANTAwMjcwMjQvcmVnIDw9PQoA
AAAkAAAAIAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA1MDAyNzAwMC9hdWRpby1jb250
cm9sbGVyQDUwMDI3MDI0L2RtYXMgPD09CgAAAA8AAABkAAAEAAAAAAEKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9zYWlANTAwMjcwMDAvYXVkaW8tY29udHJvbGxlckA1MDAyNzAyNC9uYW1lIDw9
PQphdWRpby1jb250cm9sbGVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA1MDAyNzAw
MC9hdWRpby1jb250cm9sbGVyQDUwMDI3MDA0L2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLXNhaS1z
dWItYQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANTAwMjcwMDAvYXVkaW8tY29udHJv
bGxlckA1MDAyNzAwNC9jbG9ja3MgPD09CgAAAAwAAAChCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2Mvc2FpQDUwMDI3MDAwL2F1ZGlvLWNvbnRyb2xsZXJANTAwMjcwMDQvI3NvdW5kLWRhaS1jZWxs
cyA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA1MDAyNzAwMC9hdWRpby1j
b250cm9sbGVyQDUwMDI3MDA0L3BpbmN0cmwtMSA8PT0KAAAAYQo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3NhaUA1MDAyNzAwMC9hdWRpby1jb250cm9sbGVyQDUwMDI3MDA0L3BvcnQvZW5kcG9p
bnQvcmVtb3RlLWVuZHBvaW50IDw9PQoAAABiCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2Fp
QDUwMDI3MDAwL2F1ZGlvLWNvbnRyb2xsZXJANTAwMjcwMDQvcG9ydC9lbmRwb2ludC9waGFuZGxl
IDw9PQoAAACmCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDUwMDI3MDAwL2F1ZGlvLWNv
bnRyb2xsZXJANTAwMjcwMDQvcG9ydC9lbmRwb2ludC9uYW1lIDw9PQplbmRwb2ludAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9zYWlANTAwMjcwMDAvYXVkaW8tY29udHJvbGxlckA1MDAyNzAw
NC9wb3J0L3BoYW5kbGUgPD09CgAAAKoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANTAw
MjcwMDAvYXVkaW8tY29udHJvbGxlckA1MDAyNzAwNC9wb3J0L25hbWUgPD09CnBvcnQACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDUwMDI3MDAwL2F1ZGlvLWNvbnRyb2xsZXJANTAwMjcw
MDQvY2xvY2stbmFtZXMgPD09CnNhaV9jawAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlA
NTAwMjcwMDAvYXVkaW8tY29udHJvbGxlckA1MDAyNzAwNC9zdGF0dXMgPD09Cm9rYXkACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDUwMDI3MDAwL2F1ZGlvLWNvbnRyb2xsZXJANTAwMjcw
MDQvZG1hLW5hbWVzIDw9PQp0eAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANTAwMjcw
MDAvYXVkaW8tY29udHJvbGxlckA1MDAyNzAwNC9waGFuZGxlIDw9PQoAAAECCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2Mvc2FpQDUwMDI3MDAwL2F1ZGlvLWNvbnRyb2xsZXJANTAwMjcwMDQvcmVn
IDw9PQoAAAAEAAAAIAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA1MDAyNzAwMC9hdWRp
by1jb250cm9sbGVyQDUwMDI3MDA0L3BpbmN0cmwtMCA8PT0KAAAAYAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3NhaUA1MDAyNzAwMC9hdWRpby1jb250cm9sbGVyQDUwMDI3MDA0L2RtYXMgPD09
CgAAAA8AAABjAAAEAAAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANTAwMjcwMDAv
YXVkaW8tY29udHJvbGxlckA1MDAyNzAwNC9zdCxpZWM2MDk1OCA8PT0KCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2Mvc2FpQDUwMDI3MDAwL2F1ZGlvLWNvbnRyb2xsZXJANTAwMjcwMDQvbmFtZSA8
PT0KYXVkaW8tY29udHJvbGxlcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANTAwMjcw
MDAvYXVkaW8tY29udHJvbGxlckA1MDAyNzAwNC9waW5jdHJsLW5hbWVzIDw9PQpkZWZhdWx0AHNs
ZWVwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA1MDAyNzAwMC9yYW5nZXMgPD09CgAA
AABQAnAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA1MDAyNzAwMC9zdGF0dXMg
PD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDUwMDI3MDAwLyNhZGRyZXNz
LWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDUwMDI3MDAwL2lu
dGVycnVwdHMgPD09CgAAAAAAAACSAAAABAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA1
MDAyNzAwMC8jc2l6ZS1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Nh
aUA1MDAyNzAwMC9waGFuZGxlIDw9PQoAAAEBCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2Fp
QDUwMDI3MDAwL3JlZyA8PT0KUAJwAAAAAARQAnPwAAAAEAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3NhaUA1MDAyNzAwMC9uYW1lIDw9PQpzYWkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
aTJjQDVjMDA5MDAwL3Bvd2VyLWRvbWFpbnMgPD09CgAAABMKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9pMmNANWMwMDkwMDAvaW50ZXJydXB0cy1leHRlbmRlZCA8PT0KAAAAEgAAADYAAAAEAAAA
BwAAAAAAAACIAAAABAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwOTAwMC9jb21w
YXRpYmxlIDw9PQpzdCxzdG0zMm1wMTUtaTJjAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2ky
Y0A1YzAwOTAwMC9jbG9ja3MgPD09CgAAAAEAAAAOCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
aTJjQDVjMDA5MDAwL3N0LHN5c2NmZy1mbXAgPD09CgAAAAsAAAAEAAAAIAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL2kyY0A1YzAwOTAwMC9yZXNldHMgPD09CgAAAGkAAAACCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDA5MDAwL3dha2V1cC1zb3VyY2UgPD09Cgo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwOTAwMC9pMmMtYW5hbG9nLWZpbHRlciA8PT0KCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDA5MDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDA5MDAwLyNhZGRyZXNzLWNlbGxzIDw9PQoA
AAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDA5MDAwLyNzaXplLWNlbGxzIDw9
PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDA5MDAwL2RtYS1uYW1lcyA8
PT0KcngAdHgACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDA5MDAwL3BoYW5kbGUg
PD09CgAAAR8KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDkwMDAvcmVnIDw9PQpc
AJAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwOTAwMC9kbWFzIDw9PQoA
AABKAAAAJgAAAAAABAAIAAAAAAAAAAAAAAAAAAAASgAAACcAAAAAAAQAAgAAAAAAAAAAAAAAAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwOTAwMC9pbnRlcnJ1cHQtbmFtZXMgPD09
CmV2ZW50AGVycm9yAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwOTAwMC9uYW1l
IDw9PQppMmMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDMwMDAvcHdtL2Nv
bXBhdGlibGUgPD09CnN0LHN0bTMyLXB3bQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1l
ckA0MDAwMzAwMC9wd20vc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy90aW1lckA0MDAwMzAwMC9wd20vI3B3bS1jZWxscyA8PT0KAAAAAwo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAzMDAwL3B3bS9uYW1lIDw9PQpwd20ACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDMwMDAvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzItdGlt
ZXJzAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAzMDAwL2Nsb2NrcyA8PT0K
AAAADAAAAMgKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwMzAwMC9jbG9jay1u
YW1lcyA8PT0KaW50AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAzMDAwL3N0
YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDMw
MDAvI2FkZHJlc3MtY2VsbHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1l
ckA0MDAwMzAwMC90aW1lckA0L2NvbXBhdGlibGUgPD09CnN0LHN0bTMyaDctdGltZXItdHJpZ2dl
cgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwMzAwMC90aW1lckA0L3N0YXR1
cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDMwMDAv
dGltZXJANC9yZWcgPD09CgAAAAQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAw
MzAwMC90aW1lckA0L25hbWUgPD09CnRpbWVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Rp
bWVyQDQwMDAzMDAwLyNzaXplLWNlbGxzIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvdGltZXJANDAwMDMwMDAvZG1hLW5hbWVzIDw9PQpjaDEAY2gyAGNoMwBjaDQAdXAAdHJpZwAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwMzAwMC9waGFuZGxlIDw9PQoAAAC9
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDMwMDAvY291bnRlci9jb21wYXRp
YmxlIDw9PQpzdCxzdG0zMi10aW1lci1jb3VudGVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3RpbWVyQDQwMDAzMDAwL2NvdW50ZXIvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy90aW1lckA0MDAwMzAwMC9jb3VudGVyL25hbWUgPD09CmNvdW50ZXIACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDMwMDAvcmVnIDw9PQpAADAAAAAEAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAzMDAwL2RtYXMgPD09CgAAAA8AAAA3
AAAEAIAAAAEAAAAPAAAAOAAABACAAAABAAAADwAAADkAAAQAgAAAAQAAAA8AAAA6AAAEAIAAAAEA
AAAPAAAAOwAABACAAAABAAAADwAAADwAAAQAgAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3RpbWVyQDQwMDAzMDAwL25hbWUgPD09CnRpbWVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2RtYS1yb3V0ZXJANDgwMDIwMDAvI2RtYS1jZWxscyA8PT0KAAAAAwo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2RtYS1yb3V0ZXJANDgwMDIwMDAvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzJoNy1k
bWFtdXgACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZG1hLXJvdXRlckA0ODAwMjAwMC9kbWEt
cmVxdWVzdHMgPD09CgAAAIAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kbWEtcm91dGVyQDQ4
MDAyMDAwL2Nsb2NrcyA8PT0KAAAADAAAAEkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kbWEt
cm91dGVyQDQ4MDAyMDAwL3Jlc2V0cyA8PT0KAAAADAAATMIKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9kbWEtcm91dGVyQDQ4MDAyMDAwL2RtYS1jaGFubmVscyA8PT0KAAAAEAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL2RtYS1yb3V0ZXJANDgwMDIwMDAvZG1hLW1hc3RlcnMgPD09CgAAAEwA
AABNCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZG1hLXJvdXRlckA0ODAwMjAwMC9waGFuZGxl
IDw9PQoAAAAPCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZG1hLXJvdXRlckA0ODAwMjAwMC9y
ZWcgPD09CkgAIAAAAABACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZG1hLXJvdXRlckA0ODAw
MjAwMC9uYW1lIDw9PQpkbWEtcm91dGVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVy
QDQwMDAwMDAwL3B3bS9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMi1wd20ACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvdGltZXJANDAwMDAwMDAvcHdtL3BpbmN0cmwtMSA8PT0KAAAADgo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAwMDAwL3B3bS9zdGF0dXMgPD09Cm9rYXkACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDAwMDAvcHdtL3BpbmN0cmwtMCA8PT0K
AAAADQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAwMDAwL3B3bS8jcHdtLWNl
bGxzIDw9PQoAAAADCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDAwMDAvcHdt
L25hbWUgPD09CnB3bQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwMDAwMC9w
d20vcGluY3RybC1uYW1lcyA8PT0KZGVmYXVsdABzbGVlcAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy90aW1lckA0MDAwMDAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMi10aW1lcnMACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDAwMDAvY2xvY2tzIDw9PQoAAAAMAAAAxQo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAwMDAwL3RpbWVyQDEvY29tcGF0aWJs
ZSA8PT0Kc3Qsc3RtMzJoNy10aW1lci10cmlnZ2VyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3RpbWVyQDQwMDAwMDAwL3RpbWVyQDEvc3RhdHVzIDw9PQpva2F5AAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3RpbWVyQDQwMDAwMDAwL3RpbWVyQDEvcmVnIDw9PQoAAAABCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDAwMDAvdGltZXJAMS9uYW1lIDw9PQp0aW1lcgAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwMDAwMC9jbG9jay1uYW1lcyA8PT0KaW50
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAwMDAwL3N0YXR1cyA8PT0KZGlz
YWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDAwMDAvI2FkZHJlc3Mt
Y2VsbHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwMDAwMC8j
c2l6ZS1jZWxscyA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAw
MDAwL3BoYW5kbGUgPD09CgAAALoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAw
MDAwMC9jb3VudGVyL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLXRpbWVyLWNvdW50ZXIACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDAwMDAvY291bnRlci9zdGF0dXMgPD09CmRp
c2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAwMDAwL2NvdW50ZXIv
bmFtZSA8PT0KY291bnRlcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwMDAw
MC9yZWcgPD09CkAAAAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDAw
MDAvbmFtZSA8PT0KdGltZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjQw
MDAvcHdtL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLXB3bS1scAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy90aW1lckA1MDAyNDAwMC9wd20vc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy90aW1lckA1MDAyNDAwMC9wd20vI3B3bS1jZWxscyA8PT0KAAAAAwo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDUwMDI0MDAwL3B3bS9uYW1lIDw9PQpwd20A
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjQwMDAvcG93ZXItZG9tYWlucyA8
PT0KAAAAEwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDUwMDI0MDAwL2ludGVycnVw
dHMtZXh0ZW5kZWQgPD09CgAAABIAAAA1AAAABAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Rp
bWVyQDUwMDI0MDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLWxwdGltZXIACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjQwMDAvY2xvY2tzIDw9PQoAAAAMAAAAkwo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDUwMDI0MDAwL3dha2V1cC1zb3VyY2UgPD09Cgo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDUwMDI0MDAwL2Nsb2NrLW5hbWVzIDw9PQptdXgA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjQwMDAvc3RhdHVzIDw9PQpkaXNh
YmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA1MDAyNDAwMC9waGFuZGxlIDw9
PQoAAAD/Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjQwMDAvdGltZXIvY29t
cGF0aWJsZSA8PT0Kc3Qsc3RtMzItbHB0aW1lci10aW1lcgAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy90aW1lckA1MDAyNDAwMC90aW1lci9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3RpbWVyQDUwMDI0MDAwL3RpbWVyL25hbWUgPD09CnRpbWVyAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDUwMDI0MDAwL3JlZyA8PT0KUAJAAAAABAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA1MDAyNDAwMC9uYW1lIDw9PQp0aW1lcgAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwNzAwMC9wd20vY29tcGF0aWJsZSA8PT0K
c3Qsc3RtMzItcHdtAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDA3MDAwL3B3
bS9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0
MDA3MDAwL3B3bS8jcHdtLWNlbGxzIDw9PQoAAAADCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
dGltZXJANDQwMDcwMDAvcHdtL25hbWUgPD09CnB3bQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy90aW1lckA0NDAwNzAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMi10aW1lcnMACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDcwMDAvY2xvY2tzIDw9PQoAAAAMAAAA0Qo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDA3MDAwL2Nsb2NrLW5hbWVzIDw9PQppbnQA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDcwMDAvc3RhdHVzIDw9PQpkaXNh
YmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwNzAwMC8jYWRkcmVzcy1j
ZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDA3MDAwLyNz
aXplLWNlbGxzIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDcw
MDAvZG1hLW5hbWVzIDw9PQpjaDEAdXAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJA
NDQwMDcwMDAvdGltZXJAMTUvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzJoNy10aW1lci10cmlnZ2Vy
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDA3MDAwL3RpbWVyQDE1L3N0YXR1
cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDcwMDAv
dGltZXJAMTUvcmVnIDw9PQoAAAAPCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQw
MDcwMDAvdGltZXJAMTUvbmFtZSA8PT0KdGltZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
dGltZXJANDQwMDcwMDAvcGhhbmRsZSA8PT0KAAAA5Ao9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3RpbWVyQDQ0MDA3MDAwL3JlZyA8PT0KRABwAAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy90aW1lckA0NDAwNzAwMC9kbWFzIDw9PQoAAAAPAAAAbQAABACAAAABAAAADwAAAG4AAAQAgAAA
AQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDA3MDAwL25hbWUgPD09CnRpbWVy
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDUwMDIxMDAwL3B3bS9jb21wYXRpYmxl
IDw9PQpzdCxzdG0zMi1wd20tbHAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAw
MjEwMDAvcHdtL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
dGltZXJANTAwMjEwMDAvcHdtLyNwd20tY2VsbHMgPD09CgAAAAMKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy90aW1lckA1MDAyMTAwMC9wd20vbmFtZSA8PT0KcHdtAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3RpbWVyQDUwMDIxMDAwL3Bvd2VyLWRvbWFpbnMgPD09CgAAABMKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy90aW1lckA1MDAyMTAwMC9pbnRlcnJ1cHRzLWV4dGVuZGVkIDw9PQoA
AAASAAAAMAAAAAQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA1MDAyMTAwMC9jb21w
YXRpYmxlIDw9PQpzdCxzdG0zMi1scHRpbWVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Rp
bWVyQDUwMDIxMDAwL2Nsb2NrcyA8PT0KAAAADAAAAJAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy90aW1lckA1MDAyMTAwMC93YWtldXAtc291cmNlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy90aW1lckA1MDAyMTAwMC9jbG9jay1uYW1lcyA8PT0KbXV4AAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3RpbWVyQDUwMDIxMDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjEwMDAvI2FkZHJlc3MtY2VsbHMgPD09CgAAAAEKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA1MDAyMTAwMC8jc2l6ZS1jZWxscyA8PT0KAAAA
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDUwMDIxMDAwL3BoYW5kbGUgPD09CgAA
APwKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA1MDAyMTAwMC90aW1lci9jb21wYXRp
YmxlIDw9PQpzdCxzdG0zMi1scHRpbWVyLXRpbWVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3RpbWVyQDUwMDIxMDAwL3RpbWVyL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvdGltZXJANTAwMjEwMDAvdGltZXIvbmFtZSA8PT0KdGltZXIACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjEwMDAvY291bnRlci9jb21wYXRpYmxlIDw9PQpz
dCxzdG0zMi1scHRpbWVyLWNvdW50ZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJA
NTAwMjEwMDAvY291bnRlci9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3RpbWVyQDUwMDIxMDAwL2NvdW50ZXIvbmFtZSA8PT0KY291bnRlcgAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy90aW1lckA1MDAyMTAwMC9yZWcgPD09ClACEAAAAAQACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjEwMDAvdHJpZ2dlckAxL2NvbXBhdGlibGUgPD09
CnN0LHN0bTMyLWxwdGltZXItdHJpZ2dlcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1l
ckA1MDAyMTAwMC90cmlnZ2VyQDEvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy90aW1lckA1MDAyMTAwMC90cmlnZ2VyQDEvcmVnIDw9PQoAAAABCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjEwMDAvdHJpZ2dlckAxL25hbWUgPD09CnRyaWdn
ZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjEwMDAvbmFtZSA8PT0KdGlt
ZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDE1MDAwL3Bvd2VyLWRvbWFpbnMg
PD09CgAAABMKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTUwMDAvaW50ZXJydXB0
cy1leHRlbmRlZCA8PT0KAAAAEgAAABkAAAAEAAAABwAAAAAAAABsAAAABAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL2kyY0A0MDAxNTAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMm1wMTUtaTJj
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxNTAwMC9jbG9ja3MgPD09CgAAAAwA
AACNCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDE1MDAwL3N0LHN5c2NmZy1mbXAg
PD09CgAAAAsAAAAEAAAAEAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxNTAwMC9y
ZXNldHMgPD09CgAAAAwAAEwYCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDE1MDAw
L3dha2V1cC1zb3VyY2UgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxNTAw
MC9pMmMtYW5hbG9nLWZpbHRlciA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQw
MDE1MDAwL3BpbmN0cmwtMSA8PT0KAAAALQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0
MDAxNTAwMC9pMmMtc2NsLWZhbGxpbmctdGltZS1ucyA8PT0KAAAAFAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2kyY0A0MDAxNTAwMC9zdGF0dXMgPD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvaTJjQDQwMDE1MDAwLyNhZGRyZXNzLWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDE1MDAwLyNzaXplLWNlbGxzIDw9PQoAAAAACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDE1MDAwL3BoYW5kbGUgPD09CgAAANYKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9pMmNANDAwMTUwMDAvcmVnIDw9PQpAAVAAAAAEAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxNTAwMC9waW5jdHJsLTAgPD09CgAAACwKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9pMmNANDAwMTUwMDAvaTJjLXNjbC1yaXNpbmctdGltZS1ucyA8PT0K
AAAAuQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxNTAwMC9pbnRlcnJ1cHQtbmFt
ZXMgPD09CmV2ZW50AGVycm9yAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxNTAw
MC9uYW1lIDw9PQppMmMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDE1MDAwL3Bp
bmN0cmwtbmFtZXMgPD09CmRlZmF1bHQAc2xlZXAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
dGltZXJANDQwMDEwMDAvcHdtL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLXB3bQAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwMTAwMC9wd20vcGluY3RybC0xIDw9PQoAAAAzCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDEwMDAvcHdtL3N0YXR1cyA8PT0Kb2th
eQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwMTAwMC9wd20vcGluY3RybC0w
IDw9PQoAAAAyCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDEwMDAvcHdtLyNw
d20tY2VsbHMgPD09CgAAAAMKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwMTAw
MC9wd20vbmFtZSA8PT0KcHdtAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDAx
MDAwL3B3bS9waW5jdHJsLW5hbWVzIDw9PQpkZWZhdWx0AHNsZWVwAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3RpbWVyQDQ0MDAxMDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLXRpbWVycwAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwMTAwMC9jbG9ja3MgPD09CgAAAAwA
AADPCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDEwMDAvY2xvY2stbmFtZXMg
PD09CmludAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwMTAwMC9zdGF0dXMg
PD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDAxMDAwLyNh
ZGRyZXNzLWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQw
MDEwMDAvI3NpemUtY2VsbHMgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1l
ckA0NDAwMTAwMC9waGFuZGxlIDw9PQoAAADeCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGlt
ZXJANDQwMDEwMDAvY291bnRlci9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMi10aW1lci1jb3VudGVy
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDAxMDAwL2NvdW50ZXIvc3RhdHVz
IDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwMTAwMC9j
b3VudGVyL25hbWUgPD09CmNvdW50ZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJA
NDQwMDEwMDAvcmVnIDw9PQpEABAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVy
QDQ0MDAxMDAwL3RpbWVyQDcvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzJoNy10aW1lci10cmlnZ2Vy
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDAxMDAwL3RpbWVyQDcvc3RhdHVz
IDw9PQpva2F5AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDAxMDAwL3RpbWVy
QDcvcmVnIDw9PQoAAAAHCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDEwMDAv
dGltZXJANy9uYW1lIDw9PQp0aW1lcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0
NDAwMTAwMC9uYW1lIDw9PQp0aW1lcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kY21pQDRj
MDA2MDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLWRjbWkACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvZGNtaUA0YzAwNjAwMC9jbG9ja3MgPD09CgAAAAwAAABNCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvZGNtaUA0YzAwNjAwMC9yZXNldHMgPD09CgAAAAwAAE0ACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvZGNtaUA0YzAwNjAwMC9waW5jdHJsLTEgPD09CgAAAFkKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9kY21pQDRjMDA2MDAwL3BvcnQvZW5kcG9pbnQvaHN5bmMtYWN0aXZlIDw9
PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGNtaUA0YzAwNjAwMC9wb3J0L2VuZHBv
aW50L3ZzeW5jLWFjdGl2ZSA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2RjbWlA
NGMwMDYwMDAvcG9ydC9lbmRwb2ludC9yZW1vdGUtZW5kcG9pbnQgPD09CgAAAFoKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9kY21pQDRjMDA2MDAwL3BvcnQvZW5kcG9pbnQvcGNsay1tYXgtZnJl
cXVlbmN5IDw9PQoElu1ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGNtaUA0YzAwNjAwMC9w
b3J0L2VuZHBvaW50L2J1cy13aWR0aCA8PT0KAAAACAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2RjbWlANGMwMDYwMDAvcG9ydC9lbmRwb2ludC9wY2xrLXNhbXBsZSA8PT0KAAAAAQo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL2RjbWlANGMwMDYwMDAvcG9ydC9lbmRwb2ludC9waGFuZGxlIDw9
PQoAAAAnCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGNtaUA0YzAwNjAwMC9wb3J0L2VuZHBv
aW50L25hbWUgPD09CmVuZHBvaW50AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2RjbWlANGMw
MDYwMDAvcG9ydC9lbmRwb2ludC9idXMtdHlwZSA8PT0KAAAABQo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL2RjbWlANGMwMDYwMDAvcG9ydC9uYW1lIDw9PQpwb3J0AAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2RjbWlANGMwMDYwMDAvY2xvY2stbmFtZXMgPD09Cm1jbGsACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvZGNtaUA0YzAwNjAwMC9zdGF0dXMgPD09Cm9rYXkACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvZGNtaUA0YzAwNjAwMC9pbnRlcnJ1cHRzIDw9PQoAAAAAAAAATgAAAAQK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kY21pQDRjMDA2MDAwL2RtYS1uYW1lcyA8PT0KdHgA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGNtaUA0YzAwNjAwMC9waGFuZGxlIDw9PQoAAAD6
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGNtaUA0YzAwNjAwMC9yZWcgPD09CkwAYAAAAAQA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGNtaUA0YzAwNjAwMC9waW5jdHJsLTAgPD09CgAA
AFgKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kY21pQDRjMDA2MDAwL2RtYXMgPD09CgAAAA8A
AABLAAAEAOAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kY21pQDRjMDA2MDAwL25hbWUg
PD09CmRjbWkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGNtaUA0YzAwNjAwMC9waW5jdHJs
LW5hbWVzIDw9PQpkZWZhdWx0AHNsZWVwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0
MDAxMjAwMC9wb3dlci1kb21haW5zIDw9PQoAAAATCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
aTJjQDQwMDEyMDAwL2ludGVycnVwdHMtZXh0ZW5kZWQgPD09CgAAABIAAAAVAAAABAAAAAcAAAAA
AAAAIAAAAAQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTIwMDAvY29tcGF0aWJs
ZSA8PT0Kc3Qsc3RtMzJtcDE1LWkyYwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAw
MTIwMDAvY2xvY2tzIDw9PQoAAAAMAAAAiQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0
MDAxMjAwMC9zdCxzeXNjZmctZm1wIDw9PQoAAAALAAAABAAAAAEKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9pMmNANDAwMTIwMDAvcmVzZXRzIDw9PQoAAAAMAABMFQo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2kyY0A0MDAxMjAwMC93YWtldXAtc291cmNlIDw9PQoKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9pMmNANDAwMTIwMDAvaTJjLWFuYWxvZy1maWx0ZXIgPD09Cgo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMjAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMjAwMC8jYWRkcmVzcy1jZWxscyA8PT0KAAAAAQo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMjAwMC8jc2l6ZS1jZWxscyA8PT0KAAAA
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMjAwMC9kbWEtbmFtZXMgPD09CnJ4
AHR4AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxMjAwMC9waGFuZGxlIDw9PQoA
AADNCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDEyMDAwL3JlZyA8PT0KQAEgAAAA
BAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTIwMDAvZG1hcyA8PT0KAAAADwAA
ACEAAAQAgAAAAQAAAA8AAAAiAAAEAIAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNA
NDAwMTIwMDAvaW50ZXJydXB0LW5hbWVzIDw9PQpldmVudABlcnJvcgAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9pMmNANDAwMTIwMDAvbmFtZSA8PT0KaTJjAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2hkcDYtMC9waW5zL3Bpbm11eCA8PT0KAACl
Awo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2hkcDYt
MC9waW5zL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvaGRwNi0wL3BpbnMvc2xldy1yYXRlIDw9PQoAAAACCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaGRwNi0wL3BpbnMvbmFt
ZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9oZHA2LTAvcGlucy9kcml2ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2hkcDYtMC9waGFuZGxlIDw9PQoAAABkCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaGRwNi0wL25h
bWUgPD09CmhkcDYtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9pMnMyLXNsZWVwLTAvcGlucy9waW5tdXggPD09CgAAgxEAABkRAAAJEQo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyczItc2xlZXAtMC9w
aW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvaTJzMi1zbGVlcC0wL3BoYW5kbGUgPD09CgAAAUAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMnMyLXNsZWVwLTAvbmFtZSA8PT0K
aTJzMi1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL2NlYy0wL3BpbnMvZHJpdmUtb3Blbi1kcmFpbiA8PT0KCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvY2VjLTAvcGlucy9waW5tdXggPD09CgAA
DwUKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9jZWMt
MC9waW5zL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvY2VjLTAvcGlucy9zbGV3LXJhdGUgPD09CgAAAAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9jZWMtMC9waW5zL25hbWUg
PD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvY2VjLTAvcGhhbmRsZSA8PT0KAAAALgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL2NlYy0wL25hbWUgPD09CmNlYy0wAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTEyLXNsZWVwLTAvcGlucy9waW5t
dXggPD09CgAAdhEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9wd20xMi1zbGVlcC0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd20xMi1zbGVlcC0wL3BoYW5kbGUgPD09
CgAAABEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9w
d20xMi1zbGVlcC0wL25hbWUgPD09CnB3bTEyLXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDQtMS9waW5zMS9waW5tdXggPD09CgAA
MQkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0
NC0xL3BpbnMxL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDQtMS9waW5zMS9zbGV3LXJhdGUgPD09CgAAAAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0NC0xL3Bp
bnMxL25hbWUgPD09CnBpbnMxAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3VhcnQ0LTEvcGluczEvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0NC0xL3BoYW5kbGUg
PD09CgAAAXkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC91YXJ0NC0xL3BpbnMyL3Bpbm11eCA8PT0KAAASCQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VhcnQ0LTEvcGluczIvYmlhcy1kaXNhYmxlIDw9PQoK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0NC0x
L3BpbnMyL25hbWUgPD09CnBpbnMyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL3VhcnQ0LTEvbmFtZSA8PT0KdWFydDQtMQAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2JvdGctaHMtMC9waW5zL3Bpbm11
eCA8PT0KAAAKEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL3VzYm90Zy1ocy0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2JvdGctaHMtMC9waGFuZGxlIDw9PQoAAABW
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNib3Rn
LWhzLTAvbmFtZSA8PT0KdXNib3RnLWhzLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMxLWI0LTAvcGluczEvcGlubXV4IDw9PQoAACgNAAAp
DQAAKg0AACsNAAAyDQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3NkbW1jMS1iNC0wL3BpbnMxL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMxLWI0LTAvcGluczEvc2xl
dy1yYXRlIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvc2RtbWMxLWI0LTAvcGluczEvbmFtZSA8PT0KcGluczEACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMxLWI0LTAvcGluczEvZHJp
dmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9zZG1tYzEtYjQtMC9waGFuZGxlIDw9PQoAAAByCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMxLWI0LTAvcGluczIvcGlubXV4
IDw9PQoAACwNCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvc2RtbWMxLWI0LTAvcGluczIvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzEtYjQtMC9waW5zMi9zbGV3LXJh
dGUgPD09CgAAAAIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9zZG1tYzEtYjQtMC9waW5zMi9uYW1lIDw9PQpwaW5zMgAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzEtYjQtMC9waW5zMi9kcml2ZS1w
dXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3NkbW1jMS1iNC0wL25hbWUgPD09CnNkbW1jMS1iNC0wAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL20tY2FuMS0xL3BpbnMxL3Bpbm11eCA8
PT0KAAAMCgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L20tY2FuMS0xL3BpbnMxL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbS1jYW4xLTEvcGluczEvc2xldy1yYXRlIDw9PQoA
AAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbS1j
YW4xLTEvcGluczEvbmFtZSA8PT0KcGluczEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvbS1jYW4xLTEvcGluczEvZHJpdmUtcHVzaC1wdWxsIDw9PQoK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tLWNhbjEt
MS9waGFuZGxlIDw9PQoAAAFJCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvbS1jYW4xLTEvcGluczIvcGlubXV4IDw9PQoAAAsKCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbS1jYW4xLTEvcGluczIvYmlhcy1k
aXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9tLWNhbjEtMS9waW5zMi9uYW1lIDw9PQpwaW5zMgAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tLWNhbjEtMS9uYW1lIDw9PQptLWNhbjEtMQAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDIt
c2xlZXAtMi9waW5zL3Bpbm11eCA8PT0KAAA1EQAANBEAADYRAAAzEQo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0Mi1zbGVlcC0yL3BpbnMvbmFt
ZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC91c2FydDItc2xlZXAtMi9waGFuZGxlIDw9PQoAAAGICj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQyLXNsZWVwLTIvbmFtZSA8PT0KdXNh
cnQyLXNsZWVwLTIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvaTJzMi0wL3BpbnMvcGlubXV4IDw9PQoAAIMGAAAZBgAACQYKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMnMyLTAvcGlucy9iaWFzLWRpc2Fi
bGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L2kyczItMC9waW5zL3NsZXctcmF0ZSA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyczItMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaTJzMi0wL3BpbnMv
ZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9pMnMyLTAvcGhhbmRsZSA8PT0KAAABPwo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyczItMC9uYW1lIDw9PQppMnMyLTAACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMxLWRp
ci1pbml0LTAvcGluczEvcGlubXV4IDw9PQoAAFIMAAAnCQAAGQwKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzEtZGlyLWluaXQtMC9waW5zMS9z
bGV3LXJhdGUgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9zZG1tYzEtZGlyLWluaXQtMC9waW5zMS9iaWFzLXB1bGwtdXAgPD09Cgo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1kaXIt
aW5pdC0wL3BpbnMxL25hbWUgPD09CnBpbnMxAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1kaXItaW5pdC0wL3BpbnMxL2RyaXZlLXB1c2gt
cHVsbCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvc2RtbWMxLWRpci1pbml0LTAvcGhhbmRsZSA8PT0KAAABZAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1kaXItaW5pdC0wL25hbWUgPD09
CnNkbW1jMS1kaXItaW5pdC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL200LWFkYzEyLWFpbi0wL3BpbnMvcGlubXV4IDw9PQoAACMSAABcEgAAXRIA
AF4SCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQt
YWRjMTItYWluLTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LWFkYzEyLWFpbi0wL3BoYW5kbGUgPD09CgAAAY8K
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1hZGMx
Mi1haW4tMC9uYW1lIDw9PQptNC1hZGMxMi1haW4tMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1wd201LTAvcGlucy9waW5tdXggPD09CgAAexIK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1wd201
LTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL200LXB3bTUtMC9waGFuZGxlIDw9PQoAAAGqCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtcHdtNS0wL25hbWUgPD09Cm00
LXB3bTUtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9yZ21paS0xL3BpbnMzL3Bpbm11eCA8PT0KAAAkDAAAJQwAAHYMAAB3DAAAAQwAAAcMCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMS9waW5z
My9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3JnbWlpLTEvcGluczMvbmFtZSA8PT0KcGluczMACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMS9waW5zMS9waW5tdXgg
PD09CgAAZQwAAGQMAABtDAAAbgwAACIMAABCDAAAGwwAACEMCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMS9waW5zMS9iaWFzLWRpc2FibGUg
PD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3Jn
bWlpLTEvcGluczEvc2xldy1yYXRlIDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMS9waW5zMS9uYW1lIDw9PQpwaW5zMQAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9yZ21paS0xL3Bp
bnMxL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMS9waGFuZGxlIDw9PQoAAAEtCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMS9waW5zMi9waW5tdXgg
PD09CgAAAgwKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9yZ21paS0xL3BpbnMyL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMS9waW5zMi9zbGV3LXJhdGUgPD09CgAA
AAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9yZ21p
aS0xL3BpbnMyL25hbWUgPD09CnBpbnMyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL3JnbWlpLTEvcGluczIvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9yZ21paS0xL25h
bWUgPD09CnJnbWlpLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvc2RtbWMzLWI0LXNsZWVwLTEvcGlucy9waW5tdXggPD09CgAAUBEAAFQRAAA1EQAA
NxEAAG8RAAAwEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL3NkbW1jMy1iNC1zbGVlcC0xL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzMtYjQtc2xlZXAtMS9waGFu
ZGxlIDw9PQoAAAFxCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvc2RtbWMzLWI0LXNsZWVwLTEvbmFtZSA8PT0Kc2RtbWMzLWI0LXNsZWVwLTEACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaTJjMS0wL3BpbnMv
ZHJpdmUtb3Blbi1kcmFpbiA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvaTJjMS0wL3BpbnMvcGlubXV4IDw9PQoAADwGAABfBgo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzEtMC9waW5zL2JpYXMt
ZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvaTJjMS0wL3BpbnMvc2xldy1yYXRlIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaTJjMS0wL3BpbnMvbmFtZSA8PT0KcGlucwAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmMxLTAv
cGhhbmRsZSA8PT0KAAABNQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL2kyYzEtMC9uYW1lIDw9PQppMmMxLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZm1jLTAvcGluczEvcGlubXV4IDw9PQoAADQNAAA1
DQAAOw0AADwNAAA+DQAAPw0AADANAAAxDQAARw0AAEgNAABJDQAASg0AAGkNCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZm1jLTAvcGluczEvYmlhcy1k
aXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9mbWMtMC9waW5zMS9zbGV3LXJhdGUgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9mbWMtMC9waW5zMS9uYW1lIDw9PQpwaW5zMQAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9mbWMtMC9w
aW5zMS9kcml2ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL2ZtYy0wL3BoYW5kbGUgPD09CgAAAGoKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9mbWMtMC9waW5zMi9waW5tdXggPD09
CgAANg0KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9m
bWMtMC9waW5zMi9iaWFzLXB1bGwtdXAgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL2ZtYy0wL3BpbnMyL25hbWUgPD09CnBpbnMyAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2ZtYy0wL25hbWUgPD09
CmZtYy0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L200LWRjbWktMC9waW5zL3Bpbm11eCA8PT0KAAB4EgAAFxIAAAYSAAB5EgAAehIAAHsSAAB8EgAA
fhIAAIQSAAAYEgAARhIAAIESAAB3EgAAgxIAAH8SCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtZGNtaS0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1kY21pLTAv
cGhhbmRsZSA8PT0KAAABlQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL200LWRjbWktMC9uYW1lIDw9PQptNC1kY21pLTAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzJt
cDE1Ny1waW5jdHJsAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL2x0ZGMtc2xlZXAtMS9waW5zL3Bpbm11eCA8PT0KAACOEQAAjBEAAI0RAACnEQAAjxEA
AJARAACREQAAkhEAAJMRAACUEQAAlREAAJYRAACXEQAAmBEAAJkRAACaEQAAmxEAAKARAAChEQAA
ohEAAJwRAACdEQAAnhEAAJ8RAACjEQAApBEAAKURAACmEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2x0ZGMtc2xlZXAtMS9waW5zL25hbWUgPD09CnBp
bnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbHRk
Yy1zbGVlcC0xL3BoYW5kbGUgPD09CgAAAUQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9sdGRjLXNsZWVwLTEvbmFtZSA8PT0KbHRkYy1zbGVlcC0xAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3FzcGktYmsy
LXNsZWVwLTAvcGlucy9waW5tdXggPD09CgAAchEAAHMRAABqEQAAZxEAACARCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcXNwaS1iazItc2xlZXAtMC9w
aW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvcXNwaS1iazItc2xlZXAtMC9waGFuZGxlIDw9PQoAAABxCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcXNwaS1iazItc2xlZXAtMC9u
YW1lIDw9PQpxc3BpLWJrMi1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL3NhaTRhLTAvcGlucy9waW5tdXggPD09CgAAFQsKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWk0YS0wL3BpbnMvYmlh
cy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9zYWk0YS0wL3BpbnMvc2xldy1yYXRlIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpNGEtMC9waW5zL25hbWUgPD09CnBp
bnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2Fp
NGEtMC9waW5zL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpNGEtMC9waGFuZGxlIDw9PQoAAABgCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpNGEtMC9uYW1lIDw9
PQpzYWk0YS0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL2x0ZGMtMS9waW5zL3Bpbm11eCA8PT0KAACODwAAjA8AAI0PAACnDwAAjw8AAJAPAACRDwAA
kg8AAJMPAACUDwAAlQ8AAJYPAACXDwAAmA8AAJkPAACaDwAAmw8AAKAPAAChDwAAog8AAJwPAACd
DwAAng8AAJ8PAACjDwAApA8AAKUPAACmDwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL2x0ZGMtMS9waW5zL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbHRkYy0xL3BpbnMvc2xl
dy1yYXRlIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvbHRkYy0xL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9sdGRjLTEvcGlucy9kcml2ZS1wdXNoLXB1bGwg
PD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2x0
ZGMtMS9waGFuZGxlIDw9PQoAAAFDCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvbHRkYy0xL25hbWUgPD09Cmx0ZGMtMQAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmM1LXNsZWVwLTAvcGlucy9waW5tdXgg
PD09CgAACxEAAAwRCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvaTJjNS1zbGVlcC0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmM1LXNsZWVwLTAvcGhhbmRsZSA8PT0K
AAAALQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2ky
YzUtc2xlZXAtMC9uYW1lIDw9PQppMmM1LXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaTJjMi1zbGVlcC0yL3BpbnMvcGlubXV4IDw9PQoA
AFERAAB1EQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L2kyYzItc2xlZXAtMi9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaTJjMi1zbGVlcC0yL3BoYW5kbGUgPD09CgAAATwK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmMyLXNs
ZWVwLTIvbmFtZSA8PT0KaTJjMi1zbGVlcC0yAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL200LXNkbW1jMi1kNDctMC9waW5zL3Bpbm11eCA8PT0KAAAI
EgAACRIAAEUSAAAzEgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL200LXNkbW1jMi1kNDctMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc2RtbWMyLWQ0Ny0wL3BoYW5k
bGUgPD09CgAAAbkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9tNC1zZG1tYzItZDQ3LTAvbmFtZSA8PT0KbTQtc2RtbWMyLWQ0Ny0wAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2FkYzEyLXVzYi1jYy1waW5z
LTAvcGlucy9waW5tdXggPD09CgAABBEAAAURCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvYWRjMTItdXNiLWNjLXBpbnMtMC9waW5zL25hbWUgPD09CnBp
bnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvYWRj
MTItdXNiLWNjLXBpbnMtMC9waGFuZGxlIDw9PQoAAAEnCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvYWRjMTItdXNiLWNjLXBpbnMtMC9uYW1lIDw9PQph
ZGMxMi11c2ItY2MtcGlucy0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3VhcnQ3LTEvcGluczEvcGlubXV4IDw9PQoAAFcICj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDctMS9waW5zMS9iaWFzLWRp
c2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL3VhcnQ3LTEvcGluczEvc2xldy1yYXRlIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDctMS9waW5zMS9uYW1lIDw9PQpwaW5z
MQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0
Ny0xL3BpbnMxL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDctMS9waGFuZGxlIDw9PQoAAAF8Cj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDctMS9waW5zMi9w
aW5tdXggPD09CgAAVggKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC91YXJ0Ny0xL3BpbnMyL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDctMS9waW5zMi9uYW1lIDw9PQpw
aW5zMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91
YXJ0Ny0xL25hbWUgPD09CnVhcnQ3LTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvbTQtc2RtbWMyLWI0LTEvcGlucy9waW5tdXggPD09CgAAHhIAAB8S
AAATEgAAFBIAAGYSAABDEgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL200LXNkbW1jMi1iNC0xL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1zZG1tYzItYjQtMS9waGFu
ZGxlIDw9PQoAAAG4Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvbTQtc2RtbWMyLWI0LTEvbmFtZSA8PT0KbTQtc2RtbWMyLWI0LTEACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdtMy0wL3BpbnMvcGlubXV4
IDw9PQoAACcDCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvcHdtMy0wL3BpbnMvc2xldy1yYXRlIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdtMy0wL3BpbnMvYmlhcy1wdWxsLWRvd24gPD09
Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTMt
MC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvcHdtMy0wL3BpbnMvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd20zLTAvcGhhbmRsZSA8
PT0KAAABTwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L3B3bTMtMC9uYW1lIDw9PQpwd20zLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvdXNhcnQyLXNsZWVwLTAvcGlucy9waW5tdXggPD09CgAAVREAADQR
AAA2EQAAMxEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC91c2FydDItc2xlZXAtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQyLXNsZWVwLTAvcGhhbmRsZSA8PT0K
AAABgwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3Vz
YXJ0Mi1zbGVlcC0wL25hbWUgPD09CnVzYXJ0Mi1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0Mi1pZGxlLTIvcGluczMvcGlubXV4
IDw9PQoAADYICj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvdXNhcnQyLWlkbGUtMi9waW5zMy9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0Mi1pZGxlLTIvcGluczMvbmFt
ZSA8PT0KcGluczMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvdXNhcnQyLWlkbGUtMi9waW5zMS9waW5tdXggPD09CgAANREAADMRCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQyLWlkbGUtMi9waW5z
MS9uYW1lIDw9PQpwaW5zMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC91c2FydDItaWRsZS0yL3BoYW5kbGUgPD09CgAAAYcKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDItaWRsZS0yL3BpbnMyL3Bp
bm11eCA8PT0KAAA0CAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3VzYXJ0Mi1pZGxlLTIvcGluczIvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDItaWRsZS0yL3BpbnMy
L3NsZXctcmF0ZSA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3VzYXJ0Mi1pZGxlLTIvcGluczIvbmFtZSA8PT0KcGluczIACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQyLWlkbGUtMi9w
aW5zMi9kcml2ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0Mi1pZGxlLTIvbmFtZSA8PT0KdXNhcnQyLWlkbGUtMgAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9yZ21paS1z
bGVlcC0xL3BpbnMxL3Bpbm11eCA8PT0KAABlEQAAZBEAAG0RAABuEQAAIhEAAEIRAAAbEQAAIREA
AAIRAAAkEQAAJREAAHYRAAB3EQAAAREAAAcRCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktc2xlZXAtMS9waW5zMS9uYW1lIDw9PQpwaW5zMQAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9yZ21paS1z
bGVlcC0xL3BoYW5kbGUgPD09CgAAAS4KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9yZ21paS1zbGVlcC0xL25hbWUgPD09CnJnbWlpLXNsZWVwLTEACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtcHdtOC0w
L3BpbnMvcGlubXV4IDw9PQoAAIISCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvbTQtcHdtOC0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1wd204LTAvcGhhbmRsZSA8
PT0KAAABqwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L200LXB3bTgtMC9uYW1lIDw9PQptNC1wd204LTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtY2VjLTAvcGlucy9waW5tdXggPD09CgAADxIKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1jZWMtMC9w
aW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvbTQtY2VjLTAvcGhhbmRsZSA8PT0KAAABkQo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LWNlYy0wL25hbWUgPD09Cm00LWNlYy0w
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXNw
aTUtMC9waW5zL3Bpbm11eCA8PT0KAABXEgAAWRIAAFgSCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc3BpNS0wL3BpbnMvbmFtZSA8PT0KcGlucwAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1zcGk1
LTAvcGhhbmRsZSA8PT0KAAABvQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL200LXNwaTUtMC9uYW1lIDw9PQptNC1zcGk1LTAACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcXNwaS1jbGstc2xlZXAtMC9waW5z
L3Bpbm11eCA8PT0KAABaEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3FzcGktY2xrLXNsZWVwLTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3FzcGktY2xrLXNsZWVwLTAv
cGhhbmRsZSA8PT0KAAAAbwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3FzcGktY2xrLXNsZWVwLTAvbmFtZSA8PT0KcXNwaS1jbGstc2xlZXAtMAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDBj
MDAwL3N0LGJhbmstbmFtZSA8PT0KR1BJT0sACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwYzAwMC9jbG9ja3MgPD09CgAAAAwAAABeCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAw
YzAwMC9ncGlvLWNvbnRyb2xsZXIgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMGMwMDAvZ3Bpby1yYW5nZXMgPD09CgAAAI8AAAAA
AAAAoAAAAAgKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9ncGlvQDUwMDBjMDAwL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDBjMDAwLyNpbnRlcnJ1cHQtY2VsbHMg
PD09CgAAAAIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9ncGlvQDUwMDBjMDAwL25ncGlvcyA8PT0KAAAACAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMGMwMDAvcGhhbmRsZSA8PT0KAAABJAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAw
MGMwMDAvcmVnIDw9PQoAAKAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMGMwMDAvI2dwaW8tY2VsbHMgPD09CgAAAAIKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDBjMDAw
L25hbWUgPD09CmdwaW8ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvZ3Bpb0A1MDAwYzAwMC9pbnRlcnJ1cHQtY29udHJvbGxlciA8PT0KCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc3BpNS1zbGVlcC0wL3Bp
bnMvcGlubXV4IDw9PQoAAFcRAABYEQAAWREKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9zcGk1LXNsZWVwLTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NwaTUtc2xlZXAt
MC9waGFuZGxlIDw9PQoAAAF3Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvc3BpNS1zbGVlcC0wL25hbWUgPD09CnNwaTUtc2xlZXAtMAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd200LXNsZWVwLTAvcGlu
cy9waW5tdXggPD09CgAAPhEAAD8RCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvcHdtNC1zbGVlcC0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd200LXNsZWVwLTAvcGhh
bmRsZSA8PT0KAAABVAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3B3bTQtc2xlZXAtMC9uYW1lIDw9PQpwd200LXNsZWVwLTAACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZGZzZG0tY2xrb3V0LXNsZWVwLXBp
bnMtMC9waW5zL3Bpbm11eCA8PT0KAAAdEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL2Rmc2RtLWNsa291dC1zbGVlcC1waW5zLTAvcGlucy9uYW1lIDw9
PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L2Rmc2RtLWNsa291dC1zbGVlcC1waW5zLTAvcGhhbmRsZSA8PT0KAAAAPwo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2Rmc2RtLWNsa291dC1zbGVlcC1w
aW5zLTAvbmFtZSA8PT0KZGZzZG0tY2xrb3V0LXNsZWVwLXBpbnMtMAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9hZGMxLWluNi0wL3BpbnMvcGlubXV4
IDw9PQoAAFwRCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvYWRjMS1pbjYtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvYWRjMS1pbjYtMC9waGFuZGxlIDw9PQoAAABOCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvYWRjMS1pbjYt
MC9uYW1lIDw9PQphZGMxLWluNi0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL3NhaTJhLXNsZWVwLTAvcGlucy9waW5tdXggPD09CgAAhREAAIYRAACH
EQAAQBEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9z
YWkyYS1zbGVlcC0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWkyYS1zbGVlcC0wL3BoYW5kbGUgPD09CgAAADgK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWkyYS1z
bGVlcC0wL25hbWUgPD09CnNhaTJhLXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQyLTIvcGluczEvcGlubXV4IDw9PQoAADUIAAA0
CAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0
Mi0yL3BpbnMxL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQyLTIvcGluczEvc2xldy1yYXRlIDw9PQoAAAAACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQyLTIv
cGluczEvbmFtZSA8PT0KcGluczEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvdXNhcnQyLTIvcGluczEvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDItMi9waGFu
ZGxlIDw9PQoAAAGGCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvdXNhcnQyLTIvcGluczIvcGlubXV4IDw9PQoAADYIAAAzCAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0Mi0yL3BpbnMyL2JpYXMtZGlz
YWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvdXNhcnQyLTIvcGluczIvbmFtZSA8PT0KcGluczIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQyLTIvbmFtZSA8PT0KdXNhcnQyLTIACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc2RtbWMx
LWRpci0wL3BpbnMvcGlubXV4IDw9PQoAAFISAAAnEgAAGRIAAEQSCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc2RtbWMxLWRpci0wL3BpbnMvbmFt
ZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9tNC1zZG1tYzEtZGlyLTAvcGhhbmRsZSA8PT0KAAABtgo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXNkbW1jMS1kaXItMC9uYW1lIDw9PQpt
NC1zZG1tYzEtZGlyLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvc2RtbWMzLWI0LTEvcGluczEvcGlubXV4IDw9PQoAAFAKAABUCgAANQsAADcLAAAw
Cwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1j
My1iNC0xL3BpbnMxL3NsZXctcmF0ZSA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC0xL3BpbnMxL2JpYXMtcHVsbC11cCA8
PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2Rt
bWMzLWI0LTEvcGluczEvbmFtZSA8PT0KcGluczEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMzLWI0LTEvcGluczEvZHJpdmUtcHVzaC1wdWxs
IDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9z
ZG1tYzMtYjQtMS9waGFuZGxlIDw9PQoAAAFvCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMzLWI0LTEvcGluczIvcGlubXV4IDw9PQoAAG8LCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMzLWI0
LTEvcGluczIvc2xldy1yYXRlIDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMzLWI0LTEvcGluczIvYmlhcy1wdWxsLXVwIDw9PQoK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzMt
YjQtMS9waW5zMi9uYW1lIDw9PQpwaW5zMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzMtYjQtMS9waW5zMi9kcml2ZS1wdXNoLXB1bGwgPD09
Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1j
My1iNC0xL25hbWUgPD09CnNkbW1jMy1iNC0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL200LXFzcGktYmsxLTAvcGlucy9waW5tdXggPD09CgAAWBIA
AFkSAABXEgAAVhIAABYSCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvbTQtcXNwaS1iazEtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtcXNwaS1iazEtMC9waGFuZGxl
IDw9PQoAAAGtCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvbTQtcXNwaS1iazEtMC9uYW1lIDw9PQptNC1xc3BpLWJrMS0wAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC1vZC0wL3BpbnMzL2Ry
aXZlLW9wZW4tZHJhaW4gPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3NkbW1jMy1iNC1vZC0wL3BpbnMzL3Bpbm11eCA8PT0KAABRCgo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC1vZC0w
L3BpbnMzL3NsZXctcmF0ZSA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC1vZC0wL3BpbnMzL2JpYXMtcHVsbC11cCA8PT0K
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMz
LWI0LW9kLTAvcGluczMvbmFtZSA8PT0KcGluczMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMzLWI0LW9kLTAvcGluczEvcGlubXV4IDw9PQoA
AFAKAABUCgAAVQoAADcLCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvc2RtbWMzLWI0LW9kLTAvcGluczEvc2xldy1yYXRlIDw9PQoAAAABCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMzLWI0LW9kLTAv
cGluczEvYmlhcy1wdWxsLXVwIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9zZG1tYzMtYjQtb2QtMC9waW5zMS9uYW1lIDw9PQpwaW5zMQAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzMtYjQt
b2QtMC9waW5zMS9kcml2ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC1vZC0wL3BoYW5kbGUgPD09CgAAAFIK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzMt
YjQtb2QtMC9waW5zMi9waW5tdXggPD09CgAAbwsKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzMtYjQtb2QtMC9waW5zMi9zbGV3LXJhdGUgPD09
CgAAAAIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9z
ZG1tYzMtYjQtb2QtMC9waW5zMi9iaWFzLXB1bGwtdXAgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC1vZC0wL3BpbnMyL25hbWUg
PD09CnBpbnMyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL3NkbW1jMy1iNC1vZC0wL3BpbnMyL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMzLWI0LW9kLTAvbmFt
ZSA8PT0Kc2RtbWMzLWI0LW9kLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvaTJjMi1zbGVlcC0wL3BpbnMvcGlubXV4IDw9PQoAAHQRAAB1EQo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzItc2xlZXAt
MC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvaTJjMi1zbGVlcC0wL3BoYW5kbGUgPD09CgAAAB4KPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmMyLXNsZWVwLTAvbmFtZSA8
PT0KaTJjMi1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL200LWZtYy0wL3BpbnMvcGlubXV4IDw9PQoAADQSAAA1EgAAOxIAADwSAAA+EgAA
PxIAADASAAAxEgAARxIAAEgSAABJEgAAShIAAGkSAAA2Ego9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LWZtYy0wL3BpbnMvbmFtZSA8PT0KcGlucwAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1mbWMt
MC9waGFuZGxlIDw9PQoAAAGaCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvbTQtZm1jLTAvbmFtZSA8PT0KbTQtZm1jLTAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMxLWI0LXNsZWVwLTAvcGlucy9w
aW5tdXggPD09CgAAKBEAACkRAAAqEQAAKxEAACwRAAAyEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1iNC1zbGVlcC0wL3BpbnMvbmFtZSA8
PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9zZG1tYzEtYjQtc2xlZXAtMC9waGFuZGxlIDw9PQoAAAB1Cj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMxLWI0LXNsZWVwLTAvbmFtZSA8PT0K
c2RtbWMxLWI0LXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvaTJjMi0xL3BpbnMvZHJpdmUtb3Blbi1kcmFpbiA8PT0KCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaTJjMi0xL3BpbnMvcGlubXV4
IDw9PQoAAHUFCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvaTJjMi0xL3BpbnMvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmMyLTEvcGlucy9zbGV3LXJhdGUgPD09CgAAAAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmMyLTEv
cGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL2kyYzItMS9waGFuZGxlIDw9PQoAAAE5Cj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaTJjMi0xL25hbWUgPD09CmkyYzItMQAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWkyYS0xL3Bp
bnMxL3Bpbm11eCA8PT0KAACGCwAAhwsAAD0LCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpMmEtMS9waW5zMS9iaWFzLWRpc2FibGUgPD09Cgo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NhaTJhLTEvcGlu
czEvc2xldy1yYXRlIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvc2FpMmEtMS9waW5zMS9uYW1lIDw9PQpwaW5zMQAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWkyYS0xL3BpbnMxL2RyaXZl
LXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvc2FpMmEtMS9waGFuZGxlIDw9PQoAAAFcCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpMmEtMS9uYW1lIDw9PQpzYWkyYS0xAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1kaXIt
c2xlZXAtMS9waW5zL3Bpbm11eCA8PT0KAABSEQAAThEAABkRAABEEQo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1kaXItc2xlZXAtMS9waW5z
L25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvc2RtbWMxLWRpci1zbGVlcC0xL3BoYW5kbGUgPD09CgAAAWYKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzEtZGlyLXNsZWVwLTEv
bmFtZSA8PT0Kc2RtbWMxLWRpci1zbGVlcC0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL21fY2FuMi1zbGVlcC0wL3BpbnMvcGlubXV4IDw9PQoAAB0R
AAAVEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL21f
Y2FuMi1zbGVlcC0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tX2NhbjItc2xlZXAtMC9waGFuZGxlIDw9PQoAAAFM
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbV9jYW4y
LXNsZWVwLTAvbmFtZSA8PT0KbV9jYW4yLXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtYWRjMS1pbjYvcGlucy9waW5tdXggPD09CgAA
XBIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1h
ZGMxLWluNi9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtYWRjMS1pbjYvcGhhbmRsZSA8PT0KAAABjgo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LWFkYzEtaW42L25h
bWUgPD09Cm00LWFkYzEtaW42AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL200LWhkcDctMC9waW5zL3Bpbm11eCA8PT0KAACmEgo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LWhkcDctMC9waW5zL25hbWUg
PD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvbTQtaGRwNy0wL3BoYW5kbGUgPD09CgAAAZ0KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1oZHA3LTAvbmFtZSA8PT0KbTQtaGRwNy0wAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXNwZGlmcngt
MC9waW5zL3Bpbm11eCA8PT0KAABsEgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL200LXNwZGlmcngtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc3BkaWZyeC0wL3Bo
YW5kbGUgPD09CgAAAbsKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9tNC1zcGRpZnJ4LTAvbmFtZSA8PT0KbTQtc3BkaWZyeC0wAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDkwMDAvc3QsYmFu
ay1uYW1lIDw9PQpHUElPSAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9ncGlvQDUwMDA5MDAwL2Nsb2NrcyA8PT0KAAAADAAAAFsKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDA5MDAwL2dwaW8t
Y29udHJvbGxlciA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvZ3Bpb0A1MDAwOTAwMC9ncGlvLXJhbmdlcyA8PT0KAAAAjwAAAAAAAABwAAAAEAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAw
MDkwMDAvc3RhdHVzIDw9PQpva2F5AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDkwMDAvI2ludGVycnVwdC1jZWxscyA8PT0KAAAAAgo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAw
MDkwMDAvbmdwaW9zIDw9PQoAAAAQCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwOTAwMC9waGFuZGxlIDw9PQoAAAEiCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwOTAwMC9yZWcg
PD09CgAAcAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvZ3Bpb0A1MDAwOTAwMC8jZ3Bpby1jZWxscyA8PT0KAAAAAgo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDkwMDAvbmFtZSA8PT0K
Z3BpbwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9n
cGlvQDUwMDA5MDAwL2ludGVycnVwdC1jb250cm9sbGVyIDw9PQoKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9jZWMtc2xlZXAtMS9waW5zL3Bpbm11eCA8
PT0KAAAWEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L2NlYy1zbGVlcC0xL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9jZWMtc2xlZXAtMS9waGFuZGxlIDw9PQoAAAEqCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvY2VjLXNsZWVw
LTEvbmFtZSA8PT0KY2VjLXNsZWVwLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvc3BkaWZyeC0wL3BpbnMvcGlubXV4IDw9PQoAAGwJCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc3BkaWZyeC0wL3BpbnMv
Ymlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9zcGRpZnJ4LTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NwZGlmcngtMC9waGFuZGxlIDw9PQoA
AAAUCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc3Bk
aWZyeC0wL25hbWUgPD09CnNwZGlmcngtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9wd20xLXNsZWVwLTAvcGlucy9waW5tdXggPD09CgAASREAAEsR
AABOEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3
bTEtc2xlZXAtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdtMS1zbGVlcC0wL3BoYW5kbGUgPD09CgAAAU4KPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd20xLXNsZWVw
LTAvbmFtZSA8PT0KcHdtMS1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL2FkYzEyLWFpbi0wL3BpbnMvcGlubXV4IDw9PQoAACMRAABcEQAA
XREAAF4RCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
YWRjMTItYWluLTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2FkYzEyLWFpbi0wL3BoYW5kbGUgPD09CgAAASUKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9hZGMxMi1haW4t
MC9uYW1lIDw9PQphZGMxMi1haW4tMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9tNC11c2FydDItMC9waW5zL3Bpbm11eCA8PT0KAAA1EgAANBIAADYS
AAAzEgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200
LXVzYXJ0Mi0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC11c2FydDItMC9waGFuZGxlIDw9PQoAAAHBCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtdXNhcnQyLTAv
bmFtZSA8PT0KbTQtdXNhcnQyLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvdXNhcnQyLTAvcGluczEvcGlubXV4IDw9PQoAAFUIAAA0CAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0Mi0wL3BpbnMx
L2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvdXNhcnQyLTAvcGluczEvc2xldy1yYXRlIDw9PQoAAAAACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQyLTAvcGluczEvbmFt
ZSA8PT0KcGluczEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvdXNhcnQyLTAvcGluczEvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDItMC9waGFuZGxlIDw9PQoA
AAGCCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNh
cnQyLTAvcGluczIvcGlubXV4IDw9PQoAADYIAAAzCAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0Mi0wL3BpbnMyL2JpYXMtZGlzYWJsZSA8PT0K
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQy
LTAvcGluczIvbmFtZSA8PT0KcGluczIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvdXNhcnQyLTAvbmFtZSA8PT0KdXNhcnQyLTAACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZGNtaS1zbGVlcC0wL3BpbnMv
cGlubXV4IDw9PQoAAHgRAAAXEQAABhEAAHkRAAB6EQAAexEAAHwRAAB+EQAAhBEAABgRAABGEQAA
gREAAHcRAACDEQAAfxEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9kY21pLXNsZWVwLTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2RjbWktc2xlZXAtMC9waGFuZGxlIDw9
PQoAAABZCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
ZGNtaS1zbGVlcC0wL25hbWUgPD09CmRjbWktc2xlZXAtMAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1hZGMxMi11c2ItcHdyLXBpbnMtMC9waW5z
L3Bpbm11eCA8PT0KAAAEEgAABRIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9tNC1hZGMxMi11c2ItcHdyLXBpbnMtMC9waW5zL25hbWUgPD09CnBpbnMA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtYWRj
MTItdXNiLXB3ci1waW5zLTAvcGhhbmRsZSA8PT0KAAABkAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LWFkYzEyLXVzYi1wd3ItcGlucy0wL25hbWUg
PD09Cm00LWFkYzEyLXVzYi1wd3ItcGlucy0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL200LXB3bTEtMC9waW5zL3Bpbm11eCA8PT0KAABJEgAASxIA
AE4SCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQt
cHdtMS0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9tNC1wd20xLTAvcGhhbmRsZSA8PT0KAAABpQo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXB3bTEtMC9uYW1lIDw9
PQptNC1wd20xLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvZ3Bpb0A1MDAwNjAwMC9zdCxiYW5rLW5hbWUgPD09CkdQSU9FAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDYwMDAvY2xvY2tz
IDw9PQoAAAAMAAAAWAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL2dwaW9ANTAwMDYwMDAvZ3Bpby1jb250cm9sbGVyIDw9PQoKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDA2MDAwL2dwaW8tcmFu
Z2VzIDw9PQoAAACPAAAAAAAAAEAAAAAQCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwNjAwMC9zdGF0dXMgPD09Cm9rYXkACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwNjAwMC8j
aW50ZXJydXB0LWNlbGxzIDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwNjAwMC9uZ3Bpb3MgPD09CgAAABAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDA2MDAwL3Bo
YW5kbGUgPD09CgAAASEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9ncGlvQDUwMDA2MDAwL3JlZyA8PT0KAABAAAAABAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDA2MDAwLyNncGlvLWNlbGxz
IDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvZ3Bpb0A1MDAwNjAwMC9uYW1lIDw9PQpncGlvAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDYwMDAvaW50ZXJydXB0LWNvbnRyb2xs
ZXIgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L3B3bTQtMS9waW5zL3Bpbm11eCA8PT0KAAA9Awo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTQtMS9waW5zL3NsZXctcmF0ZSA8PT0KAAAAAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTQtMS9waW5z
L2JpYXMtcHVsbC1kb3duIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9wd200LTEvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTQtMS9waW5zL2RyaXZlLXB1c2gt
cHVsbCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvcHdtNC0xL3BoYW5kbGUgPD09CgAAAVUKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9wd200LTEvbmFtZSA8PT0KcHdtNC0xAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL20tY2FuMi0wL3BpbnMxL3Bpbm11
eCA8PT0KAAAdCgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL20tY2FuMi0wL3BpbnMxL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbS1jYW4yLTAvcGluczEvc2xldy1yYXRlIDw9
PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
bS1jYW4yLTAvcGluczEvbmFtZSA8PT0KcGluczEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbS1jYW4yLTAvcGluczEvZHJpdmUtcHVzaC1wdWxsIDw9
PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tLWNh
bjItMC9waGFuZGxlIDw9PQoAAAFLCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvbS1jYW4yLTAvcGluczIvcGlubXV4IDw9PQoAABUKCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbS1jYW4yLTAvcGluczIvYmlh
cy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9tLWNhbjItMC9waW5zMi9uYW1lIDw9PQpwaW5zMgAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tLWNhbjItMC9uYW1lIDw9PQptLWNhbjIt
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1z
YWkyYi0yL3BpbnMvcGlubXV4IDw9PQoAAFsSCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc2FpMmItMi9waW5zL25hbWUgPD09CnBpbnMACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc2FpMmItMi9w
aGFuZGxlIDw9PQoAAAGzCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvbTQtc2FpMmItMi9uYW1lIDw9PQptNC1zYWkyYi0yAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1kNDctc2xlZXAtMy9waW5z
L3Bpbm11eCA8PT0KAAAIEQAACREAAEURAAAnEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1kNDctc2xlZXAtMy9waW5zL25hbWUgPD09CnBp
bnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2Rt
bWMyLWQ0Ny1zbGVlcC0zL3BoYW5kbGUgPD09CgAAAW4KPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItZDQ3LXNsZWVwLTMvbmFtZSA8PT0Kc2Rt
bWMyLWQ0Ny1zbGVlcC0zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL2dwaW9ANTAwMDMwMDAvc3QsYmFuay1uYW1lIDw9PQpHUElPQgAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDAzMDAwL2Ns
b2NrcyA8PT0KAAAADAAAAFUKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9ncGlvQDUwMDAzMDAwL2dwaW8tY29udHJvbGxlciA8PT0KCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwMzAwMC9ncGlv
LXJhbmdlcyA8PT0KAAAAjwAAAAAAAAAQAAAAEAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDMwMDAvc3RhdHVzIDw9PQpva2F5AAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDMw
MDAvI2ludGVycnVwdC1jZWxscyA8PT0KAAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDMwMDAvbmdwaW9zIDw9PQoAAAAQCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwMzAw
MC9waGFuZGxlIDw9PQoAAAEgCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvZ3Bpb0A1MDAwMzAwMC9yZWcgPD09CgAAEAAAAAQACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwMzAwMC8jZ3Bpby1j
ZWxscyA8PT0KAAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL2dwaW9ANTAwMDMwMDAvbmFtZSA8PT0KZ3BpbwAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDAzMDAwL2ludGVycnVwdC1jb250
cm9sbGVyIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9xc3BpLWJrMS0wL3BpbnMxL3Bpbm11eCA8PT0KAABYCwAAWQsAAFcKAABWCgo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3FzcGktYmsxLTAvcGlu
czEvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9xc3BpLWJrMS0wL3BpbnMxL3NsZXctcmF0ZSA8PT0KAAAAAQo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3FzcGktYmsxLTAvcGlu
czEvbmFtZSA8PT0KcGluczEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvcXNwaS1iazEtMC9waW5zMS9kcml2ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3FzcGktYmsxLTAvcGhh
bmRsZSA8PT0KAAAAbQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3FzcGktYmsxLTAvcGluczIvcGlubXV4IDw9PQoAABYLCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcXNwaS1iazEtMC9waW5zMi9zbGV3LXJh
dGUgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9xc3BpLWJrMS0wL3BpbnMyL2JpYXMtcHVsbC11cCA8PT0KCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcXNwaS1iazEtMC9waW5zMi9uYW1lIDw9
PQpwaW5zMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9xc3BpLWJrMS0wL3BpbnMyL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcXNwaS1iazEtMC9uYW1lIDw9PQpxc3Bp
LWJrMS0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L200LWkyYzItMC9waW5zL3Bpbm11eCA8PT0KAAB0EgAAdRIKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1pMmMyLTAvcGlucy9uYW1lIDw9PQpwaW5z
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LWky
YzItMC9waGFuZGxlIDw9PQoAAAGfCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvbTQtaTJjMi0wL25hbWUgPD09Cm00LWkyYzItMAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1kYWMtY2gyL3BpbnMvcGlu
bXV4IDw9PQoAAAUSCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvbTQtZGFjLWNoMi9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtZGFjLWNoMi9waGFuZGxlIDw9PQoAAAGU
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtZGFj
LWNoMi9uYW1lIDw9PQptNC1kYWMtY2gyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL2kyYzUtMS9waW5zL2RyaXZlLW9wZW4tZHJhaW4gPD09Cgo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzUtMS9waW5z
L3Bpbm11eCA8PT0KAAAwBQAAMQUKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9pMmM1LTEvcGlucy9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzUtMS9waW5zL3NsZXctcmF0
ZSA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL2kyYzUtMS9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaTJjNS0xL3BoYW5kbGUgPD09CgAAAT0KPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmM1LTEvbmFtZSA8PT0K
aTJjNS0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L3NwaTQtc2xlZXAtMS9waW5zL3Bpbm11eCA8PT0KAABMEQAATREAAE4RCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc3BpNC1zbGVlcC0xL3BpbnMvbmFt
ZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9zcGk0LXNsZWVwLTEvcGhhbmRsZSA8PT0KAAABdQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NwaTQtc2xlZXAtMS9uYW1lIDw9PQpzcGk0LXNs
ZWVwLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
cHdtMy1zbGVlcC0xL3BpbnMvcGlubXV4IDw9PQoAABURCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdtMy1zbGVlcC0xL3BpbnMvbmFtZSA8PT0KcGlu
cwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd20z
LXNsZWVwLTEvcGhhbmRsZSA8PT0KAAABUgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL3B3bTMtc2xlZXAtMS9uYW1lIDw9PQpwd20zLXNsZWVwLTEACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc3Qsc3lzY2Zn
IDw9PQoAAAASAAAAYAAAAP8KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9zZG1tYzItYjQtMS9waW5zMS9waW5tdXggPD09CgAAHgoAAB8KAAATCgAAFAoA
AGYLCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2Rt
bWMyLWI0LTEvcGluczEvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItYjQtMS9waW5zMS9zbGV3LXJhdGUgPD09
CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9z
ZG1tYzItYjQtMS9waW5zMS9uYW1lIDw9PQpwaW5zMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItYjQtMS9waW5zMS9kcml2ZS1wdXNoLXB1
bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L3NkbW1jMi1iNC0xL3BoYW5kbGUgPD09CgAAAWcKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItYjQtMS9waW5zMi9waW5tdXggPD09CgAAQwoK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzIt
YjQtMS9waW5zMi9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1iNC0xL3BpbnMyL3NsZXctcmF0ZSA8PT0KAAAA
Ago9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1j
Mi1iNC0xL3BpbnMyL25hbWUgPD09CnBpbnMyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1iNC0xL3BpbnMyL2RyaXZlLXB1c2gtcHVsbCA8
PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2Rt
bWMyLWI0LTEvbmFtZSA8PT0Kc2RtbWMyLWI0LTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQzLXNsZWVwLTIvcGlucy9waW5tdXggPD09CgAA
GhEAAGgRAAAdEQAAHBEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC91c2FydDMtc2xlZXAtMi9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQzLXNsZWVwLTIvcGhhbmRs
ZSA8PT0KAAABjAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL3VzYXJ0My1zbGVlcC0yL25hbWUgPD09CnVzYXJ0My1zbGVlcC0yAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1iNC1vZC0xL3BpbnMz
L2RyaXZlLW9wZW4tZHJhaW4gPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1iNC1vZC0xL3BpbnMzL3Bpbm11eCA8PT0KAABmCwo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1iNC1v
ZC0xL3BpbnMzL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWI0LW9kLTEvcGluczMvc2xldy1yYXRlIDw9PQoA
AAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2Rt
bWMyLWI0LW9kLTEvcGluczMvbmFtZSA8PT0KcGluczMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWI0LW9kLTEvcGluczEvcGlubXV4IDw9
PQoAAB4KAAAfCgAAEwoAABQKCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvc2RtbWMyLWI0LW9kLTEvcGluczEvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItYjQtb2Qt
MS9waW5zMS9zbGV3LXJhdGUgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItYjQtb2QtMS9waW5zMS9uYW1lIDw9PQpwaW5zMQAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzIt
YjQtb2QtMS9waW5zMS9kcml2ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1iNC1vZC0xL3BoYW5kbGUgPD09CgAA
AWgKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1t
YzItYjQtb2QtMS9waW5zMi9waW5tdXggPD09CgAAQwoKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItYjQtb2QtMS9waW5zMi9iaWFzLWRpc2Fi
bGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L3NkbW1jMi1iNC1vZC0xL3BpbnMyL3NsZXctcmF0ZSA8PT0KAAAAAgo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1iNC1vZC0xL3BpbnMyL25h
bWUgPD09CnBpbnMyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3NkbW1jMi1iNC1vZC0xL3BpbnMyL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWI0LW9kLTEv
bmFtZSA8PT0Kc2RtbWMyLWI0LW9kLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvaTJjMS1zbGVlcC0xL3BpbnMvcGlubXV4IDw9PQoAAF4RAABfEQo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzEtc2xl
ZXAtMS9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvaTJjMS1zbGVlcC0xL3BoYW5kbGUgPD09CgAAATgKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmMxLXNsZWVwLTEvbmFt
ZSA8PT0KaTJjMS1zbGVlcC0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL2RhYy1jaDItMC9waW5zL3Bpbm11eCA8PT0KAAAFEQo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2RhYy1jaDItMC9waW5zL25hbWUg
PD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvZGFjLWNoMi0wL3BoYW5kbGUgPD09CgAAADAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9kYWMtY2gyLTAvbmFtZSA8PT0KZGFjLWNoMi0wAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VhcnQ4LTAvcGlu
czEvcGlubXV4IDw9PQoAAEEJCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvdWFydDgtMC9waW5zMS9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VhcnQ4LTAvcGluczEvc2xldy1y
YXRlIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvdWFydDgtMC9waW5zMS9uYW1lIDw9PQpwaW5zMQAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0OC0wL3BpbnMxL2RyaXZlLXB1c2gtcHVs
bCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
dWFydDgtMC9waGFuZGxlIDw9PQoAAAGACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvdWFydDgtMC9waW5zMi9waW5tdXggPD09CgAAQAkKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0OC0wL3BpbnMyL2Jp
YXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvdWFydDgtMC9waW5zMi9uYW1lIDw9PQpwaW5zMgAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0OC0wL25hbWUgPD09CnVhcnQ4LTAA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMy
LWQ0Ny0yL3BpbnMvcGlubXV4IDw9PQoAAAgKAAAPCgAAJgsAACcLCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWQ0Ny0yL3BpbnMvc2xldy1y
YXRlIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvc2RtbWMyLWQ0Ny0yL3BpbnMvYmlhcy1wdWxsLXVwIDw9PQoKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItZDQ3LTIvcGlucy9uYW1l
IDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL3NkbW1jMi1kNDctMi9waW5zL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWQ0Ny0yL3BoYW5kbGUg
PD09CgAAAWsKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9zZG1tYzItZDQ3LTIvbmFtZSA8PT0Kc2RtbWMyLWQ0Ny0yAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXB3bTQtMC9waW5zL3Bpbm11eCA8PT0K
AAA+EgAAPxIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9tNC1wd200LTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXB3bTQtMC9waGFuZGxlIDw9PQoAAAGoCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtcHdtNC0wL25h
bWUgPD09Cm00LXB3bTQtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9zZG1tYzEtYjQtaW5pdC0wL3BpbnMxL3Bpbm11eCA8PT0KAAAoDQAAKQ0AACoN
AAArDQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3Nk
bW1jMS1iNC1pbml0LTAvcGluczEvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzEtYjQtaW5pdC0wL3BpbnMxL3Ns
ZXctcmF0ZSA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3NkbW1jMS1iNC1pbml0LTAvcGluczEvbmFtZSA8PT0KcGluczEACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMxLWI0LWluaXQt
MC9waW5zMS9kcml2ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1iNC1pbml0LTAvcGhhbmRsZSA8PT0KAAABYwo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1i
NC1pbml0LTAvbmFtZSA8PT0Kc2RtbWMxLWI0LWluaXQtMAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd204LXNsZWVwLTAvcGlucy9waW5tdXggPD09
CgAAghEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9w
d204LXNsZWVwLTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTgtc2xlZXAtMC9waGFuZGxlIDw9PQoAAAAzCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdtOC1zbGVl
cC0wL25hbWUgPD09CnB3bTgtc2xlZXAtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9zYWkyYi0yL3BpbnMxL3Bpbm11eCA8PT0KAABbCwo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NhaTJiLTIvcGluczEv
Ymlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9zYWkyYi0yL3BpbnMxL25hbWUgPD09CnBpbnMxAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NhaTJiLTIvcGhhbmRsZSA8PT0KAAAB
YQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NhaTJi
LTIvbmFtZSA8PT0Kc2FpMmItMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9tNC1oZHAwLTAvcGlucy9waW5tdXggPD09CgAAjBIKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1oZHAwLTAvcGlucy9uYW1l
IDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL200LWhkcDAtMC9waGFuZGxlIDw9PQoAAAGbCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtaGRwMC0wL25hbWUgPD09Cm00LWhkcDAtMAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1zYWkyYi0w
L3BpbnMvcGlubXV4IDw9PQoAAEwSAABNEgAAThIAAFsSCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc2FpMmItMC9waW5zL25hbWUgPD09CnBpbnMA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc2Fp
MmItMC9waGFuZGxlIDw9PQoAAAGyCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvbTQtc2FpMmItMC9uYW1lIDw9PQptNC1zYWkyYi0wAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NwaTQtMS9waW5zMS9waW5t
dXggPD09CgAATAYAAE4GCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvc3BpNC0xL3BpbnMxL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc3BpNC0xL3BpbnMxL3NsZXctcmF0ZSA8
PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L3NwaTQtMS9waW5zMS9uYW1lIDw9PQpwaW5zMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9zcGk0LTEvcGluczEvZHJpdmUtcHVzaC1wdWxsIDw9PQoK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zcGk0LTEv
cGhhbmRsZSA8PT0KAAABdAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3NwaTQtMS9waW5zMi9waW5tdXggPD09CgAATQYKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zcGk0LTEvcGluczIvYmlhcy1kaXNhYmxl
IDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9z
cGk0LTEvcGluczIvbmFtZSA8PT0KcGluczIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvc3BpNC0xL25hbWUgPD09CnNwaTQtMQAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWkyYi1zbGVlcC0yL3BpbnMv
cGlubXV4IDw9PQoAAFsRCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvc2FpMmItc2xlZXAtMi9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpMmItc2xlZXAtMi9waGFuZGxl
IDw9PQoAAAFiCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvc2FpMmItc2xlZXAtMi9uYW1lIDw9PQpzYWkyYi1zbGVlcC0yAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1kNDctc2xlZXAtMS9waW5z
L3Bpbm11eCA8PT0KAAAIEQAACREAACYRAAAnEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1kNDctc2xlZXAtMS9waW5zL25hbWUgPD09CnBp
bnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2Rt
bWMyLWQ0Ny1zbGVlcC0xL3BoYW5kbGUgPD09CgAAAWoKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItZDQ3LXNsZWVwLTEvbmFtZSA8PT0Kc2Rt
bWMyLWQ0Ny1zbGVlcC0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL2h3bG9ja3MgPD09CgAAAF4AAAAAAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL21fY2FuMS1zbGVlcC0xL3BpbnMvcGlubXV4IDw9
PQoAAAwRAAALEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL21fY2FuMS1zbGVlcC0xL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tX2NhbjEtc2xlZXAtMS9waGFuZGxlIDw9
PQoAAAFKCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
bV9jYW4xLXNsZWVwLTEvbmFtZSA8PT0KbV9jYW4xLXNsZWVwLTEACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtaTJjNS0wL3BpbnMvcGlubXV4IDw9
PQoAAAsSAAAMEgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL200LWkyYzUtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtaTJjNS0wL3BoYW5kbGUgPD09CgAAAaAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1pMmM1LTAv
bmFtZSA8PT0KbTQtaTJjNS0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL2Rmc2RtLWRhdGEzLXNsZWVwLXBpbnMtMC9waW5zL3Bpbm11eCA8PT0KAABd
EQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2Rmc2Rt
LWRhdGEzLXNsZWVwLXBpbnMtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZGZzZG0tZGF0YTMtc2xlZXAtcGlucy0w
L3BoYW5kbGUgPD09CgAAAEEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9kZnNkbS1kYXRhMy1zbGVlcC1waW5zLTAvbmFtZSA8PT0KZGZzZG0tZGF0YTMt
c2xlZXAtcGlucy0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL2ZtYy1zbGVlcC0wL3BpbnMvcGlubXV4IDw9PQoAADQRAAA1EQAAOxEAADwRAAA+EQAA
PxEAADARAAAxEQAARxEAAEgRAABJEQAAShEAADYRAABpEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2ZtYy1zbGVlcC0wL3BpbnMvbmFtZSA8PT0KcGlu
cwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9mbWMt
c2xlZXAtMC9waGFuZGxlIDw9PQoAAABrCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvZm1jLXNsZWVwLTAvbmFtZSA8PT0KZm1jLXNsZWVwLTAACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtbHRkYy1iLTAv
cGlucy9waW5tdXggPD09CgAAjhIAAIwSAACNEgAApxIAAI8SAACQEgAAkRIAAJISAACTEgAAlBIA
AJUSAACWEgAAlxIAAJgSAACZEgAAmhIAAJsSAACgEgAAoRIAAKISAACcEgAAnRIAAJ4SAACfEgAA
oxIAAKQSAAClEgAAphIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9tNC1sdGRjLWItMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtbHRkYy1iLTAvcGhhbmRsZSA8PT0K
AAABowo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200
LWx0ZGMtYi0wL25hbWUgPD09Cm00LWx0ZGMtYi0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1iNC1zbGVlcC0wL3BpbnMvcGlubXV4IDw9
PQoAAB4RAAAfEQAAExEAABQRAABDEQAAZhEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItYjQtc2xlZXAtMC9waW5zL25hbWUgPD09CnBpbnMA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMy
LWI0LXNsZWVwLTAvcGhhbmRsZSA8PT0KAAAAfQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1iNC1zbGVlcC0wL25hbWUgPD09CnNkbW1jMi1i
NC1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL200LXVzYXJ0My0xL3BpbnMvcGlubXV4IDw9PQoAABoSAABoEgAAHBIAAB0SCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtdXNhcnQzLTEvcGlu
cy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL200LXVzYXJ0My0xL3BoYW5kbGUgPD09CgAAAcMKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC11c2FydDMtMS9uYW1lIDw9PQptNC11
c2FydDMtMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC91c2FydDMtMS9waW5zMS9waW5tdXggPD09CgAAGggAAGgJCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQzLTEvcGluczEvYmlhcy1kaXNhYmxl
IDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91
c2FydDMtMS9waW5zMS9zbGV3LXJhdGUgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMtMS9waW5zMS9uYW1lIDw9PQpwaW5zMQAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMt
MS9waW5zMS9kcml2ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0My0xL3BoYW5kbGUgPD09CgAAABcKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMtMS9waW5zMi9w
aW5tdXggPD09CgAAHAkAAIoJCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvdXNhcnQzLTEvcGluczIvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMtMS9waW5zMi9uYW1l
IDw9PQpwaW5zMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC91c2FydDMtMS9uYW1lIDw9PQp1c2FydDMtMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd20yLTAvcGlucy9waW5tdXggPD09CgAAAwIKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd20yLTAvcGlu
cy9zbGV3LXJhdGUgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9wd20yLTAvcGlucy9iaWFzLXB1bGwtZG93biA8PT0KCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdtMi0wL3BpbnMvbmFtZSA8
PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9wd20yLTAvcGlucy9kcml2ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTItMC9waGFuZGxlIDw9PQoAAAANCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdtMi0wL25hbWUg
PD09CnB3bTItMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9zZG1tYzItZDQ3LTAvcGlucy9waW5tdXggPD09CgAACAoAAAkLAABFCgAAMwoKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItZDQ3LTAv
cGlucy9zbGV3LXJhdGUgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9zZG1tYzItZDQ3LTAvcGlucy9iaWFzLXB1bGwtdXAgPD09Cgo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1kNDct
MC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvc2RtbWMyLWQ0Ny0wL3BpbnMvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItZDQ3
LTAvcGhhbmRsZSA8PT0KAAAAewo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3NkbW1jMi1kNDctMC9uYW1lIDw9PQpzZG1tYzItZDQ3LTAACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc3BpNC0wL3BpbnMv
cGlubXV4IDw9PQoAAEwSAABOEgAATRIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9tNC1zcGk0LTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXNwaTQtMC9waGFuZGxl
IDw9PQoAAAG8Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvbTQtc3BpNC0wL25hbWUgPD09Cm00LXNwaTQtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9yYW5nZXMgPD09CgAAAABQACAAAACkAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NhaTJiLTAvcGluczEv
cGlubXV4IDw9PQoAAEwLAABNCwAATgsKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9zYWkyYi0wL3BpbnMxL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpMmItMC9waW5zMS9z
bGV3LXJhdGUgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9zYWkyYi0wL3BpbnMxL25hbWUgPD09CnBpbnMxAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NhaTJiLTAvcGluczEvZHJpdmUtcHVz
aC1wdWxsIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9zYWkyYi0wL3BoYW5kbGUgPD09CgAAADcKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWkyYi0wL3BpbnMyL3Bpbm11eCA8PT0KAABbCwo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NhaTJiLTAvcGlu
czIvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9zYWkyYi0wL3BpbnMyL25hbWUgPD09CnBpbnMyAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NhaTJiLTAvbmFtZSA8PT0Kc2Fp
MmItMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9w
d201LXNsZWVwLTAvcGlucy9waW5tdXggPD09CgAAexEKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd201LXNsZWVwLTAvcGlucy9uYW1lIDw9PQpwaW5z
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTUt
c2xlZXAtMC9waGFuZGxlIDw9PQoAAAFYCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvcHdtNS1zbGVlcC0wL25hbWUgPD09CnB3bTUtc2xlZXAtMAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9jZWMtMS9waW5z
L2RyaXZlLW9wZW4tZHJhaW4gPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL2NlYy0xL3BpbnMvcGlubXV4IDw9PQoAABYGCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvY2VjLTEvcGlucy9iaWFzLWRpc2Fi
bGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L2NlYy0xL3BpbnMvc2xldy1yYXRlIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvY2VjLTEvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2NlYy0xL3BoYW5kbGUg
PD09CgAAASkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9jZWMtMS9uYW1lIDw9PQpjZWMtMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9zYWkyYi1zbGVlcC0wL3BpbnMvcGlubXV4IDw9PQoAAFsRAABMEQAA
TREAAE4RCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
c2FpMmItc2xlZXAtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpMmItc2xlZXAtMC9waGFuZGxlIDw9PQoAAAA5
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpMmIt
c2xlZXAtMC9uYW1lIDw9PQpzYWkyYi1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VhcnQ0LTIvcGluczEvcGlubXV4IDw9PQoAAGsHCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDQtMi9w
aW5zMS9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL3VhcnQ0LTIvcGluczEvc2xldy1yYXRlIDw9PQoAAAAACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDQtMi9waW5zMS9u
YW1lIDw9PQpwaW5zMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC91YXJ0NC0yL3BpbnMxL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDQtMi9waGFuZGxlIDw9PQoA
AAF6Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFy
dDQtMi9waW5zMi9waW5tdXggPD09CgAAEgkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC91YXJ0NC0yL3BpbnMyL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDQtMi9waW5z
Mi9uYW1lIDw9PQpwaW5zMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC91YXJ0NC0yL25hbWUgPD09CnVhcnQ0LTIACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtdWFydDQtMC9waW5zL3Bpbm11eCA8PT0K
AABrEgAAEhIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9tNC11YXJ0NC0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC11YXJ0NC0wL3BoYW5kbGUgPD09CgAAAb8KPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC11YXJ0NC0w
L25hbWUgPD09Cm00LXVhcnQ0LTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvdWFydDQtaWRsZS0wL3BpbnMxL3Bpbm11eCA8PT0KAABrEQo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VhcnQ0LWlkbGUtMC9w
aW5zMS9uYW1lIDw9PQpwaW5zMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC91YXJ0NC1pZGxlLTAvcGhhbmRsZSA8PT0KAAAAHAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VhcnQ0LWlkbGUtMC9waW5zMi9w
aW5tdXggPD09CgAAEgkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC91YXJ0NC1pZGxlLTAvcGluczIvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0NC1pZGxlLTAvcGluczIv
bmFtZSA8PT0KcGluczIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvdWFydDQtaWRsZS0wL25hbWUgPD09CnVhcnQ0LWlkbGUtMAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDBiMDAwL3N0LGJh
bmstbmFtZSA8PT0KR1BJT0oACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvZ3Bpb0A1MDAwYjAwMC9jbG9ja3MgPD09CgAAAAwAAABdCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwYjAwMC9ncGlv
LWNvbnRyb2xsZXIgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL2dwaW9ANTAwMGIwMDAvZ3Bpby1yYW5nZXMgPD09CgAAAI8AAAAAAAAAkAAAABAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUw
MDBiMDAwL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDBiMDAwLyNpbnRlcnJ1cHQtY2VsbHMgPD09CgAAAAIK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUw
MDBiMDAwL25ncGlvcyA8PT0KAAAAEAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMGIwMDAvcGhhbmRsZSA8PT0KAAABIwo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMGIwMDAvcmVn
IDw9PQoAAJAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL2dwaW9ANTAwMGIwMDAvI2dwaW8tY2VsbHMgPD09CgAAAAIKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDBiMDAwL25hbWUgPD09
CmdwaW8ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
Z3Bpb0A1MDAwYjAwMC9pbnRlcnJ1cHQtY29udHJvbGxlciA8PT0KCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNib3RnLWZzLWRwLWRtLTAvcGlucy9w
aW5tdXggPD09CgAACxEAAAwRCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvdXNib3RnLWZzLWRwLWRtLTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYm90Zy1mcy1kcC1k
bS0wL3BoYW5kbGUgPD09CgAAAY0KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC91c2JvdGctZnMtZHAtZG0tMC9uYW1lIDw9PQp1c2JvdGctZnMtZHAtZG0t
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9yZ21p
aS0yL3BpbnMzL3Bpbm11eCA8PT0KAAAkDAAAJQwAAHYMAAARDAAAAQwAAAcMCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMi9waW5zMy9iaWFz
LWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3JnbWlpLTIvcGluczMvbmFtZSA8PT0KcGluczMACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMi9waW5zMS9waW5tdXggPD09CgAA
ZQwAAGQMAAAcDAAAbgwAACIMAABCDAAAawwAACEMCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMi9waW5zMS9iaWFzLWRpc2FibGUgPD09Cgo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3JnbWlpLTIv
cGluczEvc2xldy1yYXRlIDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMi9waW5zMS9uYW1lIDw9PQpwaW5zMQAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9yZ21paS0yL3BpbnMxL2Ry
aXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvcmdtaWktMi9waGFuZGxlIDw9PQoAAAEvCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMi9waW5zMi9waW5tdXggPD09CgAA
AgwKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9yZ21p
aS0yL3BpbnMyL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMi9waW5zMi9zbGV3LXJhdGUgPD09CgAAAAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9yZ21paS0yL3Bp
bnMyL25hbWUgPD09CnBpbnMyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3JnbWlpLTIvcGluczIvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9yZ21paS0yL25hbWUgPD09
CnJnbWlpLTIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvbTQtcmdtaWktMC9waW5zL3Bpbm11eCA8PT0KAABlEgAAZBIAAG0SAABuEgAAIhIAAEISAAAb
EgAAIRIAAAISAAAkEgAAJRIAABASAAAREgAAARIAAAcSCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtcmdtaWktMC9waW5zL25hbWUgPD09CnBpbnMA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtcmdt
aWktMC9waGFuZGxlIDw9PQoAAAGZCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvbTQtcmdtaWktMC9uYW1lIDw9PQptNC1yZ21paS0wAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXNkbW1jMy1iNC0wL3Bp
bnMvcGlubXV4IDw9PQoAAFASAABUEgAAVRIAADcSAABREgAAbxIKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1zZG1tYzMtYjQtMC9waW5zL25hbWUg
PD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvbTQtc2RtbWMzLWI0LTAvcGhhbmRsZSA8PT0KAAABugo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXNkbW1jMy1iNC0wL25hbWUgPD09Cm00LXNk
bW1jMy1iNC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL2kyYzEtMS9waW5zL2RyaXZlLW9wZW4tZHJhaW4gPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzEtMS9waW5zL3Bpbm11eCA8PT0KAABe
BgAAXwYKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9p
MmMxLTEvcGlucy9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzEtMS9waW5zL3NsZXctcmF0ZSA8PT0KAAAAAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzEtMS9waW5z
L25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvaTJjMS0xL3BoYW5kbGUgPD09CgAAATcKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmMxLTEvbmFtZSA8PT0KaTJjMS0xAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTUtMC9waW5zL3Bp
bm11eCA8PT0KAAB7Awo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3B3bTUtMC9waW5zL3NsZXctcmF0ZSA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTUtMC9waW5zL2JpYXMtcHVsbC1kb3du
IDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9w
d201LTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL3B3bTUtMC9waW5zL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdtNS0wL3BoYW5k
bGUgPD09CgAAAVcKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9wd201LTAvbmFtZSA8PT0KcHdtNS0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL2ZtYy0xL3BpbnMvcGlubXV4IDw9PQoAADQNAAA1DQAAFw0A
AD4NAAA/DQAAMA0AADENAABHDQAASA0AAEkNAABKDQAASw0AAEwNAABNDQAATg0AAE8NAAA4DQAA
OQ0AADoNAABpDQAAbA0KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9mbWMtMS9waW5zL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZm1jLTEvcGlucy9zbGV3LXJhdGUgPD09CgAA
AAMKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9mbWMt
MS9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvZm1jLTEvcGlucy9kcml2ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2ZtYy0xL3BoYW5kbGUgPD09
CgAAATMKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9m
bWMtMS9uYW1lIDw9PQpmbWMtMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9pbnRlcnJ1cHQtcGFyZW50IDw9PQoAAAASCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtZGZzZG0tZGF0YTMtcGlucy0wL3Bp
bnMvcGlubXV4IDw9PQoAAF0SCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvbTQtZGZzZG0tZGF0YTMtcGlucy0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1kZnNkbS1k
YXRhMy1waW5zLTAvcGhhbmRsZSA8PT0KAAABmAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL200LWRmc2RtLWRhdGEzLXBpbnMtMC9uYW1lIDw9PQptNC1k
ZnNkbS1kYXRhMy1waW5zLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvI2FkZHJlc3MtY2VsbHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzEtZGlyLTAvcGluczEvcGlubXV4IDw9
PQoAAFIMAAAnCQAAGQwKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9zZG1tYzEtZGlyLTAvcGluczEvc2xldy1yYXRlIDw9PQoAAAABCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMxLWRpci0wL3BpbnMx
L2JpYXMtcHVsbC11cCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvc2RtbWMxLWRpci0wL3BpbnMxL25hbWUgPD09CnBpbnMxAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1kaXItMC9waW5z
MS9kcml2ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1kaXItMC9waGFuZGxlIDw9PQoAAABzCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMxLWRpci0wL3BpbnMy
L3Bpbm11eCA8PT0KAABECQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3NkbW1jMS1kaXItMC9waW5zMi9iaWFzLXB1bGwtdXAgPD09Cgo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1kaXItMC9waW5z
Mi9uYW1lIDw9PQpwaW5zMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9zZG1tYzEtZGlyLTAvbmFtZSA8PT0Kc2RtbWMxLWRpci0wAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NwaTItMC9waW5zMS9waW5t
dXggPD09CgAAGgYAAIMGCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvc3BpMi0wL3BpbnMxL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc3BpMi0wL3BpbnMxL3NsZXctcmF0ZSA8
PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L3NwaTItMC9waW5zMS9uYW1lIDw9PQpwaW5zMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9zcGkyLTAvcGluczEvZHJpdmUtcHVzaC1wdWxsIDw9PQoK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zcGkyLTAv
cGhhbmRsZSA8PT0KAAABcgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3NwaTItMC9waW5zMi9waW5tdXggPD09CgAAggYKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zcGkyLTAvcGluczIvYmlhcy1kaXNhYmxl
IDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9z
cGkyLTAvcGluczIvbmFtZSA8PT0KcGluczIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvc3BpMi0wL25hbWUgPD09CnNwaTItMAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMtaWRsZS0xL3BpbnMz
L3Bpbm11eCA8PT0KAAAcCQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3VzYXJ0My1pZGxlLTEvcGluczMvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMtaWRsZS0xL3Bp
bnMzL25hbWUgPD09CnBpbnMzAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3VzYXJ0My1pZGxlLTEvcGluczEvcGlubXV4IDw9PQoAABoRAACKEQo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0My1pZGxl
LTEvcGluczEvbmFtZSA8PT0KcGluczEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvdXNhcnQzLWlkbGUtMS9waGFuZGxlIDw9PQoAAAAZCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQzLWlkbGUtMS9w
aW5zMi9waW5tdXggPD09CgAAaAkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC91c2FydDMtaWRsZS0xL3BpbnMyL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQzLWlkbGUt
MS9waW5zMi9zbGV3LXJhdGUgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC91c2FydDMtaWRsZS0xL3BpbnMyL25hbWUgPD09CnBpbnMyAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0My1p
ZGxlLTEvcGluczIvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMtaWRsZS0xL25hbWUgPD09CnVzYXJ0My1p
ZGxlLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
bHRkYy1zbGVlcC0yL3BpbnMxL3Bpbm11eCA8PT0KAAAREQAAGREAACARAAAzEQAANhEAADoRAABL
EQAATBEAAE0RAABPEQAAdBEAAHgRAAB5EQAAehEAAH0RAAB/EQAAgREAAIURAACGEQAAiREAAIoR
AABOEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2x0
ZGMtc2xlZXAtMi9waW5zMS9uYW1lIDw9PQpwaW5zMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9sdGRjLXNsZWVwLTIvcGhhbmRsZSA8PT0KAAABRgo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2x0ZGMtc2xl
ZXAtMi9uYW1lIDw9PQpsdGRjLXNsZWVwLTIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvc3BkaWZyeC1zbGVlcC0wL3BpbnMvcGlubXV4IDw9PQoAAGwR
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc3BkaWZy
eC1zbGVlcC0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9zcGRpZnJ4LXNsZWVwLTAvcGhhbmRsZSA8PT0KAAAAFQo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NwZGlmcngt
c2xlZXAtMC9uYW1lIDw9PQpzcGRpZnJ4LXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZGNtaS0wL3BpbnMvcGlubXV4IDw9PQoAAHgOAAAX
DgAABg4AAHkOAAB6DgAAew4AAHwOAAB+DgAAhA4AABgOAABGDgAAgQ4AAHcOAACDDgAAfw4KPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9kY21pLTAvcGlu
cy9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL2RjbWktMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZGNtaS0wL3BoYW5kbGUgPD09CgAAAFgK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9kY21pLTAv
bmFtZSA8PT0KZGNtaS0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL2x0ZGMtMi9waW5zMS9waW5tdXggPD09CgAAEQoAABkPAAAgDwAAMw8AADYPAAA6
DwAASw8AAEwPAABNDwAATw8AAHQKAAB4DwAAeQ8AAHoPAAB9DwAAfw8AAIEPAACFDwAAhg8AAIkP
AACKDwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2x0
ZGMtMi9waW5zMS9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL2x0ZGMtMi9waW5zMS9zbGV3LXJhdGUgPD09CgAAAAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9sdGRjLTIvcGlu
czEvbmFtZSA8PT0KcGluczEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvbHRkYy0yL3BpbnMxL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbHRkYy0yL3BoYW5kbGUgPD09
CgAAAUUKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9s
dGRjLTIvcGluczIvcGlubXV4IDw9PQoAAE4PCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvbHRkYy0yL3BpbnMyL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbHRkYy0yL3BpbnMy
L3NsZXctcmF0ZSA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL2x0ZGMtMi9waW5zMi9uYW1lIDw9PQpwaW5zMgAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9sdGRjLTIvcGluczIvZHJpdmUtcHVz
aC1wdWxsIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9sdGRjLTIvbmFtZSA8PT0KbHRkYy0yAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL200LWhkcDYtMC9waW5zL3Bpbm11eCA8PT0KAAClEgo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LWhkcDYtMC9w
aW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvbTQtaGRwNi0wL3BoYW5kbGUgPD09CgAAAZwKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1oZHA2LTAvbmFtZSA8PT0KbTQtaGRw
Ni0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2ky
YzUtc2xlZXAtMS9waW5zL3Bpbm11eCA8PT0KAAAwEQAAMREKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmM1LXNsZWVwLTEvcGlucy9uYW1lIDw9PQpw
aW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2ky
YzUtc2xlZXAtMS9waGFuZGxlIDw9PQoAAAE+Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvaTJjNS1zbGVlcC0xL25hbWUgPD09CmkyYzUtc2xlZXAtMQAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0Ny0y
L3BpbnMxL3Bpbm11eCA8PT0KAABICAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL3VhcnQ3LTIvcGluczEvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0Ny0yL3BpbnMxL3Ns
ZXctcmF0ZSA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3VhcnQ3LTIvcGluczEvbmFtZSA8PT0KcGluczEACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDctMi9waW5zMS9kcml2ZS1wdXNo
LXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL3VhcnQ3LTIvcGhhbmRsZSA8PT0KAAABfQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3VhcnQ3LTIvcGluczIvcGlubXV4IDw9PQoAAEcICj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDctMi9waW5z
Mi9iaWFzLXB1bGwtdXAgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3VhcnQ3LTIvcGluczIvbmFtZSA8PT0KcGluczIACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDctMi9uYW1lIDw9PQp1YXJ0
Ny0yAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3
bTItc2xlZXAtMC9waW5zL3Bpbm11eCA8PT0KAAADEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTItc2xlZXAtMC9waW5zL25hbWUgPD09CnBpbnMA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdtMi1z
bGVlcC0wL3BoYW5kbGUgPD09CgAAAA4KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9wd20yLXNsZWVwLTAvbmFtZSA8PT0KcHdtMi1zbGVlcC0wAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3JtaWktMC9waW5z
MS9waW5tdXggPD09CgAAbQwAAG4MAAAbDAAAAQEAAAIMAAAhDAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3JtaWktMC9waW5zMS9iaWFzLWRpc2FibGUg
PD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3Jt
aWktMC9waW5zMS9zbGV3LXJhdGUgPD09CgAAAAIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9ybWlpLTAvcGluczEvbmFtZSA8PT0KcGluczEACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcm1paS0wL3BpbnMx
L2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvcm1paS0wL3BoYW5kbGUgPD09CgAAATEKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ybWlpLTAvcGluczIvcGlubXV4IDw9PQoA
ACQMAAAlDAAABwwKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9ybWlpLTAvcGluczIvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ybWlpLTAvcGluczIvbmFtZSA8PT0KcGluczIA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcm1paS0w
L25hbWUgPD09CnJtaWktMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9tNC11YXJ0Ny0wL3BpbnMvcGlubXV4IDw9PQoAAEgSAABHEgo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXVhcnQ3LTAvcGlucy9u
YW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL200LXVhcnQ3LTAvcGhhbmRsZSA8PT0KAAABwAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXVhcnQ3LTAvbmFtZSA8PT0KbTQtdWFydDct
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0
NC0wL3BpbnMxL3Bpbm11eCA8PT0KAABrBwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL3VhcnQ0LTAvcGluczEvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0NC0wL3BpbnMx
L3NsZXctcmF0ZSA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3VhcnQ0LTAvcGluczEvbmFtZSA8PT0KcGluczEACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDQtMC9waW5zMS9kcml2ZS1w
dXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3VhcnQ0LTAvcGhhbmRsZSA8PT0KAAAAGgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VhcnQ0LTAvcGluczIvcGlubXV4IDw9PQoAABIJCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDQtMC9w
aW5zMi9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL3VhcnQ0LTAvcGluczIvbmFtZSA8PT0KcGluczIACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDQtMC9uYW1lIDw9PQp1
YXJ0NC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L200LWRmc2RtLWNsa291dC1waW5zLTAvcGlucy9waW5tdXggPD09CgAAHRIKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1kZnNkbS1jbGtvdXQtcGlu
cy0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9tNC1kZnNkbS1jbGtvdXQtcGlucy0wL3BoYW5kbGUgPD09CgAAAZYK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1kZnNk
bS1jbGtvdXQtcGlucy0wL25hbWUgPD09Cm00LWRmc2RtLWNsa291dC1waW5zLTAACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtbS1jYW4xLTAvcGlu
cy9waW5tdXggPD09CgAAfRIAAIkSCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvbTQtbS1jYW4xLTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LW0tY2FuMS0wL3BoYW5k
bGUgPD09CgAAAaQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9tNC1tLWNhbjEtMC9uYW1lIDw9PQptNC1tLWNhbjEtMAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd20zLTEvcGlucy9waW5tdXggPD09CgAA
FQMKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd20z
LTEvcGlucy9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL3B3bTMtMS9waW5zL3NsZXctcmF0ZSA8PT0KAAAAAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTMtMS9waW5zL25h
bWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvcHdtMy0xL3BpbnMvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd20zLTEvcGhhbmRsZSA8PT0KAAABUQo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTMtMS9u
YW1lIDw9PQpwd20zLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvbS1jYW4xLTAvcGluczEvcGlubXV4IDw9PQoAAH0KCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbS1jYW4xLTAvcGluczEvYmlhcy1kaXNh
YmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9tLWNhbjEtMC9waW5zMS9zbGV3LXJhdGUgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tLWNhbjEtMC9waW5zMS9uYW1lIDw9PQpwaW5z
MQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tLWNh
bjEtMC9waW5zMS9kcml2ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL20tY2FuMS0wL3BoYW5kbGUgPD09CgAAAJEKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tLWNhbjEtMC9waW5z
Mi9waW5tdXggPD09CgAAiQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9tLWNhbjEtMC9waW5zMi9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL20tY2FuMS0wL3BpbnMyL25hbWUg
PD09CnBpbnMyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL20tY2FuMS0wL25hbWUgPD09Cm0tY2FuMS0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0Mi1zbGVlcC0xL3BpbnMvcGlubXV4IDw9PQoA
AFURAAABEQAAVBEAAE8RCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvdXNhcnQyLXNsZWVwLTEvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0Mi1zbGVlcC0xL3BoYW5k
bGUgPD09CgAAAYUKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC91c2FydDItc2xlZXAtMS9uYW1lIDw9PQp1c2FydDItc2xlZXAtMQAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC8jc2l6ZS1jZWxscyA8PT0KAAAA
AQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LWky
czItMC9waW5zL3Bpbm11eCA8PT0KAACDEgAAGRIAAAkSCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtaTJzMi0wL3BpbnMvbmFtZSA8PT0KcGlucwAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1pMnMy
LTAvcGhhbmRsZSA8PT0KAAABoQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL200LWkyczItMC9uYW1lIDw9PQptNC1pMnMyLTAACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwODAwMC9zdCxiYW5r
LW5hbWUgPD09CkdQSU9HAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL2dwaW9ANTAwMDgwMDAvY2xvY2tzIDw9PQoAAAAMAAAAWgo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDgwMDAvZ3Bpby1j
b250cm9sbGVyIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9ncGlvQDUwMDA4MDAwL2dwaW8tcmFuZ2VzIDw9PQoAAACPAAAAAAAAAGAAAAAQCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAw
ODAwMC9zdGF0dXMgPD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwODAwMC8jaW50ZXJydXB0LWNlbGxzIDw9PQoAAAACCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAw
ODAwMC9uZ3Bpb3MgPD09CgAAABAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9ncGlvQDUwMDA4MDAwL3BoYW5kbGUgPD09CgAAAHcKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDA4MDAwL3JlZyA8
PT0KAABgAAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9ncGlvQDUwMDA4MDAwLyNncGlvLWNlbGxzIDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwODAwMC9uYW1lIDw9PQpn
cGlvAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dw
aW9ANTAwMDgwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXIgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1iNC1vZC0wL3BpbnMzL2RyaXZl
LW9wZW4tZHJhaW4gPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3NkbW1jMS1iNC1vZC0wL3BpbnMzL3Bpbm11eCA8PT0KAAAyDQo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1iNC1vZC0wL3Bp
bnMzL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvc2RtbWMxLWI0LW9kLTAvcGluczMvc2xldy1yYXRlIDw9PQoAAAABCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMxLWI0
LW9kLTAvcGluczMvbmFtZSA8PT0KcGluczMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMxLWI0LW9kLTAvcGluczEvcGlubXV4IDw9PQoAACgN
AAApDQAAKg0AACsNCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvc2RtbWMxLWI0LW9kLTAvcGluczEvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzEtYjQtb2QtMC9waW5z
MS9zbGV3LXJhdGUgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9zZG1tYzEtYjQtb2QtMC9waW5zMS9uYW1lIDw9PQpwaW5zMQAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzEtYjQtb2Qt
MC9waW5zMS9kcml2ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1iNC1vZC0wL3BoYW5kbGUgPD09CgAAAHQKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzEtYjQt
b2QtMC9waW5zMi9waW5tdXggPD09CgAALA0KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzEtYjQtb2QtMC9waW5zMi9iaWFzLWRpc2FibGUgPD09
Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1j
MS1iNC1vZC0wL3BpbnMyL3NsZXctcmF0ZSA8PT0KAAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1iNC1vZC0wL3BpbnMyL25hbWUgPD09
CnBpbnMyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L3NkbW1jMS1iNC1vZC0wL3BpbnMyL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMxLWI0LW9kLTAvbmFtZSA8
PT0Kc2RtbWMxLWI0LW9kLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvbTQtcnRjLW91dDItcm1wLXBpbnMtMC9waW5zL3Bpbm11eCA8PT0KAACIEgo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXJ0Yy1v
dXQyLXJtcC1waW5zLTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXJ0Yy1vdXQyLXJtcC1waW5zLTAvcGhhbmRs
ZSA8PT0KAAABsAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL200LXJ0Yy1vdXQyLXJtcC1waW5zLTAvbmFtZSA8PT0KbTQtcnRjLW91dDItcm1wLXBpbnMt
MAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9yZ21p
aS1zbGVlcC0yL3BpbnMxL3Bpbm11eCA8PT0KAABlEQAAZBEAABwRAABuEQAAIhEAAEIRAABrEQAA
AhEAACERAAAkEQAAJREAAHYRAAAREQAAAREAAAcRCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktc2xlZXAtMi9waW5zMS9uYW1lIDw9PQpwaW5z
MQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9yZ21p
aS1zbGVlcC0yL3BoYW5kbGUgPD09CgAAATAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9yZ21paS1zbGVlcC0yL25hbWUgPD09CnJnbWlpLXNsZWVwLTIA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtaTJj
MS0wL3BpbnMvcGlubXV4IDw9PQoAADwSAABfEgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL200LWkyYzEtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtaTJjMS0wL3Bo
YW5kbGUgPD09CgAAAZ4KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9tNC1pMmMxLTAvbmFtZSA8PT0KbTQtaTJjMS0wAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LWNlYy0xL3BpbnMvcGlubXV4IDw9PQoA
ABYSCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQt
Y2VjLTEvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL200LWNlYy0xL3BoYW5kbGUgPD09CgAAAZIKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1jZWMtMS9uYW1lIDw9PQpt
NC1jZWMtMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9yZ21paS0wL3BpbnMzL3Bpbm11eCA8PT0KAAAkDAAAJQwAABAMAAARDAAAAQwAAAcMCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMC9waW5z
My9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3JnbWlpLTAvcGluczMvbmFtZSA8PT0KcGluczMACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMC9waW5zMS9waW5tdXgg
PD09CgAAZQwAAGQMAABtDAAAbgwAACIMAABCDAAAGwwAACEMCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMC9waW5zMS9iaWFzLWRpc2FibGUg
PD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3Jn
bWlpLTAvcGluczEvc2xldy1yYXRlIDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMC9waW5zMS9uYW1lIDw9PQpwaW5zMQAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9yZ21paS0wL3Bp
bnMxL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMC9waGFuZGxlIDw9PQoAAACACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMC9waW5zMi9waW5tdXgg
PD09CgAAAgwKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9yZ21paS0wL3BpbnMyL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcmdtaWktMC9waW5zMi9zbGV3LXJhdGUgPD09CgAA
AAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9yZ21p
aS0wL3BpbnMyL25hbWUgPD09CnBpbnMyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL3JnbWlpLTAvcGluczIvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9yZ21paS0wL25h
bWUgPD09CnJnbWlpLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvcHdtOC0wL3BpbnMvcGlubXV4IDw9PQoAAIIECj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdtOC0wL3BpbnMvc2xldy1yYXRlIDw9PQoA
AAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdt
OC0wL3BpbnMvYmlhcy1wdWxsLWRvd24gPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTgtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdtOC0wL3BpbnMvZHJp
dmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9wd204LTAvcGhhbmRsZSA8PT0KAAAAMgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTgtMC9uYW1lIDw9PQpwd204LTAACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMzLWI0LXNs
ZWVwLTAvcGlucy9waW5tdXggPD09CgAAUBEAAFQRAABVEQAANxEAAG8RAABREQo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC1zbGVlcC0w
L3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9zZG1tYzMtYjQtc2xlZXAtMC9waGFuZGxlIDw9PQoAAABTCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMzLWI0LXNsZWVw
LTAvbmFtZSA8PT0Kc2RtbWMzLWI0LXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwNTAwMC9zdCxiYW5rLW5hbWUgPD09CkdQ
SU9EAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dw
aW9ANTAwMDUwMDAvY2xvY2tzIDw9PQoAAAAMAAAAVwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDUwMDAvZ3Bpby1jb250cm9sbGVyIDw9
PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlv
QDUwMDA1MDAwL2dwaW8tcmFuZ2VzIDw9PQoAAACPAAAAAAAAADAAAAAQCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwNTAwMC9zdGF0dXMg
PD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvZ3Bpb0A1MDAwNTAwMC8jaW50ZXJydXB0LWNlbGxzIDw9PQoAAAACCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwNTAwMC9uZ3Bpb3Mg
PD09CgAAABAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9ncGlvQDUwMDA1MDAwL3BoYW5kbGUgPD09CgAAAKQKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDA1MDAwL3JlZyA8PT0KAAAwAAAABAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUw
MDA1MDAwLyNncGlvLWNlbGxzIDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwNTAwMC9uYW1lIDw9PQpncGlvAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDUwMDAv
aW50ZXJydXB0LWNvbnRyb2xsZXIgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL3B3bTQtc2xlZXAtMS9waW5zL3Bpbm11eCA8PT0KAAA9EQo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTQtc2xlZXAt
MS9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvcHdtNC1zbGVlcC0xL3BoYW5kbGUgPD09CgAAAVYKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd200LXNsZWVwLTEvbmFtZSA8
PT0KcHdtNC1zbGVlcC0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3NwaTUtMC9waW5zMS9waW5tdXggPD09CgAAVwYAAFkGCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc3BpNS0wL3BpbnMxL2JpYXMtZGlz
YWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvc3BpNS0wL3BpbnMxL3NsZXctcmF0ZSA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NwaTUtMC9waW5zMS9uYW1lIDw9PQpwaW5zMQAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zcGk1LTAv
cGluczEvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9zcGk1LTAvcGhhbmRsZSA8PT0KAAABdgo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NwaTUtMC9waW5zMi9waW5tdXgg
PD09CgAAWAYKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9zcGk1LTAvcGluczIvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zcGk1LTAvcGluczIvbmFtZSA8PT0KcGluczIACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc3BpNS0wL25h
bWUgPD09CnNwaTUtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9kZnNkbS1kYXRhMy1waW5zLTAvcGlucy9waW5tdXggPD09CgAAXQcKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9kZnNkbS1kYXRhMy1waW5z
LTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL2Rmc2RtLWRhdGEzLXBpbnMtMC9waGFuZGxlIDw9PQoAAAA+Cj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZGZzZG0tZGF0YTMt
cGlucy0wL25hbWUgPD09CmRmc2RtLWRhdGEzLXBpbnMtMAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWkyYS1zbGVlcC0xL3BpbnMvcGlubXV4IDw9
PQoAAIYRAACHEQAAPREKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9zYWkyYS1zbGVlcC0xL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWkyYS1zbGVlcC0xL3BoYW5kbGUg
PD09CgAAAV0KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9zYWkyYS1zbGVlcC0xL25hbWUgPD09CnNhaTJhLXNsZWVwLTEACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbHRkYy1zbGVlcC0wL3BpbnMvcGlubXV4
IDw9PQoAAGcRAACKEQAAiREAAFoRAAByEQAAcxEAAHgRAAB5EQAAehEAACARAAB8EQAATxEAAEUR
AABGEQAAfREAAH4RAAB/EQAAgBEAAIERAACCEQAAOREAAGwRAABqEQAAOhEAAIQRAAADEQAAGBEA
ADgRCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbHRk
Yy1zbGVlcC0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9sdGRjLXNsZWVwLTAvcGhhbmRsZSA8PT0KAAABQgo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2x0ZGMtc2xlZXAt
MC9uYW1lIDw9PQpsdGRjLXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwMjAwMC9zdCxiYW5rLW5hbWUgPD09CkdQSU9BAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAw
MDIwMDAvY2xvY2tzIDw9PQoAAAAMAAAAVAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDIwMDAvZ3Bpby1jb250cm9sbGVyIDw9PQoKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDAy
MDAwL2dwaW8tcmFuZ2VzIDw9PQoAAACPAAAAAAAAAAAAAAAQCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwMjAwMC9zdGF0dXMgPD09Cm9r
YXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bp
b0A1MDAwMjAwMC8jaW50ZXJydXB0LWNlbGxzIDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwMjAwMC9uZ3Bpb3MgPD09CgAA
ABAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlv
QDUwMDAyMDAwL3BoYW5kbGUgPD09CgAAAFwKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDAyMDAwL3JlZyA8PT0KAAAAAAAABAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDAyMDAw
LyNncGlvLWNlbGxzIDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwMjAwMC9uYW1lIDw9PQpncGlvAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDIwMDAvaW50ZXJy
dXB0LWNvbnRyb2xsZXIgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3BoYW5kbGUgPD09CgAAAI8KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9kZnNkbS1jbGtvdXQtcGlucy0wL3BpbnMvcGlubXV4IDw9
PQoAAB0ECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
ZGZzZG0tY2xrb3V0LXBpbnMtMC9waW5zL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZGZzZG0tY2xrb3V0LXBpbnMtMC9w
aW5zL3NsZXctcmF0ZSA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL2Rmc2RtLWNsa291dC1waW5zLTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2Rmc2RtLWNs
a291dC1waW5zLTAvcGlucy9kcml2ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2Rmc2RtLWNsa291dC1waW5zLTAvcGhhbmRs
ZSA8PT0KAAAAPAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL2Rmc2RtLWNsa291dC1waW5zLTAvbmFtZSA8PT0KZGZzZG0tY2xrb3V0LXBpbnMtMAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9sdGRjLTAvcGlu
cy9waW5tdXggPD09CgAAZw8AAIoPAACJDwAAWg8AAHIPAABzDwAAeA8AAHkPAAB6DwAAIA8AAHwP
AABPDwAARQ8AAEYPAAB9DwAAfg8AAH8PAACADwAAgQ8AAIIPAAA5DwAAbA8AAGoPAAA6DwAAhA8A
AAMPAAAYDwAAOA8KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9sdGRjLTAvcGlucy9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2x0ZGMtMC9waW5zL3NsZXctcmF0ZSA8PT0KAAAA
AQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2x0ZGMt
MC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvbHRkYy0wL3BpbnMvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9sdGRjLTAvcGhhbmRsZSA8
PT0KAAABQQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L2x0ZGMtMC9uYW1lIDw9PQpsdGRjLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvc3QscGFja2FnZSA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC1vZC0xL3BpbnMzL2RyaXZl
LW9wZW4tZHJhaW4gPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3NkbW1jMy1iNC1vZC0xL3BpbnMzL3Bpbm11eCA8PT0KAAAwCwo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC1vZC0xL3Bp
bnMzL3NsZXctcmF0ZSA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC1vZC0xL3BpbnMzL2JpYXMtcHVsbC11cCA8PT0KCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMzLWI0
LW9kLTEvcGluczMvbmFtZSA8PT0KcGluczMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMzLWI0LW9kLTEvcGluczEvcGlubXV4IDw9PQoAAFAK
AABUCgAANQsAADcLCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvc2RtbWMzLWI0LW9kLTEvcGluczEvc2xldy1yYXRlIDw9PQoAAAABCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMzLWI0LW9kLTEvcGlu
czEvYmlhcy1wdWxsLXVwIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9zZG1tYzMtYjQtb2QtMS9waW5zMS9uYW1lIDw9PQpwaW5zMQAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzMtYjQtb2Qt
MS9waW5zMS9kcml2ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC1vZC0xL3BoYW5kbGUgPD09CgAAAXAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzMtYjQt
b2QtMS9waW5zMi9waW5tdXggPD09CgAAbwsKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzMtYjQtb2QtMS9waW5zMi9zbGV3LXJhdGUgPD09CgAA
AAIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1t
YzMtYjQtb2QtMS9waW5zMi9iaWFzLXB1bGwtdXAgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC1vZC0xL3BpbnMyL25hbWUgPD09
CnBpbnMyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L3NkbW1jMy1iNC1vZC0xL3BpbnMyL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMzLWI0LW9kLTEvbmFtZSA8
PT0Kc2RtbWMzLWI0LW9kLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvaTJjMi1zbGVlcC0xL3BpbnMvcGlubXV4IDw9PQoAAHURCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaTJjMi1zbGVlcC0xL3BpbnMv
bmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9pMmMyLXNsZWVwLTEvcGhhbmRsZSA8PT0KAAABOgo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzItc2xlZXAtMS9uYW1lIDw9PQppMmMy
LXNsZWVwLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvZGFjLWNoMS0wL3BpbnMvcGlubXV4IDw9PQoAAAQRCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZGFjLWNoMS0wL3BpbnMvbmFtZSA8PT0KcGlucwAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9kYWMtY2gx
LTAvcGhhbmRsZSA8PT0KAAAALwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL2RhYy1jaDEtMC9uYW1lIDw9PQpkYWMtY2gxLTAACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDctMC9waW5zMS9waW5tdXgg
PD09CgAASAgKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC91YXJ0Ny0wL3BpbnMxL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDctMC9waW5zMS9zbGV3LXJhdGUgPD09CgAA
AAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0
Ny0wL3BpbnMxL25hbWUgPD09CnBpbnMxAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL3VhcnQ3LTAvcGluczEvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0Ny0wL3Bo
YW5kbGUgPD09CgAAAXsKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC91YXJ0Ny0wL3BpbnMyL3Bpbm11eCA8PT0KAABHCAAASggAAEkICj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDctMC9waW5zMi9iaWFz
LWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3VhcnQ3LTAvcGluczIvbmFtZSA8PT0KcGluczIACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDctMC9uYW1lIDw9PQp1YXJ0Ny0wAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXB3bTMt
MC9waW5zL3Bpbm11eCA8PT0KAAAnEgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL200LXB3bTMtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtcHdtMy0wL3BoYW5kbGUg
PD09CgAAAacKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9tNC1wd20zLTAvbmFtZSA8PT0KbTQtcHdtMy0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXNkbW1jMi1iNC0wL3BpbnMvcGlubXV4IDw9PQoA
AB4SAAAfEgAAExIAABQSAABmEgAAQxIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9tNC1zZG1tYzItYjQtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc2RtbWMyLWI0
LTAvcGhhbmRsZSA8PT0KAAABtwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL200LXNkbW1jMi1iNC0wL25hbWUgPD09Cm00LXNkbW1jMi1iNC0wAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzItMi9waW5z
L2RyaXZlLW9wZW4tZHJhaW4gPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL2kyYzItMi9waW5zL3Bpbm11eCA8PT0KAABRBQAAdQUKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmMyLTIvcGlucy9iaWFz
LWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL2kyYzItMi9waW5zL3NsZXctcmF0ZSA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzItMi9waW5zL25hbWUgPD09CnBpbnMA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaTJjMi0y
L3BoYW5kbGUgPD09CgAAATsKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9pMmMyLTIvbmFtZSA8PT0KaTJjMi0yAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3J0Yy1vdXQyLXJtcC1waW5zLTAvcGlucy9waW5t
dXggPD09CgAAiBEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9ydGMtb3V0Mi1ybXAtcGlucy0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ydGMtb3V0Mi1ybXAtcGlucy0w
L3BoYW5kbGUgPD09CgAAAVsKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9ydGMtb3V0Mi1ybXAtcGlucy0wL25hbWUgPD09CnJ0Yy1vdXQyLXJtcC1waW5z
LTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2Fp
MmEtMi9waW5zL3Bpbm11eCA8PT0KAAA9EQAAOxEAADwRCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpMmEtMi9waW5zL2JpYXMtZGlzYWJsZSA8PT0K
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpMmEt
Mi9waW5zL3NsZXctcmF0ZSA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL3NhaTJhLTIvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NhaTJhLTIvcGlucy9kcml2
ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3NhaTJhLTIvcGhhbmRsZSA8PT0KAAABXgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NhaTJhLTIvbmFtZSA8PT0Kc2FpMmEtMgAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1zYWkyYS0w
L3BpbnMvcGlubXV4IDw9PQoAAIUSAACGEgAAhxIAAEASCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc2FpMmEtMC9waW5zL25hbWUgPD09CnBpbnMA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc2Fp
MmEtMC9waGFuZGxlIDw9PQoAAAGxCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvbTQtc2FpMmEtMC9uYW1lIDw9PQptNC1zYWkyYS0wAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2hkcDYtc2xlZXAtMC9waW5z
L3Bpbm11eCA8PT0KAAClEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL2hkcDYtc2xlZXAtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaGRwNi1zbGVlcC0wL3BoYW5kbGUg
PD09CgAAAGcKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9oZHA2LXNsZWVwLTAvbmFtZSA8PT0KaGRwNi1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3JnbWlpLXNsZWVwLTAvcGluczEvcGlubXV4
IDw9PQoAAGURAABkEQAAbREAAG4RAAAiEQAAQhEAABsRAAACEQAAIREAACQRAAAlEQAAEBEAABER
AAABEQAABxEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9yZ21paS1zbGVlcC0wL3BpbnMxL25hbWUgPD09CnBpbnMxAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3JnbWlpLXNsZWVwLTAvcGhhbmRsZSA8PT0K
AAAAgQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3Jn
bWlpLXNsZWVwLTAvbmFtZSA8PT0KcmdtaWktc2xlZXAtMAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9oZHA3LTAvcGlucy9waW5tdXggPD09CgAApgMK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9oZHA3LTAv
cGlucy9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL2hkcDctMC9waW5zL3NsZXctcmF0ZSA8PT0KAAAAAgo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2hkcDctMC9waW5zL25hbWUg
PD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvaGRwNy0wL3BpbnMvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9oZHA3LTAvcGhhbmRsZSA8PT0KAAAAZQo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2hkcDctMC9uYW1l
IDw9PQpoZHA3LTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvbTQtbHRkYy1hLTAvcGlucy9waW5tdXggPD09CgAAZxIAAIoSAACJEgAAWhIAAHISAABz
EgAAeBIAAHkSAAB6EgAAIBIAAHwSAABPEgAARRIAAEYSAAB9EgAAfhIAAH8SAACAEgAAgRIAAIIS
AAA5EgAAbBIAAGoSAAA6EgAAhBIAAAMSAAAYEgAAOBIKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1sdGRjLWEtMC9waW5zL25hbWUgPD09CnBpbnMA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtbHRk
Yy1hLTAvcGhhbmRsZSA8PT0KAAABogo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL200LWx0ZGMtYS0wL25hbWUgPD09Cm00LWx0ZGMtYS0wAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2FkYzEyLWFpbi0xL3Bp
bnMvcGlubXV4IDw9PQoAAFwRAABdEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL2FkYzEyLWFpbi0xL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9hZGMxMi1haW4tMS9waGFu
ZGxlIDw9PQoAAAEmCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvYWRjMTItYWluLTEvbmFtZSA8PT0KYWRjMTItYWluLTEACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQyLTEvcGluczEvcGlubXV4IDw9
PQoAAFUIAAABCAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL3VzYXJ0Mi0xL3BpbnMxL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQyLTEvcGluczEvc2xldy1yYXRlIDw9
PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
dXNhcnQyLTEvcGluczEvbmFtZSA8PT0KcGluczEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQyLTEvcGluczEvZHJpdmUtcHVzaC1wdWxsIDw9
PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2Fy
dDItMS9waGFuZGxlIDw9PQoAAAGECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvdXNhcnQyLTEvcGluczIvcGlubXV4IDw9PQoAAFQIAABPCAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0Mi0xL3BpbnMy
L2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvdXNhcnQyLTEvcGluczIvbmFtZSA8PT0KcGluczIACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQyLTEvbmFtZSA8PT0KdXNh
cnQyLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
ZGNtaS1zbGVlcC0xL3BpbnMvcGlubXV4IDw9PQoAAAQRAAAXEQAABhEAACYRAAB6EQAAexEAAEER
AABLEQAAMxEAAE0RAAAZEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL2RjbWktc2xlZXAtMS9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZGNtaS1zbGVlcC0xL3BoYW5kbGUg
PD09CgAAASwKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9kY21pLXNsZWVwLTEvbmFtZSA8PT0KZGNtaS1zbGVlcC0xAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC0wL3BpbnMxL3Bpbm11eCA8
PT0KAABQCgAAVAoAAFUKAAA3CwAAUQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9zZG1tYzMtYjQtMC9waW5zMS9zbGV3LXJhdGUgPD09CgAAAAEKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzMtYjQt
MC9waW5zMS9iaWFzLXB1bGwtdXAgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC0wL3BpbnMxL25hbWUgPD09CnBpbnMxAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC0w
L3BpbnMxL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMzLWI0LTAvcGhhbmRsZSA8PT0KAAAAUQo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC0wL3Bp
bnMyL3Bpbm11eCA8PT0KAABvCwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3NkbW1jMy1iNC0wL3BpbnMyL3NsZXctcmF0ZSA8PT0KAAAAAgo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMy1iNC0wL3Bp
bnMyL2JpYXMtcHVsbC11cCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvc2RtbWMzLWI0LTAvcGluczIvbmFtZSA8PT0KcGluczIACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMzLWI0LTAvcGlu
czIvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9zZG1tYzMtYjQtMC9uYW1lIDw9PQpzZG1tYzMtYjQtMAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd20xLTAvcGlucy9w
aW5tdXggPD09CgAASQIAAEsCAABOAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL3B3bTEtMC9waW5zL3NsZXctcmF0ZSA8PT0KAAAAAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTEtMC9waW5zL2JpYXMt
cHVsbC1kb3duIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9wd20xLTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTEtMC9waW5zL2RyaXZlLXB1c2gtcHVsbCA8
PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdt
MS0wL3BoYW5kbGUgPD09CgAAAU0KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9wd20xLTAvbmFtZSA8PT0KcHdtMS0wAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VhcnQ3LXNsZWVwLTIvcGlucy9waW5tdXgg
PD09CgAASBEAAEcRCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvdWFydDctc2xlZXAtMi9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDctc2xlZXAtMi9waGFuZGxlIDw9
PQoAAAF/Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
dWFydDctc2xlZXAtMi9uYW1lIDw9PQp1YXJ0Ny1zbGVlcC0yAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzItMC9waW5zL2RyaXZlLW9wZW4tZHJh
aW4gPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L2kyYzItMC9waW5zL3Bpbm11eCA8PT0KAAB0BQAAdQUKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmMyLTAvcGlucy9iaWFzLWRpc2FibGUgPD09Cgo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzItMC9w
aW5zL3NsZXctcmF0ZSA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL2kyYzItMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaTJjMi0wL3BoYW5kbGUgPD09CgAA
AB0KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmMy
LTAvbmFtZSA8PT0KaTJjMi0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3NhaTJhLTAvcGlucy9waW5tdXggPD09CgAAhQsAAIYLAACHCwAAQAsKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWkyYS0wL3Bp
bnMvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9zYWkyYS0wL3BpbnMvc2xldy1yYXRlIDw9PQoAAAAACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpMmEtMC9waW5zL25hbWUg
PD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvc2FpMmEtMC9waW5zL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpMmEtMC9waGFuZGxlIDw9PQoAAAA2Cj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpMmEtMC9u
YW1lIDw9PQpzYWkyYS0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3NkbW1jMS1kaXItc2xlZXAtMC9waW5zL3Bpbm11eCA8PT0KAABSEQAAJxEAABkR
AABEEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3Nk
bW1jMS1kaXItc2xlZXAtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMxLWRpci1zbGVlcC0wL3BoYW5kbGUg
PD09CgAAAHYKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9zZG1tYzEtZGlyLXNsZWVwLTAvbmFtZSA8PT0Kc2RtbWMxLWRpci1zbGVlcC0wAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXB3bTEyLTAvcGlu
cy9waW5tdXggPD09CgAAdhIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9tNC1wd20xMi0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1wd20xMi0wL3BoYW5kbGUgPD09
CgAAAawKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9t
NC1wd20xMi0wL25hbWUgPD09Cm00LXB3bTEyLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc3R1c2IxNjAwLTAvcGlucy9waW5tdXggPD09CgAA
ixIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1z
dHVzYjE2MDAtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc3R1c2IxNjAwLTAvcGhhbmRsZSA8PT0KAAABvgo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXN0dXNi
MTYwMC0wL25hbWUgPD09Cm00LXN0dXNiMTYwMC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3FzcGktYmsxLXNsZWVwLTAvcGlucy9waW5tdXggPD09
CgAAWBEAAFkRAABXEQAAVhEAABYRCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvcXNwaS1iazEtc2xlZXAtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcXNwaS1iazEtc2xl
ZXAtMC9waGFuZGxlIDw9PQoAAABwCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvcXNwaS1iazEtc2xlZXAtMC9uYW1lIDw9PQpxc3BpLWJrMS1zbGVlcC0w
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NhaTRh
LXNsZWVwLTAvcGlucy9waW5tdXggPD09CgAAFREKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWk0YS1zbGVlcC0wL3BpbnMvbmFtZSA8PT0KcGlucwAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWk0YS1z
bGVlcC0wL3BoYW5kbGUgPD09CgAAAGEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9zYWk0YS1zbGVlcC0wL25hbWUgPD09CnNhaTRhLXNsZWVwLTAACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvY2VjLXNsZWVw
LTAvcGlucy9waW5tdXggPD09CgAADxEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9jZWMtc2xlZXAtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvY2VjLXNsZWVwLTAvcGhh
bmRsZSA8PT0KAAABKAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL2NlYy1zbGVlcC0wL25hbWUgPD09CmNlYy1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXVzYm90Z19ocy0wL3BpbnMvcGlu
bXV4IDw9PQoAAAoSCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvbTQtdXNib3RnX2hzLTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXVzYm90Z19ocy0wL3BoYW5kbGUg
PD09CgAAAcQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9tNC11c2JvdGdfaHMtMC9uYW1lIDw9PQptNC11c2JvdGdfaHMtMAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItZDQ3LTMvcGlucy9waW5t
dXggPD09CgAACAoAAAkLAABFCgAAJwsKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9zZG1tYzItZDQ3LTMvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1kNDctMy9w
aGFuZGxlIDw9PQoAAAFtCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvc2RtbWMyLWQ0Ny0zL25hbWUgPD09CnNkbW1jMi1kNDctMwAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1wd200LTEvcGlucy9waW5t
dXggPD09CgAAPRIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9tNC1wd200LTEvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXB3bTQtMS9waGFuZGxlIDw9PQoAAAGpCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtcHdtNC0x
L25hbWUgPD09Cm00LXB3bTQtMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9tNC1zZG1tYzEtYjQtMC9waW5zL3Bpbm11eCA8PT0KAAAoEgAAKRIAACoS
AAArEgAAMhIAACwSCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvbTQtc2RtbWMxLWI0LTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXNkbW1jMS1iNC0wL3BoYW5kbGUg
PD09CgAAAbUKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9tNC1zZG1tYzEtYjQtMC9uYW1lIDw9PQptNC1zZG1tYzEtYjQtMAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd200LTAvcGlucy9waW5tdXggPD09
CgAAPgMAAD8DCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvcHdtNC0wL3BpbnMvc2xldy1yYXRlIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdtNC0wL3BpbnMvYmlhcy1wdWxsLWRvd24gPD09
Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTQt
MC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvcHdtNC0wL3BpbnMvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd200LTAvcGhhbmRsZSA8
PT0KAAABUwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L3B3bTQtMC9uYW1lIDw9PQpwd200LTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWQ0Ny1zbGVlcC0yL3BpbnMvcGlubXV4IDw9PQoAAAgR
AAAPEQAAJhEAACcRCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvc2RtbWMyLWQ0Ny1zbGVlcC0yL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItZDQ3LXNsZWVwLTIv
cGhhbmRsZSA8PT0KAAABbAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3NkbW1jMi1kNDctc2xlZXAtMi9uYW1lIDw9PQpzZG1tYzItZDQ3LXNsZWVwLTIA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaGRwMC0w
L3BpbnMvcGlubXV4IDw9PQoAAIwDCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvaGRwMC0wL3BpbnMvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9oZHAwLTAvcGlucy9zbGV3LXJh
dGUgPD09CgAAAAIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9oZHAwLTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2hkcDAtMC9waW5zL2RyaXZlLXB1c2gtcHVsbCA8PT0K
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaGRwMC0w
L3BoYW5kbGUgPD09CgAAAGMKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9oZHAwLTAvbmFtZSA8PT0KaGRwMC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LWRmc2RtLWRhdGExLXBpbnMtMC9waW5zL3Bp
bm11eCA8PT0KAAAjEgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL200LWRmc2RtLWRhdGExLXBpbnMtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtZGZzZG0tZGF0YTEt
cGlucy0wL3BoYW5kbGUgPD09CgAAAZcKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9tNC1kZnNkbS1kYXRhMS1waW5zLTAvbmFtZSA8PT0KbTQtZGZzZG0t
ZGF0YTEtcGlucy0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL2dwaW9ANTAwMGEwMDAvc3QsYmFuay1uYW1lIDw9PQpHUElPSQAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDBhMDAwL2Nsb2Nr
cyA8PT0KAAAADAAAAFwKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9ncGlvQDUwMDBhMDAwL2dwaW8tY29udHJvbGxlciA8PT0KCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwYTAwMC9ncGlvLXJh
bmdlcyA8PT0KAAAAjwAAAAAAAACAAAAAEAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMGEwMDAvc3RhdHVzIDw9PQpva2F5AAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMGEwMDAv
I2ludGVycnVwdC1jZWxscyA8PT0KAAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMGEwMDAvbmdwaW9zIDw9PQoAAAAQCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwYTAwMC9w
aGFuZGxlIDw9PQoAAAAoCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvZ3Bpb0A1MDAwYTAwMC9yZWcgPD09CgAAgAAAAAQACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwYTAwMC8jZ3Bpby1jZWxs
cyA8PT0KAAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL2dwaW9ANTAwMGEwMDAvbmFtZSA8PT0KZ3BpbwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDBhMDAwL2ludGVycnVwdC1jb250cm9s
bGVyIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9tNC1kYWMtY2gxL3BpbnMvcGlubXV4IDw9PQoAAAQSCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtZGFjLWNoMS9waW5zL25hbWUgPD09CnBpbnMA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtZGFj
LWNoMS9waGFuZGxlIDw9PQoAAAGTCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvbTQtZGFjLWNoMS9uYW1lIDw9PQptNC1kYWMtY2gxAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzUtMC9waW5zL2RyaXZl
LW9wZW4tZHJhaW4gPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL2kyYzUtMC9waW5zL3Bpbm11eCA8PT0KAAALBQAADAUKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9pMmM1LTAvcGlucy9iaWFzLWRpc2Fi
bGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L2kyYzUtMC9waW5zL3NsZXctcmF0ZSA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzUtMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaTJjNS0wL3BoYW5k
bGUgPD09CgAAACwKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9pMmM1LTAvbmFtZSA8PT0KaTJjNS0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3JtaWktc2xlZXAtMC9waW5zMS9waW5tdXggPD09CgAAbREA
AG4RAAAbEQAAAhEAACERAAAkEQAAJREAAAERAAAHEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3JtaWktc2xlZXAtMC9waW5zMS9uYW1lIDw9PQpwaW5z
MQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ybWlp
LXNsZWVwLTAvcGhhbmRsZSA8PT0KAAABMgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1j
b250cm9sbGVyQDUwMDAyMDAwL3JtaWktc2xlZXAtMC9uYW1lIDw9PQpybWlpLXNsZWVwLTAACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZm1jLXNsZWVw
LTEvcGlucy9waW5tdXggPD09CgAANBEAADURAAAXEQAAPhEAAD8RAAAwEQAAMREAAEcRAABIEQAA
SREAAEoRAABLEQAATBEAAE0RAABOEQAATxEAADgRAAA5EQAAOhEAAGkRAABsEQo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2ZtYy1zbGVlcC0xL3BpbnMv
bmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9mbWMtc2xlZXAtMS9waGFuZGxlIDw9PQoAAAE0Cj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZm1jLXNsZWVwLTEvbmFtZSA8PT0KZm1jLXNs
ZWVwLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
cHdtMTItMC9waW5zL3Bpbm11eCA8PT0KAAB2Awo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTEyLTAvcGlucy9zbGV3LXJhdGUgPD09CgAAAAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd20xMi0wL3Bp
bnMvYmlhcy1wdWxsLWRvd24gPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL3B3bTEyLTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTEyLTAvcGlucy9kcml2ZS1w
dXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3B3bTEyLTAvcGhhbmRsZSA8PT0KAAAAEAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTEyLTAvbmFtZSA8PT0KcHdtMTItMAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd20zLXNsZWVwLTAv
cGlucy9waW5tdXggPD09CgAAJxEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9wd20zLXNsZWVwLTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTMtc2xlZXAtMC9waGFu
ZGxlIDw9PQoAAAFQCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvcHdtMy1zbGVlcC0wL25hbWUgPD09CnB3bTMtc2xlZXAtMAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMtMi9waW5zMS9waW5tdXgg
PD09CgAAGggAAGgJCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvdXNhcnQzLTIvcGluczEvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMtMi9waW5zMS9zbGV3LXJhdGUg
PD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC91c2FydDMtMi9waW5zMS9uYW1lIDw9PQpwaW5zMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMtMi9waW5zMS9kcml2ZS1wdXNoLXB1bGwg
PD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3Vz
YXJ0My0yL3BoYW5kbGUgPD09CgAAAYoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC91c2FydDMtMi9waW5zMi9waW5tdXggPD09CgAAHAkAAB0ICj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQzLTIvcGlu
czIvYmlhcy1wdWxsLXVwIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC91c2FydDMtMi9waW5zMi9uYW1lIDw9PQpwaW5zMgAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMtMi9uYW1lIDw9PQp1
c2FydDMtMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9tNC1xc3BpLWNsay0wL3BpbnMvcGlubXV4IDw9PQoAAFoSCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtcXNwaS1jbGstMC9waW5zL25hbWUgPD09
CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
bTQtcXNwaS1jbGstMC9waGFuZGxlIDw9PQoAAAGvCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtcXNwaS1jbGstMC9uYW1lIDw9PQptNC1xc3BpLWNs
ay0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3Nk
bW1jMi1iNC0wL3BpbnMxL3Bpbm11eCA8PT0KAAAeCgAAHwoAABMKAAAUCgAAZgsKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItYjQtMC9waW5z
MS9zbGV3LXJhdGUgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9zZG1tYzItYjQtMC9waW5zMS9iaWFzLXB1bGwtdXAgPD09Cgo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1iNC0wL3Bp
bnMxL25hbWUgPD09CnBpbnMxAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3NkbW1jMi1iNC0wL3BpbnMxL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWI0LTAv
cGhhbmRsZSA8PT0KAAAAego9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3NkbW1jMi1iNC0wL3BpbnMyL3Bpbm11eCA8PT0KAABDCgo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1iNC0wL3BpbnMyL3Ns
ZXctcmF0ZSA8PT0KAAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3NkbW1jMi1iNC0wL3BpbnMyL2JpYXMtcHVsbC11cCA8PT0KCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWI0LTAvcGluczIv
bmFtZSA8PT0KcGluczIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJA
NTAwMDIwMDAvc2RtbWMyLWI0LTAvcGluczIvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItYjQtMC9uYW1l
IDw9PQpzZG1tYzItYjQtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9tNC1xc3BpLWJrMi0wL3BpbnMvcGlubXV4IDw9PQoAAHISAABzEgAAahIAAGcS
AAAgEgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200
LXFzcGktYmsyLTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXFzcGktYmsyLTAvcGhhbmRsZSA8PT0KAAABrgo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXFzcGkt
YmsyLTAvbmFtZSA8PT0KbTQtcXNwaS1iazItMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMtc2xlZXAtMS9waW5zL3Bpbm11eCA8PT0KAAAa
EQAAaBEAAIoRAAAcEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3VzYXJ0My1zbGVlcC0xL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMtc2xlZXAtMS9waGFuZGxl
IDw9PQoAAAAYCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvdXNhcnQzLXNsZWVwLTEvbmFtZSA8PT0KdXNhcnQzLXNsZWVwLTEACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaGRwMC1zbGVlcC0wL3BpbnMvcGlu
bXV4IDw9PQoAAIwRCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvaGRwMC1zbGVlcC0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9oZHAwLXNsZWVwLTAvcGhhbmRsZSA8PT0K
AAAAZgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2hk
cDAtc2xlZXAtMC9uYW1lIDw9PQpoZHAwLXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWI0LW9kLTAvcGluczMvZHJpdmUtb3Bl
bi1kcmFpbiA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvc2RtbWMyLWI0LW9kLTAvcGluczMvcGlubXV4IDw9PQoAAGYLCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWI0LW9kLTAvcGluczMv
c2xldy1yYXRlIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvc2RtbWMyLWI0LW9kLTAvcGluczMvYmlhcy1wdWxsLXVwIDw9PQoKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItYjQtb2Qt
MC9waW5zMy9uYW1lIDw9PQpwaW5zMwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9zZG1tYzItYjQtb2QtMC9waW5zMS9waW5tdXggPD09CgAAHgoAAB8K
AAATCgAAFAoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9zZG1tYzItYjQtb2QtMC9waW5zMS9zbGV3LXJhdGUgPD09CgAAAAEKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItYjQtb2QtMC9waW5zMS9i
aWFzLXB1bGwtdXAgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3NkbW1jMi1iNC1vZC0wL3BpbnMxL25hbWUgPD09CnBpbnMxAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1iNC1vZC0wL3Bp
bnMxL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWI0LW9kLTAvcGhhbmRsZSA8PT0KAAAAfAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1iNC1vZC0w
L3BpbnMyL3Bpbm11eCA8PT0KAABDCgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1iNC1vZC0wL3BpbnMyL3NsZXctcmF0ZSA8PT0KAAAAAgo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMi1i
NC1vZC0wL3BpbnMyL2JpYXMtcHVsbC11cCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWI0LW9kLTAvcGluczIvbmFtZSA8PT0KcGlu
czIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2Rt
bWMyLWI0LW9kLTAvcGluczIvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItYjQtb2QtMC9uYW1lIDw9PQpz
ZG1tYzItYjQtb2QtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9pMmMxLXNsZWVwLTAvcGlucy9waW5tdXggPD09CgAAPBEAAF8RCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaTJjMS1zbGVlcC0wL3BpbnMv
bmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9pMmMxLXNsZWVwLTAvcGhhbmRsZSA8PT0KAAABNgo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2kyYzEtc2xlZXAtMC9uYW1lIDw9PQppMmMx
LXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvc2RtbWMyLWQ0Ny0xL3BpbnMvcGlubXV4IDw9PQoAAAgKAAAJCwAAJgsAACcLCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWQ0Ny0xL3Bp
bnMvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9zZG1tYzItZDQ3LTEvcGlucy9zbGV3LXJhdGUgPD09CgAAAAEKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItZDQ3LTEv
cGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3NkbW1jMi1kNDctMS9waW5zL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWQ0Ny0x
L3BoYW5kbGUgPD09CgAAAWkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9zZG1tYzItZDQ3LTEvbmFtZSA8PT0Kc2RtbWMyLWQ0Ny0xAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NhaTJiLTEvcGlucy9waW5t
dXggPD09CgAAWwsKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9zYWkyYi0xL3BpbnMvYmlhcy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWkyYi0xL3BpbnMvbmFtZSA8PT0KcGlucwAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zYWkyYi0x
L3BoYW5kbGUgPD09CgAAAV8KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC9zYWkyYi0xL25hbWUgPD09CnNhaTJiLTEACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdtNS1zbGVlcC0xL3BpbnMvcGlubXV4IDw9
PQoAAHsRAAB8EQAAgBEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9wd201LXNsZWVwLTEvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTUtc2xlZXAtMS9waGFuZGxlIDw9
PQoAAAFaCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
cHdtNS1zbGVlcC0xL25hbWUgPD09CnB3bTUtc2xlZXAtMQAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0OHJ0c2N0cy0wL3BpbnMvcGlubXV4IDw9
PQoAAGcJAABqCQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL3VhcnQ4cnRzY3RzLTAvcGlucy9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VhcnQ4cnRzY3RzLTAvcGlucy9uYW1l
IDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL3VhcnQ4cnRzY3RzLTAvcGhhbmRsZSA8PT0KAAABgQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VhcnQ4cnRzY3RzLTAvbmFtZSA8PT0KdWFydDhy
dHNjdHMtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9zcGk0LTAvcGlucy9waW5tdXggPD09CgAATAYAAEYGCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc3BpNC0wL3BpbnMvYmlhcy1kaXNhYmxlIDw9PQoK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zcGk0LTAv
cGlucy9zbGV3LXJhdGUgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9zcGk0LTAvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NwaTQtMC9waW5zL2RyaXZlLXB1
c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvc3BpNC0wL3BoYW5kbGUgPD09CgAAAXMKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9zcGk0LTAvcGluczIvcGlubXV4IDw9PQoAAE0GCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc3BpNC0wL3BpbnMy
L2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvc3BpNC0wL3BpbnMyL25hbWUgPD09CnBpbnMyAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NwaTQtMC9uYW1lIDw9PQpzcGk0LTAA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2FpMmIt
c2xlZXAtMS9waW5zL3Bpbm11eCA8PT0KAABbEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3NhaTJiLXNsZWVwLTEvcGlucy9uYW1lIDw9PQpwaW5zAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NhaTJiLXNs
ZWVwLTEvcGhhbmRsZSA8PT0KAAABYAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL3NhaTJiLXNsZWVwLTEvbmFtZSA8PT0Kc2FpMmItc2xlZXAtMQAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItZDQ3
LXNsZWVwLTAvcGlucy9waW5tdXggPD09CgAACBEAAAkRAABFEQAAMxEKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzItZDQ3LXNsZWVwLTAvcGlu
cy9uYW1lIDw9PQpwaW5zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3NkbW1jMi1kNDctc2xlZXAtMC9waGFuZGxlIDw9PQoAAAB+Cj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMyLWQ0Ny1zbGVlcC0w
L25hbWUgPD09CnNkbW1jMi1kNDctc2xlZXAtMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC91YXJ0Ny1pZGxlLTIvcGluczEvcGlubXV4IDw9PQoAAEgR
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDct
aWRsZS0yL3BpbnMxL25hbWUgPD09CnBpbnMxAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL3VhcnQ3LWlkbGUtMi9waGFuZGxlIDw9PQoAAAF+Cj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDctaWRsZS0y
L3BpbnMyL3Bpbm11eCA8PT0KAABHCAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL3VhcnQ3LWlkbGUtMi9waW5zMi9iaWFzLXB1bGwtdXAgPD09Cgo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VhcnQ3LWlkbGUt
Mi9waW5zMi9uYW1lIDw9PQpwaW5zMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC91YXJ0Ny1pZGxlLTIvbmFtZSA8PT0KdWFydDctaWRsZS0yAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2Rmc2RtLWRhdGEx
LXBpbnMtMC9waW5zL3Bpbm11eCA8PT0KAAAjBAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL2Rmc2RtLWRhdGExLXBpbnMtMC9waW5zL25hbWUgPD09CnBp
bnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZGZz
ZG0tZGF0YTEtcGlucy0wL3BoYW5kbGUgPD09CgAAAD0KPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9kZnNkbS1kYXRhMS1waW5zLTAvbmFtZSA8PT0KZGZz
ZG0tZGF0YTEtcGlucy0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL21fY2FuMS1zbGVlcC0wL3BpbnMvcGlubXV4IDw9PQoAAH0RAACJEQo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL21fY2FuMS1zbGVlcC0w
L3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9tX2NhbjEtc2xlZXAtMC9waGFuZGxlIDw9PQoAAACSCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbV9jYW4xLXNsZWVwLTAvbmFt
ZSA8PT0KbV9jYW4xLXNsZWVwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwNzAwMC9zdCxiYW5rLW5hbWUgPD09CkdQSU9GAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDcw
MDAvY2xvY2tzIDw9PQoAAAAMAAAAWQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDcwMDAvZ3Bpby1jb250cm9sbGVyIDw9PQoKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDA3MDAw
L2dwaW8tcmFuZ2VzIDw9PQoAAACPAAAAAAAAAFAAAAAQCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwNzAwMC9zdGF0dXMgPD09Cm9rYXkA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1
MDAwNzAwMC8jaW50ZXJydXB0LWNlbGxzIDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwNzAwMC9uZ3Bpb3MgPD09CgAAABAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUw
MDA3MDAwL3BoYW5kbGUgPD09CgAAAJUKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDA3MDAwL3JlZyA8PT0KAABQAAAABAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDA3MDAwLyNn
cGlvLWNlbGxzIDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvZ3Bpb0A1MDAwNzAwMC9uYW1lIDw9PQpncGlvAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDcwMDAvaW50ZXJydXB0
LWNvbnRyb2xsZXIgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3VhcnQ0LXNsZWVwLTAvcGlucy9waW5tdXggPD09CgAAaxEAABIRCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDQtc2xlZXAtMC9w
aW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvdWFydDQtc2xlZXAtMC9waGFuZGxlIDw9PQoAAAAbCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdWFydDQtc2xlZXAtMC9uYW1lIDw9
PQp1YXJ0NC1zbGVlcC0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3BpbnMtYXJlLW51bWJlcmVkIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC11c2JvdGctZnMtZHAtZG0tMC9waW5zL3Bpbm11
eCA8PT0KAAALEgAADBIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC9tNC11c2JvdGctZnMtZHAtZG0tMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtdXNib3RnLWZzLWRw
LWRtLTAvcGhhbmRsZSA8PT0KAAABxQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL200LXVzYm90Zy1mcy1kcC1kbS0wL25hbWUgPD09Cm00LXVzYm90Zy1m
cy1kcC1kbS0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAy
MDAwL2dwaW9ANTAwMDQwMDAvc3QsYmFuay1uYW1lIDw9PQpHUElPQwAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDA0MDAwL2Nsb2NrcyA8
PT0KAAAADAAAAFYKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9ncGlvQDUwMDA0MDAwL2dwaW8tY29udHJvbGxlciA8PT0KCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwNDAwMC9ncGlvLXJhbmdl
cyA8PT0KAAAAjwAAAAAAAAAgAAAAEAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDQwMDAvc3RhdHVzIDw9PQpva2F5AAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDQwMDAvI2lu
dGVycnVwdC1jZWxscyA8PT0KAAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL2dwaW9ANTAwMDQwMDAvbmdwaW9zIDw9PQoAAAAQCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwNDAwMC9waGFu
ZGxlIDw9PQoAAABdCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvZ3Bpb0A1MDAwNDAwMC9yZWcgPD09CgAAIAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZ3Bpb0A1MDAwNDAwMC8jZ3Bpby1jZWxscyA8
PT0KAAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L2dwaW9ANTAwMDQwMDAvbmFtZSA8PT0KZ3BpbwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9ncGlvQDUwMDA0MDAwL2ludGVycnVwdC1jb250cm9sbGVy
IDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9u
YW1lIDw9PQpwaW4tY29udHJvbGxlcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9tNC11c2FydDMtMC9waW5zL3Bpbm11eCA8PT0KAAAaEgAAaBIAABwS
AACKEgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200
LXVzYXJ0My0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9w
aW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC11c2FydDMtMC9waGFuZGxlIDw9PQoAAAHCCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtdXNhcnQzLTAv
bmFtZSA8PT0KbTQtdXNhcnQzLTAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvdXNhcnQzLTAvcGluczEvcGlubXV4IDw9PQoAABoICj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQzLTAvcGluczEvYmlh
cy1kaXNhYmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1
MDAwMjAwMC91c2FydDMtMC9waW5zMS9zbGV3LXJhdGUgPD09CgAAAAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMtMC9waW5zMS9uYW1lIDw9
PQpwaW5zMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC91c2FydDMtMC9waW5zMS9kcml2ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0My0wL3BoYW5kbGUgPD09CgAAAYkK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMt
MC9waW5zMi9waW5tdXggPD09CgAAHAkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC91c2FydDMtMC9waW5zMi9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0My0wL3BpbnMy
L25hbWUgPD09CnBpbnMyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3VzYXJ0My0wL25hbWUgPD09CnVzYXJ0My0wAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200LXB3bTItMC9waW5zL3Bpbm11eCA8PT0K
AAADEgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL200
LXB3bTItMC9waW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGlu
LWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtcHdtMi0wL3BoYW5kbGUgPD09CgAAAaYKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9tNC1wd20yLTAvbmFtZSA8
PT0KbTQtcHdtMi0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3B3bTUtMS9waW5zL3Bpbm11eCA8PT0KAAB7AwAAfAMAAIADCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcHdtNS0xL3BpbnMvYmlhcy1kaXNh
YmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9wd201LTEvcGlucy9zbGV3LXJhdGUgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd201LTEvcGlucy9uYW1lIDw9PQpwaW5zAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3B3bTUtMS9waW5z
L2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRy
b2xsZXJANTAwMDIwMDAvcHdtNS0xL3BoYW5kbGUgPD09CgAAAVkKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9wd201LTEvbmFtZSA8PT0KcHdtNS0xAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1k
aXItMS9waW5zMS9waW5tdXggPD09CgAAUgwAAE4MAAAZDAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1kaXItMS9waW5zMS9zbGV3LXJhdGUg
PD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9zZG1tYzEtZGlyLTEvcGluczEvYmlhcy1wdWxsLXVwIDw9PQoKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zZG1tYzEtZGlyLTEvcGluczEvbmFtZSA8
PT0KcGluczEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvc2RtbWMxLWRpci0xL3BpbnMxL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMxLWRpci0xL3BoYW5kbGUg
PD09CgAAAWUKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9zZG1tYzEtZGlyLTEvcGluczIvcGlubXV4IDw9PQoAAEQJCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc2RtbWMxLWRpci0xL3BpbnMyL2JpYXMtcHVs
bC11cCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvc2RtbWMxLWRpci0xL3BpbnMyL25hbWUgPD09CnBpbnMyAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3NkbW1jMS1kaXItMS9uYW1lIDw9PQpzZG1t
YzEtZGlyLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvdXNhcnQzLWlkbGUtMi9waW5zMy9waW5tdXggPD09CgAAHAkKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMtaWRsZS0yL3BpbnMzL2JpYXMt
cHVsbC11cCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvdXNhcnQzLWlkbGUtMi9waW5zMy9uYW1lIDw9PQpwaW5zMwAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC91c2FydDMtaWRsZS0yL3BpbnMxL3Bp
bm11eCA8PT0KAAAaEQAAHREKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxl
ckA1MDAwMjAwMC91c2FydDMtaWRsZS0yL3BpbnMxL25hbWUgPD09CnBpbnMxAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3VzYXJ0My1pZGxlLTIvcGhh
bmRsZSA8PT0KAAABiwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3VzYXJ0My1pZGxlLTIvcGluczIvcGlubXV4IDw9PQoAAGgJCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQzLWlkbGUtMi9waW5zMi9i
aWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3VzYXJ0My1pZGxlLTIvcGluczIvc2xldy1yYXRlIDw9PQoAAAAACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQzLWlkbGUtMi9w
aW5zMi9uYW1lIDw9PQpwaW5zMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC91c2FydDMtaWRsZS0yL3BpbnMyL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvdXNhcnQzLWlk
bGUtMi9uYW1lIDw9PQp1c2FydDMtaWRsZS0yAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bp
bi1jb250cm9sbGVyQDUwMDAyMDAwL2x0ZGMtc2xlZXAtMy9waW5zL3Bpbm11eCA8PT0KAABnEQAA
ihEAAIkRAABNEQAAbREAAHMRAAB4EQAAeREAAAURAAB7EQAAfBEAAE8RAABFEQAAEBEAAH0RAABL
EQAAfxEAAHQRAACLEQAAaBEAADkRAABsEQAAahEAADoRAABMEQAAAxEAABgRAACHEQo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2x0ZGMtc2xlZXAtMy9w
aW5zL25hbWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xs
ZXJANTAwMDIwMDAvbHRkYy1zbGVlcC0zL3BoYW5kbGUgPD09CgAAAUgKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9sdGRjLXNsZWVwLTMvbmFtZSA8PT0K
bHRkYy1zbGVlcC0zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUw
MDAyMDAwL3FzcGktY2xrLTAvcGlucy9waW5tdXggPD09CgAAWgoKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9xc3BpLWNsay0wL3BpbnMvYmlhcy1kaXNh
YmxlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAw
MC9xc3BpLWNsay0wL3BpbnMvc2xldy1yYXRlIDw9PQoAAAADCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcXNwaS1jbGstMC9waW5zL25hbWUgPD09CnBp
bnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcXNw
aS1jbGstMC9waW5zL2RyaXZlLXB1c2gtcHVsbCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcXNwaS1jbGstMC9waGFuZGxlIDw9PQoAAABsCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcXNwaS1jbGst
MC9uYW1lIDw9PQpxc3BpLWNsay0wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250
cm9sbGVyQDUwMDAyMDAwL3N0dXNiMTYwMC0wL3BpbnMvcGlubXV4IDw9PQoAAIsACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvc3R1c2IxNjAwLTAvcGlu
cy9iaWFzLXB1bGwtdXAgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL3N0dXNiMTYwMC0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9zdHVzYjE2MDAtMC9waGFuZGxl
IDw9PQoAAAF4Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIw
MDAvc3R1c2IxNjAwLTAvbmFtZSA8PT0Kc3R1c2IxNjAwLTAACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZGNtaS0xL3BpbnMvcGlubXV4IDw9PQoAAAQO
AAAXDgAABg4AACYOAAB6DgAAew4AAEEOAABLDgAAMw4AAE0OAAAZDgo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2RjbWktMS9waW5zL2JpYXMtZGlzYWJs
ZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
ZGNtaS0xL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9kY21pLTEvcGhhbmRsZSA8PT0KAAABKwo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2RjbWktMS9uYW1lIDw9PQpkY21p
LTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZGZz
ZG0tZGF0YTEtc2xlZXAtcGlucy0wL3BpbnMvcGlubXV4IDw9PQoAACMRCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvZGZzZG0tZGF0YTEtc2xlZXAtcGlu
cy0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29u
dHJvbGxlckA1MDAwMjAwMC9kZnNkbS1kYXRhMS1zbGVlcC1waW5zLTAvcGhhbmRsZSA8PT0KAAAA
QAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2Rmc2Rt
LWRhdGExLXNsZWVwLXBpbnMtMC9uYW1lIDw9PQpkZnNkbS1kYXRhMS1zbGVlcC1waW5zLTAACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvaGRwNy1zbGVl
cC0wL3BpbnMvcGlubXV4IDw9PQoAAKYRCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNv
bnRyb2xsZXJANTAwMDIwMDAvaGRwNy1zbGVlcC0wL3BpbnMvbmFtZSA8PT0KcGlucwAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9oZHA3LXNsZWVwLTAv
cGhhbmRsZSA8PT0KAAAAaAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL2hkcDctc2xlZXAtMC9uYW1lIDw9PQpoZHA3LXNsZWVwLTAACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcXNwaS1iazItMC9waW5zMS9w
aW5tdXggPD09CgAAcgoAAHMKAABqDAAAZwwKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9xc3BpLWJrMi0wL3BpbnMxL2JpYXMtZGlzYWJsZSA8PT0KCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcXNwaS1iazIt
MC9waW5zMS9zbGV3LXJhdGUgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9xc3BpLWJrMi0wL3BpbnMxL25hbWUgPD09CnBpbnMxAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL3FzcGktYmsyLTAv
cGluczEvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4t
Y29udHJvbGxlckA1MDAwMjAwMC9xc3BpLWJrMi0wL3BoYW5kbGUgPD09CgAAAG4KPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9xc3BpLWJrMi0wL3BpbnMy
L3Bpbm11eCA8PT0KAAAgCwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3FzcGktYmsyLTAvcGluczIvc2xldy1yYXRlIDw9PQoAAAABCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcXNwaS1iazItMC9waW5zMi9i
aWFzLXB1bGwtdXAgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3FzcGktYmsyLTAvcGluczIvbmFtZSA8PT0KcGluczIACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcXNwaS1iazItMC9waW5zMi9kcml2
ZS1wdXNoLXB1bGwgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVy
QDUwMDAyMDAwL3FzcGktYmsyLTAvbmFtZSA8PT0KcXNwaS1iazItMAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9sdGRjLTMvcGluczEvcGlubXV4IDw9
PQoAAGcPCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAv
bHRkYy0zL3BpbnMxL2JpYXMtZGlzYWJsZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbHRkYy0zL3BpbnMxL3NsZXctcmF0ZSA8PT0KAAAAAwo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2x0ZGMtMy9w
aW5zMS9uYW1lIDw9PQpwaW5zMQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9sdGRjLTMvcGluczEvZHJpdmUtcHVzaC1wdWxsIDw9PQoKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAwMjAwMC9sdGRjLTMvcGhhbmRsZSA8
PT0KAAABRwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAw
L2x0ZGMtMy9waW5zMi9waW5tdXggPD09CgAAig8AAIkPAABNDwAAbQ8AAHMPAAB4DwAAeQ8AAAUP
AAB7DwAAfA8AAE8PAABFDwAAEA8AAH0PAABLDwAAfw8AAHQKAACLCgAAaA8AADkPAABsDwAAag8A
ADoPAABMDwAAAw8AABgPAACHDwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Bpbi1jb250cm9s
bGVyQDUwMDAyMDAwL2x0ZGMtMy9waW5zMi9iaWFzLWRpc2FibGUgPD09Cgo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3Bpbi1jb250cm9sbGVyQDUwMDAyMDAwL2x0ZGMtMy9waW5zMi9zbGV3LXJh
dGUgPD09CgAAAAIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJvbGxlckA1MDAw
MjAwMC9sdGRjLTMvcGluczIvbmFtZSA8PT0KcGluczIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbHRkYy0zL3BpbnMyL2RyaXZlLXB1c2gtcHVsbCA8
PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbHRk
Yy0zL25hbWUgPD09Cmx0ZGMtMwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9waW4tY29udHJv
bGxlckA1MDAwMjAwMC9tNC1zYWk0YS0wL3BpbnMvcGlubXV4IDw9PQoAABUSCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc2FpNGEtMC9waW5zL25h
bWUgPD09CnBpbnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcGluLWNvbnRyb2xsZXJANTAw
MDIwMDAvbTQtc2FpNGEtMC9waGFuZGxlIDw9PQoAAAG0Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcGluLWNvbnRyb2xsZXJANTAwMDIwMDAvbTQtc2FpNGEtMC9uYW1lIDw9PQptNC1zYWk0YS0w
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2F1ZGlvLWNvbnRyb2xsZXJANDAwMGMwMDAvY29t
cGF0aWJsZSA8PT0Kc3Qsc3RtMzJoNy1pMnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYXVk
aW8tY29udHJvbGxlckA0MDAwYzAwMC8jc291bmQtZGFpLWNlbGxzIDw9PQoAAAAACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvYXVkaW8tY29udHJvbGxlckA0MDAwYzAwMC9zdGF0dXMgPD09CmRp
c2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2F1ZGlvLWNvbnRyb2xsZXJANDAwMGMw
MDAvaW50ZXJydXB0cyA8PT0KAAAAAAAAADMAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
YXVkaW8tY29udHJvbGxlckA0MDAwYzAwMC9kbWEtbmFtZXMgPD09CnJ4AHR4AAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL2F1ZGlvLWNvbnRyb2xsZXJANDAwMGMwMDAvcGhhbmRsZSA8PT0KAAAA
xwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2F1ZGlvLWNvbnRyb2xsZXJANDAwMGMwMDAvcmVn
IDw9PQpAAMAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2F1ZGlvLWNvbnRyb2xsZXJA
NDAwMGMwMDAvZG1hcyA8PT0KAAAADwAAAD0AAAQAAAAAAQAAAA8AAAA+AAAEAAAAAAEKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9hdWRpby1jb250cm9sbGVyQDQwMDBjMDAwL25hbWUgPD09CmF1
ZGlvLWNvbnRyb2xsZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdXNiQDU4MDBkMDAwL3Bv
d2VyLWRvbWFpbnMgPD09CgAAABMKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2JANTgwMGQw
MDAvaW50ZXJydXB0cy1leHRlbmRlZCA8PT0KAAAAEgAAACsAAAAECj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvdXNiQDU4MDBkMDAwL2NvbXBhdGlibGUgPD09CmdlbmVyaWMtZWhjaQAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy91c2JANTgwMGQwMDAvY2xvY2tzIDw9PQoAAACDAAAADAAAAG8K
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2JANTgwMGQwMDAvcmVzZXRzIDw9PQoAAAAMAAAM
2Ao9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3VzYkA1ODAwZDAwMC93YWtldXAtc291cmNlIDw9
PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2JANTgwMGQwMDAvY29tcGFuaW9uIDw9PQoA
AACECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdXNiQDU4MDBkMDAwL3N0YXR1cyA8PT0Kb2th
eQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2JANTgwMGQwMDAvcGhhbmRsZSA8PT0KAAAB
Dwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3VzYkA1ODAwZDAwMC9waHlzIDw9PQoAAACFCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdXNiQDU4MDBkMDAwL3JlZyA8PT0KWADQAAAAEAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2JANTgwMGQwMDAvbmFtZSA8PT0KdXNiAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL2VmdXNlQDVjMDA1MDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMy
bXAxNS1ic2VjAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2VmdXNlQDVjMDA1MDAwL2Nsb2Nr
cyA8PT0KAAAAAQAAAAkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9lZnVzZUA1YzAwNTAwMC9j
YWxpYkA1Mi9waGFuZGxlIDw9PQoAAABQCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZWZ1c2VA
NWMwMDUwMDAvY2FsaWJANTIvcmVnIDw9PQoAAABSAAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL2VmdXNlQDVjMDA1MDAwL2NhbGliQDUyL25hbWUgPD09CmNhbGliAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL2VmdXNlQDVjMDA1MDAwLyNhZGRyZXNzLWNlbGxzIDw9PQoAAAABCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvZWZ1c2VANWMwMDUwMDAvY2FsaWJANWUvcGhhbmRsZSA8PT0K
AAABHQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2VmdXNlQDVjMDA1MDAwL2NhbGliQDVlL3Jl
ZyA8PT0KAAAAXgAAAAIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9lZnVzZUA1YzAwNTAwMC9j
YWxpYkA1ZS9uYW1lIDw9PQpjYWxpYgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9lZnVzZUA1
YzAwNTAwMC8jc2l6ZS1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Vm
dXNlQDVjMDA1MDAwL3BhcnRfbnVtYmVyX290cEA0L3BoYW5kbGUgPD09CgAAAAMKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9lZnVzZUA1YzAwNTAwMC9wYXJ0X251bWJlcl9vdHBANC9yZWcgPD09
CgAAAAQAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZWZ1c2VANWMwMDUwMDAvcGFydF9u
dW1iZXJfb3RwQDQvbmFtZSA8PT0KcGFydF9udW1iZXJfb3RwAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL2VmdXNlQDVjMDA1MDAwL3BoYW5kbGUgPD09CgAAARsKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9lZnVzZUA1YzAwNTAwMC9jYWxpYkA1Yy9waGFuZGxlIDw9PQoAAAEcCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvZWZ1c2VANWMwMDUwMDAvY2FsaWJANWMvcmVnIDw9PQoAAABcAAAA
Ago9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2VmdXNlQDVjMDA1MDAwL2NhbGliQDVjL25hbWUg
PD09CmNhbGliAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2VmdXNlQDVjMDA1MDAwL3JlZyA8
PT0KXABQAAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9lZnVzZUA1YzAwNTAwMC9tYWNA
ZTQvcGhhbmRsZSA8PT0KAAABHgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2VmdXNlQDVjMDA1
MDAwL21hY0BlNC9yZWcgPD09CgAAAOQAAAAGCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZWZ1
c2VANWMwMDUwMDAvbWFjQGU0L25hbWUgPD09Cm1hYwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9lZnVzZUA1YzAwNTAwMC9uYW1lIDw9PQplZnVzZQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9yYW5nZXMgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RoZXJtYWxANTAwMjgwMDAv
Y29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzItdGhlcm1hbAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy90aGVybWFsQDUwMDI4MDAwL2Nsb2NrcyA8PT0KAAAADAAAADUKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy90aGVybWFsQDUwMDI4MDAwLyN0aGVybWFsLXNlbnNvci1jZWxscyA8PT0KAAAAAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RoZXJtYWxANTAwMjgwMDAvY2xvY2stbmFtZXMgPD09
CnBjbGsACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGhlcm1hbEA1MDAyODAwMC9zdGF0dXMg
PD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGhlcm1hbEA1MDAyODAwMC9pbnRl
cnJ1cHRzIDw9PQoAAAAAAAAAkwAAAAQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aGVybWFs
QDUwMDI4MDAwL3BoYW5kbGUgPD09CgAAAAkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aGVy
bWFsQDUwMDI4MDAwL3JlZyA8PT0KUAKAAAAAAQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90
aGVybWFsQDUwMDI4MDAwL25hbWUgPD09CnRoZXJtYWwACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvcHdyX21jdUA1MDAwMTAxNC9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMm1wMTUxLXB3ci1tY3UA
c3lzY29uAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3B3cl9tY3VANTAwMDEwMTQvcGhhbmRs
ZSA8PT0KAAAAmAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3B3cl9tY3VANTAwMDEwMTQvcmVn
IDw9PQpQABAUAAAABAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3B3cl9tY3VANTAwMDEwMTQv
bmFtZSA8PT0KcHdyX21jdQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlANTgwMDMwMDAv
bXg2Nmw1MTIzNWxAMS9jb21wYXRpYmxlIDw9PQpqZWRlYyxzcGktbm9yAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3NwaUA1ODAwMzAwMC9teDY2bDUxMjM1bEAxL3NwaS1yeC1idXMtd2lkdGgg
PD09CgAAAAQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlANTgwMDMwMDAvbXg2Nmw1MTIz
NWxAMS8jYWRkcmVzcy1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Nw
aUA1ODAwMzAwMC9teDY2bDUxMjM1bEAxLyNzaXplLWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2Mvc3BpQDU4MDAzMDAwL214NjZsNTEyMzVsQDEvcGhhbmRsZSA8PT0KAAAB
Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA1ODAwMzAwMC9teDY2bDUxMjM1bEAxL3Jl
ZyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA1ODAwMzAwMC9teDY2bDUx
MjM1bEAxL3NwaS1tYXgtZnJlcXVlbmN5IDw9PQoGb/MACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2Mvc3BpQDU4MDAzMDAwL214NjZsNTEyMzVsQDEvbmFtZSA8PT0KbXg2Nmw1MTIzNWwACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDU4MDAzMDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMy
ZjQ2OS1xc3BpAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA1ODAwMzAwMC9jbG9ja3Mg
PD09CgAAAAwAAAB6Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDU4MDAzMDAwL3Jlc2V0
cyA8PT0KAAAADAAADM4KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlANTgwMDMwMDAvcmVn
LW5hbWVzIDw9PQpxc3BpAHFzcGlfbW0ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDU4
MDAzMDAwL3BpbmN0cmwtMSA8PT0KAAAAbwAAAHAAAABxCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2Mvc3BpQDU4MDAzMDAwL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9zcGlANTgwMDMwMDAvI2FkZHJlc3MtY2VsbHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9zcGlANTgwMDMwMDAvaW50ZXJydXB0cyA8PT0KAAAAAAAAAFwAAAAECj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDU4MDAzMDAwLyNzaXplLWNlbGxzIDw9PQoAAAAACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDU4MDAzMDAwL2RtYS1uYW1lcyA8PT0KdHgAcngACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDU4MDAzMDAwL214NjZsNTEyMzVsQDAvY29tcGF0
aWJsZSA8PT0KamVkZWMsc3BpLW5vcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlANTgw
MDMwMDAvbXg2Nmw1MTIzNWxAMC9zcGktcngtYnVzLXdpZHRoIDw9PQoAAAAECj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2Mvc3BpQDU4MDAzMDAwL214NjZsNTEyMzVsQDAvI2FkZHJlc3MtY2VsbHMg
PD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlANTgwMDMwMDAvbXg2Nmw1MTIz
NWxAMC8jc2l6ZS1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA1
ODAwMzAwMC9teDY2bDUxMjM1bEAwL3BoYW5kbGUgPD09CgAAAQkKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9zcGlANTgwMDMwMDAvbXg2Nmw1MTIzNWxAMC9yZWcgPD09CgAAAAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9zcGlANTgwMDMwMDAvbXg2Nmw1MTIzNWxAMC9zcGktbWF4LWZyZXF1
ZW5jeSA8PT0KBm/zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA1ODAwMzAwMC9teDY2
bDUxMjM1bEAwL25hbWUgPD09Cm14NjZsNTEyMzVsAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3NwaUA1ODAwMzAwMC9waGFuZGxlIDw9PQoAAAEICj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
c3BpQDU4MDAzMDAwL3JlZyA8PT0KWAAwAAAAEABwAAAABAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3NwaUA1ODAwMzAwMC9waW5jdHJsLTAgPD09CgAAAGwAAABtAAAAbgo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3NwaUA1ODAwMzAwMC9kbWFzIDw9PQoAAABKAAAAFgAAAAIQEAACAAAA
AAAAAAAAAAAAAAAASgAAABYAAAACEBAACAAAAAAAAAAAAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3NwaUA1ODAwMzAwMC9uYW1lIDw9PQpzcGkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2Mvc3BpQDU4MDAzMDAwL3BpbmN0cmwtbmFtZXMgPD09CmRlZmF1bHQAc2xlZXAACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvaW50ZXJydXB0LXBhcmVudCA8PT0KAAAABwo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL2ludGVycnVwdC1jb250cm9sbGVyQDUwMDBkMDAwL2NvbXBhdGlibGUgPD09
CnN0LHN0bTMybXAxLWV4dGkAc3lzY29uAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2ludGVy
cnVwdC1jb250cm9sbGVyQDUwMDBkMDAwL2V4dGktcHdyLyNpbnRlcnJ1cHQtY2VsbHMgPD09CgAA
AAIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pbnRlcnJ1cHQtY29udHJvbGxlckA1MDAwZDAw
MC9leHRpLXB3ci9pbnRlcnJ1cHQtcGFyZW50IDw9PQoAAABfCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvaW50ZXJydXB0LWNvbnRyb2xsZXJANTAwMGQwMDAvZXh0aS1wd3Ivc3QsaXJxLW51bWJl
ciA8PT0KAAAABgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2ludGVycnVwdC1jb250cm9sbGVy
QDUwMDBkMDAwL2V4dGktcHdyL3BoYW5kbGUgPD09CgAAAIsKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9pbnRlcnJ1cHQtY29udHJvbGxlckA1MDAwZDAwMC9leHRpLXB3ci9uYW1lIDw9PQpleHRp
LXB3cgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pbnRlcnJ1cHQtY29udHJvbGxlckA1MDAw
ZDAwMC9leHRpLXB3ci9pbnRlcnJ1cHQtY29udHJvbGxlciA8PT0KCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvaW50ZXJydXB0LWNvbnRyb2xsZXJANTAwMGQwMDAvaHdsb2NrcyA8PT0KAAAAXgAA
AAEAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaW50ZXJydXB0LWNvbnRyb2xsZXJANTAw
MGQwMDAvI2ludGVycnVwdC1jZWxscyA8PT0KAAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2ludGVycnVwdC1jb250cm9sbGVyQDUwMDBkMDAwL3BoYW5kbGUgPD09CgAAABIKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9pbnRlcnJ1cHQtY29udHJvbGxlckA1MDAwZDAwMC9yZWcgPD09ClAA
0AAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaW50ZXJydXB0LWNvbnRyb2xsZXJANTAw
MGQwMDAvbmFtZSA8PT0KaW50ZXJydXB0LWNvbnRyb2xsZXIACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvaW50ZXJydXB0LWNvbnRyb2xsZXJANTAwMGQwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXIg
PD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jLyNhZGRyZXNzLWNlbGxzIDw9PQoAAAABCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaGFzaEA1NDAwMjAwMC9jb21wYXRpYmxlIDw9PQpzdCxz
dG0zMmY3NTYtaGFzaAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9oYXNoQDU0MDAyMDAwL2Ns
b2NrcyA8PT0KAAAAAQAAAAwKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9oYXNoQDU0MDAyMDAw
L3Jlc2V0cyA8PT0KAAAAaQAAAAcKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9oYXNoQDU0MDAy
MDAwL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9oYXNoQDU0MDAy
MDAwL2ludGVycnVwdHMgPD09CgAAAAAAAABQAAAABAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2hhc2hANTQwMDIwMDAvZG1hLW5hbWVzIDw9PQppbgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9oYXNoQDU0MDAyMDAwL3BoYW5kbGUgPD09CgAAAQUKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9oYXNoQDU0MDAyMDAwL3JlZyA8PT0KVAAgAAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9oYXNoQDU0MDAyMDAwL2RtYXMgPD09CgAAAEoAAAAfAAAAAgEACgIAAAAAAAAAAAAAAAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9oYXNoQDU0MDAyMDAwL25hbWUgPD09Cmhhc2gACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvaGFzaEA1NDAwMjAwMC9kbWEtbWF4YnVyc3QgPD09CgAAAAIK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAwMGYwMDAvcG93ZXItZG9tYWlucyA8
PT0KAAAAEwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0MDAwZjAwMC9pbnRlcnJ1
cHRzLWV4dGVuZGVkIDw9PQoAAAASAAAAHAAAAAQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9z
ZXJpYWxANDAwMGYwMDAvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzJoNy11YXJ0AAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0MDAwZjAwMC9jbG9ja3MgPD09CgAAAAwAAACWCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFsQDQwMDBmMDAwL3dha2V1cC1zb3VyY2UgPD09Cgo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0MDAwZjAwMC91YXJ0LWhhcy1ydHNjdHMg
PD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0MDAwZjAwMC9waW5jdHJsLTEg
PD09CgAAABgKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAwMGYwMDAvc3RhdHVz
IDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAwMGYwMDAv
ZG1hLW5hbWVzIDw9PQpyeAB0eAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAw
MGYwMDAvcGhhbmRsZSA8PT0KAAAAygo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0
MDAwZjAwMC9waW5jdHJsLTIgPD09CgAAABkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJp
YWxANDAwMGYwMDAvcmVnIDw9PQpAAPAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Nl
cmlhbEA0MDAwZjAwMC9waW5jdHJsLTAgPD09CgAAABcKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9zZXJpYWxANDAwMGYwMDAvZG1hcyA8PT0KAAAADwAAAC0AAAQAAAAAFQAAAA8AAAAuAAAEAAAA
ABEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAwMGYwMDAvbmFtZSA8PT0Kc2Vy
aWFsAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0MDAwZjAwMC9waW5jdHJsLW5h
bWVzIDw9PQpkZWZhdWx0AHNsZWVwAGlkbGUACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcnRj
QDVjMDA0MDAwL2ludGVycnVwdHMtZXh0ZW5kZWQgPD09CgAAABIAAAATAAAABAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3J0Y0A1YzAwNDAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMm1wMS1y
dGMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcnRjQDVjMDA0MDAwL2Nsb2NrcyA8PT0KAAAA
AQAAABIAAAABAAAAEQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3J0Y0A1YzAwNDAwMC9jbG9j
ay1uYW1lcyA8PT0KcGNsawBydGNfY2sACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcnRjQDVj
MDA0MDAwL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9ydGNANWMw
MDQwMDAvcGhhbmRsZSA8PT0KAAABGgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3J0Y0A1YzAw
NDAwMC9yZWcgPD09ClwAQAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcnRjQDVjMDA0
MDAwL25hbWUgPD09CnJ0YwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGMwMDAv
Y29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzJoNy1zYWkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
c2FpQDQ0MDBjMDAwL3Jlc2V0cyA8PT0KAAAADAAATFIKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9zYWlANDQwMGMwMDAvcmFuZ2VzIDw9PQoAAAAARADAAAAABAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9zYWlANDQwMGMwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9zYWlANDQwMGMwMDAvI2FkZHJlc3MtY2VsbHMgPD09CgAAAAEKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9zYWlANDQwMGMwMDAvaW50ZXJydXB0cyA8PT0KAAAAAAAAAHIAAAAE
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBjMDAwL2F1ZGlvLWNvbnRyb2xsZXJA
NDQwMGMwMjQvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzItc2FpLXN1Yi1iAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3NhaUA0NDAwYzAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBjMDI0L2Nsb2Nr
cyA8PT0KAAAADAAAAKAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGMwMDAvYXVk
aW8tY29udHJvbGxlckA0NDAwYzAyNC8jc291bmQtZGFpLWNlbGxzIDw9PQoAAAAACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBjMDAwL2F1ZGlvLWNvbnRyb2xsZXJANDQwMGMwMjQv
Y2xvY2stbmFtZXMgPD09CnNhaV9jawAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQw
MGMwMDAvYXVkaW8tY29udHJvbGxlckA0NDAwYzAyNC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYzAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBj
MDI0L3BoYW5kbGUgPD09CgAAAO4KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGMw
MDAvYXVkaW8tY29udHJvbGxlckA0NDAwYzAyNC9yZWcgPD09CgAAACQAAAAgCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBjMDAwL2F1ZGlvLWNvbnRyb2xsZXJANDQwMGMwMjQvZG1h
cyA8PT0KAAAADwAAAHIAAAQAAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAw
YzAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBjMDI0L25hbWUgPD09CmF1ZGlvLWNvbnRyb2xsZXIA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBjMDAwLyNzaXplLWNlbGxzIDw9PQoA
AAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBjMDAwL3BoYW5kbGUgPD09CgAA
AOwKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGMwMDAvYXVkaW8tY29udHJvbGxl
ckA0NDAwYzAwNC9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMi1zYWktc3ViLWEACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBjMDAwL2F1ZGlvLWNvbnRyb2xsZXJANDQwMGMwMDQvY2xv
Y2tzIDw9PQoAAAAMAAAAoAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYzAwMC9h
dWRpby1jb250cm9sbGVyQDQ0MDBjMDA0LyNzb3VuZC1kYWktY2VsbHMgPD09CgAAAAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGMwMDAvYXVkaW8tY29udHJvbGxlckA0NDAwYzAw
NC9jbG9jay1uYW1lcyA8PT0Kc2FpX2NrAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0
NDAwYzAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBjMDA0L3N0YXR1cyA8PT0KZGlzYWJsZWQACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBjMDAwL2F1ZGlvLWNvbnRyb2xsZXJANDQw
MGMwMDQvcGhhbmRsZSA8PT0KAAAA7Qo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAw
YzAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBjMDA0L3JlZyA8PT0KAAAABAAAACAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9zYWlANDQwMGMwMDAvYXVkaW8tY29udHJvbGxlckA0NDAwYzAwNC9k
bWFzIDw9PQoAAAAPAAAAcQAABAAAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0
MDBjMDAwL2F1ZGlvLWNvbnRyb2xsZXJANDQwMGMwMDQvbmFtZSA8PT0KYXVkaW8tY29udHJvbGxl
cgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGMwMDAvcmVnIDw9PQpEAMAAAAAA
BEQAw/AAAAAQCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBjMDAwL25hbWUgPD09
CnNhaQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy8jc2l6ZS1jZWxscyA8PT0KAAAAAQo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL2V0aGVybmV0QDU4MDBhMDAwL21kaW8wL2NvbXBhdGlibGUg
PD09CnNucHMsZHdtYWMtbWRpbwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9ldGhlcm5ldEA1
ODAwYTAwMC9tZGlvMC9ldGhlcm5ldC1waHlAMC9waGFuZGxlIDw9PQoAAACCCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvZXRoZXJuZXRANTgwMGEwMDAvbWRpbzAvZXRoZXJuZXQtcGh5QDAvcmVn
IDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZXRoZXJuZXRANTgwMGEwMDAvbWRp
bzAvZXRoZXJuZXQtcGh5QDAvbmFtZSA8PT0KZXRoZXJuZXQtcGh5AAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2V0aGVybmV0QDU4MDBhMDAwL21kaW8wLyNhZGRyZXNzLWNlbGxzIDw9PQoAAAAB
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZXRoZXJuZXRANTgwMGEwMDAvbWRpbzAvI3NpemUt
Y2VsbHMgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9ldGhlcm5ldEA1ODAwYTAw
MC9tZGlvMC9uYW1lIDw9PQptZGlvMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9ldGhlcm5l
dEA1ODAwYTAwMC9waHktaGFuZGxlIDw9PQoAAACCCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
ZXRoZXJuZXRANTgwMGEwMDAvcG93ZXItZG9tYWlucyA8PT0KAAAAEwo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2V0aGVybmV0QDU4MDBhMDAwL2ludGVycnVwdHMtZXh0ZW5kZWQgPD09CgAAAAcA
AAAAAAAAPQAAAAQAAAASAAAARgAAAAQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9ldGhlcm5l
dEA1ODAwYTAwMC9zbnBzLGF4aS1jb25maWcgPD09CgAAAH8KPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9ldGhlcm5ldEA1ODAwYTAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMm1wMS1kd21hYwBz
bnBzLGR3bWFjLTQuMjBhAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2V0aGVybmV0QDU4MDBh
MDAwL3NucHMsZW4tdHgtbHBpLWNsb2NrZ2F0aW5nIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9ldGhlcm5ldEA1ODAwYTAwMC9jbG9ja3MgPD09CgAAAAwAAABpAAAADAAAAGcAAAAMAAAA
aAAAAAwAAAB7AAAADAAAAKkAAAAMAAAAcAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2V0aGVy
bmV0QDU4MDBhMDAwL2xvY2FsLW1hYy1hZGRyZXNzIDw9PQoQ53rhoy0KPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9ldGhlcm5ldEA1ODAwYTAwMC9yZWctbmFtZXMgPD09CnN0bW1hY2V0aAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9ldGhlcm5ldEA1ODAwYTAwMC9waW5jdHJsLTEgPD09CgAA
AIEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9ldGhlcm5ldEA1ODAwYTAwMC9zdCxzeXNjb24g
PD09CgAAAAsAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZXRoZXJuZXRANTgwMGEwMDAv
Y2xvY2stbmFtZXMgPD09CnN0bW1hY2V0aABtYWMtY2xrLXR4AG1hYy1jbGstcngAZXRoLWNrAHB0
cF9yZWYAZXRoc3RwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2V0aGVybmV0QDU4MDBhMDAw
L21heC1zcGVlZCA8PT0KAAAD6Ao9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2V0aGVybmV0QDU4
MDBhMDAwL3NucHMsbWl4ZWQtYnVyc3QgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2V0
aGVybmV0QDU4MDBhMDAwL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9ldGhlcm5ldEA1ODAwYTAwMC9waGFuZGxlIDw9PQoAAAEOCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvZXRoZXJuZXRANTgwMGEwMDAvcmVnIDw9PQpYAKAAAAAgAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2V0aGVybmV0QDU4MDBhMDAwL3BoeS1tb2RlIDw9PQpyZ21paS1pZAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9ldGhlcm5ldEA1ODAwYTAwMC9waW5jdHJsLTAgPD09CgAAAIAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9ldGhlcm5ldEA1ODAwYTAwMC9zdG1tYWMtYXhpLWNv
bmZpZy9zbnBzLHdyX29zcl9sbXQgPD09CgAAAAcKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9l
dGhlcm5ldEA1ODAwYTAwMC9zdG1tYWMtYXhpLWNvbmZpZy9zbnBzLHJkX29zcl9sbXQgPD09CgAA
AAcKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9ldGhlcm5ldEA1ODAwYTAwMC9zdG1tYWMtYXhp
LWNvbmZpZy9waGFuZGxlIDw9PQoAAAB/Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZXRoZXJu
ZXRANTgwMGEwMDAvc3RtbWFjLWF4aS1jb25maWcvc25wcyxibGVuIDw9PQoAAAAAAAAAAAAAAAAA
AAAAAAAAEAAAAAgAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZXRoZXJuZXRANTgwMGEw
MDAvc3RtbWFjLWF4aS1jb25maWcvbmFtZSA8PT0Kc3RtbWFjLWF4aS1jb25maWcACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvZXRoZXJuZXRANTgwMGEwMDAvc25wcyxwYmwgPD09CgAAAAIKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9ldGhlcm5ldEA1ODAwYTAwMC9pbnRlcnJ1cHQtbmFtZXMg
PD09Cm1hY2lycQBldGhfd2FrZV9pcnEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZXRoZXJu
ZXRANTgwMGEwMDAvbmFtZSA8PT0KZXRoZXJuZXQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
ZXRoZXJuZXRANTgwMGEwMDAvcGluY3RybC1uYW1lcyA8PT0KZGVmYXVsdABzbGVlcAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9ldGhlcm5ldEA1ODAwYTAwMC9zbnBzLHRzbyA8PT0KCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDQ0MDA1MDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMy
aDctc3BpAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA0NDAwNTAwMC9jbG9ja3MgPD09
CgAAAAwAAACFCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDQ0MDA1MDAwL3Jlc2V0cyA8
PT0KAAAADAAATEkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlANDQwMDUwMDAvc3RhdHVz
IDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlANDQwMDUwMDAvI2Fk
ZHJlc3MtY2VsbHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlANDQwMDUw
MDAvaW50ZXJydXB0cyA8PT0KAAAAAAAAAFQAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
c3BpQDQ0MDA1MDAwLyNzaXplLWNlbGxzIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2Mvc3BpQDQ0MDA1MDAwL2RtYS1uYW1lcyA8PT0KcngAdHgACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2Mvc3BpQDQ0MDA1MDAwL3BoYW5kbGUgPD09CgAAAOIKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9zcGlANDQwMDUwMDAvcmVnIDw9PQpEAFAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3NwaUA0NDAwNTAwMC9kbWFzIDw9PQoAAAAPAAAAUwAABAAAAAABAAAADwAAAFQAAAQAAAAA
AQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA0NDAwNTAwMC9uYW1lIDw9PQpzcGkACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYWRjQDQ4MDAzMDAwL2FkY0AxMDAvY29tcGF0aWJsZSA8
PT0Kc3Qsc3RtMzJtcDEtYWRjAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2FkY0A0ODAwMzAw
MC9hZGNAMTAwL252bWVtLWNlbGxzIDw9PQoAAABQCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
YWRjQDQ4MDAzMDAwL2FkY0AxMDAvI2lvLWNoYW5uZWwtY2VsbHMgPD09CgAAAAEKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9hZGNANDgwMDMwMDAvYWRjQDEwMC9zdGF0dXMgPD09CmRpc2FibGVk
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2FkY0A0ODAwMzAwMC9hZGNAMTAwL2ludGVycnVw
dC1wYXJlbnQgPD09CgAAAE8KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9hZGNANDgwMDMwMDAv
YWRjQDEwMC9pbnRlcnJ1cHRzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYWRj
QDQ4MDAzMDAwL2FkY0AxMDAvZG1hLW5hbWVzIDw9PQpyeAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9hZGNANDgwMDMwMDAvYWRjQDEwMC9waGFuZGxlIDw9PQoAAAD3Cj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvYWRjQDQ4MDAzMDAwL2FkY0AxMDAvcmVnIDw9PQoAAAEACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvYWRjQDQ4MDAzMDAwL2FkY0AxMDAvZG1hcyA8PT0KAAAADwAAAAoAAAQA
gAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2FkY0A0ODAwMzAwMC9hZGNAMTAwL25hbWUg
PD09CmFkYwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9hZGNANDgwMDMwMDAvYWRjQDEwMC9u
dm1lbS1jZWxsLW5hbWVzIDw9PQp2cmVmaW50AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Fk
Y0A0ODAwMzAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMm1wMS1hZGMtY29yZQAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9hZGNANDgwMDMwMDAvY2xvY2tzIDw9PQoAAAAMAAAASgAAAAwAAACi
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYWRjQDQ4MDAzMDAwL2FkY0AwL2NvbXBhdGlibGUg
PD09CnN0LHN0bTMybXAxLWFkYwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9hZGNANDgwMDMw
MDAvYWRjQDAvI2lvLWNoYW5uZWwtY2VsbHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9hZGNANDgwMDMwMDAvYWRjQDAvc3QsbWluLXNhbXBsZS10aW1lLW5zZWNzIDw9PQoAAAGQ
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYWRjQDQ4MDAzMDAwL2FkY0AwL3N0YXR1cyA8PT0K
b2theQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9hZGNANDgwMDMwMDAvYWRjQDAvaW50ZXJy
dXB0LXBhcmVudCA8PT0KAAAATwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2FkY0A0ODAwMzAw
MC9hZGNAMC9pbnRlcnJ1cHRzIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYWRj
QDQ4MDAzMDAwL2FkY0AwL2RtYS1uYW1lcyA8PT0KcngACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvYWRjQDQ4MDAzMDAwL2FkY0AwL3BoYW5kbGUgPD09CgAAAPYKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9hZGNANDgwMDMwMDAvYWRjQDAvcmVnIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvYWRjQDQ4MDAzMDAwL2FkY0AwL2RtYXMgPD09CgAAAA8AAAAJAAAEAIAAAAEKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9hZGNANDgwMDMwMDAvYWRjQDAvc3QsYWRjLWNoYW5uZWxz
IDw9PQoAAAAAAAAAAQAAAAYKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9hZGNANDgwMDMwMDAv
YWRjQDAvbmFtZSA8PT0KYWRjAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2FkY0A0ODAwMzAw
MC9jbG9jay1uYW1lcyA8PT0KYnVzAGFkYwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9hZGNA
NDgwMDMwMDAvc3Qsc3lzY2ZnIDw9PQoAAAALCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYWRj
QDQ4MDAzMDAwL3ZyZWYtc3VwcGx5IDw9PQoAAAAxCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
YWRjQDQ4MDAzMDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvYWRjQDQ4MDAzMDAwLyNpbnRlcnJ1cHQtY2VsbHMgPD09CgAAAAEKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9hZGNANDgwMDMwMDAvI2FkZHJlc3MtY2VsbHMgPD09CgAAAAEKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9hZGNANDgwMDMwMDAvaW50ZXJydXB0cyA8PT0KAAAAAAAAABIAAAAE
AAAAAAAAAFoAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYWRjQDQ4MDAzMDAwLyNzaXpl
LWNlbGxzIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYWRjQDQ4MDAzMDAwL3Bo
YW5kbGUgPD09CgAAAE8KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9hZGNANDgwMDMwMDAvdmRk
YS1zdXBwbHkgPD09CgAAADEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9hZGNANDgwMDMwMDAv
dmRkLXN1cHBseSA8PT0KAAAAHwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2FkY0A0ODAwMzAw
MC9yZWcgPD09CkgAMAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYWRjQDQ4MDAzMDAw
L3BpbmN0cmwtMCA8PT0KAAAATgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2FkY0A0ODAwMzAw
MC9uYW1lIDw9PQphZGMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYWRjQDQ4MDAzMDAwL3Bp
bmN0cmwtbmFtZXMgPD09CmRlZmF1bHQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYWRjQDQ4
MDAzMDAwL2ludGVycnVwdC1jb250cm9sbGVyIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9tbWNANTgwMDUwMDAvc3Qsc2lnLWRpciA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
bW1jQDU4MDA1MDAwL2NhcC1tbWMtaGlnaHNwZWVkIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9tbWNANTgwMDUwMDAvc3QsbmVnLWVkZ2UgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL21tY0A1ODAwNTAwMC9zZC11aHMtc2RyMjUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL21tY0A1ODAwNTAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMi1zZG1tYzIAYXJtLHBsMTh4
AGFybSxwcmltZWNlbGwACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbW1jQDU4MDA1MDAwL2Ns
b2NrcyA8PT0KAAAADAAAAHYKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tbWNANTgwMDUwMDAv
Y2FwLXNkLWhpZ2hzcGVlZCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbW1jQDU4MDA1
MDAwL3Jlc2V0cyA8PT0KAAAADAAADNAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tbWNANTgw
MDUwMDAvcGluY3RybC0xIDw9PQoAAAB0AAAAcwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21t
Y0A1ODAwNTAwMC9zdCx1c2UtY2tpbiA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbW1j
QDU4MDA1MDAwL2Nsb2NrLW5hbWVzIDw9PQphcGJfcGNsawAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9tbWNANTgwMDUwMDAvY2QtZ3Bpb3MgPD09CgAAAHcAAAABAAAAEQo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL21tY0A1ODAwNTAwMC9zdGF0dXMgPD09Cm9rYXkACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvbW1jQDU4MDA1MDAwL2ludGVycnVwdHMgPD09CgAAAAAAAAAxAAAABAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL21tY0A1ODAwNTAwMC9kaXNhYmxlLXdwIDw9PQoKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9tbWNANTgwMDUwMDAvYnVzLXdpZHRoIDw9PQoAAAAECj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvbW1jQDU4MDA1MDAwL3BoYW5kbGUgPD09CgAAAQsKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9tbWNANTgwMDUwMDAvYXJtLHByaW1lY2VsbC1wZXJpcGhpZCA8
PT0KACUxgAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21tY0A1ODAwNTAwMC9waW5jdHJsLTIg
PD09CgAAAHUAAAB2Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbW1jQDU4MDA1MDAwL3NkLXVo
cy1zZHI1MCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbW1jQDU4MDA1MDAwL3NkLXVo
cy1zZHIxMiA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbW1jQDU4MDA1MDAwL3JlZyA8
PT0KWABQAAAAEAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tbWNANTgwMDUwMDAvcGluY3Ry
bC0wIDw9PQoAAAByAAAAcwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21tY0A1ODAwNTAwMC9z
ZC11aHMtZGRyNTAgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21tY0A1ODAwNTAwMC92
bW1jLXN1cHBseSA8PT0KAAAAeAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21tY0A1ODAwNTAw
MC9pbnRlcnJ1cHQtbmFtZXMgPD09CmNtZF9pcnEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
bW1jQDU4MDA1MDAwL21heC1mcmVxdWVuY3kgPD09CgcnDgAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9tbWNANTgwMDUwMDAvdnFtbWMtc3VwcGx5IDw9PQoAAAB5Cj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvbW1jQDU4MDA1MDAwL25hbWUgPD09Cm1tYwAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9tbWNANTgwMDUwMDAvcGluY3RybC1uYW1lcyA8PT0KZGVmYXVsdABvcGVuZHJhaW4Ac2xl
ZXAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYXVkaW8tY29udHJvbGxlckA0NDAwNDAwMC9j
b21wYXRpYmxlIDw9PQpzdCxzdG0zMmg3LWkycwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9h
dWRpby1jb250cm9sbGVyQDQ0MDA0MDAwLyNzb3VuZC1kYWktY2VsbHMgPD09CgAAAAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9hdWRpby1jb250cm9sbGVyQDQ0MDA0MDAwL3N0YXR1cyA8PT0K
ZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYXVkaW8tY29udHJvbGxlckA0NDAw
NDAwMC9pbnRlcnJ1cHRzIDw9PQoAAAAAAAAAIwAAAAQKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9hdWRpby1jb250cm9sbGVyQDQ0MDA0MDAwL2RtYS1uYW1lcyA8PT0KcngAdHgACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvYXVkaW8tY29udHJvbGxlckA0NDAwNDAwMC9waGFuZGxlIDw9PQoA
AADhCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYXVkaW8tY29udHJvbGxlckA0NDAwNDAwMC9y
ZWcgPD09CkQAQAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvYXVkaW8tY29udHJvbGxl
ckA0NDAwNDAwMC9kbWFzIDw9PQoAAAAPAAAAJQAABAAAAAABAAAADwAAACYAAAQAAAAAAQo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL2F1ZGlvLWNvbnRyb2xsZXJANDQwMDQwMDAvbmFtZSA8PT0K
YXVkaW8tY29udHJvbGxlcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwODAw
MC9wd20vY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzItcHdtAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3RpbWVyQDQwMDA4MDAwL3B3bS9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA4MDAwL3B3bS8jcHdtLWNlbGxzIDw9PQoAAAADCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDgwMDAvcHdtL25hbWUgPD09CnB3bQAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwODAwMC9jb21wYXRpYmxlIDw9PQpzdCxz
dG0zMi10aW1lcnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDgwMDAvY2xv
Y2tzIDw9PQoAAAAMAAAAzQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA4MDAw
L2Nsb2NrLW5hbWVzIDw9PQppbnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAw
MDgwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1l
ckA0MDAwODAwMC8jYWRkcmVzcy1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3RpbWVyQDQwMDA4MDAwLyNzaXplLWNlbGxzIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvdGltZXJANDAwMDgwMDAvcGhhbmRsZSA8PT0KAAAAwgo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3RpbWVyQDQwMDA4MDAwL3RpbWVyQDEzL2NvbXBhdGlibGUgPD09CnN0LHN0bTMy
aDctdGltZXItdHJpZ2dlcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwODAw
MC90aW1lckAxMy9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3RpbWVyQDQwMDA4MDAwL3RpbWVyQDEzL3JlZyA8PT0KAAAADQo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3RpbWVyQDQwMDA4MDAwL3RpbWVyQDEzL25hbWUgPD09CnRpbWVyAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA4MDAwL3JlZyA8PT0KQACAAAAABAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwODAwMC9uYW1lIDw9PQp0aW1lcgAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9tZW1vcnktY29udHJvbGxlckA1ODAwMjAwMC9jb21wYXRpYmxlIDw9
PQpzdCxzdG0zMm1wMS1mbWMyLWViaQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tZW1vcnkt
Y29udHJvbGxlckA1ODAwMjAwMC9jbG9ja3MgPD09CgAAAAwAAAB5Cj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvbWVtb3J5LWNvbnRyb2xsZXJANTgwMDIwMDAvcmVzZXRzIDw9PQoAAAAMAAAMzAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21lbW9yeS1jb250cm9sbGVyQDU4MDAyMDAwL3BpbmN0
cmwtMSA8PT0KAAAAawo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21lbW9yeS1jb250cm9sbGVy
QDU4MDAyMDAwL25hbmQtY29udHJvbGxlckA0LDAvbmFuZEAwL25hbmQtb24tZmxhc2gtYmJ0IDw9
PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tZW1vcnktY29udHJvbGxlckA1ODAwMjAwMC9u
YW5kLWNvbnRyb2xsZXJANCwwL25hbmRAMC8jYWRkcmVzcy1jZWxscyA8PT0KAAAAAQo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL21lbW9yeS1jb250cm9sbGVyQDU4MDAyMDAwL25hbmQtY29udHJv
bGxlckA0LDAvbmFuZEAwLyNzaXplLWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvbWVtb3J5LWNvbnRyb2xsZXJANTgwMDIwMDAvbmFuZC1jb250cm9sbGVyQDQsMC9uYW5k
QDAvcmVnIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbWVtb3J5LWNvbnRyb2xs
ZXJANTgwMDIwMDAvbmFuZC1jb250cm9sbGVyQDQsMC9uYW5kQDAvbmFtZSA8PT0KbmFuZAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9tZW1vcnktY29udHJvbGxlckA1ODAwMjAwMC9uYW5kLWNv
bnRyb2xsZXJANCwwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMybXAxLWZtYzItbmZjAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL21lbW9yeS1jb250cm9sbGVyQDU4MDAyMDAwL25hbmQtY29udHJv
bGxlckA0LDAvc3RhdHVzIDw9PQpva2F5AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21lbW9y
eS1jb250cm9sbGVyQDU4MDAyMDAwL25hbmQtY29udHJvbGxlckA0LDAvI2FkZHJlc3MtY2VsbHMg
PD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tZW1vcnktY29udHJvbGxlckA1ODAw
MjAwMC9uYW5kLWNvbnRyb2xsZXJANCwwL2ludGVycnVwdHMgPD09CgAAAAAAAAAwAAAABAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL21lbW9yeS1jb250cm9sbGVyQDU4MDAyMDAwL25hbmQtY29u
dHJvbGxlckA0LDAvI3NpemUtY2VsbHMgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9tZW1vcnktY29udHJvbGxlckA1ODAwMjAwMC9uYW5kLWNvbnRyb2xsZXJANCwwL2RtYS1uYW1l
cyA8PT0KdHgAcngAZWNjAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21lbW9yeS1jb250cm9s
bGVyQDU4MDAyMDAwL25hbmQtY29udHJvbGxlckA0LDAvcmVnIDw9PQoAAAAEAAAAAAAAEAAAAAAE
CAEAAAAAEAAAAAAECAIAAAAAEAAAAAAEAQAAAAAAEAAAAAAECQEAAAAAEAAAAAAECQIAAAAAEAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tZW1vcnktY29udHJvbGxlckA1ODAwMjAwMC9uYW5k
LWNvbnRyb2xsZXJANCwwL2RtYXMgPD09CgAAAEoAAAAUAAAAAhIACgIAAAAAAAAAAAAAAAAAAABK
AAAAFAAAAAISAAoIAAAAAAAAAAAAAAAAAAAASgAAABUAAAACEgAKCgAAAAAAAAAAAAAAAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL21lbW9yeS1jb250cm9sbGVyQDU4MDAyMDAwL25hbmQtY29u
dHJvbGxlckA0LDAvbmFtZSA8PT0KbmFuZC1jb250cm9sbGVyAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL21lbW9yeS1jb250cm9sbGVyQDU4MDAyMDAwL3JhbmdlcyA8PT0KAAAAAAAAAABgAAAA
BAAAAAAAAAEAAAAAZAAAAAQAAAAAAAACAAAAAGgAAAAEAAAAAAAAAwAAAABsAAAABAAAAAAAAAQA
AAAAgAAAABAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tZW1vcnktY29udHJvbGxlckA1
ODAwMjAwMC9zdGF0dXMgPD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbWVtb3J5
LWNvbnRyb2xsZXJANTgwMDIwMDAvI2FkZHJlc3MtY2VsbHMgPD09CgAAAAIKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9tZW1vcnktY29udHJvbGxlckA1ODAwMjAwMC8jc2l6ZS1jZWxscyA8PT0K
AAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21lbW9yeS1jb250cm9sbGVyQDU4MDAyMDAw
L3BoYW5kbGUgPD09CgAAAQcKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tZW1vcnktY29udHJv
bGxlckA1ODAwMjAwMC9yZWcgPD09ClgAIAAAABAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
bWVtb3J5LWNvbnRyb2xsZXJANTgwMDIwMDAvcGluY3RybC0wIDw9PQoAAABqCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvbWVtb3J5LWNvbnRyb2xsZXJANTgwMDIwMDAvbmFtZSA8PT0KbWVtb3J5
LWNvbnRyb2xsZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbWVtb3J5LWNvbnRyb2xsZXJA
NTgwMDIwMDAvcGluY3RybC1uYW1lcyA8PT0KZGVmYXVsdABzbGVlcAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9zZXJpYWxANDAwMTEwMDAvcG93ZXItZG9tYWlucyA8PT0KAAAAEwo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0MDAxMTAwMC9pbnRlcnJ1cHRzLWV4dGVuZGVkIDw9
PQoAAAASAAAAHwAAAAQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAwMTEwMDAv
Y29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzJoNy11YXJ0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3NlcmlhbEA0MDAxMTAwMC9jbG9ja3MgPD09CgAAAAwAAACYCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2Mvc2VyaWFsQDQwMDExMDAwL3dha2V1cC1zb3VyY2UgPD09Cgo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3NlcmlhbEA0MDAxMTAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0MDAxMTAwMC9kbWEtbmFtZXMgPD09CnJ4AHR4AAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0MDAxMTAwMC9waGFuZGxlIDw9PQoAAADMCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFsQDQwMDExMDAwL3JlZyA8PT0KQAEQAAAABAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAwMTEwMDAvZG1hcyA8PT0KAAAADwAA
AEEAAAQAAAAAFQAAAA8AAABCAAAEAAAAABEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJp
YWxANDAwMTEwMDAvbmFtZSA8PT0Kc2VyaWFsAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Rp
bWVyQDQwMDA1MDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLXRpbWVycwAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy90aW1lckA0MDAwNTAwMC9jbG9ja3MgPD09CgAAAAwAAADKCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDUwMDAvY2xvY2stbmFtZXMgPD09CmludAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwNTAwMC90aW1lckA2L2NvbXBhdGlibGUg
PD09CnN0LHN0bTMyaDctdGltZXItdHJpZ2dlcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90
aW1lckA0MDAwNTAwMC90aW1lckA2L3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvdGltZXJANDAwMDUwMDAvdGltZXJANi9yZWcgPD09CgAAAAYKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwNTAwMC90aW1lckA2L25hbWUgPD09CnRpbWVyAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA1MDAwL3N0YXR1cyA8PT0KZGlzYWJs
ZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDUwMDAvI2FkZHJlc3MtY2Vs
bHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwNTAwMC8jc2l6
ZS1jZWxscyA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA1MDAw
L2RtYS1uYW1lcyA8PT0KdXAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDUw
MDAvcGhhbmRsZSA8PT0KAAAAvwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA1
MDAwL3JlZyA8PT0KQABQAAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAw
NTAwMC9kbWFzIDw9PQoAAAAPAAAARgAABACAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
dGltZXJANDAwMDUwMDAvbmFtZSA8PT0KdGltZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
dGltZXJANDAwMDIwMDAvcHdtL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLXB3bQAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwMjAwMC9wd20vc3RhdHVzIDw9PQpkaXNhYmxlZAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwMjAwMC9wd20vI3B3bS1jZWxscyA8
PT0KAAAAAwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAyMDAwL3B3bS9uYW1l
IDw9PQpwd20ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDIwMDAvY29tcGF0
aWJsZSA8PT0Kc3Qsc3RtMzItdGltZXJzAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVy
QDQwMDAyMDAwL2Nsb2NrcyA8PT0KAAAADAAAAMcKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90
aW1lckA0MDAwMjAwMC90aW1lckAzL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyaDctdGltZXItdHJp
Z2dlcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwMjAwMC90aW1lckAzL3N0
YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDIw
MDAvdGltZXJAMy9yZWcgPD09CgAAAAMKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0
MDAwMjAwMC90aW1lckAzL25hbWUgPD09CnRpbWVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3RpbWVyQDQwMDAyMDAwL2Nsb2NrLW5hbWVzIDw9PQppbnQACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvdGltZXJANDAwMDIwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy90aW1lckA0MDAwMjAwMC8jYWRkcmVzcy1jZWxscyA8PT0KAAAAAQo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAyMDAwLyNzaXplLWNlbGxzIDw9PQoAAAAACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDIwMDAvZG1hLW5hbWVzIDw9PQpjaDEA
Y2gyAGNoMwBjaDQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDIwMDAvcGhh
bmRsZSA8PT0KAAAAvAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAyMDAwL2Nv
dW50ZXIvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzItdGltZXItY291bnRlcgAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy90aW1lckA0MDAwMjAwMC9jb3VudGVyL3N0YXR1cyA8PT0KZGlzYWJsZWQA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDIwMDAvY291bnRlci9uYW1lIDw9
PQpjb3VudGVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDAyMDAwL3JlZyA8
PT0KQAAgAAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwMjAwMC9kbWFz
IDw9PQoAAAAPAAAAHQAABACAAAABAAAADwAAAB4AAAQAgAAAAQAAAA8AAAAfAAAEAIAAAAEAAAAP
AAAAIAAABACAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDIwMDAvbmFt
ZSA8PT0KdGltZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjMwMDAvcHdt
L2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLXB3bS1scAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy90aW1lckA1MDAyMzAwMC9wd20vc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy90aW1lckA1MDAyMzAwMC9wd20vI3B3bS1jZWxscyA8PT0KAAAAAwo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDUwMDIzMDAwL3B3bS9uYW1lIDw9PQpwd20ACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjMwMDAvcG93ZXItZG9tYWlucyA8PT0KAAAA
Ewo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDUwMDIzMDAwL2ludGVycnVwdHMtZXh0
ZW5kZWQgPD09CgAAABIAAAA0AAAABAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDUw
MDIzMDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLWxwdGltZXIACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvdGltZXJANTAwMjMwMDAvY2xvY2tzIDw9PQoAAAAMAAAAkgo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3RpbWVyQDUwMDIzMDAwL3dha2V1cC1zb3VyY2UgPD09Cgo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3RpbWVyQDUwMDIzMDAwL2Nsb2NrLW5hbWVzIDw9PQptdXgACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjMwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA1MDAyMzAwMC9waGFuZGxlIDw9PQoAAAD+
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANTAwMjMwMDAvdGltZXIvY29tcGF0aWJs
ZSA8PT0Kc3Qsc3RtMzItbHB0aW1lci10aW1lcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90
aW1lckA1MDAyMzAwMC90aW1lci9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3RpbWVyQDUwMDIzMDAwL3RpbWVyL25hbWUgPD09CnRpbWVyAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3RpbWVyQDUwMDIzMDAwL3JlZyA8PT0KUAIwAAAABAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy90aW1lckA1MDAyMzAwMC9uYW1lIDw9PQp0aW1lcgAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9jYW5ANDQwMGYwMDAvYm9zY2gsbXJhbS1jZmcgPD09CgAAFAAAAAAA
AAAAAAAAACAAAAAAAAAAAAAAAAIAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvY2FuQDQ0
MDBmMDAwL2NvbXBhdGlibGUgPD09CmJvc2NoLG1fY2FuAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL2NhbkA0NDAwZjAwMC9jbG9ja3MgPD09CgAAAAEAAAAAAAAADAAAAJ0KPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9jYW5ANDQwMGYwMDAvcmVnLW5hbWVzIDw9PQptX2NhbgBtZXNzYWdlX3Jh
bQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9jYW5ANDQwMGYwMDAvY2xvY2stbmFtZXMgPD09
CmhjbGsAY2NsawAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9jYW5ANDQwMGYwMDAvc3RhdHVz
IDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9jYW5ANDQwMGYwMDAvaW50
ZXJydXB0cyA8PT0KAAAAAAAAABQAAAAEAAAAAAAAABYAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvY2FuQDQ0MDBmMDAwL3BoYW5kbGUgPD09CgAAAc4KPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9jYW5ANDQwMGYwMDAvcmVnIDw9PQpEAPAAAAAEAEQBEAAAACgACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvY2FuQDQ0MDBmMDAwL2ludGVycnVwdC1uYW1lcyA8PT0KaW50MABpbnQxAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2NhbkA0NDAwZjAwMC9uYW1lIDw9PQpjYW4ACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvZHNpQDVhMDAwMDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMy
LWRzaQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kc2lANWEwMDAwMDAvY2xvY2tzIDw9PQoA
AAAMAAAAowAAAAEAAAAAAAAADAAAAKQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kc2lANWEw
MDAwMDAvcmVzZXRzIDw9PQoAAAAMAAAMBAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2RzaUA1
YTAwMDAwMC9jbG9jay1uYW1lcyA8PT0KcGNsawByZWYAcHhfY2xrAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2RzaUA1YTAwMDAwMC9wb3J0cy9wb3J0QDEvZW5kcG9pbnQvcmVtb3RlLWVuZHBv
aW50IDw9PQoAAACUCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZHNpQDVhMDAwMDAwL3BvcnRz
L3BvcnRAMS9lbmRwb2ludC9waGFuZGxlIDw9PQoAAACXCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvZHNpQDVhMDAwMDAwL3BvcnRzL3BvcnRAMS9lbmRwb2ludC9uYW1lIDw9PQplbmRwb2ludAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kc2lANWEwMDAwMDAvcG9ydHMvcG9ydEAxL3JlZyA8
PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2RzaUA1YTAwMDAwMC9wb3J0cy9wb3J0
QDEvbmFtZSA8PT0KcG9ydAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kc2lANWEwMDAwMDAv
cG9ydHMvI2FkZHJlc3MtY2VsbHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9k
c2lANWEwMDAwMDAvcG9ydHMvI3NpemUtY2VsbHMgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9kc2lANWEwMDAwMDAvcG9ydHMvcG9ydEAwL2VuZHBvaW50L3JlbW90ZS1lbmRwb2lu
dCA8PT0KAAAAkwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2RzaUA1YTAwMDAwMC9wb3J0cy9w
b3J0QDAvZW5kcG9pbnQvcGhhbmRsZSA8PT0KAAAAhgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2RzaUA1YTAwMDAwMC9wb3J0cy9wb3J0QDAvZW5kcG9pbnQvbmFtZSA8PT0KZW5kcG9pbnQACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZHNpQDVhMDAwMDAwL3BvcnRzL3BvcnRAMC9yZWcgPD09
CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kc2lANWEwMDAwMDAvcG9ydHMvcG9ydEAw
L25hbWUgPD09CnBvcnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZHNpQDVhMDAwMDAwL3Bv
cnRzL25hbWUgPD09CnBvcnRzAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2RzaUA1YTAwMDAw
MC9zdGF0dXMgPD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZHNpQDVhMDAwMDAw
LyNhZGRyZXNzLWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZHNpQDVh
MDAwMDAwLyNzaXplLWNlbGxzIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZHNp
QDVhMDAwMDAwL3BoYW5kbGUgPD09CgAAAdAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kc2lA
NWEwMDAwMDAvcmVnIDw9PQpaAAAAAAAIAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2RzaUA1
YTAwMDAwMC9waHktZHNpLXN1cHBseSA8PT0KAAAAiAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2RzaUA1YTAwMDAwMC9yZXNldC1uYW1lcyA8PT0KYXBiAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL2RzaUA1YTAwMDAwMC9uYW1lIDw9PQpkc2kACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
ZHNpQDVhMDAwMDAwL3BhbmVsLWRzaUAwL2NvbXBhdGlibGUgPD09CnJheWRpdW0scm02ODIwMAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kc2lANWEwMDAwMDAvcGFuZWwtZHNpQDAvcG9ydC9l
bmRwb2ludC9yZW1vdGUtZW5kcG9pbnQgPD09CgAAAJcKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9kc2lANWEwMDAwMDAvcGFuZWwtZHNpQDAvcG9ydC9lbmRwb2ludC9waGFuZGxlIDw9PQoAAACU
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZHNpQDVhMDAwMDAwL3BhbmVsLWRzaUAwL3BvcnQv
ZW5kcG9pbnQvbmFtZSA8PT0KZW5kcG9pbnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZHNp
QDVhMDAwMDAwL3BhbmVsLWRzaUAwL3BvcnQvbmFtZSA8PT0KcG9ydAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9kc2lANWEwMDAwMDAvcGFuZWwtZHNpQDAvc3RhdHVzIDw9PQpva2F5AAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL2RzaUA1YTAwMDAwMC9wYW5lbC1kc2lAMC9yZXNldC1ncGlv
cyA8PT0KAAAAlQAAAA8AAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZHNpQDVhMDAwMDAw
L3BhbmVsLWRzaUAwL3BoYW5kbGUgPD09CgAAACoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9k
c2lANWEwMDAwMDAvcGFuZWwtZHNpQDAvcmVnIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvZHNpQDVhMDAwMDAwL3BhbmVsLWRzaUAwL2JhY2tsaWdodCA8PT0KAAAAlgo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL2RzaUA1YTAwMDAwMC9wYW5lbC1kc2lAMC9wb3dlci1zdXBwbHkg
PD09CgAAACkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kc2lANWEwMDAwMDAvcGFuZWwtZHNp
QDAvbmFtZSA8PT0KcGFuZWwtZHNpAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0
MDA2MDAwL3B3bS9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMi1wd20ACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvdGltZXJANDQwMDYwMDAvcHdtL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDYwMDAvcHdtLyNwd20tY2VsbHMgPD09CgAAAAMK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwNjAwMC9wd20vbmFtZSA8PT0KcHdt
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDA2MDAwL2NvbXBhdGlibGUgPD09
CnN0LHN0bTMyLXRpbWVycwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwNjAw
MC9jbG9ja3MgPD09CgAAAAwAAADQCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQw
MDYwMDAvdGltZXJAMTQvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzJoNy10aW1lci10cmlnZ2VyAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDA2MDAwL3RpbWVyQDE0L3N0YXR1cyA8
PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDYwMDAvdGlt
ZXJAMTQvcmVnIDw9PQoAAAAOCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDYw
MDAvdGltZXJAMTQvbmFtZSA8PT0KdGltZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGlt
ZXJANDQwMDYwMDAvY2xvY2stbmFtZXMgPD09CmludAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy90aW1lckA0NDAwNjAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3RpbWVyQDQ0MDA2MDAwLyNhZGRyZXNzLWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDYwMDAvI3NpemUtY2VsbHMgPD09CgAAAAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwNjAwMC9kbWEtbmFtZXMgPD09CmNoMQB1cAB0
cmlnAGNvbQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwNjAwMC9waGFuZGxl
IDw9PQoAAADjCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDYwMDAvcmVnIDw9
PQpEAGAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDA2MDAwL2RtYXMg
PD09CgAAAA8AAABpAAAEAIAAAAEAAAAPAAAAagAABACAAAABAAAADwAAAGsAAAQAgAAAAQAAAA8A
AABsAAAEAIAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwNjAwMC9uYW1l
IDw9PQp0aW1lcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9ybmdANTQwMDMwMDAvY29tcGF0
aWJsZSA8PT0Kc3Qsc3RtMzItcm5nAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3JuZ0A1NDAw
MzAwMC9jbG9ja3MgPD09CgAAAAEAAAAQCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvcm5nQDU0
MDAzMDAwL3Jlc2V0cyA8PT0KAAAAaQAAAAgKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9ybmdA
NTQwMDMwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9y
bmdANTQwMDMwMDAvcGhhbmRsZSA8PT0KAAABBgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Ju
Z0A1NDAwMzAwMC9yZWcgPD09ClQAMAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvcm5n
QDU0MDAzMDAwL25hbWUgPD09CnJuZwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMw
MDIwMDAvcG93ZXItZG9tYWlucyA8PT0KAAAAEwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2ky
Y0A1YzAwMjAwMC9pbnRlcnJ1cHRzLWV4dGVuZGVkIDw9PQoAAAASAAAAGAAAAAQAAAAHAAAAAAAA
AGAAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL2NvbXBhdGlibGUg
PD09CnN0LHN0bTMybXAxNS1pMmMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAy
MDAwL2Nsb2NrcyA8PT0KAAAAAQAAAA0KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMw
MDIwMDAvc3Qsc3lzY2ZnLWZtcCA8PT0KAAAACwAAAAQAAAAICj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvaTJjQDVjMDAyMDAwL3Jlc2V0cyA8PT0KAAAAaQAAAAEKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9pMmNANWMwMDIwMDAvd2FrZXVwLXNvdXJjZSA8PT0KCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvaTJjQDVjMDAyMDAwL2kyYy1hbmFsb2ctZmlsdGVyIDw9PQoKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvcGluY3RybC0xIDw9PQoAAACKCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL2kyYy1zY2wtZmFsbGluZy10aW1lLW5zIDw9PQoA
AAAUCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0YXR1cyA8PT0Kb2th
eQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvI2FkZHJlc3MtY2VsbHMg
PD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvI3NpemUtY2Vs
bHMgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWlj
QDMzL2ludGVycnVwdHMtZXh0ZW5kZWQgPD09CgAAAIsAAAA3AAAAAgo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvY29tcGF0aWJsZSA8PT0Kc3Qsc3RwbWlj
MQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL29ua2V5
L2NvbXBhdGlibGUgPD09CnN0LHN0cG1pYzEtb25rZXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9vbmtleS9zdGF0dXMgPD09Cm9rYXkACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9vbmtleS9pbnRlcnJ1cHRz
IDw9PQoAAAAAAAAAAAAAAAEAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAy
MDAwL3N0cG1pY0AzMy9vbmtleS9wb3dlci1vZmYtdGltZS1zZWMgPD09CgAAAAoKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL29ua2V5L2ludGVycnVwdC1u
YW1lcyA8PT0Kb25rZXktZmFsbGluZwBvbmtleS1yaXNpbmcACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9vbmtleS9uYW1lIDw9PQpvbmtleQAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3N0YXR1cyA8PT0Kb2th
eQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzLyNpbnRl
cnJ1cHQtY2VsbHMgPD09CgAAAAIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIw
MDAvc3RwbWljQDMzL3BoYW5kbGUgPD09CgAAARYKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9p
MmNANWMwMDIwMDAvc3RwbWljQDMzL3dhdGNoZG9nL2NvbXBhdGlibGUgPD09CnN0LHN0cG1pYzEt
d2R0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvd2F0
Y2hkb2cvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNA
NWMwMDIwMDAvc3RwbWljQDMzL3dhdGNoZG9nL25hbWUgPD09CndhdGNoZG9nAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9wd3Jfc3cx
L2ludGVycnVwdHMgPD09CgAAAAwAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVj
MDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL3B3cl9zdzEvcGhhbmRsZSA8PT0KAAAAVQo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9w
d3Jfc3cxL3JlZ3VsYXRvci1uYW1lIDw9PQp2YnVzX290ZwAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRvcnMvcHdyX3N3MS9uYW1lIDw9PQpw
d3Jfc3cxAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMv
cmVndWxhdG9ycy9jb21wYXRpYmxlIDw9PQpzdCxzdHBtaWMxLXJlZ3VsYXRvcnMACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2xkbzEt
c3VwcGx5IDw9PQoAAAApCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0
cG1pY0AzMy9yZWd1bGF0b3JzL3ZyZWZfZGRyLXN1cHBseSA8PT0KAAAAjAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9idWNrNC1zdXBw
bHkgPD09CgAAAIwKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWlj
QDMzL3JlZ3VsYXRvcnMvbGRvNi9yZWd1bGF0b3ItZW5hYmxlLXJhbXAtZGVsYXkgPD09CgAEk+AK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRv
cnMvbGRvNi9pbnRlcnJ1cHRzIDw9PQoAAAAVAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9sZG82L3BoYW5kbGUgPD09CgAAACAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRv
cnMvbGRvNi9yZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA8PT0KABt3QAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9sZG82L3JlZ3VsYXRv
ci1tYXgtbWljcm92b2x0IDw9PQoAG3dACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVj
MDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2xkbzYvcmVndWxhdG9yLW5hbWUgPD09CnYxdjgA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0
b3JzL2xkbzYvbmFtZSA8PT0KbGRvNgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMw
MDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRvcnMvYm9vc3QvaW50ZXJydXB0cyA8PT0KAAAADgAAAAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRv
cnMvYm9vc3QvcGhhbmRsZSA8PT0KAAAAjgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1
YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9ib29zdC9yZWd1bGF0b3ItbmFtZSA8PT0KYnN0
X291dAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3Jl
Z3VsYXRvcnMvYm9vc3QvbmFtZSA8PT0KYm9vc3QACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
aTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2xkbzQvaW50ZXJydXB0cyA8PT0KAAAA
EwAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3Jl
Z3VsYXRvcnMvbGRvNC9waGFuZGxlIDw9PQoAAABbCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
aTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2xkbzQvcmVndWxhdG9yLW5hbWUgPD09
CnZkZF91c2IACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0Az
My9yZWd1bGF0b3JzL2xkbzQvbmFtZSA8PT0KbGRvNAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRvcnMvbGRvNi1zdXBwbHkgPD09CgAAACkK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRv
cnMvYnVjazMtc3VwcGx5IDw9PQoAAACMCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVj
MDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2xkbzIvaW50ZXJydXB0cyA8PT0KAAAAEQAAAAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRv
cnMvbGRvMi9waGFuZGxlIDw9PQoAAAAlCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVj
MDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2xkbzIvcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQg
PD09CgAquYAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMz
L3JlZ3VsYXRvcnMvbGRvMi9yZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA8PT0KACq5gAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9sZG8y
L3JlZ3VsYXRvci1uYW1lIDw9PQp2MnY4AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1
YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9sZG8yL25hbWUgPD09CmxkbzIACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2J1Y2sz
L3JlZ3VsYXRvci1vdmVyLWN1cnJlbnQtcHJvdGVjdGlvbiA8PT0KCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2J1Y2szL3N0LG1hc2st
cmVzZXQgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNA
MzMvcmVndWxhdG9ycy9idWNrMy9waGFuZGxlIDw9PQoAAAAfCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2J1Y2szL3JlZ3VsYXRvci1t
aW4tbWljcm92b2x0IDw9PQoAMlqgCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAy
MDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2J1Y2szL3JlZ3VsYXRvci1tYXgtbWljcm92b2x0IDw9
PQoAMlqgCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9y
ZWd1bGF0b3JzL2J1Y2szL3JlZ3VsYXRvci1hbHdheXMtb24gPD09Cgo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9idWNrMy9yZWd1bGF0
b3ItbmFtZSA8PT0KdmRkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9z
dHBtaWNAMzMvcmVndWxhdG9ycy9idWNrMy9yZWd1bGF0b3ItaW5pdGlhbC1tb2RlIDw9PQoAAAAA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0
b3JzL2J1Y2szL25hbWUgPD09CmJ1Y2szAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1
YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9wd3Jfc3cyL3JlZ3VsYXRvci1hY3RpdmUtZGlz
Y2hhcmdlIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0
cG1pY0AzMy9yZWd1bGF0b3JzL3B3cl9zdzIvaW50ZXJydXB0cyA8PT0KAAAADQAAAAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRvcnMvcHdy
X3N3Mi9waGFuZGxlIDw9PQoAAAEZCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAy
MDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL3B3cl9zdzIvcmVndWxhdG9yLW5hbWUgPD09CnZidXNf
c3cACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1
bGF0b3JzL3B3cl9zdzIvbmFtZSA8PT0KcHdyX3N3MgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRvcnMvbGRvNS1zdXBwbHkgPD09CgAAACkK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRv
cnMvYnVjazItc3VwcGx5IDw9PQoAAACMCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVj
MDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2J1Y2sxL3JlZ3VsYXRvci1vdmVyLWN1cnJlbnQt
cHJvdGVjdGlvbiA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0
cG1pY0AzMy9yZWd1bGF0b3JzL2J1Y2sxL3BoYW5kbGUgPD09CgAAAAQKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRvcnMvYnVjazEvcmVndWxh
dG9yLW1pbi1taWNyb3ZvbHQgPD09CgAST4AKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNA
NWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRvcnMvYnVjazEvcmVndWxhdG9yLW1heC1taWNyb3Zv
bHQgPD09CgAUmXAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWlj
QDMzL3JlZ3VsYXRvcnMvYnVjazEvcmVndWxhdG9yLWFsd2F5cy1vbiA8PT0KCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2J1Y2sxL3Jl
Z3VsYXRvci1uYW1lIDw9PQp2ZGRjb3JlAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1
YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9idWNrMS9yZWd1bGF0b3ItaW5pdGlhbC1tb2Rl
IDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0Az
My9yZWd1bGF0b3JzL2J1Y2sxL25hbWUgPD09CmJ1Y2sxAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9ib29zdC1zdXBwbHkgPD09CgAA
AIwKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3Vs
YXRvcnMvdnJlZl9kZHIvcGhhbmRsZSA8PT0KAAABGAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy92cmVmX2Rkci9yZWd1bGF0b3ItYWx3
YXlzLW9uIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWlj
QDMzL3JlZ3VsYXRvcnMvdnJlZl9kZHIvcmVndWxhdG9yLW5hbWUgPD09CnZyZWZfZGRyAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy92
cmVmX2Rkci9uYW1lIDw9PQp2cmVmX2RkcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNA
NWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRvcnMvbGRvNC1zdXBwbHkgPD09CgAAAIwKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRvcnMvYnVj
azEtc3VwcGx5IDw9PQoAAACMCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAw
L3N0cG1pY0AzMy9yZWd1bGF0b3JzL3B3cl9zdzItc3VwcGx5IDw9PQoAAACOCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2xkbzUvcmVn
dWxhdG9yLWJvb3Qtb24gPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAw
MC9zdHBtaWNAMzMvcmVndWxhdG9ycy9sZG81L2ludGVycnVwdHMgPD09CgAAABQAAAAACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2xk
bzUvcGhhbmRsZSA8PT0KAAAAeAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAw
MC9zdHBtaWNAMzMvcmVndWxhdG9ycy9sZG81L3JlZ3VsYXRvci1taW4tbWljcm92b2x0IDw9PQoA
LEAgCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1
bGF0b3JzL2xkbzUvcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPD09CgAsQCAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRvcnMvbGRvNS9yZWd1
bGF0b3ItbmFtZSA8PT0KdmRkX3NkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAw
MjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9sZG81L25hbWUgPD09CmxkbzUACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2xkbzMtc3Vw
cGx5IDw9PQoAAACNCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1p
Y0AzMy9yZWd1bGF0b3JzL2xkbzMvcmVndWxhdG9yLW92ZXItY3VycmVudC1wcm90ZWN0aW9uIDw9
PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3Vs
YXRvcnMvbGRvMy9waGFuZGxlIDw9PQoAAAEXCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJj
QDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2xkbzMvcmVndWxhdG9yLW1pbi1taWNyb3Zv
bHQgPD09CgAHoSAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWlj
QDMzL3JlZ3VsYXRvcnMvbGRvMy9yZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA8PT0KAAtxsAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9s
ZG8zL3JlZ3VsYXRvci1hbHdheXMtb24gPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2ky
Y0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9sZG8zL3JlZ3VsYXRvci1uYW1lIDw9PQp2
dHRfZGRyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMv
cmVndWxhdG9ycy9sZG8zL25hbWUgPD09CmxkbzMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
aTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2J1Y2s0L3JlZ3VsYXRvci1vdmVyLWN1
cnJlbnQtcHJvdGVjdGlvbiA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAy
MDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2J1Y2s0L3BoYW5kbGUgPD09CgAAACkKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRvcnMvYnVjazQv
cmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPD09CgAyWqAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRvcnMvYnVjazQvcmVndWxhdG9yLW1heC1t
aWNyb3ZvbHQgPD09CgAyWqAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAv
c3RwbWljQDMzL3JlZ3VsYXRvcnMvYnVjazQvcmVndWxhdG9yLWFsd2F5cy1vbiA8PT0KCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2J1
Y2s0L3JlZ3VsYXRvci1uYW1lIDw9PQp2M3YzAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2ky
Y0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9idWNrNC9yZWd1bGF0b3ItaW5pdGlhbC1t
b2RlIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1p
Y0AzMy9yZWd1bGF0b3JzL2J1Y2s0L25hbWUgPD09CmJ1Y2s0AAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9wd3Jfc3cxLXN1cHBseSA8
PT0KAAAAjgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMv
cmVndWxhdG9ycy9sZG8yLXN1cHBseSA8PT0KAAAAKQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9sZG8xL2ludGVycnVwdHMgPD09CgAA
ABAAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9y
ZWd1bGF0b3JzL2xkbzEvcGhhbmRsZSA8PT0KAAAAMQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9sZG8xL3JlZ3VsYXRvci1taW4tbWlj
cm92b2x0IDw9PQoALEAgCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0
cG1pY0AzMy9yZWd1bGF0b3JzL2xkbzEvcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPD09CgAsQCAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRv
cnMvbGRvMS9yZWd1bGF0b3ItbmFtZSA8PT0KdmRkYQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRvcnMvbGRvMS9uYW1lIDw9PQpsZG8xAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9y
cy9uYW1lIDw9PQpyZWd1bGF0b3JzAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAw
MjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9idWNrMi9yZWd1bGF0b3Itb3Zlci1jdXJyZW50LXBy
b3RlY3Rpb24gPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBt
aWNAMzMvcmVndWxhdG9ycy9idWNrMi9waGFuZGxlIDw9PQoAAACNCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2J1Y2syL3JlZ3VsYXRv
ci1taW4tbWljcm92b2x0IDw9PQoAFJlwCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVj
MDAyMDAwL3N0cG1pY0AzMy9yZWd1bGF0b3JzL2J1Y2syL3JlZ3VsYXRvci1tYXgtbWljcm92b2x0
IDw9PQoAFJlwCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3N0cG1pY0Az
My9yZWd1bGF0b3JzL2J1Y2syL3JlZ3VsYXRvci1hbHdheXMtb24gPD09Cgo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvcmVndWxhdG9ycy9idWNrMi9yZWd1
bGF0b3ItbmFtZSA8PT0KdmRkX2RkcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMw
MDIwMDAvc3RwbWljQDMzL3JlZ3VsYXRvcnMvYnVjazIvcmVndWxhdG9yLWluaXRpYWwtbW9kZSA8
PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMv
cmVndWxhdG9ycy9idWNrMi9uYW1lIDw9PQpidWNrMgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9pMmNANWMwMDIwMDAvc3RwbWljQDMzL3JlZyA8PT0KAAAAMwo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvbmFtZSA8PT0Kc3RwbWljAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9zdHBtaWNAMzMvaW50ZXJydXB0LWNvbnRyb2xs
ZXIgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9waGFuZGxlIDw9
PQoAAAEVCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3JlZyA8PT0KXAAg
AAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANWMwMDIwMDAvY2xvY2stZnJlcXVl
bmN5IDw9PQoABhqACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL3BpbmN0
cmwtMCA8PT0KAAAAiQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A1YzAwMjAwMC9pMmMt
c2NsLXJpc2luZy10aW1lLW5zIDw9PQoAAAC5Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJj
QDVjMDAyMDAwL2ludGVycnVwdC1uYW1lcyA8PT0KZXZlbnQAZXJyb3IACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvaTJjQDVjMDAyMDAwL25hbWUgPD09CmkyYwAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9pMmNANWMwMDIwMDAvcGluY3RybC1uYW1lcyA8PT0KZGVmYXVsdABzbGVlcAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTQwMDAvcG93ZXItZG9tYWlucyA8PT0KAAAA
Ewo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2kyY0A0MDAxNDAwMC9pbnRlcnJ1cHRzLWV4dGVu
ZGVkIDw9PQoAAAASAAAAFwAAAAQAAAAHAAAAAAAAAEkAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvaTJjQDQwMDE0MDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMybXAxNS1pMmMACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDE0MDAwL2Nsb2NrcyA8PT0KAAAADAAAAIsKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTQwMDAvc3Qsc3lzY2ZnLWZtcCA8PT0KAAAA
CwAAAAQAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDE0MDAwL3Jlc2V0cyA8
PT0KAAAADAAATBcKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTQwMDAvd2FrZXVw
LXNvdXJjZSA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDE0MDAwL2kyYy1h
bmFsb2ctZmlsdGVyIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTQwMDAv
c3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNANDAwMTQw
MDAvI2FkZHJlc3MtY2VsbHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9pMmNA
NDAwMTQwMDAvI3NpemUtY2VsbHMgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9p
MmNANDAwMTQwMDAvZG1hLW5hbWVzIDw9PQpyeAB0eAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9pMmNANDAwMTQwMDAvcGhhbmRsZSA8PT0KAAAA1Qo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2kyY0A0MDAxNDAwMC9yZWcgPD09CkABQAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
aTJjQDQwMDE0MDAwL2RtYXMgPD09CgAAAA8AAABJAAAEAIAAAAEAAAAPAAAASgAABACAAAABCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDE0MDAwL2ludGVycnVwdC1uYW1lcyA8PT0K
ZXZlbnQAZXJyb3IACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvaTJjQDQwMDE0MDAwL25hbWUg
PD09CmkyYwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlANDAwMGMwMDAvY29tcGF0aWJs
ZSA8PT0Kc3Qsc3RtMzJoNy1zcGkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDQwMDBj
MDAwL2Nsb2NrcyA8PT0KAAAADAAAAIQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlANDAw
MGMwMDAvcmVzZXRzIDw9PQoAAAAMAABMDAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA0
MDAwYzAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Nw
aUA0MDAwYzAwMC8jYWRkcmVzcy1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3NwaUA0MDAwYzAwMC9pbnRlcnJ1cHRzIDw9PQoAAAAAAAAAMwAAAAQKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9zcGlANDAwMGMwMDAvI3NpemUtY2VsbHMgPD09CgAAAAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9zcGlANDAwMGMwMDAvZG1hLW5hbWVzIDw9PQpyeAB0eAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9zcGlANDAwMGMwMDAvcGhhbmRsZSA8PT0KAAAAxgo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3NwaUA0MDAwYzAwMC9yZWcgPD09CkAAwAAAAAQACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDQwMDBjMDAwL2RtYXMgPD09CgAAAA8AAAA9AAAEAAAAAAEA
AAAPAAAAPgAABAAAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDQwMDBjMDAwL25h
bWUgPD09CnNwaQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwMDAwMC9wd20v
Y29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzItcHdtAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Rp
bWVyQDQ0MDAwMDAwL3B3bS9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3RpbWVyQDQ0MDAwMDAwL3B3bS8jcHdtLWNlbGxzIDw9PQoAAAADCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDAwMDAvcHdtL25hbWUgPD09CnB3bQAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwMDAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMi10
aW1lcnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDAwMDAvY2xvY2tzIDw9
PQoAAAAMAAAAzgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDAwMDAwL2Nsb2Nr
LW5hbWVzIDw9PQppbnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDAwMDAv
c3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAw
MDAwMC8jYWRkcmVzcy1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Rp
bWVyQDQ0MDAwMDAwLyNzaXplLWNlbGxzIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvdGltZXJANDQwMDAwMDAvZG1hLW5hbWVzIDw9PQpjaDEAY2gyAGNoMwBjaDQAdXAAdHJpZwBj
b20ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDAwMDAvcGhhbmRsZSA8PT0K
AAAA3Qo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDAwMDAwL2NvdW50ZXIvY29t
cGF0aWJsZSA8PT0Kc3Qsc3RtMzItdGltZXItY291bnRlcgAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy90aW1lckA0NDAwMDAwMC9jb3VudGVyL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDAwMDAvY291bnRlci9uYW1lIDw9PQpjb3VudGVy
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDAwMDAwL3JlZyA8PT0KRAAAAAAA
BAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwMDAwMC90aW1lckAwL2NvbXBh
dGlibGUgPD09CnN0LHN0bTMyaDctdGltZXItdHJpZ2dlcgAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy90aW1lckA0NDAwMDAwMC90aW1lckAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDQwMDAwMDAvdGltZXJAMC9yZWcgPD09CgAAAAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwMDAwMC90aW1lckAwL25hbWUgPD09CnRp
bWVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQ0MDAwMDAwL2RtYXMgPD09CgAA
AA8AAAALAAAEAIAAAAEAAAAPAAAADAAABACAAAABAAAADwAAAA0AAAQAgAAAAQAAAA8AAAAOAAAE
AIAAAAEAAAAPAAAADwAABACAAAABAAAADwAAABAAAAQAgAAAAQAAAA8AAAARAAAEAIAAAAEKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0NDAwMDAwMC9uYW1lIDw9PQp0aW1lcgAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9hdWRpby1jb250cm9sbGVyQDQwMDBiMDAwL2NvbXBhdGli
bGUgPD09CnN0LHN0bTMyaDctaTJzAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2F1ZGlvLWNv
bnRyb2xsZXJANDAwMGIwMDAvI3NvdW5kLWRhaS1jZWxscyA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL2F1ZGlvLWNvbnRyb2xsZXJANDAwMGIwMDAvc3RhdHVzIDw9PQpkaXNhYmxl
ZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9hdWRpby1jb250cm9sbGVyQDQwMDBiMDAwL2lu
dGVycnVwdHMgPD09CgAAAAAAAAAkAAAABAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2F1ZGlv
LWNvbnRyb2xsZXJANDAwMGIwMDAvZG1hLW5hbWVzIDw9PQpyeAB0eAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9hdWRpby1jb250cm9sbGVyQDQwMDBiMDAwL3BoYW5kbGUgPD09CgAAAMUKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9hdWRpby1jb250cm9sbGVyQDQwMDBiMDAwL3JlZyA8PT0K
QACwAAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9hdWRpby1jb250cm9sbGVyQDQwMDBi
MDAwL2RtYXMgPD09CgAAAA8AAAAnAAAEAAAAAAEAAAAPAAAAKAAABAAAAAABCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvYXVkaW8tY29udHJvbGxlckA0MDAwYjAwMC9uYW1lIDw9PQphdWRpby1j
b250cm9sbGVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3VzYkA1ODAwYzAwMC9jb21wYXRp
YmxlIDw9PQpnZW5lcmljLW9oY2kACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdXNiQDU4MDBj
MDAwL2Nsb2NrcyA8PT0KAAAAgwAAAAwAAABvCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdXNi
QDU4MDBjMDAwL3Jlc2V0cyA8PT0KAAAADAAADNgKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91
c2JANTgwMGMwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy91c2JANTgwMGMwMDAvaW50ZXJydXB0cyA8PT0KAAAAAAAAAEoAAAAECj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvdXNiQDU4MDBjMDAwL3BoYW5kbGUgPD09CgAAAIQKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy91c2JANTgwMGMwMDAvcmVnIDw9PQpYAMAAAAAQAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3VzYkA1ODAwYzAwMC9uYW1lIDw9PQp1c2IACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvZGZzZG1ANDQwMGQwMDAvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzJtcDEtZGZzZG0ACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvY2xvY2tzIDw9PQoAAAAMAAAA
nAAAAAwAAAClCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVy
QDUvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzItZGZzZG0tYWRjAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckA1LyNpby1jaGFubmVsLWNlbGxzIDw9PQoAAAAB
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDUvc3RhdHVz
IDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9m
aWx0ZXJANS9pbnRlcnJ1cHRzIDw9PQoAAAAAAAAAfgAAAAQKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJANS9kbWEtbmFtZXMgPD09CnJ4AAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckA1L3BoYW5kbGUgPD09CgAAAPUK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJANS9yZWcgPD09
CgAAAAUKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJANS9k
bWFzIDw9PQoAAAAPAAAAXAAABAAAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1A
NDQwMGQwMDAvZmlsdGVyQDUvbmFtZSA8PT0KZmlsdGVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL2Rmc2RtQDQ0MDBkMDAwL3BpbmN0cmwtMSA8PT0KAAAAPwAAAEAAAABBCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDMvY29tcGF0aWJsZSA8PT0Kc3Qs
c3RtMzItZGZzZG0tZG1pYwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAw
MC9maWx0ZXJAMy8jaW8tY2hhbm5lbC1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAzL3N0LGZpbHRlci1vcmRlciA8PT0KAAAAAwo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAzL3N0LGFkYy1j
aGFubmVsLW5hbWVzIDw9PQpkbWljX3U0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2Rt
QDQ0MDBkMDAwL2ZpbHRlckAzL3N0LGFkYy1jaGFubmVsLXR5cGVzIDw9PQpTUElfUgAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMy9zdGF0dXMgPD09Cm9r
YXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDMvaW50
ZXJydXB0cyA8PT0KAAAAAAAAAHEAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1A
NDQwMGQwMDAvZmlsdGVyQDMvZG1hLW5hbWVzIDw9PQpyeAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMy9waGFuZGxlIDw9PQoAAABICj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDMvc3QsYWRjLWNoYW5uZWwtY2xr
LXNyYyA8PT0KQ0xLT1VUAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAw
L2ZpbHRlckAzL3JlZyA8PT0KAAAAAwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0
MDBkMDAwL2ZpbHRlckAzL2RtYXMgPD09CgAAAA8AAABoAAAEAAAAAAEKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMy9kZnNkbS1kYWkvaW8tY2hhbm5lbHMg
PD09CgAAAEgAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmls
dGVyQDMvZGZzZG0tZGFpL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyaDctZGZzZG0tZGFpAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAzL2Rmc2RtLWRhaS8j
c291bmQtZGFpLWNlbGxzIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1A
NDQwMGQwMDAvZmlsdGVyQDMvZGZzZG0tZGFpL3BvcnQvZW5kcG9pbnQvcmVtb3RlLWVuZHBvaW50
IDw9PQoAAABJCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVy
QDMvZGZzZG0tZGFpL3BvcnQvZW5kcG9pbnQvcGhhbmRsZSA8PT0KAAAAswo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAzL2Rmc2RtLWRhaS9wb3J0L2VuZHBv
aW50L25hbWUgPD09CmVuZHBvaW50AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0
MDBkMDAwL2ZpbHRlckAzL2Rmc2RtLWRhaS9wb3J0L3BoYW5kbGUgPD09CgAAAK8KPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMy9kZnNkbS1kYWkvcG9ydC9u
YW1lIDw9PQpwb3J0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2Zp
bHRlckAzL2Rmc2RtLWRhaS9zdGF0dXMgPD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDMvZGZzZG0tZGFpL3BoYW5kbGUgPD09CgAAAPMKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMy9kZnNkbS1kYWkv
bmFtZSA8PT0KZGZzZG0tZGFpAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBk
MDAwL2ZpbHRlckAzL3N0LGFkYy1jaGFubmVscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAzL25hbWUgPD09CmZpbHRlcgAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9jbG9jay1uYW1lcyA8PT0KZGZzZG0AYXVk
aW8ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDEvY29t
cGF0aWJsZSA8PT0Kc3Qsc3RtMzItZGZzZG0tZG1pYwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMS8jaW8tY2hhbm5lbC1jZWxscyA8PT0KAAAAAQo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAxL3N0LGZpbHRlci1v
cmRlciA8PT0KAAAAAwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2Zp
bHRlckAxL3N0LGFkYy1jaGFubmVsLW5hbWVzIDw9PQpkbWljX3UyAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAxL3N0LGFkYy1jaGFubmVsLXR5cGVzIDw9
PQpTUElfRgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJA
MS9zdCxhZGMtYWx0LWNoYW5uZWwgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9k
ZnNkbUA0NDAwZDAwMC9maWx0ZXJAMS9zdGF0dXMgPD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDEvaW50ZXJydXB0cyA8PT0KAAAAAAAAAG8A
AAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDEvZG1h
LW5hbWVzIDw9PQpyeAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9m
aWx0ZXJAMS9waGFuZGxlIDw9PQoAAABECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1A
NDQwMGQwMDAvZmlsdGVyQDEvc3QsYWRjLWNoYW5uZWwtY2xrLXNyYyA8PT0KQ0xLT1VUAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAxL3JlZyA8PT0KAAAA
AQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAxL2RtYXMg
PD09CgAAAA8AAABmAAAEAAAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAw
ZDAwMC9maWx0ZXJAMS9kZnNkbS1kYWkvaW8tY2hhbm5lbHMgPD09CgAAAEQAAAAACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDEvZGZzZG0tZGFpL2NvbXBh
dGlibGUgPD09CnN0LHN0bTMyaDctZGZzZG0tZGFpAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAxL2Rmc2RtLWRhaS8jc291bmQtZGFpLWNlbGxzIDw9PQoA
AAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDEvZGZz
ZG0tZGFpL3BvcnQvZW5kcG9pbnQvcmVtb3RlLWVuZHBvaW50IDw9PQoAAABFCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDEvZGZzZG0tZGFpL3BvcnQvZW5k
cG9pbnQvcGhhbmRsZSA8PT0KAAAAsQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0
MDBkMDAwL2ZpbHRlckAxL2Rmc2RtLWRhaS9wb3J0L2VuZHBvaW50L25hbWUgPD09CmVuZHBvaW50
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAxL2Rmc2Rt
LWRhaS9wb3J0L3BoYW5kbGUgPD09CgAAAK0KPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kZnNk
bUA0NDAwZDAwMC9maWx0ZXJAMS9kZnNkbS1kYWkvcG9ydC9uYW1lIDw9PQpwb3J0AAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAxL2Rmc2RtLWRhaS9zdGF0
dXMgPD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmls
dGVyQDEvZGZzZG0tZGFpL3BoYW5kbGUgPD09CgAAAPEKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMS9kZnNkbS1kYWkvbmFtZSA8PT0KZGZzZG0tZGFpAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAxL3N0LGFkYy1j
aGFubmVscyA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAw
L2ZpbHRlckAxL25hbWUgPD09CmZpbHRlcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kZnNk
bUA0NDAwZDAwMC9zdGF0dXMgPD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZz
ZG1ANDQwMGQwMDAvI2FkZHJlc3MtY2VsbHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9kZnNkbUA0NDAwZDAwMC8jc2l6ZS1jZWxscyA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL3BoYW5kbGUgPD09CgAAAO8KPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJANC9jb21wYXRpYmxlIDw9PQpzdCxzdG0z
Mi1kZnNkbS1hZGMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmls
dGVyQDQvI2lvLWNoYW5uZWwtY2VsbHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJANC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckA0L2ludGVycnVwdHMgPD09CgAA
AAAAAABzAAAABAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRl
ckA0L2RtYS1uYW1lcyA8PT0KcngACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQw
MGQwMDAvZmlsdGVyQDQvcGhhbmRsZSA8PT0KAAAA9Ao9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckA0L3JlZyA8PT0KAAAABAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckA0L2RtYXMgPD09CgAAAA8AAABbAAAEAAAAAAEK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJANC9uYW1lIDw9
PQpmaWx0ZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvcmVnIDw9
PQpEANAAAAAIAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL3BpbmN0
cmwtMCA8PT0KAAAAPAAAAD0AAAA+Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQw
MGQwMDAvZmlsdGVyQDIvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzItZGZzZG0tZG1pYwAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMi8jaW8tY2hhbm5lbC1j
ZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2Zp
bHRlckAyL3N0LGZpbHRlci1vcmRlciA8PT0KAAAAAwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAyL3N0LGFkYy1jaGFubmVsLW5hbWVzIDw9PQpkbWljX3Uz
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAyL3N0LGFk
Yy1jaGFubmVsLXR5cGVzIDw9PQpTUElfRgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kZnNk
bUA0NDAwZDAwMC9maWx0ZXJAMi9zdCxhZGMtYWx0LWNoYW5uZWwgPD09CgAAAAEKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMi9zdGF0dXMgPD09Cm9rYXkA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDIvaW50ZXJy
dXB0cyA8PT0KAAAAAAAAAHAAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQw
MGQwMDAvZmlsdGVyQDIvZG1hLW5hbWVzIDw9PQpyeAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMi9waGFuZGxlIDw9PQoAAABGCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDIvc3QsYWRjLWNoYW5uZWwtY2xrLXNy
YyA8PT0KQ0xLT1VUAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2Zp
bHRlckAyL3JlZyA8PT0KAAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBk
MDAwL2ZpbHRlckAyL2RtYXMgPD09CgAAAA8AAABnAAAEAAAAAAEKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMi9kZnNkbS1kYWkvaW8tY2hhbm5lbHMgPD09
CgAAAEYAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVy
QDIvZGZzZG0tZGFpL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyaDctZGZzZG0tZGFpAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAyL2Rmc2RtLWRhaS8jc291
bmQtZGFpLWNlbGxzIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQw
MGQwMDAvZmlsdGVyQDIvZGZzZG0tZGFpL3BvcnQvZW5kcG9pbnQvcmVtb3RlLWVuZHBvaW50IDw9
PQoAAABHCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDIv
ZGZzZG0tZGFpL3BvcnQvZW5kcG9pbnQvcGhhbmRsZSA8PT0KAAAAsgo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAyL2Rmc2RtLWRhaS9wb3J0L2VuZHBvaW50
L25hbWUgPD09CmVuZHBvaW50AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBk
MDAwL2ZpbHRlckAyL2Rmc2RtLWRhaS9wb3J0L3BoYW5kbGUgPD09CgAAAK4KPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMi9kZnNkbS1kYWkvcG9ydC9uYW1l
IDw9PQpwb3J0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRl
ckAyL2Rmc2RtLWRhaS9zdGF0dXMgPD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
ZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDIvZGZzZG0tZGFpL3BoYW5kbGUgPD09CgAAAPIKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMi9kZnNkbS1kYWkvbmFt
ZSA8PT0KZGZzZG0tZGFpAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAw
L2ZpbHRlckAyL3N0LGFkYy1jaGFubmVscyA8PT0KAAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAyL25hbWUgPD09CmZpbHRlcgAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMC9jb21wYXRpYmxlIDw9PQpzdCxz
dG0zMi1kZnNkbS1kbWljAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAw
L2ZpbHRlckAwLyNpby1jaGFubmVsLWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDAvc3QsZmlsdGVyLW9yZGVyIDw9PQoAAAADCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDAvc3QsYWRjLWNo
YW5uZWwtbmFtZXMgPD09CmRtaWNfdTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1A
NDQwMGQwMDAvZmlsdGVyQDAvc3QsYWRjLWNoYW5uZWwtdHlwZXMgPD09ClNQSV9SAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAwL3N0YXR1cyA8PT0Kb2th
eQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMC9pbnRl
cnJ1cHRzIDw9PQoAAAAAAAAAbgAAAAQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kZnNkbUA0
NDAwZDAwMC9maWx0ZXJAMC9kbWEtbmFtZXMgPD09CnJ4AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAwL3BoYW5kbGUgPD09CgAAAEIKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMC9zdCxhZGMtY2hhbm5lbC1jbGst
c3JjIDw9PQpDTEtPVVQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAv
ZmlsdGVyQDAvcmVnIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQw
MGQwMDAvZmlsdGVyQDAvZG1hcyA8PT0KAAAADwAAAGUAAAQAAAAAAQo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAwL2Rmc2RtLWRhaS9pby1jaGFubmVscyA8
PT0KAAAAQgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0
ZXJAMC9kZnNkbS1kYWkvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzJoNy1kZnNkbS1kYWkACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDAvZGZzZG0tZGFpLyNz
b3VuZC1kYWktY2VsbHMgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kZnNkbUA0
NDAwZDAwMC9maWx0ZXJAMC9kZnNkbS1kYWkvcG9ydC9lbmRwb2ludC9yZW1vdGUtZW5kcG9pbnQg
PD09CgAAAEMKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJA
MC9kZnNkbS1kYWkvcG9ydC9lbmRwb2ludC9waGFuZGxlIDw9PQoAAACwCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDAvZGZzZG0tZGFpL3BvcnQvZW5kcG9p
bnQvbmFtZSA8PT0KZW5kcG9pbnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQw
MGQwMDAvZmlsdGVyQDAvZGZzZG0tZGFpL3BvcnQvcGhhbmRsZSA8PT0KAAAArAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAwL2Rmc2RtLWRhaS9wb3J0L25h
bWUgPD09CnBvcnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmls
dGVyQDAvZGZzZG0tZGFpL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9kZnNkbUA0NDAwZDAwMC9maWx0ZXJAMC9kZnNkbS1kYWkvcGhhbmRsZSA8PT0KAAAA8Ao9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL2ZpbHRlckAwL2Rmc2RtLWRhaS9u
YW1lIDw9PQpkZnNkbS1kYWkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQw
MDAvZmlsdGVyQDAvc3QsYWRjLWNoYW5uZWxzIDw9PQoAAAADCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvZGZzZG1ANDQwMGQwMDAvZmlsdGVyQDAvbmFtZSA8PT0KZmlsdGVyAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL2Rmc2RtQDQ0MDBkMDAwL3NwaS1tYXgtZnJlcXVlbmN5IDw9PQoAH0AA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvbmFtZSA8PT0KZGZzZG0A
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGZzZG1ANDQwMGQwMDAvcGluY3RybC1uYW1lcyA8
PT0KZGVmYXVsdABzbGVlcAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9jZWNANDAwMTYwMDAv
Y29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzItY2VjAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Nl
Y0A0MDAxNjAwMC9jbG9ja3MgPD09CgAAAAwAAACIAAAADAAAAB0KPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9jZWNANDAwMTYwMDAvY2xvY2stbmFtZXMgPD09CmNlYwBoZG1pLWNlYwAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9jZWNANDAwMTYwMDAvc3RhdHVzIDw9PQpva2F5AAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL2NlY0A0MDAxNjAwMC9pbnRlcnJ1cHRzIDw9PQoAAAAAAAAAXgAA
AAQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9jZWNANDAwMTYwMDAvcGhhbmRsZSA8PT0KAAAA
1wo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2NlY0A0MDAxNjAwMC9yZWcgPD09CkABYAAAAAQA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvY2VjQDQwMDE2MDAwL3BpbmN0cmwtMCA8PT0KAAAA
Lgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2NlY0A0MDAxNjAwMC9uYW1lIDw9PQpjZWMACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvY2VjQDQwMDE2MDAwL3BpbmN0cmwtbmFtZXMgPD09CmRl
ZmF1bHQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGFtcEA1YzAwYTAwMC9jb21wYXRpYmxl
IDw9PQpzdCxzdG0zMi10YW1wAHN5c2NvbgBzaW1wbGUtbWZkAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3RhbXBANWMwMGEwMDAvcmVib290LW1vZGUvbW9kZS1mYXN0Ym9vdCA8PT0KAAAAAQo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RhbXBANWMwMGEwMDAvcmVib290LW1vZGUvY29tcGF0
aWJsZSA8PT0Kc3lzY29uLXJlYm9vdC1tb2RlAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Rh
bXBANWMwMGEwMDAvcmVib290LW1vZGUvbWFzayA8PT0KAAAA/wo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3RhbXBANWMwMGEwMDAvcmVib290LW1vZGUvbW9kZS11bXNfbW1jMSA8PT0KAAAAEQo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RhbXBANWMwMGEwMDAvcmVib290LW1vZGUvb2Zmc2V0
IDw9PQoAAAFQCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGFtcEA1YzAwYTAwMC9yZWJvb3Qt
bW9kZS9tb2RlLXJlY292ZXJ5IDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGFt
cEA1YzAwYTAwMC9yZWJvb3QtbW9kZS9tb2RlLW5vcm1hbCA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3RhbXBANWMwMGEwMDAvcmVib290LW1vZGUvbW9kZS11bXNfbW1jMiA8PT0K
AAAAEgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RhbXBANWMwMGEwMDAvcmVib290LW1vZGUv
bW9kZS11bXNfbW1jMCA8PT0KAAAAEAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RhbXBANWMw
MGEwMDAvcmVib290LW1vZGUvbmFtZSA8PT0KcmVib290LW1vZGUACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvdGFtcEA1YzAwYTAwMC9yZWJvb3QtbW9kZS9tb2RlLXN0bTMyY3ViZXByb2dyYW1t
ZXIgPD09CgAAAAMKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90YW1wQDVjMDBhMDAwL3BoYW5k
bGUgPD09CgAAAJkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90YW1wQDVjMDBhMDAwL3JlZyA8
PT0KXACgAAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90YW1wQDVjMDBhMDAwL25hbWUg
PD09CnRhbXAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZ3B1QDU5MDAwMDAwL2NvbXBhdGli
bGUgPD09CnZpdmFudGUsZ2MACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZ3B1QDU5MDAwMDAw
L2Nsb2NrcyA8PT0KAAAADAAAAGUAAAAMAAAAfgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2dw
dUA1OTAwMDAwMC9yZXNldHMgPD09CgAAAAwAAAzFCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
Z3B1QDU5MDAwMDAwL2Nsb2NrLW5hbWVzIDw9PQpidXMAY29yZQAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9ncHVANTkwMDAwMDAvaW50ZXJydXB0cyA8PT0KAAAAAAAAAG0AAAAECj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvZ3B1QDU5MDAwMDAwL3BoYW5kbGUgPD09CgAAAc8KPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9ncHVANTkwMDAwMDAvcmVnIDw9PQpZAAAAAAAIAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL2dwdUA1OTAwMDAwMC9uYW1lIDw9PQpncHUACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9zb2Mvc2VyaWFsQDQwMDBlMDAwL3Bvd2VyLWRvbWFpbnMgPD09CgAAABMKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAwMGUwMDAvaW50ZXJydXB0cy1leHRlbmRlZCA8
PT0KAAAAEgAAABsAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFsQDQwMDBlMDAw
L2NvbXBhdGlibGUgPD09CnN0LHN0bTMyaDctdWFydAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9zZXJpYWxANDAwMGUwMDAvY2xvY2tzIDw9PQoAAAAMAAAAlQo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3NlcmlhbEA0MDAwZTAwMC93YWtldXAtc291cmNlIDw9PQoKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9zZXJpYWxANDAwMGUwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAwMGUwMDAvZG1hLW5hbWVzIDw9PQpyeAB0eAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAwMGUwMDAvcGhhbmRsZSA8PT0KAAAAyQo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0MDAwZTAwMC9yZWcgPD09CkAA4AAAAAQA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFsQDQwMDBlMDAwL2RtYXMgPD09CgAAAA8A
AAArAAAEAAAAABUAAAAPAAAALAAABAAAAAARCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2Vy
aWFsQDQwMDBlMDAwL25hbWUgPD09CnNlcmlhbAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9y
Y2NANTAwMDAwMDAvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzJtcDEtcmNjLXNlY3VyZQBzdCxzdG0z
Mm1wMS1yY2MAc3lzY29uAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3JjY0A1MDAwMDAwMC9j
bG9ja3MgPD09CgAAAAEAAAAAAAAAAQAAAAEAAAABAAAAAgAAAAEAAAADAAAAAQAAAAQKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9yY2NANTAwMDAwMDAvI3Jlc2V0LWNlbGxzIDw9PQoAAAABCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcmNjQDUwMDAwMDAwL2Nsb2NrLW5hbWVzIDw9PQpoc2UA
aHNpAGNzaQBsc2UAbHNpAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3JjY0A1MDAwMDAwMC8j
Y2xvY2stY2VsbHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9yY2NANTAwMDAw
MDAvcGhhbmRsZSA8PT0KAAAADAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3JjY0A1MDAwMDAw
MC9yZWcgPD09ClAAAAAAABAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvcmNjQDUwMDAwMDAw
L25hbWUgPD09CnJjYwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2Itb3RnQDQ5MDAwMDAw
L3ZidXMtc3VwcGx5IDw9PQoAAABVCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdXNiLW90Z0A0
OTAwMDAwMC9wb3dlci1kb21haW5zIDw9PQoAAAATCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
dXNiLW90Z0A0OTAwMDAwMC9pbnRlcnJ1cHRzLWV4dGVuZGVkIDw9PQoAAAASAAAALAAAAAQKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2Itb3RnQDQ5MDAwMDAwL2NvbXBhdGlibGUgPD09CnN0
LHN0bTMybXAxNS1oc290ZwBzbnBzLGR3YzIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdXNi
LW90Z0A0OTAwMDAwMC9jbG9ja3MgPD09CgAAAAwAAACmCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvdXNiLW90Z0A0OTAwMDAwMC9yZXNldHMgPD09CgAAAAwAAEzICj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvdXNiLW90Z0A0OTAwMDAwMC93YWtldXAtc291cmNlIDw9PQoKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy91c2Itb3RnQDQ5MDAwMDAwL3VzYjMzZC1zdXBwbHkgPD09CgAAAFQKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2Itb3RnQDQ5MDAwMDAwL290Zy1yZXYgPD09CgAAAgAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2Itb3RnQDQ5MDAwMDAwL2Nsb2NrLW5hbWVzIDw9
PQpvdGcACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdXNiLW90Z0A0OTAwMDAwMC9waHktbmFt
ZXMgPD09CnVzYjItcGh5AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3VzYi1vdGdANDkwMDAw
MDAvZy1yeC1maWZvLXNpemUgPD09CgAAAgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2It
b3RnQDQ5MDAwMDAwL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy91
c2Itb3RnQDQ5MDAwMDAwL3BoYW5kbGUgPD09CgAAAPkKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy91c2Itb3RnQDQ5MDAwMDAwL3BoeXMgPD09CgAAAFcAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvdXNiLW90Z0A0OTAwMDAwMC9yZWcgPD09CkkAAAAAAQAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvdXNiLW90Z0A0OTAwMDAwMC9waW5jdHJsLTAgPD09CgAAAFYKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy91c2Itb3RnQDQ5MDAwMDAwL3Jlc2V0LW5hbWVzIDw9PQpkd2MyAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3VzYi1vdGdANDkwMDAwMDAvZHJfbW9kZSA8PT0Kb3RnAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3VzYi1vdGdANDkwMDAwMDAvZy10eC1maWZvLXNpemUg
PD09CgAAAQAAAAAQAAAAEAAAABAAAAAQAAAAEAAAABAAAAAQCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2MvdXNiLW90Z0A0OTAwMDAwMC9nLW5wLXR4LWZpZm8tc2l6ZSA8PT0KAAAAIAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3VzYi1vdGdANDkwMDAwMDAvbmFtZSA8PT0KdXNiLW90ZwAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy91c2Itb3RnQDQ5MDAwMDAwL3BpbmN0cmwtbmFtZXMgPD09
CmRlZmF1bHQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFsQDQwMDE5MDAwL3Bvd2Vy
LWRvbWFpbnMgPD09CgAAABMKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAwMTkw
MDAvaW50ZXJydXB0cy1leHRlbmRlZCA8PT0KAAAAEgAAACEAAAAECj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2Mvc2VyaWFsQDQwMDE5MDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyaDctdWFydAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAwMTkwMDAvY2xvY2tzIDw9PQoAAAAM
AAAAmwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0MDAxOTAwMC93YWtldXAtc291
cmNlIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAwMTkwMDAvc3RhdHVz
IDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAwMTkwMDAv
ZG1hLW5hbWVzIDw9PQpyeAB0eAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAw
MTkwMDAvcGhhbmRsZSA8PT0KAAAA3Ao9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0
MDAxOTAwMC9yZWcgPD09CkABkAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFs
QDQwMDE5MDAwL2RtYXMgPD09CgAAAA8AAABRAAAEAAAAABUAAAAPAAAAUgAABAAAAAARCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFsQDQwMDE5MDAwL25hbWUgPD09CnNlcmlhbAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGIwMDAvY29tcGF0aWJsZSA8PT0Kc3Qsc3Rt
MzJoNy1zYWkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBiMDAwL2Nsb2NrcyA8
PT0KAAAADAAAACoAAAAMAAAAuwAAAAwAAAC8Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2Fp
QDQ0MDBiMDAwL3Jlc2V0cyA8PT0KAAAADAAATFEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9z
YWlANDQwMGIwMDAvcGluY3RybC0xIDw9PQoAAAA4AAAAOQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3NhaUA0NDAwYjAwMC9jbG9jay1uYW1lcyA8PT0KcGNsawB4OGsAeDExawAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9zYWlANDQwMGIwMDAvcmFuZ2VzIDw9PQoAAAAARACwAAAABAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGIwMDAvc3RhdHVzIDw9PQpva2F5AAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYjAwMC8jYWRkcmVzcy1jZWxscyA8PT0KAAAA
AQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYjAwMC9pbnRlcnJ1cHRzIDw9PQoA
AAAAAAAAWwAAAAQKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGIwMDAvI3NpemUt
Y2VsbHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGIwMDAvcGhh
bmRsZSA8PT0KAAAA6go9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYjAwMC9yZWcg
PD09CkQAsAAAAAAERACz8AAAABAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGIw
MDAvcGluY3RybC0wIDw9PQoAAAA2AAAANwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0
NDAwYjAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBiMDI0L2NvbXBhdGlibGUgPD09CnN0LHN0bTMy
LXNhaS1zdWItYgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGIwMDAvYXVkaW8t
Y29udHJvbGxlckA0NDAwYjAyNC9jbG9ja3MgPD09CgAAAAwAAACfAAAAIQo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvc29jL3NhaUA0NDAwYjAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBiMDI0LyNzb3Vu
ZC1kYWktY2VsbHMgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGIw
MDAvYXVkaW8tY29udHJvbGxlckA0NDAwYjAyNC9wb3J0L2VuZHBvaW50L3JlbW90ZS1lbmRwb2lu
dCA8PT0KAAAAOwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYjAwMC9hdWRpby1j
b250cm9sbGVyQDQ0MDBiMDI0L3BvcnQvZW5kcG9pbnQvcGhhbmRsZSA8PT0KAAAAIwo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYjAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBiMDI0
L3BvcnQvZW5kcG9pbnQvbWNsay1mcyA8PT0KAAABAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3NhaUA0NDAwYjAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBiMDI0L3BvcnQvZW5kcG9pbnQvZm9y
bWF0IDw9PQppMnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBiMDAwL2F1ZGlv
LWNvbnRyb2xsZXJANDQwMGIwMjQvcG9ydC9lbmRwb2ludC9uYW1lIDw9PQplbmRwb2ludAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGIwMDAvYXVkaW8tY29udHJvbGxlckA0NDAw
YjAyNC9wb3J0L3BoYW5kbGUgPD09CgAAAKkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlA
NDQwMGIwMDAvYXVkaW8tY29udHJvbGxlckA0NDAwYjAyNC9wb3J0L25hbWUgPD09CnBvcnQACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBiMDAwL2F1ZGlvLWNvbnRyb2xsZXJANDQw
MGIwMjQvY2xvY2stbmFtZXMgPD09CnNhaV9jawBNQ0xLAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3NhaUA0NDAwYjAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBiMDI0L3N0YXR1cyA8PT0Kb2th
eQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGIwMDAvYXVkaW8tY29udHJvbGxl
ckA0NDAwYjAyNC9kbWEtbmFtZXMgPD09CnJ4AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Nh
aUA0NDAwYjAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBiMDI0L3BoYW5kbGUgPD09CgAAAOsKPT0+
IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGIwMDAvYXVkaW8tY29udHJvbGxlckA0NDAw
YjAyNC9yZWcgPD09CgAAACQAAAAgCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBi
MDAwL2F1ZGlvLWNvbnRyb2xsZXJANDQwMGIwMjQvZG1hcyA8PT0KAAAADwAAAFoAAAQAAAAAAQo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYjAwMC9hdWRpby1jb250cm9sbGVyQDQ0
MDBiMDI0L25hbWUgPD09CmF1ZGlvLWNvbnRyb2xsZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2Mvc2FpQDQ0MDBiMDAwL25hbWUgPD09CnNhaQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9z
YWlANDQwMGIwMDAvcGluY3RybC1uYW1lcyA8PT0KZGVmYXVsdABzbGVlcAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9zYWlANDQwMGIwMDAvYXVkaW8tY29udHJvbGxlckA0NDAwYjAwNC9jb21w
YXRpYmxlIDw9PQpzdCxzdG0zMi1zYWktc3ViLWEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
c2FpQDQ0MDBiMDAwL2F1ZGlvLWNvbnRyb2xsZXJANDQwMGIwMDQvY2xvY2tzIDw9PQoAAAAMAAAA
nwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYjAwMC9hdWRpby1jb250cm9sbGVy
QDQ0MDBiMDA0LyNzb3VuZC1kYWktY2VsbHMgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9zYWlANDQwMGIwMDAvYXVkaW8tY29udHJvbGxlckA0NDAwYjAwNC9wb3J0L2VuZHBvaW50
L3JlbW90ZS1lbmRwb2ludCA8PT0KAAAAOgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0
NDAwYjAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBiMDA0L3BvcnQvZW5kcG9pbnQvcGhhbmRsZSA8
PT0KAAAAIgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYjAwMC9hdWRpby1jb250
cm9sbGVyQDQ0MDBiMDA0L3BvcnQvZW5kcG9pbnQvbWNsay1mcyA8PT0KAAABAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYjAwMC9hdWRpby1jb250cm9sbGVyQDQ0MDBiMDA0L3Bv
cnQvZW5kcG9pbnQvZm9ybWF0IDw9PQppMnMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2Fp
QDQ0MDBiMDAwL2F1ZGlvLWNvbnRyb2xsZXJANDQwMGIwMDQvcG9ydC9lbmRwb2ludC9uYW1lIDw9
PQplbmRwb2ludAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGIwMDAvYXVkaW8t
Y29udHJvbGxlckA0NDAwYjAwNC9wb3J0L3BoYW5kbGUgPD09CgAAAKgKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9zYWlANDQwMGIwMDAvYXVkaW8tY29udHJvbGxlckA0NDAwYjAwNC9wb3J0L25h
bWUgPD09CnBvcnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBiMDAwL2F1ZGlv
LWNvbnRyb2xsZXJANDQwMGIwMDQvY2xvY2stbmFtZXMgPD09CnNhaV9jawAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy9zYWlANDQwMGIwMDAvYXVkaW8tY29udHJvbGxlckA0NDAwYjAwNC9zdGF0
dXMgPD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2FpQDQ0MDBiMDAwL2F1ZGlv
LWNvbnRyb2xsZXJANDQwMGIwMDQvZG1hLW5hbWVzIDw9PQp0eAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9zYWlANDQwMGIwMDAvYXVkaW8tY29udHJvbGxlckA0NDAwYjAwNC8jY2xvY2stY2Vs
bHMgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zYWlANDQwMGIwMDAvYXVkaW8t
Y29udHJvbGxlckA0NDAwYjAwNC9waGFuZGxlIDw9PQoAAAAhCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2Mvc2FpQDQ0MDBiMDAwL2F1ZGlvLWNvbnRyb2xsZXJANDQwMGIwMDQvcmVnIDw9PQoAAAAE
AAAAIAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NhaUA0NDAwYjAwMC9hdWRpby1jb250cm9s
bGVyQDQ0MDBiMDA0L2RtYXMgPD09CgAAAA8AAABZAAAEAAAAAAEKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9zYWlANDQwMGIwMDAvYXVkaW8tY29udHJvbGxlckA0NDAwYjAwNC9uYW1lIDw9PQph
dWRpby1jb250cm9sbGVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2h3c3BpbmxvY2tANGMw
MDAwMDAvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzItaHdzcGlubG9jawAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9od3NwaW5sb2NrQDRjMDAwMDAwL2Nsb2NrcyA8PT0KAAAADAAAAFIKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy9od3NwaW5sb2NrQDRjMDAwMDAwLyNod2xvY2stY2VsbHMgPD09
CgAAAAIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9od3NwaW5sb2NrQDRjMDAwMDAwL2Nsb2Nr
LW5hbWVzIDw9PQpoc2VtAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2h3c3BpbmxvY2tANGMw
MDAwMDAvcGhhbmRsZSA8PT0KAAAAXgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2h3c3Bpbmxv
Y2tANGMwMDAwMDAvcmVnIDw9PQpMAAAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2h3
c3BpbmxvY2tANGMwMDAwMDAvbmFtZSA8PT0KaHdzcGlubG9jawAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9tbWNANTgwMDcwMDAvbm8tc2RpbyA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvbW1jQDU4MDA3MDAwL2NhcC1tbWMtaGlnaHNwZWVkIDw9PQoKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9tbWNANTgwMDcwMDAvc3QsbmVnLWVkZ2UgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL21tY0A1ODAwNzAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0zMi1zZG1tYzIAYXJtLHBs
MTh4AGFybSxwcmltZWNlbGwACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbW1jQDU4MDA3MDAw
L2Nsb2NrcyA8PT0KAAAADAAAAHcKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tbWNANTgwMDcw
MDAvY2FwLXNkLWhpZ2hzcGVlZCA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbW1jQDU4
MDA3MDAwL3Jlc2V0cyA8PT0KAAAADAAADNEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tbWNA
NTgwMDcwMDAvcGluY3RybC0xIDw9PQoAAAB8AAAAewo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L21tY0A1ODAwNzAwMC9jbG9jay1uYW1lcyA8PT0KYXBiX3BjbGsACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvbW1jQDU4MDA3MDAwL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9tbWNANTgwMDcwMDAvaW50ZXJydXB0cyA8PT0KAAAAAAAAAHwAAAAECj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvbW1jQDU4MDA3MDAwL2J1cy13aWR0aCA8PT0KAAAACAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL21tY0A1ODAwNzAwMC9tbWMtZGRyLTNfM3YgPD09Cgo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL21tY0A1ODAwNzAwMC9waGFuZGxlIDw9PQoAAAEMCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvbW1jQDU4MDA3MDAwL2FybSxwcmltZWNlbGwtcGVyaXBoaWQgPD09
CgAlMYAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tbWNANTgwMDcwMDAvbm8tc2QgPD09Cgo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21tY0A1ODAwNzAwMC9waW5jdHJsLTIgPD09CgAAAH0A
AAB+Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbW1jQDU4MDA3MDAwL3JlZyA8PT0KWABwAAAA
EAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9tbWNANTgwMDcwMDAvcGluY3RybC0wIDw9PQoA
AAB6AAAAewo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21tY0A1ODAwNzAwMC92bW1jLXN1cHBs
eSA8PT0KAAAAKQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21tY0A1ODAwNzAwMC9pbnRlcnJ1
cHQtbmFtZXMgPD09CmNtZF9pcnEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbW1jQDU4MDA3
MDAwL25vbi1yZW1vdmFibGUgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL21tY0A1ODAw
NzAwMC9tYXgtZnJlcXVlbmN5IDw9PQoHJw4ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbW1j
QDU4MDA3MDAwL3ZxbW1jLXN1cHBseSA8PT0KAAAAHwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L21tY0A1ODAwNzAwMC9uYW1lIDw9PQptbWMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbW1j
QDU4MDA3MDAwL3BpbmN0cmwtbmFtZXMgPD09CmRlZmF1bHQAb3BlbmRyYWluAHNsZWVwAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA0NDAwNDAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0z
Mmg3LXNwaQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zcGlANDQwMDQwMDAvY2xvY2tzIDw9
PQoAAAAMAAAAggo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA0NDAwNDAwMC9yZXNldHMg
PD09CgAAAAwAAExICj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDQ0MDA0MDAwL3BpbmN0
cmwtMSA8PT0KAAAANQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA0NDAwNDAwMC9zdGF0
dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA0NDAwNDAwMC8j
YWRkcmVzcy1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA0NDAw
NDAwMC9pbnRlcnJ1cHRzIDw9PQoAAAAAAAAAIwAAAAQKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9zcGlANDQwMDQwMDAvI3NpemUtY2VsbHMgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9zcGlANDQwMDQwMDAvZG1hLW5hbWVzIDw9PQpyeAB0eAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9zcGlANDQwMDQwMDAvcGhhbmRsZSA8PT0KAAAA4Ao9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3NwaUA0NDAwNDAwMC9yZWcgPD09CkQAQAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2Mvc3BpQDQ0MDA0MDAwL3BpbmN0cmwtMCA8PT0KAAAANAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL3NwaUA0NDAwNDAwMC9kbWFzIDw9PQoAAAAPAAAAJQAABAAAAAABAAAADwAAACYAAAQA
AAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NwaUA0NDAwNDAwMC9uYW1lIDw9PQpzcGkA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc3BpQDQ0MDA0MDAwL3BpbmN0cmwtbmFtZXMgPD09
CmRlZmF1bHQAc2xlZXAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvbmFtZSA8PT0Kc29jAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA3MDAwL3B3bS9jb21wYXRpYmxlIDw9
PQpzdCxzdG0zMi1wd20ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDcwMDAv
cHdtL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJA
NDAwMDcwMDAvcHdtLyNwd20tY2VsbHMgPD09CgAAAAMKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy90aW1lckA0MDAwNzAwMC9wd20vbmFtZSA8PT0KcHdtAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3RpbWVyQDQwMDA3MDAwL2NvbXBhdGlibGUgPD09CnN0LHN0bTMyLXRpbWVycwAKPT0+IC9w
cm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwNzAwMC9jbG9ja3MgPD09CgAAAAwAAADMCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDcwMDAvdGltZXJAMTIvY29tcGF0aWJs
ZSA8PT0Kc3Qsc3RtMzJoNy10aW1lci10cmlnZ2VyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L3RpbWVyQDQwMDA3MDAwL3RpbWVyQDEyL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDcwMDAvdGltZXJAMTIvcmVnIDw9PQoAAAAMCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDcwMDAvdGltZXJAMTIvbmFtZSA8PT0KdGlt
ZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDcwMDAvY2xvY2stbmFtZXMg
PD09CmludAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwNzAwMC9zdGF0dXMg
PD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA3MDAwLyNh
ZGRyZXNzLWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAw
MDcwMDAvI3NpemUtY2VsbHMgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1l
ckA0MDAwNzAwMC9waGFuZGxlIDw9PQoAAADBCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGlt
ZXJANDAwMDcwMDAvcmVnIDw9PQpAAHAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Rp
bWVyQDQwMDA3MDAwL25hbWUgPD09CnRpbWVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rt
YS1jb250cm9sbGVyQDQ4MDAxMDAwLyNkbWEtY2VsbHMgPD09CgAAAAQKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9kbWEtY29udHJvbGxlckA0ODAwMTAwMC9jb21wYXRpYmxlIDw9PQpzdCxzdG0z
Mi1kbWEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZG1hLWNvbnRyb2xsZXJANDgwMDEwMDAv
ZG1hLXJlcXVlc3RzIDw9PQoAAAAICj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZG1hLWNvbnRy
b2xsZXJANDgwMDEwMDAvY2xvY2tzIDw9PQoAAAAMAAAASAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL2RtYS1jb250cm9sbGVyQDQ4MDAxMDAwL3Jlc2V0cyA8PT0KAAAADAAATMEKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9kbWEtY29udHJvbGxlckA0ODAwMTAwMC9pbnRlcnJ1cHRzIDw9PQoA
AAAAAAAAOAAAAAQAAAAAAAAAOQAAAAQAAAAAAAAAOgAAAAQAAAAAAAAAOwAAAAQAAAAAAAAAPAAA
AAQAAAAAAAAARAAAAAQAAAAAAAAARQAAAAQAAAAAAAAARgAAAAQKPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9kbWEtY29udHJvbGxlckA0ODAwMTAwMC9zcmFtIDw9PQoAAABLCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvZG1hLWNvbnRyb2xsZXJANDgwMDEwMDAvZG1hLW5hbWVzIDw9PQpjaDAA
Y2gxAGNoMgBjaDMAY2g0AGNoNQBjaDYAY2g3AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rt
YS1jb250cm9sbGVyQDQ4MDAxMDAwL3BoYW5kbGUgPD09CgAAAE0KPT0+IC9wcm9jL2RldmljZS10
cmVlL3NvYy9kbWEtY29udHJvbGxlckA0ODAwMTAwMC9yZWcgPD09CkgAEAAAAAQACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvZG1hLWNvbnRyb2xsZXJANDgwMDEwMDAvZG1hcyA8PT0KAAAASgAA
AAgAAAADEgAACkgAEAgAAAAgAAAAAQAAAEoAAAAJAAAAAxIAAApIABAIAAAIAAAAAAEAAABKAAAA
CgAAAAMSAAAKSAAQCAAgAAAAAAABAAAASgAAAAsAAAADEgAACkgAEAgIAAAAAAAAAQAAAEoAAAAM
AAAAAxIAAApIABAMAAAAIAAAAAEAAABKAAAADQAAAAMSAAAKSAAQDAAACAAAAAABAAAASgAAAA4A
AAADEgAACkgAEAwAIAAAAAAAAQAAAEoAAAAPAAAAAxIAAApIABAMCAAAAAAAAAEKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9kbWEtY29udHJvbGxlckA0ODAwMTAwMC9zdCxtZW0ybWVtIDw9PQoK
PT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kbWEtY29udHJvbGxlckA0ODAwMTAwMC9uYW1lIDw9
PQpkbWEtY29udHJvbGxlcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAwMTAw
MDAvcG93ZXItZG9tYWlucyA8PT0KAAAAEwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Nlcmlh
bEA0MDAxMDAwMC9pbnRlcnJ1cHRzLWV4dGVuZGVkIDw9PQoAAAASAAAAHgAAAAQKPT0+IC9wcm9j
L2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAwMTAwMDAvY29tcGF0aWJsZSA8PT0Kc3Qsc3RtMzJo
Ny11YXJ0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0MDAxMDAwMC9jbG9ja3Mg
PD09CgAAAAwAAACXCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFsQDQwMDEwMDAwL3dh
a2V1cC1zb3VyY2UgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0MDAxMDAw
MC9waW5jdHJsLTEgPD09CgAAABsKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9zZXJpYWxANDAw
MTAwMDAvc3RhdHVzIDw9PQpva2F5AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3NlcmlhbEA0
MDAxMDAwMC9waGFuZGxlIDw9PQoAAADLCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mvc2VyaWFs
QDQwMDEwMDAwL3BpbmN0cmwtMiA8PT0KAAAAHAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3Nl
cmlhbEA0MDAxMDAwMC9yZWcgPD09CkABAAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
c2VyaWFsQDQwMDEwMDAwL3BpbmN0cmwtMCA8PT0KAAAAGgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3NlcmlhbEA0MDAxMDAwMC9uYW1lIDw9PQpzZXJpYWwACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9zb2Mvc2VyaWFsQDQwMDEwMDAwL3BpbmN0cmwtbmFtZXMgPD09CmRlZmF1bHQAc2xlZXAAaWRs
ZQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAwNDAwMC90aW1lckA1L2NvbXBh
dGlibGUgPD09CnN0LHN0bTMyaDctdGltZXItdHJpZ2dlcgAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy90aW1lckA0MDAwNDAwMC90aW1lckA1L3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3NvYy90aW1lckA0MDAwNDAwMC90aW1lckA1L3JlZyA8PT0KAAAABQo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA0MDAwL3RpbWVyQDUvbmFtZSA8PT0KdGltZXIA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvdGltZXJANDAwMDQwMDAvY29tcGF0aWJsZSA8PT0K
c3Qsc3RtMzItdGltZXJzAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVyQDQwMDA0MDAw
L2Nsb2NrcyA8PT0KAAAADAAAAMkKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1lckA0MDAw
NDAwMC9jbG9jay1uYW1lcyA8PT0KaW50AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL3RpbWVy
QDQwMDA0MDAwL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy90aW1l
ckA0MDAwNDAwMC8jYWRkcmVzcy1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c29jL3RpbWVyQDQwMDA0MDAwLyNzaXplLWNlbGxzIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9zb2MvdGltZXJANDAwMDQwMDAvcGhhbmRsZSA8PT0KAAAAvgo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvc29jL3RpbWVyQDQwMDA0MDAwL3JlZyA8PT0KQABAAAAABAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy90aW1lckA0MDAwNDAwMC9uYW1lIDw9PQp0aW1lcgAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9kaXNwbGF5LWNvbnRyb2xsZXJANWEwMDEwMDAvY29tcGF0aWJsZSA8PT0Kc3Qs
c3RtMzItbHRkYwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kaXNwbGF5LWNvbnRyb2xsZXJA
NWEwMDEwMDAvY2xvY2tzIDw9PQoAAAAMAAAApwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29jL2Rp
c3BsYXktY29udHJvbGxlckA1YTAwMTAwMC9yZXNldHMgPD09CgAAAAwAAAwACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9zb2MvZGlzcGxheS1jb250cm9sbGVyQDVhMDAxMDAwL3BvcnQvI2FkZHJlc3Mt
Y2VsbHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kaXNwbGF5LWNvbnRyb2xs
ZXJANWEwMDEwMDAvcG9ydC8jc2l6ZS1jZWxscyA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc29jL2Rpc3BsYXktY29udHJvbGxlckA1YTAwMTAwMC9wb3J0L2VuZHBvaW50QDAvcmVtb3Rl
LWVuZHBvaW50IDw9PQoAAACGCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGlzcGxheS1jb250
cm9sbGVyQDVhMDAxMDAwL3BvcnQvZW5kcG9pbnRAMC9waGFuZGxlIDw9PQoAAACTCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9zb2MvZGlzcGxheS1jb250cm9sbGVyQDVhMDAxMDAwL3BvcnQvZW5kcG9p
bnRAMC9yZWcgPD09CgAAAAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvYy9kaXNwbGF5LWNvbnRy
b2xsZXJANWEwMDEwMDAvcG9ydC9lbmRwb2ludEAwL25hbWUgPD09CmVuZHBvaW50AAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL2Rpc3BsYXktY29udHJvbGxlckA1YTAwMTAwMC9wb3J0L25hbWUg
PD09CnBvcnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGlzcGxheS1jb250cm9sbGVyQDVh
MDAxMDAwL2Nsb2NrLW5hbWVzIDw9PQpsY2QACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGlz
cGxheS1jb250cm9sbGVyQDVhMDAxMDAwL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3NvYy9kaXNwbGF5LWNvbnRyb2xsZXJANWEwMDEwMDAvaW50ZXJydXB0cyA8PT0KAAAA
AAAAAFgAAAAEAAAAAAAAAFkAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvZGlzcGxheS1j
b250cm9sbGVyQDVhMDAxMDAwL3BoYW5kbGUgPD09CgAAARAKPT0+IC9wcm9jL2RldmljZS10cmVl
L3NvYy9kaXNwbGF5LWNvbnRyb2xsZXJANWEwMDEwMDAvcmVnIDw9PQpaABAAAAAEAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvc29jL2Rpc3BsYXktY29udHJvbGxlckA1YTAwMTAwMC9uYW1lIDw9PQpk
aXNwbGF5LWNvbnRyb2xsZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2MvY3JjQDU4MDA5MDAw
L2NvbXBhdGlibGUgPD09CnN0LHN0bTMyZjctY3JjAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2NyY0A1ODAwOTAwMC9jbG9ja3MgPD09CgAAAAwAAABuCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9z
b2MvY3JjQDU4MDA5MDAwL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Nv
Yy9jcmNANTgwMDkwMDAvcGhhbmRsZSA8PT0KAAABDQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc29j
L2NyY0A1ODAwOTAwMC9yZWcgPD09ClgAkAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb2Mv
Y3JjQDU4MDA5MDAwL25hbWUgPD09CmNyYwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3BzY2kvY29t
cGF0aWJsZSA8PT0KYXJtLHBzY2ktMS4wAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcHNjaS9uYW1l
IDw9PQpwc2NpAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcHNjaS9tZXRob2QgPD09CnNtYwAKPT0+
IC9wcm9jL2RldmljZS10cmVlL2xlZC9jb21wYXRpYmxlIDw9PQpncGlvLWxlZHMACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9sZWQvbGVkLWJsdWUvZ3Bpb3MgPD09CgAAAKQAAAAJAAAAAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvbGVkL2xlZC1ibHVlL2xhYmVsIDw9PQpoZWFydGJlYXQACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9sZWQvbGVkLWJsdWUvZGVmYXVsdC1zdGF0ZSA8PT0Kb2ZmAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvbGVkL2xlZC1ibHVlL2xpbnV4LGRlZmF1bHQtdHJpZ2dlciA8PT0KaGVh
cnRiZWF0AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvbGVkL2xlZC1ibHVlL25hbWUgPD09CmxlZC1i
bHVlAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvbGVkL25hbWUgPD09CmxlZAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL2Zpcm13YXJlL3NjbWkvY29tcGF0aWJsZSA8PT0KYXJtLHNjbWktc21jAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvZmlybXdhcmUvc2NtaS9zaG1lbSA8PT0KAAAACAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvZmlybXdhcmUvc2NtaS9hcm0sc21jLWlkIDw9PQqCACAACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9maXJtd2FyZS9zY21pL3Byb3RvY29sQDE2LyNyZXNldC1jZWxscyA8PT0KAAAA
AQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvZmlybXdhcmUvc2NtaS9wcm90b2NvbEAxNi9waGFuZGxl
IDw9PQoAAABpCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9maXJtd2FyZS9zY21pL3Byb3RvY29sQDE2
L3JlZyA8PT0KAAAAFgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvZmlybXdhcmUvc2NtaS9wcm90b2Nv
bEAxNi9uYW1lIDw9PQpwcm90b2NvbAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2Zpcm13YXJlL3Nj
bWkvcHJvdG9jb2xAMTQvI2Nsb2NrLWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9maXJtd2FyZS9zY21pL3Byb3RvY29sQDE0L3BoYW5kbGUgPD09CgAAAAEKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL2Zpcm13YXJlL3NjbWkvcHJvdG9jb2xAMTQvcmVnIDw9PQoAAAAUCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9maXJtd2FyZS9zY21pL3Byb3RvY29sQDE0L25hbWUgPD09CnByb3RvY29s
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvZmlybXdhcmUvc2NtaS8jYWRkcmVzcy1jZWxscyA8PT0K
AAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvZmlybXdhcmUvc2NtaS8jc2l6ZS1jZWxscyA8PT0K
AAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvZmlybXdhcmUvc2NtaS9waGFuZGxlIDw9PQoAAAC1
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9maXJtd2FyZS9zY21pL25hbWUgPD09CnNjbWkACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9maXJtd2FyZS9uYW1lIDw9PQpmaXJtd2FyZQAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL21vZGVsIDw9PQpTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzJNUDE1N0YgZXZhbCBk
YXVnaHRlciBvbiBldmFsIG1vdGhlcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3JlZ3VsYXRvci1i
b29zdGVyL2NvbXBhdGlibGUgPD09CnN0LHN0bTMybXAxLWJvb3N0ZXIACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9yZWd1bGF0b3ItYm9vc3Rlci9zdCxzeXNjZmcgPD09CgAAAAsKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3JlZ3VsYXRvci1ib29zdGVyL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9yZWd1bGF0b3ItYm9vc3Rlci9waGFuZGxlIDw9PQoAAAC3Cj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9yZWd1bGF0b3ItYm9vc3Rlci9uYW1lIDw9PQpyZWd1bGF0b3ItYm9vc3Rl
cgAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FsaWFzZXMvZXRoZXJuZXQwIDw9PQovc29jL2V0aGVy
bmV0QDU4MDBhMDAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWxpYXNlcy9zZXJpYWwxIDw9PQov
c29jL3NlcmlhbEA0MDAwZjAwMAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FsaWFzZXMvbmFtZSA8
PT0KYWxpYXNlcwAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FsaWFzZXMvc2VyaWFsMCA8PT0KL3Nv
Yy9zZXJpYWxANDAwMTAwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9jaG9zZW4vc3Rkb3V0LXBh
dGggPD09CnNlcmlhbDA6MTE1MjAwbjgACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9jaG9zZW4vYm9v
dGFyZ3MgPD09CnJvb3Q9UEFSVFVVSUQ9ZTkxYzRlMTAtMTZlNi00YzBlLWJkMGUtNzdiZWNmNGEz
NTgyIHJvb3R3YWl0IHJ3IHZtYWxsb2M9NTEyTSBjb25zb2xlPXR0eVNUTTAsMTE1MjAwAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvY2hvc2VuL2xpbnV4LGluaXRyZC1zdGFydCA8PT0KzjmgAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvY2hvc2VuL3JhbmdlcyA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9jaG9zZW4vI2FkZHJlc3MtY2VsbHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL2No
b3Nlbi8jc2l6ZS1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvY2hvc2VuL2xp
bnV4LGluaXRyZC1lbmQgPD09Cs//9AsKPT0+IC9wcm9jL2RldmljZS10cmVlL2Nob3Nlbi9mcmFt
ZWJ1ZmZlckBmNWMwMDAwMC9jb21wYXRpYmxlIDw9PQpzaW1wbGUtZnJhbWVidWZmZXIACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9jaG9zZW4vZnJhbWVidWZmZXJAZjVjMDAwMDAvY2xvY2tzIDw9PQoA
AAAMAAAApwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvY2hvc2VuL2ZyYW1lYnVmZmVyQGY1YzAwMDAw
L3dpZHRoIDw9PQoAAALQCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9jaG9zZW4vZnJhbWVidWZmZXJA
ZjVjMDAwMDAvc3RyaWRlIDw9PQoAAAWgCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9jaG9zZW4vZnJh
bWVidWZmZXJAZjVjMDAwMDAvc3RhdHVzIDw9PQpva2F5AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
Y2hvc2VuL2ZyYW1lYnVmZmVyQGY1YzAwMDAwL3JlZyA8PT0K9cAAAAAcIAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL2Nob3Nlbi9mcmFtZWJ1ZmZlckBmNWMwMDAwMC9mb3JtYXQgPD09CnI1ZzZiNQAK
PT0+IC9wcm9jL2RldmljZS10cmVlL2Nob3Nlbi9mcmFtZWJ1ZmZlckBmNWMwMDAwMC9oZWlnaHQg
PD09CgAABQAKPT0+IC9wcm9jL2RldmljZS10cmVlL2Nob3Nlbi9mcmFtZWJ1ZmZlckBmNWMwMDAw
MC9uYW1lIDw9PQpmcmFtZWJ1ZmZlcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL2Nob3Nlbi9uYW1l
IDw9PQpjaG9zZW4ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS8jYWRkcmVzcy1jZWxscyA8PT0KAAAA
AQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc3BkaWYtb3V0L2NvbXBhdGlibGUgPD09CmxpbnV4LHNw
ZGlmLWRpdAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NwZGlmLW91dC8jc291bmQtZGFpLWNlbGxz
IDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zcGRpZi1vdXQvcG9ydC9lbmRwb2ludC9y
ZW1vdGUtZW5kcG9pbnQgPD09CgAAAKYKPT0+IC9wcm9jL2RldmljZS10cmVlL3NwZGlmLW91dC9w
b3J0L2VuZHBvaW50L3BoYW5kbGUgPD09CgAAAGIKPT0+IC9wcm9jL2RldmljZS10cmVlL3NwZGlm
LW91dC9wb3J0L2VuZHBvaW50L25hbWUgPD09CmVuZHBvaW50AAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvc3BkaWYtb3V0L3BvcnQvcGhhbmRsZSA8PT0KAAACEwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
c3BkaWYtb3V0L3BvcnQvbmFtZSA8PT0KcG9ydAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NwZGlm
LW91dC9zdGF0dXMgPD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zcGRpZi1vdXQvcGhh
bmRsZSA8PT0KAAACEgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc3BkaWYtb3V0L25hbWUgPD09CnNw
ZGlmLW91dAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3RoZXJtYWwtem9uZXMvY3B1LXRoZXJtYWwv
dGhlcm1hbC1zZW5zb3JzIDw9PQoAAAAJCj09PiAvcHJvYy9kZXZpY2UtdHJlZS90aGVybWFsLXpv
bmVzL2NwdS10aGVybWFsL3RyaXBzL2NwdS1hbGVydC9oeXN0ZXJlc2lzIDw9PQoAACcQCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS90aGVybWFsLXpvbmVzL2NwdS10aGVybWFsL3RyaXBzL2NwdS1hbGVy
dC90ZW1wZXJhdHVyZSA8PT0KAAFzGAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvdGhlcm1hbC16b25l
cy9jcHUtdGhlcm1hbC90cmlwcy9jcHUtYWxlcnQvdHlwZSA8PT0KcGFzc2l2ZQAKPT0+IC9wcm9j
L2RldmljZS10cmVlL3RoZXJtYWwtem9uZXMvY3B1LXRoZXJtYWwvdHJpcHMvY3B1LWFsZXJ0L3Bo
YW5kbGUgPD09CgAAAAoKPT0+IC9wcm9jL2RldmljZS10cmVlL3RoZXJtYWwtem9uZXMvY3B1LXRo
ZXJtYWwvdHJpcHMvY3B1LWFsZXJ0L25hbWUgPD09CmNwdS1hbGVydAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL3RoZXJtYWwtem9uZXMvY3B1LXRoZXJtYWwvdHJpcHMvY3B1LWNyaXQvaHlzdGVyZXNp
cyA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvdGhlcm1hbC16b25lcy9jcHUtdGhlcm1h
bC90cmlwcy9jcHUtY3JpdC90ZW1wZXJhdHVyZSA8PT0KAAGaKAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvdGhlcm1hbC16b25lcy9jcHUtdGhlcm1hbC90cmlwcy9jcHUtY3JpdC90eXBlIDw9PQpjcml0
aWNhbAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3RoZXJtYWwtem9uZXMvY3B1LXRoZXJtYWwvdHJp
cHMvY3B1LWNyaXQvbmFtZSA8PT0KY3B1LWNyaXQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS90aGVy
bWFsLXpvbmVzL2NwdS10aGVybWFsL3RyaXBzL25hbWUgPD09CnRyaXBzAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvdGhlcm1hbC16b25lcy9jcHUtdGhlcm1hbC9wb2xsaW5nLWRlbGF5IDw9PQoAAAAA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS90aGVybWFsLXpvbmVzL2NwdS10aGVybWFsL3BvbGxpbmct
ZGVsYXktcGFzc2l2ZSA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvdGhlcm1hbC16b25l
cy9jcHUtdGhlcm1hbC9waGFuZGxlIDw9PQoAAAC2Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS90aGVy
bWFsLXpvbmVzL2NwdS10aGVybWFsL2Nvb2xpbmctbWFwcy9tYXAwL3RyaXAgPD09CgAAAAoKPT0+
IC9wcm9jL2RldmljZS10cmVlL3RoZXJtYWwtem9uZXMvY3B1LXRoZXJtYWwvY29vbGluZy1tYXBz
L21hcDAvY29vbGluZy1kZXZpY2UgPD09CgAAAAUAAAABAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvdGhlcm1hbC16b25lcy9jcHUtdGhlcm1hbC9jb29saW5nLW1hcHMvbWFwMC9uYW1lIDw9PQpt
YXAwAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvdGhlcm1hbC16b25lcy9jcHUtdGhlcm1hbC9jb29s
aW5nLW1hcHMvbmFtZSA8PT0KY29vbGluZy1tYXBzAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvdGhl
cm1hbC16b25lcy9jcHUtdGhlcm1hbC9uYW1lIDw9PQpjcHUtdGhlcm1hbAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3RoZXJtYWwtem9uZXMvbmFtZSA8PT0KdGhlcm1hbC16b25lcwAKPT0+IC9wcm9j
L2RldmljZS10cmVlLyNzaXplLWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS92
aW4vY29tcGF0aWJsZSA8PT0KcmVndWxhdG9yLWZpeGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
dmluL3BoYW5kbGUgPD09CgAAAIwKPT0+IC9wcm9jL2RldmljZS10cmVlL3Zpbi9yZWd1bGF0b3It
bWluLW1pY3Jvdm9sdCA8PT0KAExLQAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvdmluL3JlZ3VsYXRv
ci1tYXgtbWljcm92b2x0IDw9PQoATEtACj09PiAvcHJvYy9kZXZpY2UtdHJlZS92aW4vcmVndWxh
dG9yLWFsd2F5cy1vbiA8PT0KCj09PiAvcHJvYy9kZXZpY2UtdHJlZS92aW4vcmVndWxhdG9yLW5h
bWUgPD09CnZpbgAKPT0+IC9wcm9jL2RldmljZS10cmVlL3Zpbi9uYW1lIDw9PQp2aW4ACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9jcHUwLW9wcC10YWJsZS9jb21wYXRpYmxlIDw9PQpvcGVyYXRpbmct
cG9pbnRzLXYyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvY3B1MC1vcHAtdGFibGUvcGhhbmRsZSA8
PT0KAAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvY3B1MC1vcHAtdGFibGUvb3BwLTQwMDAwMDAw
MC9vcHAtbWljcm92b2x0IDw9PQoAEk+ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9jcHUwLW9wcC10
YWJsZS9vcHAtNDAwMDAwMDAwL29wcC1oeiA8PT0KAAAAABfXhAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL2NwdTAtb3BwLXRhYmxlL29wcC00MDAwMDAwMDAvb3BwLXN1c3BlbmQgPD09Cgo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvY3B1MC1vcHAtdGFibGUvb3BwLTQwMDAwMDAwMC9vcHAtc3VwcG9ydGVk
LWh3IDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9jcHUwLW9wcC10YWJsZS9vcHAtNDAw
MDAwMDAwL25hbWUgPD09Cm9wcC00MDAwMDAwMDAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9jcHUw
LW9wcC10YWJsZS9vcHAtc2hhcmVkIDw9PQoKPT0+IC9wcm9jL2RldmljZS10cmVlL2NwdTAtb3Bw
LXRhYmxlL29wcC04MDAwMDAwMDAvb3BwLW1pY3Jvdm9sdCA8PT0KABSZcAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvY3B1MC1vcHAtdGFibGUvb3BwLTgwMDAwMDAwMC9vcHAtaHogPD09CgAAAAAvrwgA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9jcHUwLW9wcC10YWJsZS9vcHAtODAwMDAwMDAwL29wcC1z
dXBwb3J0ZWQtaHcgPD09CgAAAAIKPT0+IC9wcm9jL2RldmljZS10cmVlL2NwdTAtb3BwLXRhYmxl
L29wcC04MDAwMDAwMDAvbmFtZSA8PT0Kb3BwLTgwMDAwMDAwMAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL2NwdTAtb3BwLXRhYmxlL25hbWUgPD09CmNwdTAtb3BwLXRhYmxlAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvZG1pYy0zL2NvbXBhdGlibGUgPD09CmRtaWMtY29kZWMACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9kbWljLTMvI3NvdW5kLWRhaS1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvZG1pYy0zL3BvcnQvZW5kcG9pbnQvcmVtb3RlLWVuZHBvaW50IDw9PQoAAACzCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9kbWljLTMvcG9ydC9lbmRwb2ludC9waGFuZGxlIDw9PQoAAABJCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9kbWljLTMvcG9ydC9lbmRwb2ludC9uYW1lIDw9PQplbmRwb2lu
dAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2RtaWMtMy9wb3J0L25hbWUgPD09CnBvcnQACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9kbWljLTMvc291bmQtbmFtZS1wcmVmaXggPD09CmRtaWMzAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvZG1pYy0zL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL2RtaWMtMy9waGFuZGxlIDw9PQoAAAIaCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9kbWlj
LTMvbmFtZSA8PT0KZG1pYy0zAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvdGltZXIvY29tcGF0aWJs
ZSA8PT0KYXJtLGFybXY3LXRpbWVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvdGltZXIvaW50ZXJy
dXB0LXBhcmVudCA8PT0KAAAABwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvdGltZXIvaW50ZXJydXB0
cyA8PT0KAAAAAQAAAA0AAAMIAAAAAQAAAA4AAAMIAAAAAQAAAAsAAAMIAAAAAQAAAAoAAAMICj09
PiAvcHJvYy9kZXZpY2UtdHJlZS90aW1lci9uYW1lIDw9PQp0aW1lcgAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL2pveXN0aWNrL2NvbXBhdGlibGUgPD09CmdwaW8ta2V5cwAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL2pveXN0aWNrL2J1dHRvbi00L2ludGVycnVwdC1wYXJlbnQgPD09CgAAACYKPT0+IC9w
cm9jL2RldmljZS10cmVlL2pveXN0aWNrL2J1dHRvbi00L2ludGVycnVwdHMgPD09CgAAAAQAAAAB
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9qb3lzdGljay9idXR0b24tNC9sYWJlbCA8PT0KSm95VXAA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9qb3lzdGljay9idXR0b24tNC9saW51eCxjb2RlIDw9PQoA
AABnCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9qb3lzdGljay9idXR0b24tNC9uYW1lIDw9PQpidXR0
b24tNAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2pveXN0aWNrL2J1dHRvbi0yL2ludGVycnVwdC1w
YXJlbnQgPD09CgAAACYKPT0+IC9wcm9jL2RldmljZS10cmVlL2pveXN0aWNrL2J1dHRvbi0yL2lu
dGVycnVwdHMgPD09CgAAAAIAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9qb3lzdGljay9idXR0
b24tMi9sYWJlbCA8PT0KSm95TGVmdAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2pveXN0aWNrL2J1
dHRvbi0yL2xpbnV4LGNvZGUgPD09CgAAAGkKPT0+IC9wcm9jL2RldmljZS10cmVlL2pveXN0aWNr
L2J1dHRvbi0yL25hbWUgPD09CmJ1dHRvbi0yAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvam95c3Rp
Y2svYnV0dG9uLTAvaW50ZXJydXB0LXBhcmVudCA8PT0KAAAAJgo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvam95c3RpY2svYnV0dG9uLTAvaW50ZXJydXB0cyA8PT0KAAAAAAAAAAEKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL2pveXN0aWNrL2J1dHRvbi0wL2xhYmVsIDw9PQpKb3lTZWwACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9qb3lzdGljay9idXR0b24tMC9saW51eCxjb2RlIDw9PQoAAAAcCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9qb3lzdGljay9idXR0b24tMC9uYW1lIDw9PQpidXR0b24tMAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL2pveXN0aWNrL2J1dHRvbi0zL2ludGVycnVwdC1wYXJlbnQgPD09CgAA
ACYKPT0+IC9wcm9jL2RldmljZS10cmVlL2pveXN0aWNrL2J1dHRvbi0zL2ludGVycnVwdHMgPD09
CgAAAAMAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9qb3lzdGljay9idXR0b24tMy9sYWJlbCA8
PT0KSm95UmlnaHQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9qb3lzdGljay9idXR0b24tMy9saW51
eCxjb2RlIDw9PQoAAABqCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9qb3lzdGljay9idXR0b24tMy9u
YW1lIDw9PQpidXR0b24tMwAKPT0+IC9wcm9jL2RldmljZS10cmVlL2pveXN0aWNrL3BpbmN0cmwt
MCA8PT0KAAAApQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvam95c3RpY2svYnV0dG9uLTEvaW50ZXJy
dXB0LXBhcmVudCA8PT0KAAAAJgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvam95c3RpY2svYnV0dG9u
LTEvaW50ZXJydXB0cyA8PT0KAAAAAQAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL2pveXN0aWNr
L2J1dHRvbi0xL2xhYmVsIDw9PQpKb3lEb3duAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvam95c3Rp
Y2svYnV0dG9uLTEvbGludXgsY29kZSA8PT0KAAAAbAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvam95
c3RpY2svYnV0dG9uLTEvbmFtZSA8PT0KYnV0dG9uLTEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9q
b3lzdGljay9uYW1lIDw9PQpqb3lzdGljawAKPT0+IC9wcm9jL2RldmljZS10cmVlL2pveXN0aWNr
L3BpbmN0cmwtbmFtZXMgPD09CmRlZmF1bHQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9tZW1vcnlA
YzAwMDAwMDAvZGV2aWNlX3R5cGUgPD09Cm1lbW9yeQAKPT0+IC9wcm9jL2RldmljZS10cmVlL21l
bW9yeUBjMDAwMDAwMC9yZWcgPD09CsAAAABAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9tZW1v
cnlAYzAwMDAwMDAvbmFtZSA8PT0KbWVtb3J5AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvZG1pYy0x
L2NvbXBhdGlibGUgPD09CmRtaWMtY29kZWMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9kbWljLTEv
I3NvdW5kLWRhaS1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvZG1pYy0xL3Bv
cnQvZW5kcG9pbnQvcmVtb3RlLWVuZHBvaW50IDw9PQoAAACxCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9kbWljLTEvcG9ydC9lbmRwb2ludC9waGFuZGxlIDw9PQoAAABFCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9kbWljLTEvcG9ydC9lbmRwb2ludC9uYW1lIDw9PQplbmRwb2ludAAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL2RtaWMtMS9wb3J0L25hbWUgPD09CnBvcnQACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9kbWljLTEvc291bmQtbmFtZS1wcmVmaXggPD09CmRtaWMxAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvZG1pYy0xL3N0YXR1cyA8PT0Kb2theQAKPT0+IC9wcm9jL2RldmljZS10cmVlL2RtaWMtMS9w
aGFuZGxlIDw9PQoAAAIYCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9kbWljLTEvbmFtZSA8PT0KZG1p
Yy0xAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc291bmQvY29tcGF0aWJsZSA8PT0KYXVkaW8tZ3Jh
cGgtY2FyZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3NvdW5kL2RhaXMgPD09CgAAAKgAAACpAAAA
qgAAAKsAAACsAAAArQAAAK4AAACvCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb3VuZC9yb3V0aW5n
IDw9PQpBSUYxQ0xLAE1DTEsxAEFJRjJDTEsATUNMSzEASU4xTE4ATUlDQklBUzIARE1JQzJEQVQA
TUlDQklBUzEARE1JQzFEQVQATUlDQklBUzEACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb3VuZC9z
dGF0dXMgPD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zb3VuZC9sYWJlbCA8PT0KU1RN
MzJNUDE1LUVWAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc291bmQvcGhhbmRsZSA8PT0KAAACFgo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvc291bmQvbmFtZSA8PT0Kc291bmQACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9haGIvY29tcGF0aWJsZSA8PT0Kc3QsbWxhaGIAc2ltcGxlLWJ1cwAKPT0+IC9wcm9j
L2RldmljZS10cmVlL2FoYi9yYW5nZXMgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiLyNh
ZGRyZXNzLWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvI3NpemUtY2Vs
bHMgPD09CgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9waGFuZGxlIDw9PQoAAAHSCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvZG1hLXJhbmdlcyA8PT0KAAAAADgAAAAAAQAAEAAAABAA
AAAABgAAMAAAADAAAAAABgAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbmFtZSA8PT0KYWhi
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL2NvbXBhdGlibGUgPD09CnN0
LHN0bTMybXAxLW00AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL3Jlc2V0
cyA8PT0KAAAAaQAAAAoAAABpAAAACwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAw
MDAwL3dha2V1cC1zb3VyY2UgPD09Cgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAw
MDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDEwMDAvY29tcGF0aWJsZSA8PT0KcnBy
b2Mtc3JtLWRldgAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0
ZW1fcmVzb3VyY2VzL3RpbWVyQDQwMDAxMDAwL2Nsb2NrcyA8PT0KAAAADAAAAMYKPT0+IC9wcm9j
L2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQw
MDAxMDAwL2Nsb2NrLW5hbWVzIDw9PQppbnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRA
MTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0MDAwMTAwMC9zdGF0dXMgPD09CmRp
c2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9y
ZXNvdXJjZXMvdGltZXJANDAwMDEwMDAvcGhhbmRsZSA8PT0KAAAB1Qo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDEwMDAv
cmVnIDw9PQpAABAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200
X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDEwMDAvbmFtZSA8PT0KdGltZXIACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0
NDAwODAwMC9jb21wYXRpYmxlIDw9PQpycHJvYy1zcm0tZGV2AAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDQwMDgwMDAvY2xv
Y2tzIDw9PQoAAAAMAAAA0go9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200
X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDQwMDgwMDAvY2xvY2stbmFtZXMgPD09CmludAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3Rp
bWVyQDQ0MDA4MDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9h
aGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0NDAwODAwMC9waGFuZGxl
IDw9PQoAAAH3Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVt
X3Jlc291cmNlcy90aW1lckA0NDAwODAwMC9yZWcgPD09CkQAgAAAAAQACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0NDAwODAw
MC9uYW1lIDw9PQp0aW1lcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9t
NF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDUwMDIyMDAwL2NvbXBhdGlibGUgPD09CnJwcm9jLXNy
bS1kZXYACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jl
c291cmNlcy90aW1lckA1MDAyMjAwMC9jbG9ja3MgPD09CgAAAAwAAACRCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA1MDAyMjAw
MC9jbG9jay1uYW1lcyA8PT0KbXV4AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAw
MDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANTAwMjIwMDAvc3RhdHVzIDw9PQpkaXNhYmxl
ZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3Vy
Y2VzL3RpbWVyQDUwMDIyMDAwL3BoYW5kbGUgPD09CgAAAgsKPT0+IC9wcm9jL2RldmljZS10cmVl
L2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDUwMDIyMDAwL3JlZyA8
PT0KUAIgAAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0
ZW1fcmVzb3VyY2VzL3RpbWVyQDUwMDIyMDAwL25hbWUgPD09CnRpbWVyAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvY2FuQDQ0MDBlMDAw
L2NvbXBhdGlibGUgPD09CnJwcm9jLXNybS1kZXYACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIv
bTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9jYW5ANDQwMGUwMDAvY2xvY2tzIDw9PQoA
AAABAAAAAAAAAAwAAACdCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRf
c3lzdGVtX3Jlc291cmNlcy9jYW5ANDQwMGUwMDAvY2xvY2stbmFtZXMgPD09CmhjbGsAY2NsawAK
PT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2Vz
L2NhbkA0NDAwZTAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
YWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvY2FuQDQ0MDBlMDAwL3BoYW5kbGUg
PD09CgAAAf0KPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1f
cmVzb3VyY2VzL2NhbkA0NDAwZTAwMC9yZWcgPD09CkQA4AAAAAQARAEQAAAAKAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2NhbkA0NDAw
ZTAwMC9uYW1lIDw9PQpjYW4ACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAv
bTRfc3lzdGVtX3Jlc291cmNlcy9kbWFANDgwMDAwMDAvY29tcGF0aWJsZSA8PT0KcnByb2Mtc3Jt
LWRldgAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVz
b3VyY2VzL2RtYUA0ODAwMDAwMC9jbG9ja3MgPD09CgAAAAwAAABHCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9kbWFANDgwMDAwMDAvc3Rh
dHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9t
NF9zeXN0ZW1fcmVzb3VyY2VzL2RtYUA0ODAwMDAwMC9waGFuZGxlIDw9PQoAAAH/Cj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9kbWFANDgw
MDAwMDAvcmVnIDw9PQpIAAAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAw
MDAwL200X3N5c3RlbV9yZXNvdXJjZXMvZG1hQDQ4MDAwMDAwL25hbWUgPD09CmRtYQAKPT0+IC9w
cm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2kyY0A0
MDAxMzAwMC9jb21wYXRpYmxlIDw9PQpycHJvYy1zcm0tZGV2AAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvaTJjQDQwMDEzMDAwL2Nsb2Nr
cyA8PT0KAAAADAAAAIoKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9z
eXN0ZW1fcmVzb3VyY2VzL2kyY0A0MDAxMzAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvaTJjQDQw
MDEzMDAwL2ludGVycnVwdC1wYXJlbnQgPD09CgAAABIKPT0+IC9wcm9jL2RldmljZS10cmVlL2Fo
Yi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2kyY0A0MDAxMzAwMC9pbnRlcnJ1cHRz
IDw9PQoAAAAWAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5
c3RlbV9yZXNvdXJjZXMvaTJjQDQwMDEzMDAwL3BoYW5kbGUgPD09CgAAAegKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2kyY0A0MDAxMzAw
MC9yZWcgPD09CkABMAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAv
bTRfc3lzdGVtX3Jlc291cmNlcy9pMmNANDAwMTMwMDAvbmFtZSA8PT0KaTJjAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvY29tcGF0aWJs
ZSA8PT0KcnByb2Mtc3JtLWNvcmUACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAw
MDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zcGlANDAwMGIwMDAvY29tcGF0aWJsZSA8PT0KcnByb2Mt
c3JtLWRldgAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1f
cmVzb3VyY2VzL3NwaUA0MDAwYjAwMC9jbG9ja3MgPD09CgAAAAwAAACDCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zcGlANDAwMGIwMDAv
c3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAw
MC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NwaUA0MDAwYjAwMC9waGFuZGxlIDw9PQoAAAHeCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zcGlA
NDAwMGIwMDAvcmVnIDw9PQpAALAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEw
MDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc3BpQDQwMDBiMDAwL25hbWUgPD09CnNwaQAKPT0+
IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2F1
ZGlvLWNvbnRyb2xsZXJANDAwMGQwMDAvY29tcGF0aWJsZSA8PT0KcnByb2Mtc3JtLWRldgAKPT0+
IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2F1
ZGlvLWNvbnRyb2xsZXJANDAwMGQwMDAvY2xvY2tzIDw9PQoAAAAMAAAAgQo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvYXVkaW8tY29udHJv
bGxlckA0MDAwZDAwMC9jbG9jay1uYW1lcyA8PT0Ka2NsawAKPT0+IC9wcm9jL2RldmljZS10cmVl
L2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2F1ZGlvLWNvbnRyb2xsZXJANDAw
MGQwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAx
MDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2F1ZGlvLWNvbnRyb2xsZXJANDAwMGQwMDAvcGhh
bmRsZSA8PT0KAAAB4go9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5
c3RlbV9yZXNvdXJjZXMvYXVkaW8tY29udHJvbGxlckA0MDAwZDAwMC9yZWcgPD09CkAA0AAAAAQA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNl
cy9hdWRpby1jb250cm9sbGVyQDQwMDBkMDAwL25hbWUgPD09CmF1ZGlvLWNvbnRyb2xsZXIACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9z
ZXJpYWxANDQwMDMwMDAvY29tcGF0aWJsZSA8PT0KcnByb2Mtc3JtLWRldgAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0NDAw
MzAwMC9jbG9ja3MgPD09CgAAAAwAAACZCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAw
MDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zZXJpYWxANDQwMDMwMDAvc3RhdHVzIDw9PQpkaXNh
YmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVz
b3VyY2VzL3NlcmlhbEA0NDAwMzAwMC9pbnRlcnJ1cHQtcGFyZW50IDw9PQoAAAASCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zZXJpYWxA
NDQwMDMwMDAvaW50ZXJydXB0cyA8PT0KAAAAHQAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL2Fo
Yi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0NDAwMzAwMC9waGFuZGxl
IDw9PQoAAAHxCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVt
X3Jlc291cmNlcy9zZXJpYWxANDQwMDMwMDAvcmVnIDw9PQpEADAAAAAEAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2VyaWFsQDQ0MDAz
MDAwL25hbWUgPD09CnNlcmlhbAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAw
MC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NkbW1jQDQ4MDA0MDAwL2NvbXBhdGlibGUgPD09CnJwcm9j
LXNybS1kZXYACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVt
X3Jlc291cmNlcy9zZG1tY0A0ODAwNDAwMC9jbG9ja3MgPD09CgAAAAwAAAB4Cj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zZG1tY0A0ODAw
NDAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEw
MDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2RtbWNANDgwMDQwMDAvcGhhbmRsZSA8PT0KAAAC
Awo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJj
ZXMvc2RtbWNANDgwMDQwMDAvcmVnIDw9PQpIAEAAAAAEAEgAUAAAAAQACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zZG1tY0A0ODAwNDAw
MC9uYW1lIDw9PQpzZG1tYwAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9t
NF9zeXN0ZW1fcmVzb3VyY2VzL2RhY0A0MDAxNzAwMC9jb21wYXRpYmxlIDw9PQpycHJvYy1zcm0t
ZGV2AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNv
dXJjZXMvZGFjQDQwMDE3MDAwL2Nsb2NrcyA8PT0KAAAADAAAAB4KPT0+IC9wcm9jL2RldmljZS10
cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2RhY0A0MDAxNzAwMC9jbG9j
ay1uYW1lcyA8PT0KcGNsawAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9t
NF9zeXN0ZW1fcmVzb3VyY2VzL2RhY0A0MDAxNzAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvZGFj
QDQwMDE3MDAwL3BoYW5kbGUgPD09CgAAAewKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAx
MDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2RhY0A0MDAxNzAwMC9yZWcgPD09CkABcAAAAAQA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNl
cy9kYWNANDAwMTcwMDAvbmFtZSA8PT0KZGFjAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200
QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvcm5nQDRjMDAzMDAwL2NvbXBhdGlibGUgPD09
CnJwcm9jLXNybS1kZXYACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRf
c3lzdGVtX3Jlc291cmNlcy9ybmdANGMwMDMwMDAvY2xvY2tzIDw9PQoAAAAMAAAAfQo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvcm5nQDRj
MDAzMDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRA
MTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9ybmdANGMwMDMwMDAvcGhhbmRsZSA8PT0KAAAC
Bgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJj
ZXMvcm5nQDRjMDAzMDAwL3JlZyA8PT0KTAAwAAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2Fo
Yi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3JuZ0A0YzAwMzAwMC9uYW1lIDw9PQpy
bmcACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291
cmNlcy9jcnlwQDRjMDA1MDAwL2NvbXBhdGlibGUgPD09CnJwcm9jLXNybS1kZXYACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9jcnlwQDRj
MDA1MDAwL2Nsb2NrcyA8PT0KAAAADAAAAE4KPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAx
MDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2NyeXBANGMwMDUwMDAvc3RhdHVzIDw9PQpkaXNh
YmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVz
b3VyY2VzL2NyeXBANGMwMDUwMDAvcGhhbmRsZSA8PT0KAAACCAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvY3J5cEA0YzAwNTAwMC9yZWcg
PD09CkwAUAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lz
dGVtX3Jlc291cmNlcy9jcnlwQDRjMDA1MDAwL25hbWUgPD09CmNyeXAACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zcGlANDQwMDkwMDAv
Y29tcGF0aWJsZSA8PT0KcnByb2Mtc3JtLWRldgAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9t
NEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NwaUA0NDAwOTAwMC9jbG9ja3MgPD09CgAA
AAwAAACGCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jl
c291cmNlcy9zcGlANDQwMDkwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NwaUA0NDAwOTAwMC9w
aGFuZGxlIDw9PQoAAAH4Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRf
c3lzdGVtX3Jlc291cmNlcy9zcGlANDQwMDkwMDAvcmVnIDw9PQpEAJAAAAAEAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc3BpQDQ0MDA5
MDAwL25hbWUgPD09CnNwaQAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9t
NF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0MDAxODAwMC9jb21wYXRpYmxlIDw9PQpycHJvYy1z
cm0tZGV2AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9y
ZXNvdXJjZXMvc2VyaWFsQDQwMDE4MDAwL2Nsb2NrcyA8PT0KAAAADAAAAJoKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0MDAx
ODAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEw
MDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2VyaWFsQDQwMDE4MDAwL2ludGVycnVwdC1wYXJl
bnQgPD09CgAAABIKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0
ZW1fcmVzb3VyY2VzL3NlcmlhbEA0MDAxODAwMC9pbnRlcnJ1cHRzIDw9PQoAAAAgAAAAAQo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2Vy
aWFsQDQwMDE4MDAwL3BoYW5kbGUgPD09CgAAAe0KPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9t
NEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0MDAxODAwMC9yZWcgPD09CkAB
gAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jl
c291cmNlcy9zZXJpYWxANDAwMTgwMDAvbmFtZSA8PT0Kc2VyaWFsAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2FpQDQ0MDBhMDAwL2Nv
bXBhdGlibGUgPD09CnJwcm9jLXNybS1kZXYACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRA
MTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zYWlANDQwMGEwMDAvY2xvY2tzIDw9PQoAAAAM
AAAAngo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNv
dXJjZXMvc2FpQDQ0MDBhMDAwL2Nsb2NrLW5hbWVzIDw9PQpzYWlfY2sACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zYWlANDQwMGEwMDAv
c3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAw
MC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NhaUA0NDAwYTAwMC9waGFuZGxlIDw9PQoAAAH5Cj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zYWlA
NDQwMGEwMDAvcmVnIDw9PQpEAKAAAAAABAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEw
MDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2FpQDQ0MDBhMDAwL25hbWUgPD09CnNhaQAKPT0+
IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3Rp
bWVyQDQwMDA5MDAwL2NvbXBhdGlibGUgPD09CnJwcm9jLXNybS1kZXYACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0MDAwOTAw
MC9jbG9ja3MgPD09CgAAAAwAAACPCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAw
MDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0MDAwOTAwMC9jbG9jay1uYW1lcyA8PT0KbXV4
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJj
ZXMvdGltZXJANDAwMDkwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQwMDA5MDAwL3Bo
YW5kbGUgPD09CgAAAd0KPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9z
eXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQwMDA5MDAwL3JlZyA8PT0KQACQAAAABAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQw
MDA5MDAwL25hbWUgPD09CnRpbWVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAw
MDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDYwMDAvY29tcGF0aWJsZSA8PT0KcnBy
b2Mtc3JtLWRldgAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0
ZW1fcmVzb3VyY2VzL3RpbWVyQDQwMDA2MDAwL2Nsb2NrcyA8PT0KAAAADAAAAMsKPT0+IC9wcm9j
L2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQw
MDA2MDAwL2Nsb2NrLW5hbWVzIDw9PQppbnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRA
MTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0MDAwNjAwMC9zdGF0dXMgPD09CmRp
c2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9y
ZXNvdXJjZXMvdGltZXJANDAwMDYwMDAvcGhhbmRsZSA8PT0KAAAB2go9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDYwMDAv
cmVnIDw9PQpAAGAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200
X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDYwMDAvbmFtZSA8PT0KdGltZXIACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zYWlANTAw
MjcwMDAvY29tcGF0aWJsZSA8PT0KcnByb2Mtc3JtLWRldgAKPT0+IC9wcm9jL2RldmljZS10cmVl
L2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NhaUA1MDAyNzAwMC9jbG9ja3Mg
PD09CgAAAAwAAAChCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lz
dGVtX3Jlc291cmNlcy9zYWlANTAwMjcwMDAvY2xvY2stbmFtZXMgPD09CnNhaV9jawAKPT0+IC9w
cm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NhaUA1
MDAyNzAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200
QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2FpQDUwMDI3MDAwL3BoYW5kbGUgPD09CgAA
Ag4KPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3Vy
Y2VzL3NhaUA1MDAyNzAwMC9yZWcgPD09ClACcAAAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9h
aGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zYWlANTAwMjcwMDAvbmFtZSA8PT0K
c2FpAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNv
dXJjZXMvdGltZXJANDAwMDMwMDAvY29tcGF0aWJsZSA8PT0KcnByb2Mtc3JtLWRldgAKPT0+IC9w
cm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVy
QDQwMDAzMDAwL2Nsb2NrcyA8PT0KAAAADAAAAMgKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9t
NEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQwMDAzMDAwL2Nsb2NrLW5hbWVz
IDw9PQppbnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVt
X3Jlc291cmNlcy90aW1lckA0MDAwMzAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAw
MDMwMDAvcGhhbmRsZSA8PT0KAAAB1wo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAw
MDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDMwMDAvcmVnIDw9PQpAADAAAAAEAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMv
dGltZXJANDAwMDMwMDAvbmFtZSA8PT0KdGltZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIv
bTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9kbWEtcm91dGVyQDQ4MDAyMDAwL2NvbXBh
dGlibGUgPD09CnJwcm9jLXNybS1kZXYACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAw
MDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9kbWEtcm91dGVyQDQ4MDAyMDAwL2Nsb2NrcyA8PT0K
AAAADAAAAEkKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1f
cmVzb3VyY2VzL2RtYS1yb3V0ZXJANDgwMDIwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9w
cm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2RtYS1y
b3V0ZXJANDgwMDIwMDAvcGhhbmRsZSA8PT0KAAACAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhi
L200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvZG1hLXJvdXRlckA0ODAwMjAwMC9yZWcg
PD09CkgAIAAAAAAcCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lz
dGVtX3Jlc291cmNlcy9kbWEtcm91dGVyQDQ4MDAyMDAwL25hbWUgPD09CmRtYS1yb3V0ZXIACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90
aW1lckA0MDAwMDAwMC9jb21wYXRpYmxlIDw9PQpycHJvYy1zcm0tZGV2AAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDAw
MDAvY2xvY2tzIDw9PQoAAAAMAAAAxQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAw
MDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDAwMDAvY2xvY2stbmFtZXMgPD09Cmlu
dAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3Vy
Y2VzL3RpbWVyQDQwMDAwMDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0MDAwMDAwMC9w
aGFuZGxlIDw9PQoAAAHUCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRf
c3lzdGVtX3Jlc291cmNlcy90aW1lckA0MDAwMDAwMC9yZWcgPD09CkAAAAAAAAQACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0
MDAwMDAwMC9uYW1lIDw9PQp0aW1lcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAw
MDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDUwMDI0MDAwL2NvbXBhdGlibGUgPD09CnJw
cm9jLXNybS1kZXYACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lz
dGVtX3Jlc291cmNlcy90aW1lckA1MDAyNDAwMC9jbG9ja3MgPD09CgAAAAwAAACTCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA1
MDAyNDAwMC9jbG9jay1uYW1lcyA8PT0KbXV4AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200
QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANTAwMjQwMDAvc3RhdHVzIDw9PQpk
aXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1f
cmVzb3VyY2VzL3RpbWVyQDUwMDI0MDAwL3BoYW5kbGUgPD09CgAAAg0KPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDUwMDI0MDAw
L3JlZyA8PT0KUAJAAAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9t
NF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDUwMDI0MDAwL25hbWUgPD09CnRpbWVyAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJA
NDQwMDcwMDAvY29tcGF0aWJsZSA8PT0KcnByb2Mtc3JtLWRldgAKPT0+IC9wcm9jL2RldmljZS10
cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQ0MDA3MDAwL2Ns
b2NrcyA8PT0KAAAADAAAANEKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9t
NF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQ0MDA3MDAwL2Nsb2NrLW5hbWVzIDw9PQppbnQACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90
aW1lckA0NDAwNzAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
YWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDQwMDcwMDAvcGhhbmRs
ZSA8PT0KAAAB9go9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3Rl
bV9yZXNvdXJjZXMvdGltZXJANDQwMDcwMDAvcmVnIDw9PQpEAHAAAAAEAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDQwMDcw
MDAvbmFtZSA8PT0KdGltZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAv
bTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA1MDAyMTAwMC9jb21wYXRpYmxlIDw9PQpycHJvYy1z
cm0tZGV2AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9y
ZXNvdXJjZXMvdGltZXJANTAwMjEwMDAvY2xvY2tzIDw9PQoAAAAMAAAAkAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANTAwMjEw
MDAvY2xvY2stbmFtZXMgPD09Cm11eAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAw
MDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDUwMDIxMDAwL3N0YXR1cyA8PT0KZGlzYWJs
ZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291
cmNlcy90aW1lckA1MDAyMTAwMC9waGFuZGxlIDw9PQoAAAIKCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA1MDAyMTAwMC9yZWcg
PD09ClACEAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lz
dGVtX3Jlc291cmNlcy90aW1lckA1MDAyMTAwMC9uYW1lIDw9PQp0aW1lcgAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2kyY0A0MDAxNTAw
MC9jb21wYXRpYmxlIDw9PQpycHJvYy1zcm0tZGV2AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhi
L200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvaTJjQDQwMDE1MDAwL2Nsb2NrcyA8PT0K
AAAADAAAAI0KPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1f
cmVzb3VyY2VzL2kyY0A0MDAxNTAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvaTJjQDQwMDE1MDAw
L2ludGVycnVwdC1wYXJlbnQgPD09CgAAABIKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAx
MDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2kyY0A0MDAxNTAwMC9pbnRlcnJ1cHRzIDw9PQoA
AAAZAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9y
ZXNvdXJjZXMvaTJjQDQwMDE1MDAwL3BoYW5kbGUgPD09CgAAAeoKPT0+IC9wcm9jL2RldmljZS10
cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2kyY0A0MDAxNTAwMC9yZWcg
PD09CkABUAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lz
dGVtX3Jlc291cmNlcy9pMmNANDAwMTUwMDAvbmFtZSA8PT0KaTJjAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDQwMDEwMDAv
Y29tcGF0aWJsZSA8PT0KcnByb2Mtc3JtLWRldgAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9t
NEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQ0MDAxMDAwL2Nsb2NrcyA8PT0K
AAAADAAAAM8KPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1f
cmVzb3VyY2VzL3RpbWVyQDQ0MDAxMDAwL2Nsb2NrLW5hbWVzIDw9PQppbnQACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0NDAw
MTAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEw
MDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDQwMDEwMDAvcGhhbmRsZSA8PT0KAAAB
8Ao9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJj
ZXMvdGltZXJANDQwMDEwMDAvcmVnIDw9PQpEABAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
YWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDQwMDEwMDAvbmFtZSA8
PT0KdGltZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVt
X3Jlc291cmNlcy9kY21pQDRjMDA2MDAwL2NvbXBhdGlibGUgPD09CnJwcm9jLXNybS1kZXYACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9k
Y21pQDRjMDA2MDAwL2Nsb2NrcyA8PT0KAAAADAAAAE0KPT0+IC9wcm9jL2RldmljZS10cmVlL2Fo
Yi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2RjbWlANGMwMDYwMDAvY2xvY2stbmFt
ZXMgPD09Cm1jbGsACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lz
dGVtX3Jlc291cmNlcy9kY21pQDRjMDA2MDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9kY21pQDRj
MDA2MDAwL3BoYW5kbGUgPD09CgAAAgkKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAw
MDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2RjbWlANGMwMDYwMDAvcmVnIDw9PQpMAGAAAAAEAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMv
ZGNtaUA0YzAwNjAwMC9uYW1lIDw9PQpkY21pAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200
QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvaTJjQDQwMDEyMDAwL2NvbXBhdGlibGUgPD09
CnJwcm9jLXNybS1kZXYACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRf
c3lzdGVtX3Jlc291cmNlcy9pMmNANDAwMTIwMDAvY2xvY2tzIDw9PQoAAAAMAAAAiQo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvaTJjQDQw
MDEyMDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRA
MTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9pMmNANDAwMTIwMDAvaW50ZXJydXB0LXBhcmVu
dCA8PT0KAAAAEgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3Rl
bV9yZXNvdXJjZXMvaTJjQDQwMDEyMDAwL2ludGVycnVwdHMgPD09CgAAABUAAAABCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9pMmNANDAw
MTIwMDAvcGhhbmRsZSA8PT0KAAAB5wo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAw
MDAwL200X3N5c3RlbV9yZXNvdXJjZXMvaTJjQDQwMDEyMDAwL3JlZyA8PT0KQAEgAAAABAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2ky
Y0A0MDAxMjAwMC9uYW1lIDw9PQppMmMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAw
MDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9hdWRpby1jb250cm9sbGVyQDQwMDBjMDAwL2NvbXBh
dGlibGUgPD09CnJwcm9jLXNybS1kZXYACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAw
MDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9hdWRpby1jb250cm9sbGVyQDQwMDBjMDAwL3N0YXR1
cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRf
c3lzdGVtX3Jlc291cmNlcy9hdWRpby1jb250cm9sbGVyQDQwMDBjMDAwL3BoYW5kbGUgPD09CgAA
AeEKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3Vy
Y2VzL2F1ZGlvLWNvbnRyb2xsZXJANDAwMGMwMDAvcmVnIDw9PQpAAMAAAAAEAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvYXVkaW8tY29u
dHJvbGxlckA0MDAwYzAwMC9uYW1lIDw9PQphdWRpby1jb250cm9sbGVyAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc3RhdHVzIDw9PQpk
aXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1f
cmVzb3VyY2VzLyNhZGRyZXNzLWNlbGxzIDw9PQoAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9h
aGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zZXJpYWxANDAwMGYwMDAvY29tcGF0
aWJsZSA8PT0KcnByb2Mtc3JtLWRldgAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAw
MDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0MDAwZjAwMC9jbG9ja3MgPD09CgAAAAwA
AACWCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291
cmNlcy9zZXJpYWxANDAwMGYwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0MDAwZjAw
MC9pbnRlcnJ1cHQtcGFyZW50IDw9PQoAAAASCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRA
MTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zZXJpYWxANDAwMGYwMDAvaW50ZXJydXB0cyA8
PT0KAAAAHAAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0
ZW1fcmVzb3VyY2VzL3NlcmlhbEA0MDAwZjAwMC9waGFuZGxlIDw9PQoAAAHkCj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zZXJpYWxANDAw
MGYwMDAvcmVnIDw9PQpAAPAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAw
MDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2VyaWFsQDQwMDBmMDAwL25hbWUgPD09CnNlcmlhbAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2Vz
L3FzcGlANTgwMDMwMDAvY29tcGF0aWJsZSA8PT0KcnByb2Mtc3JtLWRldgAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3FzcGlANTgwMDMw
MDAvY2xvY2tzIDw9PQoAAAAMAAAAego9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAw
MDAwL200X3N5c3RlbV9yZXNvdXJjZXMvcXNwaUA1ODAwMzAwMC9zdGF0dXMgPD09CmRpc2FibGVk
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJj
ZXMvcXNwaUA1ODAwMzAwMC9waGFuZGxlIDw9PQoAAAIQCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9h
aGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9xc3BpQDU4MDAzMDAwL3JlZyA8PT0K
WAAwAAAAEABwAAAAEAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200
X3N5c3RlbV9yZXNvdXJjZXMvcXNwaUA1ODAwMzAwMC9uYW1lIDw9PQpxc3BpAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2FpQDQ0MDBj
MDAwL2NvbXBhdGlibGUgPD09CnJwcm9jLXNybS1kZXYACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9h
aGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zYWlANDQwMGMwMDAvY2xvY2tzIDw9
PQoAAAAMAAAAoAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3Rl
bV9yZXNvdXJjZXMvc2FpQDQ0MDBjMDAwL2Nsb2NrLW5hbWVzIDw9PQpzYWlfY2sACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zYWlANDQw
MGMwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAx
MDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NhaUA0NDAwYzAwMC9waGFuZGxlIDw9PQoAAAH7
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNl
cy9zYWlANDQwMGMwMDAvcmVnIDw9PQpEAMAAAAAABAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhi
L200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2FpQDQ0MDBjMDAwL25hbWUgPD09CnNh
aQAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3Vy
Y2VzLyNzaXplLWNlbGxzIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAw
MDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9ldGhlcm5ldEA1ODAwYTAwMC9jb21wYXRpYmxlIDw9
PQpycHJvYy1zcm0tZGV2AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200
X3N5c3RlbV9yZXNvdXJjZXMvZXRoZXJuZXRANTgwMGEwMDAvY2xvY2tzIDw9PQoAAAAMAAAAaQAA
AAwAAABnAAAADAAAAGgAAAAMAAAAcAAAAAwAAAAzCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIv
bTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9ldGhlcm5ldEA1ODAwYTAwMC9jbG9jay1u
YW1lcyA8PT0Kc3RtbWFjZXRoAG1hYy1jbGstdHgAbWFjLWNsay1yeABldGhzdHAAc3lzY2ZnLWNs
awAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3Vy
Y2VzL2V0aGVybmV0QDU4MDBhMDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9ldGhlcm5ldEA1ODAw
YTAwMC9waGFuZGxlIDw9PQoAAAIRCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAw
MDAvbTRfc3lzdGVtX3Jlc291cmNlcy9ldGhlcm5ldEA1ODAwYTAwMC9yZWcgPD09ClgAoAAAACAA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNl
cy9ldGhlcm5ldEA1ODAwYTAwMC9uYW1lIDw9PQpldGhlcm5ldAAKPT0+IC9wcm9jL2RldmljZS10
cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NwaUA0NDAwNTAwMC9jb21w
YXRpYmxlIDw9PQpycHJvYy1zcm0tZGV2AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEw
MDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc3BpQDQ0MDA1MDAwL2Nsb2NrcyA8PT0KAAAADAAA
AIUKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3Vy
Y2VzL3NwaUA0NDAwNTAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc3BpQDQ0MDA1MDAwL3BoYW5k
bGUgPD09CgAAAfQKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0
ZW1fcmVzb3VyY2VzL3NwaUA0NDAwNTAwMC9yZWcgPD09CkQAUAAAAAQACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zcGlANDQwMDUwMDAv
bmFtZSA8PT0Kc3BpAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5
c3RlbV9yZXNvdXJjZXMvYWRjQDQ4MDAzMDAwL2NvbXBhdGlibGUgPD09CnJwcm9jLXNybS1kZXYA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNl
cy9hZGNANDgwMDMwMDAvY2xvY2tzIDw9PQoAAAAMAAAASgAAAAwAAACiCj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9hZGNANDgwMDMwMDAv
Y2xvY2stbmFtZXMgPD09CmJ1cwBhZGMACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAw
MDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9hZGNANDgwMDMwMDAvc3RhdHVzIDw9PQpkaXNhYmxl
ZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3Vy
Y2VzL2FkY0A0ODAwMzAwMC9waGFuZGxlIDw9PQoAAAICCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9h
aGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9hZGNANDgwMDMwMDAvcmVnIDw9PQpI
ADAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9y
ZXNvdXJjZXMvYWRjQDQ4MDAzMDAwL25hbWUgPD09CmFkYwAKPT0+IC9wcm9jL2RldmljZS10cmVl
L2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2F1ZGlvLWNvbnRyb2xsZXJANDQw
MDQwMDAvY29tcGF0aWJsZSA8PT0KcnByb2Mtc3JtLWRldgAKPT0+IC9wcm9jL2RldmljZS10cmVl
L2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2F1ZGlvLWNvbnRyb2xsZXJANDQw
MDQwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAx
MDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2F1ZGlvLWNvbnRyb2xsZXJANDQwMDQwMDAvcGhh
bmRsZSA8PT0KAAAB8wo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5
c3RlbV9yZXNvdXJjZXMvYXVkaW8tY29udHJvbGxlckA0NDAwNDAwMC9yZWcgPD09CkQAQAAAAAQA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNl
cy9hdWRpby1jb250cm9sbGVyQDQ0MDA0MDAwL25hbWUgPD09CmF1ZGlvLWNvbnRyb2xsZXIACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90
aW1lckA0MDAwODAwMC9jb21wYXRpYmxlIDw9PQpycHJvYy1zcm0tZGV2AAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDgw
MDAvY2xvY2tzIDw9PQoAAAAMAAAAzQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAw
MDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDgwMDAvY2xvY2stbmFtZXMgPD09Cmlu
dAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3Vy
Y2VzL3RpbWVyQDQwMDA4MDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0MDAwODAwMC9w
aGFuZGxlIDw9PQoAAAHcCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRf
c3lzdGVtX3Jlc291cmNlcy90aW1lckA0MDAwODAwMC9yZWcgPD09CkAAgAAAAAQACj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0
MDAwODAwMC9uYW1lIDw9PQp0aW1lcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAw
MDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL21lbW9yeS1jb250cm9sbGVyQDU4MDAyMDAwL2NvbXBh
dGlibGUgPD09CnJwcm9jLXNybS1kZXYACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAw
MDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9tZW1vcnktY29udHJvbGxlckA1ODAwMjAwMC9jbG9j
a3MgPD09CgAAAAwAAAB5Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRf
c3lzdGVtX3Jlc291cmNlcy9tZW1vcnktY29udHJvbGxlckA1ODAwMjAwMC9zdGF0dXMgPD09CmRp
c2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9y
ZXNvdXJjZXMvbWVtb3J5LWNvbnRyb2xsZXJANTgwMDIwMDAvcGhhbmRsZSA8PT0KAAACDwo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvbWVt
b3J5LWNvbnRyb2xsZXJANTgwMDIwMDAvcmVnIDw9PQoFgAIAAAAQAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvbWVtb3J5LWNvbnRyb2xs
ZXJANTgwMDIwMDAvbmFtZSA8PT0KbWVtb3J5LWNvbnRyb2xsZXIACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zZXJpYWxANDAwMTEwMDAv
Y29tcGF0aWJsZSA8PT0KcnByb2Mtc3JtLWRldgAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9t
NEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0MDAxMTAwMC9jbG9ja3MgPD09
CgAAAAwAAACYCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVt
X3Jlc291cmNlcy9zZXJpYWxANDAwMTEwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0
MDAxMTAwMC9pbnRlcnJ1cHQtcGFyZW50IDw9PQoAAAASCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9h
aGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zZXJpYWxANDAwMTEwMDAvaW50ZXJy
dXB0cyA8PT0KAAAAHwAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9t
NF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0MDAxMTAwMC9waGFuZGxlIDw9PQoAAAHmCj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zZXJp
YWxANDAwMTEwMDAvcmVnIDw9PQpAARAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200
QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2VyaWFsQDQwMDExMDAwL25hbWUgPD09CnNl
cmlhbAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVz
b3VyY2VzL3RpbWVyQDQwMDA1MDAwL2NvbXBhdGlibGUgPD09CnJwcm9jLXNybS1kZXYACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1l
ckA0MDAwNTAwMC9jbG9ja3MgPD09CgAAAAwAAADKCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIv
bTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0MDAwNTAwMC9jbG9jay1uYW1l
cyA8PT0KaW50AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3Rl
bV9yZXNvdXJjZXMvdGltZXJANDAwMDUwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9j
L2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQw
MDA1MDAwL3BoYW5kbGUgPD09CgAAAdkKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAw
MDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQwMDA1MDAwL3JlZyA8PT0KQABQAAAABAAK
PT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2Vz
L3RpbWVyQDQwMDA1MDAwL25hbWUgPD09CnRpbWVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhi
L200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDIwMDAvY29tcGF0aWJs
ZSA8PT0KcnByb2Mtc3JtLWRldgAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAw
MC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQwMDAyMDAwL2Nsb2NrcyA8PT0KAAAADAAAAMcK
PT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2Vz
L3RpbWVyQDQwMDAyMDAwL2Nsb2NrLW5hbWVzIDw9PQppbnQACj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0MDAwMjAwMC9zdGF0
dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200
X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDIwMDAvcGhhbmRsZSA8PT0KAAAB1go9PT4gL3By
b2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJA
NDAwMDIwMDAvcmVnIDw9PQpAACAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEw
MDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDIwMDAvbmFtZSA8PT0KdGltZXIA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNl
cy90aW1lckA1MDAyMzAwMC9jb21wYXRpYmxlIDw9PQpycHJvYy1zcm0tZGV2AAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANTAw
MjMwMDAvY2xvY2tzIDw9PQoAAAAMAAAAkgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEw
MDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANTAwMjMwMDAvY2xvY2stbmFtZXMgPD09
Cm11eAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVz
b3VyY2VzL3RpbWVyQDUwMDIzMDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA1MDAyMzAw
MC9waGFuZGxlIDw9PQoAAAIMCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAv
bTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA1MDAyMzAwMC9yZWcgPD09ClACMAAAAAQACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1l
ckA1MDAyMzAwMC9uYW1lIDw9PQp0aW1lcgAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAx
MDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2NhbkA0NDAwZjAwMC9jb21wYXRpYmxlIDw9PQpy
cHJvYy1zcm0tZGV2AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5
c3RlbV9yZXNvdXJjZXMvY2FuQDQ0MDBmMDAwL2Nsb2NrcyA8PT0KAAAAAQAAAAAAAAAMAAAAnQo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMv
Y2FuQDQ0MDBmMDAwL2Nsb2NrLW5hbWVzIDw9PQpoY2xrAGNjbGsACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9jYW5ANDQwMGYwMDAvc3Rh
dHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9t
NF9zeXN0ZW1fcmVzb3VyY2VzL2NhbkA0NDAwZjAwMC9waGFuZGxlIDw9PQoAAAH+Cj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9jYW5ANDQw
MGYwMDAvcmVnIDw9PQpEAPAAAAAEAEQBEAAAACgACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIv
bTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9jYW5ANDQwMGYwMDAvbmFtZSA8PT0KY2Fu
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJj
ZXMvdGltZXJANDQwMDYwMDAvY29tcGF0aWJsZSA8PT0KcnByb2Mtc3JtLWRldgAKPT0+IC9wcm9j
L2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQ0
MDA2MDAwL2Nsb2NrcyA8PT0KAAAADAAAANAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAx
MDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQ0MDA2MDAwL2Nsb2NrLW5hbWVzIDw9
PQppbnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jl
c291cmNlcy90aW1lckA0NDAwNjAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDQwMDYw
MDAvcGhhbmRsZSA8PT0KAAAB9Qo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAw
L200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDQwMDYwMDAvcmVnIDw9PQpEAGAAAAAEAAo9PT4g
L3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGlt
ZXJANDQwMDYwMDAvbmFtZSA8PT0KdGltZXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRA
MTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9kbWFANDgwMDEwMDAvY29tcGF0aWJsZSA8PT0K
cnByb2Mtc3JtLWRldgAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9z
eXN0ZW1fcmVzb3VyY2VzL2RtYUA0ODAwMTAwMC9jbG9ja3MgPD09CgAAAAwAAABICj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9kbWFANDgw
MDEwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAx
MDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2RtYUA0ODAwMTAwMC9waGFuZGxlIDw9PQoAAAIA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNl
cy9kbWFANDgwMDEwMDAvcmVnIDw9PQpIABAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhi
L200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvZG1hQDQ4MDAxMDAwL25hbWUgPD09CmRt
YQAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3Vy
Y2VzL2kyY0A0MDAxNDAwMC9jb21wYXRpYmxlIDw9PQpycHJvYy1zcm0tZGV2AAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvaTJjQDQwMDE0
MDAwL2Nsb2NrcyA8PT0KAAAADAAAAIsKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAw
MDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2kyY0A0MDAxNDAwMC9zdGF0dXMgPD09CmRpc2FibGVk
AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJj
ZXMvaTJjQDQwMDE0MDAwL2ludGVycnVwdC1wYXJlbnQgPD09CgAAABIKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2kyY0A0MDAxNDAwMC9p
bnRlcnJ1cHRzIDw9PQoAAAAXAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAw
MDAwL200X3N5c3RlbV9yZXNvdXJjZXMvaTJjQDQwMDE0MDAwL3BoYW5kbGUgPD09CgAAAekKPT0+
IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2ky
Y0A0MDAxNDAwMC9yZWcgPD09CkABQAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRA
MTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9pMmNANDAwMTQwMDAvbmFtZSA8PT0KaTJjAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMv
c3BpQDQwMDBjMDAwL2NvbXBhdGlibGUgPD09CnJwcm9jLXNybS1kZXYACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zcGlANDAwMGMwMDAv
Y2xvY2tzIDw9PQoAAAAMAAAAhAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAw
L200X3N5c3RlbV9yZXNvdXJjZXMvc3BpQDQwMDBjMDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9z
cGlANDAwMGMwMDAvcGhhbmRsZSA8PT0KAAAB4Ao9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200
QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc3BpQDQwMDBjMDAwL3JlZyA8PT0KQADAAAAA
BAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3Vy
Y2VzL3NwaUA0MDAwYzAwMC9uYW1lIDw9PQpzcGkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIv
bTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0NDAwMDAwMC9jb21wYXRpYmxl
IDw9PQpycHJvYy1zcm0tZGV2AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAw
L200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDQwMDAwMDAvY2xvY2tzIDw9PQoAAAAMAAAAzgo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMv
dGltZXJANDQwMDAwMDAvY2xvY2stbmFtZXMgPD09CmludAAKPT0+IC9wcm9jL2RldmljZS10cmVl
L2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQ0MDAwMDAwL3N0YXR1
cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRf
c3lzdGVtX3Jlc291cmNlcy90aW1lckA0NDAwMDAwMC9waGFuZGxlIDw9PQoAAAHvCj09PiAvcHJv
Yy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0
NDAwMDAwMC9yZWcgPD09CkQAAAAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAw
MDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0NDAwMDAwMC9uYW1lIDw9PQp0aW1lcgAK
PT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2Vz
L2NyY0A0YzAwNDAwMC9jb21wYXRpYmxlIDw9PQpycHJvYy1zcm0tZGV2AAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvY3JjQDRjMDA0MDAw
L2Nsb2NrcyA8PT0KAAAADAAAAFEKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAw
MC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2NyY0A0YzAwNDAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMv
Y3JjQDRjMDA0MDAwL3BoYW5kbGUgPD09CgAAAgcKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9t
NEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2NyY0A0YzAwNDAwMC9yZWcgPD09CkwAQAAA
AAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291
cmNlcy9jcmNANGMwMDQwMDAvbmFtZSA8PT0KY3JjAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhi
L200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvYXVkaW8tY29udHJvbGxlckA0MDAwYjAw
MC9jb21wYXRpYmxlIDw9PQpycHJvYy1zcm0tZGV2AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhi
L200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvYXVkaW8tY29udHJvbGxlckA0MDAwYjAw
MC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAw
MDAwL200X3N5c3RlbV9yZXNvdXJjZXMvYXVkaW8tY29udHJvbGxlckA0MDAwYjAwMC9waGFuZGxl
IDw9PQoAAAHfCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVt
X3Jlc291cmNlcy9hdWRpby1jb250cm9sbGVyQDQwMDBiMDAwL3JlZyA8PT0KQACwAAAABAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2F1
ZGlvLWNvbnRyb2xsZXJANDAwMGIwMDAvbmFtZSA8PT0KYXVkaW8tY29udHJvbGxlcgAKPT0+IC9w
cm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2Rmc2Rt
QDQ0MDBkMDAwL2NvbXBhdGlibGUgPD09CnJwcm9jLXNybS1kZXYACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9kZnNkbUA0NDAwZDAwMC9j
bG9ja3MgPD09CgAAAAwAAACcAAAADAAAAKUKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAx
MDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2Rmc2RtQDQ0MDBkMDAwL2Nsb2NrLW5hbWVzIDw9
PQpkZnNkbQBhdWRpbwAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9z
eXN0ZW1fcmVzb3VyY2VzL2Rmc2RtQDQ0MDBkMDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9kZnNk
bUA0NDAwZDAwMC9waGFuZGxlIDw9PQoAAAH8Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRA
MTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9kZnNkbUA0NDAwZDAwMC9yZWcgPD09CkQA0AAA
AAgACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291
cmNlcy9kZnNkbUA0NDAwZDAwMC9uYW1lIDw9PQpkZnNkbQAKPT0+IC9wcm9jL2RldmljZS10cmVl
L2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2NlY0A0MDAxNjAwMC9jb21wYXRp
YmxlIDw9PQpycHJvYy1zcm0tZGV2AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAw
MDAwL200X3N5c3RlbV9yZXNvdXJjZXMvY2VjQDQwMDE2MDAwL2Nsb2NrcyA8PT0KAAAADAAAAIgA
AAAMAAAAHQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9y
ZXNvdXJjZXMvY2VjQDQwMDE2MDAwL2Nsb2NrLW5hbWVzIDw9PQpjZWMAaGRtaS1jZWMACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9jZWNA
NDAwMTYwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9t
NEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2NlY0A0MDAxNjAwMC9pbnRlcnJ1cHQtcGFy
ZW50IDw9PQoAAAASCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lz
dGVtX3Jlc291cmNlcy9jZWNANDAwMTYwMDAvaW50ZXJydXB0cyA8PT0KAAAARQAAAAEKPT0+IC9w
cm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL2NlY0A0
MDAxNjAwMC9waGFuZGxlIDw9PQoAAAHrCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAw
MDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9jZWNANDAwMTYwMDAvcmVnIDw9PQpAAWAAAAAEAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMv
Y2VjQDQwMDE2MDAwL25hbWUgPD09CmNlYwAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAx
MDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0MDAwZTAwMC9jb21wYXRpYmxlIDw9
PQpycHJvYy1zcm0tZGV2AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200
X3N5c3RlbV9yZXNvdXJjZXMvc2VyaWFsQDQwMDBlMDAwL2Nsb2NrcyA8PT0KAAAADAAAAJUKPT0+
IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3Nl
cmlhbEA0MDAwZTAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
YWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2VyaWFsQDQwMDBlMDAwL2ludGVy
cnVwdC1wYXJlbnQgPD09CgAAABIKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAw
MC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0MDAwZTAwMC9pbnRlcnJ1cHRzIDw9PQoAAAAb
AAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNv
dXJjZXMvc2VyaWFsQDQwMDBlMDAwL3BoYW5kbGUgPD09CgAAAeMKPT0+IC9wcm9jL2RldmljZS10
cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0MDAwZTAwMC9y
ZWcgPD09CkAA4AAAAAQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRf
c3lzdGVtX3Jlc291cmNlcy9zZXJpYWxANDAwMGUwMDAvbmFtZSA8PT0Kc2VyaWFsAAo9PT4gL3By
b2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdXNiLW90
Z0A0OTAwMDAwMC9jb21wYXRpYmxlIDw9PQpycHJvYy1zcm0tZGV2AAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdXNiLW90Z0A0OTAwMDAw
MC9jbG9ja3MgPD09CgAAAAwAAACmCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAw
MDAvbTRfc3lzdGVtX3Jlc291cmNlcy91c2Itb3RnQDQ5MDAwMDAwL2Nsb2NrLW5hbWVzIDw9PQpv
dGcACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291
cmNlcy91c2Itb3RnQDQ5MDAwMDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy91c2Itb3RnQDQ5MDAw
MDAwL3BoYW5kbGUgPD09CgAAAgQKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAw
MC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3VzYi1vdGdANDkwMDAwMDAvcmVnIDw9PQpJAAAAAAEAAAo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMv
dXNiLW90Z0A0OTAwMDAwMC9uYW1lIDw9PQp1c2Itb3RnAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
YWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2VyaWFsQDQwMDE5MDAwL2NvbXBh
dGlibGUgPD09CnJwcm9jLXNybS1kZXYACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAw
MDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zZXJpYWxANDAwMTkwMDAvY2xvY2tzIDw9PQoAAAAM
AAAAmwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNv
dXJjZXMvc2VyaWFsQDQwMDE5MDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zZXJpYWxANDAwMTkw
MDAvaW50ZXJydXB0LXBhcmVudCA8PT0KAAAAEgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200
QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2VyaWFsQDQwMDE5MDAwL2ludGVycnVwdHMg
PD09CgAAACEAAAABCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lz
dGVtX3Jlc291cmNlcy9zZXJpYWxANDAwMTkwMDAvcGhhbmRsZSA8PT0KAAAB7go9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2VyaWFsQDQw
MDE5MDAwL3JlZyA8PT0KQAGQAAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAw
MDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0MDAxOTAwMC9uYW1lIDw9PQpzZXJpYWwA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNl
cy9zYWlANDQwMGIwMDAvY29tcGF0aWJsZSA8PT0KcnByb2Mtc3JtLWRldgAKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NhaUA0NDAwYjAw
MC9jbG9ja3MgPD09CgAAAAwAAACfCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAw
MDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zYWlANDQwMGIwMDAvY2xvY2stbmFtZXMgPD09CnNhaV9j
awAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3Vy
Y2VzL3NhaUA0NDAwYjAwMC9zdGF0dXMgPD09CmRpc2FibGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2FpQDQ0MDBiMDAwL3BoYW5k
bGUgPD09CgAAAfoKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0
ZW1fcmVzb3VyY2VzL3NhaUA0NDAwYjAwMC9yZWcgPD09CkQAsAAAAAAECj09PiAvcHJvYy9kZXZp
Y2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zYWlANDQwMGIwMDAv
bmFtZSA8PT0Kc2FpAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5
c3RlbV9yZXNvdXJjZXMvc3BpQDQ0MDA0MDAwL2NvbXBhdGlibGUgPD09CnJwcm9jLXNybS1kZXYA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNl
cy9zcGlANDQwMDQwMDAvY2xvY2tzIDw9PQoAAAAMAAAAggo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
YWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc3BpQDQ0MDA0MDAwL3N0YXR1cyA8
PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lz
dGVtX3Jlc291cmNlcy9zcGlANDQwMDQwMDAvcGhhbmRsZSA8PT0KAAAB8go9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc3BpQDQ0MDA0MDAw
L3JlZyA8PT0KRABAAAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9t
NF9zeXN0ZW1fcmVzb3VyY2VzL3NwaUA0NDAwNDAwMC9uYW1lIDw9PQpzcGkACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9uYW1lIDw9PQpt
NF9zeXN0ZW1fcmVzb3VyY2VzAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAw
L200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDcwMDAvY29tcGF0aWJsZSA8PT0KcnByb2Mt
c3JtLWRldgAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1f
cmVzb3VyY2VzL3RpbWVyQDQwMDA3MDAwL2Nsb2NrcyA8PT0KAAAADAAAAMwKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQwMDA3
MDAwL2Nsb2NrLW5hbWVzIDw9PQppbnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAw
MDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0MDAwNzAwMC9zdGF0dXMgPD09CmRpc2Fi
bGVkAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNv
dXJjZXMvdGltZXJANDAwMDcwMDAvcGhhbmRsZSA8PT0KAAAB2wo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDcwMDAvcmVn
IDw9PQpAAHAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5
c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDcwMDAvbmFtZSA8PT0KdGltZXIACj09PiAvcHJvYy9k
ZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zZXJpYWxANDAw
MTAwMDAvY29tcGF0aWJsZSA8PT0KcnByb2Mtc3JtLWRldgAKPT0+IC9wcm9jL2RldmljZS10cmVl
L2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0MDAxMDAwMC9jbG9j
a3MgPD09CgAAAAwAAACXCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRf
c3lzdGVtX3Jlc291cmNlcy9zZXJpYWxANDAwMTAwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3Nl
cmlhbEA0MDAxMDAwMC9pbnRlcnJ1cHQtcGFyZW50IDw9PQoAAAASCj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9zZXJpYWxANDAwMTAwMDAv
aW50ZXJydXB0cyA8PT0KAAAAHgAAAAEKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAw
MDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3NlcmlhbEA0MDAxMDAwMC9waGFuZGxlIDw9PQoAAAHl
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNl
cy9zZXJpYWxANDAwMTAwMDAvcmVnIDw9PQpAAQAAAAAEAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
YWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvc2VyaWFsQDQwMDEwMDAwL25hbWUg
PD09CnNlcmlhbAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0
ZW1fcmVzb3VyY2VzL3RpbWVyQDQwMDA0MDAwL2NvbXBhdGlibGUgPD09CnJwcm9jLXNybS1kZXYA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNl
cy90aW1lckA0MDAwNDAwMC9jbG9ja3MgPD09CgAAAAwAAADJCj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy90aW1lckA0MDAwNDAwMC9jbG9j
ay1uYW1lcyA8PT0KaW50AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200
X3N5c3RlbV9yZXNvdXJjZXMvdGltZXJANDAwMDQwMDAvc3RhdHVzIDw9PQpkaXNhYmxlZAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3Rp
bWVyQDQwMDA0MDAwL3BoYW5kbGUgPD09CgAAAdgKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9t
NEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVzb3VyY2VzL3RpbWVyQDQwMDA0MDAwL3JlZyA8PT0KQABA
AAAABAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9zeXN0ZW1fcmVz
b3VyY2VzL3RpbWVyQDQwMDA0MDAwL25hbWUgPD09CnRpbWVyAAo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvaGFzaEA0YzAwMjAwMC9jb21w
YXRpYmxlIDw9PQpycHJvYy1zcm0tZGV2AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEw
MDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvaGFzaEA0YzAwMjAwMC9jbG9ja3MgPD09CgAAAAwA
AABPCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291
cmNlcy9oYXNoQDRjMDAyMDAwL3N0YXR1cyA8PT0KZGlzYWJsZWQACj09PiAvcHJvYy9kZXZpY2Ut
dHJlZS9haGIvbTRAMTAwMDAwMDAvbTRfc3lzdGVtX3Jlc291cmNlcy9oYXNoQDRjMDAyMDAwL3Bo
YW5kbGUgPD09CgAAAgUKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tNF9z
eXN0ZW1fcmVzb3VyY2VzL2hhc2hANGMwMDIwMDAvcmVnIDw9PQpMACAAAAAEAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL200X3N5c3RlbV9yZXNvdXJjZXMvaGFzaEA0YzAw
MjAwMC9uYW1lIDw9PQpoYXNoAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAw
L3N0LHN5c2NmZy1tNC1zdGF0ZSA8PT0KAAAAmQAAAUj/////Cj09PiAvcHJvYy9kZXZpY2UtdHJl
ZS9haGIvbTRAMTAwMDAwMDAvc3RhdHVzIDw9PQpva2F5AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
YWhiL200QDEwMDAwMDAwL2ludGVycnVwdC1wYXJlbnQgPD09CgAAABIKPT0+IC9wcm9jL2Rldmlj
ZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9pbnRlcnJ1cHRzIDw9PQoAAABEAAAAAQo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvYWhiL200QDEwMDAwMDAwL3N0LHN5c2NmZy1yc2MtdGJsIDw9PQoAAACZAAAB
RP////8KPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9tYm94LW5hbWVzIDw9
PQp2cTAAdnExAHNodXRkb3duAGRldGFjaAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAx
MDAwMDAwMC9tZW1vcnktcmVnaW9uIDw9PQoAAACaAAAAmwAAAJwAAACdAAAAngAAAJ8AAACgCj09
PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbWJveGVzIDw9PQoAAAChAAAAAAAA
AKEAAAABAAAAoQAAAAIAAAChAAAAAwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvYWhiL200QDEwMDAw
MDAwL3BoYW5kbGUgPD09CgAAAdMKPT0+IC9wcm9jL2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAw
MC9yZWcgPD09ChAAAAAABAAAMAAAAAAEAAA4AAAAAAEAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
YWhiL200QDEwMDAwMDAwL3N0LHN5c2NmZy1wZGRzIDw9PQoAAACYAAAAAAAAAAEKPT0+IC9wcm9j
L2RldmljZS10cmVlL2FoYi9tNEAxMDAwMDAwMC9yZXNldC1uYW1lcyA8PT0KbWN1X3JzdABob2xk
X2Jvb3QACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9haGIvbTRAMTAwMDAwMDAvbmFtZSA8PT0KbTQA
Cj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zcGRpZi1pbi9jb21wYXRpYmxlIDw9PQpsaW51eCxzcGRp
Zi1kaXIACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zcGRpZi1pbi8jc291bmQtZGFpLWNlbGxzIDw9
PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zcGRpZi1pbi9wb3J0L2VuZHBvaW50L3JlbW90
ZS1lbmRwb2ludCA8PT0KAAAApwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc3BkaWYtaW4vcG9ydC9l
bmRwb2ludC9waGFuZGxlIDw9PQoAAAAWCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zcGRpZi1pbi9w
b3J0L2VuZHBvaW50L25hbWUgPD09CmVuZHBvaW50AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvc3Bk
aWYtaW4vcG9ydC9waGFuZGxlIDw9PQoAAAIVCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zcGRpZi1p
bi9wb3J0L25hbWUgPD09CnBvcnQACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zcGRpZi1pbi9zdGF0
dXMgPD09Cm9rYXkACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zcGRpZi1pbi9waGFuZGxlIDw9PQoA
AAIUCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9zcGRpZi1pbi9uYW1lIDw9PQpzcGRpZi1pbgAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3JlZ3VsYXRvci1zZF9zd2l0Y2gvZ3Bpb3MgPD09CgAAAJUAAAAO
AAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcmVndWxhdG9yLXNkX3N3aXRjaC9jb21wYXRpYmxl
IDw9PQpyZWd1bGF0b3ItZ3BpbwAKPT0+IC9wcm9jL2RldmljZS10cmVlL3JlZ3VsYXRvci1zZF9z
d2l0Y2gvZ3Bpb3Mtc3RhdGVzIDw9PQoAAAAACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9yZWd1bGF0
b3Itc2Rfc3dpdGNoL3JlZ3VsYXRvci10eXBlIDw9PQp2b2x0YWdlAAo9PT4gL3Byb2MvZGV2aWNl
LXRyZWUvcmVndWxhdG9yLXNkX3N3aXRjaC9zdGF0ZXMgPD09CgAbd0AAAAABACxAIAAAAAAKPT0+
IC9wcm9jL2RldmljZS10cmVlL3JlZ3VsYXRvci1zZF9zd2l0Y2gvcGhhbmRsZSA8PT0KAAAAeQo9
PT4gL3Byb2MvZGV2aWNlLXRyZWUvcmVndWxhdG9yLXNkX3N3aXRjaC9yZWd1bGF0b3ItbWluLW1p
Y3Jvdm9sdCA8PT0KABt3QAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvcmVndWxhdG9yLXNkX3N3aXRj
aC9yZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA8PT0KACxAIAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
cmVndWxhdG9yLXNkX3N3aXRjaC9yZWd1bGF0b3ItYWx3YXlzLW9uIDw9PQoKPT0+IC9wcm9jL2Rl
dmljZS10cmVlL3JlZ3VsYXRvci1zZF9zd2l0Y2gvcmVndWxhdG9yLW5hbWUgPD09CnNkX3N3aXRj
aAAKPT0+IC9wcm9jL2RldmljZS10cmVlL3JlZ3VsYXRvci1zZF9zd2l0Y2gvbmFtZSA8PT0KcmVn
dWxhdG9yLXNkX3N3aXRjaAAKPT0+IC9wcm9jL2RldmljZS10cmVlL2NwdXMvY3B1QDEvY29tcGF0
aWJsZSA8PT0KYXJtLGNvcnRleC1hNwAKPT0+IC9wcm9jL2RldmljZS10cmVlL2NwdXMvY3B1QDEv
Y2xvY2tzIDw9PQoAAAABAAAABwo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvY3B1cy9jcHVAMS9kZXZp
Y2VfdHlwZSA8PT0KY3B1AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvY3B1cy9jcHVAMS9jbG9jay1u
YW1lcyA8PT0KY3B1AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvY3B1cy9jcHVAMS9jcHUtc3VwcGx5
IDw9PQoAAAAECj09PiAvcHJvYy9kZXZpY2UtdHJlZS9jcHVzL2NwdUAxL3BoYW5kbGUgPD09CgAA
AAYKPT0+IC9wcm9jL2RldmljZS10cmVlL2NwdXMvY3B1QDEvb3BlcmF0aW5nLXBvaW50cy12MiA8
PT0KAAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvY3B1cy9jcHVAMS9yZWcgPD09CgAAAAEKPT0+
IC9wcm9jL2RldmljZS10cmVlL2NwdXMvY3B1QDEvbmFtZSA8PT0KY3B1AAo9PT4gL3Byb2MvZGV2
aWNlLXRyZWUvY3B1cy8jYWRkcmVzcy1jZWxscyA8PT0KAAAAAQo9PT4gL3Byb2MvZGV2aWNlLXRy
ZWUvY3B1cy8jc2l6ZS1jZWxscyA8PT0KAAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvY3B1cy9j
cHVAMC9jb21wYXRpYmxlIDw9PQphcm0sY29ydGV4LWE3AAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUv
Y3B1cy9jcHVAMC9jbG9ja3MgPD09CgAAAAEAAAAHCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9jcHVz
L2NwdUAwL252bWVtLWNlbGxzIDw9PQoAAAADCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9jcHVzL2Nw
dUAwL2RldmljZV90eXBlIDw9PQpjcHUACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9jcHVzL2NwdUAw
L2Nsb2NrLW5hbWVzIDw9PQpjcHUACj09PiAvcHJvYy9kZXZpY2UtdHJlZS9jcHVzL2NwdUAwL2Nw
dS1zdXBwbHkgPD09CgAAAAQKPT0+IC9wcm9jL2RldmljZS10cmVlL2NwdXMvY3B1QDAvcGhhbmRs
ZSA8PT0KAAAABQo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvY3B1cy9jcHVAMC9vcGVyYXRpbmctcG9p
bnRzLXYyIDw9PQoAAAACCj09PiAvcHJvYy9kZXZpY2UtdHJlZS9jcHVzL2NwdUAwL3JlZyA8PT0K
AAAAAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvY3B1cy9jcHVAMC8jY29vbGluZy1jZWxscyA8PT0K
AAAAAgo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvY3B1cy9jcHVAMC9uYW1lIDw9PQpjcHUACj09PiAv
cHJvYy9kZXZpY2UtdHJlZS9jcHVzL2NwdUAwL252bWVtLWNlbGwtbmFtZXMgPD09CnBhcnRfbnVt
YmVyAAo9PT4gL3Byb2MvZGV2aWNlLXRyZWUvY3B1cy9uYW1lIDw9PQpjcHVzAAo9PT4gL3Byb2Mv
ZGV2aWNlLXRyZWUvbmFtZSA8PT0KAA==
--00000000000096bd3105f19abfe1--
