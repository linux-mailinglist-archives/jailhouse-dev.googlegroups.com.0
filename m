Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBXWD7HTQKGQESC6565A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7833A3B691
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 15:57:51 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id o127sf1293446wmo.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 06:57:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560175071; cv=pass;
        d=google.com; s=arc-20160816;
        b=skw7pB3gZLOLku2+ch6kSNOXmnAVOD8GDkzK9JyRWAQGyWT5SFx8MQ7UBX3xJl02WS
         MDD+xsFVcIyTTLPhnjjLpuZozBw8Yt63kEv3iRlMgQn3rc7WtIOtWMV05ZCIhtRH4dE8
         +Pb/Zspn5kAZMMBMpxbaBNPeL3aAAqsvb5a5j3r8B8Fv4w4R3iK3kKP04f5YxOPXB5u0
         Lp1prs3Pd+HsIprBjCCfdD4LS+a+uBG/wFks4pjyryRSqRIWI6KwMvyJ9T36yoULFzlA
         4O/zffNTAhIo2qNxhkHptbFW1OP4MLajXevJ8rN/O6WJvjm48IQx97JpCkyC4tWITEOW
         qOQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=EyTP6IjgqBriLLGKo9aFHAu7jML6JhfABeLzD3LyggA=;
        b=zDcpEBCntdMZnqEnbeR2OKcWhB4KWcmwIrXFYKRk9YG3aZStz0Jb237MQ+qDq8b88M
         SBldsrLpwWEzMQKhssKBfg4vInVB6Bm2UStOL/0qb5PpFSn1QMAVz+j9KKnmwJ4k9vDU
         ct0JdTt+laP7vGRCV/ayx9JA6b4l9tP2cvMVD0EGYMSzLTWjxIuUo1l056Ke6hYAIl5r
         gJ5FJ6CpAt7kIpeTPuCXI4EYgRna7gW6eEyFMAImwsF9/BQWpPoBmgyyVctYbWGwG5Y/
         H4vNRpArPzpCUq60VHzzjMoxLSARCSoDwGc9X6Ff5qKfBV6VtGTkYYvpFzDYgGDkThXB
         AuaA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=FxzY22iF;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EyTP6IjgqBriLLGKo9aFHAu7jML6JhfABeLzD3LyggA=;
        b=ft5WVzcEcMmwynxXK3UKHtTk6jh2exZ7uSDC2CPzE6QjoJwY+ovkECiCmwB6MzEXKW
         PU1zezo1xdNQT+AAjbtLZlVH9hfF2S9V/yKrdqjjUk+qmlAtLDbkzYBULF5HOucUzXAM
         QfoiSs3N09xOUq0A7kWyWTIpbCAuT3UGoTxcKFi/cEWdvFIs86HDqCJ8Ipg9owevxwyW
         SfIyT9M/eZFSCSpbmyFOAs6AVOiYcySCMhRJaCEdc/V4p3CBKt2VaQAZKzL/nQrRR6As
         UGCkF/L/LsQ/U6RCqhOGwPX2S9O3/x24WXWdIA82iN9YW4F0025N+kO9vZKBvsH1gIjP
         Q1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=EyTP6IjgqBriLLGKo9aFHAu7jML6JhfABeLzD3LyggA=;
        b=nHFXbwxbqXG+I06wQUevD7KihFq6pUnMr3aqM+LtAsdMu5bPeIotqKM/3myV8cbpnD
         sRYFwcqTAe3HT8lsm4z0jPd33VSrga9bgPTm8H2G9FlmU4DTtVW/Sonwm7zLB5m4/EF0
         pls2G24BSCzHeVtTH5QuWLqDzTxsUNmJ9FumX3JS8DuHTgA7aD6F/cmvQxXwVFQHqDzJ
         67gE0TwUUDh/yan8XK/hzvzYjL1wNlt+TQ7Ano96+UroosT9iGathUw36sQ/9RPFyFAC
         uQY+mbBxsKiODd7MkEAS+4at1Q3OUSkhYj6drrXLgKaHE8FP8tzEC9AqsnCRA/AFwYXo
         DSIA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU+z+hjx0XzHDwtOfQRMYdz4JMhMD8+K5l4CwKrs7WKDg/eMMVG
	YQgM+9xGAcu7S4KtwXouQoE=
X-Google-Smtp-Source: APXvYqzSFNLST+c/NfZUyvxrVK4L1olrmuR32nkiy5ygywjnToxF44vvSNlEx4wRFNy9YWo0H071Cw==
X-Received: by 2002:adf:c654:: with SMTP id u20mr19896080wrg.271.1560175071180;
        Mon, 10 Jun 2019 06:57:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2d11:: with SMTP id t17ls1133253wmt.0.gmail; Mon, 10 Jun
 2019 06:57:50 -0700 (PDT)
X-Received: by 2002:a7b:c7d8:: with SMTP id z24mr13849041wmk.10.1560175070508;
        Mon, 10 Jun 2019 06:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560175070; cv=none;
        d=google.com; s=arc-20160816;
        b=YKeaQunnFge+U7Q9jg5Dv8jnFCuM6h1ZO9MXNdq2JmWJmiv3anfbvxsBqOQyEVhHe3
         4RgcGfNhCAfY4Ze1329Qb+WPS6JZHQnpwyXMia1oOmITt11MFjxN2u+xyY06BUpCfJa8
         HGsNfH/Nj0P5TAlq5hW0dIgJQ3EClUFcrpWHRV2B+JYJy49Asgls0/iTnyTXvlwP69ok
         ly5KScsCHTwhOrJeYDFQgs8YAPbjGNLL1QUvwUMcN9bT5y7/WuxC7g5jxM70K/uH3w1F
         2/oRY6pbhBFuZel7Sv3+pWFdo3vpjvUoaP9ihp7GQkD8t+wOElRqBrq9PJdaMBYH/9Nb
         7r+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=1VJnEMMT8ahfn1EFaysC02j7W5ReqFmRJaRoT9faIMs=;
        b=hNtKMpVdb+CvYZ7qe15RlNx+dHHc4I62UGKwDzrjq7kQ1kQRyb2fYrGQoE1yviwZbp
         bChPhipD/pNakC5sZj/NrPLdziDxqPE77WUTs2KZXbUUTSOjvLMm+49953FZwAPeLcp/
         nMmyvGdbpKdfhfw3Nm76FVKXgp3ambq7G8+ZRuIGSK68jRzSHy996rlossdmBgMpR86Y
         Wph4ekvZf0Pc7247jINJttQRPGqgSo+sDHgHPHylAbrOpyFt/UfvwkkqyaERCakiH47d
         XgnVc00GjB+LDUJTiaCDWQIl9gsDinDJ2oO33LJ6xQMgmQYvBi7MzYUACltA6Byund6Q
         x0tQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=FxzY22iF;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id l19si454550wmc.1.2019.06.10.06.57.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 06:57:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.2.196] ([188.96.0.15]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MdI5T-1hIOPl0IOh-00IX3Y; Mon, 10
 Jun 2019 15:57:50 +0200
Subject: Re: [PATCH] inmates: x86: mmio: fix data width of test
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Henning Schild <henning.schild@siemens.com>
References: <20190607143825.26120-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <72bdf261-6a37-fb29-abff-3f7343d87aad@web.de>
Date: Mon, 10 Jun 2019 15:57:49 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190607143825.26120-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:dZvWPpCa1qS3ihcJAljUCMaCr5hPMj22IU912OH5ApT7CVfRodz
 Kdo3VXoB3zob12FBY3xiiiw+aycrhNaueoVqCMY+Ys7fiRDAeTgxqayj4fDavp87b7WkSt9
 fvUvUudc0KCgm/0uLtqRd5cV6FSiBRJAfiGUcYUFy3zw1k/Kll+qzqjAAanZ2Fmo8RtJGyL
 slu4U7eK3Bgxjti2kErzQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+RurqyARzNM=:HH2QM69slkrSk66Zp9mqrp
 fXeBDcdOXTHu6vjbiEgQOeGzk7PRV9fpcdNAs556F4JN2bDQ8nF1ZGV/BNUdIUrI4m0qDbaQC
 ztKqEYY0ETmz73RUQpkaJ18JgtCoC/Hmt68RX7CygsSoTF1ps9G/yUjGCiPh6RZ2GV3/rIa0l
 sZLlA6bPSJUgCLJIPaBdQirf8QNzKLdxKQFovOGxrlgMl67MjlATke80luYXazwZMArA7wxuY
 Ztno/DwBsaR5JJGc6z/S7n4VTqMIihhc7lq4r43tUENlVratDyRcqPE/F8umKuFF1NH/udTxI
 4S9jE96XlyOclWSxZAlA4nqEllTBRNGBBi+6rX8ZeX7CR0sMXOpGpcm1KANHhy3HbMzGPX7zs
 FDcSVWNbA4/GesbhHUtseUB9dUQ2a70IJGTM37VaC4gMbqBGFzLB7/QYyE/+42wzSSAl0ruz1
 KsO1oxhJrGZ8BAR93sO/YQsKg/pMXBfJRxvBXSMOlg2ogmN9xA7tGu/TZbo7UPVNQfnJz0oyW
 6GwuJEfWabzmk+T2Jpr4ps/TkblzSA2wEdADU7m29bKAPDZxadLcQcMBYoSMSxT0Xx4CahPs5
 SyfPJZHH8DtaemoQbFVmNQEul7csCli4OMnk7I14qQet4z75pBwS0GLcXelzshNpUsxrz/spx
 L8KUeBr9wlpsWnoJNNoxvjM4gVg205HJjSFkDLXmpMTxOCofdv0J/EY+j8hxmbvJFUioxQKEX
 GGLYC+tcZA6i11m7g0gY7M6fs3vXOHHUu0GkqlXm7hOD3xGaDC8IQ4aZR0leTX3Ujy/4G5Ckb
 b3T9KzBswU6qBFxj1JqIQpcRLe9PBBKJqfmZwzhBQCigIWjCk+h51A1JP1Goa9K8AXqHxecoW
 Gc0uOD0ng0FmKh1FfK8gzPYfaxfWutDLSg9+3Ow5BgnuMk3msuTnAItAW/bFPaKt4yWgtk7dy
 yCuKKaJJJHd9p3Nr39sjoK4H8iC5/TDV3kH8tGRO8q/VBc7AaNqtc
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=FxzY22iF;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
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

On 07.06.19 16:38, Ralf Ramsauer wrote:
> The sequence 67 48 a1 f8 1f 10 00 is "addr32 mov 0x101ff8, %rax".
>
> In fact, data is accessed 64-bit wide, and not 32-bit wide as the
> comment stated, and as the comparison expected.
>
> 0x67 only restricts the absolute address operand, and not the data
> width.
>
> Let's also use the mnemonic instead of the binary representation.
>
> Cc: Henning Schild <henning.schild@siemens.com>
> Fixes: 23f745cbe19089d ("x86: mmio: Skip over address size prefix found in x32 code")
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>
> Puh, I hope that this is it with the MMIO stuff...
>
>   inmates/tests/x86/mmio-access.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/inmates/tests/x86/mmio-access.c b/inmates/tests/x86/mmio-access.c
> index 3af0db9b..a17455b0 100644
> --- a/inmates/tests/x86/mmio-access.c
> +++ b/inmates/tests/x86/mmio-access.c
> @@ -110,10 +110,10 @@ void inmate_main(void)
>   	EXPECT_EQUAL(reg64, (u32)pattern);
>
>   	reg64 = 0ULL;
> -	/* MEM_TO_AX (a1), 32-bit data, 32-bit address */
> -	asm volatile(".byte 0x67, 0x48, 0xa1, 0xf8, 0x1f, 0x10, 0x00"
> +	/* MEM_TO_AX (a1), 64-bit data, 32-bit address, AD SZ override prefix */
> +	asm volatile("addr32 mov 0x101ff8, %%rax"
>   		: "=a" (reg64) : "a" (0));
> -	EXPECT_EQUAL((u32)reg64, (u32)pattern);
> +	EXPECT_EQUAL(reg64, pattern);
>
>   	printk("MMIO read test %s\n\n", all_passed ? "passed" : "FAILED");
>
>

Thanks, applied to next.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/72bdf261-6a37-fb29-abff-3f7343d87aad%40web.de.
For more options, visit https://groups.google.com/d/optout.
