Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBYP2XXTQKGQE2EPGF6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D91E2F791
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 May 2019 08:51:14 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id r5sf7160706edd.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 May 2019 23:51:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559199074; cv=pass;
        d=google.com; s=arc-20160816;
        b=EQq4FlgCeELlUE594SchRfs6BVP/KU3JwDSfoe+EXRqZfwykbFjTQXraTE7p8HMMNm
         e6Qg+WFRXHCF81dXflETuDnUOlyheE0+jCWKfzsOZJP7PS7dP18ZqncelCdQjnM8YkE/
         V4QTAx8UVhfXCa83CF62ZjODOJ0FXudQ19JJujZd96QF+QxMaVPk52Ue15EQjHHsKiwE
         33wbfga7dzspwbT2JSlzbj+zpehzcglyot8QbokwJtpz2YtdLAW8poplVwq0AWttZVEI
         +j3CjDALQ2VCdYC2/JxHN2IaJxBMsYMo0ADKCtZE1V8qK7ARRiqnnG+J7uhm+9TSnHo4
         nkmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=42gRLNcPgojRYVkaUbCfDFWu4gwa3c5NNaZM6qXX/Ss=;
        b=N6lUvEKd5pZjP6j3TrcH/54dUmuAzyO+M5VGit11Y5pSorNg6gYbpvYgpVpnAJn4XP
         YJgx4zscVqT1K3GoF9uPF+eCsdIMDSU06CFILTuX1lmU5MCljROXl1+lSlaK8UhXN+gH
         6Y+PKF68A0lO0gmO/ESiUs6VIzpHc2+LOEJChvM86ml+Akjg308XOaL/YlwSELwgBE+t
         ODfX65LmKbLkj6KA32QmhTdpf8piu6UHwZ4+FKMP/Y/1zoce1+IBDCV2kPqfujxLjYiI
         uxFAm1oUbvp+rv3sYa3v+iQi1DAjNUtAK99c3lsz8KzdZgJiU0LPMvFTgn/Bz9paby9I
         eEOw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ikh5PWYY;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=42gRLNcPgojRYVkaUbCfDFWu4gwa3c5NNaZM6qXX/Ss=;
        b=ryr+9cGxXBRsYIbguNDmpebea5SS8gJvdw3Iz429KFrwFElRFvlN/9BhlMw2iUCHwU
         A+vouJJ98gYn6Wnw0PgG0X8GdeNOjJ0kMUAti+NrBc5Z5j6QqO8BGlsBzQ6CVFK+2wun
         BSS4r8ut3UlenqvObqAxt5kQLOkYiyXEPEtKVH3OnSxaatjMeLy0VaMXuLMjwvxc2u03
         x7+jikEzYlv0ri4eJE/04znKvV0ZAwIpFeYR6N7x7+smlwrTJvihQThzelXAbM4sKLPL
         bUo2/bh9a6TGKzQpR0LwN6/XFMEt2YfUfbaWRuY2sZVMW4gjdre9WvLDu1v4cugLPeuF
         uZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=42gRLNcPgojRYVkaUbCfDFWu4gwa3c5NNaZM6qXX/Ss=;
        b=Ahc+zRVOMMzTdb5a7ws9NT16qFd0Y24IMOoSSQ0hFaOCh5hejiVYoCns1hHhVLMK4j
         /5NLvd3VsaSwcmPAsxRDP2Qv4K5uhqhYkr8y3CMi9HGty37IXBxzqGpR5W1n3HPU81N8
         bvVFDZUy9qXQZPs5qg1LU0HCh7wgsvCxekmPT1nUBQMM3MEKimfPVhFM9WUtjc4uNqBh
         LFzRrDj8ADc2KPp543xYyAFVTVGyfFjT8zHDuSdBNQJSshmbbTAiSFYMCVo70T5cI4T2
         Y3vL+HI5rB6KlnnMUhHu8LudSEl8+aeGxjQuQpMi0EHUzVfDCG9Cr3ImQpQ3qRowlsoL
         TPhg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXGH0JPuYdfjiXGYpzMYT019lP8+zg1z3ejvgbK5RmjYJbUTS4d
	fbNh1qkpc8kD8KGD5E9Q2YU=
X-Google-Smtp-Source: APXvYqzmrAl6Lu3i1nYysZNnfT7vy2rR2RBJrMbKsI/dbivYn1AOjv9cgPnx4CeOJguqcWwQbgo1hw==
X-Received: by 2002:a17:906:a302:: with SMTP id j2mr1929854ejz.155.1559199073997;
        Wed, 29 May 2019 23:51:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7807:: with SMTP id u7ls1123572ejm.13.gmail; Wed, 29
 May 2019 23:51:13 -0700 (PDT)
X-Received: by 2002:a17:906:7c42:: with SMTP id g2mr1970406ejp.168.1559199073407;
        Wed, 29 May 2019 23:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559199073; cv=none;
        d=google.com; s=arc-20160816;
        b=MfTzkN/mhE4arU4bs8A04eGK7G+RD+rI+aL5SLJ+K/tsagUwtIODkPe0op14WZX5mv
         Z97b11ZuSx/glbPbNm2pwU/WdTBIdAm8AlHDBTOk8g70ib6KR4hPbL7Fs6PKZFljf06D
         yBE0LyzNQzYz1OVahp8qKORWEj7IHI9EIDy4mqHBUsa07F/D/5ZMQu3Sp6uXfm5cEqnY
         W41V74GmCdYVREY5Rswfs5y8Q1Ie8JeUANZQFhet/BJTfHw/0YhdMgFa/PFlpxnK5QsT
         WjegI/kknpANofVMe37H8ZbMW5NAftT6kDdmpdWjvYOLOWg20vI7FkTxlJxHki3n9tGe
         uChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=/t07ztOXUhbkuzlhTA7JyPAQnqAdGiU6jP9GteN3S0s=;
        b=W8XFq91Za84JOHFVkNKrsEyBEDD9ne9nFNDLnc7emkFzG2TXQn1Ci04wbYIKfjHx4y
         +8n4RM0uAYyOTnbG9rUkonDYJ6csJD+1P8EnzPxvrfEO8s86PPU4OSXB424o+kA2KZ57
         xQP0CPuRSjH6N64SHFpzLea7C5AGoqNk1xKNL3sqzHLVSfdErmCuvJ21lgeyDlx9Znkd
         rF06xgcOxwtiVlMHovf0/mkK76O908J3CRXBs2K03S8zp3Ad+Mytm/h5GeYUiPVLz3Gz
         C9zj/ZVBNOiR1oM/gqa8abkTuMn0pTOXoLzZZKGnaHRegafNBTBsp94a95V6Qjshc51j
         6q3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ikh5PWYY;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id w5si84960edw.1.2019.05.29.23.51.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 23:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Le4Tw-1gpPps3cY0-00ptGg; Thu, 30
 May 2019 08:51:12 +0200
Subject: Re: [PATCH v2 1/6] inmates: x86: rename header.S to header-64.S
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20190521143423.17734-1-ralf.ramsauer@oth-regensburg.de>
 <20190521143423.17734-2-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <6cce0fe1-3b50-3cb1-7eec-a64c6b564d79@web.de>
Date: Thu, 30 May 2019 08:51:12 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190521143423.17734-2-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:qAsocClMZ3zdGML4O40EsqXSMU5/Yr62MntxfM9x7pAR3R4JbuZ
 TnzYreerjeFRw5LJRTxUBVvGTIeJEoABH4FTR5fwKapxLbSA8RtnK8PUim2vKXi72OESjTL
 Er+KuHzkaKQZymiBVv9bH7ygx/7EaIuwje6gbMoJYBdVRWOWDQne08kX2KSFpr38dUcsSrV
 oA1ghVTh74miFderaTkvQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZbChVopvgQ8=:v83CNkUg29g73fq5igphWt
 Jaxk9jrvJu9lAtTxnjRwjDambHbz5VwLBSKlxu/VmeaPtjj4TIAVxEHqAk8UwN2rzjeureN+w
 97T/fBHAzNqfDmClgbScxnPi75o0n92BsLyHwnrXoBlWVKS3SK3gAAujDeJKen/jjHTW5P4zg
 Iy3xQKYXfvlre5Kavpbj84szPK+/hgR0IpGJAb96U4Ud8przjeXTPp6c+RBNmbuPLl8l3pZMC
 k2H8mTQ/mNi+r6rsQLMe78cCgahY76KnHNMfTk8pHEwm5xjsbtXiOa1cnrJ3PAPaKLmCJt1Pl
 b+YzRFaTSNxFubaE6JyKkD5cZBrNC0bnxbOlQCS+VaWoUWcFrIkMhY8lGobpPhZjgS6PIUHvm
 dmdKZWT+mMNgmSzPS1mC8bGQkggCVSeYHuSCcdhxzduMmzzW3PNWsIE+H4tKxkIFdCcKqt1l2
 A5xKRxBB16LmrZnVqZDSGS+kcBkfyMxWII+NgMVFvwEuheIhfx/y8owkQ3SyJby/6vdR9v2Am
 lqRdF2OoyZb0yCyHKbtFuUBrk0Jl2nokszUSs48316dIlHFqRUPWpLkds6S2Qqrr56Msar1gL
 ftjg4YSl0bPEjMVrbqZpw3Fp1zoFaeCv+n1LuzGTXd2qP8jQuwCalAbd43Xvf6qxxzBM0jbUG
 zJMOgXvS0NEhsYYyt7vu9RJ8077yC86UHIHs3XC1zMGrg72PkeqQ0ST6Abo+mDRgChYgY8zz8
 rwmRhkPalRMYgZWyBoq1cmzUGbVyRMcWdjzTopB4UGuxMs/hAJTriw2mMyVKvw2VK6dyGZAWO
 owLTZBKu5gBHRxFVdVWuKFW1GK4dajKQAP0RKW49rsM50XLD8Y76pMpkeEfcZMeQUh2NNiwyW
 6APsOqsv6mzu256Ql/GNqXYcWtxvPS2Coy2m2bEXvPOUUOFLKbyqU/hHd3LWr4RZuOr0YU7VH
 9WYrZjqsNThlX4QnrWPkamYJyrRhihvyKa1nJgm/z9sHmPdlVBb7Q
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=ikh5PWYY;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 21.05.19 16:34, Ralf Ramsauer wrote:
> The 32-bit header is called header-32.S, so let's name the 64-bit header
> header-64.S.
>
> With this, we can also simplify and tune the Makefile a bit. This makes
> life easier, if we later add further 32/64-bit specific targets.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   inmates/lib/x86/Makefile                  | 14 +++++++-------
>   inmates/lib/x86/{header.S => header-64.S} |  0
>   2 files changed, 7 insertions(+), 7 deletions(-)
>   rename inmates/lib/x86/{header.S => header-64.S} (100%)
>
> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
> index 97a37341..bae59025 100644
> --- a/inmates/lib/x86/Makefile
> +++ b/inmates/lib/x86/Makefile
> @@ -40,24 +40,24 @@ include $(INMATES_LIB)/Makefile.lib
>
>   always := lib.a lib32.a
>
> -TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o
> +TARGETS := ioapic.o printk.o setup.o smp.o uart.o
>   TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
>   TARGETS += ../uart-8250.o ../printk.o
> -TARGETS_64_ONLY := int.o mem.o pci.o timing.o
> +TARGETS_32_ONLY := header-32.o
> +TARGETS_64_ONLY := int.o mem.o pci.o timing.o header-64.o
>
>   lib-y := $(TARGETS) $(TARGETS_64_ONLY)
> -
> -lib32-y := $(addprefix $(obj)/,$(TARGETS:.o=-32.o))
> +lib32-y := $(TARGETS:.o=-32.o) $(TARGETS_32_ONLY)
>
>   quiet_cmd_link_archive32 = AR      $@
> -cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $(lib32-y)
> +cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $^
>
> -$(obj)/lib32.a: $(lib32-y)
> +$(obj)/lib32.a: $(addprefix $(obj)/,$(lib32-y))
>   	$(call if_changed,link_archive32)
>
> -AFLAGS_header-32.o := -m32
>   targets += header-32.o
>
> +$(obj)/%-32.o: a_flags += -m32
>   $(obj)/%-32.o: c_flags += -m32
>   $(obj)/%-32.o: $(src)/%.c
>   	$(call if_changed_rule,cc_o_c)
> diff --git a/inmates/lib/x86/header.S b/inmates/lib/x86/header-64.S
> similarity index 100%
> rename from inmates/lib/x86/header.S
> rename to inmates/lib/x86/header-64.S
>

Not based on next.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6cce0fe1-3b50-3cb1-7eec-a64c6b564d79%40web.de.
For more options, visit https://groups.google.com/d/optout.
