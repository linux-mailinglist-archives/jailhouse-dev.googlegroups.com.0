Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRB37YVPTAKGQEYWWHOKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBE211B39
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 May 2019 16:19:27 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id j3sf1133118edb.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 May 2019 07:19:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556806767; cv=pass;
        d=google.com; s=arc-20160816;
        b=L1ctqNQWKtoRw2xZ8JyyCweYQJy+UxqkWqmAL2EpfbxxEXOI/rMtZ0ub6ZW6sCcMpY
         6SN1YUVet2pZzt0/fahebxxN/0pESilIjg/8Xh6T0LLidp9Av6y/bU1oYENiZFu4xdB5
         n1A8ZUZ75uAM3Bbn8lkkR1KqFoXY9Ztzc6EWR77QqlvK//fFsmQ3s/Zk95kxmp7hU/7i
         K+OpcgkGpOr4FcqRcwZh3+QArZVAy3h2bWIzsqo8aNtfmXC3eUmMAsycCynsTP4Q0xQD
         vvVVmnzgtTiuEuMg/T2vN8yE35iZk+GL0UfXeHhWPsV13LqUYqYVykXfYNeCvVE/T0OQ
         nw2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=LZ+bUnFTTrDvg/QUaOClQOajuQp+cn6iZDdot9HAZCQ=;
        b=kj5JDZrzsRNda5JktSOwprgw3ciWOoRFGR408SoJuzenKAgMKBaO9yUuACrHPK1/F6
         e4Zu8SDI7jxUAQfZ+3Q90yP5yeiS4IQqP3sMhHx7YqPoyjxPHRORMPPDMQBsPnTHHuaj
         2+Pbu9jlFepLH3x0OwQ1dO4TMHO+kHfqOsRl8z6oB2/7oUUkQzLpmx2rgPC1ApGjTW0d
         iIV6uuI/s8pGDcOF9D51g61XPCroISxRleKEkL/7+LjVI1VCwmNqT1DQhKlaQGUZ2Fky
         pkVCbfA2BPjJkXX41uLmmUk7PTYESsudd0mH/0Ogkby80/bytIG+CfHzjZPf6QjudiST
         qELg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LZ+bUnFTTrDvg/QUaOClQOajuQp+cn6iZDdot9HAZCQ=;
        b=shYK2joe4ueqCZC0eRMIx1sgwFA/EJVxTG+lXPx8+PloPZx1dnfLGQGSdMm9O12WSr
         D/yqutwQf6Qx0dg5GH32b3FTeiI4Yp1Wxq+QEBYPzlpI+8OSvuB2rilm+jDWjMlPlSPY
         AFK4lC+GctY/fsmcXcALiZq4uNDOZ3X7WHSxWEbU0N2cnVF3Yx+PXVHJZ2RBmVa3cLY+
         s/vMQjumxPy+LqGQT+ycF8TBTonYubv2cm9EYONC/hM46P/tVDHTbiS3lnuQYMKXLqIV
         IJo8t6CL60Tdykff90uI+/E0Fn4yFh7spFEzuJT6F/CMi7I8IMW7NO5RV+0pC+9e2iP8
         qh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LZ+bUnFTTrDvg/QUaOClQOajuQp+cn6iZDdot9HAZCQ=;
        b=c90dqxSJk1VSF1mSnIlYr9wxY7xbgXp/4h50FwEhDSojKXUnFv1CrPj2fwtK42U3Qy
         f8s1YAFGaJRVaTzxuWlvX2Otsk3XcDu+e28San7I1zBxV2XCVin/GHSseOKzRWtVoLv7
         +QMAlZ6j5qwp/SKBPamaxotoCn99b00FK0pjwtuRQSBBm5bQvlLQ8lturSXKX1MRnaGw
         LEKYcFoIFk3kP20HvwByftQfD3m3wRpj1PF7SNwrtQI8q7V4FmPFHH0V3GxXEp/pCzJ8
         1WiDpnLt0GRRGHRUofzczj995wgP11ObguFG2+9vuH2nuf0VBkOTmwhFegpSVZ+XDBHq
         EqSA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU746Cz1nJqogOhF9fqn++BE9ZnsPguYhXsNaTaMqQ3rpiwXqKS
	LB7AVjQksamVxhaBPB5ZKn4=
X-Google-Smtp-Source: APXvYqyhKEYnGsO5EmaQjKC9hjUNj7LjeqAkXTqFzoTdIVqN5NtEsQbX0tFVItZE8NDiF2thDRH7Kg==
X-Received: by 2002:a50:bdcc:: with SMTP id z12mr2653812edh.138.1556806767551;
        Thu, 02 May 2019 07:19:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:8d0:: with SMTP id o16ls331268eje.16.gmail; Thu, 02
 May 2019 07:19:27 -0700 (PDT)
X-Received: by 2002:a17:906:29d3:: with SMTP id y19mr1997335eje.122.1556806767044;
        Thu, 02 May 2019 07:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556806767; cv=none;
        d=google.com; s=arc-20160816;
        b=NRUnwExAUBVw9zWJNx3dBKI7BvapcX7Yeg1ieo/PjOgaBgpHZpim0t3DPE54mW5zZC
         qSMCRXAQP25SnOiKOtORwz3lZWew7fGGh4BJKwxWk5ZuA5qqVjmRkVlRphOFseWU0f9u
         dH4ZOTWnW7Imx8NNp3G0GE4hRjRqlbVrRThvIaWxulqsSpMrBhIWh07Pbr4UXpWlgx7O
         D8hXx8EPjY2/KfhnqoqF946CLfpFkKCOP2e8iGH2HxyjIvnk4a0AdP91M9bSLKMs5iR2
         1paktoLAvQK4sdb2nDVDDuvcXWGd65qM4Qjd48eGYCaP33eTHLSENw/Pju+qWrhmVn26
         a8IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=z93Pos4iW7tVSwKgGNeQIjG8G/cYw6FWZBzdNbqoVFs=;
        b=X1X1e3g5ZHEX24CAvzF8rr9rmg3Bp1zYw5AysAbfy5guZ+VS8Ij560wk/a4wAbMgEi
         NUpnlowkbgJ+kcKnCUtXmtozNdP0yZftzaTmmxW+Ni6JMOPgDHHcT7fx4JAEMKsRcQ2G
         ndTNKeRa8w6l0TigSdebeO+LiHTbCXlajURTSlWxgDe+IEMe7zkXtPhCcfXgl6gyk+zC
         DNzPZ/rnEL55c8AG3mXld1xZ5sxwPZ88FTAMDyzMj/b0XYHrXZK9Ik37vRuv67nRFC2W
         RzMcp1smgNL373DonFSN7AnqPIXEkgPqLrBqa5HkwRdJHjogmdwvc7TtS6vaRz9gHUiG
         qbBA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z45si767070edc.3.2019.05.02.07.19.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 07:19:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x42EJQWY003425
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 May 2019 16:19:26 +0200
Received: from md1za8fc.ad001.siemens.net ([139.25.68.211])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x42EJQIh021486;
	Thu, 2 May 2019 16:19:26 +0200
Date: Thu, 2 May 2019 16:19:25 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: <jailhouse-dev@googlegroups.com>
Subject: Re: [PATCH 1/5] configs: define ARRAY_SIZE in cell-config.h
Message-ID: <20190502161925.456ba526@md1za8fc.ad001.siemens.net>
In-Reply-To: <460f35ab-5329-2eae-f545-7fddf2277235@oth-regensburg.de>
References: <20190430214504.2153-1-ralf.ramsauer@oth-regensburg.de>
	<20190430214504.2153-2-ralf.ramsauer@oth-regensburg.de>
	<20190502102353.577614ab@md1za8fc.ad001.siemens.net>
	<460f35ab-5329-2eae-f545-7fddf2277235@oth-regensburg.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com
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

Am Thu, 2 May 2019 12:10:34 +0200
schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:

> Hi,
> 
> On 5/2/19 10:23 AM, Henning Schild wrote:
> > Hi Ralf,
> > 
> > good idea! What happens if i through my "legacy" config on that? In
> > that case i would expect one define inside + one in the header. The
> > header will win, will the config-one cause an issue. I would expect
> > at least a warning, which is probably fine.  
> 
> Easy to find out: Simply re-introduce the definition of ARRAY_SIZE in
> a configuration again.
> 
> My compiler (gcc 8.3.0) doesn't even warn. I assume this is because
> definition and redefinition are textually equivalent.

Right. Even an old debian9 gcc 6.3.0 will not complain, just if the two
definitions differ, there will be a warning.

Henning

>   Ralf
> 
> > 
> > Henning
> > 
> > Am Tue, 30 Apr 2019 23:45:00 +0200
> > schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:
> >   
> >> instead of defining this useful macro in every single config file.
> >>
> >> There's only one quirk: ARRAY_SIZE is defined for hypervisor code
> >> in util.h, which we can't include in cell-config.h, as it's
> >> GPL-only. So we have to duplicate the definitions, which might
> >> lead to redefinitions of the macro. Hence, surround the macro by
> >> guards.
> >>
> >> Also remove the macro from the root cell template.
> >>
> >> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> >> ---
> >>  configs/arm/bananapi-gic-demo.c               | 2 --
> >>  configs/arm/bananapi-linux-demo.c             | 2 --
> >>  configs/arm/bananapi-uart-demo.c              | 2 --
> >>  configs/arm/bananapi.c                        | 2 --
> >>  configs/arm/emtrion-rzg1e-linux-demo.c        | 2 --
> >>  configs/arm/emtrion-rzg1e-uart-demo.c         | 2 --
> >>  configs/arm/emtrion-rzg1e.c                   | 2 --
> >>  configs/arm/emtrion-rzg1h-linux-demo.c        | 2 --
> >>  configs/arm/emtrion-rzg1h-uart-demo.c         | 2 --
> >>  configs/arm/emtrion-rzg1h.c                   | 2 --
> >>  configs/arm/emtrion-rzg1m-linux-demo.c        | 2 --
> >>  configs/arm/emtrion-rzg1m-uart-demo.c         | 2 --
> >>  configs/arm/emtrion-rzg1m.c                   | 2 --
> >>  configs/arm/jetson-tk1-demo.c                 | 2 --
> >>  configs/arm/jetson-tk1-linux-demo.c           | 2 --
> >>  configs/arm/jetson-tk1.c                      | 2 --
> >>  configs/arm/orangepi0-gic-demo.c              | 2 --
> >>  configs/arm/orangepi0-linux-demo.c            | 2 --
> >>  configs/arm/orangepi0.c                       | 2 --
> >>  configs/arm64/amd-seattle-gic-demo.c          | 2 --
> >>  configs/arm64/amd-seattle-linux-demo.c        | 2 --
> >>  configs/arm64/amd-seattle-uart-demo.c         | 2 --
> >>  configs/arm64/amd-seattle.c                   | 2 --
> >>  configs/arm64/espressobin-gic-demo.c          | 2 --
> >>  configs/arm64/espressobin-linux-demo.c        | 2 --
> >>  configs/arm64/espressobin.c                   | 2 --
> >>  configs/arm64/foundation-v8-gic-demo.c        | 2 --
> >>  configs/arm64/foundation-v8-linux-demo.c      | 2 --
> >>  configs/arm64/foundation-v8-uart-demo.c       | 2 --
> >>  configs/arm64/foundation-v8.c                 | 2 --
> >>  configs/arm64/hikey-gic-demo.c                | 2 --
> >>  configs/arm64/hikey-linux-demo.c              | 2 --
> >>  configs/arm64/hikey.c                         | 2 --
> >>  configs/arm64/imx8mq-gic-demo.c               | 2 --
> >>  configs/arm64/imx8mq.c                        | 2 --
> >>  configs/arm64/jetson-tx1-demo.c               | 2 --
> >>  configs/arm64/jetson-tx1-linux-demo.c         | 2 --
> >>  configs/arm64/jetson-tx1.c                    | 2 --
> >>  configs/arm64/jetson-tx2-demo.c               | 2 --
> >>  configs/arm64/jetson-tx2.c                    | 2 --
> >>  configs/arm64/k3-am654-gic-demo.c             | 2 --
> >>  configs/arm64/k3-am654-idk-linux-demo.c       | 2 --
> >>  configs/arm64/k3-am654-idk.c                  | 2 --
> >>  configs/arm64/k3-am654-uart-demo.c            | 2 --
> >>  configs/arm64/macchiatobin-gic-demo.c         | 2 --
> >>  configs/arm64/macchiatobin-linux-demo.c       | 2 --
> >>  configs/arm64/macchiatobin.c                  | 2 --
> >>  configs/arm64/miriac-sbc-ls1046a-gic-demo.c   | 2 --
> >>  configs/arm64/miriac-sbc-ls1046a-linux-demo.c | 2 --
> >>  configs/arm64/miriac-sbc-ls1046a.c            | 2 --
> >>  configs/arm64/qemu-arm64-gic-demo.c           | 2 --
> >>  configs/arm64/qemu-arm64-linux-demo.c         | 2 --
> >>  configs/arm64/qemu-arm64.c                    | 2 --
> >>  configs/arm64/ultra96-gic-demo.c              | 2 --
> >>  configs/arm64/ultra96-linux-demo.c            | 2 --
> >>  configs/arm64/ultra96.c                       | 2 --
> >>  configs/arm64/zynqmp-zcu102-gic-demo.c        | 2 --
> >>  configs/arm64/zynqmp-zcu102-linux-demo-2.c    | 2 --
> >>  configs/arm64/zynqmp-zcu102-linux-demo.c      | 2 --
> >>  configs/arm64/zynqmp-zcu102.c                 | 2 --
> >>  configs/x86/apic-demo.c                       | 2 --
> >>  configs/x86/e1000-demo.c                      | 2 --
> >>  configs/x86/f2a88xm-hd3.c                     | 2 --
> >>  configs/x86/imb-a180.c                        | 2 --
> >>  configs/x86/ioapic-demo.c                     | 2 --
> >>  configs/x86/ivshmem-demo.c                    | 2 --
> >>  configs/x86/linux-x86-demo.c                  | 2 --
> >>  configs/x86/pci-demo.c                        | 2 --
> >>  configs/x86/qemu-x86.c                        | 2 --
> >>  configs/x86/smp-demo.c                        | 2 --
> >>  configs/x86/tiny-demo.c                       | 2 --
> >>  hypervisor/include/jailhouse/utils.h          | 2 ++
> >>  include/jailhouse/cell-config.h               | 4 ++++
> >>  tools/root-cell-config.c.tmpl                 | 2 --
> >>  74 files changed, 6 insertions(+), 144 deletions(-)
> >>
> >> diff --git a/configs/arm/bananapi-gic-demo.c
> >> b/configs/arm/bananapi-gic-demo.c index 757d9503..855a72a7 100644
> >> --- a/configs/arm/bananapi-gic-demo.c
> >> +++ b/configs/arm/bananapi-gic-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm/bananapi-linux-demo.c
> >> b/configs/arm/bananapi-linux-demo.c index e9e584f2..fd1931f3 100644
> >> --- a/configs/arm/bananapi-linux-demo.c
> >> +++ b/configs/arm/bananapi-linux-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm/bananapi-uart-demo.c
> >> b/configs/arm/bananapi-uart-demo.c index aeec6f8d..0621ca52 100644
> >> --- a/configs/arm/bananapi-uart-demo.c
> >> +++ b/configs/arm/bananapi-uart-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm/bananapi.c b/configs/arm/bananapi.c
> >> index e7e6bb1e..ffc4589c 100644
> >> --- a/configs/arm/bananapi.c
> >> +++ b/configs/arm/bananapi.c
> >> @@ -15,8 +15,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm/emtrion-rzg1e-linux-demo.c
> >> b/configs/arm/emtrion-rzg1e-linux-demo.c index ea638989..1bf08b66
> >> 100644 --- a/configs/arm/emtrion-rzg1e-linux-demo.c
> >> +++ b/configs/arm/emtrion-rzg1e-linux-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm/emtrion-rzg1e-uart-demo.c
> >> b/configs/arm/emtrion-rzg1e-uart-demo.c index a2590adb..42c74127
> >> 100644 --- a/configs/arm/emtrion-rzg1e-uart-demo.c
> >> +++ b/configs/arm/emtrion-rzg1e-uart-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm/emtrion-rzg1e.c
> >> b/configs/arm/emtrion-rzg1e.c index 0a38ed8d..e3872cf2 100644
> >> --- a/configs/arm/emtrion-rzg1e.c
> >> +++ b/configs/arm/emtrion-rzg1e.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm/emtrion-rzg1h-linux-demo.c
> >> b/configs/arm/emtrion-rzg1h-linux-demo.c index 61c58666..ad2dceeb
> >> 100644 --- a/configs/arm/emtrion-rzg1h-linux-demo.c
> >> +++ b/configs/arm/emtrion-rzg1h-linux-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm/emtrion-rzg1h-uart-demo.c
> >> b/configs/arm/emtrion-rzg1h-uart-demo.c index d8076be5..f20c94cb
> >> 100644 --- a/configs/arm/emtrion-rzg1h-uart-demo.c
> >> +++ b/configs/arm/emtrion-rzg1h-uart-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm/emtrion-rzg1h.c
> >> b/configs/arm/emtrion-rzg1h.c index a23e1589..03e1be5b 100644
> >> --- a/configs/arm/emtrion-rzg1h.c
> >> +++ b/configs/arm/emtrion-rzg1h.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm/emtrion-rzg1m-linux-demo.c
> >> b/configs/arm/emtrion-rzg1m-linux-demo.c index 0c3d0cfd..d8b8441a
> >> 100644 --- a/configs/arm/emtrion-rzg1m-linux-demo.c
> >> +++ b/configs/arm/emtrion-rzg1m-linux-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm/emtrion-rzg1m-uart-demo.c
> >> b/configs/arm/emtrion-rzg1m-uart-demo.c index 3a0eda5c..c89c1d82
> >> 100644 --- a/configs/arm/emtrion-rzg1m-uart-demo.c
> >> +++ b/configs/arm/emtrion-rzg1m-uart-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm/emtrion-rzg1m.c
> >> b/configs/arm/emtrion-rzg1m.c index f97805f7..84d68f62 100644
> >> --- a/configs/arm/emtrion-rzg1m.c
> >> +++ b/configs/arm/emtrion-rzg1m.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm/jetson-tk1-demo.c
> >> b/configs/arm/jetson-tk1-demo.c index 7562222c..57ea5a3d 100644
> >> --- a/configs/arm/jetson-tk1-demo.c
> >> +++ b/configs/arm/jetson-tk1-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  #ifndef CONFIG_INMATE_BASE
> >>  #define CONFIG_INMATE_BASE 0x0
> >>  #endif
> >> diff --git a/configs/arm/jetson-tk1-linux-demo.c
> >> b/configs/arm/jetson-tk1-linux-demo.c index 16d79774..7ee83f7a
> >> 100644 --- a/configs/arm/jetson-tk1-linux-demo.c
> >> +++ b/configs/arm/jetson-tk1-linux-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm/jetson-tk1.c b/configs/arm/jetson-tk1.c
> >> index 9e2e23f9..7374ef44 100644
> >> --- a/configs/arm/jetson-tk1.c
> >> +++ b/configs/arm/jetson-tk1.c
> >> @@ -18,8 +18,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm/orangepi0-gic-demo.c
> >> b/configs/arm/orangepi0-gic-demo.c index 45c38425..51b3bf8b 100644
> >> --- a/configs/arm/orangepi0-gic-demo.c
> >> +++ b/configs/arm/orangepi0-gic-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm/orangepi0-linux-demo.c
> >> b/configs/arm/orangepi0-linux-demo.c index e7154078..49ee10e9
> >> 100644 --- a/configs/arm/orangepi0-linux-demo.c
> >> +++ b/configs/arm/orangepi0-linux-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
> >> index 9eca773d..e45c8d62 100644
> >> --- a/configs/arm/orangepi0.c
> >> +++ b/configs/arm/orangepi0.c
> >> @@ -15,8 +15,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/amd-seattle-gic-demo.c
> >> b/configs/arm64/amd-seattle-gic-demo.c index d407d6e3..5a4d726a
> >> 100644 --- a/configs/arm64/amd-seattle-gic-demo.c
> >> +++ b/configs/arm64/amd-seattle-gic-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/amd-seattle-linux-demo.c
> >> b/configs/arm64/amd-seattle-linux-demo.c index 96edbc4f..5349323c
> >> 100644 --- a/configs/arm64/amd-seattle-linux-demo.c
> >> +++ b/configs/arm64/amd-seattle-linux-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/amd-seattle-uart-demo.c
> >> b/configs/arm64/amd-seattle-uart-demo.c index 61073486..bcaac58d
> >> 100644 --- a/configs/arm64/amd-seattle-uart-demo.c
> >> +++ b/configs/arm64/amd-seattle-uart-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/amd-seattle.c
> >> b/configs/arm64/amd-seattle.c index 911ae1da..b5cff3b3 100644
> >> --- a/configs/arm64/amd-seattle.c
> >> +++ b/configs/arm64/amd-seattle.c
> >> @@ -15,8 +15,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/espressobin-gic-demo.c
> >> b/configs/arm64/espressobin-gic-demo.c index 452ab668..6de940d7
> >> 100644 --- a/configs/arm64/espressobin-gic-demo.c
> >> +++ b/configs/arm64/espressobin-gic-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/espressobin-linux-demo.c
> >> b/configs/arm64/espressobin-linux-demo.c index c0b09981..92da96e9
> >> 100644 --- a/configs/arm64/espressobin-linux-demo.c
> >> +++ b/configs/arm64/espressobin-linux-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/espressobin.c
> >> b/configs/arm64/espressobin.c index d620080d..a23dc24b 100644
> >> --- a/configs/arm64/espressobin.c
> >> +++ b/configs/arm64/espressobin.c
> >> @@ -17,8 +17,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/foundation-v8-gic-demo.c
> >> b/configs/arm64/foundation-v8-gic-demo.c index 5d69e01e..8b1ff1ac
> >> 100644 --- a/configs/arm64/foundation-v8-gic-demo.c
> >> +++ b/configs/arm64/foundation-v8-gic-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/foundation-v8-linux-demo.c
> >> b/configs/arm64/foundation-v8-linux-demo.c index 86fe8ada..2a448b49
> >> 100644 --- a/configs/arm64/foundation-v8-linux-demo.c
> >> +++ b/configs/arm64/foundation-v8-linux-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/foundation-v8-uart-demo.c
> >> b/configs/arm64/foundation-v8-uart-demo.c index f057fbbc..da919d4a
> >> 100644 --- a/configs/arm64/foundation-v8-uart-demo.c
> >> +++ b/configs/arm64/foundation-v8-uart-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/foundation-v8.c
> >> b/configs/arm64/foundation-v8.c index 5109929f..7a632491 100644
> >> --- a/configs/arm64/foundation-v8.c
> >> +++ b/configs/arm64/foundation-v8.c
> >> @@ -15,8 +15,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/hikey-gic-demo.c
> >> b/configs/arm64/hikey-gic-demo.c index 908b0c71..c7ddf469 100644
> >> --- a/configs/arm64/hikey-gic-demo.c
> >> +++ b/configs/arm64/hikey-gic-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/hikey-linux-demo.c
> >> b/configs/arm64/hikey-linux-demo.c index 71bc7c82..76dda9da 100644
> >> --- a/configs/arm64/hikey-linux-demo.c
> >> +++ b/configs/arm64/hikey-linux-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/hikey.c b/configs/arm64/hikey.c
> >> index bcfbe188..7e6bb952 100644
> >> --- a/configs/arm64/hikey.c
> >> +++ b/configs/arm64/hikey.c
> >> @@ -15,8 +15,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/imx8mq-gic-demo.c
> >> b/configs/arm64/imx8mq-gic-demo.c index 041751c0..ae1877d0 100644
> >> --- a/configs/arm64/imx8mq-gic-demo.c
> >> +++ b/configs/arm64/imx8mq-gic-demo.c
> >> @@ -13,8 +13,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/imx8mq.c b/configs/arm64/imx8mq.c
> >> index 95b4b363..7d113264 100644
> >> --- a/configs/arm64/imx8mq.c
> >> +++ b/configs/arm64/imx8mq.c
> >> @@ -15,8 +15,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/jetson-tx1-demo.c
> >> b/configs/arm64/jetson-tx1-demo.c index 446b1a6d..b16b9ba7 100644
> >> --- a/configs/arm64/jetson-tx1-demo.c
> >> +++ b/configs/arm64/jetson-tx1-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/jetson-tx1-linux-demo.c
> >> b/configs/arm64/jetson-tx1-linux-demo.c index 4a643873..b8698259
> >> 100644 --- a/configs/arm64/jetson-tx1-linux-demo.c
> >> +++ b/configs/arm64/jetson-tx1-linux-demo.c
> >> @@ -18,8 +18,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  #ifndef CONFIG_INMATE_BASE
> >>  #define CONFIG_INMATE_BASE 0x0
> >>  #endif
> >> diff --git a/configs/arm64/jetson-tx1.c
> >> b/configs/arm64/jetson-tx1.c index d4a00daf..d1fb21b8 100644
> >> --- a/configs/arm64/jetson-tx1.c
> >> +++ b/configs/arm64/jetson-tx1.c
> >> @@ -18,8 +18,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/jetson-tx2-demo.c
> >> b/configs/arm64/jetson-tx2-demo.c index 6e09226c..d500e124 100644
> >> --- a/configs/arm64/jetson-tx2-demo.c
> >> +++ b/configs/arm64/jetson-tx2-demo.c
> >> @@ -11,8 +11,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/jetson-tx2.c
> >> b/configs/arm64/jetson-tx2.c index 814a4b08..c2e17e67 100644
> >> --- a/configs/arm64/jetson-tx2.c
> >> +++ b/configs/arm64/jetson-tx2.c
> >> @@ -21,8 +21,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/k3-am654-gic-demo.c
> >> b/configs/arm64/k3-am654-gic-demo.c index fc9deb75..556b0b4a 100644
> >> --- a/configs/arm64/k3-am654-gic-demo.c
> >> +++ b/configs/arm64/k3-am654-gic-demo.c
> >> @@ -17,8 +17,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/k3-am654-idk-linux-demo.c
> >> b/configs/arm64/k3-am654-idk-linux-demo.c index 23824890..5eab1502
> >> 100644 --- a/configs/arm64/k3-am654-idk-linux-demo.c
> >> +++ b/configs/arm64/k3-am654-idk-linux-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  #ifndef CONFIG_INMATE_BASE
> >>  #define CONFIG_INMATE_BASE 0x0000000
> >>  #endif
> >> diff --git a/configs/arm64/k3-am654-idk.c
> >> b/configs/arm64/k3-am654-idk.c index edc31b8b..a951a461 100644
> >> --- a/configs/arm64/k3-am654-idk.c
> >> +++ b/configs/arm64/k3-am654-idk.c
> >> @@ -15,8 +15,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/k3-am654-uart-demo.c
> >> b/configs/arm64/k3-am654-uart-demo.c index 10cc0365..29a022e9
> >> 100644 --- a/configs/arm64/k3-am654-uart-demo.c
> >> +++ b/configs/arm64/k3-am654-uart-demo.c
> >> @@ -17,8 +17,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/macchiatobin-gic-demo.c
> >> b/configs/arm64/macchiatobin-gic-demo.c index 713319d2..63e1e433
> >> 100644 --- a/configs/arm64/macchiatobin-gic-demo.c
> >> +++ b/configs/arm64/macchiatobin-gic-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/macchiatobin-linux-demo.c
> >> b/configs/arm64/macchiatobin-linux-demo.c index 63fbbba7..6e18f62f
> >> 100644 --- a/configs/arm64/macchiatobin-linux-demo.c
> >> +++ b/configs/arm64/macchiatobin-linux-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/macchiatobin.c
> >> b/configs/arm64/macchiatobin.c index c0df0572..4811e8dd 100644
> >> --- a/configs/arm64/macchiatobin.c
> >> +++ b/configs/arm64/macchiatobin.c
> >> @@ -17,8 +17,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/miriac-sbc-ls1046a-gic-demo.c
> >> b/configs/arm64/miriac-sbc-ls1046a-gic-demo.c index
> >> 614b572e..6a93935f 100644 ---
> >> a/configs/arm64/miriac-sbc-ls1046a-gic-demo.c +++
> >> b/configs/arm64/miriac-sbc-ls1046a-gic-demo.c @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
> >> b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c index
> >> 1c63ae0e..ec2531b2 100644 ---
> >> a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c +++
> >> b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c @@ -17,8 +17,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/miriac-sbc-ls1046a.c
> >> b/configs/arm64/miriac-sbc-ls1046a.c index 9597500d..6f3ad198
> >> 100644 --- a/configs/arm64/miriac-sbc-ls1046a.c
> >> +++ b/configs/arm64/miriac-sbc-ls1046a.c
> >> @@ -17,8 +17,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/qemu-arm64-gic-demo.c
> >> b/configs/arm64/qemu-arm64-gic-demo.c index 2a50ef3f..9e51e821
> >> 100644 --- a/configs/arm64/qemu-arm64-gic-demo.c
> >> +++ b/configs/arm64/qemu-arm64-gic-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/qemu-arm64-linux-demo.c
> >> b/configs/arm64/qemu-arm64-linux-demo.c index be88e107..ed89413b
> >> 100644 --- a/configs/arm64/qemu-arm64-linux-demo.c
> >> +++ b/configs/arm64/qemu-arm64-linux-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/qemu-arm64.c
> >> b/configs/arm64/qemu-arm64.c index 0570a1dd..6eff7403 100644
> >> --- a/configs/arm64/qemu-arm64.c
> >> +++ b/configs/arm64/qemu-arm64.c
> >> @@ -17,8 +17,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/ultra96-gic-demo.c
> >> b/configs/arm64/ultra96-gic-demo.c index 12556335..403c6972 100644
> >> --- a/configs/arm64/ultra96-gic-demo.c
> >> +++ b/configs/arm64/ultra96-gic-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/ultra96-linux-demo.c
> >> b/configs/arm64/ultra96-linux-demo.c index e6b33466..7cbfd772
> >> 100644 --- a/configs/arm64/ultra96-linux-demo.c
> >> +++ b/configs/arm64/ultra96-linux-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
> >> index 1fc54356..bcf08772 100644
> >> --- a/configs/arm64/ultra96.c
> >> +++ b/configs/arm64/ultra96.c
> >> @@ -15,8 +15,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/zynqmp-zcu102-gic-demo.c
> >> b/configs/arm64/zynqmp-zcu102-gic-demo.c index 6ca18686..15767396
> >> 100644 --- a/configs/arm64/zynqmp-zcu102-gic-demo.c
> >> +++ b/configs/arm64/zynqmp-zcu102-gic-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
> >> b/configs/arm64/zynqmp-zcu102-linux-demo-2.c index
> >> 2fcc86c6..02ec89e8 100644 ---
> >> a/configs/arm64/zynqmp-zcu102-linux-demo-2.c +++
> >> b/configs/arm64/zynqmp-zcu102-linux-demo-2.c @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c
> >> b/configs/arm64/zynqmp-zcu102-linux-demo.c index ca80535d..c30ed924
> >> 100644 --- a/configs/arm64/zynqmp-zcu102-linux-demo.c
> >> +++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/arm64/zynqmp-zcu102.c
> >> b/configs/arm64/zynqmp-zcu102.c index 65515e56..9de04d6c 100644
> >> --- a/configs/arm64/zynqmp-zcu102.c
> >> +++ b/configs/arm64/zynqmp-zcu102.c
> >> @@ -17,8 +17,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/x86/apic-demo.c b/configs/x86/apic-demo.c
> >> index 969f9527..8840c632 100644
> >> --- a/configs/x86/apic-demo.c
> >> +++ b/configs/x86/apic-demo.c
> >> @@ -15,8 +15,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/x86/e1000-demo.c b/configs/x86/e1000-demo.c
> >> index 1c602883..09ca9eac 100644
> >> --- a/configs/x86/e1000-demo.c
> >> +++ b/configs/x86/e1000-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
> >> index d5320d7b..e73cbb06 100644
> >> --- a/configs/x86/f2a88xm-hd3.c
> >> +++ b/configs/x86/f2a88xm-hd3.c
> >> @@ -20,8 +20,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/x86/imb-a180.c b/configs/x86/imb-a180.c
> >> index 9073a4ac..4faa0b41 100644
> >> --- a/configs/x86/imb-a180.c
> >> +++ b/configs/x86/imb-a180.c
> >> @@ -19,8 +19,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/x86/ioapic-demo.c b/configs/x86/ioapic-demo.c
> >> index 8b47a335..30e0ac98 100644
> >> --- a/configs/x86/ioapic-demo.c
> >> +++ b/configs/x86/ioapic-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/x86/ivshmem-demo.c
> >> b/configs/x86/ivshmem-demo.c index 501d722f..b3a12a9d 100644
> >> --- a/configs/x86/ivshmem-demo.c
> >> +++ b/configs/x86/ivshmem-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/x86/linux-x86-demo.c
> >> b/configs/x86/linux-x86-demo.c index af8c6da4..c8f18701 100644
> >> --- a/configs/x86/linux-x86-demo.c
> >> +++ b/configs/x86/linux-x86-demo.c
> >> @@ -15,8 +15,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/x86/pci-demo.c b/configs/x86/pci-demo.c
> >> index c5719459..0b8c1aad 100644
> >> --- a/configs/x86/pci-demo.c
> >> +++ b/configs/x86/pci-demo.c
> >> @@ -16,8 +16,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
> >> index 68b8f18d..4d671cb2 100644
> >> --- a/configs/x86/qemu-x86.c
> >> +++ b/configs/x86/qemu-x86.c
> >> @@ -19,8 +19,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/x86/smp-demo.c b/configs/x86/smp-demo.c
> >> index a9625353..d175c618 100644
> >> --- a/configs/x86/smp-demo.c
> >> +++ b/configs/x86/smp-demo.c
> >> @@ -15,8 +15,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/configs/x86/tiny-demo.c b/configs/x86/tiny-demo.c
> >> index 426333f6..493059ae 100644
> >> --- a/configs/x86/tiny-demo.c
> >> +++ b/configs/x86/tiny-demo.c
> >> @@ -15,8 +15,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> -
> >>  struct {
> >>  	struct jailhouse_cell_desc cell;
> >>  	__u64 cpus[1];
> >> diff --git a/hypervisor/include/jailhouse/utils.h
> >> b/hypervisor/include/jailhouse/utils.h index eae0f390..6f6e8371
> >> 100644 --- a/hypervisor/include/jailhouse/utils.h
> >> +++ b/hypervisor/include/jailhouse/utils.h
> >> @@ -12,7 +12,9 @@
> >>   * Partly derived from Linux kernel code.
> >>   */
> >>  
> >> +#ifndef ARRAY_SIZE
> >>  #define ARRAY_SIZE(array)	(sizeof(array) /
> >> sizeof((array)[0])) +#endif
> >>  
> >>  /* sizeof() for a structure/union field */
> >>  #define FIELD_SIZEOF(type, fld)	(sizeof(((type *)0)->fld))
> >> diff --git a/include/jailhouse/cell-config.h
> >> b/include/jailhouse/cell-config.h index 66e13c3d..63eb5fa5 100644
> >> --- a/include/jailhouse/cell-config.h
> >> +++ b/include/jailhouse/cell-config.h
> >> @@ -41,6 +41,10 @@
> >>  
> >>  #include <jailhouse/console.h>
> >>  
> >> +#ifndef ARRAY_SIZE
> >> +#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> >> +#endif
> >> +
> >>  /*
> >>   * Incremented on any layout or semantic change of system or cell
> >> config.
> >>   * Also update HEADER_REVISION in tools.
> >> diff --git a/tools/root-cell-config.c.tmpl
> >> b/tools/root-cell-config.c.tmpl index 5a8e1412..b80d7889 100644
> >> --- a/tools/root-cell-config.c.tmpl
> >> +++ b/tools/root-cell-config.c.tmpl
> >> @@ -42,8 +42,6 @@
> >>  #include <jailhouse/types.h>
> >>  #include <jailhouse/cell-config.h>
> >>  
> >> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
> >> -
> >>  struct {
> >>  	struct jailhouse_system header;
> >>  	__u64 cpus[${int((cpucount + 63) / 64)}];  
> >   
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
