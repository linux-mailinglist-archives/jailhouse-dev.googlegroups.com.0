Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBNOHUHWQKGQETBOVVJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA50DAD53
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 14:51:02 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id p6sf1010470wmc.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Oct 2019 05:51:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571316662; cv=pass;
        d=google.com; s=arc-20160816;
        b=n3IRja81mOUqBmOVj01mvepgxRTpGPEiosTJO67RXnpIOEGU+exzmFAzaI4K5N57Bg
         XNvtmDc4JecGSFrhzY/VRBXG5vDH9wJ0bE2SjivQAA7PF+5plrQzd9iKbCY1DfvrOB8Q
         vDW/LjyAhx/+9YdLemYZfOLgT6f1JhNcaIE80oMTKw82MAeWSQYCUELS6v76F45qj7St
         X9K4nevoz8XeMShjy6JmY1xF8JNEqOoA7/KaI0u8pqJO3xrDDIzjyitTv39qrEFLXEP8
         3+WF1ZsOH1J7JCwXrXTZpPeknOK6C1T27mzZzOWE3xL0IYpWT2JG45jlJw1XyAm1A+vM
         vm+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=Vx+edYv2HdhA4Hl9pIvoIWvqVEEQ5zWIHnnwhHIH8Xs=;
        b=EsgxtWXRq/K3vrMCLHVqXtxoOa1GlDmNRYgHLexRrnkP+K0ZZkU042Q8szQwaly3we
         GmxJP3EH3OWt8QchFXI/iQSUt2UVrpIiel0kVK6BmvY1BJzOdj8ThV8h290dOMIkAp08
         Uuak+D83HOucPejcie485IOo3Ak7JKklBELruClMhZLuQ/s21Ban5+T0uuIu09Hv+j0V
         Zjg0ZmTT+lcLc58TwtsLzm/3bfeWhAeAmMwLR/yfqsIgZFMZ1UfYI5hgN0irJXBBhzTE
         E8GEjrIG/lWzjTC2PrmcAdX9ew2b/tUK1F6e4m5FpgtG27nrCjWknAZhHmHZ9kpjJQuU
         tqQQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Vx+edYv2HdhA4Hl9pIvoIWvqVEEQ5zWIHnnwhHIH8Xs=;
        b=Mu9AIePYpDkhzagHTrp5e+u91JmBDIBNP+Afv3zYbdWPotbdC741RA6YF0bUDkjP5C
         oHcXz+I9Pkz4KS8zI9AGjdUuGVpKE40daOeX8a9c9o0kl42tQxEmyfAOuaiAEX3KZh9k
         0iy6PniTDCUeSultvZid8srUDxCMUvODUkITqYJ24IbrUp4uC2PGz3A1zgw70icTyrdZ
         qb9ID7eio79AlNstEitcdU3klV6PkRPGk+hILGyFSuALT+NCwW+GexrYOjUuzEXs7VXb
         gT1sbVLIYDAiyZLDK1jYOj80og3TitYsTJp8KogrJR3Ey1JPhXc5FQbspRdfUUCarGat
         baMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Vx+edYv2HdhA4Hl9pIvoIWvqVEEQ5zWIHnnwhHIH8Xs=;
        b=Esw1sd3MzafkTZTb1ikUxh9rLSqM+VXVpliY6GmmqHcDrpvzkhvGdBHFMSCCv9AzbW
         OJqQd4dzq4PJzbfL4Uqb+wkYySUsK5xfEW5C6ZGEinQzSfEsZnbcYUhrj7Yy037Nq8pa
         lydgVjnimjonpESPS1h8pVmjcEraIio94ln0Fm65N37IdtzYdw47R6g3Jjl+Vb0/51IN
         aV4wO7gYMLy5hiX1Pz23dWNoaIveG5cgktQ+vh9t+YmiQAYAhTtT/k3JSx0K2B161i5j
         oKMR9TMXVR9EmqbzhZ1WIwLy9fXPNsThBo6FP7qlLJqRJ01sojOTOFGKyTo1Y1ZGk7/S
         tMFw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVWIqrSoo7QFirmVzo0UunvYt2aITJIB5dtOypAcCxbudfrMuSg
	meOaj59tQAY++9YYf64FmtM=
X-Google-Smtp-Source: APXvYqzcKJwHmgDQ/Ahaav+w5D3fMB3jTgrNYvaiP87yAjPWuNCYYcmAWQrfJ/2zhywOXWc12NbpEQ==
X-Received: by 2002:adf:910d:: with SMTP id j13mr2906304wrj.128.1571316662006;
        Thu, 17 Oct 2019 05:51:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:12ca:: with SMTP id l10ls951468wrx.16.gmail; Thu,
 17 Oct 2019 05:51:01 -0700 (PDT)
X-Received: by 2002:a5d:6447:: with SMTP id d7mr2922400wrw.247.1571316661107;
        Thu, 17 Oct 2019 05:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571316661; cv=none;
        d=google.com; s=arc-20160816;
        b=x9S9d5rxBV6YsWA/mygmMCBZbS4GTe6AtVRURhu765fWahPA1CenJivEPA59RMfGYx
         BjgpKA/vLFR6rtKEBjUkMvfS77GB6ZJlzcQ0KD+5QaUu4qKTse+kaqNq0ech/sClL55F
         bhiRUCthZ9xjDI7pQfqdS8fNIrrj0CkPVhxvupmBi/NJx2Pq72V4cny9/KdB8foRMRJn
         t0P7UmkSr/SQt9D7hNvxJC7ftedQ69ATKSGArxhe6MzLe5e6KF2e9kg4ltfDPADVWJby
         0srXLugwU5WbU7lLv3nOgDkK01vg8hed57IqVZS53Cb0VGhfEkTUcDyaNk82yoiL6KTG
         CO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=pGDFntR1DTDen8Jv3VgTk7yc9d3wX11cbsK9MhZJzcQ=;
        b=rfoFnTgzj8Fa1MWV+lGOcknUnSumBbY2uhIqUEfXTL+VCv9+Ci7teA2yy17dDXPb0a
         4SwkvH1M31pOpAnKw8r8pubfTjlUpSOlrbroNV+ihZ1v45M40t2ZqfWXohQ2ocRBmPqM
         n/OXoQLUPAMAzUZ6E1a81ywNs5pe+seCJAgvtqKjhIB7JxpGgFfWCC1bywiOAqd5K/BT
         BP625NB10cBNrc510CkJpxsI9LaaQA3EIjuheylbtEyF1+02xLM/+SrRGaQFuKKpkRl6
         txckYP4jAtqeuG7S2mX2twMqtrZO/c5bTph9XmJmcPfNiMvvg4KSLhNsmvBw1NLS+lIS
         8Qnw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id s194si500660wme.2.2019.10.17.05.51.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 05:51:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x9HCp0sB009651
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Oct 2019 14:51:00 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.0.8])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9HCp0ZV022989;
	Thu, 17 Oct 2019 14:51:00 +0200
Date: Thu, 17 Oct 2019 14:51:00 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>,
        Andrej Utz
 <andrej.utz@st.oth-regensburg.de>,
        Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [PATCH v4 00/13] pyjailhouse: x86: Implement config generator
 for port I/O
Message-ID: <20191017145100.0e923e14@md1za8fc.ad001.siemens.net>
In-Reply-To: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
References: <20191015162242.1238940-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Hi,

that is a long standing "issue" and we once had a chinese student
working on that as well. He never finished though ...

I did not look into all details but the insight that the existing code
for memory can be reused for ports was in there ... inside the kernel
it is also "the same".

I only wonder whether IORegionTree.parse_io_file can get away with just
one argument, which file to take can be derived from the target class.
Or the other way around.

Henning

Am Tue, 15 Oct 2019 18:22:29 +0200
schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:

> (reusing Andrej's cover-letter)
> 
> This patch series eases configuration of port I/O devices for x86
> plattforms by generating an initial PIO region list. To sustain
> previous behavior, most entries are disabled (commented out). Only
> whitelisted device ports are allowed. This includes the peripheral
> PCI port space.
> 
> Additionally the code paths for memory region generation are cleaned
> up and streamlined.
> 
> since v3:
>   - Address Jan's comments
>   - Dynamically whitelist some platform devices + PCI ports
>   - I (Ralf) resend the series as Andrej runs into nasty email
>     throttling issues with his account
> 
> since v2:
>   - Use new PIO whitelist structures
> 
> Andrej Utz (4):
>   tools: jailhouse-config-create: Rename regions to mem_regions in
>     preparation for port_regions
>   pyjailhouse: abstract parts of MemRegion into IORegion
>   pyjailhouse: simplify integer formatting for regions in config
>     template
>   pyjailhouse: x86: implement pio_regions generator
> 
> Ralf Ramsauer (9):
>   pyjailhouse: sysfs_parser: remove dead code
>   pyjailhouse: sysfs_parser: minor stylistic fixups
>   pyjailhouse: sysfs_parser: introduce new class IORegionTree
>   pyjailhouse: sysfs_parser: move parse_iomem_file to the new parser
>   pyjailhouse: sysfs_parser: make regions_split_by_kernel static
>   pyjailhouse: sysfs_parser: entirely separate IO parsers
>   pyjailhouse: sysfs_parser: remove parse_iomem_file
>   pyjailhouse: sysfs_parser: move find_regions_by_name to IORegionTree
>   pyjailhouse: sysfs_parser: Remove IOMemRegionTree class
> 
>  pyjailhouse/sysfs_parser.py   | 340
> +++++++++++++++++++++------------- tools/jailhouse-config-create |
> 25 +-- tools/root-cell-config.c.tmpl |  22 +--
>  3 files changed, 233 insertions(+), 154 deletions(-)
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191017145100.0e923e14%40md1za8fc.ad001.siemens.net.
