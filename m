Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBBOU37TAKGQE6ATJ2AA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D4A1AB7C
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 11:40:21 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id l13sf6937673wrw.10
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 02:40:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557654021; cv=pass;
        d=google.com; s=arc-20160816;
        b=IOBCbG3YS9k/Q858wj+JALbb+qLgRK6CEuQNEEYiw1GGQfs1p8Ku2HAzenzJf/leT8
         VG9Me4GMHOmD+cVdG131h1t0GeyNeBbiUwiDrGAQY2tpKrk/9b4wu5vjG3rOj2At1C1f
         KFPQxFWBQNyMIj+APITnZB2nOmRRb0j+Soqjot38c1JM7A1xfE6sgwDzNH4iLA6svJJK
         e5YiiAK3IVFSFd7v2fYNFKqifAyR4kPG+zgcNJYgNTax9oktwrWA0HhUf+NuLOO3Ly5i
         SKSYWbrRq/lFzlB/1dyWoaw8udpVb/LB/nEeOBD6S1OJk4a15vE1wauBi0XMPtawYClG
         4miQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=FyxnqgGCZSzzZWED+t6y+2ImnEem3Aj82RgjfnYmKdI=;
        b=rz4eIgrpYbU+PoM+NTmauAokHl2fCnqBH+cLsj/jjQyhGfhHaikae+ESBTZIDiZZAk
         XgTK2FhsuolQ/EPYpp17zWjhBiA781FHVAW3alPjrEZxfWrNSQZ4GFkK9Kr8kptcRUZx
         NsjdONKdDYjahUJABBVYdkFvzVAzmnC/QvpgYC+P1LdoAkru7IP4Qxt37y/AxCBk3XT2
         9RlrOCgxDgcqnD/IGhV2S0+HlfEgJ1r/uQoWDB5EgXh12Dq5bIi6bdY0gEqdOzahS+mC
         hEuFEA3W1fJMifgo9mkCNRhwS0LlbUquEdijt2sMQ9MbNTJVoktaaMaZgj3sjNlo1Wly
         ZJJA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=J6o6WCDx;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FyxnqgGCZSzzZWED+t6y+2ImnEem3Aj82RgjfnYmKdI=;
        b=rGaoa20E6AOqiLorGkLLzrF/UibPJPHo9QoT2zikca3wkStfAOBsgm82lJAizGJtYo
         qFMmaDf1Lk1MRT2sf8yHSqnVOQrl90b1Hnh0oCjHYbmwaDNTBZW9SQdofIYLgDkI6v8K
         U2uir0S8XCHNEmUzf2JZkGNbxquiuD/9qas8w8onD7jv6SlxyTaJZzF78ZCXpqPPnIlE
         Z8ptApQDN+C7mCgTc/D17oX9DWHtYHaZ+io0NidiZD5qpB2kZPENPT3pK9Zws6iAED98
         f1v72A0Pki5xvhWQbSm2FRxF7HYOT0AAQeU4NeIgBCtmZre5e3AfOi2+/qNSvvUIAy8V
         2SoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=FyxnqgGCZSzzZWED+t6y+2ImnEem3Aj82RgjfnYmKdI=;
        b=jtv2JLrcHZm7qlpaRgm74PsTaGCYKjsJCdP3rSS7CDSs8KIHa8cwHaCRHAf8Eu2dCa
         8daA/7mZ93BTfr6L7/EFwNVoRlv1cOSXnCzRg9mKY/nXwyN7+bydYtOA3mWiGL1j2O/R
         bN8gC5/uqxhyRIcNIAYEHpkNXDOpvVD20WLJnRF2ZpJ+yUJU3nI5n5AtHSdPD5dWBO28
         e1Ln/NMA5XFRIlD6OhhPByh6gRUw4zBI/4+UQgCtYhHxj8lAe7nlCAlVpIbI3JCiE/eb
         AbEbiJgG/F+zDHT2MSgy0wVsLRniOL1ubO50PGSTZSQgZlG3fEsO8/6Vqc5au+wnXwnD
         lO3Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUXMebcX9txjo4MKqgKdb7Ysb52yOzGy0cI1w7DQn8xBRZd2sfO
	nmpmFfEQQLdXDKeS0ucKWOQ=
X-Google-Smtp-Source: APXvYqzkczFW5yoOop9I9b8oxU4nTyvrksU7rnqQnEbgMerG8aYALoZTEYxAZPaEk0aATGaaD6zwUQ==
X-Received: by 2002:a7b:c0d1:: with SMTP id s17mr11771241wmh.124.1557654021347;
        Sun, 12 May 2019 02:40:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6b10:: with SMTP id v16ls2396885wrw.11.gmail; Sun, 12
 May 2019 02:40:20 -0700 (PDT)
X-Received: by 2002:a5d:6710:: with SMTP id o16mr10923063wru.173.1557654020877;
        Sun, 12 May 2019 02:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557654020; cv=none;
        d=google.com; s=arc-20160816;
        b=hQkx+nLEZ5zpYphbzjbXqHhl5wacfCK0c47MctQN/3IBzhLk71gJt91e0TbOSHzLZ/
         hyi02B6mfC/z6J23FOoT2lev684cNIktvKIlgqZFq+TGIJvEpKsylGtAZbNuZqZVEMMn
         W05ZEvXafzh+xuMi9tYUbFJ5Gxln0bAfa6etAMf3gjS1Pc8c3VXYfNb950vvpfdvcBqn
         6uJi0KpodTaKzUticS5ObmxY0UL5UKYP0RsXD4mBClqT7jOBLwddIrGzqzB7/B1yoNE9
         ovQEz/xv8H3Byfi46jD0FDp4lQmbr7s+yTZfn4o5UutSMePZETth0xgXq5dOroJdU4++
         ERnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=htCUJ0WCpXrW0X5S97TC8ZwvX9D1dS+4mELqA2bx7aM=;
        b=OgHvuJNDKQCc+6jQbBJl5fST2Zl28pDGShety9JU+RRCMkSjpDzXf35wrgAIa9qFbe
         WfAqBvuc8sikJYQbjMbI++zFSMzNNvZk24MbAosTwMR0KBrWTe3fYfSQqZWjOk88cFSK
         4GFa+kPq1iTiTJouBm6TE9ys8+Cm6mmE2vuGKdT1upGvrlhMrB2mtKN7ix0NLlckrtps
         4FJ9WbgkWsb2Y4whUV7tX0J9xsDY/IolCtmFi9YdXYeojQD4vLbUUBDywyRJ9NWXvoQJ
         iRidIYrax6HRJ+7me7+7UrH/my84IYkzrqvdUz8tre6hHqR30LyOxAuNzn7xUIPgQy9b
         zYXw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=J6o6WCDx;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id p18si505564wmh.1.2019.05.12.02.40.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 02:40:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MW6Ib-1hEOCL0gmn-00XOSz; Sun, 12
 May 2019 11:40:20 +0200
Subject: Re: [RFC PATCH 2/4] inmates: x86: rename header.S to header-64.S
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190509210726.23168-1-ralf.ramsauer@oth-regensburg.de>
 <20190509210726.23168-3-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <6dce94fa-4db4-1947-efa7-644c7e3fdcf9@web.de>
Date: Sun, 12 May 2019 11:40:19 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190509210726.23168-3-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:zbeaR4mu0ZDy21Lr3maI3mHJ7xchohN1hWyL3BZqIAbjcTaN0BS
 zRqBPoglEw3ZEdXfS4ThUM2qTbpfgawYIpNXHjSYX77jNAzDGjfHqKkFsOphMTbK5hmnAr3
 A8d+m3VPv687Yulv3qoyd64AEpVIZVKmYJhSTgpm16nAotImt8PNo15qrgiUBcrWcvZTh+G
 Ao+FiYqrw2/TVwU4eHEwA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:a5LCrzLQ+JM=:4KCoZrgqWorFV1nNfr2SVH
 JTid8KwFl0ogyDjNJc/OmVtU2ZqNM8/IluA5jj3cXhvkzpIC3jLpvxAI0L+FAA+Pkg+DoTYQE
 CRcvaDr1fERqGdVntouluImhypCxlsGDm6BcJfpZjEC1rQLWF3GDACsVq1ewCOgyZ5uKIvKZA
 cAvaMR5rhxCFewEtKrFwi8Xp+4w01guMCviD4AFuOBgvnyarubiZvbA9/L/eV2Tmxw68We5G9
 GXk9ZXpwRGIIU0UWCuS62E6u84XEVBIuMXpL3r5Fp9cFcImRAhI+v1IlogLeVfwnf8IY3huO3
 VvUgrO9bGmC2r+sBh2wwNZdEgqLlQV+SDibhLJQvU8DAWiSTuUAAhp/j81utng/S2wRIcpksD
 xlJgkSx3nyH7cW4UPZryhtiE0HMrkR+JoRehNKgDdXyYuyVD3IrnU1VhlADYTpxLuezaG/bSc
 bdeoe1bETaYdRMC/5AJ7JmlDarJ8QdZsVHJIXJI0+FwL6vbeHJ81UOwNmyn4ZJA3FW7one35Z
 qdTIYPs+JV0YjtBmVn/Ryqeb7V+AArub9KnuHpfWYZ0qWTC7yOkf3P1foNiIWqgmsttUMnk3G
 s1NMfocvDMlvbUjQHbTZUodjrWhwbzaX+hK/bw6L5D4pDpc0+2XdqKCIXdn2BuQl52NTylhs1
 QQybhY1E58U6/Uc4lYs8i9nth92NOMbZgD4Pbe+jgna7laAybcXtKtnKG1egVD05lR/5/sRmZ
 q69vQLWoO6S4lXlhltoKLYv0izqPnih5oigBxbDDzhgie6NMW/BOdTIv6ul7U35hhjdYqhdqq
 aVm03ujpWLjzge5Sg3zIYli0uu72HlMiRdNU7J9qlB4KH4LiA/oRi6OwTl4jJJscziH4LM4Dx
 oTMFK1L/sR3TFqYWhqBxwP9sCpMWt4966XPYTZaP7Daznc5/l7uQFSCxiNBl77FAKCmxVmWqK
 m+IK0feNJVw==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=J6o6WCDx;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 09.05.19 23:07, Ralf Ramsauer wrote:
> The 32-bit header is called header-32.S, so let's name the 64-bit header
> header-64.S.
>
> With this, we can also simplify and tune the Makefile a bit. This makes
> life easier, if we later add further 32/64-bit specific targets.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   inmates/lib/x86/Makefile                  | 8 ++++----
>   inmates/lib/x86/{header.S => header-64.S} | 0
>   2 files changed, 4 insertions(+), 4 deletions(-)
>   rename inmates/lib/x86/{header.S => header-64.S} (100%)
>
> diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
> index 97a37341..e4ae6b7e 100644
> --- a/inmates/lib/x86/Makefile
> +++ b/inmates/lib/x86/Makefile
> @@ -40,14 +40,14 @@ include $(INMATES_LIB)/Makefile.lib
>
>   always := lib.a lib32.a
>
> -TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o
> +TARGETS := ioapic.o printk.o setup.o smp.o uart.o
>   TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
>   TARGETS += ../uart-8250.o ../printk.o
>   TARGETS_64_ONLY := int.o mem.o pci.o timing.o
>
> -lib-y := $(TARGETS) $(TARGETS_64_ONLY)
> +lib-y := $(TARGETS) $(TARGETS_64_ONLY) header-64.o
>
> -lib32-y := $(addprefix $(obj)/,$(TARGETS:.o=-32.o))
> +lib32-y := $(addprefix $(obj)/,$(TARGETS:.o=-32.o)) $(obj)/header-32.o
>

Use TARGETS_{32,64}_ONLY here.

And we can clean up further:

  - cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $^
  - push $(addprefix $(obj)...) to $(obj)/lib32.a rule

>   quiet_cmd_link_archive32 = AR      $@
>   cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $(lib32-y)
> @@ -55,9 +55,9 @@ cmd_link_archive32 = rm -f $@; $(AR) rcs$(KBUILD_ARFLAGS) $@ $(lib32-y)
>   $(obj)/lib32.a: $(lib32-y)
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

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6dce94fa-4db4-1947-efa7-644c7e3fdcf9%40web.de.
For more options, visit https://groups.google.com/d/optout.
