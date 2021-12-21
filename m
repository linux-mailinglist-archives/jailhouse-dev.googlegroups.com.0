Return-Path: <jailhouse-dev+bncBCWJRXUWVQPBBAMZQ6HAMGQEC5K7C3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3d.google.com (mail-qv1-xf3d.google.com [IPv6:2607:f8b0:4864:20::f3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D38F47BFED
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Dec 2021 13:45:54 +0100 (CET)
Received: by mail-qv1-xf3d.google.com with SMTP id 12-20020a05621420cc00b00410c7826fc6sf12502014qve.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Dec 2021 04:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LK6AzI+3tyXOpHgonpldm9oWyJ/r5zFqEmGgJhJkwa4=;
        b=qDQ8TuufQFt95Y1uaNCnrRwS1wnY4ZqGRDMSkg92CdfRCXMLKxDnVgF2kW3XIqeYs+
         tpS9F57M+V37ghuAq9Hqk3uV85HASk0M/H5cdpkG4ug6fQePW5ZeiGQ39JYXDIOvbyj/
         A1s85CMi6OIeE0C/Kb3zIt7vv3FiG8R11j1roN/yB1L7QFcl6KGk7BmFWYQOpteRx1TP
         lnBDsiOAkkQZeIYlRqPaHKt+johw6fRPi5hqdu44aZvytrvB1SLJuTgJcPBkC1d2Myo9
         IfNLBQjuxVXTMOb5XxN62DX326HWdMYQpxfTxbDnaYMTEQ12ZE8vqvJ5Uq1faHohLW2h
         H3Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LK6AzI+3tyXOpHgonpldm9oWyJ/r5zFqEmGgJhJkwa4=;
        b=T3UuFEhyWU9Q+Nl6sP8eG+rHnIxhat9f2L3Nzmu+JPYUy5D+di0UuGaByfcZ7JRRAn
         t2WE39Y7ehnSZsKiE2d1pDJHzBTy8JqKbZVapbbna4E4Bfv7hDTEzXum5kxvG1gLGt7c
         yIM7FnsZ6FRccSGRvwkZRJlg4tsaA73+wwCKGoZreCj10C7gV7gncqLaqwYG8SDf/qYo
         QeTXcq2nhc/0jJvORfsrXahxWX5xkFb/L1Axqpw+0FeTpcK0zxikUhN31AywQ+YRnqgq
         eAJ4pDLBL4VKwsTn/bOjkY41E7MYp0HTUkKZQQ85/5nGGWW3qh0hqZn0J/kXOI7PDsJj
         1vDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=LK6AzI+3tyXOpHgonpldm9oWyJ/r5zFqEmGgJhJkwa4=;
        b=6jJaeF79wdGkrz08RJc7FelsqNvdecEKW+fb1kKoQF09eaxiKgMrGLgfdTQFELPpHR
         m240gQwTzTK3p2LMujl4CKo73vhfXmP/oKUlTA9qYVauHgRvykLHS1fB5SwPtlooFNjj
         GBA8qHvHogaCwA7eHXD9TuoEzAbh9g1LjxLR4LlaFqareuYzZ2BzV7cvsSbLyeeGy8Ma
         cf+sxmyq5ziWG68N5mIiPHG73nSoY5PAFKgtDc9GTmcC94fbZzmhB+4RDBZdHqAjRCIN
         xqHOW3chTFr4VK7AQYQkeWErGH5/NVM9tdAs1YFmjg27yrhOoMyAGvdz6lxqPqRh92fS
         iKzA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533FH4dZM+O3CxNRYe4Gr64OljXztbFEfN2L8bT0/kB47u6eR1h5
	aJJb5bYxUL1N2JwMT9OLfMM=
X-Google-Smtp-Source: ABdhPJyNwNnhZ6NNyerj4oAhW6gs+Gg4rf1RMSQMiU+yZB8shO+0oR1LRAc7jJs87/m4KgeDJEf9Tw==
X-Received: by 2002:ac8:5c91:: with SMTP id r17mr2033758qta.18.1640090753425;
        Tue, 21 Dec 2021 04:45:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:304:: with SMTP id q4ls11014850qtw.8.gmail; Tue, 21
 Dec 2021 04:45:53 -0800 (PST)
X-Received: by 2002:a05:622a:1a83:: with SMTP id s3mr1930380qtc.497.1640090752957;
        Tue, 21 Dec 2021 04:45:52 -0800 (PST)
Date: Tue, 21 Dec 2021 04:45:51 -0800 (PST)
From: jiajun huang <huangjiajun145041@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <993a2675-8e94-4153-afb6-2324877408f8n@googlegroups.com>
In-Reply-To: <de30fff2-ed9d-4a83-8229-6cfd9a2ac99an@googlegroups.com>
References: <de30fff2-ed9d-4a83-8229-6cfd9a2ac99an@googlegroups.com>
Subject: Re: FATAL: unsupported instruction (0x83 0x00 0x00 0x00) (0xf3 0x00
 0x00 0x00)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_8966_1462594975.1640090751206"
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

------=_Part_8966_1462594975.1640090751206
Content-Type: multipart/alternative; 
	boundary="----=_Part_8967_680126634.1640090751206"

------=_Part_8967_680126634.1640090751206
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=20


Initializing Jailhouse hypervisor v0.12 (294-g6af5edf-dirty) on CPU 5

Code location: 0xfffffffff0000050

Using x2APIC

Page pool usage after early setup: mem 134/32207, remap 0/131072

Initializing processors:

 CPU 5... (APIC ID 34) OK

 CPU 1... (APIC ID 2) OK

 CPU 3... (APIC ID 6) OK

 CPU 0... (APIC ID 0) OK

 CPU 6... (APIC ID 36) OK

 CPU 2... (APIC ID 4) OK

 CPU 7... (APIC ID 38) OK

 CPU 4... (APIC ID 32) OK

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

FATAL: unsupported instruction (0x83 0x00 0x00 0x00)

FATAL: Invalid MMIO/RAM read, addr: 0x00000000538c1020 size: 0

RIP: 0xffffffff91ac0aff RSP: 0xffffa70e496c3af0 FLAGS: 10286

RAX: 0xffff8e13d38c1018 RBX: 0x00000000538c1018 RCX: 0x0000000000000000

RDX: 0x0000000000000001 RSI: 0x0000000000000040 RDI: 0xffff8e13d38c1018

CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1

CR0: 0x0000000080050033 CR3: 0x000000105704a002 CR4: 0x00000000001626e0

EFER: 0x0000000000000d01

Parking CPU 7 (Cell: "RootCell")

FATAL: unsupported instruction (0xf3 0x00 0x00 0x00)

FATAL: Invalid MMIO/RAM write, addr: 0x000000006b7b4800 size: 0

RIP: 0xffffffff91c76ed6 RSP: 0xffffa70e4662f910 FLAGS: 10246

RAX: 0xffff8e13eb7b4800 RBX: 0x0000000000000106 RCX: 0x0000000000000008

RDX: 0x0000000000000008 RSI: 0xffff8e1bda209740 RDI: 0xffff8e13eb7b4800

CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1

CR0: 0x0000000080050033 CR3: 0x00000008b7e0a001 CR4: 0x00000000001626e0

EFER: 0x0000000000000d01

Parking CPU 1 (Cell: "RootCell")



=E5=9C=A82021=E5=B9=B412=E6=9C=8821=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC=
+8 20:43:08<jiajun huang> =E5=86=99=E9=81=93=EF=BC=9A

> Hi everyone,
> When I tried to add two ivshmem PCI devices to the root cell, a "FATAL:=
=20
> unsupported instruction" bug occurred. This bug is caused by=20
> x86_mmio_parse. How can I fix this bug? Below is my root-cell configurati=
on=20
> and log output from the port.
>
> thanks=EF=BC=8C
>  Jiajun
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/993a2675-8e94-4153-afb6-2324877408f8n%40googlegroups.com.

------=_Part_8967_680126634.1640090751206
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable







<p><br></p>
<p>Initializing Jailhouse hypervisor v0.12 (294-g6af5edf-dirty) on CPU 5</p=
>
<p>Code location: 0xfffffffff0000050</p>
<p>Using x2APIC</p>
<p>Page pool usage after early setup: mem 134/32207, remap 0/131072</p>
<p>Initializing processors:</p>
<p>&nbsp;CPU 5... (APIC ID 34) OK</p>
<p>&nbsp;CPU 1... (APIC ID 2) OK</p>
<p>&nbsp;CPU 3... (APIC ID 6) OK</p>
<p>&nbsp;CPU 0... (APIC ID 0) OK</p>
<p>&nbsp;CPU 6... (APIC ID 36) OK</p>
<p>&nbsp;CPU 2... (APIC ID 4) OK</p>
<p>&nbsp;CPU 7... (APIC ID 38) OK</p>
<p>&nbsp;CPU 4... (APIC ID 32) OK</p>
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
<p>FATAL: unsupported instruction (0x83 0x00 0x00 0x00)</p>
<p>FATAL: Invalid MMIO/RAM read, addr: 0x00000000538c1020 size: 0</p>
<p>RIP: 0xffffffff91ac0aff RSP: 0xffffa70e496c3af0 FLAGS: 10286</p>
<p>RAX: 0xffff8e13d38c1018 RBX: 0x00000000538c1018 RCX: 0x0000000000000000<=
/p>
<p>RDX: 0x0000000000000001 RSI: 0x0000000000000040 RDI: 0xffff8e13d38c1018<=
/p>
<p>CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1</p>
<p>CR0: 0x0000000080050033 CR3: 0x000000105704a002 CR4: 0x00000000001626e0<=
/p>
<p>EFER: 0x0000000000000d01</p>
<p>Parking CPU 7 (Cell: "RootCell")</p>
<p>FATAL: unsupported instruction (0xf3 0x00 0x00 0x00)</p>
<p>FATAL: Invalid MMIO/RAM write, addr: 0x000000006b7b4800 size: 0</p>
<p>RIP: 0xffffffff91c76ed6 RSP: 0xffffa70e4662f910 FLAGS: 10246</p>
<p>RAX: 0xffff8e13eb7b4800 RBX: 0x0000000000000106 RCX: 0x0000000000000008<=
/p>
<p>RDX: 0x0000000000000008 RSI: 0xffff8e1bda209740 RDI: 0xffff8e13eb7b4800<=
/p>
<p>CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1</p>
<p>CR0: 0x0000000080050033 CR3: 0x00000008b7e0a001 CR4: 0x00000000001626e0<=
/p>
<p>EFER: 0x0000000000000d01</p>
<p>Parking CPU 1 (Cell: "RootCell")</p>
<p><br></p><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_=
attr">=E5=9C=A82021=E5=B9=B412=E6=9C=8821=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=
=8C UTC+8 20:43:08&lt;jiajun huang> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><=
blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left:=
 1px solid rgb(204, 204, 204); padding-left: 1ex;">Hi everyone,<div>When I =
tried to add two ivshmem PCI devices to the root cell, a &quot;FATAL: unsup=
ported instruction&quot; bug occurred. This bug is caused by x86_mmio_parse=
. How can I fix this bug? Below is my root-cell configuration and log outpu=
t from the port.<div><br></div><div>thanks=EF=BC=8C</div><div>=C2=A0Jiajun<=
/div></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/993a2675-8e94-4153-afb6-2324877408f8n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/993a2675-8e94-4153-afb6-2324877408f8n%40googlegroups.co=
m</a>.<br />

------=_Part_8967_680126634.1640090751206--

------=_Part_8966_1462594975.1640090751206
Content-Type: text/x-csrc; charset=US-ASCII; name="sysconfig (1).c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="sysconfig (1).c"
X-Attachment-Id: 1ab8b41e-58b2-41ff-8539-b27a3144ffb7
Content-ID: <1ab8b41e-58b2-41ff-8539-b27a3144ffb7>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) Siemens AG, 2014-2017
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * Alternatively, you can use or redistribute this file under the following
 * BSD license:
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Configuration for langchao NP5020M3
 * created with '/usr/local/libexec/jailhouse/jailhouse config create -c ttyS0 --mem-hv 128M --mem-inmates 1536M configs/x86/sysconfig.c'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x68000000$0x572000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[49];
	struct jailhouse_irqchip irqchips[3];
	struct jailhouse_pio pio_regions[16];
	struct jailhouse_pci_device pci_devices[97];
	struct jailhouse_pci_capability pci_caps[55];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x572000000,
			.size = 0x8000000,
		},
		.debug_console = {
			.address = 0x3f8,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},
		.platform_info = {
			.pci_mmconfig_base = 0x80000000,
			.pci_mmconfig_end_bus = 0xff,
			.iommu_units = {
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xfbffe000,
					.size = 0x1000,
				},
				{
					.type = JAILHOUSE_IOMMU_INTEL,
					.base = 0xdfffc000,
					.size = 0x1000,
				},
			},
			.x86 = {
				.pm_timer_address = 0x408,
				.vtd_interrupt_limit = 256,
			},
		},
		.root_cell = {
			.name = "RootCell",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
		},
	},

	.cpus = {
		0x00000000000000ff,
	},

	.mem_regions = {
		/* MemRegion: 00000000-0009ffff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0xa0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 000f0000-000fffff : System ROM */
		{
			.phys_start = 0xf0000,
			.virt_start = 0xf0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 00100000-538a8017 : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0x537a9000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 538a8018-538b0057 : System RAM */
		{
			.phys_start = 0x538a8018,
			.virt_start = 0x538a8018,
			.size = 0x9000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 538b0058-538b1017 : System RAM */
		{
			.phys_start = 0x538b0058,
			.virt_start = 0x538b0058,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 538b1018-538c0857 : System RAM */
		{
			.phys_start = 0x538b1018,
			.virt_start = 0x538b1018,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 538c0858-538c1017 : System RAM */
		{
			.phys_start = 0x538c0858,
			.virt_start = 0x538c0858,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 538c1018-538d0857 : System RAM */
		{
			.phys_start = 0x538c1018,
			.virt_start = 0x538c1018,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 538d0858-7df97fff : System RAM */
		{
			.phys_start = 0x538d0858,
			.virt_start = 0x538d0858,
			.size = 0x2a6c8000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7dfa7020-7dfd6fff : ACPI Tables */
		{
			.phys_start = 0x7dfa7020,
			.virt_start = 0x7dfa7020,
			.size = 0x2ffdf,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7dfd7000-7e0ecfff : ACPI Tables */
		{
			.phys_start = 0x7dfd7000,
			.virt_start = 0x7dfd7000,
			.size = 0x116000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7e0ed000-7e2f2fff : ACPI Non-volatile Storage */
		{
			.phys_start = 0x7e0ed000,
			.virt_start = 0x7e0ed000,
			.size = 0x206000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7f337000-7f337fff : System RAM */
		{
			.phys_start = 0x7f337000,
			.virt_start = 0x7f337000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7f338000-7f3bdfff : ACPI Non-volatile Storage */
		{
			.phys_start = 0x7f338000,
			.virt_start = 0x7f338000,
			.size = 0x86000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7f3be000-7f7fffff : System RAM */
		{
			.phys_start = 0x7f3be000,
			.virt_start = 0x7f3be000,
			.size = 0x442000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 7f800000-7fffffff : RAM buffer */
		{
			.phys_start = 0x7f800000,
			.virt_start = 0x7f800000,
			.size = 0x800000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: d8000000-dbffffff : 0000:09:00.0 */
		{
			.phys_start = 0xd8000000,
			.virt_start = 0xd8000000,
			.size = 0x4000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc000000-dc01ffff : 0000:09:00.0 */
		{
			.phys_start = 0xdc000000,
			.virt_start = 0xdc000000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc100000-dc11ffff : e1000e */
		{
			.phys_start = 0xdc100000,
			.virt_start = 0xdc100000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc121000-dc123fff : e1000e */
		{
			.phys_start = 0xdc121000,
			.virt_start = 0xdc121000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc200000-dc21ffff : e1000e */
		{
			.phys_start = 0xdc200000,
			.virt_start = 0xdc200000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc221000-dc223fff : e1000e */
		{
			.phys_start = 0xdc221000,
			.virt_start = 0xdc221000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc300000-dc3000ff : 0000:00:1f.3 */
		{
			.phys_start = 0xdc300000,
			.virt_start = 0xdc300000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc301000-dc3017ff : ahci */
		{
			.phys_start = 0xdc301000,
			.virt_start = 0xdc301000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc302000-dc3023ff : ehci_hcd */
		{
			.phys_start = 0xdc302000,
			.virt_start = 0xdc302000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc303000-dc3033ff : ehci_hcd */
		{
			.phys_start = 0xdc303000,
			.virt_start = 0xdc303000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dc307000-dc307fff : 0000:00:05.4 */
		{
			.phys_start = 0xdc307000,
			.virt_start = 0xdc307000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fbf00000-fbf00fff : 0000:80:05.4 */
		{
			.phys_start = 0xfbf00000,
			.virt_start = 0xfbf00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fc000000-fcffffff : pnp 00:00 */
		{
			.phys_start = 0xfc000000,
			.virt_start = 0xfc000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fd000000-fdffffff : pnp 00:00 */
		{
			.phys_start = 0xfd000000,
			.virt_start = 0xfd000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fe000000-feafffff : pnp 00:00 */
		{
			.phys_start = 0xfe000000,
			.virt_start = 0xfe000000,
			.size = 0xb00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: feb00000-febfffff : pnp 00:00 */
		{
			.phys_start = 0xfeb00000,
			.virt_start = 0xfeb00000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed00000-fed003ff : PNP0103:00 */
		{
			.phys_start = 0xfed00000,
			.virt_start = 0xfed00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed08000-fed08fff : pnp 00:07 */
		{
			.phys_start = 0xfed08000,
			.virt_start = 0xfed08000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed45000-fedfffff : pnp 00:00 */
		{
			.phys_start = 0xfed45000,
			.virt_start = 0xfed45000,
			.size = 0xbb000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 100000000-537dfffff : System RAM */
		{
			.phys_start = 0x100000000,
			.virt_start = 0x100000000,
			.size = 0x437e00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 537e00000-539ffffff : Kernel */
		{
			.phys_start = 0x537e00000,
			.virt_start = 0x537e00000,
			.size = 0x2200000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 53a000000-571ffffff : System RAM */
		{
			.phys_start = 0x53a000000,
			.virt_start = 0x53a000000,
			.size = 0x38000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 5da000000-107fffffff : System RAM */
		{
			.phys_start = 0x5da000000,
			.virt_start = 0x5da000000,
			.size = 0xaa6000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 000c0000-000dffff : ROMs */
		{
			.phys_start = 0xc0000,
			.virt_start = 0xc0000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 7dfad000-7dfb9fff : ACPI DMAR RMRR */
		/* PCI device: 00:1d.0 */
		/* PCI device: 00:1a.0 */
		{
			.phys_start = 0x7dfad000,
			.virt_start = 0x7dfad000,
			.size = 0xd000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 57a000000-5d9ffffff : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x57a000000,
			.virt_start = 0x57a000000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x57a001000,
			.virt_start = 0x57a001000,
			.size =       0x40000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x5ba001000,
			.virt_start = 0x5ba001000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_ROOTSHARED,
		},
		{
			.phys_start = 0x5ba005000,
			.virt_start = 0x5ba005000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
		},
		JAILHOUSE_SHMEM_NET_REGIONS(0x5ba205000, 0),
	},

	.irqchips = {
		/* IOAPIC 0, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0x100ff,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 2, GSI base 24 */
		{
			.address = 0xfec01000,
			.id = 0x1002c,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 3, GSI base 48 */
		{
			.address = 0xfec40000,
			.id = 0x802c,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pio_regions = {
		/* Port I/O: 0000-001f : dma1 */
		/* PIO_RANGE(0x0, 0x20), */
		/* Port I/O: 0020-0021 : pic1 */
		/* PIO_RANGE(0x20, 0x2), */
		/* Port I/O: 0040-0043 : timer0 */
		PIO_RANGE(0x40, 0x4),
		/* Port I/O: 0050-0053 : timer1 */
		/* PIO_RANGE(0x50, 0x4), */
		/* Port I/O: 0060-0060 : keyboard */
		PIO_RANGE(0x60, 0x1),
		/* Port I/O: 0061-0061 : PNP0800:00 */
		PIO_RANGE(0x61, 0x1),
		/* Port I/O: 0064-0064 : keyboard */
		PIO_RANGE(0x64, 0x1),
		/* Port I/O: 0070-0071 : rtc0 */
		PIO_RANGE(0x70, 0x2),
		/* Port I/O: 0080-008f : dma page reg */
		/* PIO_RANGE(0x80, 0x10), */
		/* Port I/O: 00a0-00a1 : pic2 */
		/* PIO_RANGE(0xa0, 0x2), */
		/* Port I/O: 00b2-00b2 : APEI ERST */
		/* PIO_RANGE(0xb2, 0x1), */
		/* Port I/O: 00c0-00df : dma2 */
		/* PIO_RANGE(0xc0, 0x20), */
		/* Port I/O: 00f0-00ff : fpu */
		/* PIO_RANGE(0xf0, 0x10), */
		/* Port I/O: 02f8-02ff : serial */
		PIO_RANGE(0x2f8, 0x8),
		/* Port I/O: 03b0-03df : PCI Bus 0000:00 */
		/* PIO_RANGE(0x3b0, 0x30), */
		/* Port I/O: 03f8-03ff : serial */
		PIO_RANGE(0x3f8, 0x8),
		/* Port I/O: 0400-0403 : ACPI PM1a_EVT_BLK */
		/* PIO_RANGE(0x400, 0x4), */
		/* Port I/O: 0404-0405 : ACPI PM1a_CNT_BLK */
		/* PIO_RANGE(0x404, 0x2), */
		/* Port I/O: 0408-040b : ACPI PM_TMR */
		/* PIO_RANGE(0x408, 0x4), */
		/* Port I/O: 0420-042f : ACPI GPE0_BLK */
		/* PIO_RANGE(0x420, 0x10), */
		/* Port I/O: 0430-0433 : iTCO_wdt.1.auto */
		/* PIO_RANGE(0x430, 0x4), */
		/* Port I/O: 0450-0450 : ACPI PM2_CNT_BLK */
		/* PIO_RANGE(0x450, 0x1), */
		/* Port I/O: 0454-0457 : pnp 00:08 */
		/* PIO_RANGE(0x454, 0x4), */
		/* Port I/O: 0460-047f : iTCO_wdt.1.auto */
		/* PIO_RANGE(0x460, 0x20), */
		/* Port I/O: 04d0-04d1 : pnp 00:06 */
		/* PIO_RANGE(0x4d0, 0x2), */
		/* Port I/O: 0500-057f : pnp 00:07 */
		/* PIO_RANGE(0x500, 0x80), */
		/* Port I/O: 0a00-0a1f : pnp 00:02 */
		/* PIO_RANGE(0xa00, 0x20), */
		/* Port I/O: 6000-607f : 0000:09:00.0 */
		PIO_RANGE(0x6000, 0x80),
		/* Port I/O: 7000-701f : 0000:07:00.0 */
		PIO_RANGE(0x7000, 0x20),
		/* Port I/O: 8000-801f : 0000:06:00.0 */
		PIO_RANGE(0x8000, 0x20),
		/* Port I/O: 9000-901f : 0000:00:1f.3 */
		PIO_RANGE(0x9000, 0x20),
		/* Port I/O: 9020-903f : 0000:00:1f.2 */
		PIO_RANGE(0x9020, 0x20),
		/* Port I/O: 9040-9043 : 0000:00:1f.2 */
		PIO_RANGE(0x9040, 0x4),
		/* Port I/O: 9050-9057 : 0000:00:1f.2 */
		PIO_RANGE(0x9050, 0x8),
		/* Port I/O: 9060-9063 : 0000:00:1f.2 */
		PIO_RANGE(0x9060, 0x4),
		/* Port I/O: 9070-9077 : 0000:00:1f.2 */
		PIO_RANGE(0x9070, 0x8),
	},

	.pci_devices = {
		/* PCIDevice: 00:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 6,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		{ 
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x17 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 16,
			.shmem_regions_start = 41,
			.shmem_dev_id = 0,
			.shmem_peers = 2,
			.shmem_protocol = 0x0002,
		},
		{ 
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x18 << 3,
			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
			.num_msix_vectors = 3,
			.shmem_regions_start = 45,
			.shmem_dev_id = 0,
			.shmem_peers = 2,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
		},
		/* PCIDevice: 00:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:01.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x9,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:03.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x18,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:03.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x1a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:05.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x28,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:05.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x2a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:05.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x2c,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 18,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:11.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x88,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 21,
			.num_caps = 6,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1a.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xd0,
			.bar_mask = {
				0xfffffc00, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 27,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1c.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 5,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1c.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe1,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 5,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1c.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe3,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 30,
			.num_caps = 5,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1d.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xe8,
			.bar_mask = {
				0xfffffc00, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 27,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xf0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 35,
			.num_caps = 1,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xf8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 36,
			.num_caps = 1,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xfa,
			.bar_mask = {
				0xfffffff8, 0xfffffffc, 0xfffffff8,
				0xfffffffc, 0xffffffe0, 0xfffff800,
			},
			.caps_start = 37,
			.num_caps = 4,
			.num_msi_vectors = 1,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:1f.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xfb,
			.bar_mask = {
				0xffffff00, 0xffffffff, 0x00000000,
				0x00000000, 0xffffffe0, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 06:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x600,
			.bar_mask = {
				0xfffe0000, 0x00000000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 41,
			.num_caps = 6,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 5,
			.msix_region_size = 0x1000,
			.msix_address = 0xdc220000,
		},
		/* PCIDevice: 07:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x700,
			.bar_mask = {
				0xfffe0000, 0x00000000, 0xffffffe0,
				0xffffc000, 0x00000000, 0x00000000,
			},
			.caps_start = 41,
			.num_caps = 6,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 5,
			.msix_region_size = 0x1000,
			.msix_address = 0xdc120000,
		},
		/* PCIDevice: 08:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x800,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 47,
			.num_caps = 5,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 09:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x900,
			.bar_mask = {
				0xfc000000, 0xfffe0000, 0xffffff80,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 52,
			.num_caps = 1,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f40,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:09.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f48,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0a.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f50,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0a.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f51,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0a.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f52,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0a.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f53,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0b.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f58,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0b.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f5b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0c.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f60,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0c.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f61,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0d.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f68,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0d.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f69,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f70,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0e.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f71,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f78,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0f.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f79,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0f.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f7a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0f.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f7b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0f.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f7c,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:0f.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f7d,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:10.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f80,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:10.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f81,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:10.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f82,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:10.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f83,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:10.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f84,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:10.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f85,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:10.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f86,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:10.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f87,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:13.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f98,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:13.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f99,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:13.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f9c,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:13.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7f9d,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:16.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7fb0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:16.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7fb1,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 7f:16.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x7fb2,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 80:03.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x8018,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 80:03.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x801a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 6,
			.num_caps = 10,
			.num_msi_vectors = 2,
			.msi_64bits = 0,
			.msi_maskable = 1,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 80:05.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x8028,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 80:05.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x802a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 16,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 80:05.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0x802c,
			.bar_mask = {
				0xfffff000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 18,
			.num_caps = 3,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff40,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:09.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff48,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0a.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff50,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0a.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff51,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0a.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff52,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0a.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff53,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0b.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff58,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0b.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff5b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0c.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff60,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0c.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff61,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0d.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff68,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0d.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff69,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0e.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff70,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0e.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff71,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0f.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff78,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0f.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff79,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0f.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff7a,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0f.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff7b,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0f.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff7c,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:0f.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff7d,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:10.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff80,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:10.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff81,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:10.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff82,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:10.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff83,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:10.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff84,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:10.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff85,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:10.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff86,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:10.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff87,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 53,
			.num_caps = 2,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:13.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff98,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:13.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff99,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:13.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff9c,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:13.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xff9d,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:16.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xffb0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:16.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xffb1,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: ff:16.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 1,
			.domain = 0x0,
			.bdf = 0xffb2,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
	},

	.pci_caps = {
		/* PCIDevice: 00:00.0 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x90,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xe0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x144,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1d0,
			.len = 0xe,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x280,
			.len = 0x1c,
			.flags = 0,
		},
		/* PCIDevice: 00:01.0 */
		/* PCIDevice: 00:01.1 */
		/* PCIDevice: 00:03.0 */
		/* PCIDevice: 00:03.2 */
		/* PCIDevice: 80:03.0 */
		/* PCIDevice: 80:03.2 */
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x40,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x60,
			.len = 0x14,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x90,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xe0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x110,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x148,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x1d0,
			.len = 0xe,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x250,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x280,
			.len = 0x1c,
			.flags = 0,
		},
		/* PCIDevice: 00:05.0 */
		/* PCIDevice: 00:05.2 */
		/* PCIDevice: 80:05.0 */
		/* PCIDevice: 80:05.2 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:05.4 */
		/* PCIDevice: 80:05.4 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x44,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xe0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:11.0 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x80,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x88,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x90,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x138,
			.len = 0x8,
			.flags = 0,
		},
		/* PCIDevice: 00:1a.0 */
		/* PCIDevice: 00:1d.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_DBG,
			.start = 0x58,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_AF,
			.start = 0x98,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:1c.0 */
		/* PCIDevice: 00:1c.1 */
		/* PCIDevice: 00:1c.3 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x90,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xa0,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:1e.0 */
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0x50,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:1f.0 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0xe0,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 00:1f.2 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x80,
			.len = 0xa,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x70,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SATA,
			.start = 0xa8,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_AF,
			.start = 0xb0,
			.len = 0x2,
			.flags = 0,
		},
		/* PCIDevice: 06:00.0 */
		/* PCIDevice: 07:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0xc8,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xd0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0xe0,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xa0,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0xc,
			.flags = 0,
		},
		/* PCIDevice: 08:00.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x78,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x80,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0xa4,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x10,
			.flags = 0,
		},
		/* PCIDevice: 09:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		/* PCIDevice: 7f:0f.0 */
		/* PCIDevice: 7f:0f.1 */
		/* PCIDevice: 7f:0f.2 */
		/* PCIDevice: 7f:0f.3 */
		/* PCIDevice: 7f:0f.4 */
		/* PCIDevice: 7f:0f.5 */
		/* PCIDevice: 7f:10.0 */
		/* PCIDevice: 7f:10.1 */
		/* PCIDevice: 7f:10.2 */
		/* PCIDevice: 7f:10.3 */
		/* PCIDevice: 7f:10.4 */
		/* PCIDevice: 7f:10.5 */
		/* PCIDevice: 7f:10.6 */
		/* PCIDevice: 7f:10.7 */
		/* PCIDevice: ff:0f.0 */
		/* PCIDevice: ff:0f.1 */
		/* PCIDevice: ff:0f.2 */
		/* PCIDevice: ff:0f.3 */
		/* PCIDevice: ff:0f.4 */
		/* PCIDevice: ff:0f.5 */
		/* PCIDevice: ff:10.0 */
		/* PCIDevice: ff:10.1 */
		/* PCIDevice: ff:10.2 */
		/* PCIDevice: ff:10.3 */
		/* PCIDevice: ff:10.4 */
		/* PCIDevice: ff:10.5 */
		/* PCIDevice: ff:10.6 */
		/* PCIDevice: ff:10.7 */
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x40,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = 0x0 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x4,
			.flags = 0,
		},
	},
};

------=_Part_8966_1462594975.1640090751206
Content-Type: text/rtf; charset=utf8; name=log.rtf
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=log.rtf
X-Attachment-Id: dd00e50e-9dd1-4831-b489-2175e2546e87
Content-ID: <dd00e50e-9dd1-4831-b489-2175e2546e87>

{\rtf1\ansi\ansicpg936\deff0\deflang1033\deflangfe2052{\fonttbl{\f0\fmodern=
 Consolas;}{\f1\fnil\fcharset129 Courier New;}}
{\colortbl ;\red20\green20\blue20;\red142\green142\blue142;}
\viewkind4\uc1\pard\cf1\highlight2\lang2052\f0\fs20=20
\par \cf0\highlight0 Initializing Jailhouse hypervisor v0.12 (294-g6af5edf-=
dirty) on CPU 5\cf1\highlight2=20
\par \cf0\highlight0 Code location: 0xfffffffff0000050\cf1\highlight2=20
\par \cf0\highlight0 Using x2APIC\cf1\highlight2=20
\par \cf0\highlight0 Page pool usage after early setup: mem 134/32207, rema=
p 0/131072\cf1\highlight2=20
\par \cf0\highlight0 Initializing processors:\cf1\highlight2=20
\par \cf0\highlight0  CPU 5... (APIC ID 34) OK\cf1\highlight2=20
\par \cf0\highlight0  CPU 1... (APIC ID 2) OK\cf1\highlight2=20
\par \cf0\highlight0  CPU 3... (APIC ID 6) OK\cf1\highlight2=20
\par \cf0\highlight0  CPU 0... (APIC ID 0) OK\cf1\highlight2=20
\par \cf0\highlight0  CPU 6... (APIC ID 36) OK\cf1\highlight2=20
\par \cf0\highlight0  CPU 2... (APIC ID 4) OK\cf1\highlight2=20
\par \cf0\highlight0  CPU 7... (APIC ID 38) OK\cf1\highlight2=20
\par \cf0\highlight0  CPU 4... (APIC ID 32) OK\cf1\highlight2=20
\par \cf0\highlight0 Initializing unit: VT-d\cf1\highlight2=20
\par \cf0\highlight0 DMAR unit @0xfbffe000/0x1000\cf1\highlight2=20
\par \cf0\highlight0 DMAR unit @0xdfffc000/0x1000\cf1\highlight2=20
\par \cf0\highlight0 Reserving 24 interrupt(s) for device 00:1f.7 at index =
0\cf1\highlight2=20
\par \cf0\highlight0 Reserving 24 interrupt(s) for device 00:05.4 at index =
24\cf1\highlight2=20
\par \cf0\highlight0 Reserving 24 interrupt(s) for device 80:05.4 at index =
48\cf1\highlight2=20
\par \cf0\highlight0 Initializing unit: IOAPIC\cf1\highlight2=20
\par \cf0\highlight0 Initializing unit: Cache Allocation Technology\cf1\hig=
hlight2=20
\par \cf0\highlight0 Initializing unit: PCI\cf1\highlight2=20
\par \cf0\highlight0 Adding PCI device 00:00.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding virtual PCI device 00:17.0 to cell "RootCell"\c=
f1\highlight2=20
\par \cf0\highlight0 Adding virtual PCI device 00:18.0 to cell "RootCell"\c=
f1\highlight2=20
\par \cf0\highlight0 Adding PCI device 00:01.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Reserving 2 interrupt(s) for device 00:01.0 at index 7=
2\cf1\highlight2=20
\par \cf0\highlight0 Adding PCI device 00:01.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Reserving 2 interrupt(s) for device 00:01.1 at index 7=
4\cf1\highlight2=20
\par \cf0\highlight0 Adding PCI device 00:03.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Reserving 2 interrupt(s) for device 00:03.0 at index 7=
6\cf1\highlight2=20
\par \cf0\highlight0 Adding PCI device 00:03.2 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Reserving 2 interrupt(s) for device 00:03.2 at index 7=
8\cf1\highlight2=20
\par \cf0\highlight0 Adding PCI device 00:05.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 00:05.2 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 00:05.4 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 00:11.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Reserving 1 interrupt(s) for device 00:11.0 at index 8=
0\cf1\highlight2=20
\par \cf0\highlight0 Adding PCI device 00:1a.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 00:1c.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Reserving 1 interrupt(s) for device 00:1c.0 at index 8=
1\cf1\highlight2=20
\par \cf0\highlight0 Adding PCI device 00:1c.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Reserving 1 interrupt(s) for device 00:1c.1 at index 8=
2\cf1\highlight2=20
\par \cf0\highlight0 Adding PCI device 00:1c.3 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Reserving 1 interrupt(s) for device 00:1c.3 at index 8=
3\cf1\highlight2=20
\par \cf0\highlight0 Adding PCI device 00:1d.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 00:1e.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 00:1f.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 00:1f.2 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Reserving 1 interrupt(s) for device 00:1f.2 at index 8=
4\cf1\highlight2=20
\par \cf0\highlight0 Adding PCI device 00:1f.3 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 06:00.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Reserving 5 interrupt(s) for device 06:00.0 at index 8=
5\cf1\highlight2=20
\par \cf0\highlight0 Adding PCI device 07:00.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Reserving 5 interrupt(s) for device 07:00.0 at index 9=
0\cf1\highlight2=20
\par \cf0\highlight0 Adding PCI device 08:00.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Reserving 1 interrupt(s) for device 08:00.0 at index 9=
5\cf1\highlight2=20
\par \cf0\highlight0 Adding PCI device 09:00.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:08.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:09.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0a.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0a.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0a.2 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0a.3 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0b.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0b.3 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0c.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0c.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0d.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0d.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0e.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0e.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0f.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0f.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0f.2 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0f.3 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0f.4 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:0f.5 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:10.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:10.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:10.2 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:10.3 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:10.4 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:10.5 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:10.6 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:10.7 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:13.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:13.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:13.4 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:13.5 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:16.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:16.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 7f:16.2 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 80:03.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Reserving 2 interrupt(s) for device 80:03.0 at index 9=
6\cf1\highlight2=20
\par \cf0\highlight0 Adding PCI device 80:03.2 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Reserving 2 interrupt(s) for device 80:03.2 at index 9=
8\cf1\highlight2=20
\par \cf0\highlight0 Adding PCI device 80:05.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 80:05.2 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device 80:05.4 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:08.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:09.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0a.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0a.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0a.2 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0a.3 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0b.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0b.3 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0c.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0c.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0d.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0d.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0e.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0e.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0f.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0f.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0f.2 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0f.3 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0f.4 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:0f.5 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:10.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:10.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:10.2 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:10.3 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:10.4 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:10.5 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:10.6 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:10.7 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:13.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:13.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:13.4 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:13.5 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:16.0 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:16.1 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Adding PCI device ff:16.2 to cell "RootCell"\cf1\highl=
ight2=20
\par \cf0\highlight0 Page pool usage after late setup: mem 469/32207, remap=
 65549/131072\cf1\highlight2=20
\par \cf0\highlight0 Activating hypervisor\cf1\highlight2=20
\par \cf0\highlight0 FATAL: unsupported instruction (0x83 0x00 0x00 0x00)\c=
f1\highlight2=20
\par \cf0\highlight0 FATAL: Invalid MMIO/RAM read, addr: 0x00000000538c1020=
 size: 0\cf1\highlight2=20
\par \cf0\highlight0 RIP: 0xffffffff91ac0aff RSP: 0xffffa70e496c3af0 FLAGS:=
 10286\cf1\highlight2=20
\par \cf0\highlight0 RAX: 0xffff8e13d38c1018 RBX: 0x00000000538c1018 RCX: 0=
x0000000000000000\cf1\highlight2=20
\par \cf0\highlight0 RDX: 0x0000000000000001 RSI: 0x0000000000000040 RDI: 0=
xffff8e13d38c1018\cf1\highlight2=20
\par \cf0\highlight0 CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LM=
A 1\cf1\highlight2=20
\par \cf0\highlight0 CR0: 0x0000000080050033 CR3: 0x000000105704a002 CR4: 0=
x00000000001626e0\cf1\highlight2=20
\par \cf0\highlight0 EFER: 0x0000000000000d01\cf1\highlight2=20
\par \cf0\highlight0 Parking CPU 7 (Cell: "RootCell")\cf1\highlight2=20
\par \cf0\highlight0 FATAL: unsupported instruction (0xf3 0x00 0x00 0x00)\c=
f1\highlight2=20
\par \cf0\highlight0 FATAL: Invalid MMIO/RAM write, addr: 0x000000006b7b480=
0 size: 0\cf1\highlight2=20
\par \cf0\highlight0 RIP: 0xffffffff91c76ed6 RSP: 0xffffa70e4662f910 FLAGS:=
 10246\cf1\highlight2=20
\par \cf0\highlight0 RAX: 0xffff8e13eb7b4800 RBX: 0x0000000000000106 RCX: 0=
x0000000000000008\cf1\highlight2=20
\par \cf0\highlight0 RDX: 0x0000000000000008 RSI: 0xffff8e1bda209740 RDI: 0=
xffff8e13eb7b4800\cf1\highlight2=20
\par \cf0\highlight0 CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LM=
A 1\cf1\highlight2=20
\par \cf0\highlight0 CR0: 0x0000000080050033 CR3: 0x00000008b7e0a001 CR4: 0=
x00000000001626e0\cf1\highlight2=20
\par \cf0\highlight0 EFER: 0x0000000000000d01\cf1\highlight2=20
\par \cf0\highlight0 Parking CPU 1 (Cell: "RootCell")\cf1\highlight2=20
\par \pard\cf0\highlight0\f1\fs14=20
\par }
=00
------=_Part_8966_1462594975.1640090751206--
