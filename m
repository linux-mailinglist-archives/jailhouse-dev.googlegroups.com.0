Return-Path: <jailhouse-dev+bncBCWJRXUWVQPBBGGWRSHAMGQESUCY5GI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B4747D31E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Dec 2021 14:41:45 +0100 (CET)
Received: by mail-qk1-x737.google.com with SMTP id bm33-20020a05620a19a100b0046f1b6f3526sf1711842qkb.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Dec 2021 05:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=URfAEo3YQe4Juq97f6CbhLA7WfZapnhmFxsy7z8Nc60=;
        b=Kw32rbp9fEKvPdDTMvRcRNpx6lPi2MO/sOpUOuVSRcLQyF/Y3slJmTYd0FP7y7Gqfm
         CGgdYfj2cF+y7QSQdubLxJOnyr136U4EQfIkTgBnGOKY/YbsLjT7SgiMsdT6C8BDKNtA
         HBD8jEDPdyW4SfpTw/i57okQu8AdPMhxPQyx3DLI1nkjE9Lw3jddG6S72BPB9LGNUxD5
         JELDiy8N2ymAKTxqrWr25YYqqQqmcwD41soImAtHOHAWViM9Id6Kcj3Ml3tpJRVK6Z+e
         YCS14aS4S3bSGsYJ4cca6xqAyM2uJhDoIrVWdW61BxPPJRRxiG7ZOZpHsNFoMXdgJ1sk
         8QFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=URfAEo3YQe4Juq97f6CbhLA7WfZapnhmFxsy7z8Nc60=;
        b=QjFP/3xiHEIqQindpPu5yehqFxMX+oJMDtlHN3D3CqPT9srqt4shLgJxkMSraXAEfp
         upQyxrzrtapEbIYYeBkHf52IQPe1YGQa3zk3TuRd/W9SVUteslqhMpZyA/nS047Qf4EY
         eAv7RYcApByVicVouL8X06GiqQoxOHTxiZFox4BXBe564grVYoYVG78jLeVHPDgfEFvH
         xYh7uWfNKw6h5cIYMRNSmWAW6pdBDjzQM9OAD1CypcEGL/vRYxnk3uvL4vYkXUbYp6Q6
         NDInYTrSTzJ00nKGJO8hsAW/0gLg8Rnm3FvlYbEaG4pqlvHQhE/kO4OHzr+g/o83Js4k
         nQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=URfAEo3YQe4Juq97f6CbhLA7WfZapnhmFxsy7z8Nc60=;
        b=ovcLKRXmhMQ8/i9GdLp5hNRRqJvCyNl5W3D0/I+3S2/A33TnCzZetBnxmGfotVWrD9
         SQ/K0FW54N0QzBuRqxMk8Tdv8coK8mkNAJly6sOnSY0F2uHn9S3Jb2tH6AIE3JyP6mq2
         oHepFjYleGX6spRf/iNkTtgiYNSNUyaOQzM5R3kMKa+Lazj7zMhPfEHuyr1/hm3y4KoG
         HNC5ptSQO4E4eNiAV5KmO4ZiYYVYUJZXVrhgqYmYAw4rxhZK2wwJFYtDrr00/buZ2Y9E
         EWLFgsAVfy0RBbu9RYFVE8nayvFRCoc2o0hgz+UgMPyiOvkSsTdi2z7TZ7wng38yb7qj
         1Vsw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532yAcVda9qA3uve5IcNLbhgAxav0eqDKdGanlH8FNwWc/W1w6uE
	eJ0MJgrxem1e6SA5F4yI7lM=
X-Google-Smtp-Source: ABdhPJw7Fqlj1hKE/KAirkpuTPFRR81w+5Pchgu73CM6lo7CVg7WqK9xVUbS1/nrylkaj400BWSWyw==
X-Received: by 2002:a05:6214:e49:: with SMTP id o9mr2369659qvc.71.1640180504965;
        Wed, 22 Dec 2021 05:41:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5dcc:: with SMTP id e12ls1025319qtx.11.gmail; Wed, 22
 Dec 2021 05:41:44 -0800 (PST)
X-Received: by 2002:a05:622a:1a0b:: with SMTP id f11mr2094052qtb.454.1640180504590;
        Wed, 22 Dec 2021 05:41:44 -0800 (PST)
Date: Wed, 22 Dec 2021 05:41:44 -0800 (PST)
From: jiajun huang <huangjiajun145041@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1f2bc22d-a7ef-4834-bc6a-c247ffe1aaa9n@googlegroups.com>
In-Reply-To: <667ecb2b-daa0-400f-a92c-8fbc3facf672n@googlegroups.com>
References: <db157b8a-dadc-440b-9385-1278ef5d7097n@googlegroups.com>
 <667ecb2b-daa0-400f-a92c-8fbc3facf672n@googlegroups.com>
Subject: Re: FATAL: Unhandled VM-Exit, reason 2
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_9880_53882015.1640180504147"
X-Original-Sender: huangjiajun145041@gmail.com
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

------=_Part_9880_53882015.1640180504147
Content-Type: multipart/alternative; 
	boundary="----=_Part_9881_541247545.1640180504147"

------=_Part_9881_541247545.1640180504147
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=20

Initializing Jailhouse hypervisor v0.12 (294-g6af5edf-dirty) on CPU 7

Code location: 0xfffffffff0000050

Using x2APIC

Page pool usage after early setup: mem 134/32207, remap 0/131072

Initializing processors:

 CPU 7... (APIC ID 38) OK

 CPU 4... (APIC ID 32) OK

 CPU 5... (APIC ID 34) OK

 CPU 6... (APIC ID 36) OK

 CPU 1... (APIC ID 2) OK

 CPU 0... (APIC ID 0) OK

 CPU 2... (APIC ID 4) OK

 CPU 3... (APIC ID 6) OK

Initializing unit: VT-d

DMAR unit @0xfbffe000/0x1000

DMAR unit @0xdfffc000/0x1000

Reserving 24 interrupt(s) for device 00:1f.7 at index 0

Reserving 24 interrupt(s) for device 00:05.4 at index 24

Reserving 24 interrupt(s) for device 80:05.4 at index 48

Initializing unit: IOAPIC

Initializing unit: Cache Allocation Technology

Initializing unit: PCI

Adding PCI device 00:00.0 to cell "RootCell"

Adding virtual PCI device 00:17.0 to cell "RootCell"

Adding virtual PCI device 00:18.0 to cell "RootCell"

Adding PCI device 00:01.0 to cell "RootCell"

Reserving 2 interrupt(s) for device 00:01.0 at index 72

Adding PCI device 00:01.1 to cell "RootCell"

Reserving 2 interrupt(s) for device 00:01.1 at index 74

Adding PCI device 00:03.0 to cell "RootCell"

Reserving 2 interrupt(s) for device 00:03.0 at index 76

Adding PCI device 00:03.2 to cell "RootCell"

Reserving 2 interrupt(s) for device 00:03.2 at index 78

Adding PCI device 00:05.0 to cell "RootCell"

Adding PCI device 00:05.2 to cell "RootCell"

Adding PCI device 00:05.4 to cell "RootCell"

Adding PCI device 00:11.0 to cell "RootCell"

Reserving 1 interrupt(s) for device 00:11.0 at index 80

Adding PCI device 00:1a.0 to cell "RootCell"

Adding PCI device 00:1c.0 to cell "RootCell"

Reserving 1 interrupt(s) for device 00:1c.0 at index 81

Adding PCI device 00:1c.1 to cell "RootCell"

Reserving 1 interrupt(s) for device 00:1c.1 at index 82

Adding PCI device 00:1c.3 to cell "RootCell"

Reserving 1 interrupt(s) for device 00:1c.3 at index 83

Adding PCI device 00:1d.0 to cell "RootCell"

Adding PCI device 00:1e.0 to cell "RootCell"

Adding PCI device 00:1f.0 to cell "RootCell"

Adding PCI device 00:1f.2 to cell "RootCell"

Reserving 1 interrupt(s) for device 00:1f.2 at index 84

Adding PCI device 00:1f.3 to cell "RootCell"

Adding PCI device 06:00.0 to cell "RootCell"

Reserving 5 interrupt(s) for device 06:00.0 at index 85

Adding PCI device 07:00.0 to cell "RootCell"

Reserving 5 interrupt(s) for device 07:00.0 at index 90

Adding PCI device 08:00.0 to cell "RootCell"

Reserving 1 interrupt(s) for device 08:00.0 at index 95

Adding PCI device 09:00.0 to cell "RootCell"

Adding PCI device 7f:08.0 to cell "RootCell"

Adding PCI device 7f:09.0 to cell "RootCell"

Adding PCI device 7f:0a.0 to cell "RootCell"

Adding PCI device 7f:0a.1 to cell "RootCell"

Adding PCI device 7f:0a.2 to cell "RootCell"

Adding PCI device 7f:0a.3 to cell "RootCell"

Adding PCI device 7f:0b.0 to cell "RootCell"

Adding PCI device 7f:0b.3 to cell "RootCell"

Adding PCI device 7f:0c.0 to cell "RootCell"

Adding PCI device 7f:0c.1 to cell "RootCell"

Adding PCI device 7f:0d.0 to cell "RootCell"

Adding PCI device 7f:0d.1 to cell "RootCell"

Adding PCI device 7f:0e.0 to cell "RootCell"

Adding PCI device 7f:0e.1 to cell "RootCell"

Adding PCI device 7f:0f.0 to cell "RootCell"

Adding PCI device 7f:0f.1 to cell "RootCell"

Adding PCI device 7f:0f.2 to cell "RootCell"

Adding PCI device 7f:0f.3 to cell "RootCell"

Adding PCI device 7f:0f.4 to cell "RootCell"

Adding PCI device 7f:0f.5 to cell "RootCell"

Adding PCI device 7f:10.0 to cell "RootCell"

Adding PCI device 7f:10.1 to cell "RootCell"

Adding PCI device 7f:10.2 to cell "RootCell"

Adding PCI device 7f:10.3 to cell "RootCell"

Adding PCI device 7f:10.4 to cell "RootCell"

Adding PCI device 7f:10.5 to cell "RootCell"

Adding PCI device 7f:10.6 to cell "RootCell"

Adding PCI device 7f:10.7 to cell "RootCell"

Adding PCI device 7f:13.0 to cell "RootCell"

Adding PCI device 7f:13.1 to cell "RootCell"

Adding PCI device 7f:13.4 to cell "RootCell"

Adding PCI device 7f:13.5 to cell "RootCell"

Adding PCI device 7f:16.0 to cell "RootCell"

Adding PCI device 7f:16.1 to cell "RootCell"

Adding PCI device 7f:16.2 to cell "RootCell"

Adding PCI device 80:03.0 to cell "RootCell"

Reserving 2 interrupt(s) for device 80:03.0 at index 96

Adding PCI device 80:03.2 to cell "RootCell"

Reserving 2 interrupt(s) for device 80:03.2 at index 98

Adding PCI device 80:05.0 to cell "RootCell"

Adding PCI device 80:05.2 to cell "RootCell"

Adding PCI device 80:05.4 to cell "RootCell"

Adding PCI device ff:08.0 to cell "RootCell"

Adding PCI device ff:09.0 to cell "RootCell"

Adding PCI device ff:0a.0 to cell "RootCell"

Adding PCI device ff:0a.1 to cell "RootCell"

Adding PCI device ff:0a.2 to cell "RootCell"

Adding PCI device ff:0a.3 to cell "RootCell"

Adding PCI device ff:0b.0 to cell "RootCell"

Adding PCI device ff:0b.3 to cell "RootCell"

Adding PCI device ff:0c.0 to cell "RootCell"

Adding PCI device ff:0c.1 to cell "RootCell"

Adding PCI device ff:0d.0 to cell "RootCell"

Adding PCI device ff:0d.1 to cell "RootCell"

Adding PCI device ff:0e.0 to cell "RootCell"

Adding PCI device ff:0e.1 to cell "RootCell"

Adding PCI device ff:0f.0 to cell "RootCell"

Adding PCI device ff:0f.1 to cell "RootCell"

Adding PCI device ff:0f.2 to cell "RootCell"

Adding PCI device ff:0f.3 to cell "RootCell"

Adding PCI device ff:0f.4 to cell "RootCell"

Adding PCI device ff:0f.5 to cell "RootCell"

Adding PCI device ff:10.0 to cell "RootCell"

Adding PCI device ff:10.1 to cell "RootCell"

Adding PCI device ff:10.2 to cell "RootCell"

Adding PCI device ff:10.3 to cell "RootCell"

Adding PCI device ff:10.4 to cell "RootCell"

Adding PCI device ff:10.5 to cell "RootCell"

Adding PCI device ff:10.6 to cell "RootCell"

Adding PCI device ff:10.7 to cell "RootCell"

Adding PCI device ff:13.0 to cell "RootCell"

Adding PCI device ff:13.1 to cell "RootCell"

Adding PCI device ff:13.4 to cell "RootCell"

Adding PCI device ff:13.5 to cell "RootCell"

Adding PCI device ff:16.0 to cell "RootCell"

Adding PCI device ff:16.1 to cell "RootCell"

Adding PCI device ff:16.2 to cell "RootCell"

Page pool usage after late setup: mem 469/32207, remap 65549/131072

Activating hypervisor

Adding virtual PCI device 00:17.0 to cell "nuttx"

Shared memory connection established, peer cells:

 "RootCell"

Adding virtual PCI device 00:18.0 to cell "nuttx"

Shared memory connection established, peer cells:

 "RootCell"

Created cell "nuttx"

Page pool usage after cell creation: mem 1001/32207, remap 65549/131072

Cell "nuttx" can be loaded

CPU 3 received SIPI, vector 100

Started cell "nuttx"

FATAL: Unhandled VM-Exit, reason 2

qualification 0

vectoring info: 0 interrupt info: 0

RIP: 0x0000000100939685 RSP: 0x0000000100da4d28 FLAGS: 10006

RAX: 0x00000000000326a0 RBX: 0x0000000100da4d40 RCX: 0x000000000000003e

RDX: 0x000000000010a003 RSI: 0x000000000010a000 RDI: 0x0000000000104010

CS: 8 BASE: 0x0000000000000000 AR-BYTES: 2099 EFER.LMA 1

CR0: 0x0000000080010033 CR3: 0x0000000000102000 CR4: 0x00000000000326a0

EFER: 0x0000000000000500

Parking CPU 3 (Cell: "nuttx")



=E5=9C=A82021=E5=B9=B412=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC=
+8 21:41:09<jiajun huang> =E5=86=99=E9=81=93=EF=BC=9A

> nuttx.c
>
> #include <jailhouse/types.h>
> #include <jailhouse/cell-config.h>
>
> struct {
> struct jailhouse_cell_desc cell;
> __u64 cpus[1];
> struct jailhouse_memory mem_regions[9];
> struct jailhouse_cache cache_regions[1];
> struct jailhouse_irqchip irqchips[3];
> struct jailhouse_pio pio_regions[3];
> struct jailhouse_pci_device pci_devices[2];
> struct jailhouse_pci_capability pci_caps[0];
>
> } __attribute__((packed)) config =3D {
> .cell =3D {
> .signature =3D JAILHOUSE_CELL_DESC_SIGNATURE,
> .revision =3D JAILHOUSE_CONFIG_REVISION,
> .name =3D "nuttx",
> .flags =3D JAILHOUSE_CELL_PASSIVE_COMMREG,
> .cpu_set_size =3D sizeof(config.cpus),
> .num_memory_regions =3D ARRAY_SIZE(config.mem_regions),
> .num_cache_regions =3D ARRAY_SIZE(config.cache_regions),
> .num_irqchips =3D ARRAY_SIZE(config.irqchips),
> .num_pio_regions =3D ARRAY_SIZE(config.pio_regions),
> .num_pci_devices =3D ARRAY_SIZE(config.pci_devices),
> .num_pci_caps =3D ARRAY_SIZE(config.pci_caps),
> .console =3D {
> .type =3D JAILHOUSE_CON_TYPE_8250,
> .flags =3D JAILHOUSE_CON_ACCESS_PIO,
> .address =3D 0x3f8,
> },
> },
>
> .cpus =3D {
> 0x8,
> },
>
> .mem_regions =3D {
> /* MemRegion: 57a000000-5d9ffffff : JAILHOUSE Inmate Memory */
> {
> .phys_start =3D 0x57a000000,
> .virt_start =3D 0x57a000000,
> .size =3D 0x1000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> },
> {
> .phys_start =3D 0x57a001000,
> .virt_start =3D 0,
> .size =3D 0x40000000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
> JAILHOUSE_MEM_ROOTSHARED,
> },
> {
> .phys_start =3D 0x5ba001000,
> .virt_start =3D 0x5ba001000,
> .size =3D 0x4000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> },
> {
> .phys_start =3D 0x5ba005000,
> .virt_start =3D 0x5ba005000,
> .size =3D 0x4000,
> .flags =3D JAILHOUSE_MEM_READ| JAILHOUSE_MEM_WRITE |=20
> JAILHOUSE_MEM_ROOTSHARED,
> },
> /* communication region */ {
> .virt_start =3D 0x5ba010000,
> .size =3D 0x00001000,
> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_COMM_REGION,
> },
> JAILHOUSE_SHMEM_NET_REGIONS(0x5ba205000, 1),
> },
>
> .cache_regions =3D {
> {
> .start =3D 0,
> .size =3D 2,
> .type =3D JAILHOUSE_CACHE_L3,
> },
> },
>
> .irqchips =3D {
> /* IOAPIC 0, GSI base 0 */
> {
> .address =3D 0xfec00000,
> .id =3D 0x100ff,
> .pin_bitmap =3D {
> 0x000001
> },
> },
> /* IOAPIC 2, GSI base 24 */
> {
> .address =3D 0xfec01000,
> .id =3D 0x1002c,
> .pin_bitmap =3D {
> 0x000000
> },
> },
> /* IOAPIC 3, GSI base 48 */
> {
> .address =3D 0xfec40000,
> .id =3D 0x802c,
> .pin_bitmap =3D {
> 0x000000
> },
> },
> },
>
> .pio_regions =3D {
> /* Port I/O: 0020-0021 : pic1 */
> PIO_RANGE(0x20, 0x2),
> /* Port I/O: 00a0-00a1 : pic2 */
> PIO_RANGE(0xa0, 0x2),
> /* Port I/O: 03f8-03ff : serial */
> PIO_RANGE(0x3f8, 0x8),
> },
> .pci_devices =3D {
> {=20
> .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
> .iommu =3D 1,
> .domain =3D 0x0,
> .bdf =3D 0x17 << 3,
> .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> .num_msix_vectors =3D 16,
> .shmem_regions_start =3D 0,
> .shmem_dev_id =3D 1,
> .shmem_peers =3D 2,
> .shmem_protocol =3D 0x0002,
> },
> {=20
> .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,
> .iommu =3D 1,
> .domain =3D 0x0,
> .bdf =3D 0x18 << 3,
> .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
> .num_msix_vectors =3D 2,
> .shmem_regions_start =3D 5,
> .shmem_dev_id =3D 1,
> .shmem_peers =3D 2,
> .shmem_protocol =3D JAILHOUSE_SHMEM_PROTO_VETH,
> },
> },
>
> .pci_caps =3D {
> },
> };
>
> =E5=9C=A82021=E5=B9=B412=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 U=
TC+8 21:39:52<jiajun huang> =E5=86=99=E9=81=93=EF=BC=9A
>
>> Dear Jailhouse community=EF=BC=8C
>> This bug occurred when I tried to start nuttx on a none-root cell on the=
=20
>> server. I added two ivshmem devices for nuttx. Below is my configuration=
=20
>> file. I am not sure if there is a problem with the mmio area in the=20
>> configuration file. What is the communication area? In addition, if=20
>> jailhouse runs in QEMU, can two virtual machines communicate with each=
=20
>> other through ivshmem-net?
>>
>> Below is my root-cell , nuttx configuration and log output from the port=
.
>>
>> Best regards,
>>
>> Jiajun Huang
>>
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1f2bc22d-a7ef-4834-bc6a-c247ffe1aaa9n%40googlegroups.com.

------=_Part_9881_541247545.1640180504147
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable







<p>Initializing Jailhouse hypervisor v0.12 (294-g6af5edf-dirty) on CPU 7</p=
>
<p>Code location: 0xfffffffff0000050</p>
<p>Using x2APIC</p>
<p>Page pool usage after early setup: mem 134/32207, remap 0/131072</p>
<p>Initializing processors:</p>
<p>&nbsp;CPU 7... (APIC ID 38) OK</p>
<p>&nbsp;CPU 4... (APIC ID 32) OK</p>
<p>&nbsp;CPU 5... (APIC ID 34) OK</p>
<p>&nbsp;CPU 6... (APIC ID 36) OK</p>
<p>&nbsp;CPU 1... (APIC ID 2) OK</p>
<p>&nbsp;CPU 0... (APIC ID 0) OK</p>
<p>&nbsp;CPU 2... (APIC ID 4) OK</p>
<p>&nbsp;CPU 3... (APIC ID 6) OK</p>
<p>Initializing unit: VT-d</p>
<p>DMAR unit @0xfbffe000/0x1000</p>
<p>DMAR unit @0xdfffc000/0x1000</p>
<p>Reserving 24 interrupt(s) for device 00:1f.7 at index 0</p>
<p>Reserving 24 interrupt(s) for device 00:05.4 at index 24</p>
<p>Reserving 24 interrupt(s) for device 80:05.4 at index 48</p>
<p>Initializing unit: IOAPIC</p>
<p>Initializing unit: Cache Allocation Technology</p>
<p>Initializing unit: PCI</p>
<p>Adding PCI device 00:00.0 to cell "RootCell"</p>
<p>Adding virtual PCI device 00:17.0 to cell "RootCell"</p>
<p>Adding virtual PCI device 00:18.0 to cell "RootCell"</p>
<p>Adding PCI device 00:01.0 to cell "RootCell"</p>
<p>Reserving 2 interrupt(s) for device 00:01.0 at index 72</p>
<p>Adding PCI device 00:01.1 to cell "RootCell"</p>
<p>Reserving 2 interrupt(s) for device 00:01.1 at index 74</p>
<p>Adding PCI device 00:03.0 to cell "RootCell"</p>
<p>Reserving 2 interrupt(s) for device 00:03.0 at index 76</p>
<p>Adding PCI device 00:03.2 to cell "RootCell"</p>
<p>Reserving 2 interrupt(s) for device 00:03.2 at index 78</p>
<p>Adding PCI device 00:05.0 to cell "RootCell"</p>
<p>Adding PCI device 00:05.2 to cell "RootCell"</p>
<p>Adding PCI device 00:05.4 to cell "RootCell"</p>
<p>Adding PCI device 00:11.0 to cell "RootCell"</p>
<p>Reserving 1 interrupt(s) for device 00:11.0 at index 80</p>
<p>Adding PCI device 00:1a.0 to cell "RootCell"</p>
<p>Adding PCI device 00:1c.0 to cell "RootCell"</p>
<p>Reserving 1 interrupt(s) for device 00:1c.0 at index 81</p>
<p>Adding PCI device 00:1c.1 to cell "RootCell"</p>
<p>Reserving 1 interrupt(s) for device 00:1c.1 at index 82</p>
<p>Adding PCI device 00:1c.3 to cell "RootCell"</p>
<p>Reserving 1 interrupt(s) for device 00:1c.3 at index 83</p>
<p>Adding PCI device 00:1d.0 to cell "RootCell"</p>
<p>Adding PCI device 00:1e.0 to cell "RootCell"</p>
<p>Adding PCI device 00:1f.0 to cell "RootCell"</p>
<p>Adding PCI device 00:1f.2 to cell "RootCell"</p>
<p>Reserving 1 interrupt(s) for device 00:1f.2 at index 84</p>
<p>Adding PCI device 00:1f.3 to cell "RootCell"</p>
<p>Adding PCI device 06:00.0 to cell "RootCell"</p>
<p>Reserving 5 interrupt(s) for device 06:00.0 at index 85</p>
<p>Adding PCI device 07:00.0 to cell "RootCell"</p>
<p>Reserving 5 interrupt(s) for device 07:00.0 at index 90</p>
<p>Adding PCI device 08:00.0 to cell "RootCell"</p>
<p>Reserving 1 interrupt(s) for device 08:00.0 at index 95</p>
<p>Adding PCI device 09:00.0 to cell "RootCell"</p>
<p>Adding PCI device 7f:08.0 to cell "RootCell"</p>
<p>Adding PCI device 7f:09.0 to cell "RootCell"</p>
<p>Adding PCI device 7f:0a.0 to cell "RootCell"</p>
<p>Adding PCI device 7f:0a.1 to cell "RootCell"</p>
<p>Adding PCI device 7f:0a.2 to cell "RootCell"</p>
<p>Adding PCI device 7f:0a.3 to cell "RootCell"</p>
<p>Adding PCI device 7f:0b.0 to cell "RootCell"</p>
<p>Adding PCI device 7f:0b.3 to cell "RootCell"</p>
<p>Adding PCI device 7f:0c.0 to cell "RootCell"</p>
<p>Adding PCI device 7f:0c.1 to cell "RootCell"</p>
<p>Adding PCI device 7f:0d.0 to cell "RootCell"</p>
<p>Adding PCI device 7f:0d.1 to cell "RootCell"</p>
<p>Adding PCI device 7f:0e.0 to cell "RootCell"</p>
<p>Adding PCI device 7f:0e.1 to cell "RootCell"</p>
<p>Adding PCI device 7f:0f.0 to cell "RootCell"</p>
<p>Adding PCI device 7f:0f.1 to cell "RootCell"</p>
<p>Adding PCI device 7f:0f.2 to cell "RootCell"</p>
<p>Adding PCI device 7f:0f.3 to cell "RootCell"</p>
<p>Adding PCI device 7f:0f.4 to cell "RootCell"</p>
<p>Adding PCI device 7f:0f.5 to cell "RootCell"</p>
<p>Adding PCI device 7f:10.0 to cell "RootCell"</p>
<p>Adding PCI device 7f:10.1 to cell "RootCell"</p>
<p>Adding PCI device 7f:10.2 to cell "RootCell"</p>
<p>Adding PCI device 7f:10.3 to cell "RootCell"</p>
<p>Adding PCI device 7f:10.4 to cell "RootCell"</p>
<p>Adding PCI device 7f:10.5 to cell "RootCell"</p>
<p>Adding PCI device 7f:10.6 to cell "RootCell"</p>
<p>Adding PCI device 7f:10.7 to cell "RootCell"</p>
<p>Adding PCI device 7f:13.0 to cell "RootCell"</p>
<p>Adding PCI device 7f:13.1 to cell "RootCell"</p>
<p>Adding PCI device 7f:13.4 to cell "RootCell"</p>
<p>Adding PCI device 7f:13.5 to cell "RootCell"</p>
<p>Adding PCI device 7f:16.0 to cell "RootCell"</p>
<p>Adding PCI device 7f:16.1 to cell "RootCell"</p>
<p>Adding PCI device 7f:16.2 to cell "RootCell"</p>
<p>Adding PCI device 80:03.0 to cell "RootCell"</p>
<p>Reserving 2 interrupt(s) for device 80:03.0 at index 96</p>
<p>Adding PCI device 80:03.2 to cell "RootCell"</p>
<p>Reserving 2 interrupt(s) for device 80:03.2 at index 98</p>
<p>Adding PCI device 80:05.0 to cell "RootCell"</p>
<p>Adding PCI device 80:05.2 to cell "RootCell"</p>
<p>Adding PCI device 80:05.4 to cell "RootCell"</p>
<p>Adding PCI device ff:08.0 to cell "RootCell"</p>
<p>Adding PCI device ff:09.0 to cell "RootCell"</p>
<p>Adding PCI device ff:0a.0 to cell "RootCell"</p>
<p>Adding PCI device ff:0a.1 to cell "RootCell"</p>
<p>Adding PCI device ff:0a.2 to cell "RootCell"</p>
<p>Adding PCI device ff:0a.3 to cell "RootCell"</p>
<p>Adding PCI device ff:0b.0 to cell "RootCell"</p>
<p>Adding PCI device ff:0b.3 to cell "RootCell"</p>
<p>Adding PCI device ff:0c.0 to cell "RootCell"</p>
<p>Adding PCI device ff:0c.1 to cell "RootCell"</p>
<p>Adding PCI device ff:0d.0 to cell "RootCell"</p>
<p>Adding PCI device ff:0d.1 to cell "RootCell"</p>
<p>Adding PCI device ff:0e.0 to cell "RootCell"</p>
<p>Adding PCI device ff:0e.1 to cell "RootCell"</p>
<p>Adding PCI device ff:0f.0 to cell "RootCell"</p>
<p>Adding PCI device ff:0f.1 to cell "RootCell"</p>
<p>Adding PCI device ff:0f.2 to cell "RootCell"</p>
<p>Adding PCI device ff:0f.3 to cell "RootCell"</p>
<p>Adding PCI device ff:0f.4 to cell "RootCell"</p>
<p>Adding PCI device ff:0f.5 to cell "RootCell"</p>
<p>Adding PCI device ff:10.0 to cell "RootCell"</p>
<p>Adding PCI device ff:10.1 to cell "RootCell"</p>
<p>Adding PCI device ff:10.2 to cell "RootCell"</p>
<p>Adding PCI device ff:10.3 to cell "RootCell"</p>
<p>Adding PCI device ff:10.4 to cell "RootCell"</p>
<p>Adding PCI device ff:10.5 to cell "RootCell"</p>
<p>Adding PCI device ff:10.6 to cell "RootCell"</p>
<p>Adding PCI device ff:10.7 to cell "RootCell"</p>
<p>Adding PCI device ff:13.0 to cell "RootCell"</p>
<p>Adding PCI device ff:13.1 to cell "RootCell"</p>
<p>Adding PCI device ff:13.4 to cell "RootCell"</p>
<p>Adding PCI device ff:13.5 to cell "RootCell"</p>
<p>Adding PCI device ff:16.0 to cell "RootCell"</p>
<p>Adding PCI device ff:16.1 to cell "RootCell"</p>
<p>Adding PCI device ff:16.2 to cell "RootCell"</p>
<p>Page pool usage after late setup: mem 469/32207, remap 65549/131072</p>
<p>Activating hypervisor</p>
<p>Adding virtual PCI device 00:17.0 to cell "nuttx"</p>
<p>Shared memory connection established, peer cells:</p>
<p>&nbsp;"RootCell"</p>
<p>Adding virtual PCI device 00:18.0 to cell "nuttx"</p>
<p>Shared memory connection established, peer cells:</p>
<p>&nbsp;"RootCell"</p>
<p>Created cell "nuttx"</p>
<p>Page pool usage after cell creation: mem 1001/32207, remap 65549/131072<=
/p>
<p>Cell "nuttx" can be loaded</p>
<p>CPU 3 received SIPI, vector 100</p>
<p>Started cell "nuttx"</p>
<p>FATAL: Unhandled VM-Exit, reason 2</p>
<p>qualification 0</p>
<p>vectoring info: 0 interrupt info: 0</p>
<p>RIP: 0x0000000100939685 RSP: 0x0000000100da4d28 FLAGS: 10006</p>
<p>RAX: 0x00000000000326a0 RBX: 0x0000000100da4d40 RCX: 0x000000000000003e<=
/p>
<p>RDX: 0x000000000010a003 RSI: 0x000000000010a000 RDI: 0x0000000000104010<=
/p>
<p>CS: 8 BASE: 0x0000000000000000 AR-BYTES: 2099 EFER.LMA 1</p>
<p>CR0: 0x0000000080010033 CR3: 0x0000000000102000 CR4: 0x00000000000326a0<=
/p>
<p>EFER: 0x0000000000000500</p>
<p>Parking CPU 3 (Cell: "nuttx")</p>
<p><br></p><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_=
attr">=E5=9C=A82021=E5=B9=B412=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=
=89 UTC+8 21:41:09&lt;jiajun huang> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><=
blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left:=
 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div style=3D"white-spac=
e:pre"><div>nuttx.c</div><br><div>#include &lt;jailhouse/types.h&gt;</div><=
div>#include &lt;jailhouse/cell-config.h&gt;</div><br><div>struct {</div><d=
iv>    struct jailhouse_cell_desc cell;</div><div>    __u64 cpus[1];</div><=
div>    struct jailhouse_memory mem_regions[9];</div><div>    struct jailho=
use_cache cache_regions[1];</div><div>    struct jailhouse_irqchip irqchips=
[3];</div><div>    struct jailhouse_pio pio_regions[3];</div><div>    struc=
t jailhouse_pci_device pci_devices[2];</div><div>    struct jailhouse_pci_c=
apability pci_caps[0];</div><br><div>} __attribute__((packed)) config =3D {=
</div><div>    .cell =3D {</div><div>        .signature =3D JAILHOUSE_CELL_=
DESC_SIGNATURE,</div><div>        .revision =3D JAILHOUSE_CONFIG_REVISION,<=
/div><div>        .name =3D &quot;nuttx&quot;,</div><div>    .flags =3D JAI=
LHOUSE_CELL_PASSIVE_COMMREG,</div><div>        .cpu_set_size =3D sizeof(con=
fig.cpus),</div><div>        .num_memory_regions =3D ARRAY_SIZE(config.mem_=
regions),</div><div>        .num_cache_regions =3D ARRAY_SIZE(config.cache_=
regions),</div><div>        .num_irqchips =3D ARRAY_SIZE(config.irqchips),<=
/div><div>        .num_pio_regions =3D ARRAY_SIZE(config.pio_regions),</div=
><div>        .num_pci_devices =3D ARRAY_SIZE(config.pci_devices),</div><di=
v>    .num_pci_caps =3D ARRAY_SIZE(config.pci_caps),</div><div>        .con=
sole =3D {</div><div>            .type =3D JAILHOUSE_CON_TYPE_8250,</div><d=
iv>            .flags =3D JAILHOUSE_CON_ACCESS_PIO,</div><div>            .=
address =3D 0x3f8,</div><div>        },</div><div>    },</div><br><div>    =
.cpus =3D {</div><div>        0x8,</div><div>    },</div><br><div>    .mem_=
regions =3D {</div><div>        /* MemRegion: 57a000000-5d9ffffff : JAILHOU=
SE Inmate Memory */</div><div>        {</div><div>            .phys_start =
=3D 0x57a000000,</div><div>            .virt_start =3D 0x57a000000,</div><d=
iv>            .size =3D 0x1000,</div><div>            .flags =3D JAILHOUSE=
_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,</div><div>        },</div><div>      =
  {</div><div>            .phys_start =3D 0x57a001000,</div><div>          =
  .virt_start =3D 0,</div><div>            .size =3D 0x40000000,</div><div>=
            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |</div><div=
>                JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |</div><div=
>                JAILHOUSE_MEM_ROOTSHARED,</div><div>        },</div><div> =
       {</div><div>            .phys_start =3D 0x5ba001000,</div><div>     =
       .virt_start =3D 0x5ba001000,</div><div>            .size =3D 0x4000,=
</div><div>            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSH=
ARED,</div><div>        },</div><div>        {</div><div>            .phys_=
start =3D 0x5ba005000,</div><div>            .virt_start =3D 0x5ba005000,</=
div><div>            .size =3D 0x4000,</div><div>            .flags =3D JAI=
LHOUSE_MEM_READ| JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_ROOTSHARED,</div><div>=
        },</div><div>        /* communication region */ {</div><div>       =
     .virt_start =3D 0x5ba010000,</div><div>            .size       =3D 0x0=
0001000,</div><div>            .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_ME=
M_WRITE |</div><div>                JAILHOUSE_MEM_COMM_REGION,</div><div>  =
      },</div><div>        JAILHOUSE_SHMEM_NET_REGIONS(0x5ba205000, 1),</di=
v><div>    },</div><br><div>    .cache_regions =3D {</div><div>        {</d=
iv><div>            .start =3D 0,</div><div>            .size =3D 2,</div><=
div>            .type =3D JAILHOUSE_CACHE_L3,</div><div>        },</div><di=
v>    },</div><br><div>    .irqchips =3D {</div><div>        /* IOAPIC 0, G=
SI base 0 */</div><div>        {</div><div>            .address =3D 0xfec00=
000,</div><div>            .id =3D 0x100ff,</div><div>            .pin_bitm=
ap =3D {</div><div>                0x000001</div><div>            },</div><=
div>        },</div><div>        /* IOAPIC 2, GSI base 24 */</div><div>    =
    {</div><div>            .address =3D 0xfec01000,</div><div>            =
.id =3D 0x1002c,</div><div>            .pin_bitmap =3D {</div><div>        =
        0x000000</div><div>            },</div><div>        },</div><div>  =
      /* IOAPIC 3, GSI base 48 */</div><div>        {</div><div>           =
 .address =3D 0xfec40000,</div><div>            .id =3D 0x802c,</div><div> =
           .pin_bitmap =3D {</div><div>                0x000000</div><div> =
           },</div><div>        },</div><div>    },</div><br><div>    .pio_=
regions =3D {</div><div>        /* Port I/O: 0020-0021 : pic1 */</div><div>=
    PIO_RANGE(0x20, 0x2),</div><div>        /* Port I/O: 00a0-00a1 : pic2 *=
/</div><div>    PIO_RANGE(0xa0, 0x2),</div><div>        /* Port I/O: 03f8-0=
3ff : serial */</div><div>        PIO_RANGE(0x3f8, 0x8),</div><div>    },</=
div><div>    .pci_devices =3D {</div><div>        { </div><div>            =
.type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,</div><div>            .iommu =3D 1,</=
div><div>            .domain =3D 0x0,</div><div>            .bdf =3D 0x17 &=
lt;&lt; 3,</div><div>            .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK_M=
SIX,</div><div>            .num_msix_vectors =3D 16,</div><div>            =
.shmem_regions_start =3D 0,</div><div>            .shmem_dev_id =3D 1,</div=
><div>            .shmem_peers =3D 2,</div><div>            .shmem_protocol=
 =3D 0x0002,</div><div>        },</div><div>        { </div><div>          =
  .type =3D JAILHOUSE_PCI_TYPE_IVSHMEM,</div><div>            .iommu =3D 1,=
</div><div>            .domain =3D 0x0,</div><div>            .bdf =3D 0x18=
 &lt;&lt; 3,</div><div>            .bar_mask =3D JAILHOUSE_IVSHMEM_BAR_MASK=
_MSIX,</div><div>            .num_msix_vectors =3D 2,</div><div>           =
 .shmem_regions_start =3D 5,</div><div>            .shmem_dev_id =3D 1,</di=
v><div>            .shmem_peers =3D 2,</div><div>            .shmem_protoco=
l =3D JAILHOUSE_SHMEM_PROTO_VETH,</div><div>        },</div><div>    },</di=
v><br><div>    .pci_caps =3D {</div><div>        </div><div>    },</div><di=
v>};</div><br></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"g=
mail_attr">=E5=9C=A82021=E5=B9=B412=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=
=E4=B8=89 UTC+8 21:39:52&lt;jiajun huang&gt; =E5=86=99=E9=81=93=EF=BC=9A<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Dear Jailhouse community=
=EF=BC=8C<br><div>This bug occurred when I tried to start nuttx on a none-r=
oot cell on the server. I added two ivshmem devices for nuttx. Below is my =
configuration file. I am not sure if there is a problem with the mmio area =
in the configuration file. What is the communication area? In addition, if =
jailhouse runs in QEMU, can two virtual machines communicate with each othe=
r through ivshmem-net?<br></div><div><br></div><div>Below is my root-cell ,=
 nuttx configuration and log output from the port.<br></div><div><br></div>=
<div><div><div>Best regards,</div><div><br></div><div>Jiajun Huang</div></d=
iv><div><div><div><br></div></div></div></div></blockquote></div></blockquo=
te></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1f2bc22d-a7ef-4834-bc6a-c247ffe1aaa9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1f2bc22d-a7ef-4834-bc6a-c247ffe1aaa9n%40googlegroups.co=
m</a>.<br />

------=_Part_9881_541247545.1640180504147--

------=_Part_9880_53882015.1640180504147--
