Return-Path: <jailhouse-dev+bncBCA7ZIXV4AJBBN4QR6GAMGQEJIBBCTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id D419E445273
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Nov 2021 12:47:04 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id d11-20020a50cd4b000000b003da63711a8asf5398775edj.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 04 Nov 2021 04:47:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1636026424; cv=pass;
        d=google.com; s=arc-20160816;
        b=1JCYw7E+nToijEgF8nU6FCqh562NkUTAyF2772rI3kdgyO7FTRx2ppAQpNdrs9Z+/9
         kli9hHk3C9fC3eMlfzT2A1FXXhrtjWVOSdsgvmJXaWE8/WJWwSQLHYvpvwQ1M6+n3fFi
         hlikO6kAoHQ+lZuxVYlHdFXzqEQerVHOWam+dpbK7haPfgWQgCZ7YQjabOw8L7XwZoXb
         LyCNQeXG28pr/TqoiEVU6Xdc1t2mhoG/1F9/SCG8F+ZsCef3nC2nYjgzyNSyHpEOAjIw
         EiHBJKeDFtkZe1BqP0Wt5PBm0vYng83ynMsSgF0bmlDuUwtCupCDgSwnFthWx716CWEF
         cwSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:ironport-hdrordr:ironport-data:ironport-sdr:sender
         :dkim-signature;
        bh=uq7gNupzufEGrMeXfdvkcjK/faJRly2sZCUinC6qdWk=;
        b=ycaZEZ48h1WdR4/u1Yy2j7ZVoi8oZrqB0DyJJiPZvlrYmcm06j5j/EryNJf8NrJsgE
         ZS5zLAbKo0ZqnLSDH4gKdUqiCjm7IAmz8vsp4OYa+GpfOlyR+P3QJA0wAUblx+C9VuNI
         QHKC4hwZ24HjW/eXYBxtNr1sEHkCQjyyZjXNU9FSjpFVNSr7hCxiHxPCq7+RzXXbDgho
         ZvnNf5QKXhnpDXSsPH6aNImen7ubZh4FxxlciZfwX8aXJdj20YIJZuhGoYHEcgPBKNbI
         0oQTtyZbYBvGTW2T/CvEH27t3AbWgJ3MyGHojnGxNflM5VMcT568G218y+WBPmuqQLMa
         GtDg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ulmapackaging.com header.s=secumail header.b=JNZeQkU5;
       spf=pass (google.com: domain of rsagarzazu@ulmapackaging.com designates 212.8.121.109 as permitted sender) smtp.mailfrom=rsagarzazu@ulmapackaging.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ulmapackaging.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:ironport-sdr:ironport-data:ironport-hdrordr:from:to:subject
         :thread-topic:thread-index:date:message-id:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uq7gNupzufEGrMeXfdvkcjK/faJRly2sZCUinC6qdWk=;
        b=kJfTuoDTYxTvTI62G6PUCtQEylVkixWE1+Z5Os/Atox9pEVWmrwczWh6PCVeOCogeW
         Psuvy0TwTGe2ejORnhjbuQVW+4kQQawBaAoljlFvfUADuH1j//NzoYheeGL4gfTUB79K
         VCWSTxZmY9nE9Um+Zx1Y2K9yEkdT1i3T1x4jZYsIX8iI/y1y3ZYf5XycUDNVTy54X9WY
         8haGluedLJwd9B4xRsF7Lz9lNMGvQDPZJJszEIL8BFUcK5kzpF4RovDkVohEJjk8WFmN
         cRgpIC5Qn5hHf9sMzwrDUB4ybDOs90iqdS5DewFeFd40WzbFObiY6y+mnsEoZgoOIlwf
         dOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:ironport-sdr:ironport-data
         :ironport-hdrordr:from:to:subject:thread-topic:thread-index:date
         :message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uq7gNupzufEGrMeXfdvkcjK/faJRly2sZCUinC6qdWk=;
        b=lQaAeoDAWcsib2KVSabW5V012IC+hRJ8lPiujJmc+4gtTK3bgNJEq1dLHa/0Bloc7i
         9m1wuowKv25K13BuCZ2sdaSfq7uX2n7C8H76LdX/hL8A/fi1tBQ4yLOxf2WmVx/ACC1Z
         09XfhgGXdz80K1FdyOxD9KZpM08LUOXSztwxwkHBQ249bg5wc/Bo14o1Vpo9Jf7xmjNc
         qY24xdtYXDFDg29XhXOrH0M7Q2b5NceKsWSLoB81uN+Nv3NBPK1LmHBjxwCpJ5YkP3Bc
         Lt8TZ5iuIIxRTIZmYjrwGyA3eoerf71j3z6M+uplmsp5uaoIM7Ef8O1WSAZQJeKOYt6l
         hVKQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530CoCbNfrQdaW+B5bJVzz15qwrny84bf3khLa/drAamiupINVIY
	EYZSHwKIrBULPKc6qZkLhQQ=
X-Google-Smtp-Source: ABdhPJwwBxDQs0Ejmps7VO7n+HwVUKu5aLL/P1FqUfH+O1GFsbrJsWSEy5qrb+xO7LdX0RJxFKAeYw==
X-Received: by 2002:a17:907:6d8d:: with SMTP id sb13mr148509ejc.345.1636026424225;
        Thu, 04 Nov 2021 04:47:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1484:: with SMTP id x4ls2605406ejc.1.gmail; Thu, 04
 Nov 2021 04:47:03 -0700 (PDT)
X-Received: by 2002:a17:906:fa90:: with SMTP id lt16mr59406225ejb.95.1636026423153;
        Thu, 04 Nov 2021 04:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636026423; cv=none;
        d=google.com; s=arc-20160816;
        b=K4a/UVFgXvnY5NkmaJZDVvMcaM6ar/pkCgDJsIBjZbv4frFIZhAtcrAPVPcBQi0oIb
         au7vCcQWCz8k2SBShss+P9UqVRJ+KvF40zFRYfLahDtCEqRh0wCt2K83+aXBi5bPMTYV
         hdFj++Uc/ULRMNU4Dbx4X4XZq9P3CA/YKHWcVfXw+UTAijN1A440TddgmeREZqBVYolb
         FESXE5+uIZvPl4+MiDtm/qEfTmciGSixgytYw6YVUivsFFqxWNDkEwLMnyLhyCAwkqeR
         lu19OKllQM6z9HS3u/k/lEgtwHg/vCuhq1PUFAknQR4IkDop6WPNV4u+MuImU8OqJpcy
         6weQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:to:from:ironport-hdrordr
         :ironport-data:ironport-sdr:dkim-signature;
        bh=S89rl3HI4qt88GsUzGPx+NjvHkEx4l04tCf+QQVRpgg=;
        b=cpSIGE17bhRrbCBo3GEdVqV2Sdymt16D0w+T5D9vPpFcYc0pwvf5gAqYcQIHHmGOni
         rMHKuhZL8tw7SQtiifdbgeDDkGFRIVsp9T4WfYkTYjGuGsdRSLqG6Ulj/Y1/tIsL3gDq
         aDEX51xwaVdBaVyen+Uj+lL8znxTNW8jSP+6jBEHrX10YXfv0LBhdjZZoQO2JdElk3Yn
         TPsSMdwnYNnzzCWH2CfthiEOQ7uz7yraE30q9UV0k6rU++JN2xHPpW/LgdtBbRzNdkgj
         WnMC4DmnfpdWFhv1sMOaQsJ9/szt+B4ol8VoAKrGO6KEmZ+KF09Fo363gDw4tZFholJ+
         UOGQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ulmapackaging.com header.s=secumail header.b=JNZeQkU5;
       spf=pass (google.com: domain of rsagarzazu@ulmapackaging.com designates 212.8.121.109 as permitted sender) smtp.mailfrom=rsagarzazu@ulmapackaging.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ulmapackaging.com
Received: from mx2.ulmapackaging.com (mx2.ulmapackaging.com. [212.8.121.109])
        by gmr-mx.google.com with ESMTPS id o25si151990eju.1.2021.11.04.04.47.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Nov 2021 04:47:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of rsagarzazu@ulmapackaging.com designates 212.8.121.109 as permitted sender) client-ip=212.8.121.109;
X-Ironport-Dmarc-Check-Result: validskip
IronPort-SDR: 6P7D6Jnli8q2TlKikwtRxAeRgvIk9SnCa1+7cpaSA0iKI6uoMpS5kGAZJXeUEbuxgwSaHoAwf5
 VAxGgyDWnVtA==
IronPort-Data: =?us-ascii?q?A9a23=3A7DIoiq0XKe4yOY4X4/bD5f1zkn2cJEfYwER7X?=
 =?us-ascii?q?KvMYLTBsI5bpzJUy2EZC2DXOq6Jazfxet0na4zg8B5T7ZXcnN8xTVY/+CA2R?=
 =?us-ascii?q?RqmiyZk6fd1jKvI0qr7wvTrFCqL1O1DLImfRCwIZiWE/E70a+C99SAUOZygH?=
 =?us-ascii?q?dIQNsaVY0ideic0EE/NuTo78wIIqtYAbeqRWmthivuuyyHrA2JJ7hYvWo4iB?=
 =?us-ascii?q?wBvnzs01Bj6kGtwUlXT/pmntneG/5UeJMp3ya1csxIU62SJd9NWSdovzJnhl?=
 =?us-ascii?q?o/Y1ww1AYv8z/Dje0YJS7HTOwfIl35TUu6vmXCupARrjfx9baRaMAEO1l1ln?=
 =?us-ascii?q?PgooDlJnYarQAggJL/Fivk1Th1dGjl3Nq5P977BLj60tsn7I0juKCOzn6w2X?=
 =?us-ascii?q?SnaOqVdoI6bG1pm9/UZLDAKcwuOwu673pq0Te5jgsksNs72JJhZsXZlpQw1p?=
 =?us-ascii?q?95OrYvrGvqQo4YGmm52350mIBoXXOJBARIHUfgKS0Qn1o8rNa8D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ACg68p6o7ylIvRll8pMXu2MUaV5oZeYIsim?=
 =?us-ascii?q?QD101hICG9Kvbo9fxG785rsCMc6QxhIE3I9urhBEDtex7hHP1OkPIs1NWZLW?=
 =?us-ascii?q?rbUQKTRekIh7cKqAeOJ8SKzI9gPNBbHZSWZuedMbEwt7ef3ODxKadG/DGQmJ?=
 =?us-ascii?q?rY49s24U0dND1XVw=3D=3D?=
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO spc015.packaging.ulma.es) ([172.16.1.15])
  by mx2.ulmapackaging.com with ESMTP/TLS/ECDHE-RSA-AES128-SHA256; 04 Nov 2021 12:47:02 +0100
Received: from spc015.packaging.ulma.es (172.16.1.15) by
 spc015.packaging.ulma.es (172.16.1.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Nov 2021 12:47:01 +0100
Received: from spc015.packaging.ulma.es ([::1]) by spc015.packaging.ulma.es
 ([::1]) with mapi id 15.00.1497.012; Thu, 4 Nov 2021 12:47:01 +0100
From: Raimundo Sagarzazu <rsagarzazu@ulmapackaging.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: Problem: system hangs
Thread-Topic: Problem: system hangs
Thread-Index: AdfRb/yz6sETOSkXRaWPtbwUlYSPUg==
Date: Thu, 4 Nov 2021 11:47:00 +0000
Message-ID: <462c8035821c4482990bdec49113221a@spc015.packaging.ulma.es>
Accept-Language: es-ES, en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.87.145]
Content-Type: multipart/alternative;
	boundary="_000_462c8035821c4482990bdec49113221aspc015packagingulmaes_"
MIME-Version: 1.0
X-Original-Sender: rsagarzazu@ulmapackaging.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ulmapackaging.com header.s=secumail header.b=JNZeQkU5;
       spf=pass (google.com: domain of rsagarzazu@ulmapackaging.com designates
 212.8.121.109 as permitted sender) smtp.mailfrom=rsagarzazu@ulmapackaging.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ulmapackaging.com
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

--_000_462c8035821c4482990bdec49113221aspc015packagingulmaes_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

I'm experiencing a "system hanging" problem when jalhouse is enabled. It ha=
ppens with just rootcell enabled, no need to start inmate cells. I've been =
working on it for several weeks trying to have at least an error log or rep=
ort but I didn't success. System just freezes.

I'm able to reproduce it by launching and killing an application repeatedly=
. It hangs when launching, not when killing, so I'm thinking it could happe=
n when trying to access an invalid memory region. Could be?

Sometimes it arrives quit easily,  just after some launches but sometimes i=
t can take several hours, more than 7000 launches ...

I'm working with x86 Intl Atom E3950 hardware platforms. I'm attaching "/pr=
oc/iomem" and "memregions" from the config file, in case anyone can see som=
ething is wrong.

Any hint on how to debug it or where should I focus on will be very welcome=
.


/proc/Iomem:

00000000-00000fff : Reserved
00001000-0003efff : System RAM
0003f000-0003ffff : Reserved
00040000-0009efff : System RAM
0009f000-000fffff : Reserved
  000a0000-000bffff : PCI Bus 0000:00
  000c0000-000dffff : PCI Bus 0000:00
  000e0000-000fffff : PCI Bus 0000:00
    000f0000-000fffff : System ROM
00100000-0fffffff : System RAM
10000000-12150fff : Reserved
12151000-77874fff : System RAM
77875000-79994fff : Reserved
79995000-79a69fff : System RAM
79a6a000-79d8efff : ACPI Non-volatile Storage
79d8f000-7a1a9fff : Reserved
7a1aa000-7a1fbfff : Unknown E820 type
7a1fc000-7a569fff : System RAM
7a56a000-7a56afff : ACPI Non-volatile Storage
7a56b000-7a594fff : Reserved
7a595000-7aae5fff : System RAM
7aae6000-7aae7fff : Reserved
7aae8000-7affffff : System RAM
7b000000-7fffffff : Reserved
  7b800001-7bffffff : PCI Bus 0000:00
  7c000001-7fffffff : PCI Bus 0000:00
    7c000001-7ffffffe : Graphics Stolen Memory
80000000-cfffffff : PCI Bus 0000:00
  80000000-8fffffff : 0000:00:02.0
  90000000-90ffffff : 0000:00:02.0
  91000000-910fffff : 0000:00:0e.0
  91100000-912fffff : PCI Bus 0000:05
    91100000-911fffff : 0000:05:00.0
    91200000-91203fff : 0000:05:00.0
  91300000-914fffff : PCI Bus 0000:03
    91300000-913fffff : 0000:03:00.0
    91400000-91403fff : 0000:03:00.0
  91500000-916fffff : PCI Bus 0000:01
    91500000-915fffff : 0000:01:00.0
    91600000-9160ffff : 0000:01:00.0
  91700000-9170ffff : 0000:00:15.0
    91700000-9170ffff : xhci-hcd
      91708070-9170846f : intel_xhci_usb_sw
  91710000-91713fff : 0000:00:0e.0
    91710000-91713fff : ICH HD audio
  91714000-91715fff : 0000:00:12.0
    91714000-91715fff : ahci
  91716000-917160ff : 0000:00:1f.1
  91717000-91717fff : 0000:00:16.0
  91718000-91718fff : 0000:00:16.0
  91719000-917197ff : 0000:00:12.0
    91719000-917197ff : ahci
  9171a000-9171a0ff : 0000:00:12.0
    9171a000-9171a0ff : ahci
  9171d000-9171dfff : 0000:00:0f.0
d0000000-d0ffffff : Reserved
  d0c00000-d0c00653 : INT3452:03
  d0c40000-d0c40763 : INT3452:01
  d0c50000-d0c5076b : INT3452:00
  d0c70000-d0c70673 : INT3452:02
e0000000-efffffff : PCI MMCONFIG 0000 [bus 00-ff]
  e0000000-efffffff : Reserved
    e0000000-efffffff : PCI Bus 0000:00
      e0000000-efffffff : pnp 00:05
fe042000-fe044fff : Reserved
fe900000-fe902fff : Reserved
fea00000-feafffff : pnp 00:05
fec00000-fec00fff : Reserved
  fec00000-fec003ff : IOAPIC 0
fed00000-fed003ff : PNP0103:00
fed01000-fed01fff : Reserved
  fed01000-fed01fff : pnp 00:05
fed03000-fed03fff : pnp 00:05
fed06000-fed06fff : pnp 00:05
fed08000-fed09fff : pnp 00:05
fed1c000-fed1cfff : pnp 00:05
fed64000-fed64fff : dmar0
fed65000-fed65fff : dmar1
fed80000-fedbffff : pnp 00:05
fee00000-fee00fff : Local APIC
  fee00000-fee00fff : Reserved
ff000000-ffffffff : Reserved
100000000-17fffffff : System RAM
  175600000-176603b86 : Kernel code
  176800000-176bacfff : Kernel rodata
  176c00000-176e919ff : Kernel data
  17754e000-1775fffff : Kernel bss


Config:

               .mem_regions =3D {
                              /* MemRegion: 00000000-0003efff : System RAM =
*/
                              {
                                            .phys_start =3D 0x0,
                                            .virt_start =3D 0x0,
                                            .size =3D 0x3f000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE |
                                                           JAILHOUSE_MEM_EX=
ECUTE | JAILHOUSE_MEM_DMA,
                              },
                              /* MemRegion: 00040000-0009efff : System RAM =
*/
                              {
                                            .phys_start =3D 0x40000,
                                            .virt_start =3D 0x40000,
                                            .size =3D 0x5f000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE |
                                                           JAILHOUSE_MEM_EX=
ECUTE | JAILHOUSE_MEM_DMA,
                              },
                              /* MemRegion: 000a0000-000bffff : PCI Bus 000=
0:00 */
                              {
                                            .phys_start =3D 0xa0000,
                                            .virt_start =3D 0xa0000,
                                            .size =3D 0x20000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 000f0000-000fffff : System ROM =
*/
                              {
                                            .phys_start =3D 0xf0000,
                                            .virt_start =3D 0xf0000,
                                            .size =3D 0x10000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 00100000-0fffffff : System RAM =
*/
                              {
                                            .phys_start =3D 0x100000,
                                            .virt_start =3D 0x100000,
                                            .size =3D 0xff00000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE |
                                                           JAILHOUSE_MEM_EX=
ECUTE | JAILHOUSE_MEM_DMA,
                              },
                              /* MemRegion: 12151000-77874fff : System RAM =
*/
                              {
                                            .phys_start =3D 0x12151000,
                                            .virt_start =3D 0x12151000,
                                            .size =3D 0x65724000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE |
                                                           JAILHOUSE_MEM_EX=
ECUTE | JAILHOUSE_MEM_DMA,
                              },
                              /* MemRegion: 79995000-79a69fff : System RAM =
*/
                              {
                                            .phys_start =3D 0x79995000,
                                            .virt_start =3D 0x79995000,
                                            .size =3D 0xd5000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE |
                                                           JAILHOUSE_MEM_EX=
ECUTE | JAILHOUSE_MEM_DMA,
                              },
                              /* MemRegion: 79a6a000-79d8efff : ACPI Non-vo=
latile Storage */
                              {
                                            .phys_start =3D 0x79a6a000,
                                            .virt_start =3D 0x79a6a000,
                                            .size =3D 0x325000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 7a1aa000-7a1fbfff : Unknown E82=
0 type */
                              {
                                            .phys_start =3D 0x7a1aa000,
                                            .virt_start =3D 0x7a1aa000,
                                            .size =3D 0x52000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 7a1fc000-7a569fff : System RAM =
*/
                              {
                                            .phys_start =3D 0x7a1fc000,
                                            .virt_start =3D 0x7a1fc000,
                                            .size =3D 0x36e000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE |
                                                           JAILHOUSE_MEM_EX=
ECUTE | JAILHOUSE_MEM_DMA,
                              },
                              /* MemRegion: 7a56a000-7a56afff : ACPI Non-vo=
latile Storage */
                              {
                                            .phys_start =3D 0x7a56a000,
                                            .virt_start =3D 0x7a56a000,
                                            .size =3D 0x1000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 7a595000-7aae5fff : System RAM =
*/
                              {
                                            .phys_start =3D 0x7a595000,
                                            .virt_start =3D 0x7a595000,
                                            .size =3D 0x551000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE |
                                                           JAILHOUSE_MEM_EX=
ECUTE | JAILHOUSE_MEM_DMA,
                              },
                              /* MemRegion: 7aae8000-7affffff : System RAM =
*/
                              {
                                            .phys_start =3D 0x7aae8000,
                                            .virt_start =3D 0x7aae8000,
                                            .size =3D 0x518000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE |
                                                           JAILHOUSE_MEM_EX=
ECUTE | JAILHOUSE_MEM_DMA,
                              },
                              /* MemRegion: 7c000001-7ffffffe : Graphics St=
olen Memory */
                              {
                                            .phys_start =3D 0x7c000001,
                                            .virt_start =3D 0x7c000001,
                                            .size =3D 0x4000000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 80000000-8fffffff : 0000:00:02.=
0 */
                              {
                                            .phys_start =3D 0x80000000,
                                            .virt_start =3D 0x80000000,
                                            .size =3D 0x10000000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 90000000-90ffffff : 0000:00:02.=
0 */
                              {
                                            .phys_start =3D 0x90000000,
                                            .virt_start =3D 0x90000000,
                                            .size =3D 0x1000000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 91000000-910fffff : 0000:00:0e.=
0 */
                              {
                                            .phys_start =3D 0x91000000,
                                            .virt_start =3D 0x91000000,
                                            .size =3D 0x100000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 91100000-911fffff : 0000:05:00.=
0 */
                              {
                                            .phys_start =3D 0x91100000,
                                            .virt_start =3D 0x91100000,
                                            .size =3D 0x100000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 91201000-91203fff : 0000:05:00.=
0 */
                              {
                                            .phys_start =3D 0x91201000,
                                            .virt_start =3D 0x91201000,
                                            .size =3D 0x3000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 91300000-913fffff : 0000:03:00.=
0 */
                              {
                                            .phys_start =3D 0x91300000,
                                            .virt_start =3D 0x91300000,
                                            .size =3D 0x100000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 91401000-91403fff : 0000:03:00.=
0 */
                              {
                                            .phys_start =3D 0x91401000,
                                            .virt_start =3D 0x91401000,
                                            .size =3D 0x3000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 91500000-915fffff : 0000:01:00.=
0 */
                              {
                                            .phys_start =3D 0x91500000,
                                            .virt_start =3D 0x91500000,
                                            .size =3D 0x100000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 91600000-9160ffff : 0000:01:00.=
0 */
                              {
                                            .phys_start =3D 0x91600000,
                                            .virt_start =3D 0x91600000,
                                            .size =3D 0x10000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 91708070-9170846f : intel_xhci_=
usb_sw */
                              {
                                            .phys_start =3D 0x91708070,
                                            .virt_start =3D 0x91708070,
                                            .size =3D 0x1000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 91710000-91713fff : ICH HD audi=
o */
                              {
                                            .phys_start =3D 0x91710000,
                                            .virt_start =3D 0x91710000,
                                            .size =3D 0x4000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 91714000-91715fff : ahci */
                              {
                                            .phys_start =3D 0x91714000,
                                            .virt_start =3D 0x91714000,
                                            .size =3D 0x2000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 91716000-917160ff : 0000:00:1f.=
1 */
                              {
                                            .phys_start =3D 0x91716000,
                                            .virt_start =3D 0x91716000,
                                            .size =3D 0x1000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 91717000-91717fff : 0000:00:16.=
0 */
                              {
                                            .phys_start =3D 0x91717000,
                                            .virt_start =3D 0x91717000,
                                            .size =3D 0x1000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 91718000-91718fff : 0000:00:16.=
0 */
                              {
                                            .phys_start =3D 0x91718000,
                                            .virt_start =3D 0x91718000,
                                            .size =3D 0x1000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 91719000-917197ff : ahci */
                              {
                                            .phys_start =3D 0x91719000,
                                            .virt_start =3D 0x91719000,
                                            .size =3D 0x1000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 9171a000-9171a0ff : ahci */
                              {
                                            .phys_start =3D 0x9171a000,
                                            .virt_start =3D 0x9171a000,
                                            .size =3D 0x1000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 9171d000-9171dfff : 0000:00:0f.=
0 */
                              {
                                            .phys_start =3D 0x9171d000,
                                            .virt_start =3D 0x9171d000,
                                            .size =3D 0x1000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: d0c00000-d0c00653 : INT3452:03 =
*/
                              {
                                            .phys_start =3D 0xd0c00000,
                                            .virt_start =3D 0xd0c00000,
                                            .size =3D 0x1000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: d0c40000-d0c40763 : INT3452:01 =
*/
                              {
                                            .phys_start =3D 0xd0c40000,
                                            .virt_start =3D 0xd0c40000,
                                            .size =3D 0x1000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: d0c50000-d0c5076b : INT3452:00 =
*/
                              {
                                            .phys_start =3D 0xd0c50000,
                                            .virt_start =3D 0xd0c50000,
                                            .size =3D 0x1000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: d0c70000-d0c70673 : INT3452:02 =
*/
                              {
                                            .phys_start =3D 0xd0c70000,
                                            .virt_start =3D 0xd0c70000,
                                            .size =3D 0x1000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: fea00000-feafffff : pnp 00:05 *=
/
                              {
                                            .phys_start =3D 0xfea00000,
                                            .virt_start =3D 0xfea00000,
                                            .size =3D 0x100000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: fed00000-fed003ff : PNP0103:00 =
*/
                              {
                                            .phys_start =3D 0xfed00000,
                                            .virt_start =3D 0xfed00000,
                                            .size =3D 0x1000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: fed01000-fed01fff : pnp 00:05 *=
/
                              {
                                            .phys_start =3D 0xfed01000,
                                            .virt_start =3D 0xfed01000,
                                            .size =3D 0x1000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: fed03000-fed03fff : pnp 00:05 *=
/
                              {
                                            .phys_start =3D 0xfed03000,
                                            .virt_start =3D 0xfed03000,
                                            .size =3D 0x1000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: fed06000-fed06fff : pnp 00:05 *=
/
                              {
                                            .phys_start =3D 0xfed06000,
                                            .virt_start =3D 0xfed06000,
                                            .size =3D 0x1000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: fed08000-fed09fff : pnp 00:05 *=
/
                              {
                                            .phys_start =3D 0xfed08000,
                                            .virt_start =3D 0xfed08000,
                                            .size =3D 0x2000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: fed1c000-fed1cfff : pnp 00:05 *=
/
                              {
                                            .phys_start =3D 0xfed1c000,
                                            .virt_start =3D 0xfed1c000,
                                            .size =3D 0x1000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: fed80000-fedbffff : pnp 00:05 *=
/
                              {
                                            .phys_start =3D 0xfed80000,
                                            .virt_start =3D 0xfed80000,
                                            .size =3D 0x40000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
                              /* MemRegion: 140600000-17fffffff : System RA=
M */
                              {
                                            .phys_start =3D 0x140600000,
                                            .virt_start =3D 0x140600000,
                                            .size =3D 0x3fa00000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE |
                                                           JAILHOUSE_MEM_EX=
ECUTE | JAILHOUSE_MEM_DMA,
                              },
                              /* MemRegion: 79930000-7994ffff : ACPI DMAR R=
MRR */
                              /* PCI device: 00:15.0 */
                              {
                                            .phys_start =3D 0x79930000,
                                            .virt_start =3D 0x79930000,
                                            .size =3D 0x20000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE |
                                                           JAILHOUSE_MEM_EX=
ECUTE | JAILHOUSE_MEM_DMA,
                              },
                              /* MemRegion: 7b800000-7fffffff : ACPI DMAR R=
MRR */
                              /* PCI device: 00:02.0 */
                              {
                                            .phys_start =3D 0x7b800000,
                                            .virt_start =3D 0x7b800000,
                                            .size =3D 0x4800000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE |
                                                           JAILHOUSE_MEM_EX=
ECUTE | JAILHOUSE_MEM_DMA,
                              },
                              /* MemRegion: 100600000-1405fffff : JAILHOUSE=
 Inmate Memory */
                              {
                                            .phys_start =3D 0x100600000,
                                            .virt_start =3D 0x100600000,
                                            .size =3D 0x40000000,
                                            .flags =3D JAILHOUSE_MEM_READ |=
 JAILHOUSE_MEM_WRITE,
                              },
               },

Thank you,

  Rai.


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/462c8035821c4482990bdec49113221a%40spc015.packaging.ulma.es.

--_000_462c8035821c4482990bdec49113221aspc015packagingulmaes_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EstiloCorreo18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 3.0cm 70.85pt 3.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ES" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Hello all,<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">I&#8217;m experiencing a &#8220=
;system hanging&#8221; problem when jalhouse is enabled. It happens with ju=
st rootcell enabled, no need to start inmate cells. I&#8217;ve been working=
 on it for several weeks trying to have at least an error log
 or report but I didn&#8217;t success. System just freezes.</span><o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">I&#8217;m able to reproduce it =
by launching and killing an application repeatedly. It hangs when launching=
, not when killing, so I&#8217;m thinking it could happen when trying to ac=
cess an invalid memory region. Could be?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Sometimes it arrives quit easil=
y,&nbsp; just after some launches but sometimes it can take several hours, =
more than 7000 launches &#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">I&#8217;m working with x86 Intl=
 Atom E3950 hardware platforms. I&#8217;m attaching &#8220;/proc/iomem&#822=
1; and &#8220;memregions&#8221; from the config file, in case anyone can se=
e something is wrong.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Any hint on how to debug it or =
where should I focus on will be very welcome.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">/proc/Iomem:<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">00000000-00000fff : Reserved<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">00001000-0003efff : System RAM<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">0003f000-0003ffff : Reserved<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">00040000-0009efff : System RAM<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">0009f000-000fffff : Reserved<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 000a0000-000bffff : PCI =
Bus 0000:00<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 000c0000-000dffff : PCI =
Bus 0000:00<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 000e0000-000fffff : PCI =
Bus 0000:00<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp; 000f0000-000=
fffff : System ROM<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">00100000-0fffffff : System RAM<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">10000000-12150fff : Reserved<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">12151000-77874fff : System RAM<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">77875000-79994fff : Reserved<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">79995000-79a69fff : System RAM<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">79a6a000-79d8efff : ACPI Non-vo=
latile Storage<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">79d8f000-7a1a9fff : Reserved<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">7a1aa000-7a1fbfff : Unknown E82=
0 type<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">7a1fc000-7a569fff : System RAM<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">7a56a000-7a56afff : ACPI Non-vo=
latile Storage<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">7a56b000-7a594fff : Reserved<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">7a595000-7aae5fff : System RAM<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">7aae6000-7aae7fff : Reserved<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">7aae8000-7affffff : System RAM<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">7b000000-7fffffff : Reserved<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 7b800001-7bffffff : PCI =
Bus 0000:00<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 7c000001-7fffffff : PCI =
Bus 0000:00<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp; 7c000001-7ff=
ffffe : Graphics Stolen Memory<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">80000000-cfffffff : PCI Bus 000=
0:00<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 80000000-8fffffff : 0000=
:00:02.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 90000000-90ffffff : 0000=
:00:02.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 91000000-910fffff : 0000=
:00:0e.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 91100000-912fffff : PCI =
Bus 0000:05<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp; 91100000-911=
fffff : 0000:05:00.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp; 91200000-912=
03fff : 0000:05:00.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 91300000-914fffff : PCI =
Bus 0000:03<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp; 91300000-913=
fffff : 0000:03:00.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp; 91400000-914=
03fff : 0000:03:00.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 91500000-916fffff : PCI =
Bus 0000:01<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp; 91500000-915=
fffff : 0000:01:00.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp; 91600000-916=
0ffff : 0000:01:00.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 91700000-9170ffff : 0000=
:00:15.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp; 91700000-917=
0ffff : xhci-hcd<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
91708070-9170846f : intel_xhci_usb_sw<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 91710000-91713fff : 0000=
:00:0e.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp; 91710000-917=
13fff : ICH HD audio<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 91714000-91715fff : 0000=
:00:12.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp; 91714000-917=
15fff : ahci<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 91716000-917160ff : 0000=
:00:1f.1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 91717000-91717fff : 0000=
:00:16.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 91718000-91718fff : 0000=
:00:16.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 91719000-917197ff : 0000=
:00:12.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp; 91719000-917=
197ff : ahci<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 9171a000-9171a0ff : 0000=
:00:12.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp; 9171a000-917=
1a0ff : ahci<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 9171d000-9171dfff : 0000=
:00:0f.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">d0000000-d0ffffff : Reserved<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; d0c00000-d0c00653 : INT3=
452:03<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; d0c40000-d0c40763 : INT3=
452:01<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; d0c50000-d0c5076b : INT3=
452:00<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; d0c70000-d0c70673 : INT3=
452:02<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">e0000000-efffffff : PCI MMCONFI=
G 0000 [bus 00-ff]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; e0000000-efffffff : Rese=
rved<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp; e0000000-eff=
fffff : PCI Bus 0000:00<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
e0000000-efffffff : pnp 00:05<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">fe042000-fe044fff : Reserved<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">fe900000-fe902fff : Reserved<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">fea00000-feafffff : pnp 00:05<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">fec00000-fec00fff : Reserved<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; fec00000-fec003ff : IOAP=
IC 0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">fed00000-fed003ff : PNP0103:00<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">fed01000-fed01fff : Reserved<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; fed01000-fed01fff : pnp =
00:05<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">fed03000-fed03fff : pnp 00:05<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">fed06000-fed06fff : pnp 00:05<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">fed08000-fed09fff : pnp 00:05<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">fed1c000-fed1cfff : pnp 00:05<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">fed64000-fed64fff : dmar0<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">fed65000-fed65fff : dmar1<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">fed80000-fedbffff : pnp 00:05<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">fee00000-fee00fff : Local APIC<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; fee00000-fee00fff : Rese=
rved<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">ff000000-ffffffff : Reserved<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">100000000-17fffffff : System RA=
M<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 175600000-176603b86 : Ke=
rnel code<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 176800000-176bacfff : Ke=
rnel rodata<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 176c00000-176e919ff : Ke=
rnel data<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp; 17754e000-1775fffff : Ke=
rnel bss<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Config:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .mem_regions =3D {<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 00000000-0003efff : System RAM */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x0,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x0,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x3f000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 00040000-0009efff : System RAM */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x40000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x40000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x5f000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 000a0000-000bffff : PCI Bus 0000:00 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0xa0000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0xa0000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x20000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 000f0000-000fffff : System ROM */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0xf0000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0xf0000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x10000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 00100000-0fffffff : System RAM */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x100000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x100000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0xff00000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 12151000-77874fff : System RAM */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x12151000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x12151000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x65724000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 79995000-79a69fff : System RAM */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x79995000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x79995000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0xd5000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 79a6a000-79d8efff : ACPI Non-volatile Storage */<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x79a6a000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x79a6a000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x325000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 7a1aa000-7a1fbfff : Unknown E820 type */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x7a1aa000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x7a1aa000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x52000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 7a1fc000-7a569fff : System RAM */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x7a1fc000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x7a1fc000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x36e000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 7a56a000-7a56afff : ACPI Non-volatile Storage */<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x7a56a000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x7a56a000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 7a595000-7aae5fff : System RAM */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x7a595000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x7a595000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x551000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 7aae8000-7affffff : System RAM */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x7aae8000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x7aae8000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x518000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 7c000001-7ffffffe : Graphics Stolen Memory */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x7c000001,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x7c000001,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x4000000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 80000000-8fffffff : 0000:00:02.0 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x80000000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x80000000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x10000000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 90000000-90ffffff : 0000:00:02.0 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x90000000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x90000000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 91000000-910fffff : 0000:00:0e.0 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x91000000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x91000000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x100000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 91100000-911fffff : 0000:05:00.0 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x91100000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x91100000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x100000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 91201000-91203fff : 0000:05:00.0 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x91201000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x91201000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x3000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 91300000-913fffff : 0000:03:00.0 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x91300000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x91300000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x100000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 91401000-91403fff : 0000:03:00.0 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x91401000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x91401000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x3000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 91500000-915fffff : 0000:01:00.0 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x91500000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x91500000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x100000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 91600000-9160ffff : 0000:01:00.0 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x91600000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x91600000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x10000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 91708070-9170846f : intel_xhci_usb_sw */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x91708070,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x91708070,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 91710000-91713fff : ICH HD audio */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x91710000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x91710000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x4000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 91714000-91715fff : ahci */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x91714000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x91714000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x2000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 91716000-917160ff : 0000:00:1f.1 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x91716000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x91716000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 91717000-91717fff : 0000:00:16.0 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x91717000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x91717000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 91718000-91718fff : 0000:00:16.0 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x91718000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x91718000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 91719000-917197ff : ahci */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x91719000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x91719000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 9171a000-9171a0ff : ahci */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x9171a000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x9171a000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 9171d000-9171dfff : 0000:00:0f.0 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x9171d000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x9171d000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: d0c00000-d0c00653 : INT3452:03 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0xd0c00000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0xd0c00000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: d0c40000-d0c40763 : INT3452:01 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0xd0c40000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0xd0c40000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: d0c50000-d0c5076b : INT3452:00 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0xd0c50000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0xd0c50000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: d0c70000-d0c70673 : INT3452:02 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0xd0c70000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0xd0c70000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: fea00000-feafffff : pnp 00:05 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0xfea00000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0xfea00000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x100000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: fed00000-fed003ff : PNP0103:00 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0xfed00000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0xfed00000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: fed01000-fed01fff : pnp 00:05 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0xfed01000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0xfed01000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: fed03000-fed03fff : pnp 00:05 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0xfed03000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0xfed03000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: fed06000-fed06fff : pnp 00:05 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0xfed06000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0xfed06000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: fed08000-fed09fff : pnp 00:05 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0xfed08000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0xfed08000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x2000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: fed1c000-fed1cfff : pnp 00:05 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0xfed1c000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0xfed1c000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x1000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: fed80000-fedbffff : pnp 00:05 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0xfed80000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0xfed80000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x40000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 140600000-17fffffff : System RAM */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x140600000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x140600000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x3fa00000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 79930000-7994ffff : ACPI DMAR RMRR */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* PCI=
 device: 00:15.0 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x79930000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x79930000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x20000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 7b800000-7fffffff : ACPI DMAR RMRR */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* PCI=
 device: 00:02.0 */<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x7b800000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x7b800000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x4800000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Mem=
Region: 100600000-1405fffff : JAILHOUSE Inmate Memory */<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .phys_start =3D 0x100600000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .virt_start =3D 0x100600000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .size =3D 0x40000000,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span=
>},<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Thank you,<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">&nbsp; Rai.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/462c8035821c4482990bdec49113221a%40spc015.packagin=
g.ulma.es?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com=
/d/msgid/jailhouse-dev/462c8035821c4482990bdec49113221a%40spc015.packaging.=
ulma.es</a>.<br />

--_000_462c8035821c4482990bdec49113221aspc015packagingulmaes_--
