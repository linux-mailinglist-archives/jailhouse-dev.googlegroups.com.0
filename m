Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBEFB43WQKGQEWGBJH7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id D2746E9C4D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Oct 2019 14:30:56 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id n15sf610951wmc.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Oct 2019 06:30:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1572442256; cv=pass;
        d=google.com; s=arc-20160816;
        b=ythYpvGKE+uXINLia/5GLTgdO3rIdDSjpFgAjGBmZiHizmC2dPbtNfIjzi2C1txOH0
         rHP2SyFhwCvElmGZTjJ+Ko3IETLzB8HQKGYSCVHVm7CBy7say6zM9fvaRGvRWbpd3VjQ
         scOrDAgxVo2dvTvhktJIjH6VWp2eMmG8lXhYUNDn8qRz+ld6uS4zBsK99nzPVfrUKOLJ
         nina0fRx7SynO3pYN2SeavjGC02FiCBEl1QXwD1CZtDnX6BxNEOi+m2pw33ZBKWpFAd2
         gH6ZJ5yLueuwiNqluHk5Gur1cnozEWTmbzSC2Ai2mLw6sNFbnCCKX7NxJR9BsUz2+sVM
         GgZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:autocrypt:from:to:sender
         :dkim-signature;
        bh=q9VWVr/9wBmmc0by5pcH5k51UzkjrPjFPG9VvHEOrHY=;
        b=YmqQzgFLXMF/MrUx0lSo0RxT9yfrGEDNqspZnJ1ge37uCLDDqEUX5Nhjsn1cQki0g9
         6UwlxTqP3Ek+l0e/1nN1jKsVfMuuU8ANKN3sErkT42ISkwjR0Q51Qm6tjEwrx9+/O9Rp
         8lySygB1KJfQu94I5zZz8gc2oKmBxen2TM3Ub+WykozT839dsaha+qfEw6NIudHdFP41
         IT4MLvkCBFjYJ/xNNSj8qTCgPqt4S/NGVCS0yKN/tQDrC12Rw0sVuiI2JSENedZmuwmo
         +t/BrbRhA/kBmtcOHd6CmxqEkOmV7btltC4UUM7PTx1vRWUAqG14hI+zIHtdKENmazxy
         3pEQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=AoyhJYru;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:autocrypt:subject:message-id:date:user-agent
         :mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=q9VWVr/9wBmmc0by5pcH5k51UzkjrPjFPG9VvHEOrHY=;
        b=S9UPSQ6Pw38VqMsSQuImsK2wnk0n7ztsDOpbSU/mhv5IjbGxRjkPbY7HJQB8k2INZG
         4/wReFAMpg1VkA+4DpN4QM4/ZPPW6II7dXBaGMiZMFErkVDNlHG6JiXFu010UjEqXI9A
         ChGEeK5o9I7Y3cZRrZvacUx5tS1N3mnAmG33wcpfpEvDT/SIsiTvBZThGKIc/QQAsaCp
         fqNnoo57ot6p0OxHnLVVgBWncdz4ptsGwuFf7Co8/YSBnoQXB09vo7Rq7VVcPXHJi66Q
         4jlODSfNrO9XwXoJfFkRl+0N9kYk6e302c6m+9wZ7wMJ02Bq6MW1iTTcYONKC9y8uAJC
         Az/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:autocrypt:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=q9VWVr/9wBmmc0by5pcH5k51UzkjrPjFPG9VvHEOrHY=;
        b=t46MrCHcU7VPb84Hvu/fBOb15+ATwhsZUByqOdUtRnKq7TJqbnwfhTz26EUWkn/OcQ
         VBi1rXokOzxabbR/cFmDKigBc+e1OE11txSY0hfTMylmSc10xQpxQgpB/ACkclH4HRjb
         szgDU5qwNUMxp+FYM5GsnMCCrAeSFU4zClvK6JRd4h3VnDLC/WYjlY8JbWx1TjhemBJt
         8Z/G0KjDbirLngMC7zqQGlKMTmV09ldA4z4qX0KuMbyc7/Dz6dnUYiCWyjS4/klv0LLS
         6y2ONKBg2wedtO5j+LQYAch0UMQxcx4yl+mp6diqf7SJGm1JXMBkSQZzXImQcZm2eCr/
         cqgA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUKUFB30KMKFsKx8Uvda+hmYlmBlm+47FED+a6FPdn7LE5UA3O/
	sVUP9Q6+eZofsw8yIpo5KpM=
X-Google-Smtp-Source: APXvYqx/4/mLg9VcMw3SnIpfS6sQRei+Wt/+1tQC/Vieezf+cgJXM3sF6kiuggmmZlBdXz09x4PMRQ==
X-Received: by 2002:a7b:c924:: with SMTP id h4mr9566762wml.143.1572442256537;
        Wed, 30 Oct 2019 06:30:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c448:: with SMTP id a8ls17402759wrg.0.gmail; Wed, 30 Oct
 2019 06:30:55 -0700 (PDT)
X-Received: by 2002:adf:b199:: with SMTP id q25mr26437606wra.320.1572442255693;
        Wed, 30 Oct 2019 06:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572442255; cv=none;
        d=google.com; s=arc-20160816;
        b=1Jseylt3ZkBQ4JEVYFbwRRGAgf+T9wPud0JBd7drl8bwvWCMCEJZ9/jbVcSlm+c/RB
         4sPYhZ6jkdqhqCVt3M2k8ecmxggWo+xnUlVXW0hhkL7BAKmubxz5rI1ObbXiLc3HR5A7
         0F9GesP85WN73BV7dPWjAL+/yOrSi/lltyDTA4gmPi7Y4Mvc3iXeHtTX5jCPm67sOaNa
         mUo8O7H0QUhn7+Q1fddpjRZ2r0XgmSMGV7WNaNAnuBV74OY5ctwecmK4gs8lLB8G9cP8
         HMP/kHtSXBtxC094pcGR3gdWnpFmdrT5N8stPQbheSAlGuPX09eHDdSeeLrnPWe0EWnx
         Snfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:autocrypt:from:to:dkim-signature;
        bh=xdlOdd3x8wyjAyuG87gpRxOVRtQ0e+0CprSSmDPIWDs=;
        b=PfI8FUymbRZbZ9h9cv6FfjRO1vqCU/2tVfD6eS1CpfbEqn9C9qQF/xLEyHfj/oNmlI
         40xD9rdflH0EE+clJNBXDlD13QownC0DY+KVIsQKyq/yoFntz+U60twJrjNi0E4Z3UHr
         ggCNWgqjHDAx4cNnENxlLWdMUTENvYXzwPe3q0h8G9f7aA1IzKFNKtQN53DbUzFDomce
         XSGap3clsML6VjjUWv+1HJQHgjc+EhwhURldr2qtEll++zNQGqschenHtW3KzS/GQT/V
         aRu2BjLlbC6SqVklWh7z6BhPFohfu2O5bjsoZGYO0tQGxWDYbWBZpHwL9YRRXDm9VUnL
         r7vQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=AoyhJYru;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id x2si12668wrv.1.2019.10.30.06.30.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Oct 2019 06:30:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4738V725MFzyFF;
	Wed, 30 Oct 2019 14:30:55 +0100 (CET)
Received: from [172.20.54.64] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 30 Oct
 2019 14:30:54 +0100
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Backport of patches to jailhouse-enabling
Message-ID: <343b0acd-45a4-0ca6-f6dd-84bee630169b@oth-regensburg.de>
Date: Wed, 30 Oct 2019 14:30:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=AoyhJYru;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi Jan,

could you consider to backport the following Linux patches to the
jailhouse-enabling trees?

8428413b1d14f ("serial: 8250_pci: Implement MSI(-X) support")
on linus/master, and

0935e5f7527cc ("x86/jailhouse: Improve setup data version comparison")
7a56b81c47461 ("x86/jailhouse: Only enable platform UARTs if available")
queued in tip/x86/platform.

Those patches have been accepted upstream, and it would be helpful to
find them in the jailhouse-enabling tree.

Thanks,
  Ralf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/343b0acd-45a4-0ca6-f6dd-84bee630169b%40oth-regensburg.de.
