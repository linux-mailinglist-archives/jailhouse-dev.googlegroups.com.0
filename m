Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCEK3D5AKGQE3DJWGCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id A52BD25F723
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 12:01:46 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id a6sf4019311ljk.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 03:01:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599472906; cv=pass;
        d=google.com; s=arc-20160816;
        b=rz+8BWHOu6B5dRkwCPxdqliSyolDW3MIHWKvJkYUUeQSboxiRBkExbshVq87NZfR8m
         ONQUa/2Ez8BbEb5UR9DSP9Wvn5Y4WE6C6/kMIZohfkb5AeVNq2Mej6zDZbedvJTOAVvh
         juCpdl1aS1wdIpLTnB6cy/HjEyEWFuHGlxwUvtPMXzCPBhQdOmzvRMkD7nNxCp3v3oOP
         3R/DtawqzU5Q29tTfrEuy7AenP9RGg3uzBvqDYny4shxJ7urZgUaHCLxcKzBHVRdZ/yf
         QCKIfGr7CK2BphNfbN+Cq39k9GPDrTYf5gd1UtXX/KK0hmF15X0gJeGoWD7uAI6BJecA
         syyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=nynI+lCijSJIBjAwF20rv6eeWT6VQcmQYQyCFFnVOcE=;
        b=I58vfSFNXS38uQ5oYc36R1FaEwuXcM/EknIkaDiO1rIipfZ7gt3IQl3zJyyL2dStqH
         85fIt7b4eFfdZIEdoHfln6uFAF8CO5gJVNNC1yYAN/HuQmt+lUE3xhAZVJgcGL3uWGMY
         vkvmWtASihwlQQxboqoG6qjss+FSQ3kKe1jHzeZoNpuafSKvnuANTe7e9/g3I/BYCMks
         1hwKLtxDsy3UX4y2jS2TyWPT3/FzG8GwJjPiLM5956HLQYU6CYa6tSId595z7NfCWMga
         2+IzaTk58DSg9Q0/s7UthttIPDGbw6x/V2zYQhAvQRpoEjdCghlajtA9DFwpfzN62OFY
         6nZg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nynI+lCijSJIBjAwF20rv6eeWT6VQcmQYQyCFFnVOcE=;
        b=PaL2VSBv4QmgiBa7A8Edw1Or0yxG5IwDSDPHVBrz+wJTH5rQ4Djkv+Hbvj3iPeMKJX
         yqJYUhoFhwaOE3J9kS1LiMSGNNEB5lzpFjSoYPklBnszIptzcZyAx7hnFR9ZZjre2ajU
         fn5xMxWhd3jPH8ITovzTClpX87/a8DpU7aVXAAVkT3SnOUd7aecBn+uxOmjbB11IVQ2H
         hhzfs+6kEIIMmKDTMfn/IMMZ1EcOPU3PjJwumMbUSNyB0l4lzSzyi12REkqz1zvP3j50
         qGnM86sPwzWnhpBW5CwGElz3rLAc2RD0473qEs8YQSO1JoB2/hqGGf9txRiZMZG4ozP5
         rMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nynI+lCijSJIBjAwF20rv6eeWT6VQcmQYQyCFFnVOcE=;
        b=FUCepGkbwGVSJRlCSp6V1G8N1TjN6fvu+kKKPLrgOcNKvsPA1Ywz6KCBl8XzcyVj/E
         /17xl50yixF7LcipgdpzufxJwu4tGluljk+mHzhOMmW4npvCiSL1I6iMAfSzpQ/vWt3h
         4I0ivWAoIk2JlHXB7MKQIsjPJx4YOnbrqxt/tPSV7mlrhTRKWwKAL04eFJEDxQVHfaVY
         VYJIrjdEnLIFtuccMWHg2ydygfv0vI8HO3ivlnZ9y4f4I6x/hly4eun0Dv6gditTTRs4
         1EaFQQeq3otVO33Nvvh6rJCNb+FswfTx0I6KT9gJZLopjZl7PVdbU1AyRXjBDkm29MHo
         lsyg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532GA6yGnKEXQmdHMmpH3XHDq6CQVgluZGcQjHF49/N3G6I5uCzi
	N6Iu1KIPOVAYUle7krETc9U=
X-Google-Smtp-Source: ABdhPJzENmvroMbBeRdRdtm5sxA5Z7B3M0ri73anIeprrnMFO240tHSE4cNf0hsUYkANOYD6oeUp/A==
X-Received: by 2002:a2e:2a83:: with SMTP id q125mr10431404ljq.242.1599472906179;
        Mon, 07 Sep 2020 03:01:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5c44:: with SMTP id s4ls1620625lfp.3.gmail; Mon, 07 Sep
 2020 03:01:44 -0700 (PDT)
X-Received: by 2002:a19:674f:: with SMTP id e15mr2913069lfj.50.1599472904199;
        Mon, 07 Sep 2020 03:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599472904; cv=none;
        d=google.com; s=arc-20160816;
        b=g+XtyrwphFhkFN5rfGDsqKHw8U5+S/KEmFzpOrdPZBxKZoHf3V4Mey45nA9zD5qLVw
         8vRIHaOvlBhKhTIX6mHY81Jpqu+Yw6fYY+ITJUVrqXEb4C5UL/7TdZfRQw2W6f3xLGad
         pak+Kv5f6/mxI2aTcMzDp1zfh04nw72Z00r+plcTMjPs4mIAa68+2dga48Wd1FSh3ybR
         F+crWNjD5mkFf8RcSYONjsrIpJyoBItBBWd80XSZleCZ5PiI/Cl4x8UJtxfBBFKfEL4a
         BZmxrrsRWwgNug+WmklGb2GYGkcqnLRqutKihWAVj8n7cXuvb+cceeTSpqTXdYTdnHFR
         ga4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=XOjuUPgArqxqDE1pf5F9Xh6UnObC68FkssI/CpcZzZ4=;
        b=w1b8bD7DD/w/dYwPYAbFCzAwDWEJhSubcrv41h+l0BfSNlrolQeLpYj0sAIB5iKPGf
         n3xXRlGhlspZiPiSxeSyBbY5lDqyfskC98YSEu6aQEOr+iFPZMHZViomdmFuWpnawxTk
         TQkS+QrL6Ias1FvWhpIBmd3vJRPiPGgntGHGoILc1XuAXB/hMKsi8ryb0lEYWQcBO/rO
         sRbJ17nQC6cvqFxHNtExDAlv4dvC6vbeKPLZIQvl02cpp+0PK+yPe238phi9V6FnQR0W
         4mKVUwh26y/bVig79vwg1DFWkE+7jEIWH/lYtOkzGxuevU+S0YhvG+IpoKMHP+/xIIAu
         kBmg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id z6si418515ljz.8.2020.09.07.03.01.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:01:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 087A1guA008562
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Sep 2020 12:01:42 +0200
Received: from [167.87.17.27] ([167.87.17.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 087A1fGF000784;
	Mon, 7 Sep 2020 12:01:42 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de>
 <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
 <716a1db0-3392-40d6-a6ac-051ca2a52ce7n@googlegroups.com>
 <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
 <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com>
 <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com>
 <6aaac5b2-1c88-699a-6568-0642e4a1a4a7@siemens.com>
 <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
 <dd5c252f-516e-3758-917f-a0cd5ca0f4c4@siemens.com>
 <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
 <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com>
 <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
 <b501a3d0-70cd-2126-8fa0-fff217caa20c@siemens.com>
 <6765e219-706a-4124-9ac2-d40109d69f7cn@googlegroups.com>
 <2924a8c6-5b7f-427a-846e-9fc0e64bad53n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
Date: Mon, 7 Sep 2020 12:01:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <2924a8c6-5b7f-427a-846e-9fc0e64bad53n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
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

On 07.09.20 11:23, Jan-Marc Stranz wrote:
> I've build a Linux kernel with CONFIG_STRICT_DEVMEM and
> CONFIG_IO_STRICT_DEVMEM deactivate, but the hardware check still not works.
> From now I'll ignore the hardware check.
> 
> I've tried to create the configuration for the root cell on the
> targetwith " jailhouse config create sysconfig.c" without success.
> I get an error message "This script requires the mako library to run".
> 
> My root-fs contains "python3-mako", but "python" ist still "python 2.7.18".
> What version of python is the script unsing?
> 

Distro default. Likely still python2.

> In my image recipe I can't add the package "python-mako" because is is
> already provided by package "python3-mako".
> How do I get out of this dilemma again?

Try "python2-mako"? Or use a distro that does not have such problems:

SUSE:
python3-Mako-1.0.7-lp152.3.3.noarch
python2-Mako-1.0.7-lp152.3.3.noarch

Debian:
ii  python-mako     1.0.7+ds1-1  all          fast and lightweight templating for the Python platform
ii  python3-mako    1.0.7+ds1-1  all          fast and lightweight templating for the Python 3 platform

As a workaround, you may also write

#!/usr/bin/env python3

into tools/jailhouse-config-create.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6ab98ec9-0255-830c-589d-781da3bd2838%40siemens.com.
