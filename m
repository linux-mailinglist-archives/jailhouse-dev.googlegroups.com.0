Return-Path: <jailhouse-dev+bncBDLNPVGISQLRBNPKYX3AKGQEVYAQJEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0721E892F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 29 May 2020 22:48:54 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id f25sf61930ljo.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 29 May 2020 13:48:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590785334; cv=pass;
        d=google.com; s=arc-20160816;
        b=UAC3CKjsF9iq7mzizUzbmYA0kCj7M8vVtr31txyYTfA1GObyTVLIAejuA8whOMwFQo
         iiPiUvkyaBU2TK75+X9M6FWHVzlHcw8yfmnhrWlP/HTzK7LaFGzUP1AxBlWmRPIJeyOj
         6JCQp8v9vvWcnSYPiE4YjNGRR+IseV8DzVhM9jEPtKpmCsHTa0wls6FZHQthMdLU7J5k
         H6iwPG9YyubgEkT9Pv2kw9oWX/pHwD//xgrobzLRjkKigtWOfbYEWJ/Bt0sWzpJ64Qi9
         nYE1EjxhwVSQI1DL0GuoZW7dOvY7uZWE12dIPUQDIsXGBGjNMgn+vMPv5+E6MQ5xgvO0
         RGTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:sender:dkim-signature;
        bh=fID9YkOtI7cza0E4f+2L1uZ6QBxmKOJCAJIo+ftqY+c=;
        b=MUkZKkCi4R4UmtZVkvyilJ1mmRati+gGq34XBd8YEEjpGpKxwbQ+nQPK6J72O3CW0f
         BGxJnHZiN1kU0Y2zCGzAoFsBQ1OhmE/qHQI5jKr8C2405DFBqQOXj3X918pHPmwprb6+
         7ylrLoBZ0gHU4DRbj7SE+7a7UsRQ8avTm4ahCrLQ5sP5/E5tsEb0qs6n18iaUlj18DW+
         2Ax6kGUjFOV2ehV7em19wCb65L++mUbfe2Eeeq2bmVphFpVWUzgzghNZkxw3KcGtVWWT
         Ifzsrd4KjHZ8ttRuiJMcIq34sOVy2sDuhsh9H3u/aybKQeO+qpxwI3/lgEngBXvrn6Ma
         tJ6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of yann.morin.1998@free.fr designates 2a01:e0c:1:1599::14 as permitted sender) smtp.mailfrom=yann.morin.1998@free.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fID9YkOtI7cza0E4f+2L1uZ6QBxmKOJCAJIo+ftqY+c=;
        b=tkz/FU04pfeO8UsQ6ziXR7gvVtbJ7ZI/MtX5sQ2eQPoEo5d12cwvo4wOmmuIZSz00q
         wSvRoLg3vCQvn8UcePSDCcm1y7yeET05gQBREfN53tAsln4+pW6gM19ps0ddS0BaeowI
         81XnFRxROKSsZ58V7AXTOLzuJyjQWr3ELrf1BDguH64bNyCrn2iRN72dyZGqX68ekfBq
         mZuesQW5b8lERHqhNtH/86w+DgwCBWXHw4120su5UheOswRcQoDd8qxygs2dpFQeb4rg
         /Tto05XClQdYbaNBvQKjNJLrm6IjIs70ziFL1cAlYV5gEECsSehbY4ckqrQ7Ug7YFlx3
         xGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=fID9YkOtI7cza0E4f+2L1uZ6QBxmKOJCAJIo+ftqY+c=;
        b=gRJMDi034o3hhOF0r3yP4FOE0+r47bHH6tV606mXm6BQYK+nePfd1xFyxV9bpB5mpQ
         zZiDp8CgI83qnW3UkM4g8ZX4d3Q3YdBv51vpg0J5LY0Zn63wqTyrZm1NbUFvO0Bw/vc3
         9gPZT1CqAcSuukR11KxSUAe42MxF4M1GpWIje5rOWDWi+5M1JQBnRPYE795Ze9V+OTOu
         qdXM91DivpSo9I+HBsbPKFIB+lOj7XwdZ/7PDlSj7AI4aBA3dNwlWKn+7Fesw53yGgGC
         720HLJuA1AyQ0voIjWjm0Nwm1kcr+ROMPfhyYpMahLUKx4cPgpF5KdWnxWQNPfC9EZpt
         WUzw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530tSPAqdt+f/6FcCUX7w9sVOVKWPUZbTBfop1BNfVb3jZdvvG1Q
	LG4sWuV8qdczJnRJdAyxiQo=
X-Google-Smtp-Source: ABdhPJzG3TR9976caOz2QhUgswvddXH9WGx0tr1gvNrMHCOEdB9rb9Xbv05gYGmgNpKi596vAW1nQg==
X-Received: by 2002:a2e:8e64:: with SMTP id t4mr3461459ljk.414.1590785334290;
        Fri, 29 May 2020 13:48:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:4b43:: with SMTP id y64ls667796lfa.2.gmail; Fri, 29 May
 2020 13:48:53 -0700 (PDT)
X-Received: by 2002:a19:5216:: with SMTP id m22mr5378325lfb.14.1590785333392;
        Fri, 29 May 2020 13:48:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590785333; cv=none;
        d=google.com; s=arc-20160816;
        b=ooGRDYIPq50+YFrlTWFS2vAsp1M38CbhcObSaku1zbNkui+PD3Ue38gFB3qg7NPljz
         o5FtcPqHaW/bmu+1RGwsjkjM/aQ9hyEb1UhdsFGL88aCAkCtbgOIYcuKx1mEGKo1sYnI
         3mX9PgJSJ8Kax5wQzZtu6izA88kcEvhitpApW38WqXh/bogLTYOgB3Zb9hzWrCcue6ea
         Wbw70PQfMIs7OVoSdW5Q/cnmHUbdgZpSkintpMWaer+0kiXEzS/auph++JeZIB+v4jYN
         CQF3TJQtAfW3uMyxBE4VUywRbNgh+Q+W9MQDmk6GQ3rnNGrv070ispOMlVf23PrV7ilx
         9RJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=99+7DBoXeP3riD1xO5U5k1iPrSX1X4OkYKu4prTs7qs=;
        b=LFG6uIVAwu07Vo45r/zW82mxjMUXFnkzB2zko/0PTgbZ7BGhaIZBTNp+IVIAuxE9pL
         1RRsn8zvTzsFy1eDKIetPoTlzEQ1PiVnVEN0gHeBqDGUCbMOc+vqKi3L3ZHBRtZooh7b
         FOxapjPjWevR3zPnBOwRkWqtV1612wFr8+OWiDdhTm6kiM8EzNo26vamWUKAp12ZF1t/
         VzSB5beRzRCjSoAMk0TZfCG7bx3jYddNPHYR5VULVsZCfEu4b581omexazJu9NERaQVF
         XTso67A+CYCfyBfsTH/UMs9EsKmguLTrdodMnwz99mO4DE37XWLfr747yb/iWPSIcHwl
         1Giw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: best guess record for domain of yann.morin.1998@free.fr designates 2a01:e0c:1:1599::14 as permitted sender) smtp.mailfrom=yann.morin.1998@free.fr
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr. [2a01:e0c:1:1599::14])
        by gmr-mx.google.com with ESMTPS id o23si506708lfb.4.2020.05.29.13.48.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 13:48:53 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of yann.morin.1998@free.fr designates 2a01:e0c:1:1599::14 as permitted sender) client-ip=2a01:e0c:1:1599::14;
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a01:cb19:8b51:cb00:a988:fc2:6b3e:4e93])
	(Authenticated sender: yann.morin.1998)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 85B095FFA6;
	Fri, 29 May 2020 22:48:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation); Fri, 29 May 2020 22:48:44 +0200
Date: Fri, 29 May 2020 22:48:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Mario Mintel <mariomintel@gmail.com>
Cc: buildroot@buildroot.org, jailhouse-dev@googlegroups.com,
	ralf.ramsauer@oth-regensburg.de
Subject: Re: [Buildroot] [PATCH 2/2] package/jailhouse: add option to choose
 custom repo/branch
Message-ID: <20200529204844.GR8737@scaer>
References: <20200528144333.49268-1-mariomintel@gmail.com>
 <20200528144333.49268-3-mariomintel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20200528144333.49268-3-mariomintel@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Original-Sender: yann.morin.1998@free.fr
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: best guess record for domain of yann.morin.1998@free.fr
 designates 2a01:e0c:1:1599::14 as permitted sender) smtp.mailfrom=yann.morin.1998@free.fr
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

Mario, All,

On 2020-05-28 16:43 +0200, Mario Mintel spake thusly:
> In addition to official releases of Jailhouse, allow to specify a custom
> Git URI + branches. This adds more flexibility for custom
> configurations.

The overwhelming majority of packages do not allow selecting an
alternate location. Why would jailhouse be different?

Are you trying to cover for development? In that case, the usual way is
to use the override srcdir mechanism. See BR2_PACKAGE_OVERRIDE_FILE and
provide such a file with definitions like;

    JAILHOUSE_OVERRIDE_SRCDIR = /path/to/your/local/development/tree/jailhouse

Regards,
Yann E. MORIN.

> Signed-off-by: Mario Mintel <mariomintel@gmail.com>
> ---
>  package/jailhouse/Config.in    | 36 ++++++++++++++++++++++++++++++++--
>  package/jailhouse/jailhouse.mk | 17 ++++++++++++++--
>  2 files changed, 49 insertions(+), 4 deletions(-)
> 
> diff --git a/package/jailhouse/Config.in b/package/jailhouse/Config.in
> index 596b4951db..47523747f9 100644
> --- a/package/jailhouse/Config.in
> +++ b/package/jailhouse/Config.in
> @@ -3,18 +3,50 @@ config BR2_PACKAGE_JAILHOUSE
>  	depends on BR2_aarch64 || BR2_x86_64
>  	depends on BR2_LINUX_KERNEL
>  	help
> -	  The Jailhouse partitioning Hypervisor based on Linux.
> +	  The Jailhouse Linux-based partitioning hypervisor.
>  
>  	  https://github.com/siemens/jailhouse
>  
>  if BR2_PACKAGE_JAILHOUSE
>  
> +choice
> +	prompt "Jailhouse Version"
> +
> +config BR2_PACKAGE_JAILHOUSE_LATEST_VERSION
> +	bool "Version 0.12"
> +
> +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
> +	bool "Custom Git repository"
> +	help
> +	  This option allows Buildroot to get the Jailhouse source code
> +	  from a custom Git repository.
> +
> +endchoice
> +
> +if BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
> +
> +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_URI
> +	string "URI of custom repository"
> +	default "https://github.com/siemens/jailhouse.git"
> +
> +config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH
> +	string "Name of Git branch"
> +	default "master"
> +
> +endif
> +
> +config BR2_PACKAGE_JAILHOUSE_VERSION
> +	string
> +	default "0.12" if BR2_PACKAGE_JAILHOUSE_LATEST_VERSION
> +	default BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH \
> +		if BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
> +
>  config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
>  	bool "helper scripts"
>  	depends on BR2_PACKAGE_PYTHON
>  	select BR2_PACKAGE_PYTHON_MAKO # runtime
>  	help
> -	  Python-based helpers for the Jailhouse Hypervisor.
> +	  Python-based helpers for the Jailhouse hypervisor.
>  
>  	  https://github.com/siemens/jailhouse
>  
> diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
> index 6356c5a7aa..d134b3d1b4 100644
> --- a/package/jailhouse/jailhouse.mk
> +++ b/package/jailhouse/jailhouse.mk
> @@ -4,10 +4,23 @@
>  #
>  ################################################################################
>  
> -JAILHOUSE_VERSION = 0.12
> -JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
> +JAILHOUSE_VERSION = $(call qstrip,$(BR2_PACKAGE_JAILHOUSE_VERSION))
>  JAILHOUSE_LICENSE = GPL-2.0
> +ifeq ($(BR2_PACKAGE_JAILHOUSE_LATEST_VERSION),y)
>  JAILHOUSE_LICENSE_FILES = COPYING
> +endif
> +
> +ifeq ($(BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT),y)
> +JAILHOUSE_SITE = $(call qstrip,$(BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_URI))
> +JAILHOUSE_SITE_METHOD = git
> +else
> +JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
> +endif
> +
> +ifeq ($(BR2_PACKAGE_JAILHOUSE)$(BR2_PACKAGE_JAILHOUSE_CUSTIM_GIT),y)
> +BR_NO_CHECK_HASH_FOR += $(JAILHOUSE_SOURCE)
> +endif
> +
>  JAILHOUSE_DEPENDENCIES = \
>  	linux
>  
> -- 
> 2.26.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200529204844.GR8737%40scaer.
